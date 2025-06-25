#!/usr/bin/env python3
import time

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import common as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    """
    Handle login page, left-hand-side main menu and common headers
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def sign_in_cardiac(self, username, password):
        self.browser.open_page(self.URL)
        if not self.browser.wait_url_matches(r'^https:[/][/].*[/]sign-in', timeout=10):
            raise Exception(f'Redirecting to login page got issue, current url: {self.browser.driver.current_url}')
        self.browser.input_text(self.LCT.USERNAME, username)
        self.browser.input_text(self.LCT.PASSWORD, password, is_text_logged=False)
        self.browser.click(self.LCT.SIGNIN)
        if self.browser.wait_visibility_of_element_located('class:app-container', timeout=60):
            self.browser.click(self.LCT.ICONSHORTCUT)
            self.browser.switch_tab()
            return ''.join([dic['value'] for dic in self.browser.get_all_cookies() if dic['name'].endswith(
                'accessToken')])

        return self.browser.get_text(self.LCT.ERRORMESSAGE)

    def get_release_version(self):
        version = 'undetected'
        try:
            version = self.browser.get_text(self.LCT.BF_RELEASE_VERSION).split()[1]
        finally:
            return version

    def toggle_cardiac_menu(self, item, expand_or_collapse):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU_ITEMS)
        menu_elements = [element for element in self.browser.get_elements(self.LCT.MENU_ITEMS)
                         if self.browser.get_text(element).lower() == item.lower()]
        if not menu_elements:
            raise Exception(f'Item `{item}` not found.')
        value = {
            'expand': 'true',
            'collapse': 'false'
        }[expand_or_collapse]
        if self.browser.get_attribute_value(menu_elements[0], 'aria-expanded') != value:
            self.browser.click(menu_elements[0])

    def expand_cardiac_menu(self, item):
        self.toggle_cardiac_menu(item, 'expand')

    def collapse_cardiac_menu(self, item):
        self.toggle_cardiac_menu(item, 'collapse')

    def select_cardiac_menu(self, menu_path):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU_ITEMS)
        menu_item, submenu_item = Utils.parse_key_value(menu_path, '>')
        if not submenu_item:
            self.browser.clicks(self.LCT.MENU_ITEMS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == menu_item.lower(),
                                stop_on_first=True)
            return
        self.expand_cardiac_menu(menu_item)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMENU_ITEMS)
        menu_element = self.browser.get_elements_by_condition(
            self.LCT.MENU_ITEMS + '/..',  # upper element
            on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(menu_item.lower()),
            stop_on_first=True
        )[0]
        child_element = [element for element in self.browser.get_child_elements(menu_element, self.LCT.SUBMENU_ITEMS)
                         if self.browser.get_text(element).lower() == submenu_item.lower()][0]
        self.browser.click(child_element)

    def select_clinic(self, clinic, text_search=None):
        if text_search:
            self.browser.input_text(self.LCT.CLINIC_INPUT, text_search)
        else:
            self.browser.click(self.LCT.CLINIC_AREA)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CLINIC_OPTIONS)
        self.browser.clicks(self.LCT.CLINIC_OPTIONS, on_elements=lambda _, e: self.browser.get_text(e) == clinic,
                            stop_on_first=True)

    def get_page_header(self):
        return self.browser.get_text(self.LCT.PAGEHEADER)

    def get_success_message(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BOTTOM_SUCCESSMESSAGE)
        return self.browser.get_text(self.LCT.BOTTOM_SUCCESSMESSAGE)

    def get_error_message(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BOTTOM_ERRMESSAGE)
        return self.browser.get_text(self.LCT.BOTTOM_ERRMESSAGE)

    def get_confirmation_message(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CONFIRM_MSG + '/div')
        return self.browser.get_text(self.LCT.CONFIRM_MSG + 'div[@class="confirmation-layout-body"]')

    def navigate_to_patient_details_bao (self, phone_number):
        self.browser.wait_visibility_of_element_located(self.LCT.click_menu_patient )
        self.browser.click(self.LCT.click_menu_patient)
        time.sleep(5)
        self.browser.wait_visibility_of_element_located(self.LCT.click_filter)
        time.sleep(5)
        self.browser.click(self.LCT.click_filter)
        self.browser.wait_visibility_of_element_located(self.LCT.click_filter_phonenumber)
        time.sleep(5)
        self.browser.click(self.LCT.click_filter_phonenumber)
        self.browser.wait_visibility_of_element_located(self.LCT.click_textbox_search)
        self.browser.click(self.LCT.click_textbox_search)
        self.browser.input_text(self.LCT.click_textbox_search, phone_number)
        time.sleep(5)
        self.browser.click(self.LCT.click_patient_details)
        time.sleep(5)
        self.browser.click(self.LCT.click_view_programinfo)
        time.sleep(10)

    def navigate_to_filter_menu_patient (self, programtype):
        self.browser.wait_visibility_of_element_located(self.LCT.click_menu_patient )
        self.browser.click(self.LCT.click_menu_patient)
        time.sleep(5)
        self.browser.click(self.LCT.button_filter)
        self.browser.wait_visibility_of_element_located(self.LCT.button_filter )
        time.sleep(5)
        self.browser.click(self.LCT.checkbox_ccm_rpm)
        time.sleep(5)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.checkbox_ccm_rpm)
        self.browser.clicks(
                self.LCT.checkbox_ccm_rpm,
                on_elements=lambda _, e: self.browser.get_text(
                    e.find_element(BY_MAP ['xpath'], './span[last()]')).lower() == programtype.lower(),
                stop_on_first=True
            )

    def get_capture_detail_info(self):
        time.sleep(5)
        output = {
            "PatienName": self.browser.get_text(self.LCT.patient_name),
            "ProgramID": self.browser.get_text(self.LCT.program_ID),
            "Email": self.browser.get_text(self.LCT.email),
            "Facility": self.browser.get_text(self.LCT.Facility),
        }
        return  output
