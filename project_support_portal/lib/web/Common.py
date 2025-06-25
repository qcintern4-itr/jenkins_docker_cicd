#!/usr/bin/env python3

try:
    from project_support_portal.lib.WebPage import WebPage
    from project_support_portal.config.web_locators import common as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    """
    Handle login page, ...
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_support_portal_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL + '/login')
            version = self.browser.get_text(self.LCT.RELEASE_VERSION).split()[-1][1:]
        finally:
            return version

    def navigate_to_digitalization_portal(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL_DGT + '/login')
            version = self.browser.get_text(self.LCT.RELEASE_VERSION_DIGITALIZATION).split()[-1][1:]
        finally:
            return version

    def sign_in_digitalization_portal(self, username, password):
        self.browser.input_text(self.LCT.USERNAME, username)
        self.browser.input_text(self.LCT.PASSWORD, password)
        self.browser.click(self.LCT.SIGNIN)
        self.browser.wait_invisibility_of_element_located(self.LCT.SIGNIN)

    def sign_out_digitalization_portal(self):
        self.browser.click(self.LCT.PROFILE_LINK)
        self.browser.click(self.LCT.SIGNOUT)

    def page_digitalization_sign_in_successfully(self):
        return self.browser.wait_visibility_of_element_located(self.LCT.NEXT)

    def get_error_message(self):
        return self.browser.get_text(self.LCT.ERROR_MESSAGE)

    def get_purpose_status(self):
        pass

