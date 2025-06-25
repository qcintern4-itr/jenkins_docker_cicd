#!/usr/bin/env python3

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
        self.browser.click(self.LCT.SP_SENDSUPPORT)
        if facility:
            self.browser.input_text(self.LCT.SEND_FACILITY + '//input', facility)
            self.browser.wait_visibility_of_element_located(self.LCT.SEND_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.SEND_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if support:
            self.browser.input_text(self.LCT.SEND_SUPPORT + '//input', support)
            self.browser.wait_visibility_of_element_located(self.LCT.SEND_SUPPORT_OPTIONS)
            self.browser.clicks(self.LCT.SEND_SUPPORT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == support.lower(),
                                stop_on_first=True)
        if email:
            self.browser.input_text(self.LCT.SEND_EMAIL, email)
        if message:
            self.browser.input_text(self.LCT.SEND_MESSAGE, message)
        if is_send:
            self.browser.click(self.LCT.SEND_SEND)
