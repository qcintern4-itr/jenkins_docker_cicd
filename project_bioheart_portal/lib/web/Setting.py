#!/usr/bin/env python3

try:
    import time
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import setting as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Setting(WebPage):

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def open_settings(self, is_open=True, is_close=False, open_change_pass=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET)
        if is_open:
            self.browser.js_click(self.LCT.SET)
        if is_close:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_CLOSE)
            self.browser.click(self.LCT.SET_CLOSE)
        if open_change_pass:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_CHANGE_PASS)
            self.browser.click(self.LCT.SET_CHANGE_PASS)

    def change_password(self, current_pass=None, new_pass=None, confirm_new_pass=None, is_update=True,
                        is_back=False, is_visibility=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_UPDATE)
        if current_pass:
            self.browser.input_text(self.LCT.SET_CURRENT_PASS, current_pass)
        if new_pass:
            self.browser.input_text(self.LCT.SET_NEW_PASS, new_pass)
        if confirm_new_pass:
            for character in confirm_new_pass:
                self.browser.input_text(self.LCT.SET_CONFIRM_NEW_PASS, character, is_clear=False)
                time.sleep(0.05)
        if is_update:
            self.browser.click(self.LCT.SET_UPDATE)
        if is_back:
            self.browser.click(self.LCT.SET_CHANGE_PASS_BACK)
        if is_visibility:
            self.browser.clicks(self.LCT.SET_VISIBILITY_PASS)

    def get_components_settings_title(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_COMPONENTS_TITLE)
        return self.browser.get_texts(self.LCT.SET_COMPONENTS_TITLE)

    def notifications_settings_is_expanded(self):
        header = ["high hr", "low hr"]
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_HIGH_HR_COLLAPSE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_LOW_HR_COLLAPSE)
        expanded = [self.browser.get_attribute_value(self.LCT.SET_HIGH_HR_COLLAPSE, 'aria-expanded'),
                    self.browser.get_attribute_value(self.LCT.SET_LOW_HR_COLLAPSE, 'aria-expanded')]
        return dict(zip(header, expanded))

    def set_heart_rate_notifications_settings(self, high_heart=None, low_heart=None,
                                              close_high_hr=False, close_low_hr=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_COMPONENTS_TITLE)
        if high_heart:
            self.browser.click(self.LCT.SET_HIGH_HR_INPUT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_BPM_HR_OPTION)
            self.browser.clicks(self.LCT.SET_BPM_HR_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == high_heart.lower(),
                                stop_on_first=True)
        if low_heart:
            self.browser.click(self.LCT.SET_LOW_HR_INPUT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_BPM_HR_OPTION)
            self.browser.clicks(self.LCT.SET_BPM_HR_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == low_heart.lower(),
                                stop_on_first=True)
        if close_high_hr:
            if self.notifications_settings_is_expanded()["high hr"] == 'true':
                self.browser.click(self.LCT.SET_HIGH_HR_INPUT)
        if close_low_hr:
            if self.notifications_settings_is_expanded()["low hr"] == 'true':
                self.browser.click(self.LCT.SET_LOW_HR_INPUT)

    def get_value_heart_rate_notifications(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_HIGH_HR_VALUE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_LOW_HR_VALUE)
        header = ["high hr", "low hr"]
        if self.notifications_settings_is_expanded()['high hr'] == 'false':
            self.browser.click(self.LCT.SET_HIGH_HR_INPUT)
        if self.notifications_settings_is_expanded()['low hr'] == 'false':
            self.browser.click(self.LCT.SET_LOW_HR_INPUT)
        value = [self.browser.get_texts(self.LCT.SET_HIGH_HR_VALUE),
                 self.browser.get_texts(self.LCT.SET_LOW_HR_VALUE)]
        return dict(zip(header, value))

    def get_value_heart_rate_notifications_selected(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SET_HR_SELECTED)
        header = ["high hr", "low hr"]
        return self.browser.get_tabular_data(header, self.LCT.SET_HR_SELECTED, row=1)
