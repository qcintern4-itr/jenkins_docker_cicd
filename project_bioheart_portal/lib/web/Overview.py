#!/usr/bin/env python3

try:
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import overview as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Overview(WebPage):

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def get_heart_rate_infor(self):
        self.browser.wait_visibility_of_element_located(self.LCT.HR_DATE)
        header = ["date", "heart rate"]
        content = [self.browser.get_text(self.LCT.HR_DATE),
                   self.browser.get_text(self.LCT.HR_NO).replace('\n', ' ').strip()]
        return dict(zip(header, content))

    def get_heart_rate_variability_infor(self):
        self.browser.wait_visibility_of_element_located(self.LCT.HRV_TAG_CONTENT)
        header = ["date", "hrv", "tag content", "color"]
        content = [self.browser.get_text(self.LCT.HRV_DATE),
                   self.browser.get_text(self.LCT.HRV_NUMBER).replace('\n', ' ').strip(),
                   self.browser.get_text(self.LCT.HRV_TAG_CONTENT),
                   self.browser.get_css_property_value(self.LCT.HRV_TAG, 'background-color')]
        return dict(zip(header, content))

    def get_resting_heart_rate_infor(self):
        self.browser.wait_visibility_of_element_located(self.LCT.RHR_HEART_RATE)
        header = ["date", "heart rate", "tag content", "color"]
        content = [self.browser.get_text(self.LCT.RHR_DATE),
                   self.browser.get_text(self.LCT.RHR_HEART_RATE).replace('\n', ' ').strip(),
                   self.browser.get_text(self.LCT.RHR_TAG_CONTENT),
                   self.browser.get_css_property_value(self.LCT.RHR_TAG, 'background-color')]
        return dict(zip(header, content))

    def get_active_minute_infor(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AM_HEART_RATE)
        header = ["date", "active minute", "heart rate"]
        content = [self.browser.get_text(self.LCT.AM_DATE),
                   self.browser.get_text(self.LCT.AM_NO).replace('\n', ' ').strip(),
                   self.browser.get_text(self.LCT.AM_HEART_RATE).replace('\n', ' ').strip()]
        return dict(zip(header, content))

    def get_welcome_banner(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BANNER_TITLE)
        key = ["date", "title", "description"]
        value = [self.browser.get_text(self.LCT.OVERVIEW_DATETIME), self.browser.get_text(self.LCT.BANNER_TITLE),
                 self.browser.get_text(self.LCT.BANNER_DESCRIPTION)]
        return dict(zip(key, value))
