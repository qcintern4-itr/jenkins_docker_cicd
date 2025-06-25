#!/usr/bin/env python3

try:
    from project_qms_portal.lib.WebPage import WebPage
    from project_qms_portal.config.web_locators import common as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_qms_portal(self):
        self.browser.open_page(self.URL)
        version = 'undetected'
        try:
            version = self.browser.get_text(self.LCT.LOGIN_RELEASE).split()[-1][1:]
        finally:
            return version
