#!/usr/bin/env python3

try:
    from model_btcy.WebPageModel import WebPageModel
    from project_cardiac_portal.lib import ConfigHandler

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class WebPage(WebPageModel):

    def __init__(self, browser, env, locators):
        super().__init__(project_name='cardiac_portal', browser=browser, env=env, locators=locators)
        self.cfg = ConfigHandler.ConfigHandler(self.env)
        self.URL = self.cfg.params.get('WEB_BASE_URL')

    def get_user_role(self):
        return self.browser.execute_script('return window.localStorage.getItem("roles")')
