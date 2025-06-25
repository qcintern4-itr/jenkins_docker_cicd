#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import billing as locators
    from selenium.webdriver import Keys
    from corelib import Utils
    import re

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Billing(WebPage):
    """
    Handle Billing page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_billing(self):
        self.browser.open_page(self.URL + '/time-tracking')

    def navigate_to_billing_tab(self, tab):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                            stop_on_first=True)

    # In progress tab

    def wait_billing_in_progress_items_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INP_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INP_DATA_CONTENT)

    def _filters_billing(self, start_date=None, stop_date=None, status=None, duration=None, apply=True,
                         clear=False):
        if start_date:
            self.browser.remove_attribute(self.LCT.INP_FILTER_STARTDATE, 'readonly')
            self.browser.input_text(self.LCT.INP_FILTER_STARTDATE, start_date)
            self.browser.get_element(self.LCT.INP_FILTER_STARTDATE).send_keys(Keys.ENTER)
        if stop_date:
            self.browser.remove_attribute(self.LCT.INP_FILTER_ENDDATE, 'readonly')
            self.browser.input_text(self.LCT.INP_FILTER_ENDDATE, stop_date)
            self.browser.get_element(self.LCT.INP_FILTER_STARTDATE).send_keys(Keys.ENTER)
        if status:
            _status = [stt.strip() for stt in status.split(',')] if isinstance(status, str) else status  # list
            for stt in _status:
                for element in self.browser.get_elements(self.LCT.INP_STATUSES):
                    if self.browser.get_attribute_value(element, 'value').lower() == stt.lower():
                        self.browser.toggle_checkbox(element, element, True)
        if duration:
            _duration = [dur.strip() for dur in duration.split(',')] if isinstance(duration, str) else duration  # list
            for drt in _duration:
                for element in self.browser.get_elements(self.LCT.INP_DURATIONS):
                    if self.browser.get_attribute_value(element, 'value').lower() == drt.lower():
                        self.browser.toggle_checkbox(element, element, True)
        if clear:
            self.browser.click(self.LCT.INP_CLEAR)
        if apply:
            self.browser.click(self.LCT.INP_APPLY)

    def filter_billing_in_progress(self, filters=None, by_patient=None, search_by=None, text_search=None):
        self.navigate_to_billing_tab('In progress')
        if filters:
            self.browser.click(self.LCT.INP_FILTER)
            self._filters_billing(**filters)
        if by_patient:
            self.browser.click(self.LCT.INP_BYPATIENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.INP_BYPATIENT_OPTIONS)
            self.browser.clicks(self.LCT.INP_BYPATIENT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.INP_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.INP_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.INP_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(self.LCT.INP_TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.INP_TEXTSEARCH, text_search)  # handle in case of search_by box not closed
            self.browser.input_text(self.LCT.INP_TEXTSEARCH, text_search)
        self.wait_billing_in_progress_items_available()

    def sort_billing_in_progress(self, up_or_down, field='date of service'):
        self.wait_billing_in_progress_items_available()
        index_header = {
            'date of service': 2,
        }
        for _ in range(2):
            element_click = self.browser.get_elements(self.LCT.INP_DATA_HEADER)[index_header[field.lower()]]
            element_state = self.browser.get_child_element(element_click,
                                                           f'xpath:.//span[@aria-label="caret-{up_or_down.lower()}"]')
            if 'active' in self.browser.get_attribute_value(element_state, 'class'):
                break
            self.browser.click(element_click)

    def get_billing_in_progress(self, row=None):
        self.wait_billing_in_progress_items_available()
        header = self.browser.get_texts(self.LCT.INP_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.INP_DATA_CONTENT, row=row)

    def _on_billing_in_progress_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_billing_in_progress_items_available()
        all_data = self.get_billing_in_progress()
        _on = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such billing in progress exist under `{_on}`.')

    def view_billing_in_progress_appointment_summary_on(self, **on):
        self.wait_billing_in_progress_items_available()
        _index = self._on_billing_in_progress_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INP_DATA_CONTENT_PATIENTNAME)
        self.browser.clicks(self.LCT.INP_DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_billing_in_progress_patient_details_on(self, **on):
        self.wait_billing_in_progress_items_available()
        _index = self._on_billing_in_progress_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INP_DATA_CONTENT_ROW)
        self.browser.clicks(self.LCT.INP_DATA_CONTENT_ROW, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    # Ready for biller tab

    def wait_billing_ready_for_biller_items_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BILLER_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BILLER_DATA_CONTENT)

    def filter_billing_ready_for_biller(self, filters=None, by_patient=None, search_by=None, text_search=None):
        self.navigate_to_billing_tab('Ready for biller')
        if filters:
            self.browser.click(self.LCT.BILLER_FILTER)
            self._filters_billing(**filters)
        if by_patient:
            self.browser.click(self.LCT.BILLER_BYPATIENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BILLER_BYPATIENT_OPTIONS)
            self.browser.clicks(self.LCT.BILLER_BYPATIENT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.BILLER_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BILLER_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.BILLER_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(self.LCT.BILLER_TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.BILLER_TEXTSEARCH)  # handle in case of search_by box not closed
            self.browser.input_text(self.LCT.BILLER_TEXTSEARCH, text_search)
        self.wait_billing_ready_for_biller_items_available()

    def sort_billing_ready_for_biller(self, up_or_down, field='date of service'):
        self.wait_billing_ready_for_biller_items_available()
        index_header = {
            'date of service': 2,
        }
        for _ in range(2):
            element_click = self.browser.get_elements(self.LCT.BILLER_DATA_HEADER)[index_header[field.lower()]]
            element_state = self.browser.get_child_element(element_click,
                                                           f'xpath:.//span[@aria-label="caret-{up_or_down.lower()}"]')
            if 'active' in self.browser.get_attribute_value(element_state, 'class'):
                break
            self.browser.click(element_click)

    def get_billing_ready_for_biller(self, row=None):
        self.wait_billing_ready_for_biller_items_available()
        header = self.browser.get_texts(self.LCT.BILLER_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.BILLER_DATA_CONTENT, row=row)

    def _on_billing_ready_for_biller_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_billing_ready_for_biller_items_available()
        all_data = self.get_billing_ready_for_biller()
        _on = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such billing ready for biller exist under `{_on}`.')

    def view_billing_ready_for_biller_appointment_summary_on(self, **on):
        self.wait_billing_ready_for_biller_items_available()
        _index = self._on_billing_ready_for_biller_item(**on)
        self.browser.clicks(self.LCT.BILLER_DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_billing_ready_for_biller_patient_details_on(self, **on):
        self.wait_billing_ready_for_biller_items_available()
        _index = self._on_billing_ready_for_biller_item(**on)
        self.browser.clicks(self.LCT.BILLER_DATA_CONTENT_ROW, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def update_billing_ready_for_biller_status_on(self, status, **on):
        self.wait_billing_ready_for_biller_items_available()
        _index = self._on_billing_ready_for_biller_item(**on)
        if status:
            self.browser.clicks(self.LCT.BILLER_DATA_CONTENT_STATUS, on_elements=lambda i, _: i == _index,
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BILLER_DATA_CONTENT_STATUS_OPTIONS)
            self.browser.clicks(self.LCT.BILLER_DATA_CONTENT_STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == status.lower(),
                                stop_on_first=True)

    def create_master_bill_on(self, is_generate=True, **on):  # select single record
        self.wait_billing_ready_for_biller_items_available()
        _index = self._on_billing_ready_for_biller_item(**on)
        self.browser.click(self.LCT.BILLER_CREATEMASTERBILL)
        _checkboxes = self.browser.get_elements(self.LCT.BILLER_DATA_CONTENT_CHECKBOXES)
        self.browser.toggle_checkbox(_checkboxes[_index], _checkboxes[_index], True)
        self.browser.wait_visibility_of_element_located(self.LCT.BILLER_CREATEMASTERBILL_GENERATE)
        if is_generate:
            self.browser.click(self.LCT.BILLER_CREATEMASTERBILL_GENERATE)

    def get_master_bill(self, is_close=True):  # get single master bill
        header = ['Facility']
        header += self.browser.get_texts(self.LCT.SUMBILL_DATA_HEADER) + ['Superbill information'] + ['Diagnoses'] + [
            'Service'] + ['Charge']
        # content
        content = [self.browser.get_text(self.LCT.SUMBILL_DATA_CONTENT + '/../div[contains(@class, "item-title")]')]
        content += self.browser.get_texts(self.LCT.SUMBILL_DATA_CONTENT)
        content += self.browser.get_texts(
            self.LCT.SUMBILL_DATA_CONTENT + '/../../../..//div[@class="bill-list"]//div[@class="super-bill-section"]')
        # close
        if is_close:
            self.browser.click(self.LCT.SUMBILL_CLOSE)
        return Utils.group_tabular_data(header, [c.replace('\n', ' | ') for c in content], row=1)
