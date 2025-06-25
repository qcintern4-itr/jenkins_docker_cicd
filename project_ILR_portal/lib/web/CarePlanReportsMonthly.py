#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import care_plan_reports_monthly as locators
    from corelib import Utils
    import re

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class CarePlanReportsMonthly(WebPage):
    """
    Handle Care plan reports > Monthly
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_care_plan_reports_monthly(self):
        self.browser.open_page(self.URL + '/reports/monthly')

    def filter_care_plan_reports_monthly(self, status=None, by_patient=None, search_by=None, text_search=None):
        if status:
            self.browser.click(self.LCT.STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STATUS_OPTIONS)
            self.browser.clicks(self.LCT.STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == status.lower(),
                                stop_on_first=True)
        if by_patient:
            self.browser.click(self.LCT.PATIENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PATIENT_OPTIONS)
            self.browser.clicks(self.LCT.PATIENT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.SEARCH_TEXTBOX, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search:
            self.browser.click(self.LCT.SEARCH_TEXTBOX)  # to handle the case the search_by box not closed
            self.browser.input_text(self.LCT.SEARCH_TEXTBOX, text_search)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CONTENT)

    def get_care_plan_reports_monthly(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CONTENT)
        header = self.browser.get_texts(self.LCT.HEADER)
        return self.browser.get_tabular_data(header, self.LCT.CONTENT, row=row)

    def _on_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_care_plan_reports_monthly()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such item exist under {_on}.')

    def view_care_plan_report_monthly_appointment_summary_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CONTENT)
        index_to_click = self._on_item(**on)
        self.browser.clicks(self.LCT.CONTENT_PATIENTNAME, on_elements=lambda i, _: i == index_to_click,
                            stop_on_first=True)

    def view_care_plan_report_monthly_details_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CONTENT)
        index_to_click = self._on_item(**on)
        self.browser.clicks(self.LCT.CONTENT_ROW, on_elements=lambda i, _: i == index_to_click,
                            stop_on_first=True)
