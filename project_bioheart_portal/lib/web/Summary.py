#!/usr/bin/env python3

try:
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import summary as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Summary(WebPage):

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_menu(self, item):
        self.browser.wait_visibility_of_element_located(self.LCT.SUM_MENU)
        self.browser.clicks(self.LCT.SUM_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == item.lower(),
                            stop_on_first=True)

    def get_timeframe_items(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUM_TIMEFRAME)
        return self.browser.get_texts(self.LCT.SUM_TIMEFRAME)

    def click_on_the_timeframe(self, time):
        self.browser.wait_visibility_of_element_located(self.LCT.SUM_TIMEFRAME)
        self.browser.clicks(self.LCT.SUM_TIMEFRAME,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == time.lower(),
                            stop_on_first=True)

    def get_summary_heart_rate(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUM_HR_HEADER)
        header = self.browser.get_texts(self.LCT.SUM_HR_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.SUM_HR_CONTENT, row=1)

    def get_about_summary(self):
        self.browser.wait_visibility_of_element_located(self.LCT.SUM_ABOUT_TITLE)
        title = ["about title", "about content"]
        content = [self.browser.get_text(self.LCT.SUM_ABOUT_TITLE),
                   self.browser.get_text(self.LCT.SUM_ABOUT_CONTENT)]
        return dict(zip(title, content))

    def get_infor_summary_actives_minutes(self):
        self.browser.wait_visibility_of_element_located(self.LCT.SUM_AM_HEADER)
        header = self.browser.get_texts(self.LCT.SUM_AM_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.SUM_AM_VALUE, row=1)
