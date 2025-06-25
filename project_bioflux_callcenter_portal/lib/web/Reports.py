#!/usr/bin/env python3
import time

from selenium.common import NoSuchElementException

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import reports as locators
    from selenium.webdriver import Keys
    from corelib import Utils
    from datetime import datetime, timedelta
    import cv2
    import os
    import re
    import numpy as np
    # from PIL import Image
    import random

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Reports(WebPage):
    """
    Handle Reports page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def get_current_report_state(self):
        for state in self.browser.get_elements(self.LCT.REPORT_TABS):
            if 'active' in self.browser.get_attribute_value(state, 'class'):
                return self.browser.get_text(state)

    def get_current_report_type(self):
        for typ in self.browser.get_elements(self.LCT.REPORT_SUBTABS_ACTIVE):
            if 'active' in self.browser.get_attribute_value(typ, 'class'):
                return self.browser.get_text(typ).replace('\n', ' | ')

    def navigate_to_reports(self):
        self.browser.open_page(self.URL + '/reports')

    def wait_for_pending_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGRP_CONTENT) and self.browser.get_elements(self.LCT.PENDINGRP_CONTENT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGRP_CONTENT, inverse=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGRP_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                return self

    def wait_for_pending_interim_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORTS_NO_DATA) and self.browser.get_element(self.LCT.INTERIM_REPORTS_NO_DATA).is_displayed():
                # self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGRP_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                return self

    def wait_for_ready_reports_available(self):
        if self.get_current_report_type().lower() in ('notification reports', 'call required'):
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_ROOT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_HEADER2ST, inverse=True)
        if 'interim reports' in self.get_current_report_type().lower() \
                or 'end of user report' in self.get_current_report_type().lower():
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_HEADER1ST)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_CONTENT1ST, inverse=True)

    def wait_for_sent_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTRP_CONTENT) and self.browser.get_elements(self.LCT.SENTRP_CONTENT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTRP_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def _select_report_state(self, report_state):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_TABS) and self.browser.get_elements(self.LCT.REPORT_TABS)[0].is_displayed():
                self.browser.clicks(self.LCT.REPORT_TABS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == report_state.lower(),
                                    stop_on_first=True)
                # self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_TABS, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def _select_report_type(self, report_type):  # Maybe overlapped by no-data__icon so perform js_clicks
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_SUBTABS) and self.browser.get_elements(self.LCT.REPORT_SUBTABS)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_SUBTABS, inverse=True)
                self.browser.js_clicks(self.LCT.REPORT_SUBTABS,
                                       on_elements=lambda _, e: report_type.lower() in self.browser.get_text(e).lower(),
                                       stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_SUBTABS, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def _filter_by_report_type(self, by_report=None):
        if self.get_current_report_state().lower() == 'ready':
            self.browser.click(self.LCT.BYREPORT1ST)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BYREPORT_OPTIONS)
            self.browser.clicks(self.LCT.BYREPORT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_report.lower(),
                                stop_on_first=True)
        if self.get_current_report_state().lower() == 'sent':
            self.browser.click(self.LCT.BYREPORT2ST)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BYREPORT_OPTIONS)
            self.browser.clicks(self.LCT.BYREPORT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_report.lower(),
                                stop_on_first=True)

    def filter_reports(self, report_state=None, report_type=None, facility=None, search_by=None, text_search=None,
                       by_report=None, by_assignee=None):
        if report_state:
            self._select_report_state(report_state)
        if report_type:
            self._select_report_type(report_type)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_INPUT, inverse=True)
            self.browser.click(self.LCT.FACILITY_INPUT + '/../../../..')
            self.browser.input_text(self.LCT.FACILITY_INPUT, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS, inverse=True)
            self.browser.clicks(self.LCT.FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY, inverse=True)
            self.browser.click(self.LCT.SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY, inverse=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        if text_search is not None:
            if search_by.lower() == 'study id':
                _text = [text.strip() for text in text_search.split(',')] if isinstance(text_search,
                                                                                        str) else text_search
                for text in _text:
                    self.browser.input_text(self.LCT.TEXTSEARCH, text, is_clear=False)
                    self.browser.get_element(self.LCT.TEXTSEARCH).send_keys(Keys.ENTER)
                    # self.browser.wait_visibility_of_element_located(self.LCT.TEXTSEARCH, inverse=True)
            else:
                self.browser.input_text(self.LCT.TEXTSEARCH, text_search)
                self.browser.get_element(self.LCT.TEXTSEARCH).send_keys(Keys.ENTER)
                # self.browser.wait_visibility_of_element_located(self.LCT.TEXTSEARCH, inverse=True)
        if by_report:
            self._filter_by_report_type(by_report)
        if by_assignee:
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.BYASSIGNEE) and self.browser.get_element(self.LCT.BYASSIGNEE).is_displayed():
                    self.browser.click(self.LCT.BYASSIGNEE)
                    self.browser.wait_visibility_of_all_elements_located(self.LCT.BYASSIGNEE_OPTIONS)
                    self.browser.clicks(self.LCT.BYASSIGNEE_OPTIONS,
                                        on_elements=lambda _, e: by_assignee.lower() in self.browser.get_text(e).lower(),
                                        stop_on_first=True)
                    self.browser.wait_visibility_of_all_elements_located(self.LCT.BYASSIGNEE_OPTIONS, inverse=True)
                    break
                elif time.time() - start_time > 1 * 60:
                    break
        # wait_func = {
        #     'pending': self.wait_for_pending_reports_available,
        #     'ready': self.wait_for_ready_reports_available,
        #     'sent': self.wait_for_sent_reports_available
        # }
        # wait_func[self.get_current_report_state().lower()]()

    def filter_event_interim_reports(self, by_report=None, text_search=None, sort_event=None):
        if by_report:
            self.browser.click(self.LCT.INTERIM_REPORTS_BYTYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.INTERIM_REPORTS_BYTYPE_OPTION, inverse=True)
            self.browser.clicks(self.LCT.INTERIM_REPORTS_BYTYPE_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_report.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORTS_TEXTSEARCH)
            self.browser.input_text(self.LCT.INTERIM_REPORTS_TEXTSEARCH, text_search)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORTS_TEXTSEARCH, inverse=True)
        if sort_event:
            src_asc = 'Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTIgMTMuNUwxNiAxM'
            src_desc = 'Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTIgNC41TDE2IDQuN'
            self.logger.info('Toggle the sort')
            self.wait_event_interim_strips_selection_available()
            if sort_event.lower() == 'asc':
                self.browser.clicks(self.LCT.INTERIM_REPORTS_SORT_ICON,
                                    on_elements=lambda _, e: src_asc not in self.browser.get_attribute_value(e, 'src'),
                                    stop_on_first=True)
            elif sort_event.lower() == 'desc':
                self.browser.clicks(self.LCT.INTERIM_REPORTS_SORT_ICON,
                                    on_elements=lambda _, e: src_desc not in self.browser.get_attribute_value(e, 'src'),
                                    stop_on_first=True)
            else:
                raise Exception(f'Invalid key `{sort_event}`.')
        self.wait_event_interim_strips_selection_available()

    def get_reports_current_filter_values(self):
        output = {
            'Facility': self.browser.get_text(
                self.LCT.FACILITY_INPUT + '/../../../div[contains(@class, "singleValue")]'),
            'Report State': self.get_current_report_state(),
            'Report Type': self.get_current_report_type(),
            'Search By': 'Study ID' if self.browser.wait_visibility_of_element_located(
                'selector:div.search-by-study-id', timeout=3) else self.browser.get_attribute_value(
                self.LCT.TEXTSEARCH, 'placeholder').replace('Search by', '').strip(),
            'Text Search': self.browser.get_texts(
                self.LCT.TEXTSEARCH_STUDYIDVALUES) if self.browser.wait_visibility_of_element_located(
                'selector:div.search-by-study-id', timeout=3) else self.browser.get_attribute_value(self.LCT.TEXTSEARCH,
                                                                                                    'value'),
        }
        # Get current report type from dropdown
        if self.browser.wait_visibility_of_element_located(self.LCT.BYREPORT1ST, timeout=3):
            output['By Report'] = self.browser.get_text(self.LCT.BYREPORT1ST)
        if self.browser.wait_visibility_of_element_located(self.LCT.BYREPORT2ST, timeout=3):
            output['By Report'] = self.browser.get_text(self.LCT.BYREPORT2ST)
        # Get current assignee from dropdown
        if self.browser.wait_visibility_of_element_located(self.LCT.BYASSIGNEE, timeout=3):
            output['By Assignee'] = self.browser.get_text(self.LCT.BYASSIGNEE)
        return output

    def clear_reports_text_search(self):
        pass

        # Pending Interim

    def get_pending_interim_reports(self, row=None):  # TBD
        self.wait_for_sent_reports_available()
        headers = self.browser.get_texts(self.LCT.PENDINGEOU_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.PENDINGEOU_CONTENT, row=row)

        # Pending Eou

    def get_pending_eou_reports(self, row=None):
        self.wait_for_sent_reports_available()
        headers = self.browser.get_texts(self.LCT.PENDINGEOU_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.PENDINGEOU_CONTENT, row=row)

    def sort_pending_eou_reports(self, field, asc_or_desc):
        _index_header = {
            'study id': 0,
            'report id': 1,
            'duration': 3,
            'patient name': 4,
            'patient id': 5,
            'study type': 6,
            'report date': 7
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.PENDINGEOU_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_pending_eou_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_data = self.get_pending_eou_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such pending notification report exist on {_on}.')

    def _on_pending_interim_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_data = self.get_pending_interim_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such pending notification report exist on {_on}.')

    def edit_pending_interim_reports_on(self, **on):
        self.wait_for_pending_reports_available()
        _index = self._on_pending_interim_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.PENDINGEOU_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_EDITRP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_pending_interim_reports_on(self, **on):
        self.wait_for_pending_reports_available()
        _index = self._on_pending_interim_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_CONTENT_MANAGERP)
        self.browser.hover_to_by_index(self.LCT.PENDINGEOU_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_pending_eou_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_pending_eou_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.PENDINGEOU_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_EDITRP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_pending_eou_reports_on(self, **on):
        self.wait_for_pending_reports_available()
        _index = self._on_pending_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_CONTENT_MANAGERP)
        self.browser.hover_to_by_index(self.LCT.PENDINGEOU_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_pending_eou_reports_study_information_on(self, **on):
        _index = self._on_pending_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_CONTENT_STUDIESID)
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_STUDIESID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_pending_eou_reports_patient_details_on(self, **on):
        _index = self._on_pending_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_CONTENT_PATIENTNAME)
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_pending_holter_eou_reports(self, row=None):
        self.wait_for_pending_reports_available()
        headers = self.browser.get_texts(self.LCT.PENDINGHOLTEREOU_HEADER)
        contents = self.browser.get_texts(self.LCT.PENDINGHOLTEREOU_CONTENT)
        output = Utils.group_tabular_data(headers, contents, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def sort_pending_holter_eou_reports(self, field, asc_or_desc):
        self.wait_for_pending_reports_available()
        _index_header = {
            'study id': 0,
            'study type': 1,
            'upload date': 2,
            'return visit': 3,
            'duration': 4,
            'patient name': 5,
            'patient id': 6,
            'report status': 7
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.PENDINGHOLTEREOU_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_pending_holter_eou_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_pending_reports_available()
        all_data = self.get_pending_holter_eou_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such pending holter Eou report exist on {_on}.')

    def view_pending_holter_eou_reports_study_information_on(self, **on):
        _index = self._on_pending_holter_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGHOLTEREOU_CONTENT_STUDIESID, inverse=True)
        self.browser.clicks(self.LCT.PENDINGHOLTEREOU_CONTENT_STUDIESID,
                            on_elements=lambda i, _: i == _index, stop_on_first=True)

    def view_pending_holter_eou_reports_patient_details_on(self, **on):
        _index = self._on_pending_holter_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGHOLTEREOU_CONTENT_PATIENTNAME, inverse=True)
        self.browser.clicks(self.LCT.PENDINGHOLTEREOU_CONTENT_PATIENTNAME,
                            on_elements=lambda i, _: i == _index, stop_on_first=True)

    def edit_pending_holter_eou_reports_on(self, **on):
        _index = self._on_pending_holter_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGHOLTEREOU_CONTENT_EDITRP)
        self.browser.hover_to_by_index(self.LCT.PENDINGHOLTEREOU_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.PENDINGHOLTEREOU_CONTENT_EDITRP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_pending_holter_eou_reports_on(self, **on):
        _index = self._on_pending_holter_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGHOLTEREOU_CONTENT_MANAGERP)
        self.browser.hover_to_by_index(self.LCT.PENDINGHOLTEREOU_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.PENDINGHOLTEREOU_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    # Ready Notification
    def wait_for_event_reports_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_EVENT_REPORT_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_EVENT_REPORT_CONTENT, inverse=True)

    def get_ready_notification_reports_details(self):
        self.browser.wait_visibility_of_element_located(self.LCT.READYNOTIFRP_COLLAPSEICON)
        self.browser.click(self.LCT.READYNOTIFRP_COLLAPSEICON)
        self.wait_for_event_reports_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, timeout=10)
        return self.browser.get_texts(self.LCT.READYNOTIFRP_EVENT_REPORT_EVID)

    def wait_ready_notification_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.READYCALLRERP_ROOT) and self.browser.get_elements(self.LCT.READYCALLRERP_ROOT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.READYCALLRERP_ROOT, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def get_ready_notification_reports(self):
        self.wait_ready_notification_reports_available()
        input_data = self.browser.get_texts(self.LCT.READYCALLRERP_ROW)
        output = []
        for entry in input_data:
            entry_lines = entry.split('\n')
            patient_dict = {}
            for i in range(0, len(entry_lines), 2):
                key = entry_lines[i].strip()
                value = entry_lines[i + 1].strip() if i + 1 < len(entry_lines) else ''
                patient_dict[key] = value
            if any(patient_dict.values()):
                output.append(patient_dict)
        self.logger.info(output)
        return output

    def view_ready_notification_reports_patient_details_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_all_call_required_items(**on)
        self.browser.clicks(self.LCT.READYCALLRERP_PATIENT_NAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_ready_notification_reports_study_information_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_all_call_required_items(**on)
        self.browser.clicks(self.LCT.READYCALLRERP_STUDY_ID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def toggle_ready_notification_reports_checkbox_on(self):
        pass

    def toggle_ready_notification_reports_item(self):
        pass

    def toggle_ready_notification_reports_checkbox(self):
        pass

    def assign_ready_notification_reports_to_me(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_ready_notification_reports(**on)
        self.browser.clicks(self.LCT.READYNOTIFRP_ASSIGN_TO_ME, on_elements=lambda index, _: index == _index, stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_ASSIGN_TO_ME, inverse=True)
        # Ready call required

    def get_ready_call_required_reports(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYCALLRERP_ROOT, inverse=True)
        input_data = self.browser.get_texts(self.LCT.READYCALLRERP_ROW)
        output = []
        for entry in input_data:
            entry_lines = entry.split('\n')
            patient_dict = {}
            for i in range(0, len(entry_lines), 2):
                key = entry_lines[i].strip()
                value = entry_lines[i + 1].strip() if i + 1 < len(entry_lines) else ''
                patient_dict[key] = value
            if any(patient_dict.values()):
                output.append(patient_dict)
        return output

    def view_ready_call_required_reports_patient_details_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_all_call_required_items(**on)
        self.browser.clicks(self.LCT.READYCALLRERP_PATIENT_NAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_all_call_required_items(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        # self.wait_for_ready_reports_available()
        all_devices = self.get_ready_call_required_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_devices):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such device exist under `{_on}`.')

    def view_ready_call_required_reports_study_information_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_all_call_required_items(**on)
        # self.browser.hover_to_by_index(self.LCT.READYCALLRERP_ROW, _index)
        self.browser.clicks(self.LCT.READYCALLRERP_STUDY_ID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_ready_call_required_reports_on(self):
        pass

    def manage_ready_call_required_reports_on(self, **on):
        _index = self._on_ready_notification_reports_item(**on)
        self.browser.hover_to(self.browser.get_elements_by_condition(
            self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True)[0])
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_MANAGERP, on_elements=lambda index, _: index == _index, stop_on_first=True)

    def mark_call_completed_ready_call_required_reports_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_all_call_required_items(**on)
        self.browser.clicks(self.LCT.READYCALLRERP_MARK_CALL_COMPLETED, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.POPUP_MODAL_CONTENT, inverse=True)
        self.browser.click(self.LCT.READYCALLRERP_MARK_SUBMIT)

    def check_button_mark_call_completed(self):
        output = {
                'Mark Call Completed': self.browser.get_element(self.LCT.READYCALLRERP_MARK_CALL_COMPLETED) is not None and self.browser.get_element(self.LCT.READYCALLRERP_MARK_CALL_COMPLETED).is_displayed()
            }
        return output

    def toggle_call_required_reports_item(self):
        pass

    def wait_for_ready_interim_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_ROW) and self.browser.get_elements(self.LCT.READYINTERIMRP_CONTENT_ROW)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_ROW, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_ready_interim_reports(self, row=None):
        self.wait_for_ready_interim_reports_available()
        output_1 = []
        output_2 = []
        while True:
            if len(self.browser.get_texts(self.LCT.READYINTERIMRP_CONTENT_ROW)) == 10:
                headers = self.browser.get_texts(self.LCT.READYINTERIMRP_HEADER)
                contents = self.browser.get_texts(self.LCT.READYINTERIMRP_CONTENT)
                output_1 += Utils.group_tabular_data(headers, contents, row=row)
                if self.browser.wait_visibility_of_element_located(self.LCT.PENDINGEOU_PGN_NEXT) and self.browser.get_element(self.LCT.PENDINGEOU_PGN_NEXT).is_displayed():
                    self.browser.js_click(self.LCT.PENDINGEOU_PGN_NEXT)
                else:
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PENDINGEOU_PGN_NEXT)
            else:
                headers = self.browser.get_texts(self.LCT.READYINTERIMRP_HEADER)
                contents = self.browser.get_texts(self.LCT.READYINTERIMRP_CONTENT)
                output_2 += Utils.group_tabular_data(headers, contents, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def sort_ready_interim_reports(self, field, asc_or_desc):
        _index_header = {
            'study id': 0,
            'report id': 1,
            'create time': 2,
            'duration': 4,
            'patient name': 5,
            'patient id': 6,
            'study type': 7
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.READYINTERIMRP_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_ready_interim_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        # self.wait_for_ready_reports_available()
        all_data = self.get_ready_interim_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such ready interim report exist on {_on}.')

    def view_ready_interim_reports_study_information_on(self, **on):
        _index = self._on_ready_interim_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_STUDIESID)
        self.browser.clicks(self.LCT.READYINTERIMRP_CONTENT_STUDIESID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_ready_interim_reports_patient_details_on(self, **on):
        _index = self._on_ready_interim_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_PATIENTNAME)
        self.browser.clicks(self.LCT.READYINTERIMRP_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def assign_to_me_ready_interim_reports_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_ready_interim_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_ASSIGN)
        self.browser.hover_to_by_index(self.LCT.READYINTERIMRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.READYINTERIMRP_CONTENT_ASSIGN, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_ASSIGN, inverse=True)

    def edit_ready_interim_reports_on(self, **on):
        _index = self._on_ready_interim_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_EDITICON)
        self.browser.hover_to_by_index(self.LCT.READYINTERIMRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.READYINTERIMRP_CONTENT_EDITICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_ready_interim_reports_on(self, **on):
        _index = self._on_ready_interim_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYINTERIMRP_CONTENT_MANAGERP)
        self.browser.hover_to_by_index(self.LCT.READYINTERIMRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.READYINTERIMRP_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def wait_for_ready_eou_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.READYEOURP_CONTENT_ROW) and self.browser.get_elements(self.LCT.READYEOURP_CONTENT_ROW)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.READYEOURP_CONTENT_ROW, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_ready_eou_reports(self, row=None):
        self.wait_for_ready_eou_reports_available()
        output_1 = []
        output_2 = []
        while True:
            if len(self.browser.get_texts(self.LCT.READYEOURP_CONTENT_ROW)) == 10:
                headers = self.browser.get_texts(self.LCT.READYEOURP_HEADER)
                contents = self.browser.get_texts(self.LCT.READYEOURP_CONTENT)
                output_1 += Utils.group_tabular_data(headers, contents, row=row)
                if self.browser.wait_visibility_of_element_located(self.LCT.PENDINGEOU_PGN_NEXT) and self.browser.get_element(self.LCT.PENDINGEOU_PGN_NEXT).is_displayed():
                    self.browser.js_click(self.LCT.PENDINGEOU_PGN_NEXT)
                else:
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PENDINGEOU_PGN_NEXT)
            else:
                headers = self.browser.get_texts(self.LCT.READYEOURP_HEADER)
                contents = self.browser.get_texts(self.LCT.READYEOURP_CONTENT)
                output_2 += Utils.group_tabular_data(headers, contents, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def sort_ready_eou_reports(self, field, asc_or_desc):
        _index_header = {
            'study id': 0,
            'study type': 1,
            'upload date': 2,
            'duration': 3,
            'patient name': 4,
            'patient id': 5,
            'return visit': 6,
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.READYEOURP_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_ready_eou_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        # self.wait_for_ready_reports_available()
        all_data = self.get_ready_eou_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such ready Eou report exist on {_on}.')

    def view_ready_eou_study_information_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_ready_eou_reports_item(**on)
        self.browser.clicks(self.LCT.READYEOURP_CONTENT_STUDIESID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_ready_eou_patient_details_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_ready_eou_reports_item(**on)
        self.browser.clicks(self.LCT.READYEOURP_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def assign_to_me_ready_eou_reports_on(self, **on):
        # self.wait_for_ready_reports_available()
        _index = self._on_ready_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYEOURP_CONTENT_ASSIGN)
        self.browser.hover_to_by_index(self.LCT.READYEOURP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.READYEOURP_CONTENT_ASSIGN, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYEOURP_CONTENT_ASSIGN, inverse=True)

    def edit_ready_eou_reports_on(self, **on):
        _index = self._on_ready_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYEOURP_CONTENT_EDITICON)
        self.browser.hover_to_by_index(self.LCT.READYEOURP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.READYEOURP_CONTENT_EDITICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_ready_eou_reports_on(self, **on):
        _index = self._on_ready_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYEOURP_CONTENT_MANAGERP)
        self.browser.hover_to_by_index(self.LCT.READYEOURP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.READYEOURP_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    # sent event reports
    def get_sent_event_reports(self, row=None):
        self.wait_for_sent_reports_available()
        headers = self.browser.get_texts(self.LCT.SENTEVENTRP_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.SENTEVENTRP_CONTENT, row=row)

    def sort_sent_event_reports(self, field, asc_or_desc):
        _index_header = {
            'study id': 0,
            'event id': 1,
            'event type': 2,
            'patient name': 3,
            'patient id': 4,
            'study type': 5,
            'report date': 6,
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.SENTEVENTRP_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_sent_event_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_sent_reports_available()
        all_data = self.get_sent_event_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such sent event report exist on {_on}.')

    def view_sent_event_reports_study_information_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_event_reports_item(**on)
        # self.browser.hover_to_by_index(self.LCT.SENTEVENTRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTEVENTRP_CONTENT_STUDIESID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_sent_event_report_patient_details_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_event_reports_item(**on)
        self.browser.clicks(self.LCT.SENTEVENTRP_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_sent_event_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_event_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEVENTRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTEVENTRP_CONTENT_EDITICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_sent_event_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_event_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEVENTRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTEVENTRP_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

        # sent notification_reports

    def get_sent_notification_reports(self, row=None):
        self.wait_for_sent_reports_available()
        headers = self.browser.get_texts(self.LCT.SENTNOTIFRP_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.SENTNOTIFRP_CONTENT, row=row)

    def sort_sent_notification_reports(self, field, asc_or_desc):
        _index_header = {
            'study id': 0,
            'report id': 1,
            'duration': 3,
            'patient name': 4,
            'patient id': 5,
            'study type': 6,
            'report date': 7
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.SENTNOTIFRP_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_sent_notification_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_sent_reports_available()
        all_data = self.get_sent_notification_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such sent notification report exist on {_on}.')

    def view_sent_notification_reports_study_information_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_notification_reports_item(**on)
        self.browser.clicks(self.LCT.SENTNOTIFRP_CONTENT_STUDIESID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_sent_notification_reports_patient_details_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_notification_reports_item(**on)
        self.browser.clicks(self.LCT.SENTNOTIFRP_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_sent_notification_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_notification_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEVENTRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTEVENTRP_CONTENT_EDITICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_sent_notification_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_notification_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEVENTRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTEVENTRP_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

        # sent interim reports

    def get_sent_interim_reports(self, row=None):
        self.wait_for_sent_reports_available()
        headers = self.browser.get_texts(self.LCT.SENTINTERIMRP_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.SENTINTERIMRP_CONTENT, row=row)

    def sort_sent_interim_reports(self, field, asc_or_desc):
        _index_header = {
            'study id': 0,
            'report id': 1,
            'duration': 3,
            'patient name': 4,
            'patient id': 5,
            'study type': 6,
            'report date': 7
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.SENTINTERIMRP_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_sent_interim_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_sent_reports_available()
        all_data = self.get_sent_interim_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such sent interim report exist on {_on}.')

    def view_sent_interim_reports_study_information_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_interim_reports_item(**on)
        self.browser.clicks(self.LCT.SENTINTERIMRP_CONTENT_STUDIESID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_sent_interim_reports_patient_details_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_interim_reports_item(**on)
        self.browser.clicks(self.LCT.SENTINTERIMRP_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_sent_interim_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_interim_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEVENTRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTINTERIMRP_CONTENT_EDITICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_sent_interim_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_interim_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEVENTRP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTINTERIMRP_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

        # sent end of use

    def get_sent_eou_reports(self, row=None):
        self.wait_for_sent_reports_available()
        headers = self.browser.get_texts(self.LCT.SENTEOURP_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.SENTEOURP_CONTENT, row=row)

    def sort_sent_eou_reports(self, field, asc_or_desc):
        _index_header = {
            'study id': 0,
            'study type': 1,
            'upload date': 2,
            'duration': 3,
            'patient name': 4,
            'patient id': 5,
            'return visit': 6,
            'report date': 7
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.SENTEOURP_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def _on_sent_eou_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_sent_reports_available()
        all_data = self.get_sent_eou_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such sent end of use report exist on {_on}.')

    def view_sent_eou_reports_study_information_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_eou_reports_item(**on)
        self.browser.clicks(self.LCT.SENTEOURP_CONTENT_STUDIESID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_sent_eou_reports_patient_details_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_eou_reports_item(**on)
        self.browser.clicks(self.LCT.SENTEOURP_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_sent_eou_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_eou_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEOURP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTEOURP_CONTENT_EDITICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_sent_eou_reports_on(self, **on):
        self.wait_for_sent_reports_available()
        _index = self._on_sent_eou_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTEOURP_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.SENTEOURP_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_pending_eou_reports_patient_information_on(self, **on):
        _index = self._on_pending_eou_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_CONTENT_PATIENT)
        self.browser.clicks(self.LCT.PENDINGEOU_CONTENT_PATIENT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_all_pending_eou_reports(self, row=None):
        self.wait_for_pending_reports_available()
        output_1 = []
        output_2 = []
        while True:
            if len(self.browser.get_texts(self.LCT.PENDINGEOU_CONTENT_ROW)) == 10:
                headers = self.browser.get_texts(self.LCT.PENDINGEOU_HEADER)
                contents = self.browser.get_texts(self.LCT.PENDINGEOU_CONTENT)
                output_1 += Utils.group_tabular_data(headers, contents, row=row)
                if self.browser.wait_visibility_of_element_located(self.LCT.PENDINGEOU_PGN_NEXT) and self.browser.get_element(self.LCT.PENDINGEOU_PGN_NEXT).is_displayed():
                    self.browser.js_click(self.LCT.PENDINGEOU_PGN_NEXT)
                else:
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PENDINGEOU_PGN_NEXT)
            else:
                headers = self.browser.get_texts(self.LCT.PENDINGEOU_HEADER)
                contents = self.browser.get_texts(self.LCT.PENDINGEOU_CONTENT)
                output_2 += Utils.group_tabular_data(headers, contents, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def sort_datetime_descending(self, date_time=None, duration=None):
        self.wait_for_sent_reports_available()
        if date_time:
            # Parse the date strings into datetime objects
            date_list = [datetime.strptime(date, '%m/%d/%Y') for date in date_time]
            # Sort the datetime objects in reverse order
            sorted_dates = sorted(date_list, reverse=True)
            # Convert back to string format if needed
            sorted_dates_str = [date.strftime('%m/%d/%Y') for date in sorted_dates]
            return sorted_dates_str
        if duration:
            # Convert time durations to minutes for easier comparison
            output_in_minutes = [sum(int(num[:-1]) * 60 ** i for i, num in enumerate(reversed(part.split()))) for part in duration]
            # Combine the original list with the converted values
            combined_list = list(zip(duration, output_in_minutes))
            # Sort the combined list in descending order based on the converted values
            sorted_list = sorted(combined_list, key=lambda x: x[1], reverse=True)
            # Extract the sorted time durations
            sorted_output = [item[0] for item in sorted_list]
            return sorted_output

    def sort_datetime_ascending(self, date_time=None, duration=None):
        self.wait_for_sent_reports_available()
        if date_time:
            # Parse the date strings into datetime objects
            date_list = [datetime.strptime(date, '%m/%d/%Y') for date in date_time]
            # Sort the datetime objects in reverse order
            sorted_dates = sorted(date_list, reverse=False)
            # Convert back to string format if needed
            sorted_dates_str = [date.strftime('%m/%d/%Y') for date in sorted_dates]
            return sorted_dates_str
        if duration:
            # Convert time durations to minutes for easier comparison
            output_in_minutes = [sum(int(num[:-1]) * 60 ** i for i, num in enumerate(reversed(part.split()))) for part in duration]
            # Combine the original list with the converted values
            combined_list = list(zip(duration, output_in_minutes))
            # Sort the combined list in ascending order based on the converted values
            sorted_list = sorted(combined_list, key=lambda x: x[1])
            # Extract the sorted time durations
            sorted_output = [item[0] for item in sorted_list]
            return sorted_output

    def manage_complete_study_on(self, **on):
        self.wait_for_pending_reports_available()
        _index = self._on_pending_eou_reports_item(**on)
        row_index = self.browser.get_elements_by_condition(self.LCT.MANAGE_STUDY,
                                                           on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
        self.browser.hover_to(row_index, is_scroll=True)
        self.browser.wait_invisibility_of_element(row_index, inverse=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MANAGE_STUDY)
        self.browser.js_clicks(self.LCT.MANAGE_STUDY, on_elements=lambda i, _: i == _index,
                               stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MANAGE_STUDY, inverse=True)

    def view_completed_new_report_status_on(self, **on):
        _index = self._on_pending_eou_reports_item(**on)
        self.wait_for_pending_reports_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_EOU_NEW_REPORT_STATUS)
        self.browser.js_clicks(self.LCT.PENDINGEOU_EOU_NEW_REPORT_STATUS, on_elements=lambda i, _: i == _index,
                               stop_on_first=True)

    def navigate_airp_tab(self, tab=None):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_TABS) and self.browser.get_elements(self.LCT.REPORT_TABS)[0].is_displayed():
                if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_POPUP_GENERATE) and self.browser.get_element(self.LCT.BEAT_HR_POPUP_GENERATE).is_displayed():
                    self.browser.click(self.LCT.BEAT_HR_POPUP_CLOSE)
                    self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_POPUP_CLOSE, inverse=True)
                self.browser.clicks(self.LCT.REPORT_TABS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 10 * 60:
                break

    def navigate_airp_artifact(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_AREA) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_AREA).is_displayed():
                break
            elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                return False
        self.browser.click(self.LCT.BEAT_HR_ARTIFACT_AREA)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_AREA, inverse=True)

    def navigate_to_subtab_aireport(self, subtab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_AREA) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_AREA).is_displayed():
                break
            elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                return False
        if subtab:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_SUBTAB, inverse=True)
            self.browser.clicks(self.LCT.BEAT_HR_ARTIFACT_SUBTAB,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == subtab.lower(),
                                stop_on_first=True)

    def get_all_artifact(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SELECT_THUMBNAIL)
        self.logger.info(self.browser.get_texts(self.LCT.BEAT_HR_SELECT_THUMBNAIL))
        output = []
        contents = self.browser.get_texts(self.LCT.BEAT_HR_SELECT_THUMBNAIL)
        for item in contents:
            contents = item.split('\n')
            date = contents[0]
            number = int(contents[1][1:-1])  # Removing parentheses and converting to integer
            artifact_value = int(contents[3])
            # Create a dictionary to store the extracted information
            processed_entry = {
                'Date': date,
                'Day': number,
                'Artifact value': artifact_value
            }
            # Append the dictionary to the processed data list
            output.append(processed_entry)
        self.logger.info(output)
        return output

    def check_format_date(self, date_strings):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SELECT_THUMBNAIL)
        # Define the regular expression pattern for MM/DD format
        pattern = r'\b(0[1-9]|1[0-2])/(0[1-9]|1[0-9]|2[0-9]|3[0-1])\b'
        # Use re.match to check if the string matches the pattern
        for date_string in date_strings:
            match = re.match(pattern, date_string)
            # If match is None, it means the format is not MM/DD
            if match is None:
                return False
        # If all dates match the pattern, return True
            print(f"{date_string} is MM/DD format: {match}")
        return True

    def _on_artifact_area(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SELECT_THUMBNAIL)
        all_data = self.browser.get_texts(self.LCT.BEAT_HR_SELECT_THUMBNAIL)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i

    def view_airp_artifact_on(self, **on):
        _index = self._on_artifact_area(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SELECT_THUMBNAIL)
        self.browser.clicks(self.LCT.BEAT_HR_SELECT_THUMBNAIL, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_thumbnail_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_EVENTS, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.BEAT_HR_THUMBNAIL_EVENTS)
        for item in contents:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_current_information_artifact_event(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT).is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_EVENT_HEADER)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT, inverse=True)
                content_header = self.browser.get_texts(self.LCT.BEAT_HR_ARTIFACT_EVENT_HEADER)
                content_value = self.browser.get_texts(self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT)
                output = {key.replace(':', ''): value for key, value in zip(content_header, content_value)}
                self.logger.info(output)
                return output
            elif time.time() - start_time > 5 * 60:  # 5 minutes in seconds
                break

    def get_thumbnail_overview(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_CHANNEL, inverse=True)
        root_output = self.browser.get_texts(self.LCT.BEAT_HR_THUMBNAIL_CHANNEL)
        thumbnail_section = root_output[0].split('Thumbnail:\n')
        output = {}
        if len(thumbnail_section) > 1:
            thumbnail_data = thumbnail_section[1].strip().split('\n')
            output['Thumbnail'] = [item.strip('✨') for item in thumbnail_data if item]
        root_output_2 = self.browser.get_texts(self.LCT.BEAT_HR_THUMBNAIL_SELECT)
        for item in root_output_2:
            key, value = item.split(': ')
            output[key] = [value]
        self.logger.info(output)
        return output

    def get_size_config(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_THUMBNAIL_SIZE, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_THUMBNAIL_SIZE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_SIZE, inverse=True)
        return self.browser.get_texts(self.LCT.BEAT_HR_THUMBNAIL_OPTION)

    def get_gain_config(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_THUMBNAIL_GAIN, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_THUMBNAIL_GAIN)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_GAIN, inverse=True)
        return self.browser.get_texts(self.LCT.BEAT_HR_THUMBNAIL_OPTION)

    def get_highpass_config(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_THUMBNAIL_HIGHPASS, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_THUMBNAIL_HIGHPASS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_HIGHPASS, inverse=True)
        return self.browser.get_texts(self.LCT.BEAT_HR_THUMBNAIL_OPTION)

    def navigate_to_heatmap_beat(self, beat=None):
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.TYPE_BEATS) and self.browser.get_element(self.LCT.TYPE_BEATS).is_displayed():
                self.browser.clicks(self.LCT.TYPE_BEATS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == beat.lower(),
                                    stop_on_first=True)
                break

    def get_elements_cell_on_chart(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CELL_ELEMENT) and self.browser.get_elements(self.LCT.CELL_ELEMENT)[0].is_displayed():
                break
            elif time.time() - start_time > 5 * 60:  # 5 minutes in seconds
                break
        elements = self.browser.get_elements(self.LCT.CELL_ELEMENT)
        filtered_elements = []
        for element in elements:
            number = self.browser.get_text(element)
            if 'K' in number:
                number_value = float(number.replace('K', '')) * 1000
                if 20 < number_value < 100:
                    return self
            elif 20 < int(number) < 100:
                filtered_elements.append(element)
        return filtered_elements

    def select_cell_on_chart(self, element_or_locator=None):
        random_element = random.choice(element_or_locator)
        self.browser.hover_to(random_element)
        self.browser.click_on_chart_beat(random_element)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)

    def select_non_contiguous_cell_on_chart(self, element_or_locator=None):
        random_element = random.choice(element_or_locator)
        self.browser.hover_to(random_element)
        self.browser.click_on_chart_beat(random_element)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
        remaining_elements = [element for element in element_or_locator if element != random_element]
        random_element_2 = random.choice(remaining_elements)
        self.browser.hover_to(random_element_2)
        self.browser.select_more_the_element(random_element_2)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)

    def get_information_cell_on_chart(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_NUMBER_CELL, inverse=True)
        cell_text = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_NUMBER_CELL)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_NUMBER_BEAT, inverse=True)
        beats_text = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_NUMBER_BEAT)
        cell_count = re.search(r'\d+', cell_text).group()
        beats_count = re.search(r'\d+', beats_text).group()
        output = {
            'Number of cell': cell_count,
            'Number of beats': int(beats_count)
        }
        self.logger.info(output)
        return output

    def wait_strip_beats_visibility(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION) and self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                break

    def get_number_strip_beats(self):
        self.wait_strip_beats_visibility()
        output_1 = []
        output_2 = []
        while True:
            elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
            if len(elements) == 12:
                output_1 += elements
                if self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT) and self.browser.get_element(self.LCT.ALPHA_PGN_NEXT).get_attribute('disabled'):
                    return len(output_1)
                self.browser.click(self.LCT.ALPHA_PGN_NEXT)
                self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT, inverse=True)
            else:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
                output_2 += elements
                output = output_1 + output_2
                return len(output)

    def change_all_strips_to_beats(self, beat_change=None):
        self.wait_strip_beats_visibility()
        output_1 = []
        output_2 = []
        while True:
            elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
            if 11 < len(elements) < 30:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
                self.browser.click(elements[0])
                self.browser.select_all_value()
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_CHANGE)
                self.browser.clicks(self.LCT.BEAT_CHANGE,
                                    on_elements=lambda _, e: self.browser.get_attribute_value(e, 'id').lower() == beat_change.lower(),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT)
                output_1 += self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_CHANGE)
                if self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT) and self.browser.get_element(self.LCT.ALPHA_PGN_NEXT).get_attribute('disabled'):
                    return output_1
                self.browser.click(self.LCT.ALPHA_PGN_NEXT)
            else:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
                self.browser.click(elements[0])
                self.browser.select_all_value()
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_CHANGE)
                self.browser.clicks(self.LCT.BEAT_CHANGE,
                                    on_elements=lambda _, e: self.browser.get_attribute_value(e, 'id').lower() == beat_change.lower(),
                                    stop_on_first=True)
                output_2 += self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_CHANGE)
                output = output_1 + output_2
                self.logger.info(output)
                return output

    def change_strip_to_beats_on_page(self, beat_change=None, beat_change_by_hotkey=None, is_deleted=False):
        self.wait_strip_beats_visibility()
        elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
        self.browser.click(elements[0])
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_CHANGE)
        if beat_change:
            self.browser.clicks(self.LCT.BEAT_CHANGE,
                                on_elements=lambda _, e: self.browser.get_attribute_value(e, 'id').lower() == beat_change.lower(),
                                stop_on_first=True)
            output = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output
        if beat_change_by_hotkey:
            self.browser.change_strips_to_beat_by_keyword(beat_change_by_hotkey)
            output = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output
        if is_deleted:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED)
            self.browser.change_strips_to_beat_by_keyword('D')
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)

    def change_multiple_strips_to_beats_on_page(self, beat_change=None, beat_change_by_hotkey=None, is_deleted=False):
        self.wait_strip_beats_visibility()
        elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
        self.browser.click(elements[0])
        self.browser.select_all_value()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_CHANGE)
        if beat_change:
            self.browser.clicks(self.LCT.BEAT_CHANGE,
                                on_elements=lambda _, e: self.browser.get_attribute_value(e, 'id').lower() == beat_change.lower(),
                                stop_on_first=True)
            output = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output
        if beat_change_by_hotkey:
            self.browser.change_strips_to_beat_by_keyword(beat_change_by_hotkey)
            output = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output
        if is_deleted:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED)
            self.browser.change_strips_to_beat_by_keyword('D')
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
            return len(elements)

    def navigate_to_tab_menu(self, tab_menu):
        """
        Navigate to studies page
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS_MENU) and self.browser.get_elements(self.LCT.TABS_MENU)[0].is_displayed():
                self.browser.clicks(self.LCT.TABS_MENU,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == tab_menu.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def stop_ai_processing(self):
        self.browser.wait_visibility_of_element_located(self.LCT.MORE_ICON)
        self.browser.click(self.LCT.MORE_ICON)
        self.browser.wait_visibility_of_element_located(self.LCT.STOP_AI_PROCESSING)
        self.browser.click(self.LCT.STOP_AI_PROCESSING)
        self.browser.wait_visibility_of_element_located(self.LCT.POPUP_MODAL_CONTENT, timeout=10)

    def get_message_stop_successful(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.POPUP_MODAL_CONTENT) and self.browser.get_element(self.LCT.POPUP_MODAL_CONTENT).is_displayed():
            msg = self.browser.get_text(self.LCT.MSG_STOP_AI_PROCESSSING)
            self.browser.wait_visibility_of_element_located(self.LCT.BUTTON_OK)
            self.browser.click(self.LCT.BUTTON_OK)
            time.sleep(5)
            return msg

    def _check_number_beat_event(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_COUNT, inverse=True)
        elements = self.browser.get_elements(self.LCT.ECG_EVENT_COUNT)
        filtered_elements = []
        output = []
        for element in elements:
            number = self.browser.get_text(element).split("\n")
            number_value = number[-1]
            if '99+' in number_value:
                number_plus = str(number_value).replace('99+', '99')
                if int(number_plus) == 99:
                    output.append(element)
            elif 1 < int(number_value) < 90:
                filtered_elements.append(element)
        return filtered_elements

    def get_element_beat_event(self):
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_COUNT) and self.browser.get_elements(self.LCT.ECG_EVENT_COUNT)[0].is_displayed():
                break
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_COUNT, inverse=True)
        return self._check_number_beat_event()

    def mark_as_artifact(self, is_save=False, element_or_locator=None):
        random_element = random.choice(element_or_locator)
        self.browser.hover_to(random_element)
        self.browser.click_on_chart_beat(random_element)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_BEAT_EVENT_OPTION)
        while True:
            elements = self.browser.get_elements(self.LCT.ECG_BEAT_EVENT_OPTION)
            if len(elements) == 6:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_BEAT_EVENT_OPTION, inverse=True)
                self.browser.click(elements[0])
                self.browser.select_all_value()
                self.browser.wait_visibility_of_element_located(self.LCT.ECG_MARK_AS_ARTIFACT)
                self.browser.click(self.LCT.ECG_MARK_AS_ARTIFACT)
                self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT)
                if self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT) and self.browser.get_element(self.LCT.ALPHA_PGN_NEXT).get_attribute('disabled'):
                    break
                self.browser.click(self.LCT.ALPHA_PGN_NEXT)
            else:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_BEAT_EVENT_OPTION, inverse=True)
                self.browser.click(elements[0])
                self.browser.select_all_value()
                self.browser.wait_visibility_of_element_located(self.LCT.ECG_MARK_AS_ARTIFACT)
                self.browser.click(self.LCT.ECG_MARK_AS_ARTIFACT)
                break
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON)
            self.browser.click(self.LCT.SAVE_BUTTON)
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and self.browser.get_element(self.LCT.SAVE_BUTTON).is_displayed():
                    break
            self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON)
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_BEAT_EVENT_OPTION) and self.browser.get_elements(self.LCT.ECG_BEAT_EVENT_OPTION)[0].is_displayed():
                return False
            elif self.browser.wait_visibility_of_element_located(self.LCT.ECG_NO_DATA) and self.browser.get_element(self.LCT.ECG_NO_DATA).is_displayed():
                text = self.browser.get_text(random_element).split("\n")
                number_random = text[-1]
                if int(number_random) == 0:
                    return True
                else:
                    return False

    def wait_pdf_report_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_VIEWER) and self.browser.get_element(self.LCT.PDF_REPORT_VIEWER).is_displayed():
                return True
            elif time.time() - start_time > 10 * 60:  # 15 minutes in seconds
                return False

    def get_generate_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_GENERATE, inverse=True)
        self.browser.click(self.LCT.PDF_REPORT_GENERATE)
        self.browser.wait_visibility_of_element_located(self.LCT.LOADING_PAGE, inverse=True)
        self.wait_pdf_report_available()

    def dismiss_events_ready_notification_reports_on(self, is_delete=False, **on):
        _index = self._on_ready_notification_reports_item(**on)
        self.browser.hover_to(self.browser.get_elements_by_condition(
            self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True)[0])
        self.browser.clicks(self.LCT.READYNOTIFRP_EVENT_ID_CHECKBOX, on_elements=lambda index, _: index == _index, stop_on_first=True)
        if is_delete:
            self.browser.wait_visibility_of_element_located(self.LCT.READYNOTIFRP_EVENT_DISMISS)
            self.browser.click(self.LCT.READYNOTIFRP_EVENT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.READYNOTIFRP_EVENT_DISMISS_CONFIRM)
            self.browser.click(self.LCT.READYNOTIFRP_EVENT_DISMISS_CONFIRM)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYCALLRERP_ROOT, inverse=True)
        # self.wait_for_ready_reports_available()

    def _on_ready_notification_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_data = self.get_ready_notification_event_reports_detail()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such sent notification report exist on {_on}.')

    def _on_ready_notification_reports(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        # self.wait_for_ready_reports_available()
        all_data = self.get_ready_notification_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such sent notification report exist on {_on}.')

    def get_ready_notification_event_reports_detail(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.READYNOTIFRP_COLLAPSEICON) and self.browser.get_element(self.LCT.READYNOTIFRP_COLLAPSEICON).is_displayed():
            self.browser.wait_visibility_of_element_located(self.LCT.READYNOTIFRP_COLLAPSEICON, True)
            self.browser.click(self.LCT.READYNOTIFRP_COLLAPSEICON)
        self.wait_for_event_reports_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, timeout=10)
        output = []
        for element in self.browser.get_elements(self.LCT.READYNOTIFRP_EVENT_REPORT_ROW):
            header_elements = self.browser.get_child_elements(element, self.LCT.READYNOTIFRP_EVENT_REPORT_HEADER)
            header = [text.replace(':', '') for text in self.browser.get_texts(header_elements)]
            content_elements = self.browser.get_child_elements(element, self.LCT.READYNOTIFRP_EVENT_REPORT_CONTENT)
            content = self.browser.get_texts(content_elements)
            output.append({key: value for key, value in zip(header, content)})
            # for i in range(0, len(content), len(header)):
            #     output.append({
            #         'Event ID': content[i],
            #         'Event time': content[i + 1],
            #         'Event type': content[i + 2],
            #         'Symptom': content[i + 3] if len(header) == 4 else ''
            #     })
        return output

    def edit_ready_notification_event_report_on(self, **on):
        _index = self._on_ready_notification_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, inverse=True)
        self.browser.clicks(self.LCT.READYNOTIFRP_EVENT_REPORT_EDIT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_ready_notification_event_report_on(self, **on):
        _index = self._on_ready_notification_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_EVENT_REPORT_ROW, inverse=True)
        self.browser.clicks(self.LCT.READYNOTIFRP_CONTENT_MANAGERP, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    @staticmethod
    def convert_datetime_utc_or_est(original_datetime_str=None):
        datetime_format = "%m/%d/%Y,%H:%M:%S"
        original_datetime = datetime.strptime(original_datetime_str.split(' ')[0] + original_datetime_str.split(' ')[1], datetime_format)
        # Adjust the original datetime to UTC
        original_datetime_utc = original_datetime - timedelta(hours=0)
        # Format the datetime as a string in the desired format
        formatted_datetime_str = original_datetime_utc.strftime("%m/%d/%Y %H:%M:%S")
        return formatted_datetime_str

    @staticmethod
    def format_datetime(original_datetime_str=None):
        datetime_format = "%m/%d/%Y%H:%M:%S"
        original_datetime = datetime.strptime(original_datetime_str.split(' ')[0] + original_datetime_str.split(' ')[1], datetime_format)
        # Adjust the original datetime to UTC
        original_datetime_utc = original_datetime - timedelta(hours=0)
        # Format the datetime as a string in the desired format
        formatted_datetime_str = original_datetime_utc.strftime("%m/%d/%Y %H:%M:%S")
        return formatted_datetime_str

    def get_message_banner(self):
        self.browser.wait_visibility_of_element_located(self.LCT.MSG_ARCHIVED_STUDY)
        return self.browser.get_text(self.LCT.MSG_ARCHIVED_STUDY)

    def get_image_interim_report_details(self, test_summary=False, tachycardia=False, bradycardia=False, atrial_fibrillation=False, pause=False, pdf_report=False, test_summary_1=False):
        if test_summary:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element_hide(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, self.LCT.SENTINTERIMRP_TOTAL_TIME, image_name='test_summary')
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
        if tachycardia:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TACHYCARDIA, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_TACHYCARDIA)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, image_name='tachycardia')
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
        if bradycardia:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_BRADYCARDIA, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_BRADYCARDIA)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, image_name='bradycardia')
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
        if atrial_fibrillation:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_ATRIAL_FIBRILLATION, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_ATRIAL_FIBRILLATION)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, image_name='atrial_fibrillation')
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
        if pause:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_PAUSE, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_PAUSE)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, image_name='pause')
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
        if pdf_report:
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_UI, inverse=True)
            self.browser.take_screenshot_by_element(self.LCT.PDF_REPORT_UI, image_name='pdf_report')
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_UI, inverse=True)
        if test_summary_1:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element_hide(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, self.LCT.SENTINTERIMRP_TOTAL_TIME, image_name='test_summary_1')
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)

    def check_interim_report_summary(self, image_name_original=None, image_name_compare=None, timeout=200):
        start_time = time.time()
        while time.time() - start_time < timeout:
            # Wait for certain elements to be visible on the page
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_NAV_HEADER)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_NAV_CONTENT, inverse=True)
            # Construct paths to the original and compared images
            original_image_path = os.path.join('results', 'img_original', f'{image_name_original}.png').replace('\\', '/')
            compare_image_path = os.path.join('results', 'img_compare', f'{image_name_compare}.png').replace('\\', '/')
            # Load images
            img_original = cv2.imread(original_image_path)
            img_compare = cv2.imread(compare_image_path)
            # Check if images loaded successfully
            if img_original is None or img_compare is None:
                time.sleep(1)  # Check again after 0.5 seconds
                continue  # Skip the rest of the loop iteration
            # Compare images (consider using more robust comparison methods)
            if np.array_equal(img_original, img_compare):
                # os.remove(compare_image_path)
                return True
            else:
                # os.remove(compare_image_path)
                return False
        return False  # Return False if timeout is reached without finding a match

    def edit_interim_report_summary(self, min_hr=None, max_hr=None, min_avg_hr=None, max_avg_hr=None, min_max_hr=None, max_max_hr=None, is_save=True):
        if min_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MINHR, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_MINHR)
            self.browser.input_text(self.LCT.SENTINTERIMRP_SUMMARY_MINHR, min_hr)
        if max_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MAXHR, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_MAXHR)
            self.browser.input_text(self.LCT.SENTINTERIMRP_SUMMARY_MAXHR, max_hr)
        if min_avg_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MINAVGHR, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_MINAVGHR)
            self.browser.input_text(self.LCT.SENTINTERIMRP_SUMMARY_MINAVGHR, min_avg_hr)
        if max_avg_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MAXAVGHR, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_MAXAVGHR)
            self.browser.input_text(self.LCT.SENTINTERIMRP_SUMMARY_MAXAVGHR, max_avg_hr)
        if min_max_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MINMAXHR, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_MINMAXHR)
            self.browser.input_text(self.LCT.SENTINTERIMRP_SUMMARY_MINMAXHR, min_max_hr)
        if max_max_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MAXMAXHR, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_MAXMAXHR)
            self.browser.input_text(self.LCT.SENTINTERIMRP_SUMMARY_MAXMAXHR, max_max_hr)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_SAVE_REPORT, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_SAVE_REPORT)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_SAVE_REPORT, inverse=True)

    def check_active_summary_report(self):
        output = {
            'Refresh Page': False if 'disabled' in self.browser.get_attribute_value(self.LCT.SENTINTERIMRP_SUMMARY_REFRESH, 'class') else True
        }
        if self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_FILTER) and self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_FILTER).is_displayed():
            output['Filter'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.SENTINTERIMRP_SUMMARY_FILTER, 'class') else True
        if self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR) and self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR).is_displayed():
            output['Calculate Avg HR'] = False if self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR).get_attribute('disabled') else True
        if self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_REFRESH) and self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_REFRESH).is_displayed():
            output['Refresh Event'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_REFRESH, 'class') else True
        if self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_FILTER) and self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_FILTER).is_displayed():
            output['Strips Filter'] = False if self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_FILTER).get_attribute('disabled') else True
        self.logger.info(output)
        return output

    def filter_on_summary_report(self, test_summary=False, tachycardia=False, bradycardia=False, atrial_fibrillation=False, pause=False, manual=False, calculate_hr=False, calculate_avg_hr=False):
        if test_summary:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY, inverse=True)
        if tachycardia:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TACHYCARDIA)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_TACHYCARDIA)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TACHYCARDIA, inverse=True)
        if bradycardia:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_BRADYCARDIA)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_BRADYCARDIA)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_BRADYCARDIA, inverse=True)
        if atrial_fibrillation:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_ATRIAL_FIBRILLATION)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_ATRIAL_FIBRILLATION)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_ATRIAL_FIBRILLATION, inverse=True)
        if pause:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_PAUSE)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_PAUSE)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_PAUSE, inverse=True)
        if manual:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MANUAL)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_MANUAL)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_MANUAL, inverse=True)
        if calculate_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE, inverse=True)
        if calculate_avg_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR, inverse=True)

    def wait_event_interim_report_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_SUMMARY_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_SUMMARY_CONTENT, inverse=True)

    def wait_event_interim_strips_selection_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CONTENT_WAIT, inverse=True)

    def get_events_interim_report(self, row=None):
        self.wait_event_interim_report_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.SENTINTERIMRP_SUMMARY_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_HEADER)
                content = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                self.browser.js_click(self.LCT.SENTINTERIMRP_SUMMARY_NEXT, is_scroll=True)
                if self.browser.wait_visibility_of_element_located(self.LCT.MSG_NO_MORE_STUDY) and self.browser.get_element(self.LCT.MSG_NO_MORE_STUDY).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_event_interim_report_available()
            else:
                self.wait_event_interim_report_available()
                header = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_HEADER)
                content = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_events_interim_strips_selection(self, row=None):
        self.wait_event_interim_strips_selection_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_HEADER)
                for element in self.browser.get_elements(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_ROW):
                    content = self.browser.get_texts(self.browser.get_child_elements(element, self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CONTENT))
                    content.append(False if self.browser.get_attribute_value(self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_INCLUDE_REPORT), 'disabled') else True)
                    output_1 += Utils.group_tabular_data(header, content, row=row)
                self.browser.js_click(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_NEXT, is_scroll=True)
                if self.browser.wait_visibility_of_element_located(self.LCT.MSG_NO_MORE_STUDY) and self.browser.get_element(self.LCT.MSG_NO_MORE_STUDY).is_displayed():
                    return [{k: v.replace('\n', ' | ') if isinstance(v, str) else v for k, v in c.items()} for c in output_1]
                self.wait_event_interim_strips_selection_available()
            else:
                self.wait_event_interim_strips_selection_available()
                header = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_HEADER)
                for element in self.browser.get_elements(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_ROW):
                    content = self.browser.get_texts(self.browser.get_child_elements(element, self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CONTENT))
                    content.append(False if self.browser.get_attribute_value(self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_INCLUDE_REPORT), 'disabled') else True)
                    output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                self.logger.info(output)
                return [{k: v.replace('\n', ' | ') if isinstance(v, str) else v for k, v in c.items()} for c in output]

    def get_events_interim_report_on_page(self, row=None):
        self.wait_event_interim_report_available()
        output = []
        header = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_HEADER)
        content = self.browser.get_texts(self.LCT.SENTINTERIMRP_SUMMARY_CONTENT)
        output += Utils.group_tabular_data(header, content, row=row)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def sort_event_interim_reports(self, field, asc_or_desc):
        _index_header = {
            'event id': 0,
        }
        for _ in range(2):
            sort_element = self.browser.get_elements(self.LCT.SENTINTERIMRP_SUMMARY_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_element, 'aria-label'):
                break
            self.browser.click(sort_element)

    def edit_event_interim_on(self, **on):
        self.wait_event_interim_report_available()
        _index = self._on_events_interim_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTINTERIMRP_SUMMARY_ROW, _index, is_scroll=True)
        self.browser.clicks(self.LCT.SENTINTERIMRP_SUMMARY_EDIT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_events_interim_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_event_interim_report_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_events_interim_report_on_page()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def view_interim_report_event_information_on(self, **on):
        self.wait_event_interim_report_available()
        _index = self._on_events_interim_item(**on)
        self.browser.clicks(self.LCT.SENTINTERIMRP_SUMMARY_EVENT_ID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_image_calculate_interim_report(self, calculate_avg_hr=False):
        if calculate_avg_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_REFRESH, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_REFRESH)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_IMAGE_CALCULATE_AVG, inverse=True)
            self.browser.take_screenshot_by_element(self.LCT.SENTINTERIMRP_SUMMARY_IMAGE_CALCULATE_AVG, image_name='calculate_avg_hr')
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_IMAGE_CALCULATE_AVG, inverse=True)

    def edit_event_interim_strips_on(self, **on):
        self.wait_event_interim_strips_selection_available()
        _index = self._on_events_interim_strips_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_ROW, _index)
        self.browser.clicks(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_EDIT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_events_interim_strips_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_event_interim_strips_selection_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_events_interim_strips_selection()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def view_interim_strips_event_information_on(self, **on):
        self.wait_event_interim_strips_selection_available()
        _index = self._on_events_interim_strips_item(**on)
        self.browser.clicks(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_EVENT_ID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_interim_strips_ecg_information_on(self, **on):
        self.wait_event_interim_strips_selection_available()
        _index = self._on_events_interim_strips_item(**on)
        self.browser.hover_to_by_index(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_ROW, _index)
        self.browser.clicks(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_ECG, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def check_strips_container_available(self):
        output = {
            'Strips Container': True if self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CONTAINER) and self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CONTAINER).is_displayed() else False
        }
        self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CLOSE_BUTTON, inverse=True)
        self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CLOSE_BUTTON)
        return output

    def checkbox_include_report(self, is_include_report=False):
        self.wait_event_interim_strips_selection_available()
        for _ in range(2):
            if is_include_report:
                if self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_INCLUDE_REPORT).get_attribute('checked') is not None:
                    break
                self.browser.js_click(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_INCLUDE_REPORT)
            else:
                if self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_INCLUDE_REPORT).get_attribute('checked') is None:
                    break
                self.browser.js_click(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_INCLUDE_REPORT)

    def get_value_include_strips(self):
        self.wait_event_interim_strips_selection_available()
        output = {
            'Include Strips': 'X' if self.browser.get_element(self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_CLOSE).is_displayed() else True
        }
        return output

    def edit_interim_pdf_report(self, facility_note=None, technician_comment=None, is_save=False):
        if facility_note:
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_EDIT_ELEMENT)
            self.browser.click(self.LCT.PDF_REPORT_EDIT_ELEMENT)
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_INPUT_FACILITY_NOTE, inverse=True)
            self.browser.input_text(self.LCT.PDF_REPORT_INPUT_FACILITY_NOTE, facility_note)
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_SAVE_NOTE, inverse=True)
            self.browser.click(self.LCT.PDF_REPORT_SAVE_NOTE)
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_CURRENT_FACILITY_NOTES, inverse=True)
        if technician_comment:
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_INPUT_TECHNICIAN_COMMENT)
            self.browser.input_text(self.LCT.PDF_REPORT_INPUT_TECHNICIAN_COMMENT, technician_comment)
            self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_INPUT_TECHNICIAN_COMMENT, inverse=True)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_SAVE_REPORT)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_SAVE_REPORT)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_SAVE_REPORT, inverse=True)

    def get_current_value_interim_pdf_report(self):
        output = {
            'Facility Notes': self.browser.get_text(self.LCT.PDF_REPORT_CURRENT_FACILITY_NOTES),
            'Technician Comments': self.browser.get_text(self.LCT.PDF_REPORT_INPUT_TECHNICIAN_COMMENT)
        }
        return output

    def clear_facility_note(self):
        self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_EDIT_ELEMENT)
        self.browser.click(self.LCT.PDF_REPORT_EDIT_ELEMENT)
        self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_INPUT_FACILITY_NOTE, inverse=True)
        self.browser.clear_text(self.LCT.PDF_REPORT_INPUT_FACILITY_NOTE)
        self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_SAVE_NOTE, inverse=True)
        self.browser.click(self.LCT.PDF_REPORT_SAVE_NOTE)
        self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_CURRENT_FACILITY_NOTES, inverse=True)

    def get_header_tabs_on_beats_hr(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_TYPE_TRIP, inverse=True)
        output = {
            'Artifact areas': self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_AREA),
            'AFib': self.browser.get_text(self.LCT.BEAT_HR_AFIB).split('\n'),
            'R-R histogram': self.browser.get_text(self.LCT.BEAT_HR_HEAT_MAP),
            'HR summary': self.browser.get_text(self.LCT.BEAT_HR_HR_SUMMARY),
            'Add new event': self.browser.get_text(self.LCT.BEAT_HR_ADD_EVENT),
            'Add a bookmark': self.browser.get_text(self.LCT.BEAT_HR_ADD_BOOKMARK)
        }
        return output

    def get_current_airp_pagination(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_PAGE)
        output = dict()
        output['Page'] = self.browser.get_attribute_value(self.LCT.BEAT_HR_PAGE, 'value')
        return output

    def get_current_total_page_airp_pagination(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_TOTAL_PAGE)
        output = self.browser.get_text(self.LCT.BEAT_HR_TOTAL_PAGE)
        number_str = output.split('/')[1].strip()
        number = int(number_str)
        return number

    def pagination_aireports(self, next_or_previous=None):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_NEXT)
                self.browser.js_click(self.LCT.BEAT_HR_NEXT)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_EVENTS, inverse=True)
                break
            if next_or_previous == 'previous':
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_PREVIOUS)
                self.browser.js_click(self.LCT.BEAT_HR_PREVIOUS)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_EVENTS, inverse=True)
                break

    def edit_page_number(self, page_number=None):
        if page_number:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_PAGE)
            self.browser.input_text(self.LCT.BEAT_HR_PAGE, page_number)
            self.browser.get_element(self.LCT.BEAT_HR_PAGE).send_keys(Keys.ENTER)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_PAGE, inverse=True)
            if 'error' in self.browser.get_attribute_value(self.LCT.BEAT_HR_PAGE, 'class'):
                return False
            else:
                return True

    def check_toolbar_ecg_viewer_available(self):
        output = {
            'Speed': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SPEED) and self.browser.get_element(self.LCT.BEAT_HR_ECG_SPEED).get_attribute(
                'disabled') else True,
            'Gain': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_GAIN) and self.browser.get_element(self.LCT.BEAT_HR_ECG_GAIN).get_attribute('disabled') else True,
            'High Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_HIGH_PASS) and self.browser.get_element(self.LCT.BEAT_HR_ECG_HIGH_PASS).get_attribute(
                'disabled') else True,
            'Low Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_LOW_PASS) and self.browser.get_element(self.LCT.BEAT_HR_ECG_LOW_PASS).get_attribute(
                'disabled') else True,
            'Show/Hide CH1': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH1) and self.browser.get_element(self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH1).get_attribute(
                'disabled') else True,
            'Show/Hide CH2': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH2) and self.browser.get_element(self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH2).get_attribute(
                'disabled') else True,
            'Show/Hide CH3': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH3) and self.browser.get_element(self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH3).get_attribute(
                'disabled') else True,
            'Capture': False if not (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_CAPTURE).is_displayed()) or (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE) and
                                                                  self.browser.get_element(self.LCT.BEAT_HR_ECG_CAPTURE).get_attribute('disabled')) else True,
            'Beat Marker Tool': False if not (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL).is_displayed()) or (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL) and
                                                                           self.browser.get_element(self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL).get_attribute('disabled')) else True,
            'View All Strip': False if not (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP).is_displayed()) or (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP) and
                                                                         self.browser.get_element(self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP).get_attribute('disabled')) else True,
            'Add Beat Marker N': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_N) and self.browser.get_element(self.LCT.BEAT_HR_ECG_BEAT_MARKER_N).get_attribute(
                'disabled') else True,
            'Add Beat Marker S': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_S) and self.browser.get_element(self.LCT.BEAT_HR_ECG_BEAT_MARKER_S).get_attribute(
                'disabled') else True,
            'Add Beat Marker V': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_V) and self.browser.get_element(self.LCT.BEAT_HR_ECG_BEAT_MARKER_V).get_attribute(
                'disabled') else True,
            'Add Beat Marker Q': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_Q) and self.browser.get_element(self.LCT.BEAT_HR_ECG_BEAT_MARKER_Q).get_attribute(
                'disabled') else True,
            'Beat Marker Delete': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_DELETE) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_DELETE).get_attribute('disabled') else True,
            'Save': False if self.browser.wait_visibility_of_element_located(
                self.LCT.SAVE_BUTTON) and 'disabled' in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON, 'class') else True,
        }
        self.logger.info(output)
        return output

    def check_event_airp_available(self):
        output = {
            'Cancel': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_CANCEL) and self.browser.get_element(self.LCT.BEAT_HR_CANCEL).get_attribute(
                'disabled') else True,
            'Jump To Start Time': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_JUMP_START_TIME) and self.browser.get_element(
                self.LCT.BEAT_HR_JUMP_START_TIME).get_attribute('disabled') else True,
            'Jump To End Time': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_JUMP_END_TIME) and self.browser.get_element(
                self.LCT.BEAT_HR_JUMP_END_TIME).get_attribute('disabled') else True,
        }
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE).is_displayed():
            output['End Time Message Date'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE)
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME).is_displayed():
            output['End Time Message Time'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME)
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_DATE) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_DATE).is_displayed():
            output['Start Time Message Date'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_DATE)
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_TIME) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_TIME).is_displayed():
            output['Start Time Message Time'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_TIME)
        self.logger.info(output)
        return output

    def change_event_duration_airp(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_CHANGE_EVENT_DURATION)
        self.browser.click(self.LCT.BEAT_HR_CHANGE_EVENT_DURATION)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_CHANGE_EVENT_DURATION, inverse=True)

    def get_start_and_end_time(self):
        output = {
            'End Time Date': self.browser.get_attribute_value(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_INPUT_DATE, 'value'),
            'End Time Time': self.browser.get_attribute_value(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_INPUT_TIME, 'value'),
            'Start Time Date': self.browser.get_attribute_value(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_INPUT_DATE, 'value'),
            'Start Time Time': self.browser.get_attribute_value(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_INPUT_TIME, 'value'),
        }
        self.logger.info(output)
        return output

    def mark_a_strip_airp(self, is_save=False, technician_comment=None, title=None):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE)
        self.browser.click(self.LCT.BEAT_HR_ECG_CAPTURE)
        if title:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_TITLE_INPUT)
            self.browser.input_text(self.LCT.BEAT_HR_ARTIFACT_TITLE_INPUT, technician_comment)
        if technician_comment:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_TECHNICIAN_INPUT)
            self.browser.input_text(self.LCT.BEAT_HR_ARTIFACT_TECHNICIAN_INPUT, technician_comment)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE_SUBMMIT, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_ECG_CAPTURE_SUBMMIT)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE_SUBMMIT, inverse=True)

    def get_message_input_airp(self):
        self.browser.wait_visibility_of_element_located(self.LCT.MSG_BEAT_HR_INPUT_TITLE)
        msg = self.browser.get_text(self.LCT.MSG_BEAT_HR_INPUT_TITLE)
        return msg

    def navigate_add_new_event_airp(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ADD_EVENT) and self.browser.get_element(self.LCT.BEAT_HR_ADD_EVENT).is_displayed():
                self.browser.click(self.LCT.BEAT_HR_ADD_EVENT)
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ADD_EVENT, inverse=True)
                break
            elif time.time() - start_time > 15 * 60:  # 15 minutes in seconds
                return False

    def edit_artifact_event(self, is_cancel=False, is_start_time=False, is_submit=False,
                            is_end_time=False, x_offset_start_time=None, y_offset_start_time=None,
                            x_offset_end_time=None, y_offset_end_time=None, is_close=False, is_hr_chart=False):
        start_time = time.time()
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_CANCEL, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_CANCEL)
        if is_start_time:
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CANVAS) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_CANVAS).is_displayed():
                    element = self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_CANVAS)
                    self.browser.click_by_offset(element, x_offset_start_time, y_offset_start_time)
                    break
                elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                    return self
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CANVAS, inverse=True)
        if is_end_time:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CANVAS, inverse=True)
            element = self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_CANVAS)
            self.browser.click_by_offset(element, x_offset_end_time, y_offset_end_time)
        if is_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUBMIT, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_SUBMIT)
            # self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUBMIT, inverse=True)
        if is_close:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CLOSE, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_ARTIFACT_CLOSE)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CLOSE, inverse=True)
        if is_hr_chart:
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_HR_CHART) and self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_HR_CHART).is_displayed():
                    element = self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_HR_CHART)
                    self.browser.click_by_offset(element, x_offset_start_time, y_offset_start_time)
                    break
                elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                    return self
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_HR_CHART, inverse=True)

    def _on_new_events_artifact_strips_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_new_event_artifact()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def _on_events_artifact_strips_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_events_artifact_on_page()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def get_events_artifact_on_page(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_EVENTS_OPTION)
        return elements

    def view_new_event_artifact_strips_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION, inverse=True)
        _index = self._on_new_events_artifact_strips_item(**on)
        self.browser.hover_to_by_index(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION, _index)
        self.browser.clicks(self.LCT.BEAT_HR_ARTIFACT_VIEW, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_event_artifact_strips_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        _index = self._on_events_artifact_strips_item(**on)
        self.browser.hover_to_by_index(self.LCT.BEAT_HR_EVENTS_OPTION, _index)
        self.browser.clicks(self.LCT.BEAT_HR_EVENTS_OPTION, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def delete_new_events_artifact_strips_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION, inverse=True)
        _index = self._on_new_events_artifact_strips_item(**on)
        self.browser.hover_to_by_index(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION, _index)
        self.browser.clicks(self.LCT.BEAT_HR_ARTIFACT_DELETED, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_REMOVE, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_ARTIFACT_REMOVE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION, inverse=True)

    def get_new_event_artifact(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_ARTIFACT_NEW_EVENT_OPTION)
        return elements

    def get_number_new_events_artifact(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_NUMBER_EVENT_NEW, inverse=True)
        number_event = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_NUMBER_EVENT_NEW)
        return number_event

    def deleted_artifact_event_airp(self, is_save=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_EVENTS_OPTION)
        self.browser.click(elements[0])
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED)
        self.browser.click(self.LCT.BEAT_HR_DELETED)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
        if is_save:
            if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and 'disabled' not in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON, 'class'):
                self.browser.click(self.LCT.SAVE_BUTTON)
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and self.browser.get_element(self.LCT.SAVE_BUTTON).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON, inverse=True)
                    break
                elif time.time() - start_time > 15 * 60:  # 15 minutes in seconds
                    return False

    def get_number_artifact_event_on_page(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_EVENTS_OPTION)
        return len(elements)

    def deleted_multiple_artifact_event_airp(self, is_save=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_EVENTS_OPTION)
        self.browser.click(elements[0])
        self.browser.select_all_value()
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_DELETED)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
        if is_save:
            if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and 'disabled' not in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON, 'class'):
                self.browser.click(self.LCT.SAVE_BUTTON)
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and self.browser.get_element(self.LCT.SAVE_BUTTON).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON, inverse=True)
                    return len(elements)
                elif time.time() - start_time > 15 * 60:  # 15 minutes in seconds
                    return False

    def get_lists_of_beats_airp(self, beat=None):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.TYPE_BEATS) and self.browser.get_element(self.LCT.TYPE_BEATS).is_displayed():
                break
            elif time.time() - start_time > 15 * 60:  # 15 minutes in seconds
                break
        lists_of_beats = self.browser.get_texts(self.LCT.TYPE_BEATS)
        return lists_of_beats

    def mark_call_reviewed(self, mark_reviewed=False, mark_unreviewed=False):
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_OPTION) and self.browser.get_element(self.LCT.BEAT_HR_HEATMAP_OPTION).is_displayed():
                self.browser.click(self.LCT.BEAT_HR_HEATMAP_OPTION)
                break
        if mark_reviewed:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_REVIEWED)
            self.browser.click(self.LCT.BEAT_HR_HEATMAP_REVIEWED)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_REVIEWED, inverse=True)
        if mark_unreviewed:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_UNREVIEWED)
            self.browser.click(self.LCT.BEAT_HR_HEATMAP_UNREVIEWED)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_UNREVIEWED, inverse=True)

    def check_mark_call_review_available(self):
        self.browser.hover_to(self.LCT.BEAT_HR_HEATMAP_ARROW)
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_COMPLETE_REVIEW) and self.browser.get_element(self.LCT.BEAT_HR_HEATMAP_COMPLETE_REVIEW).is_displayed():
            return True
        else:
            return False

    def check_heatmap_available(self):
        output = {
            'Strip beats': False if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS) and self.browser.get_element(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS).is_displayed() else True,
            'ECG viewer': True if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_ECG_VIEWER) and self.browser.get_element(self.LCT.BEAT_HR_HEATMAP_ECG_VIEWER).is_displayed() else False
        }
        return output

    def select_thumbnail_option_on(self, items):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_OPTION, inverse=True)
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        for item in _items:
            self.browser.clicks(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower().strip('✨') == item.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_OPTION, inverse=True)
        output = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_ACTIVE)
        output = [item.strip('✨') for item in output if item]
        return output

    def filter_header_beats_hr(self, size=None, gain=None, highpass=None, is_change=False,
                               is_save=False, panel_tab=None):
        if size:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_THUMBNAIL_SIZE)
            self.browser.click(self.LCT.BEAT_HR_THUMBNAIL_SIZE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_OPTION)
            self.browser.clicks(self.LCT.BEAT_HR_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == size.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
            elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
            return len(elements)
        if gain:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_THUMBNAIL_GAIN, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_THUMBNAIL_GAIN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_GAIN, inverse=True)
            self.browser.clicks(self.LCT.BEAT_HR_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == size.lower(),
                                stop_on_first=True)
        if highpass:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_THUMBNAIL_HIGHPASS, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_THUMBNAIL_HIGHPASS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_THUMBNAIL_HIGHPASS, inverse=True)
            self.browser.clicks(self.LCT.BEAT_HR_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == size.lower(),
                                stop_on_first=True)
        if panel_tab:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_PANEL_TAB)
            self.browser.clicks(self.LCT.BEAT_HR_ARTIFACT_PANEL_TAB,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == panel_tab.lower(),
                                stop_on_first=True)
        if is_change:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_RESET_CHANGE, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_ARTIFACT_RESET_CHANGE)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON, inverse=True)
            self.browser.click(self.LCT.SAVE_BUTTON)
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and self.browser.get_element(self.LCT.SAVE_BUTTON).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON)
                    break
                elif time.time() - start_time > 15 * 60:  # 15 minutes in seconds
                    return False
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION) and self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)[0].is_displayed():
                return True
            elif self.browser.wait_visibility_of_element_located(self.LCT.MSG_BEAT) and self.browser.get_element(self.LCT.MSG_BEAT).is_displayed():
                return False
            if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and 'disabled' not in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON, 'class'):
                self.browser.click(self.LCT.SAVE_BUTTON)

    def verify_number_size_heatmap(self, number_small=None, number_medium=None, number_large=None):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
        if int(number_small) >= int(number_medium) >= int(number_large):
            return True
        return False

    def get_message_on_aireport(self):
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.MSG_NO_MORE_STUDY) and self.browser.get_element(self.LCT.MSG_NO_MORE_STUDY).is_displayed():
                self.browser.hover_to(self.LCT.MSG_NO_MORE_STUDY)
                output = self.browser.get_text(self.LCT.MSG_NO_MORE_STUDY)
                self.browser.wait_visibility_of_element_located(self.LCT.MSG_NO_MORE_STUDY, inverse=True)
                self.logger.info(output)
                return output

    def wait_menu_items_ecg_events_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_MENU) and self.browser.get_elements(self.LCT.ECG_EVENT_MENU)[0].is_displayed():
                break
            elif time.time() - start_time > 5 * 60:
                break

    def wait_menu_items_strips_management_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.STRIP_MANAGEMENT_MENU) and self.browser.get_elements(self.LCT.STRIP_MANAGEMENT_MENU)[0].is_displayed():
                break
            elif time.time() - start_time > 5 * 60:
                break
