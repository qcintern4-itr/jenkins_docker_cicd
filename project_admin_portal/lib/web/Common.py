#!/usr/bin/env python3

try:
    from project_admin_portal.lib.WebPage import WebPage
    from project_admin_portal.config.web_locators import common as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    """
    Handle login page,..
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_admin_sign_in_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL + '/login')
            version = self.browser.get_text('class:credit-v2').split()[-1][1:]
        finally:
            return version

    def sign_in_admin(self, username, password):
        self.browser.input_text(self.LCT.AP_USERNAME, username)
        self.browser.input_text(self.LCT.AP_PASSWORD, password)
        self.browser.click(self.LCT.AP_SIGNIN)
        if not self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU_ITEMS, timeout=10):
            raise Exception('Login is not successfully')

    def sign_out(self):
        self.browser.click(self.LCT.MENU_AVATAR)
        self.browser.wait_visibility_of_element_located(self.LCT.MENU_AVATAR_SIGNOUT)
        self.browser.click(self.LCT.MENU_AVATAR_SIGNOUT)

    def select_admin_menu(self, menu):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU_ITEMS)
        self.browser.clicks(self.LCT.MENU_ITEMS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == menu.lower(),
                            stop_on_first=True)
