#!/usr/bin/env python3

try:
    from model_btcy.WebPageModel import WebPageModel
    from project_bioflux_clinic_portal.lib import ConfigHandler

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class WebPage(WebPageModel):

    def __init__(self, browser, env, locators):
        super().__init__(project_name='bioflux_clinic', browser=browser, env=env, locators=locators)
        self.cfg = ConfigHandler.ConfigHandler(self.env)
        self.URL = self.cfg.params.get('WEB_BASE_URL')

    def _ok_attention_if_any(self, timeout=5):
        if self.browser.wait_visibility_of_element_located('class:modal-content', timeout=timeout):
            self.browser.click('xpath://div[@class="modal-content"]//span[text()="OK"]')
