#!/usr/bin/env python3

try:
    import os
    from appium import webdriver
    from appium.webdriver.appium_service import AppiumService
    from appium.webdriver.common.appiumby import AppiumBy
    from appium.webdriver.common.touch_action import TouchAction
    from appium.webdriver.webelement import WebElement
    from selenium.webdriver.support import expected_conditions as ec
    from selenium.webdriver.support.ui import WebDriverWait
    from selenium.common.exceptions import NoSuchElementException, TimeoutException, NoSuchWindowException

    from corelib import Logger, Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise

BY_MAP = {
    'id': AppiumBy.ID,
    'xpath': AppiumBy.XPATH,
    'name': AppiumBy.NAME,
    'class': AppiumBy.CLASS_NAME,
    'a11y_id': AppiumBy.ACCESSIBILITY_ID,  # deprecated
    'image': AppiumBy.IMAGE,  # deprecated
    'custom': AppiumBy.CUSTOM,  # deprecated
    'nsp': AppiumBy.IOS_PREDICATE,
    'ios': AppiumBy.IOS_UIAUTOMATION,
    'chain': AppiumBy.IOS_CLASS_CHAIN,
    'android': AppiumBy.ANDROID_UIAUTOMATOR,
}


class MobileAppHandler:

    ROBOT_LIBRARY_SCOPE = 'SUITE'
    # NOTE: locator format <attr>:<value> with <attr> is a By object, for example id:sign-in, name:logout
    DEFAULT_IMPLICIT_TIMEOUT = 6
    DEFAULT_EXPLICIT_TIMEOUT = 6

    def __init__(self, desired_caps, command_executor='http://127.0.0.1:4723/wd/hub',
                 implicit_timeout=DEFAULT_IMPLICIT_TIMEOUT):
        self.logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')
        self.command_executor = command_executor
        if isinstance(desired_caps, dict):
            self.desired_caps = desired_caps
        else:  # str -> config file
            self.desired_caps = Utils.read_config_file(desired_caps)
        self.implicit_timeout = implicit_timeout
        self.device_os = self.desired_caps.get('platformName').lower()
        self.driver = None

    def start_app(self):
        self.logger.info('Start app')
        self.driver = webdriver.Remote(command_executor=self.command_executor, desired_capabilities=self.desired_caps)
        self.set_implicit_wait(timeout=self.implicit_timeout)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.quit_all()

    def quit_all(self, *app_ids):
        try:
            if app_ids:
                for app_id in app_ids:
                    self.logger.info(f'To terminate app: {app_id}')
                    self.driver.terminate_app(app_id)
        finally:
            self.logger.info('Quit apps and terminate driver')
            self.driver.quit()

    def get_device_node(self):
        return self

    @property
    def session(self):
        return self.driver.session

    @property
    def all_sessions(self):
        return self.driver.all_sessions

    def install_app(self, app_path, **options):
        """
        Install the application found at `app_path` on the device
        :param app_path: (str) the local or remote path to the application to install
        :param options: (dict) more options
        :return: None
        """
        self.driver.install_app(app_path, **options)

    def is_app_installed(self, bundle_id):
        """
        Check whether the application specified by `bundle_id` is installed on the device
        :param bundle_id: (str) the id of the application to query
        :return: (bool)
        """
        return self.driver.is_app_installed(bundle_id)

    def background_app(self, seconds):
        """
        Put the application in the background on the device for a certain duration
        :param seconds: (int) the duration for the application to remain in the background
        :return: None
        """
        self.driver.background_app(seconds)

    def remove_app(self, app_id, **options):
        """
        Remove the specified application from the device
        :param app_id: (str) the application id to be removed
        :param options: (dict) more options
        :return: None
        """
        self.driver.remove_app(app_id, **options)

    def activate_app(self, app_id):
        """
        Activate the application if it is not running
        :param app_id: (str) the application id to be activated
        :return: None
        """
        self.driver.activate_app(app_id)

    def terminate_app(self, app_id, **options):
        """
        Terminate the application if it is running
        :param app_id: (str) the application id to be terminated
        :param options: (dict) more options
        :return: None
        """
        self.driver.terminate_app(app_id, **options)

    def get_app_state(self, app_id):
        """
        Query the state of the application
        :param app_id: (str) the application id to be queried
        :return: (int) One of possible application state constants:
            - 0: not installed
            - 1: not running
            - 2: running in background or suspended.
            - 3: running in background
            - 4: running in foreground
        """
        return self.driver.query_app_state(app_id)

    def get_app_strings(self, language, string_file):
        """
        The application strings from the device for the specified language
        :param language: (str) strings language code
        :param string_file: (str) the name of the string file to query
        :return: (dict) The key is string id and the value is the content
        """
        return self.driver.app_strings(language, string_file)

    # Android only
    def end_test_coverage(self, intent, path):
        """
        For Android only
        End the coverage collection and pull the coverage.ec file from the device
        :param intent: (str) description of operation to be performed
        :param path: (str) path to coverage.ec file to be pulled from the device
        :return: None
        """
        self.driver.end_test_coverage(intent, path)

    def switch_to_context(self, context):
        """
        Set the context for the current session
        :param context: (str) The name of the context to switch to
        :return: None
        """
        self.driver.switch_to.context(context)

    def get_element(self, locator):
        """
        Get an element
        :param locator: (str) locator format
        :return: (Element object) the element
        """
        by, value = Utils.parse_key_value(locator)
        try:
            element = self.driver.find_element(by=BY_MAP[by], value=value)
            self.logger.info(f'Element @ `{locator}` located.')
        except (NoSuchElementException,):
            element = None
            self.logger.info(f'No elements @ `{locator}` located.')
        return element

    def _get_element(self, locator_or_element,
                     explicit_func=None, explicit_timeout=DEFAULT_EXPLICIT_TIMEOUT, error_msg=None):
        """
        INTERNAL USE ONLY
        Wrap the get_element to handle both locator and WebElement
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param explicit_func: (function) explicit function on locator pre-check
        :param explicit_timeout: (int) explicit timeout for explicit function
        :param error_msg: (str) error message to display if explicit check is unexpected
        :return: (WebElement) the web element
        """
        if isinstance(locator_or_element, str):
            if explicit_func:
                if not explicit_func(locator_or_element, timeout=explicit_timeout):
                    if error_msg:
                        self.logger.error(error_msg)
                        raise Exception(error_msg)
                    raise Exception
            element = self.get_element(locator_or_element)
        else:
            element = locator_or_element
        return element

    def get_elements(self, locator):
        """
        Get all elements having the same locator
        :param locator: (str) locator format
        :return: (list) list of the elements
        """
        by, value = Utils.parse_key_value(locator)
        try:
            elements = self.driver.find_elements(by=BY_MAP[by], value=value)
            self.logger.info(f'{len(elements)} element(s) @ `{locator}` located')
        except (NoSuchElementException,):
            elements = []
            self.logger.info(f'No elements @ `{locator}` located.')
        return elements

    def _get_elements(self, locator_or_elements,
                      explicit_func=None, explicit_timeout=DEFAULT_EXPLICIT_TIMEOUT, error_msg=None):
        """
        INTERNAL USE ONLY
        Wrap the get_elements to handle both sample_locator and list of WebElements
        :param locator_or_elements: (str) sample locator or (list/tuple) list of Web Elements
        :param explicit_func: (function) explicit function on locator pre-check
        :param explicit_timeout: (int) explicit timeout for explicit function
        :param error_msg: (str) error message to display if explicit check is unexpected
        :return: (list) list of WebElements
        """
        if isinstance(locator_or_elements, str):
            if explicit_func:
                if not explicit_func(locator_or_elements, timeout=explicit_timeout):
                    if error_msg:
                        self.logger.error(error_msg)
                        raise Exception(error_msg)
                    raise Exception
            elements = self.get_elements(locator_or_elements)
        else:
            elements = locator_or_elements
        return elements

    def get_elements_by_condition(self, locator_or_elements, on_elements, stop_on_first=False):
        """
        Get elements in specific condition
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :param on_elements: (function) condition on element
        :param stop_on_first: (bool) whether to stop on first element matching the condition
        :return: (list) elements matching the condition
        """
        _elements = self._get_elements(locator_or_elements, explicit_func=self.wait_presence_of_all_elements_located,
                                       error_msg=f'No elements are present @ `{locator_or_elements}`')
        output_elements = []
        for _index, element in enumerate(_elements):
            if on_elements(_index, element):
                output_elements.append(element)
                if stop_on_first:
                    break
        return output_elements

    def get_child_element(self, root_locator_or_element, child_locator):
        """
        Get child element
        :param root_locator_or_element: (str) locator format or (WebElement) web element
        :param child_locator: (str) locator format
        :return: (WebElement)
        """
        child_by, child_value = Utils.parse_key_value(child_locator)
        root_element = self._get_element(root_locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                         error_msg=f'Root element is not present @ `{root_locator_or_element}`')
        self.logger.info(f'Root element located @ `{root_locator_or_element}`')
        try:
            child_element = root_element.find_element(by=BY_MAP[child_by], value=child_value)
            self.logger.info(f'Child element @ `{child_locator}` located')
        except (NoSuchElementException, NoSuchWindowException):
            child_element = None
            self.logger.info(f'No child element located @ `{child_locator}`')
        return child_element

    def get_child_elements(self, root_locator_or_element, child_locator):
        """
        Get child elements
        :param root_locator_or_element: (str) locator format or (WebElement) web element
        :param child_locator: (str) locator format
        :return: (list of WebElements)
        """
        child_by, child_value = Utils.parse_key_value(child_locator)
        root_element = self._get_element(root_locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                         error_msg=f'Root element is not present @ `{root_locator_or_element}`')
        self.logger.info(f'Root element located @ `{root_locator_or_element}`')
        try:
            child_elements = root_element.find_elements(by=BY_MAP[child_by], value=child_value)
            self.logger.info(f'{len(child_elements)} child elements @ `{child_locator}` located')
        except (NoSuchElementException, NoSuchWindowException):
            child_elements = None
            self.logger.info(f'No child element located @ `{child_locator}`')
        return child_elements

    def _actions(self, fn, locator_or_elements,
                 explicit_func=None, explicit_err_msg=None,
                 on_elements=lambda index, element: True, stop_on_first=False,
                 *args, **kwargs):
        """
        :param fn:
        :param locator_or_elements:
        :param explicit_func:
        :param explicit_err_msg:
        :param on_elements:
        :param stop_on_first:
        :param args:
        :param kwargs:
        :return:
        """
        elements = self._get_elements(locator_or_elements, explicit_func=explicit_func,
                                      error_msg=explicit_err_msg)
        self.logger.info(f'`{locator_or_elements}` has {len(elements)} element(s), '
                         f'only `{fn.__name__}` on specific elements')
        output = []
        for _index, element in enumerate(elements):
            if on_elements(_index, element):
                output.append(fn(element, *args, **kwargs))
                if stop_on_first:
                    break
        return output

    def get_attribute_value(self, locator_or_element, attribute):
        """
        Get attribute's value of an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param attribute: (str) attribute
        :return: (str) attribute's value of the located element
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to get attribute value @ `{locator_or_element}`')
        return element.get_attribute(attribute)

    def get_element_dimension(self, locator_or_element):
        """
        Get element dimension which includes its position and size
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: (dict) includes keys: x, y, height, width
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to get its dimension @ `{locator_or_element}`')
        return element.rect

    def clear_text(self, locator_or_element):
        """
        Clear text of an input-able element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Element is not visible to clear text @ `{locator_or_element}`')
        element.clear()
        return self

    def input_text(self, locator_or_element, text, is_tap=False, is_clear=True, is_text_logged=True):
        """
        Input a text into an input-able element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param text: (str) text to input
        :param is_tap: (bool) tap before input
        :param is_clear: (bool) clear before input
        :param is_text_logged: (bool) is text logged, normally used to hide username or password in logging
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Element is not visible to input text @ `{locator_or_element}`')
        if is_tap:
            self.tap(element)
        if is_clear:
            self.clear_text(element)
        if str(text):
            log_text = text if is_text_logged else '**********'
            self.logger.info(f'Input text {log_text} to textbox @ `{locator_or_element}`')
            element.send_keys(str(text))
        return self

    def hide_keyboard(self):
        self.driver.hide_keyboard()

    # def is_switch_on(self, locator_or_element):
    #     """
    #     Get the state of the switch
    #     :param locator_or_element: (str) locator format or (WebElement) web element
    #     :return: (bool) True is on, False is off
    #     """
    #     element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
    #                                 error_msg=f'Switch element is not present to get state @ `{locator_or_element}`')
    #     value = self.get_attribute_value(element, 'value')
    #     map_result = {
    #         '0': False,
    #         '1': True
    #     }
    #     return map_result.get(value)
    #
    # def toggle_switch(self, locator_or_element, value=None):
    #     """
    #     Toggle the switch
    #     :param locator_or_element: (str) locator format or (WebElement) web element
    #     :param value: (None/bool):
    #         - None: tap the switch all the way, regardless of its state
    #         - True: make the switch's state on
    #         - False: make the switch's state off
    #     :return: None
    #     """
    #     element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
    #                                 error_msg=f'Switch element is not visible to toggle @ `{locator_or_element}`')
    #     current_value = self.is_switch_on(element)
    #     if value != current_value:
    #         self.tap(locator_or_element)

    def tap(self, locator_or_element):
        """
        Tap
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: None
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Element is not visible to tap @ `{locator_or_element}`')
        actions = TouchAction(self.driver)
        actions.tap(element).perform()

    def taps(self, locator_or_elements, on_elements=lambda index, element: True, stop_on_first=False):
        """
        Tap on elements in specific condition
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :param on_elements: (function) condition on element
        :param stop_on_first: (bool) stop when first element is tapped
        :return: self
        """
        self._actions(self.tap, locator_or_elements,
                      explicit_func=self.wait_presence_of_all_elements_located,
                      explicit_err_msg=f'No elements are present @ `{locator_or_elements}`',
                      on_elements=on_elements, stop_on_first=stop_on_first)
        return self

    def tap_and_hold(self, locator_or_element, duration=1):
        """
        Tap and hold / Long tap / Long Press on an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param duration: (int/float) press delay in seconds
        :return: None
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Element is not visible to  @ `{locator_or_element}`')
        _duration = int(float(duration)*1000)  # convert to milliseconds and get floor value
        actions = TouchAction(self.driver)
        actions.long_press(element, duration=_duration).release().perform()

    long_press = long_tap = tap_and_hold

    def scroll(self, from_locator_or_element, to_locator_or_element, duration=None):
        """
        Scroll
        :param from_locator_or_element: (str) locator format or (WebElement) web element
        :param to_locator_or_element: (str) locator format or (WebElement) web element
        :param duration: (int) speed of action (in ms)
        :return: None
        """
        src_element = self._get_element(from_locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                        error_msg=f'Source element is not visible @ `{from_locator_or_element}`')
        dst_element = self._get_element(to_locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                        error_msg=f'Destination element is not visible @ `{to_locator_or_element}`')
        self.driver.scroll(src_element, dst_element, duration=duration)

    # def swipe(self, from_locator_or_element, to_locator_or_element, duration=0):
    #     """
    #     Swipe / Move / Drag and Drop
    #     :param from_locator_or_element: (str) locator format or (WebElement) web element
    #     :param to_locator_or_element: (str) locator format or (WebElement) web element
    #     :param duration: (int) duration to tap, in seconds
    #     :return: None
    #     """
    #     # Swipe
    #     actions = TouchAction(self.driver)
    #     # actions.long_press(x=from_x, y=from_y, duration=duration).move_to(x=to_x, y=to_y).release().perform()
    #     # self.driver.swipe(start_x=from_x, start_y=from_y,
    #     #                   end_x=to_x, end_y=to_y,
    #     #                   duration=duration)

    def get_tabular_data(self, header, locator_sample_data, attribute='value', row=None):
        """
        Get data having table format
        :param header: (list/tuple) list of column name in header
        :param locator_sample_data: (str) locator format
        :param attribute: (str) attribute to get
        :param row: (int) row number-th to get, None -> get all rows
        :return: (list) if `row` is None, (dict) if `row` is available, (None) if no data available
        """
        n_row = Utils.soft_format(row, int)
        data = [element.get_attribute(attribute) for element in self.get_elements(locator_sample_data)]
        return Utils.group_tabular_data(header, data, n_row)

    def wait_presence_of_element_located(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until an element is present on the DOM
        :param locator: (str) locator to locate the element
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.presence_of_element_located, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_url_contains(self, text, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the URL contains a substring
        :param text: (str) the substring
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.url_contains, text, timeout=timeout, inverse=inverse)

    def wait_url_matches(self, pattern, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the URL matches the pattern
        :param pattern: (str) regex pattern
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.url_matches, pattern, timeout=timeout, inverse=inverse)

    def wait_url_to_be(self, url, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the URL is an exact match with the input
        :param url: (str) expected URL
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.url_to_be, url, timeout=timeout, inverse=inverse)

    def wait_url_changes(self, url, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the URL is not an exact match with the input
        :param url: (str) unexpected URL
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.url_changes, url, timeout=timeout, inverse=inverse)

    def wait_visibility_of_element_located(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the located element is present and visible which means its height and width > 0
        :param locator: (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.visibility_of_element_located, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_visibility_of(self, element, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the element is present and visible, which means its height and width > 0
        :param element: (WebElement object)
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.visibility_of, element, timeout=timeout, inverse=inverse)

    def wait_presence_of_all_elements_located(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until at least one located element is present
        :param locator: (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.presence_of_all_elements_located, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_visibility_of_any_elements_located(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until at least one located element is present and visible, which means its height and width > 0
        :param locator: (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.visibility_of_any_elements_located, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_visibility_of_all_elements_located(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until all located elements are present and visible, which means its height and width > 0
        :param locator: (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.visibility_of_all_elements_located, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_text_to_be_present_in_element(self, locator, text, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the given text is a substring of the located element's text
        :param locator: (str) locator format
        :param text: (str) the input text to check
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.text_to_be_present_in_element, (BY_MAP[by], value), str(text),
                                   timeout=timeout, inverse=inverse)

    def wait_text_to_be_present_in_element_value(self, locator, text, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the given text is a substring of value of attribute `value`
        :param locator: (str) locator format
        :param text: (str) the input text to check
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.text_to_be_present_in_element_value, (BY_MAP[by], value), text,
                                   timeout=timeout, inverse=inverse)

    def wait_frame_to_be_available_and_switch_to_it(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the located frame is available and switch to it
        :param locator: (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.frame_to_be_available_and_switch_to_it, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_invisibility_of_element_located(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the located element is either invisible or not present on the DOM
        :param locator: (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.invisibility_of_element_located, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_invisibility_of_element(self, element, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the element is either invisible or not present on the DOM
        :param element: (WebElement object)
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.invisibility_of_element, element, timeout=timeout, inverse=inverse)

    def wait_attribute_value_to_be(self, locator, attribute, value,
                                   timeout=DEFAULT_EXPLICIT_TIMEOUT, interval=1, inverse=False):
        """
        Wait until a located element's attribute has expected value
        :param locator: (str) locator format
        :param attribute: (str) attribute to check
        :param value: (str) expected value
        :param timeout: (int) timeout
        :param interval: (int) interval check
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        if inverse:
            return Utils.wait_until_not_expect(self.get_attribute_value, (locator, attribute), value,
                                               int(timeout), int(interval))
        return Utils.wait_until_expect(self.get_attribute_value, (locator, attribute), value,
                                       int(timeout), int(interval))

    def wait_staleness_of(self, element, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the element is no longer attached to the DOM
        :param element: (WebElement object)
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.staleness_of, element, timeout=timeout, inverse=inverse)

    def wait_element_to_be_selected(self, element, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the element is selected
        :param element: (WebElement object)
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.element_to_be_selected, element, timeout=timeout, inverse=inverse)

    def wait_element_located_to_be_selected(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the located element is selected
        :param locator: (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.element_located_to_be_selected, (BY_MAP[by], value),
                                   timeout=timeout, inverse=inverse)

    def wait_element_selection_state_to_be(self, element, is_selected, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the element is selected or not
        :param element: (WebElement object)
        :param is_selected: (bool) True to check selected, False to check un-selected
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.element_selection_state_to_be, element, is_selected,
                                   timeout=timeout, inverse=inverse)

    def wait_element_located_selection_state_to_be(self, locator, is_selected,
                                                   timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the located element is selected or not
        :param locator: (str) locator format
        :param is_selected: (bool) True to check selected, False to check un-selected
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.element_located_selection_state_to_be, (BY_MAP[by], value), is_selected,
                                   timeout=timeout, inverse=inverse)

    def _wait_explicit(self, func, *args, timeout, inverse):
        ignored_exceptions = (TimeoutException,)  # NoSuchElementException)
        try:
            wait = WebDriverWait(self.driver, int(timeout))
            if not inverse:
                self.logger.info(f'Explicit wait {func.__name__} on {args} until meet')
                wait.until(func(*args))
            else:
                self.logger.info(f'Explicit wait {func.__name__} on {args} until not meet')
                wait.until_not(func(*args))
            self.logger.info('Explicit wait final state: True')
            return True
        except ignored_exceptions:
            self.logger.info('Explicit wait final state: False')
            return False

    def set_implicit_wait(self, timeout=DEFAULT_IMPLICIT_TIMEOUT):
        """
        Set the implicit wait
        :param timeout: (int) in seconds
        :return:
        """
        self.driver.implicitly_wait(timeout)
        self.implicit_timeout = timeout
