#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import calendar as locators
    from corelib import Utils
    import re

    from selenium.webdriver.common.keys import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Calendar(WebPage):
    """
    Handle Calendar page
    """

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_calendar(self):
        self.browser.open_page(self.URL + '/appointments')

    def wait_for_calendar_list_items_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.VLIST_DATA_DATE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.VLIST_DATA_CONTENT)

    def get_calendar_appointments(self):
        self.wait_for_calendar_list_items_available()
        output = list()
        data_output = list()
        on_date = self.browser.get_texts(self.LCT.VLIST_DATA_DATE)
        for root_element in self.browser.get_elements(self.LCT.VLIST_DATA_CONTENT_ROOT):
            content = self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.VLIST_DATA_CONTENT_ROOT_ROW))
            data_output.append(content)
        output.append({k: v for k, v in zip(on_date, data_output)})
        return [{k: [c.replace('\n', ', ') for c in v] for k, v in item.items()} for item in output]

    def filter_calendars(self, by_date=None, view_by=None, by_week_time=None, by_calendar=None, by_type=None,
                         text_search=None):
        if by_date:
            if 'today' in by_date.lower():
                self.browser.click(self.LCT.SEARCHDATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.SEARCHDATE_TODAY)
                self.browser.click(self.LCT.SEARCHDATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.SEARCHDATE, 'readonly')
                self.browser.input_text(self.LCT.SEARCHDATE, by_date)
                self.browser.get_element(self.LCT.SEARCHDATE).send_keys(Keys.ENTER)
        if view_by:
            self.browser.clicks(self.LCT.VIEWMODES,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == view_by.lower(),
                                stop_on_first=True)
        if by_week_time:
            self.browser.js_clicks(self.LCT.BYWEEKTIME,
                                   on_elements=lambda _, e: self.browser.get_text(e).replace(
                                       '\n', ' ').lower() == by_week_time.lower(), stop_on_first=True)
        if by_calendar:
            self.browser.click(self.LCT.BYCALENDAR)
            self.browser.wait_visibility_all_of_elements_located(self.LCT.BYCALENDAR_OPTIONS)
            self.browser.clicks(self.LCT.BYCALENDAR_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_calendar.lower(),
                                stop_on_first=True)
        if by_type:
            self.browser.click(self.LCT.BYTYPE)
            self.browser.wait_visibility_all_of_elements_located(self.LCT.BYTYPE_OPTIONS)
            self.browser.clicks(self.LCT.BYTYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_calendar.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.input_text(self.LCT.SEARCHBOX, text_search)
