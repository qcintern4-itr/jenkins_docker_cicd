#!/usr/bin/env python3

try:
    from model_btcy.WebPageModel import WebPageModel
    from project_admin_portal.lib import ConfigHandler

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class WebPage(WebPageModel):

    def __init__(self, browser, env, locators):
        super().__init__(project_name='admin_portal', browser=browser, env=env, locators=locators)
        self.afg = ConfigHandler.ConfigHandler(self.env)
        self.URL = self.afg.params.get('WEB_BASE_URL')
