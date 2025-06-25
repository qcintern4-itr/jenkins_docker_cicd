#!/usr/bin/env python3
import time

try:
    import os
    import io
    import cv2
    # import pyautogui
    import numpy as np
    from PIL import Image
    from selenium import webdriver
    from selenium.webdriver.common.keys import Keys
    from selenium.webdriver.chrome.options import Options as ChromeOptions
    from selenium.webdriver.firefox.options import Options as FirefoxOptions
    from selenium.webdriver.edge.options import Options as EdgeOptions
    from selenium.webdriver.chrome.service import Service as ChromeService
    from selenium.webdriver.firefox.service import Service as FirefoxService
    from selenium.webdriver.edge.service import Service as EdgeService
    from selenium.webdriver.support.ui import WebDriverWait, Select
    from selenium.webdriver.support import expected_conditions as ec
    from selenium.webdriver import ActionChains
    from selenium.common.exceptions import TimeoutException, NoSuchElementException, NoSuchWindowException, NoAlertPresentException
    from selenium.webdriver.common.by import By
    from datetime import datetime, timedelta
    import requests
    import base64
    import re
    import pdfplumber
    from pdfquery import PDFQuery
    from pypdf import PdfReader
    import pandas as pd
    import openpyxl
    import platform
    import json

    from corelib import Logger, Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise

# NOTE: locator format is a string '{By_object_strategy}:{value}', for example id:sign-in, name:logout
BY_MAP = {
    'id': By.ID,
    'xpath': By.XPATH,
    'link_text': By.LINK_TEXT,
    'partial_link_text': By.PARTIAL_LINK_TEXT,
    'name': By.NAME,
    'tag': By.TAG_NAME,
    'class': By.CLASS_NAME,
    'selector': By.CSS_SELECTOR,
}

CHROME, FIREFOX, EDGE = 'chrome', 'firefox', 'edge'


class WebHandler:
    ROBOT_LIBRARY_SCOPE = 'SUITE'
    # DEFAULT_IMPLICIT_TIMEOUT = 10
    DEFAULT_EXPLICIT_TIMEOUT = 6

    def __init__(self, browser, headless=False, preset_implicit_timeout=None):
        self.browser = browser
        self.headless = headless
        self.preset_implicit_timeout = Utils.soft_format(preset_implicit_timeout, int)

        self.logger = Logger.Logger(__name__.split('.')[-1], log_level='INFO')
        self.driver = None

    def start_browser(self):
        """
        Start webdriver and browser
        :return:
        """
        start_fn_map = {
            CHROME: self.__start_chrome,
            FIREFOX: self.__start_firefox,
            EDGE: self.__start_edge
        }
        if self.browser not in start_fn_map.keys():
            raise Exception(f'`{self.browser}` browser is either invalid or unsupported')
        start_fn_map[self.browser]()
        self.driver.maximize_window()
        if self.preset_implicit_timeout:
            self.set_implicit_wait(self.preset_implicit_timeout)
        return self

    def __enter__(self):
        self.start_browser()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.quit_browser()

    def open_page(self, url):
        """
        Navigate to a URL
        :param url: (str) URL
        :return: self
        """
        self.logger.info(f'Navigate to {url}')
        self.driver.get(url)
        return self

    def quit_browser(self):
        """
        Quit all sessions in browser, and terminate the driver
        :return: None
        """
        self.logger.info('Quit browser and terminate driver')
        self.driver.quit()
        del self

    def get_cookie(self, name):
        """
        Get single cookie
        :param name:
        :return: value of the cookie
        """
        return self.driver.get_cookie(name)

    def get_all_cookies(self):
        """
        Get all current available cookies
        :return: (dict) cookie with its name and value
        """
        return self.driver.get_cookies()

    def add_cookies(self, *cookies):
        """
        Add cookies
        :param cookies: cookies, each cookie is a dict
        :return: self

        Usage:
            add_cookies({'name' : 'foo1', 'value' : 'bar1'},
                        {'name' : 'foo2', 'value' : 'bar2', 'path': '/'})

        """
        [self.driver.add_cookie(cookie) for cookie in cookies]
        return self

    def delete_cookies(self, *names):
        """
        Delete cookies
        :param names:
        :return: self
        """
        [self.driver.delete_cookie(name) for name in names]
        return self

    def delete_all_cookies(self):
        """
        Delete all cookies
        :return: self
        """
        self.driver.delete_all_cookies()
        return self

    def get_element(self, locator):
        """
        Get an element
        :param locator: (str) locator format
        :return: (WebElement) the web element
        """
        by, value = Utils.parse_key_value(locator)
        try:
            element = self.driver.find_element(by=BY_MAP[by], value=value)
            self.logger.info(f'Element @ `{locator}` located.')
        except (NoSuchElementException, NoSuchWindowException):
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
        :return: (list) list of WebElements
        """
        by, value = Utils.parse_key_value(locator)
        try:
            elements = self.driver.find_elements(by=BY_MAP[by], value=value)
            self.logger.info(f'{len(elements)} element(s) @ `{locator}` located')
        except (NoSuchElementException, NoSuchWindowException):
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

    def execute_script(self, js_script, *args):
        """
        Execute JavaScript command
        :param js_script: (str) js script
        :param args: (list) arguments
        :return: return of the js execution
        """
        return self.driver.execute_script(js_script, *args)

    def switch_tab(self, tab_id=-1):
        """
        Switch to another tab
        :param tab_id: (int) tab ID to switch to
        :return: self
        """
        self.driver.switch_to.window(self.driver.window_handles[int(tab_id)])
        return self

    def close_tab(self, tab_id, is_post_switch=False):
        """
        Close a tab
        :param tab_id: (int) tab ID in the browser
        :param is_post_switch: (bool) True to do post-switch to last tab, False to do nothing
        :return: self
        """
        self.switch_tab(tab_id)
        self.driver.close()
        if is_post_switch:
            self.switch_tab(-1)
        return self

    @property
    def current_window_handle(self):
        """
        Current window handle in control
        :return: (str) current window handle, None if no windows handled
        """
        try:
            return self.driver.current_window_handle
        except NoSuchWindowException:
            return None

    @property
    def window_handles(self):
        """
        All window handles
        :return: (list) all window handles
        """
        return self.driver.window_handles

    def resize_window(self, percent):
        """
        Resize the browser window
        :param percent: (int) number of percentage to the current screen resolution
        :return: self
        """
        _percent = 1 if percent >= 100 else percent / 100
        self.logger.info(f'Resize window to {_percent} %')
        self.execute_script(f'window.resizeTo(screen.availWidth*{_percent}, screen.availHeight*{_percent});')
        return self

    def switch_to_window_handle(self, window_handle):
        """
        Switch to window handle
        :param window_handle: (str) window handle id
        :return: self
        """
        self.logger.info(f'Switch to window handle: {window_handle}.')
        self.driver.switch_to.window(window_handle)
        return self

    def switch_to_frame(self, frame_locator_or_element):
        """
        Switch to (i)frame
        :param frame_locator_or_element: (str) frame locator or (WebElement) frame WebElement
        :return: self
        """
        self.logger.info(f'Switch to frame @ `{frame_locator_or_element}`.')
        element = self._get_element(frame_locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Frame element is not present @ `{frame_locator_or_element}`')
        self.driver.switch_to.frame(element)
        return self

    def switch_to_frame_shadow(self, frame_locator_or_element):
        """
        Switch to (i)frame
        :param frame_locator_or_element: (str) frame locator or (WebElement) frame WebElement
        :return: self
        """
        self.logger.info(f'Switch to frame @ `{frame_locator_or_element}`.')
        element = self._get_element(frame_locator_or_element,
                                    error_msg=f'Frame element is not present @ `{frame_locator_or_element}`')
        self.driver.switch_to.frame(element)
        return self

    def switch_to_default_content(self):
        """
        Switch focus to the default frame.
        :return: self
        """
        self.driver.switch_to.default_content()
        return self

    def refresh_page(self):
        """
        Refresh the current page
        :return: self
        """
        self.driver.refresh()
        return self

    def clear_text(self, locator_or_element):
        """
        Clear text of an input-able element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Element is not visible to clear text @ `{locator_or_element}`')
        # element.clear()
        if Utils.get_machine_info().get('system').lower() == 'darwin':
            element.send_keys(Keys.COMMAND + 'a')
        else:
            element.send_keys(Keys.CONTROL + 'a')
        element.send_keys(Keys.DELETE)
        return self

    def input_text(self, locator_or_element, text, is_clear=True, is_text_logged=True):
        """
        Input a text into an input-able element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param text: (str) text to input
        :param is_clear: (bool) clear prior to input
        :param is_text_logged: (bool) is text logged, normally used to hide username or password in logging
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Element is not visible to input text @ `{locator_or_element}`')
        if is_clear:
            self.clear_text(element)
        if str(text):
            log_text = text if is_text_logged else '**********'
            self.logger.info(f'Input text {log_text} to textbox @ `{locator_or_element}`')
            element.send_keys(str(text))
        return self

    def select_from_drop_down(self, select_locator_or_element, *items):
        """
        Select values from drop-down selection
        :param select_locator_or_element: (str) locator format or (WebElement) web element
        :param items: (list/tuple or str) select items format
        :return: self
            Example of <items> format:
            -   'value:filter-1'
            -   ['value:filter-1', 'index:2', 'text:age']
        """
        element = self._get_element(select_locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Select tag element is not visible @ `{select_locator_or_element}`')
        select = Select(element)
        func_map = {
            'value': select.select_by_value,
            'index': select.select_by_index,
            'text': select.select_by_visible_text,
        }
        [func_map[func_key](arg) for func_key, arg in (Utils.parse_key_value(item) for item in items)]
        return self

    def is_checkbox_selected(self, locator_or_element):
        """
        Check if the checkbox selected
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: (bool) True if selected, False if un-selected
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Checkbox element is not present @ `{locator_or_element}`')
        return element.is_selected()

    def toggle_checkbox(self, checkbox_locator_or_element, click_locator_or_element, value=True, is_scroll=False):
        """
        Tick or un-tick checkbox
        :param checkbox_locator_or_element: (str/WebElement) locator/WebElement as checkbox
        :param click_locator_or_element: (str/WebElement) locator/WebElement to toggle click
        :param value: (bool) True to make the checkbox selected, False un-selected
        :param is_scroll: (bool) scroll element_click into view if click happens
        :return: self
        """
        is_selected = self.is_checkbox_selected(checkbox_locator_or_element)
        self.logger.info(f'Current checkbox state: {is_selected}, expected state: {value}')
        if (value, is_selected) in ((True, False), (False, True)):
            self.logger.info(f'Toggle the checkbox to {value}.')
            self.click(click_locator_or_element, is_scroll=is_scroll)
        return self

    def scroll_into_view(self, locator_or_element):
        """
        Scroll element into view
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present @ `{locator_or_element}`')
        self.logger.info(f'Scroll to {locator_or_element}')
        self.execute_script('arguments[0].scrollIntoView(true)', element)
        return self

    def click(self, locator_or_element, is_scroll=False):
        """
        Click on element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param is_scroll: (boolean) scroll element into view before click
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_element_to_be_clickable,
                                    error_msg=f'Element is not click-able @ `{locator_or_element}`')
        if is_scroll:
            self.scroll_into_view(element)
        self.logger.info(f'Click on `{locator_or_element}`')
        element.click()
        return self

    def js_click(self, locator_or_element, is_scroll=False):
        """
        JS-click on element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param is_scroll: (boolean) scroll element into view before click
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present @ `{locator_or_element}`')
        if is_scroll:
            self.scroll_into_view(element)
        self.logger.info(f'JS click on `{locator_or_element}`')
        self.execute_script('arguments[0].click()', element)
        return self

    def clicks(self, locator_or_elements, on_elements=lambda index, element: True, is_scroll=False,
               stop_on_first=False):
        """
        Click on elements in specific condition
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :param on_elements: (function) condition on element
        :param is_scroll: (bool) scroll element into view before click
        :param stop_on_first: (bool) is stopped when first element is clicked
        :return: self
        """
        self._actions(self.click, locator_or_elements, is_scroll=is_scroll,
                      explicit_func=self.wait_presence_of_all_elements_located,
                      explicit_err_msg=f'No elements are present @ `{locator_or_elements}`',
                      on_elements=on_elements, stop_on_first=stop_on_first)
        return self

    def js_clicks(self, locator_or_elements, on_elements=lambda index, element: True, is_scroll=False,
                  stop_on_first=False):
        """
        JS-click on elements in specific condition
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :param on_elements: (function) condition on element
        :param is_scroll: (bool) scroll element into view before click
        :param stop_on_first: (bool) is stopped when first element is clicked
        :return: self
        """
        self._actions(self.js_click, locator_or_elements, is_scroll=is_scroll,
                      explicit_func=self.wait_presence_of_all_elements_located,
                      explicit_err_msg=f'No elements are present @ `{locator_or_elements}`',
                      on_elements=on_elements, stop_on_first=stop_on_first)
        return self

    def click_by_index(self, locator_or_elements, index, is_scroll=False):
        """
        Get the element among located elements by index, then click on it
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :param index: (int) index of the element among the located elements
        :param is_scroll: (bool) scroll element into view before click
        :return: self
        """
        self.logger.warning('Deprecated, use `clicks` instead')
        elements = self._get_elements(locator_or_elements, explicit_func=self.wait_visibility_of_any_elements_located,
                                      error_msg=f'No elements are present @ `{locator_or_elements}`')
        self.logger.info(f'{locator_or_elements} has {len(elements)} element(s), index to click: {index}')
        if len(elements) < int(index) + 1:
            raise Exception
        if is_scroll:
            self.scroll_into_view(elements[int(index)])
        self.click(elements[int(index)])
        return self

    def double_click(self, locator_or_element):
        """
        Double-click on an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_element_to_be_clickable,
                                    error_msg=f'Element is not click-able @ `{locator_or_element}`')
        self.logger.info(f'Double click on `{locator_or_element}`')
        action_chains = ActionChains(self.driver)
        action_chains.double_click(element).perform()
        action_chains.reset_actions()
        return self

    def context_click(self, locator_or_element):
        """
        Context-click on an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present for context click @ `{locator_or_element}`')
        self.logger.info(f'Context click on `{locator_or_element}`')
        action_chains = ActionChains(self.driver)
        action_chains.context_click(element).perform()
        action_chains.reset_actions()
        return self

    def input_file(self, locator_or_element, file_path):
        """
        Input a file input box
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param file_path: (str) file path
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_visibility_of_element_located,
                                    error_msg=f'Element is not visible to input file @ `{locator_or_element}`')
        self.logger.info(f'Input file to input file box @ `{locator_or_element}`')
        element.send_keys(file_path)
        return self

    def hover_to(self, locator_or_element, is_scroll=False):
        """
        Hover to an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param is_scroll: (boolean) scroll element into view before action
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to hover to @ `{locator_or_element}`')
        if is_scroll:
            self.scroll_into_view(element)
        action_chains = ActionChains(self.driver)
        self.logger.info(f'Hover to @ `{locator_or_element}`')
        action_chains.move_to_element(element).perform()
        action_chains.reset_actions()
        return self

    def hover_to_by_index(self, locator_or_elements, index, is_scroll=False):
        """
        Get the element among located elements by index, then hover to it
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :param index: (int) index of the element among the located elements
        :param is_scroll: (boolean) scroll element into view before hover to
        :return: self
        """

        elements = self._get_elements(locator_or_elements, explicit_func=self.wait_visibility_of_any_elements_located,
                                      error_msg=f'No elements are present @ `{locator_or_elements}` to hover to.')
        self.logger.info(f'`{locator_or_elements}` has {len(elements)} element(s), index to hover to: {index}')
        if len(elements) < int(index) + 1:
            raise Exception
        self.hover_to(elements[int(index)], is_scroll=is_scroll)
        return self

    def drag_and_drop(self, source_locator_or_element, target_locator_or_element):
        """
        Drag and drop an element to an element
        :param source_locator_or_element: (str) locator format or (WebElement) web element
        :param target_locator_or_element: (str) locator format or (WebElement) web element
        :return: self
        """
        self.logger.info(f'Drag from {source_locator_or_element} to {target_locator_or_element}')
        source_element = self._get_element(source_locator_or_element,
                                           explicit_func=self.wait_visibility_of_element_located,
                                           error_msg=f'Source element is not visible @ `{source_locator_or_element}`')
        target_element = self._get_element(target_locator_or_element,
                                           explicit_func=self.wait_visibility_of_element_located,
                                           error_msg=f'Target element is not visible @ `{target_locator_or_element}`')
        action_chains = ActionChains(self.driver)
        action_chains.move_to_element(source_element).drag_and_drop(source_element, target_element).perform()
        action_chains.reset_actions()
        return self

    def drag_and_drop_by_offset(self, source_locator_or_element, x_offset, y_offset):
        """
        Drag and drop an element to an element
        :param source_locator_or_element: (str) locator format or (WebElement) web element
        :param x_offset: (int) x-offset
        :param y_offset: (int) x-offset
        :return: self
        """
        source_element = self._get_element(source_locator_or_element,
                                           explicit_func=self.wait_visibility_of_element_located,
                                           error_msg=f'Source element is not visible @ `{source_locator_or_element}`')
        self.logger.info(f'Drag from `{source_locator_or_element}` to position with offset {(x_offset, y_offset)}')
        action_chains = ActionChains(self.driver)
        action_chains.move_to_element(source_element).drag_and_drop_by_offset(source_element, x_offset, y_offset)
        action_chains.perform()
        action_chains.reset_actions()
        return self

    def click_by_offset(self, source_locator_or_element, x_offset, y_offset):
        """
        :param source_locator_or_element: (str) locator format or (WebElement) web element
        :param x_offset: (int) x-offset
        :param y_offset: (int) x-offset
        :return: self
        """
        source_element = self._get_element(source_locator_or_element,
                                           explicit_func=self.wait_visibility_of_element_located,
                                           error_msg=f'Source element is not visible @ `{source_locator_or_element}`')
        action_chains = ActionChains(self.driver)
        action_chains.move_to_element_with_offset(source_element, x_offset, y_offset).click().perform()
        action_chains.reset_actions()
        return self

    def context_click_by_offset(self, source_locator_or_element, x_offset, y_offset):
        """
        :param source_locator_or_element: (str) locator format or (WebElement) web element
        :param x_offset: (int) x-offset
        :param y_offset: (int) x-offset
        :return: self
        """
        source_element = self._get_element(source_locator_or_element,
                                           explicit_func=self.wait_visibility_of_element_located,
                                           error_msg=f'Source element is not visible @ `{source_locator_or_element}`')
        action_chains = ActionChains(self.driver)
        action_chains.move_to_element_with_offset(source_element, x_offset, y_offset).context_click().perform()
        action_chains.reset_actions()
        return self

    def zoom_by_percent(self, percent):
        """
        Zoom the page by percent
        :param percent: (int) by scale of percentage
        :return: self
        """
        self.execute_script(f'document.body.style.zoom="{percent}%"')
        return self

    def zoom(self, _type, attempts=1):
        """
        Zoom in/out
        :param _type: (str) in/out
        :param attempts: (int) number of attempts to take zoom-in action
        :return: self
        """
        key_zoom = {'in': Keys.ADD, 'out': Keys.SUBTRACT}[_type]
        if attempts > 0:
            if Utils.get_machine_info().get('system').lower() == 'darwin':
                self.get_element('tag:html').send_keys(Keys.COMMAND + key_zoom)
            else:
                self.get_element('tag:html').send_keys(Keys.CONTROL + key_zoom)
            self.zoom(_type, attempts - 1)
        return self

    def get_text(self, locator_or_element):
        """
        Get text of an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: (str) the text of the element
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to get text @ `{locator_or_element}`')
        return element.text.strip()

    def get_text_by_index(self, locator_or_elements, index):
        """
        Get text of an element of a list of elements which have the same locator
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :param index: index of the element to get text
        :return: (str) the text of the element
        """
        elements = self._get_elements(locator_or_elements, explicit_func=self.wait_presence_of_element_located,
                                      error_msg=f'No elements are present to get text @ `{locator_or_elements}`')
        self.logger.info(f'`{locator_or_elements}` has {len(elements)} element(s), index to get text: {index}')
        if len(elements) < int(index) + 1:
            raise Exception
        return self.get_text(elements[int(index)])

    def get_texts(self, locator_or_elements):
        """
        This method provides getting texts:
        - From a list of elements
        - From a list of elements which are located by a sample locator
        :param locator_or_elements: (str) locator format or (list/tuple) list of WebElements
        :return: (list) list of texts
        """
        return self._actions(self.get_text, locator_or_elements)

    def get_element_dimension(self, locator_or_element):
        """
        Get element dimension which includes its position and size
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: (dict) includes keys: x, y, height, width
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to get its dimension @ `{locator_or_element}`')
        return {**element.location, **element.size}

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

    def is_attribute_available(self, locator_or_element, attribute):
        """
        Check if an attribute of an element exists
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param attribute: (str) attribute
        :return: (bool) True if the attribute exists, False otherwise
        """
        return self.get_attribute_value(locator_or_element, attribute) is not None

    def set_attribute_element(self, locator_or_element, attribute, value):
        """
        Set an attribute-value for an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param attribute: (str) attribute
        :param value: (str) new value
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to set attribute value @ `{locator_or_element}`')
        self.execute_script('arguments[0].setAttribute("%s", "%s")' % (attribute, value), element)
        return self

    def remove_attribute(self, locator_or_element, attribute):
        """
        Remove an attribute from an element
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param attribute: (str) attribute
        :return: self
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to remove attribute @ `{locator_or_element}`')
        self.execute_script("arguments[0].removeAttribute('%s')" % attribute, element)
        return self

    def get_css_property_value(self, locator_or_element, property_key):
        """
        Get css property value
        :param locator_or_element: (str) locator format or (WebElement) web element
        :param property_key: (str) css property key
        :return: (str) css property value
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to get css value @ `{locator_or_element}`')
        return element.value_of_css_property(property_key)

    def get_tabular_data(self, header, locator_or_elements, row=None):
        """
        Get data having table format
        :param header: (list/tuple) list of column name in header
        :param locator_or_elements: (str) sample locator or (list/tuple) list of WebElements
        :param row: (int) row number-th to get, None -> get all rows
        :return: (list) if `row` is None, (dict) if `row` is available, (None) if no data available
        """
        _row = Utils.soft_format(row, int)
        data = self.get_texts(locator_or_elements)
        return Utils.group_tabular_data(header, data, _row)

    def set_implicit_wait(self, timeout):
        """
        Set Implicit Wait
        :param timeout: (int) timeout
        :return: self
        """
        self.driver.implicitly_wait(int(timeout))
        return self

    def wait_title_is(self, text, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the input text is the expected title of the page
        :param text: (str) text
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.title_is, text, timeout=timeout, inverse=inverse)

    def wait_title_contains(self, text, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the title of the page contains a text
        :param text: (str) text
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.title_contains, text, timeout=timeout, inverse=inverse)

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

    def wait_element_to_be_clickable(self, locator, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the located element is visible and click-able
        :param locator:  (str) locator format
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        by, value = Utils.parse_key_value(locator)
        return self._wait_explicit(ec.element_to_be_clickable, (BY_MAP[by], value), timeout=timeout, inverse=inverse)

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

    def wait_number_of_windows_to_be(self, num_windows, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until the number of windows to be a certain value
        :param num_windows: (int) expected number of windows
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.number_of_windows_to_be, int(num_windows), timeout=timeout, inverse=inverse)

    def wait_current_window_to_be(self, window_id, timeout=DEFAULT_EXPLICIT_TIMEOUT, interval=1, inverse=False):
        """
        Wait until the current window to be a specific window id.
        If the `window_id` is None, the condition will be `until no current window`
        :param window_id: (str) window id
        :param timeout: (int) timeout
        :param interval: (int) interval check
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        if not inverse:
            return Utils.wait_until_expect(lambda: self.current_window_handle, [], window_id,
                                           timeout=timeout, interval=interval)
        return Utils.wait_until_not_expect(lambda: self.current_window_handle, [], window_id,
                                           timeout=timeout, interval=interval)

    def wait_new_window_is_opened(self, current_handles, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until a new window is open, and the number of windows increases
        :param current_handles: (list/tuple) the list of current windows handles
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.new_window_is_opened, current_handles, timeout=timeout, inverse=inverse)

    def wait_alert_is_present(self, timeout=DEFAULT_EXPLICIT_TIMEOUT, inverse=False):
        """
        Wait until an alert is present
        :param timeout: (int) timeout
        :param inverse: (bool) False to wait until the condition met, True to wait until the condition not met
        :return: (bool) True if the expected wait happens, False otherwise
        """
        return self._wait_explicit(ec.alert_is_present, timeout=timeout, inverse=inverse)

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

    def __start_chrome(self):
        opts = ChromeOptions()
        if self.headless:
            opts.add_argument('--headless')
            opts.add_argument('--window-size=1920,1080')
            opts.add_argument('--no-sandbox')
            opts.add_argument('--disable-dev-shm-usage')
        opts.add_experimental_option('windowTypes', ['webview'])
        opts.add_experimental_option('excludeSwitches', ['enable-logging'])
        os_name = platform.system()
        if os_name == "Windows":
            self.driver = webdriver.Chrome(service=ChromeService(executable_path='tmp/chromedriver.exe'), options=opts)
        else:
            self.driver = webdriver.Chrome(service=ChromeService(executable_path='tmp/chromedriver'), options=opts)
        self.logger.info(f'Chrome browser started.')

    def __start_firefox(self):
        opts = FirefoxOptions()
        if self.headless:
            opts.add_argument('--headless')
            # opts.add_argument('--window-size=1360,1020')
        self.driver = webdriver.Firefox(service=FirefoxService(executable_path='tmp/geckodriver'), options=opts)
        self.logger.info(f'Firefox browser started.')

    def __start_edge(self):
        opts = EdgeOptions()
        if self.headless:
            opts.add_argument('--headless')
            # opts.add_argument('--window-size=1360,1020')
        opts.add_experimental_option('windowTypes', ['webview'])
        opts.add_experimental_option('excludeSwitches', ['enable-logging'])
        self.driver = webdriver.Edge(service=EdgeService(executable_path='tmp/msedgedriver'), options=opts)
        self.logger.info(f'Edge browser started.')

    def scroll_dropdown_menu(self):
        """
        Handle scroll in the dropdown menu
        """
        action_chains = ActionChains(self.driver)
        action_chains.send_keys(Keys.UP).perform()
        return self

    def clear_on_text_search(self):
        actions = ActionChains(self.driver)
        actions.send_keys(Keys.BACKSPACE).perform()
        return self

    def click_on_chart_beat(self, element):
        """
        Handle click on chart beats
        """
        action_chains = ActionChains(self.driver)
        action_chains.move_to_element(element).click().perform()
        return self

    def select_all_value(self):
        """
        Select all the value
        """
        actions = ActionChains(self.driver)
        actions.key_down(Keys.CONTROL)  # Use Keys.COMMAND instead of Keys.CONTROL for Mac
        actions.send_keys('a')
        actions.key_up(Keys.CONTROL)
        actions.perform()
        return self

    def select_more_the_element(self, element):
        """
        Select more the element
        """
        actions = ActionChains(self.driver)
        actions.key_down(Keys.CONTROL)  # Use Keys.COMMAND instead of Keys.CONTROL for Mac
        actions.move_to_element(element).click().perform()
        return self

    def exit_selection_by_pressing_key(self):
        """
        Exit the selection mode by pressing ‘Esc’ key
        """
        actions = ActionChains(self.driver)
        actions.send_keys(Keys.ESCAPE)  # Use Keys.COMMAND instead of Keys.CONTROL for Mac
        actions.perform()
        return self

    def hover_to_element(self, element):
        """
        Hover to element
        """
        action_chains = ActionChains(self.driver)
        action_chains.move_to_element(element).perform()
        action_chains.reset_actions()
        return self

    def hide_element(self, locator):
        element = self.get_element(locator)
        self.driver.execute_script("arguments[0].style.visibility='hidden'", element)

    def take_screenshot_by_element_hide(self, locator, element_hide, image_name=None):
        original_image_path = os.path.join('results', 'img_original', f'{image_name}.png').replace('\\', '/')
        compare_image_path = os.path.join('results', 'img_compare', f'{image_name}.png').replace('\\', '/')
        img_original = cv2.imread(original_image_path)
        if img_original is None:
            # Hide the specified element
            element_hide_original = self.get_element(element_hide)
            self.execute_script("arguments[0].style.visibility='hidden'", element_hide_original)
            # Take screenshot for comparison
            image_binary = self.get_element(locator).screenshot_as_png
            img = Image.open(io.BytesIO(image_binary))
            img.save(original_image_path)
            # Restore element visibility
            self.execute_script("arguments[0].style.visibility='visible'", element_hide_original)
        # Hide the specified element
        element_hide_compare = self.get_element(element_hide)
        self.execute_script("arguments[0].style.visibility='hidden'", element_hide_compare)
        # Take screenshot for comparison
        image_binary = self.get_element(locator).screenshot_as_png
        img = Image.open(io.BytesIO(image_binary))
        img.save(compare_image_path)
        # Restore element visibility
        self.execute_script("arguments[0].style.visibility='visible'", element_hide_compare)

    def take_screenshot_by_element(self, locator, image_name=None):
        original_image_path = os.path.join('results', 'img_original', f'{image_name}.png').replace('\\', '/')
        compare_image_path = os.path.join('results', 'img_compare', f'{image_name}.png').replace('\\', '/')
        img_original = cv2.imread(original_image_path)
        element = self.get_element(locator)
        if img_original is None:
            # Take screenshot for comparison
            image_binary = element.screenshot_as_png
            img = Image.open(io.BytesIO(image_binary))
            img.save(original_image_path)
        # Take screenshot for comparison
        image_binary = element.screenshot_as_png
        img = Image.open(io.BytesIO(image_binary))
        img.save(compare_image_path)

    def pagination_aireports_hotkey(self, next_or_previous=None):
        actions = ActionChains(self.driver)
        if next_or_previous == 'next':
            actions.send_keys('x')
        elif next_or_previous == 'previous':
            actions.send_keys('z')
        actions.perform()

    def action_by_keyword(self, keyword):
        actions = ActionChains(self.driver)
        actions.send_keys(keyword)
        actions.perform()
        return self

    def ctrl_and_click(self, element):
        actions = ActionChains(self.driver)
        actions.key_down(Keys.CONTROL)
        actions.move_to_element(element).click().perform()
        actions.reset_actions()
        return self

    def ctrl_and_key(self, key):
        os_name = platform.system()
        actions = ActionChains(self.driver)
        actions.key_down(Keys.COMMAND if os_name == 'Darwin' else Keys.CONTROL)
        actions.send_keys(key)
        actions.key_up(Keys.COMMAND if os_name == 'Darwin' else Keys.CONTROL)
        actions.perform()
        return self

    @staticmethod
    def get_download_file_pdf():
        download_dir = "tmp/"
        user_downloads = os.path.join(os.environ['USERPROFILE'], 'Downloads')
        files = os.listdir(user_downloads)

        for file in files:
            if file.startswith("Summary"):
                original_path = os.path.join(user_downloads, file)
                new_path = os.path.join(download_dir, "download.pdf")
                if os.path.exists(new_path):
                    os.remove(new_path)
                os.rename(original_path, new_path)
                print(f"PDF saved to: {new_path}")
                break

    @staticmethod
    def read_file_pdf_pages_on(page_number=None):
        pdf_path = 'tmp/download.pdf'
        # Open the PDF file
        with pdfplumber.open(pdf_path) as pdf:
            text = ""
            # Iterate through all the pages
            if int(page_number) is not None and int(page_number) < len(pdf.pages):
                page = pdf.pages[int(page_number)]
                text += page.extract_text()
        print(text)
        return text

    def get_value_in_cover_file_pdf(self, data_pdf=None):
        data_pdf = data_pdf.replace('\r\n', '\n')
        patterns = {
            'patient_id': r'Patient ID:\s*([\w\d]+)',
            'phone_numbers': r'Phone number: \(\+1\) ([\d\–]+)',
            'phone_numbers_referring': r'Phone number: \(\+1\) [\d\–]+\s+\(\+1\) ([\d\–]+)',
            'phone_numbers_interpreting': r'\(\+1\)\s*[\d–]+\s*\(\+1\)\s*[\d–]+\s*\(\+1\)\s*([\d–]+)',
            'referring_physician': r'Patient ID:\s*[\w\d]+\s*(\S+\s+\S+)',
            'interpreting_physician': r'Patient ID:\s*[\w\d]+\s*\S+\s+\S+\s*(.*?)\s*Phone number:',
            'dob': r'DOB: (\d{2}/\d{2}/\d{4})',
            'primary_indication': r'Primary indication:\s*(.*?)\s*Total test duration:',
            'secondary_indication': r'Secondary indication:\s*(.*?)\n(?:Patient medication:|Findings|Total test duration:|Manual events:)',
            'patient_indication': r'Patient indication:\s*(.*)',
            'total_test_duration': r'Total test duration: ([\d\dhms\s]+)',
            'analysis_time': r'Analysis time: ([\d\dhms\s]+)',
            'auto_triggers': r'Auto-triggers: (\d+)',
            'manual_events': r'Manual events: (\d+)',
            'correlated_events': r'Correlated events: (\d+)',
            'physician_notified': r'Physician notified: (\d+ time)',
            'avg_hr': r'Avg\. HR: (\d+ bpm)(?:\s*[@,]|\s|$)',
            'min_hr': r'Min\. HR: (\d+ bpm)\s*@',
            'max_hr': r'Max\. HR: (\d+ bpm)\s*@',
            'time_min_hr': r'Min\. HR: \d+ bpm @(\d{2}:\d{2}:\d{2})',
            'time_max_hr': r'Max\. HR: \d+ bpm @(\d{2}:\d{2}:\d{2})',
            'time_in_afib': r'Time in AFib: ([\w\s]+)',
            'total_afib_episodes': r'Total episodes: (\d+)',
            'avg_hr_afib': r'Average HR: (\w+ bpm|NA)',
            'findings': r'''Findings\s+(?:Heart rate\s+)?
(1\.[^\n]*?)(?:\s+Avg\. HR:\s*\d+\s*bpm)?\s*\n
([\s\S]+?)(?=\n(?:MD signature:|Atrial Fibrillation Summary|Test summary:))
'''
,
        }
        extracted_info = {}
        for key, pattern in patterns.items():
            if key == 'findings':
                match = re.search(pattern, data_pdf, flags=re.DOTALL | re.VERBOSE)
            else:
                match = re.search(pattern, data_pdf, flags=re.DOTALL)
            if match:
                if key == 'findings':
                    findings_text = (match.group(1) + match.group(2)).strip()
                    extracted_info[key] = findings_text
                else:
                    extracted_info[key] = match.group(1).strip()
            else:
                extracted_info[key] = None
        self.logger.info(extracted_info)
        return extracted_info

    def visible_element_on_page(self, element_hide_compare):
        # Restore element visibility
        self.execute_script("arguments[0].style.visibility='visible'", element_hide_compare)

    def get_value_in_summary_file_pdf(self, data_pdf=None):
        patterns = {
            'patient_id': r'Patient ID: (\d+)',
            'dob': r'DOB: (\d{2}/\d{2}/\d{4})',
            'enrollment_period': r'Enrollment period: ([\d/–\s]+)',
            'total_test_duration': r'Total test duration: \s*(.*?)\s*Auto',
            'auto_triggers': r'Auto-triggers: (\d+)',
            'correlated_events': r'Correlated events: (\d+)',
            'analysis_time': r'Analysis time: \s*(.*?)\s*Manual',
            'manual_events': r'Manual events: (\d+)',
            'physician_notified': r'Physician notified: (\d+ times)',
            'brady_total_episodes': r'Total episodes: (\d+)',
            'afib_time_in_afib': r'Time in AFib: \s*(.*?)\s*Total',
            'pause_total_episodes': r'Time in AFib: [\w\s]+ Total episodes: (\d+)',
            'brady_total_duration': r'Total duration: \s*(.*?)\s*Total',
            'afib_total_burden': r'Total burden: ([\d.]+%)',
            'pause_longest_episode': r'Longest episode: ([\w\s]+)\s*Longest',
            'brady_longest_episode': r'Longest episode: ([\w\s]+)\s*Total',
            'total_afib_episodes': r'Total AFib episodes: (\d+)',
            'pause_shortest_episode': r'Shortest episode: ([\w\s]+)\s*Slowest',
            'brady_slowest_hr': r'Slowest heart rate: ([\w\s]+)\s*Longest',
            'afib_longest_espisode': r'Longest espisode: ([\w\s]+)\s*@',
            'afib_longest_espisode_time': r'Longest espisode: [\w\s]+ @(\d{2}:\d{2}:\d{2})',
            'pause_percentage': r'Pause percentage: ([\d.]+%)',
            'tachy_total_episodes': r'Tachycardia[\s\S]*?Total episodes: (\d+)',
            'tachy_total_duration': r'Tachycardia[\s\S]*?Total duration: ([\d, %]+)',
            'tachy_longest_episode': r'Tachycardia[\s\S]*?Longest episode: ([\w\s]+)\s*Pause ',
            'tachy_fastest_hr': r'Fastest heart rate: \s*(.*)',
            'afib_average_hr': r'Average heart rate: (\d+ bpm)',
            'afib_daytime_burden': r'Daytime burden ([\d.]+%)',
            'afib_nighttime_burden': r'Nighttime burden ([\d.]+%)',
            'hr_beats': r'Beats: (\d+ times)',
            'avg_hr': r'Avg\. HR: (\d+ bpm)',
            'min_hr': r'Min\. HR: (\d+ bpm)',
            'max_hr': r'Max\. HR: (\d+ bpm)',
            'time_min_hr': r'Min\. HR: \d+ bpm @(\d{2}:\d{2}:\d{2})',
            'time_max_hr': r'Max\. HR: \d+ bpm @(\d{2}:\d{2}:\d{2})',
            'nighttime_avg': r'Nighttime avg: (\d+ bpm)',
            'daytime_avg': r'Daytime avg: (\d+ bpm)',
            'fastest_ve_run': r'Fastest VE Run: (\d+ bpm)',
            'time_fastest_ve_run': r'Fastest VE Run: \d+ bpm @(\d{2}:\d{2}:\d{2})',
            'fastest_sve_run': r'Fastest SVE Run: (\d+ bpm) @',
            'time_fastest_sve_run': r'Fastest SVE Run: \d+ bpm @(\d{2}:\d{2}:\d{2})',
            'longest_sve_run': r'Longest SVE Run: (\d+ beats)',
            'time_longest_sve_run': r'Longest SVE Run: \d+ beats @(\d{2}:\d{2}:\d{2})',
            'longest_ve_run': r'Longest VE Run: (\d+ beats)',
            'time_longest_ve_run': r'Longest VE Run: \d+ beats @(\d{2}:\d{2}:\d{2})',
            've_couplet': r'VE Couplet: (\d+ times)',
            've_run': r'VE Run: (\d+ times)',
            've_bigeminy': r'VE Bigeminy: (\d+ times)',
            've_trigeminy': r'VE Trigeminy: (\d+ times)',
            've_quadrigeminy': r'VE Quadrigeminy: (\d+ times)',
            'sve_couplet': r'SVE Couplet: (\d+ times)',
            'sve_run': r'SVE Run: (\d+ times)',
            'sve_bigeminy': r'SVE Bigeminy: (\d+ times)',
            'sve_trigeminy': r'SVE Trigeminy: (\d+ times)',
            'sve_quadrigeminy': r'SVE Quadrigeminy: (\d+ times)',
            've_percent': r'VE Percent: ([\d.]+%)',
            'sve_percent': r'SVE Percent: ([\d.]+%)',
            # 'sdnn': r'SDNN: ([\d.]+) ms',
            # 'sdann': r'SDANN: ([\d.]+) ms',
            # 'rmsdd': r'rMSSD: ([\d.]+) ms',
            # 'pnn50': r'pNN50: ([\d.]+%)',
            # 'tp': r'TP: ([\d.]+)',
            # 'vlf': r'VLF: ([\d.]+)',
            # 'lf': r'LF: ([\d.]+)',
            # 'hr': r'HR: ([\d.]+)',
            'second_degree_hb': r'2nd Degree HB: (\d+)',
            'third_degree_hb': r'3rd Degree HB: (\d+)',
        }
        extracted_info = {}
        for key, pattern in patterns.items():
            match = re.search(pattern, data_pdf)
            if match:
                if len(match.groups()) > 1:
                    extracted_info[key] = ' '.join(match.groups()).strip()
                else:
                    extracted_info[key] = match.group(1).strip()
            else:
                extracted_info[key] = None
        self.logger.info(extracted_info)
        return extracted_info

    @staticmethod
    def conversion_total_time(new_time=None, old_time=None):
        # Extract hours, minutes, and seconds from the time string
        time_parts = re.match(r'(?:(\d+)h )?(?:(\d+)m )?(?:(\d+)s)?', old_time).groups()
        hours, minutes, seconds = [int(part) if part else 0 for part in time_parts]
        # Convert all to seconds
        total_seconds = hours * 3600 + minutes * 60 + seconds + new_time
        # Convert back to hours, minutes, seconds
        new_hours = total_seconds // 3600
        total_seconds %= 3600
        new_minutes = total_seconds // 60
        new_seconds = total_seconds % 60
        # Format the new time string
        new_time_str = f"{new_hours}h {new_minutes}m {new_seconds}s"
        return new_time_str

    @staticmethod
    def conversion_duration_time(duration_time=None):
        duration_str = str(duration_time)
        if '.' in duration_str:
            seconds_time = duration_str.split('.')[0]
            seconds_time_1 = duration_str.split('.')[1]
            if int(seconds_time_1) < 5:
                return int(seconds_time)
            elif int(seconds_time_1) >= 5:
                total_time = int(seconds_time) + 1
                return int(total_time)
        else:
            return duration_time

    @staticmethod
    def get_reports_id_notification_events(report=None):
        # Regular expression to match the date range pattern
        pattern = r"^\d{2}/\d{2}/\d{4} - \d{2}/\d{2}/\d{4}$"
        # List comprehension to filter and extract Report IDs
        report_id = [item['Report ID'] for item in report if re.match(pattern, item.get('Date Of Service', ''))]
        return report_id

    @staticmethod
    def export_patient_info_to_excel_file(data):
        file_path = "tmp/patient_info.xlsx"
        # Define the required keys
        required_keys = [
            'Legal First Name', 'Legal Last Name', 'Patient ID', 'Gender',
            'Primary Insurance', 'Date of birth', 'Home', 'Mobile', 'Race', 'Ethnicity'
        ]

        # Ensure all required keys exist in the data; fill missing ones with an empty string
        for key in required_keys:
            if key not in data:
                data[key] = ""

        # Create a DataFrame from the single dictionary and order the columns accordingly
        df = pd.DataFrame([data], columns=required_keys)

        try:
            # Check if the file already exists
            if os.path.exists(file_path):
                try:
                    # Attempt to read existing Excel file
                    existing_df = pd.read_excel(file_path, engine='openpyxl')
                    # Concat old data with new data
                    combined_df = pd.concat([existing_df, df], ignore_index=True)
                except Exception as e:
                    # If the file is corrupted (missing 'xl/sharedStrings.xml'), recreate the file
                    if "xl/sharedStrings.xml" in str(e):
                        print("Existing file is corrupted or not valid. Creating new file.")
                        combined_df = df
                    else:
                        raise e

                # Write the combined DataFrame back to Excel
                combined_df.to_excel(file_path, index=False, engine='openpyxl')
            else:
                # If the file doesn't exist, just write the new DataFrame
                df.to_excel(file_path, index=False, engine='openpyxl')

            print(f"✅ Exported successfully to {file_path}")
        except Exception as e:
            print(f"Error exporting to Excel: {e}")

    @staticmethod
    def export_to_excel_file_medication(output):
        """
        Export medication info to an Excel file, appending if it already exists
        or creating it if it does not.
        """
        file_path = 'tmp/medication_info.xlsx'

        # Convert output to a DataFrame, with columns in a specified order
        df = pd.DataFrame([output], columns=['Medication name', 'Notes', 'Patient ID'])

        try:
            if os.path.exists(file_path):
                try:
                    # Attempt to read the existing Excel file
                    existing_df = pd.read_excel(file_path, engine='openpyxl')
                    # Append (concat) new rows
                    combined_df = pd.concat([existing_df, df], ignore_index=True)
                except Exception as e:
                    # Check for a known openpyxl corruption error
                    if "xl/sharedStrings.xml" in str(e):
                        print("Existing file is corrupted or invalid. Creating new file.")
                        combined_df = df
                    else:
                        # Re-raise if it's another kind of error
                        raise e

                # Write back to the same file path
                combined_df.to_excel(file_path, index=False, engine='openpyxl')
            else:
                # If file doesn't exist, just write the new data
                df.to_excel(file_path, index=False, engine='openpyxl')

            print(f"✅ Exported successfully to {file_path}")
        except Exception as e:
            print(f"Error exporting medication info to Excel: {e}")

    @staticmethod
    def export_to_excel_file_allergy(output):
        """
        Export allergy info to an Excel file, appending if it already exists
        or creating it if it does not.
        """
        file_path = 'tmp/allergy_info.xlsx'

        # Convert output to a DataFrame, ensuring the columns are in the desired order
        df = pd.DataFrame([output], columns=['Patient ID', 'Allergy name'])

        try:
            if os.path.exists(file_path):
                try:
                    # Attempt to read the existing Excel file
                    existing_df = pd.read_excel(file_path, engine='openpyxl')
                    # Concatenate new rows with existing rows
                    combined_df = pd.concat([existing_df, df], ignore_index=True)
                except Exception as e:
                    # Check specifically for a known openpyxl corruption error
                    if "xl/sharedStrings.xml" in str(e):
                        print("Existing file is corrupted or invalid. Creating new file.")
                        combined_df = df
                    else:
                        # Re-raise any other error
                        raise e

                # Write the combined DataFrame back to the Excel file
                combined_df.to_excel(file_path, index=False, engine='openpyxl')
            else:
                # If the file doesn't exist, simply write a new file with the current data
                df.to_excel(file_path, index=False, engine='openpyxl')

            print(f"✅ Exported successfully to {file_path}")
        except Exception as e:
            print(f"Error exporting allergy info to Excel: {e}")

    @staticmethod
    def export_to_excel_file_diagnosis(output):
        """
        Export diagnosis info to an Excel file, appending if it already exists
        or creating it if it does not. Also ensures the DataFrame has all the
        expected columns.
        """
        # Define expected columns
        expected_columns = [
            'Diagnosis code',
            'Status',
            'Type',
            'Date of Diagnosis',
            'Notes',
            'Patient ID'
        ]

        # Convert output to DataFrame
        df = pd.DataFrame([output])

        # Identify which expected columns are missing in the DataFrame
        missing_columns = [col for col in expected_columns if col not in df.columns]

        # Add missing columns with NaN (or empty string if preferred)
        for col in missing_columns:
            df[col] = None

        # Reorder columns to match the expected structure
        df = df[expected_columns]

        # Path to the Excel file
        file_path = 'tmp/diagnosis_info.xlsx'

        try:
            if os.path.exists(file_path):
                try:
                    # Read existing file
                    existing_df = pd.read_excel(file_path, engine='openpyxl')
                    # Concat with new data
                    combined_df = pd.concat([existing_df, df], ignore_index=True)
                except Exception as e:
                    # If the file is missing sharedStrings.xml, it is likely corrupted
                    if "xl/sharedStrings.xml" in str(e):
                        print("Existing file is corrupted or invalid. Creating new file.")
                        combined_df = df
                    else:
                        raise e

                # Write the combined DataFrame back to Excel
                combined_df.to_excel(file_path, index=False, engine='openpyxl')
            else:
                # If no file exists, create a new one with the current data
                df.to_excel(file_path, index=False, engine='openpyxl')

            print(f"✅ Exported to {file_path} successfully!")
        except Exception as e:
            print(f"Error exporting diagnosis info to Excel: {e}")

    @staticmethod
    def export_to_excel_file_address(output):
        """
        Export address info to an Excel file, appending if it already exists
        or creating it if it does not.
        """

        file_path = 'tmp/address_info.xlsx'
        required_columns = [
            'Patient ID',
            'Email',
            'Address line 1',
            'Address line 2',
            'ZIP code',
            'City',
            'State'
        ]

        # Convert the output to a DataFrame and ensure the columns are in the correct order
        df = pd.DataFrame([output], columns=required_columns)

        try:
            if os.path.exists(file_path):
                try:
                    # Read the existing Excel file
                    existing_df = pd.read_excel(file_path, engine='openpyxl')
                    # Concatenate old and new data
                    combined_df = pd.concat([existing_df, df], ignore_index=True)
                except Exception as e:
                    # If file is missing sharedStrings.xml, treat it as corrupted
                    if "xl/sharedStrings.xml" in str(e):
                        print("Existing file is corrupted or invalid. Creating new file.")
                        combined_df = df
                    else:
                        raise e
                # Write the combined data back to Excel
                combined_df.to_excel(file_path, index=False, engine='openpyxl')
            else:
                # If file does not exist, create a new one
                df.to_excel(file_path, index=False, engine='openpyxl')

            print(f"✅ Exported successfully to {file_path}")
        except Exception as e:
            print(f"Error exporting address info to Excel: {e}")

    def click_chart_alert_icon(self):
        # Check if the shadow root exists and get it
        popover_exists = self.execute_script('''
            let banner = document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner");
            if (!banner) return false;
            let shadowRoot = banner.shadowRoot;
            let popover = shadowRoot.querySelector("div.fe_c_popup__tooltip.pb_c_chart-alert__chart-alert-popover");
            return popover && window.getComputedStyle(popover).display !== 'none';
        ''')

        if not popover_exists:
            print("Popover not found or not visible.")
            return

        # Click the Chart Alert Icon inside shadowRoot if needed
        clicked = self.execute_script('''
            let banner = document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner");
            if (!banner) return false;
            let shadowRoot = banner.shadowRoot;
            let chartAlertIcon = shadowRoot.querySelector("span.pb_c_chart-alert__chart-alert-icon.pb_c_chart-alert__chart-alert-icon--can-open");
            if (chartAlertIcon) {
                chartAlertIcon.click();
                return true;
            }
            return false;
        ''')

        if clicked:
            print("Chart Alert icon clicked.")
        else:
            print("Chart Alert icon not found.")

    def get_element_race_ethnicity(self):
        shadow_root = self.execute_script('return document.querySelector("#new-demographics-section").shadowRoot')
        try:
            race_elem = shadow_root.find_element(By.CSS_SELECTOR, '#RACEID p.fe_c_read-only-input__text')
        except Exception:
            race_elem = None
        try:
            eth_elem = shadow_root.find_element(By.CSS_SELECTOR, '#ETHNICITYID p.fe_c_read-only-input__text')
        except Exception:
            eth_elem = None
        return race_elem, eth_elem

    def get_element_phone_number(self):
        shadow_phone_number = self.execute_script(
            'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot'
        )
        element = shadow_phone_number.find_element(By.CSS_SELECTOR,
                                                   "div.pb_c_modular-data-module__value > a.pb_c_modular-data-module__value-href > div")
        return element

    def get_element_mobile(self):
        # Get the shadow root first
        shadow_root = self.execute_script(
            'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot'
        )

        # Find the popover containing the phone numbers
        element = shadow_root.find_element(By.CSS_SELECTOR, ".pb_c_universal-popover__three-columns")

        return element

    def get_element_home(self):
        shadow_home = self.execute_script('return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot')
        element = shadow_home.find_element(By.CSS_SELECTOR, "div:nth-child(2) > div.pb_c_patient-contact-popover__section-label")
        return element

    def get_element_allergy(self):
        shadow_home = self.browser.select("div.active-historical-content.active-historical-status-active-list > ul > li > div.accordion-trigger.clickable.name > div > span")
        text_contents = [element.get_text() for element in shadow_home]
        return text_contents

    def get_element_date_of_birth(self):
        shadow_date_of_birth = self.execute_script('return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot')
        element = shadow_date_of_birth.find_element(By.CSS_SELECTOR, "span:nth-child(2)")
        return element

    def get_element_medication(self, element, class_selector_element):
        element = element.find_element(By.CSS_SELECTOR, f"{class_selector_element}")
        return element

    def get_element_js_path(self, js_path=None, js_path_children=None):
        shadow_js_path = self.execute_script(f'return {js_path}')
        element = shadow_js_path.find_element(By.CSS_SELECTOR, f'{js_path_children}')
        return element

    def get_element_first_name(self):
        shadow_first_name = self.execute_script('return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot')
        element = shadow_first_name.find_element(By.CSS_SELECTOR, "div.pb_c_patient-banner-component__first-name")
        return element

    @staticmethod
    def format_datetime_to_yyyymmdd(datetime_str):
        if datetime_str != '':
            datetime_obj = datetime.strptime(datetime_str, "%m-%d-%Y")
            formatted_date = datetime_obj.strftime("%Y/%m/%d")
            return formatted_date
        else:
            return datetime_str

    def close_the_popup(self):
        try:
            alert = self.driver.switch_to.alert
            alert.accept()  # Use dismiss() if you want to cancel the popup
        except NoAlertPresentException:
            print("No popup to close")

    def hover_and_click(self, locator_or_element, is_scroll=False, hold_ctrl=False):
        """
        Hover to an element or a list of elements, hold Ctrl if specified, and click each element
        :param locator_or_element: (str) locator format, (WebElement) web element, or (list) of WebElements
        :param is_scroll: (boolean) scroll element into view before action
        :param hold_ctrl: (boolean) hold Ctrl key during click
        :return: self
        """
        if isinstance(locator_or_element, list):
            if not locator_or_element:
                raise ValueError("The passed list of elements is empty.")
            elements = locator_or_element
        else:
            element = self._get_element(
                locator_or_element,
                explicit_func=self.wait_presence_of_element_located,
                error_msg=f'Element is not present to hover and click @ `{locator_or_element}`'
            )
            elements = [element]
        action_chains = ActionChains(self.driver)
        for element in elements:
            if is_scroll:
                self.scroll_into_view(element)
            self.logger.info(f'Hover to element `{element}` and clicking it with Ctrl={hold_ctrl}')
            action_chains.move_to_element(element)  # Hover
            if hold_ctrl:
                action_chains.key_down(Keys.CONTROL).click(element).key_up(Keys.CONTROL)
            else:
                action_chains.click(element)
            action_chains.perform()
            action_chains.reset_actions()

        return self

    def open_brower_by_cookies_file(self):
        base_path = os.path.dirname(os.path.abspath(__file__))
        relative_path = os.path.normpath(os.path.join(base_path,"..", "tmp/cookies.json"))
        relative_path = relative_path.replace("\\", "/")
        with open(relative_path, "r") as file:
            cookies = json.load(file)
            for cookie in cookies:
                try:
                    self.driver.add_cookie(cookie)
                except Exception as e:
                    print(f"Error adding cookie {cookie['name']}: {e}")
        self.driver.refresh()

    def get_inner_text(self, locator_or_element):
        """
        Get full text of an element, including text inside <a> tags
        :param locator_or_element: (str) locator format or (WebElement) web element
        :return: (str) the full text of the element
        """
        element = self._get_element(locator_or_element, explicit_func=self.wait_presence_of_element_located,
                                    error_msg=f'Element is not present to get text @ `{locator_or_element}`')
        return element.get_attribute("innerText").strip()

    def reload_page(self, wait_time=5):
        self.driver.refresh()
        time.sleep(wait_time)

    def is_element_visible(self, locator, timeout=5):
        try:
            self.browser.wait_visibility_of_element_located(locator, timeout=timeout)
            return True
        except Exception:
            return False