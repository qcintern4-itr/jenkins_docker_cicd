#!/usr/bin/env python3
import time

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import support as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Support(WebPage):
    """
    Handle Support page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_support(self):
        self.browser.open_page(self.URL + '/support')

    def send_support_message(self, facility=None, support=None, email=None, message=None, is_send=True):
        # Wait for API loading
        self.browser.wait_visibility_of_element_located(self.LCT.SUPPORT_LOADING)
        self.browser.wait_invisibility_of_element_located(self.LCT.SUPPORT_LOADING)

        self.browser.wait_visibility_of_element_located(self.LCT.SP_SENDSUPPORT)
        self.browser.click(self.LCT.SP_SENDSUPPORT)
        if facility:
            self.browser.input_text(self.LCT.SEND_FACILITY + '//input', facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEND_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.SEND_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if support:
            self.browser.input_text(self.LCT.SEND_SUPPORT + '//input', support)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEND_SUPPORT_OPTIONS)
            self.browser.clicks(self.LCT.SEND_SUPPORT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == support.lower(),
                                stop_on_first=True)
        if email:
            self.browser.wait_visibility_of_element_located(self.LCT.SEND_EMAIL)
            self.browser.input_text(self.LCT.SEND_EMAIL, email)
        if message:
            self.browser.input_text(self.LCT.SEND_MESSAGE, message)
        if is_send:
            self.browser.click(self.LCT.SEND_SEND)

    def navigate_filter_support(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_SUPPORT)
        self.browser.click(self.LCT.FILTER_SUPPORT)

    def verify_options_filter_support(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_OPENS_OPTIONS)
        element1 = self.browser.get_element(self.LCT.FILTER_OPENS_OPTIONS)
        assert element1.is_displayed()
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_RESOLVED_OPTIONS)
        element2 = self.browser.get_element(self.LCT.FILTER_RESOLVED_OPTIONS)
        assert element2.is_displayed()
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_WEB_OPTIONS)
        element3 = self.browser.get_element(self.LCT.FILTER_WEB_OPTIONS)
        assert element3.is_displayed()
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_OTHERS_OPTIONS)
        element4 = self.browser.get_element(self.LCT.FILTER_OTHERS_OPTIONS)
        assert element4.is_displayed()

    def enable_status_open_support(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_OPENS_OPTIONS)
        self.browser.clicks(self.LCT.FILTER_OPENS_OPTIONS)
        self.browser.wait_visibility_of_element_located(self.LCT.BUTTON_APPLY)
        self.browser.clicks(self.LCT.BUTTON_APPLY)

    def disbale_status_open_support(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_OPENS_OPTIONS)
        self.browser.clicks(self.LCT.FILTER_OPENS_OPTIONS)

    def enable_status_web_support(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_WEB_OPTIONS)
        self.browser.clicks(self.LCT.FILTER_WEB_OPTIONS)
        self.browser.wait_visibility_of_element_located(self.LCT.BUTTON_APPLY)
        self.browser.clicks(self.LCT.BUTTON_APPLY)

    def disbale_status_web_support(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FILTER_WEB_OPTIONS)
        self.browser.clicks(self.LCT.FILTER_WEB_OPTIONS)