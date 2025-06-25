#!/usr/bin/env python3
import time

try:
    from project_bioflux_ai_report_portal.lib.WebPage import WebPage
    from project_bioflux_ai_report_portal.config.web_locators import reports as locators
    from selenium.webdriver import Keys
    from corelib import Utils
    from datetime import datetime, timedelta
    import cv2
    import os
    import re
    import numpy as np
    # from PIL import Image
    import random
    from selenium.webdriver.common.by import By

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
        for typ in self.browser.get_elements(self.LCT.REPORT_SUBTABS):
            if 'active' in self.browser.get_attribute_value(typ, 'class'):
                return self.browser.get_text(typ).replace('\n', ' | ')

    def navigate_to_reports(self):
        self.browser.open_page(self.URL + '/reports')

    def wait_for_pending_reports_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGRP_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGRP_CONTENT, inverse=True)

    def wait_for_ready_reports_available(self):
        if self.get_current_report_type().lower() in ('notification reports', 'call required'):
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_ROOT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_HEADER2ST, inverse=True)
        if 'interim reports' in self.get_current_report_type().lower() \
                or 'end of user report' in self.get_current_report_type().lower():
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_HEADER1ST)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.READYRP_CONTENT1ST, inverse=True)

    def wait_for_sent_reports_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTRP_HEADER, inverse=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTRP_CONTENT, inverse=True)

    def _select_report_state(self, report_state):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_TABS)
        self.browser.clicks(self.LCT.REPORT_TABS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == report_state.lower(),
                            stop_on_first=True)

    def _select_report_type(self, report_type):  # Maybe overlapped by no-data__icon so perform js_clicks
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_SUBTABS, inverse=True)
        self.browser.js_clicks(self.LCT.REPORT_SUBTABS,
                               on_elements=lambda _, e: report_type.lower() in self.browser.get_text(e).lower(),
                               stop_on_first=True)

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
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_TABS, inverse=True)
            self._select_report_state(report_state)
        if report_type:
            self._select_report_type(report_type)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_INPUT)
            self.browser.click(self.LCT.FACILITY_INPUT + '/../../../..')
            self.browser.input_text(self.LCT.FACILITY_INPUT, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS, inverse=True)
            self.browser.clicks(self.LCT.FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if search_by:
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
                    self.browser.wait_visibility_of_element_located(self.LCT.TEXTSEARCH, inverse=True)
            else:
                self.browser.input_text(self.LCT.TEXTSEARCH, text_search)
                self.browser.get_element(self.LCT.TEXTSEARCH).send_keys(Keys.ENTER)
                self.browser.wait_visibility_of_element_located(self.LCT.TEXTSEARCH, inverse=True)
        if by_report:
            self._filter_by_report_type(by_report)
        if by_assignee:
            if self.browser.wait_visibility_of_element_located(self.LCT.BYASSIGNEE) and self.browser.get_element(
                    self.LCT.BYASSIGNEE).is_displayed():
                self.browser.click(self.LCT.BYASSIGNEE)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BYASSIGNEE_OPTIONS)
                self.browser.clicks(self.LCT.BYASSIGNEE_OPTIONS,
                                    on_elements=lambda _, e: by_assignee.lower() in self.browser.get_text(e).lower(),
                                    stop_on_first=True)
            else:
                return self
        wait_func = {
            'pending': self.wait_for_pending_reports_available,
            'ready': self.wait_for_ready_reports_available,
            'sent': self.wait_for_sent_reports_available
        }
        wait_func[self.get_current_report_state().lower()]()

    def toggle_call_required_reports_item(self):
        pass

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

    # def sort_datetime_descending(self, date_time=None, duration=None):
    #     self.wait_for_sent_reports_available()
    #     if date_time:
    #         # Parse the date strings into datetime objects
    #         date_list = [datetime.strptime(date, '%m/%d/%Y') for date in date_time]
    #         # Sort the datetime objects in reverse order
    #         sorted_dates = sorted(date_list, reverse=True)
    #         # Convert back to string format if needed
    #         sorted_dates_str = [date.strftime('%m/%d/%Y') for date in sorted_dates]
    #         return sorted_dates_str
    #     if duration:
    #         # Convert time durations to minutes for easier comparison
    #         output_in_minutes = [sum(int(num[:-1]) * 60 ** i for i, num in enumerate(reversed(part.split()))) for part in duration]
    #         # Combine the original list with the converted values
    #         combined_list = list(zip(duration, output_in_minutes))
    #         # Sort the combined list in descending order based on the converted values
    #         sorted_list = sorted(combined_list, key=lambda x: x[1], reverse=True)
    #         # Extract the sorted time durations
    #         sorted_output = [item[0] for item in sorted_list]
    #         return sorted_output

    # def sort_datetime_ascending(self, date_time=None, duration=None):
    #     self.wait_for_sent_reports_available()
    #     if date_time:
    #         # Parse the date strings into datetime objects
    #         date_list = [datetime.strptime(date, '%m/%d/%Y') for date in date_time]
    #         # Sort the datetime objects in reverse order
    #         sorted_dates = sorted(date_list, reverse=False)
    #         # Convert back to string format if needed
    #         sorted_dates_str = [date.strftime('%m/%d/%Y') for date in sorted_dates]
    #         return sorted_dates_str
    #     if duration:
    #         # Convert time durations to minutes for easier comparison
    #         output_in_minutes = [sum(int(num[:-1]) * 60 ** i for i, num in enumerate(reversed(part.split()))) for part in duration]
    #         # Combine the original list with the converted values
    #         combined_list = list(zip(duration, output_in_minutes))
    #         # Sort the combined list in ascending order based on the converted values
    #         sorted_list = sorted(combined_list, key=lambda x: x[1])
    #         # Extract the sorted time durations
    #         sorted_output = [item[0] for item in sorted_list]
    #         return sorted_output

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
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_EOU_NEW_REPORT_STATUS) and \
                    self.browser.get_elements(self.LCT.PENDINGEOU_EOU_NEW_REPORT_STATUS)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.PENDINGEOU_EOU_NEW_REPORT_STATUS,
                                                                     inverse=True)
                _index = self._on_pending_eou_reports_item(**on)
                # self.wait_for_pending_reports_available()
                self.browser.js_clicks(self.LCT.PENDINGEOU_EOU_NEW_REPORT_STATUS, on_elements=lambda i, _: i == _index,
                                       stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def _on_pending_eou_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_pending_reports_available()
        all_data = self.get_pending_eou_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such pending notification report exist on {_on}.')

    def get_pending_eou_reports(self, row=None):
        self.wait_for_sent_reports_available()
        headers = self.browser.get_texts(self.LCT.PENDINGEOU_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.PENDINGEOU_CONTENT, row=row)

    def navigate_airp_tab(self, tab=None):
        self.browser.refresh_page()
        self.check_timeout_on_aireport()
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_TABS) and \
                    self.browser.get_elements(self.LCT.REPORT_TABS)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_TABS, inverse=True)
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.BEAT_HR_POPUP_GENERATE) and self.browser.get_element(
                    self.LCT.BEAT_HR_POPUP_GENERATE).is_displayed():
                    self.browser.click(self.LCT.BEAT_HR_POPUP_CLOSE)
                    self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_POPUP_CLOSE, inverse=True)
                self.browser.clicks(self.LCT.REPORT_TABS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 5 * 60:
                self.browser.quit_browser()
                break

    def navigate_airp_artifact(self):
        self.wait_for_element_visibility(self.LCT.BEAT_HR_ARTIFACT_AREA)
        self.browser.click(self.LCT.BEAT_HR_ARTIFACT_AREA)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_AREA, inverse=True)

    def navigate_to_aireport_subtab(self, subtab):
        self.wait_for_element_visibility(self.LCT.BEAT_HR_ARTIFACT_AREA)
        if subtab:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_SUBTAB, inverse=True)
            self.browser.clicks(self.LCT.BEAT_HR_ARTIFACT_SUBTAB,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == subtab.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_SUBTAB, inverse=True)

    def get_all_thumbnail_artifact(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SELECT_THUMBNAIL, inverse=True)
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

    def get_all_thumbnail_hr_summary(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SUMMARY_THUMBNAIL)
        output = []
        summaries = self.browser.get_texts(self.LCT.BEAT_HR_SUMMARY_THUMBNAIL)
        for item in summaries:
            self.logger.info(f"item: {item}")
            contents = item.split('\n')
            date = contents[0]
            number = int(contents[1].split()[1])
            min_val = int(contents[2])
            avg_val = int(contents[4])
            max_val = int(contents[6])
            processed_entry = {
                'Date': date,
                'Day': number,
                'Min': min_val,
                'Avg': avg_val,
                'Max': max_val
            }
            output.append(processed_entry)
        self.logger.info(output)
        return output

    def _on_thumbnail_hr_summary(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SUMMARY_THUMBNAIL)
        all_data = self.browser.get_texts(self.LCT.BEAT_HR_SUMMARY_THUMBNAIL)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i

    def view_thumbnail_hr_summary_on(self, **on):
        _index = self._on_thumbnail_hr_summary(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SUMMARY_THUMBNAIL)
        self.browser.clicks(self.LCT.BEAT_HR_SUMMARY_THUMBNAIL, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

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
        all_data = self.get_all_thumbnail_artifact()
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

    def get_panel_information_event(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT) and self.browser.get_element(
                self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT).is_displayed():
                # self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_EVENT_HEADER)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT,
                                                                     inverse=True)
                content_header = self.browser.get_texts(self.LCT.BEAT_HR_ARTIFACT_EVENT_HEADER)
                content_value = self.browser.get_texts(self.LCT.BEAT_HR_ARTIFACT_EVENT_CONTENT)
                output = {key.replace(':', ''): value for key, value in zip(content_header, content_value)}
                self.logger.info(output)
                return output
            elif time.time() - start_time > 1 * 60:  # 1 minutes in seconds
                break

    def get_minute_info_hr_summary(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_SUMMARY_MINUTE_INFO) and self.browser.get_element(
                self.LCT.BEAT_HR_SUMMARY_MINUTE_INFO).is_displayed():
                output = self.browser.get_text(self.LCT.BEAT_HR_SUMMARY_MINUTE_INFO)
                lines = output.strip().split('\n')
                output = [{lines[i]: lines[i + 1] for i in range(0, len(lines), 2)}]
                self.logger.info(output)
                return output
            elif start_time - time.time() > 1 * 60:
                break

    def get_hr_summary_infor(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_SUMMARY_HEADER)
        content_header = self.browser.get_texts(self.LCT.BEAT_HR_SUMMARY_HEADER)
        content_elements = self.browser.get_elements(self.LCT.BEAT_HR_SUMMARY_CONTENT)
        content_value = [element.get_attribute("value") for element in content_elements]
        output = {key.replace(':', ''): value for key, value in zip(content_header, content_value)}
        self.logger.info(output)
        return output

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
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.TYPE_BEATS) and self.browser.get_element(
                    self.LCT.TYPE_BEATS).is_displayed():
                self.browser.clicks(self.LCT.TYPE_BEATS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == beat.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 5 * 60:
                self.browser.quit_browser()
                break

    def get_elements_cell_on_chart(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CELL_ELEMENT) and \
                    self.browser.get_elements(self.LCT.CELL_ELEMENT)[0].is_displayed():
                break
            elif time.time() - start_time > 10 * 60:  # 5 minutes in seconds
                break
        time.sleep(5)
        elements = self.browser.get_elements(self.LCT.CELL_ELEMENT)
        i = 0
        filtered_elements = []
        for element in elements:
            i = i + 1
            self.logger.info(f"i: {i}, element: {element}")
            number = self.browser.get_text(element)
            if 'K' in number:
                number_value = float(number.replace('K', '')) * 1000
                if 0 < number_value < 100:
                    return self
            elif 0 < int(number) < 100:
                filtered_elements.append(element)
        self.logger.info(f"filtered_elements: {filtered_elements}")

        random_element = random.choice(filtered_elements)
        return random_element

    def get_list_elements_cell_on_chart(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CELL_ELEMENT) and \
                    self.browser.get_elements(self.LCT.CELL_ELEMENT)[0].is_displayed():
                break
            elif time.time() - start_time > 10 * 60:
                break
        time.sleep(5)
        elements = self.browser.get_elements(self.LCT.CELL_ELEMENT)
        filtered_elements = []

        for i, element in enumerate(elements, 1):
            self.logger.info(f"i: {i}, element: {element}")
            number = self.browser.get_text(element)
            try:
                if 'K' in number:
                    number_value = float(number.replace('K', '')) * 1000
                else:
                    number_value = float(number)

                if 1 < number_value < 100:
                    filtered_elements.append(element)
            except ValueError:
                self.logger.warning(f"Invalid number format: {number}")

        self.logger.info(f"filtered_elements: {filtered_elements}")
        return filtered_elements

    def get_elements_cell_on_chart_limit_1000(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CELL_ELEMENT) and \
                    self.browser.get_elements(self.LCT.CELL_ELEMENT)[0].is_displayed():
                break
            elif time.time() - start_time > 5 * 60:
                break

        elements = self.browser.get_elements(self.LCT.CELL_ELEMENT)
        filtered_elements = []

        for element in elements:
            number = self.browser.get_text(element)
            if 'K' in number:
                number_value = float(number.replace('K', '')) * 1000
                if 0 < number_value < 1000:
                    return self
            elif 0 < int(number) < 1000:
                filtered_elements.append(element)
        random_element = random.sample(filtered_elements, k=10)
        return random_element

    def select_cell_on_chart(self, element_or_locator=None):
        self.browser.hover_to(element_or_locator)
        self.browser.click_on_chart_beat(element_or_locator)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)

    def select_list_cell_on_chart(self, element_or_locator=None):
        self.browser.hover_and_click(element_or_locator, is_scroll=True, hold_ctrl=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)

    def get_info_cell_on_tooltip(self, element_or_locator=None):
        self.browser.hover_to(element_or_locator)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_TOOLTIP_INFOR, inverse=True)
        output = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_TOOLTIP_INFOR)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION, inverse=True)
        return output

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
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION) and \
                    self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION,
                                                                     inverse=True)
                break
            elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                break

    def get_number_strip_beats(self):
        self.wait_strip_beats_visibility()
        output_1 = []
        output_2 = []
        numbers_element = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
        while True:
            elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
            if len(elements) == len(numbers_element):
                output_1 += elements
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.ALPHA_PGN_NEXT) and self.browser.get_element(
                    self.LCT.ALPHA_PGN_NEXT + '/..').get_attribute('disabled'):
                    return len(output_1)
                self.browser.click(self.LCT.ALPHA_PGN_NEXT)
                self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT, inverse=True)
            else:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION,
                                                                     inverse=True)
                output_2 += elements
                output = output_1 + output_2
                return len(output)

    def change_all_strips_to_beats(self, beat_change=None):
        self.wait_strip_beats_visibility()
        output_1 = []
        output_2 = []
        numbers_elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
        while True:
            elements = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
            if len(elements) == len(numbers_elements):
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION,
                                                                     inverse=True)
                self.browser.click(elements[0])
                self.browser.select_all_value()
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_CHANGE)
                self.browser.clicks(self.LCT.BEAT_CHANGE,
                                    on_elements=lambda _, e: self.browser.get_attribute_value(e,
                                                                                              'id').lower() == beat_change.lower(),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT)
                output_1 += self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_CHANGE)
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.ALPHA_PGN_NEXT) and self.browser.get_element(self.LCT.ALPHA_PGN_NEXT).get_attribute(
                    'disabled'):
                    return output_1
                self.browser.click(self.LCT.ALPHA_PGN_NEXT)
            else:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION,
                                                                     inverse=True)
                self.browser.click(elements[0])
                self.browser.select_all_value()
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_CHANGE)
                self.browser.clicks(self.LCT.BEAT_CHANGE,
                                    on_elements=lambda _, e: self.browser.get_attribute_value(e,
                                                                                              'id').lower() == beat_change.lower(),
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
                                on_elements=lambda _, e: self.browser.get_attribute_value(e,
                                                                                          'id').lower() == beat_change.lower(),
                                stop_on_first=True)
            output = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output.split('\n')
        if beat_change_by_hotkey:
            self.browser.action_by_keyword(beat_change_by_hotkey)
            output = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output.split('\n')
        if is_deleted:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED)
            self.browser.action_by_keyword('D')
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
                                on_elements=lambda _, e: self.browser.get_attribute_value(e,
                                                                                          'id').lower() == beat_change.lower(),
                                stop_on_first=True)
            output = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output
        if beat_change_by_hotkey:
            self.browser.action_by_keyword(beat_change_by_hotkey)
            output = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
            return output
        if is_deleted:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED)
            self.browser.action_by_keyword('D')
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
            return len(elements)

    def navigate_to_tab_menu(self, tab_menu):
        """
        Navigate to studies page
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.TABS_MENU, inverse=True)
        self.browser.clicks(self.LCT.TABS_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == tab_menu.lower(),
                            stop_on_first=True)

    def stop_ai_processing(self):
        self.browser.wait_visibility_of_element_located(self.LCT.MORE_ICON)
        self.browser.click(self.LCT.MORE_ICON)
        self.browser.wait_visibility_of_element_located(self.LCT.STOP_AI_PROCESSING)
        self.browser.click(self.LCT.STOP_AI_PROCESSING)
        self.browser.wait_visibility_of_element_located(self.LCT.POPUP_MODAL_CONTENT, timeout=10)

    def get_message_stop_successful(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.POPUP_MODAL_CONTENT) and self.browser.get_element(
                self.LCT.POPUP_MODAL_CONTENT).is_displayed():
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
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_COUNT) and \
                    self.browser.get_elements(self.LCT.ECG_EVENT_COUNT)[0].is_displayed():
                break
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_COUNT, inverse=True)
        return self._check_number_beat_event()

    def mark_as_artifact(self, is_save=False, element_or_locator=None):
        random_element = random.choice(element_or_locator)
        self.browser.hover_to(random_element)
        self.browser.click_on_chart_beat(random_element)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_BEAT_EVENT_OPTION)
        numbers_elements = self.browser.get_elements(self.LCT.ECG_BEAT_EVENT_OPTION)
        while True:
            elements = self.browser.get_elements(self.LCT.ECG_BEAT_EVENT_OPTION)
            if len(elements) == len(numbers_elements):
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_BEAT_EVENT_OPTION, inverse=True)
                self.browser.click(elements[0])
                self.browser.select_all_value()
                self.browser.wait_visibility_of_element_located(self.LCT.ECG_MARK_AS_ARTIFACT)
                self.browser.click(self.LCT.ECG_MARK_AS_ARTIFACT)
                self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT)
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.ALPHA_PGN_NEXT) and self.browser.get_element(self.LCT.ALPHA_PGN_NEXT).get_attribute(
                    'disabled'):
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
                if self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON) and self.browser.get_element(
                        self.LCT.SAVE_BUTTON).is_displayed():
                    break
            self.browser.wait_visibility_of_element_located(self.LCT.SAVE_BUTTON)
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_BEAT_EVENT_OPTION) and \
                    self.browser.get_elements(self.LCT.ECG_BEAT_EVENT_OPTION)[0].is_displayed():
                return False
            elif self.browser.wait_visibility_of_element_located(self.LCT.ECG_NO_DATA) and self.browser.get_element(
                    self.LCT.ECG_NO_DATA).is_displayed():
                text = self.browser.get_text(random_element).split("\n")
                number_random = text[-1]
                if int(number_random) == 0:
                    return True
                else:
                    return False

    def get_generate_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_GENERATE, inverse=True)
        self.browser.click(self.LCT.PDF_REPORT_GENERATE)
        self.browser.wait_visibility_of_element_located(self.LCT.LOADING_PAGE, inverse=True)
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.PDF_REPORT_VIEWER) and self.browser.get_element(
                    self.LCT.PDF_REPORT_VIEWER).is_displayed():
                return True
            elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                return False

    @staticmethod
    def convert_datetime_utc_or_est(original_datetime_str=None):
        datetime_format = "%m/%d/%Y,%H:%M:%S"
        original_datetime = datetime.strptime(original_datetime_str.split(' ')[0] + original_datetime_str.split(' ')[1],
                                              datetime_format)
        # Adjust the original datetime to UTC
        original_datetime_utc = original_datetime - timedelta(hours=0)
        # Format the datetime as a string in the desired format
        formatted_datetime_str = original_datetime_utc.strftime("%m/%d/%Y %H:%M:%S")
        return formatted_datetime_str

    @staticmethod
    def format_datetime(original_datetime_str=None):
        datetime_format = "%m/%d/%Y%H:%M:%S"
        original_datetime = datetime.strptime(original_datetime_str.split(' ')[0] + original_datetime_str.split(' ')[1],
                                              datetime_format)
        # Adjust the original datetime to UTC
        original_datetime_utc = original_datetime - timedelta(hours=0)
        # Format the datetime as a string in the desired format
        formatted_datetime_str = original_datetime_utc.strftime("%m/%d/%Y %H:%M:%S")
        return formatted_datetime_str

    def get_message_banner(self):
        self.browser.wait_visibility_of_element_located(self.LCT.MSG_ARCHIVED_STUDY)
        return self.browser.get_text(self.LCT.MSG_ARCHIVED_STUDY)

    def get_image_interim_report_details(self, test_summary=False, tachycardia=False, bradycardia=False,
                                         atrial_fibrillation=False, pause=False, pdf_report=False):
        if test_summary:
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY, inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_TEST_SUMMARY)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element_hide(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT,
                                                         self.LCT.SENTINTERIMRP_TOTAL_TIME, image_name='test_summary')
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
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_SUMMARY_ATRIAL_FIBRILLATION,
                                                            inverse=True)
            self.browser.click(self.LCT.SENTINTERIMRP_SUMMARY_ATRIAL_FIBRILLATION)
            self.browser.wait_visibility_of_element_located(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT, inverse=True)
            self.browser.take_screenshot_by_element(self.LCT.SENTINTERIMRP_IMAGE_SCREENSHOT,
                                                    image_name='atrial_fibrillation')
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

    def check_interim_report_summary(self, image_name_original=None, image_name_compare=None, timeout=200):
        start_time = time.time()
        while time.time() - start_time < timeout:
            # Wait for certain elements to be visible on the page
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_NAV_HEADER)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SENTINTERIMRP_NAV_CONTENT, inverse=True)
            # Construct paths to the original and compared images
            original_image_path = os.path.join('results', 'img_original', f'{image_name_original}.png').replace('\\',
                                                                                                                '/')
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

    def edit_interim_report_summary(self, min_hr=None, max_hr=None, min_avg_hr=None, max_avg_hr=None, min_max_hr=None,
                                    max_max_hr=None, is_save=True):
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
            'Refresh Page': False if 'disabled' in self.browser.get_attribute_value(
                self.LCT.SENTINTERIMRP_SUMMARY_REFRESH, 'class') else True
        }
        if self.browser.wait_visibility_of_element_located(
                self.LCT.SENTINTERIMRP_SUMMARY_FILTER) and self.browser.get_element(
            self.LCT.SENTINTERIMRP_SUMMARY_FILTER).is_displayed():
            output['Filter'] = False if 'disabled' in self.browser.get_attribute_value(
                self.LCT.SENTINTERIMRP_SUMMARY_FILTER, 'class') else True
        if self.browser.wait_visibility_of_element_located(
                self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR) and self.browser.get_element(
            self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR).is_displayed():
            output['Calculate Avg HR'] = False if self.browser.get_element(
                self.LCT.SENTINTERIMRP_SUMMARY_CALCULATE_AVG_HR).get_attribute('disabled') else True
        if self.browser.wait_visibility_of_element_located(
                self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_REFRESH) and self.browser.get_element(
            self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_REFRESH).is_displayed():
            output['Refresh Event'] = False if 'disabled' in self.browser.get_attribute_value(
                self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_REFRESH, 'class') else True
        if self.browser.wait_visibility_of_element_located(
                self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_FILTER) and self.browser.get_element(
            self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_FILTER).is_displayed():
            output['Strips Filter'] = False if self.browser.get_element(
                self.LCT.SENTINTERIMRP_SUMMARY_STRIPS_FILTER).get_attribute('disabled') else True
        self.logger.info(output)
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
            # 'HR summary': self.browser.get_text(self.LCT.BEAT_HR_HR_SUMMARY),
            'Add new event': self.browser.get_text(self.LCT.BEAT_HR_ADD_EVENT),
            'Add a bookmark': self.browser.get_text(self.LCT.BEAT_HR_ADD_BOOKMARK)
        }
        return output

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

    def check_toolbar_ecg_viewer_available(self, is_close_beat_maker = True):
        output = {
            'Speed': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SPEED) and self.browser.get_element(self.LCT.BEAT_HR_ECG_SPEED).get_attribute(
                'disabled') else True,
            'Gain': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_GAIN) and self.browser.get_element(self.LCT.BEAT_HR_ECG_GAIN).get_attribute(
                'disabled') else True,
            'High Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_HIGH_PASS) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_HIGH_PASS).get_attribute(
                'disabled') else True,
            'Low Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_LOW_PASS) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_LOW_PASS).get_attribute(
                'disabled') else True,
            'Show/Hide CH1': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH1) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH1).get_attribute(
                'disabled') else True,
            'Show/Hide CH2': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH2) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH2).get_attribute(
                'disabled') else True,
            'Show/Hide CH3': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH3) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_SHOW_HIDE_CH3).get_attribute(
                'disabled') else True,
            # 'Capture': True if (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE) and self.browser.get_element(
            #     self.LCT.BEAT_HR_ECG_CAPTURE).is_displayed()) or (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE) and
            #                                                       self.browser.get_element(self.LCT.BEAT_HR_ECG_CAPTURE).get_attribute('disabled')) else False,
            # 'Beat Marker Tool': True if (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL) and self.browser.get_element(
            #     self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL).is_displayed()) or (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL) and
            #                                                                self.browser.get_element(self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL).get_attribute('disabled')) else False,
            # 'Zool Tool': True if (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_ZOOM) and self.browser.get_element(
            #     self.LCT.BEAT_HR_ARTIFACT_ZOOM).is_displayed()) or (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_ZOOM) and
            #                                                         self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_ZOOM).get_attribute('disabled')) else False,
            # 'View All Strip': True if (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP) and self.browser.get_element(
            #     self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP).is_displayed()) or (self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP) and
            #                                                              self.browser.get_element(self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP).get_attribute('disabled')) else False,
            'Add Beat Marker N': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_N) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_N).get_attribute(
                'disabled') else True,
            'Add Beat Marker S': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_S) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_S).get_attribute(
                'disabled') else True,
            'Add Beat Marker V': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_V) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_V).get_attribute(
                'disabled') else True,
            'Add Beat Marker Q': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_Q) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_Q).get_attribute(
                'disabled') else True,
            'Beat Marker Delete': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_DELETE) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_MARKER_DELETE).get_attribute('disabled') else True,
            'Undo': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_UNDO) and self.browser.get_attribute_value(self.LCT.BEAT_HR_UNDO,
                                                                            'disabled') else True,
            'Save': False if self.browser.wait_visibility_of_element_located(
                self.LCT.SAVE_BUTTON) and 'disabled' in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON,
                                                                                         'class') else True,
        }

        if is_close_beat_maker:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ECG_BEAT_CLOSE) and self.browser.get_element(
                self.LCT.BEAT_HR_ECG_BEAT_CLOSE).is_displayed():
                self.browser.click(self.LCT.BEAT_HR_ECG_BEAT_CLOSE)
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_BEAT_CLOSE, inverse=True)

        output.update(
            {
                'Capture': True if (self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ECG_CAPTURE) and self.browser.get_element(
                    self.LCT.BEAT_HR_ECG_CAPTURE).is_displayed()) or (self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ECG_CAPTURE) and
                                                                      self.browser.get_element(
                                                                          self.LCT.BEAT_HR_ECG_CAPTURE).get_attribute(
                                                                          'disabled')) else False,
                'Beat Marker Tool': True if (self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL) and self.browser.get_element(
                    self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL).is_displayed()) or (
                                                    self.browser.wait_visibility_of_element_located(
                                                        self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL) and
                                                    self.browser.get_element(
                                                        self.LCT.BEAT_HR_ECG_BEAT_MARKER_TOOL).get_attribute(
                                                        'disabled')) else False,
                'Zool Tool': True if (self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ARTIFACT_ZOOM) and self.browser.get_element(
                    self.LCT.BEAT_HR_ARTIFACT_ZOOM).is_displayed()) or (self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ARTIFACT_ZOOM) and
                                                                        self.browser.get_element(
                                                                            self.LCT.BEAT_HR_ARTIFACT_ZOOM).get_attribute(
                                                                            'disabled')) else False,
                'View All Strip': True if (self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP) and self.browser.get_element(
                    self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP).is_displayed()) or (
                                                  self.browser.wait_visibility_of_element_located(
                                                      self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP) and
                                                  self.browser.get_element(
                                                      self.LCT.BEAT_HR_ECG_VIEW_ALL_STRIP).get_attribute(
                                                      'disabled')) else False,
            }
        )

        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_RESET_CHANGE) and self.browser.get_element(
            self.LCT.BEAT_HR_ARTIFACT_RESET_CHANGE).is_displayed():
            output['Reset Changes'] = False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_RESET_CHANGE) and self.browser.get_element(
                self.LCT.BEAT_HR_ARTIFACT_RESET_CHANGE).get_attribute(
                'disabled') else True
        if self.browser.wait_visibility_of_element_located(
                self.LCT.STRIPS_MANAGEMENT_ZOOM_TOOL) or self.browser.wait_visibility_of_element_located(
            self.LCT.STRIPS_MANAGEMENT_AUTO_ZOOM_TOOL):
            output['Zoom Tool'] = False if (self.browser.wait_visibility_of_element_located(
                self.LCT.STRIPS_MANAGEMENT_ZOOM_TOOL) and self.browser.get_element(
                self.LCT.STRIPS_MANAGEMENT_ZOOM_TOOL).get_attribute(
                'disabled')) or (self.browser.wait_visibility_of_element_located(
                self.LCT.STRIPS_MANAGEMENT_AUTO_ZOOM_TOOL)
                                 and self.browser.get_element(self.LCT.STRIPS_MANAGEMENT_AUTO_ZOOM_TOOL).get_attribute(
                        'disabled')) else True
        self.logger.info(output)
        return output

    def check_event_airp_available(self):
        output = {
            'Cancel': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_CANCEL) and self.browser.get_element(self.LCT.BEAT_HR_CANCEL).get_attribute(
                'disabled') else True,
            'Jump To Start Time': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_JUMP_START_TIME + '/..') and self.browser.get_element(
                self.LCT.BEAT_HR_JUMP_START_TIME + '/..').get_attribute('disabled') else True,
            'Jump To End Time': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_JUMP_END_TIME + '/..') and self.browser.get_element(
                self.LCT.BEAT_HR_JUMP_END_TIME + '/..').get_attribute('disabled') else True,
            'Pick on ECG Start Time': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_PICK_START_TIME + '/..') and self.browser.get_element(
                self.LCT.BEAT_HR_PICK_START_TIME + '/..').get_attribute('disabled') else True,
            'Pick on ECG End Time': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_PICK_END_TIME + '/..') and self.browser.get_element(
                self.LCT.BEAT_HR_PICK_END_TIME + '/..').get_attribute('disabled') else True,
        }
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE) and self.browser.get_element(
            self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE).is_displayed():
            output['End Time Message Date'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE)
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME) and self.browser.get_element(
            self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME).is_displayed():
            output['End Time Message Time'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME)
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_DATE) and self.browser.get_element(
            self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_DATE).is_displayed():
            output['Start Time Message Date'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_DATE)
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_TIME) and self.browser.get_element(
            self.LCT.BEAT_HR_ARTIFACT_STARTTIME_MESSAGE_TIME).is_displayed():
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
            'Start Time Date': self.browser.get_attribute_value(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_INPUT_DATE,
                                                                'value'),
            'Start Time Time': self.browser.get_attribute_value(self.LCT.BEAT_HR_ARTIFACT_STARTTIME_INPUT_TIME,
                                                                'value'),
        }
        self.logger.info(output)
        return output

    def mark_a_strip_airp(self, is_save=False, technician_comment=None, title=None):
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ECG_BEAT_CLOSE) and self.browser.get_element(
            self.LCT.BEAT_HR_ECG_BEAT_CLOSE).is_displayed():
            self.browser.click(self.LCT.BEAT_HR_ECG_BEAT_CLOSE)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_BEAT_CLOSE, inverse=True)

        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE)
        self.browser.click(self.LCT.BEAT_HR_ECG_CAPTURE)

        if title:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_TITLE_INPUT)
            self.browser.input_text(self.LCT.BEAT_HR_ARTIFACT_TITLE_INPUT, title)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_TITLE_INPUT)
        if technician_comment:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_TECHNICIAN_INPUT)
            self.browser.input_text(self.LCT.BEAT_HR_ARTIFACT_TECHNICIAN_INPUT, technician_comment)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE_SUBMMIT)
            self.browser.click(self.LCT.BEAT_HR_ECG_CAPTURE_SUBMMIT)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ECG_CAPTURE_SUBMMIT)

    def get_message_input_airp(self):
        self.browser.wait_visibility_of_element_located(self.LCT.MSG_BEAT_HR_INPUT_TITLE)
        msg = self.browser.get_text(self.LCT.MSG_BEAT_HR_INPUT_TITLE)
        return msg

    def edit_artifact_event(self, is_cancel=False, is_cancel_ecg=False, is_start_time=False, is_submit=False,
                            is_done=False, is_add_ecg=False,
                            is_end_time=False, x_offset_start_time=None, y_offset_start_time=None,
                            x_offset_end_time=None, y_offset_end_time=None, is_close=False, is_hr_chart=False, next_or_previous=None):
        start_time = time.time()
        if is_start_time:
            while True:
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.BEAT_HR_ARTIFACT_CANVAS) and self.browser.get_element(
                    self.LCT.BEAT_HR_ARTIFACT_CANVAS).is_displayed():
                    element = self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_CANVAS)
                    self.browser.click_by_offset(element, x_offset_start_time, y_offset_start_time)
                    break
                elif time.time() - start_time > 1 * 60:  # 15 minutes in seconds
                    return self
        if is_end_time:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CANVAS)
            element = self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_CANVAS)
            self.browser.click_by_offset(element, x_offset_end_time, y_offset_end_time)
        if is_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUBMIT, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_SUBMIT, is_scroll=True)
            # self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUBMIT, inverse=True)
        if is_done:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DONE, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_DONE)
        if is_add_ecg:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ADD_ECG, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_ADD_ECG)
        if is_close:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CLOSE, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_ARTIFACT_CLOSE)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CLOSE, inverse=True)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_CANCEL, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_CANCEL)
        if is_cancel_ecg:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_CANCEL_ECG_EVENT, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_CANCEL_ECG_EVENT)
        if is_hr_chart:
            while True:
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.BEAT_HR_ARTIFACT_HR_CHART) and self.browser.get_element(
                    self.LCT.BEAT_HR_ARTIFACT_HR_CHART).is_displayed():
                    element = self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_HR_CHART)
                    self.browser.click_by_offset(element, x_offset_start_time, y_offset_start_time)
                    break
                elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                    return self
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_HR_CHART, inverse=True)
        if next_or_previous is not None:
            if next_or_previous.lower() not in ('next', 'previous'):
                raise Exception(f'Invalid key {next_or_previous}.')
            self.browser.execute_script('window.scrollTo(0,2500)')
            for _ in range(2):
                self.browser.hover_to(self.LCT.AI_REPORT_CHART_SCROLLER)
                if next_or_previous.lower() == 'next':
                    self.browser.click(self.LCT.AI_REPORT_NEXT_MINUTE)
                    self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NEXT_MINUTE, inverse=True)
                    break
                elif next_or_previous.lower() == 'previous':
                    self.browser.click(self.LCT.AI_REPORT_PREVIOUS_MINUTE)
                    self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_PREVIOUS_MINUTE, inverse=True)
                    break

    def mark_a_bookmarks(self, is_time=False, x_offset_time=None, y_offset_time=None):
        start_time = time.time()
        if is_time:
            while True:
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.BEAT_HR_ARTIFACT_CANVAS) and self.browser.get_element(
                    self.LCT.BEAT_HR_ARTIFACT_CANVAS).is_displayed():
                    element = self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_CANVAS)
                    self.browser.click_by_offset(element, x_offset_time, y_offset_time)
                    break
                elif time.time() - start_time > 1 * 60:  # 15 minutes in seconds
                    return self

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

    def view_each_event_thumbnail_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        _index = self._on_events_artifact_strips_item(**on)
        self.browser.hover_to_by_index(self.LCT.BEAT_HR_EVENTS_OPTION, _index)
        self.browser.clicks(self.LCT.BEAT_HR_EVENTS_OPTION, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_multiple_each_event_thumbnail_on(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        _on = [s.strip() for s in row.split(',')] if isinstance(row, str) else row  # str|list
        for _row in _on:
            _index = self._on_events_artifact_strips_item(row=_row)
            _row_elem = self.browser.get_elements_by_condition(
                self.LCT.BEAT_HR_EVENTS_OPTION, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
            self.browser.hover_to(_row_elem)
            self.browser.ctrl_and_click(_row_elem)

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
        output = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_SELECTED)
        if is_save:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.SAVE_BUTTON) and 'disabled' not in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON,
                                                                                                 'class'):
                self.browser.click(self.LCT.SAVE_BUTTON)
            self.wait_for_element_visibility(self.LCT.SAVE_BUTTON)
        return output

    def deleted_strip_beat_hr_heatmap(self, is_save=False, by_hotkey=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_EVENTS_OPTION)
        self.browser.click(elements[0])
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED)
        self.browser.click(self.LCT.BEAT_HR_DELETED)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
        output = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
        if is_save:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.SAVE_BUTTON) and 'disabled' not in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON,
                                                                                                 'class'):
                self.browser.click(self.LCT.SAVE_BUTTON)
            self.wait_for_element_visibility(self.LCT.SAVE_BUTTON)
        if by_hotkey:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
            self.browser.action_by_keyword(by_hotkey)
        return output

    def get_number_artifact_event_on_page(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_EVENTS_OPTION)
        return len(elements)

    def deleted_multiple_artifact_event_airp(self, is_save=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_EVENTS_OPTION, inverse=True)
        output = dict()
        elements = self.browser.get_elements(self.LCT.BEAT_HR_EVENTS_OPTION)
        self.browser.click(elements[0])
        self.browser.select_all_value()
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_DELETED)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_DELETED, inverse=True)
        output['Number Strips Beats'] = len(elements)
        output['Beat Name'] = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
        if is_save:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.SAVE_BUTTON) and 'disabled' not in self.browser.get_attribute_value(self.LCT.SAVE_BUTTON,
                                                                                                 'class'):
                self.browser.click(self.LCT.SAVE_BUTTON)
                self.wait_for_element_visibility(self.LCT.SAVE_BUTTON)
        self.logger.info(output)
        return output

    def get_lists_of_beats_airp(self, beat=None):
        self.wait_for_element_visibility(self.LCT.TYPE_BEATS)
        lists_of_beats = self.browser.get_texts(self.LCT.TYPE_BEATS)
        return lists_of_beats

    def mark_call_reviewed(self, mark_reviewed=False, mark_unreviewed=False):
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.BEAT_HR_HEATMAP_OPTION) and self.browser.get_element(
                self.LCT.BEAT_HR_HEATMAP_OPTION).is_displayed():
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
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_HEATMAP_COMPLETE_REVIEW) and self.browser.get_element(
            self.LCT.BEAT_HR_HEATMAP_COMPLETE_REVIEW).is_displayed():
            return True
        else:
            return False

    def check_heatmap_available(self):
        output = {
            'Strip beats': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS) and self.browser.get_element(
                self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS).is_displayed() else True,
            'ECG viewer': True if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_HEATMAP_ECG_VIEWER) and self.browser.get_element(
                self.LCT.BEAT_HR_HEATMAP_ECG_VIEWER).is_displayed() else False
        }
        return output

    def select_thumbnail_option_on(self, items):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_OPTION, inverse=True)
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        for item in _items:
            self.browser.clicks(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower().strip('✨') == item.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_OPTION,
                                                                 inverse=True)
        output = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_ACTIVE)
        output = [item.strip('✨') for item in output if item]
        return output

    @staticmethod
    def verify_number_size_heatmap(number_small=None, number_medium=None, number_large=None):
        # self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
        if int(number_small) >= int(number_medium) >= int(number_large):
            return True
        return False

    def get_message_on_aireport(self):
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.MSG_NO_MORE_STUDY) and self.browser.get_element(
                    self.LCT.MSG_NO_MORE_STUDY).is_displayed():
                self.browser.hover_to(self.LCT.MSG_NO_MORE_STUDY)
                output = self.browser.get_text(self.LCT.MSG_NO_MORE_STUDY)
                self.browser.wait_visibility_of_element_located(self.LCT.MSG_NO_MORE_STUDY, inverse=True)
                self.logger.info(output)
                return output

    def wait_for_element_visibility(self, element_or_locator):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(element_or_locator) and self.browser.get_element(
                    element_or_locator).is_displayed():
                break
            elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                break

    def select_mark_review(self, reviewed_or_unreviewed=None, reviewed_by_hotkey=None):
        self.wait_for_element_visibility(self.LCT.BEAT_HR_HEATMAP_NUMBER_CELL)
        for _ in range(2):
            if reviewed_or_unreviewed == 'Reviewed':
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED,
                                                                inverse=True)
                self.browser.js_click(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED)
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED,
                                                                inverse=True)
                break
            if reviewed_or_unreviewed == 'Unreviewed':
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED,
                                                                inverse=True)
                self.browser.js_click(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED)
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED,
                                                                inverse=True)
                break
            if reviewed_by_hotkey:
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED,
                                                                inverse=True)
                self.browser.hover_to(self.browser.get_element(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED))
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED,
                                                                inverse=True)
                self.browser.action_by_keyword(reviewed_by_hotkey)
                self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ARTIFACT_CHECKBOX_REVIEWED,
                                                                inverse=True)
                break

    def check_mark_reviewed_available(self):
        time.sleep(10)
        return self

    def get_all_strips_beats(self, row=None):
        self.wait_strip_beats_visibility()
        output = []
        while True:
            strip_buttons = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS_OPTION)
            contents = []
            for button in strip_buttons:
                beat_names = button.find_elements(By.XPATH, './/*[name()="svg"]/*[name()="text"]')
                beat_names = [
                    b.get_attribute("textContent").strip()
                    for b in beat_names
                    if b.get_attribute("textContent") and b.get_attribute("textContent").strip()
                ]
                channel_elem = button.find_element(By.XPATH, './/div[contains(@class,"channel-text")]')
                channel = channel_elem.text.strip() if channel_elem else ''
                for beat in beat_names:
                    contents.extend([beat, channel])
            headers = ['Beat Name', 'Channel']
            output += Utils.group_tabular_data(headers, contents, row=row)
            if self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT) and \
                    self.browser.get_element(self.LCT.ALPHA_PGN_NEXT + '/..').get_attribute('disabled'):
                break
            self.browser.click(self.LCT.ALPHA_PGN_NEXT)
            self.browser.wait_visibility_of_element_located(self.LCT.ALPHA_PGN_NEXT, inverse=True)
        return [{k: v.replace('\n', ' | ') for k, v in item.items()} for item in output]

    def get_strips_beats_on_page(self, row=None):
        self.wait_strip_beats_visibility()
        headers = ['Beat Name', 'Chanel']
        contents = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_OPTION)
        output = Utils.group_tabular_data(headers, contents, row=row)
        self.logger.info(output)
        print(f"headers")
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_beat_name_on_thumbnail(self):
        self.wait_strip_beats_visibility()
        headers = ['Beat Name', 'Chanel']
        contents = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_BEATS_SELECTED)
        output = Utils.group_tabular_data(headers, contents)
        self.logger.info(output)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]


    def get_current_action_change(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS, inverse=True)
        return self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS)

    def get_current_action_change_all_beats_actions(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_ALL_BEATS_ACTIONS, inverse=True)
        return self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_ALL_BEATS_ACTIONS)

    def get_action_change_selected(self, row=None):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS, inverse=True)
        headers = ['Beat Change', 'Hotkey']
        contents = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_ACTION_SELETED)
        output = Utils.group_tabular_data(headers, contents, row=row)
        self.logger.info(output)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def check_timeout_on_aireport(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_RELOAD_PAGE) and self.browser.get_element(
                self.LCT.BEAT_HR_RELOAD_PAGE).is_displayed():
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_RELOAD_PAGE, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_RELOAD_PAGE)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_RELOAD_PAGE, inverse=True)
            self.navigate_airp_tab(tab="Beats")
            self.stop_ai_processing()
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_RELOAD_PAGE, inverse=True)
        else:
            return self

    def get_message_notification(self):
        output = dict()
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS, inverse=True)
        output['Beat Message'] = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_STRIP_BEATS + '/..')
        output['ECG Message'] = self.browser.get_text(self.LCT.BEAT_HR_HEATMAP_ECG_VIEWER_MESSAGE)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_ECG_VIEWER_MESSAGE, inverse=True)
        return output

    def get_release_version_aireport(self):
        version = 'undetected'
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.RELEASE_VERSION_AIREPORT) and self.browser.get_element(
                self.LCT.RELEASE_VERSION_AIREPORT).is_displayed():
                try:
                    version = self.browser.get_text(self.LCT.RELEASE_VERSION_AIREPORT).split()[-1][1:]
                finally:
                    return version
            elif time.time() - start_time > 5 * 60:
                break

    def navigate_to_afib_events_tab(self):
        self.wait_for_element_visibility(self.LCT.BEAT_HR_AFIB_EVENTS_PAGE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_AFIB_EVENTS_PAGE, inverse=True)
        self.browser.click(self.LCT.BEAT_HR_AFIB_EVENTS_PAGE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_AFIB_EVENTS_PAGE, inverse=True)

    def edit_notification_reports(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.NOTIFICATION_REPORTS_ROW) and self.browser.get_element(
                self.LCT.NOTIFICATION_REPORTS_ROW).is_displayed():
                self.browser.hover_to(self.LCT.NOTIFICATION_REPORTS_ROW)
                self.browser.click(self.LCT.NOTIFICATION_REPORTS)
                self.browser.wait_visibility_of_element_located(self.LCT.NOTIFICATION_REPORTS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_for_event_items_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_ROOT) and \
                    self.browser.get_elements(self.LCT.READYNOTIFRP_ROOT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.READYNOTIFRP_ROOT, inverse=True)
                break
            elif start_time - time.time() > 1 * 60:
                break

    def _on_notification_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_event_items_reports_available()
        all_data = self.get_ready_notification_event_reports()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such pending notification report exist on {_on}.')

    def create_notification_reports_on(self, **on):
        self.wait_for_event_items_reports_available()
        _index = self._on_notification_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.READYNOTIFRP_ROOT, _index)
        self.browser.clicks(self.LCT.NOTIFICATION_REPORTS_CREATE, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_ready_notification_event_reports(self):
        self.wait_for_event_items_reports_available()
        output = []
        for element in self.browser.get_elements(self.LCT.READYNOTIFRP_ROOT):
            header_elements = self.browser.get_child_elements(element, self.LCT.READYNOTIFRP_EVENT_REPORT_HEADER)
            header = [text.replace(':', '') for text in self.browser.get_texts(header_elements)]
            content_elements = self.browser.get_child_elements(element, self.LCT.READYNOTIFRP_EVENT_REPORT_CONTENT)
            content = self.browser.get_texts(content_elements)
            output.append({key: value for key, value in zip(header, content)})
        return output

    def edit_hr_on_hr_summary(self, min_hr=None, max_hr=None, avg_hr=None, is_save=False, is_cancel=False):
        if min_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_MIN_INPUT, inverse=True)
            self.browser.input_text(self.LCT.BEAT_HR_SUMMARY_MIN_INPUT, min_hr)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_MIN_INPUT, inverse=True)
        if max_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_MAX_INPUT, inverse=True)
            self.browser.input_text(self.LCT.BEAT_HR_SUMMARY_MAX_INPUT, max_hr)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_MAX_INPUT, inverse=True)
        if avg_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_AVG_INPUT, inverse=True)
            self.browser.input_text(self.LCT.BEAT_HR_SUMMARY_AVG_INPUT, avg_hr)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_AVG_INPUT, inverse=True)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SAVE)
            self.browser.click(self.LCT.BEAT_HR_SUMMARY_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SAVE, inverse=True)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_CANCEL)
            self.browser.click(self.LCT.BEAT_HR_SUMMARY_CANCEL)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_CANCEL, inverse=True)

    def get_datetime_min_max_hr(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_DATETIME_HR)
        return self.browser.get_text(self.LCT.BEAT_HR_SUMMARY_DATETIME_HR)

    def check_error_message(self):
        output = {}
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_MIN_HR_SUMMARY_ERROR_MESSAGE) and self.browser.get_element(
                self.LCT.BEAT_MIN_HR_SUMMARY_ERROR_MESSAGE).is_displayed():
            output['MinHR'] = self.browser.get_text(self.LCT.BEAT_MIN_HR_SUMMARY_ERROR_MESSAGE)
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_MAX_HR_SUMMARY_ERROR_MESSAGE) and self.browser.get_element(
                self.LCT.BEAT_MAX_HR_SUMMARY_ERROR_MESSAGE).is_displayed():
            output['MaxHR'] = self.browser.get_text(self.LCT.BEAT_MIN_HR_SUMMARY_ERROR_MESSAGE)
        if self.browser.wait_visibility_of_element_located(self.LCT.BEAT_AVG_HR_SUMMARY_ERROR_MESSAGE) and self.browser.get_element(
                self.LCT.BEAT_AVG_HR_SUMMARY_ERROR_MESSAGE).is_displayed():
            output['AvgHR'] = self.browser.get_text(self.LCT.BEAT_AVG_HR_SUMMARY_ERROR_MESSAGE)
        self.logger.info(output)
        return output

    def set_as_min_max_hr(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_AS_MINMAX)
        self.browser.click(self.LCT.BEAT_HR_SUMMARY_SET_AS_MINMAX)

    def get_value_on_set_value(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_INPUT)
        value = self.browser.get_attribute_value(self.LCT.BEAT_HR_SUMMARY_SET_INPUT, "value")
        # self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_INPUT, inverse=True)
        return value

    def edit_value_min_max_hr(self, min_hr=None, max_hr=None, is_set=False):
        if min_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_MIN_HR)
            self.browser.click(self.LCT.BEAT_HR_SUMMARY_SET_MIN_HR)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_MIN_HR, inverse=True)
            self.browser.input_text(self.LCT.BEAT_HR_SUMMARY_SET_INPUT, min_hr)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_INPUT, inverse=True)
        if max_hr:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_MAX_HR)
            self.browser.click(self.LCT.BEAT_HR_SUMMARY_SET_MAX_HR)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_MAX_HR, inverse=True)
            self.browser.input_text(self.LCT.BEAT_HR_SUMMARY_SET_INPUT, max_hr)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_INPUT, inverse=True)
        if is_set:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_VALUE)
            self.browser.click(self.LCT.BEAT_HR_SUMMARY_SET_VALUE)
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_SUMMARY_SET_VALUE, inverse=True)

    def filter_action_change(self, beat_change=None):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS)
        self.browser.click(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_PAGE_ACTIONS, inverse=True)
        self.browser.clicks(self.LCT.BEAT_HR_HEATMAP_ACTION_OPTION,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == beat_change.lower(),
                            stop_on_first=True)

    def filter_action_change_all_beats_actions(self, beat_change=None):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_ALL_BEATS_ACTIONS)
        self.browser.click(self.LCT.BEAT_HR_HEATMAP_ALL_BEATS_ACTIONS)
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_ALL_BEATS_ACTIONS, inverse=True)
        self.browser.clicks(self.LCT.BEAT_HR_HEATMAP_ACTION_OPTION,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == beat_change.lower(),
                            stop_on_first=True)

    def get_number_of_afib_events_on_menu(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_AFIB_EVENTS_PAGE, inverse=True)
        contents = self.browser.get_text(self.LCT.BEAT_HR_AFIB_EVENTS_PAGE).split('\n')
        print("contents", contents)
        return contents[1]

    def filter_bookmark(self, add_bookmark=False, is_cancel=False, is_add=False):
        if add_bookmark:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_ADD_BOOKMARK, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_ADD_BOOKMARK)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_BOOKMARK_CANCEL, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_BOOKMARK_CANCEL)
        if is_add:
            self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_BOOKMARK_ADD, inverse=True)
            self.browser.click(self.LCT.BEAT_HR_BOOKMARK_ADD)

    def check_event_bookmark(self):
        output = {
            'Cancel': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_BOOKMARK_CANCEL) and self.browser.get_element(
                self.LCT.BEAT_HR_BOOKMARK_CANCEL).get_attribute(
                'disabled') else True,
            'Add Bookmark': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_BOOKMARK_ADD) and self.browser.get_element(
                self.LCT.BEAT_HR_BOOKMARK_ADD).get_attribute(
                'disabled') else True,
            'Jump To Timestamp': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_JUMP_START_TIME + '/..') and self.browser.get_element(
                self.LCT.BEAT_HR_JUMP_START_TIME + '/..').get_attribute('disabled') else True,
            'Pick on ECG Viewer': False if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_PICK_START_TIME + '/..') and self.browser.get_element(
                self.LCT.BEAT_HR_PICK_START_TIME + '/..').get_attribute('disabled') else True,
        }
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE) and self.browser.get_element(
            self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE).is_displayed():
            output['Timestamp Message Date'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_DATE)
        if self.browser.wait_visibility_of_element_located(
                self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME) and self.browser.get_element(
            self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME).is_displayed():
            output['Timestamp Message Time'] = self.browser.get_text(self.LCT.BEAT_HR_ARTIFACT_ENDTIME_MESSAGE_TIME)
        self.logger.info(output)
        return output

    def get_channels_on_thumbnail(self):
        self.browser.wait_visibility_of_element_located(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_ACTIVE_TEXT)
        channels = self.browser.get_texts(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_ACTIVE_TEXT)
        if 1 <= len(channels) <= 3:
            return channels
        return []

    def get_number_channel(self):
        self.wait_strip_beats_visibility()
        number_channel = self.browser.get_elements(self.LCT.BEAT_HR_HEATMAP_THUMBNAIL_NUMBER_CHANNEL)
        if number_channel:
            return len(number_channel)
        else:
            raise Exception('No channel available.')