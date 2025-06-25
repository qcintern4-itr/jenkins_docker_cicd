#!/usr/bin/env python3

try:
    from project_biodirect_portal.lib.WebPage import WebPage
    from project_biodirect_portal.config.web_locators import common as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):

    ROBOT_LIBRARY_COPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_biodirect_sign_in_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL + '/login')
            self.browser.wait_presence_of_element_located(self.LCT.VERSION)
            version = self.browser.get_text(self.LCT.VERSION).split()[-1][1:]
        finally:
            return version
