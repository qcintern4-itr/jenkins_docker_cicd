#!/usr/bin/env python3

try:
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import common as locators
    from selenium.webdriver import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):

    """
    Handle login page, ...
    """

    ROBOT_LIBRARY_COPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_bioheart_sign_in_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL + '/login')
            version = self.browser.get_text(self.LCT.RELEASE_VERSION).split()[-1][1:]
        finally:
            return version

    def sign_in_bioheart_portal(self, email, password):
        self.browser.input_text(self.LCT.EMAIL, email)
        self.browser.input_text(self.LCT.PASSWORD, password)
        self.browser.click(self.LCT.SIGNIN)
        self.browser.wait_invisibility_of_element_located(self.LCT.SIGNIN)

    def navigate_to(self, menu):
        self.browser.clicks(self.LCT.MENU,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == menu.lower(),
                            stop_on_first=True)

    def create_account(self, first_name=None, last_name=None, email=None, is_next=True,
                       password=None, confirm_password=None, is_finish=True, is_visibility=False,
                       is_back=False, is_close=False):
        self.browser.open_page(self.cfg.params['WEB_BASE_URL'])
        self.browser.js_click(self.LCT.CREATE_ACCOUNT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NEXT)
        if first_name:
            self.browser.input_text(self.LCT.FIRSTNAME, first_name)
        if last_name:
            self.browser.input_text(self.LCT.LASTNAME, last_name)
        if email:
            self.browser.input_text(self.LCT.EMAIL_CREATE_ACCOUNT, email)
        if is_next:
            self.browser.js_click(self.LCT.NEXT)
        if password:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PASSWORD_CREATE_ACCOUNT)
            self.browser.input_text(self.LCT.PASSWORD_CREATE_ACCOUNT, password)
        if confirm_password:
            self.browser.input_text(self.LCT.CONFIRM_PASSWORD, confirm_password)
        if is_finish:
            self.browser.click(self.LCT.FINISH)
        if is_visibility:
            self.browser.clicks(self.LCT.VISIBILITY_PASS)
        if is_back:
            self.browser.click(self.LCT.BACK)
        if is_close:
            self.browser.click(self.LCT.CLOSE)

    def forgot_password(self, email=None, send_request=True, verify_code=None,
                        password=None, confirm_password=None, is_visibility=False, is_update=True, is_close=False):
        self.browser.open_page(self.cfg.params['WEB_BASE_URL'])
        self.browser.js_click(self.LCT.FORGOT_PASSWORD)
        if not self.browser.wait_visibility_of_element_located(self.LCT.EMAIL_CREATE_ACCOUNT):
            self.browser.js_click(self.LCT.FORGOT_PASSWORD)
        if email:
            self.browser.wait_visibility_of_element_located(self.LCT.EMAIL_CREATE_ACCOUNT)
            self.browser.input_text(self.LCT.EMAIL_CREATE_ACCOUNT, email)
        if send_request:
            self.browser.click(self.LCT.SEND_REQUEST)
        if verify_code:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UPDATE_PASS)
            self.browser.input_text(self.LCT.VERIFY_CODE, verify_code)
        if password:
            self.browser.input_text(self.LCT.PASSWORD, password)
        if confirm_password:
            self.browser.wait_visibility_of_element_located(self.LCT.CONFIRM_PASSWORD)
            self.browser.clear_text(self.LCT.CONFIRM_PASSWORD)
            self.browser.input_text(self.LCT.CONFIRM_PASSWORD, confirm_password, is_clear=False)
        if is_visibility:
            self.browser.clicks(self.LCT.VISIBILITY_PASS)
        if is_update:
            self.browser.click(self.LCT.UPDATE_PASS)
        if is_close:
            self.browser.click(self.LCT.CLOSE)

    def sign_out_bioheart_portal(self, confirm_signout=True, is_cancel=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SIGNOUT)
        self.browser.click(self.LCT.SIGNOUT)
        if confirm_signout:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CONFIRM_SIGNOUT)
            self.browser.click(self.LCT.CONFIRM_SIGNOUT)
        if is_cancel:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CANCEL_SIGOUT)
            self.browser.click(self.LCT.CANCEL_SIGOUT)

    def page_is_on_screen(self):
        screens = [self.LCT.CHANGE_PASS_TITLE, self.LCT.EDIT_PROF_TITLE, self.LCT.PROF_TITLE, self.LCT.SET_TITLE,
                   self.LCT.FORGOT_PASS_TITLE, self.LCT.SIGNIN_TITLE, self.LCT.CREATE_ACCOUNT_TITLE,
                   self.LCT.UPDATE_PASS_TITLE, self.LCT.OVERVIEW_TITLE]
        for lct in screens:
            if self.browser.wait_visibility_of_element_located(lct, timeout=1):
                return self.browser.get_text(lct).lower()

    def get_error_message(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ERROR_MESSAGE)
        return self.browser.get_text(self.LCT.ERROR_MESSAGE)

    def get_notification_massage(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NOTICE_DESCRIPTION)
        return self.browser.get_text(self.LCT.NOTICE_DESCRIPTION)
