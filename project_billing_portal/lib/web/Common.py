#!/usr/bin/env python3

try:
    from project_billing_portal.lib.WebPage import WebPage
    from project_billing_portal.config.web_locators import common as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):

    """
    Handle sign in page and common functions
    """

    ROBOT_LIBRARY_COPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_billing_sign_in_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL + '/login')
            version = self.browser.get_text('class:credit').split()[-1][1:]
        finally:
            return version
