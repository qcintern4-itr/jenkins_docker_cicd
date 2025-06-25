#!/usr/bin/env python3

try:
    from project_bioheart_ecommerce.lib.WebPage import WebPage
    from project_bioheart_ecommerce.config.web_locators import common as locators
    from selenium.webdriver import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    """
    Handle home store, login.....
    """

    ROBOT_LIBRARY_COPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_bioheart_ecommerce_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL + '/home')
            version = self.browser.get_text(self.LCT.RELEASE_VERSION).split()[1]
        finally:
            return version
