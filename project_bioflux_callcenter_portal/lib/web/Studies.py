#!/usr/bin/env python3
import time

from anyio import sleep

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import studies as locators
    from selenium.webdriver import Keys
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Studies(WebPage):
    """
    Handle studies page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_studies(self):
        """
        Navigate to studies page
        :return: None
        """
        self.browser.open_page(self.URL + '/studies')

    def get_current_studies_type(self):
        """
        Get current studies type (active tab)
        :return: (str) studies type
        """
        for elem in self.browser.get_elements(self.LCT.TABS + '/a'):
            if 'active' in self.browser.get_attribute_value(elem, 'class'):
                return self.browser.get_text(elem)

    def wait_active_studies_available(self):
        """
        Wait until all active studies available
        :return:
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT) and self.browser.get_elements(self.LCT.ACTIVE_DATA_CONTENT)[0].is_displayed():
                # self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_HEADER, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_eod_studies_available(self):
        """
        Wait until all end of duration studies available
        :return:
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOD_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOD_DATA_CONTENT)

    def wait_completed_studies_available(self):
        """
        Wait until all completed studies available
        :return:
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT) and self.browser.get_elements(self.LCT.COMPLETED_DATA_CONTENT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def navigate_to_studies_type(self, tab):
        """
        Navigate to studies type (tab)
        :param tab: (str) Study type (tab)
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS) and self.browser.get_elements(self.LCT.TABS + '/a')[0].get_attribute('disabled') is None:
                self.browser.clicks(self.LCT.TABS + '/a',
                                    on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(tab.lower()),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def filter_studies(self, study_type=None, facility=None, search_by=None, text_search=None):
        """
        Handle filtering studies
        :param study_type: (str)
        :param facility: (str)
        :param search_by: (str)
        :param text_search: (str)
        :return: None
        """
        if study_type:
            self.navigate_to_studies_type(tab=study_type)
        if facility:
            self.browser.input_text(self.LCT.FACILITY_INPUT, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY)
            self.browser.click(self.LCT.SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        if text_search is not None:
            if search_by.lower() == 'study id':  # Able to enter a list/1 study id
                _studies = [s.strip() for s in text_search.split(',')] if isinstance(text_search, str) else text_search
                for st in _studies:
                    self.browser.input_text(self.LCT.TEXTSEARCH_INPUT, st, is_clear=True)
                    self.browser.get_element(self.LCT.TEXTSEARCH_INPUT).send_keys(Keys.ENTER)
            else:
                self.browser.input_text(self.LCT.TEXTSEARCH_INPUT, text_search)
                self.browser.get_element(self.LCT.TEXTSEARCH_INPUT).send_keys(Keys.ENTER)
        wait_func = {
            'active': self.wait_active_studies_available,
            'end of duration': self.wait_eod_studies_available,
            'completed': self.wait_completed_studies_available
        }
        wait_func[self.get_current_studies_type().lower()]()

    def get_studies_current_filter_values(self):
        """
        Get all current filter values
        :return: (dict) list of current filter values
        """
        output = {
            'Facility': self.browser.get_text(self.LCT.FACILITY_INPUT + '/../../..'),
            'Study State': self.get_current_studies_type(),
            'Search By': 'Study ID' if self.browser.wait_visibility_of_element_located(
                'selector:div.search-by-study-id', timeout=3) else self.browser.get_attribute_value(
                self.LCT.TEXTSEARCH_INPUT, 'placeholder').replace('Search by', '').strip(),
            'Text Search': self.browser.get_texts(
                self.LCT.TEXTSEARCH_STUDYIDVALUES) if self.browser.wait_visibility_of_element_located(
                'selector:div.search-by-study-id', timeout=3) else self.browser.get_attribute_value(
                self.LCT.TEXTSEARCH_INPUT, 'value')
        }
        return output

    def get_studies_filter_options(self):
        output = dict()
        self.browser.click(self.LCT.FACILITY_INPUT + '/../../..')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS)
        output['Facilities'] = self.browser.get_texts(self.LCT.FACILITY_OPTIONS)
        # handle in case of facility popup not closed
        self.browser.clicks(self.LCT.FACILITY_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == self.browser.get_text(
                                self.LCT.FACILITY_INPUT + '/../../..').lower(), stop_on_first=True)
        self.browser.click(self.LCT.SEARCHBY)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
        output['Search by'] = self.browser.get_texts(self.LCT.SEARCHBY_OPTIONS)
        # handle in case of search_by popup not closed
        self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(
                                e).lower() == self.get_studies_current_filter_values()[
                                'Search By'].lower(), stop_on_first=True)
        return output

    def clear_text_search(self):
        self.browser.wait_visibility_of_element_located(self.LCT.TEXTSEARCH_CLEARTEXTSEARCH, inverse=True)
        self.browser.js_click(self.LCT.TEXTSEARCH_CLEARTEXTSEARCH)  # Clear all
        wait_func = {
            'active': self.wait_active_studies_available,
            'end of duration': self.wait_eod_studies_available,
            'completed': self.wait_completed_studies_available
        }
        wait_func[self.get_current_studies_type().lower()]()

    # Active study

    def sort_active_studies(self, asc_or_desc, field='study id'):
        """
        Handle sorting active studies
        :param asc_or_desc: (str) sort condition (valid keys: `asc` or `desc`)
        :param field: (str) sort field (content header)
        :return: None
        """
        index_header = {
            'study id': 0
        }
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.ACTIVE_DATA_HEADER)[index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_active_studies_available()

    def get_active_studies(self, row=None):
        """
        Get the active studies
        :param row: (int)
        :return: (list or dict) list of active studies
        """
        self.wait_active_studies_available()
        headers = self.browser.get_texts(self.LCT.ACTIVE_DATA_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.ACTIVE_DATA_CONTENT, row=row)

    def _on_active_studies_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_data = self.get_active_studies()
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        for i, row in enumerate(all_data):
            _row = {key.replace(' ', '_').lower(): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such active studies exist on `{_on}`.')

    def _get_active_studies_header_index(self, header):
        """
        Get active studies header index
        :param header: (str) header
        :return: (int) index of header
        """
        for index, elem in enumerate(self.browser.get_elements(self.LCT.ACTIVE_DATA_HEADER)):
            if self.browser.get_text(elem).lower() == header.lower():
                return index + 1
        raise Exception(f'No such header exist on `{header}`')

    def view_active_studies_study_information_on(self, **on):
        """
        Click study id to open right side and view the study information
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _row_index = self._on_active_studies_item(**on)
        _column_index = self._get_active_studies_header_index('study id')
        self.wait_active_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_active_studies_device_information_on(self, **on):
        """
        Click device id to open right side and view the device information
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _row_index = self._on_active_studies_item(**on)
        _column_index = self._get_active_studies_header_index('device id')
        self.wait_active_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_active_studies_patient_details_on(self, **on):
        """
        Click patient name to open right side and view the patient details
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _row_index = self._on_active_studies_item(**on)
        _column_index = self._get_active_studies_header_index('patient name')
        self.wait_active_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_active_studies_event_details_on(self, **on):
        """
        Handle viewing study events
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _row_index = self._on_active_studies_item(**on)
        _column_index = self._get_active_studies_header_index('total events')
        self.wait_active_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def get_active_studies_ecg_on(self, **on):
        """
        Handle clicking on ecg icon of selected item
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _index = self._on_active_studies_item(**on)
        self.wait_active_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT_GETECG)
        self.browser.hover_to_by_index(self.LCT.ACTIVE_DATA_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT_GETECG, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_active_studies_on(self, **on):
        """
        Handle clicking on manage icon of selected item
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _index = self._on_active_studies_item(**on)
        self.wait_active_studies_available()
        self.browser.hover_to_by_index(self.LCT.ACTIVE_DATA_CONTENT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT_MANAGESTUDY)
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT_MANAGESTUDY, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
    # End of duration

    def sort_end_of_duration_studies(self, asc_or_desc, field='study id'):
        """
        Handle sorting the end of duration studies
        :param asc_or_desc: (str) sort condition (valid keys: `asc` or `desc`)
        :param field: (str) sort field (content header)
        :return: None
        """
        index_header = {
            'study id': 0
        }
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.EOD_DATA_HEADER)[index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_eod_studies_available()

    def get_end_of_duration_studies(self, row=None):
        self.wait_eod_studies_available()
        header = self.browser.get_texts(self.LCT.EOD_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.EOD_DATA_CONTENT, row=row)

    def _on_end_of_duration_studies_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_data = self.get_end_of_duration_studies()
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        for i, row in enumerate(all_data):
            _row = {key.replace(' ', '_').lower(): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such end of duration studies exist on `{_on}`.')

    def _get_eod_studies_header_index(self, header):
        """
        Get header index
        :param header: (str) header
        :return: (int) index of header
        """
        for index, elem in enumerate(self.browser.get_elements(self.LCT.EOD_DATA_HEADER)):
            if self.browser.get_text(elem).lower() == header.lower():
                return index + 1
        raise Exception(f'No such header exist on `{header}`')

    def view_end_of_duration_studies_study_information_on(self, **on):
        _row_index = self._on_end_of_duration_studies_item(**on)
        _column_index = self._get_eod_studies_header_index('study id')
        self.wait_eod_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_end_of_duration_studies_devices_information_on(self, **on):
        _row_index = self._on_end_of_duration_studies_item(**on)
        _column_index = self._get_eod_studies_header_index('device id')
        self.wait_eod_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_end_of_duration_studies_patient_details_on(self, **on):
        _row_index = self._on_end_of_duration_studies_item(**on)
        _column_index = self._get_eod_studies_header_index('patient name')
        self.wait_eod_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_end_of_duration_studies_event_details_on(self, **on):
        _row_index = self._on_end_of_duration_studies_item(**on)
        _column_index = self._get_eod_studies_header_index('total events')
        self.wait_eod_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.EOD_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def manage_end_of_duration_studies_on(self, **on):
        _index = self._on_active_studies_item(**on)
        self.wait_active_studies_available()
        self.browser.hover_to_by_index(self.LCT.EOD_DATA_CONTENT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOD_DATA_CONTENT_MANAGESTUDY)
        self.browser.clicks(self.LCT.EOD_DATA_CONTENT_MANAGESTUDY, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    # Completed

    def sort_completed_studies(self, asc_or_desc, field='study id'):
        """
        Handle sorting the completed studies
        :param asc_or_desc: (str) sort condition (valid keys: `asc` or `desc`)
        :param field: (str) sort field (content header)
        :return: None
        """

        index_header = {
            'study id': 0
        }
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.COMPLETED_DATA_HEADER)[index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_completed_studies_available()

    def get_completed_studies(self, row=None):
        self.wait_completed_studies_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.COMPLETED_DATA_CONTENT_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.COMPLETED_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDIES_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDIES_NEXT, is_scroll=True)
                if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(self.LCT.NO_MORE_STUDY).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                # self.wait_completed_studies_available()
            else:
                self.wait_completed_studies_available()
                header = self.browser.get_texts(self.LCT.COMPLETED_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_completed_studies_on_page(self, row=None):
        self.wait_completed_studies_available()
        header = self.browser.get_texts(self.LCT.COMPLETED_DATA_HEADER)
        content = self.browser.get_texts(self.LCT.COMPLETED_DATA_CONTENT)
        output = Utils.group_tabular_data(header, content, row=row)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_completed_studies_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_data = self.get_completed_studies()
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        for i, row in enumerate(all_data):
            _row = {key.replace(' ', '_').lower(): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such completed studies exist on `{_on}`.')

    def _get_completed_studies_header_index(self, header):
        """
        Get header index
        :param header: (str) header
        :return: (int) index of header
        """
        for index, elem in enumerate(self.browser.get_elements(self.LCT.COMPLETED_DATA_HEADER)):
            if self.browser.get_text(elem).lower() == header.lower():
                return index + 1
        raise Exception(f'No such header exist on `{header}`')

    def view_completed_studies_study_information_on(self, **on):
        self.wait_completed_studies_available()
        _row_index = self._on_completed_studies_item(**on)
        _column_index = self._get_completed_studies_header_index('study id')
        self.wait_completed_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_completed_studies_device_information_on(self, **on):
        self.wait_completed_studies_available()
        _row_index = self._on_completed_studies_item(**on)
        _column_index = self._get_completed_studies_header_index('device id')
        self.wait_completed_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_completed_studies_patient_details_on(self, **on):
        self.wait_completed_studies_available()
        _row_index = self._on_completed_studies_item(**on)
        _column_index = self._get_completed_studies_header_index('patient name')
        self.wait_completed_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_completed_studies_event_details_on(self, **on):
        self.wait_completed_studies_available()
        _row_index = self._on_completed_studies_item(**on)
        _column_index = self._get_completed_studies_header_index('total events')
        self.wait_completed_studies_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]')
        self.browser.clicks(self.LCT.COMPLETED_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def download_completed_studies_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        self.wait_completed_studies_available()
        self.browser.hover_to_by_index(self.LCT.COMPLETED_DATA_CONTENT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT_DOWNLOAD)
        self.browser.clicks(self.LCT.COMPLETED_DATA_CONTENT_DOWNLOAD, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def manage_completed_studies_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        self.wait_completed_studies_available()
        self.browser.hover_to_by_index(self.LCT.COMPLETED_DATA_CONTENT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_DATA_CONTENT_MANAGESTUDY)
        self.browser.clicks(self.LCT.COMPLETED_DATA_CONTENT_MANAGESTUDY, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_all_completed_studies(self, row=None):
        self.wait_completed_studies_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDIES_ROW, inverse=True)
            if len(self.browser.get_elements(self.LCT.STUDIES_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.COMPLETED_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDIES_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDIES_NEXT, is_scroll=True)
                if self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_PGN_MESSAGE) and self.browser.get_element(self.LCT.COMPLETED_PGN_MESSAGE).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.STUDIES_NEXT)
            else:
                header = self.browser.get_texts(self.LCT.COMPLETED_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_completed_studies_customer(self, row=None):
        self.wait_completed_studies_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.COMPLETED_DATA_CONTENT_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.COMPLETED_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                self.wait_completed_studies_available()
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
            else:
                self.wait_completed_studies_available()
                header = self.browser.get_texts(self.LCT.COMPLETED_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def check_active_study_details_available(self):
        output = dict()
        if self.browser.wait_visibility_of_element_located(self.LCT.STUDY_ZIP_FILE) and self.browser.get_element(self.LCT.STUDY_ZIP_FILE).is_displayed():
            output['Zip File'] = True if self.browser.wait_visibility_of_element_located(self.LCT.STUDY_ZIP_FILE) and self.browser.get_element(self.LCT.STUDY_ZIP_FILE).get_attribute('disabled') is None else False
        return output

    def navigate_study_management_report_tab(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STUDY_MGNT_REPORT)
        time.sleep(10)
        self.browser.click(self.LCT.STUDY_MGNT_REPORT)

    def wait_reports_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_CONTENT, inverse=True)

    def verify_default_report(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_BUTTON)
        return self.browser.get_text(self.LCT.STUDY_REPORT_BUTTON)

    def verify_report_filter(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_BUTTON)
        self.browser.click(self.LCT.STUDY_REPORT_BUTTON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_FILTER)
        summary_report= self.browser.get_text(self.LCT.STUDY_REPORT_SUMMARY)
        notification_report= self.browser.get_text(self.LCT.STUDY_REPORT_NOTIFICATION)
        return summary_report, notification_report

    def include_aborted_study(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INCLUDE_ABORT)
        self.browser.click(self.LCT.INCLUDE_ABORT)

    def verify_abort_message(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STUDY_MGNT_ABORT)
        return self.browser.get_text(self.LCT.STUDY_MGNT_ABORT)

    def get_study_details_summary_reports(self, row=None):
        self.wait_reports_available()
        """
        Get summary report
        :return: (list) list of dicts
        """
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.STUDY_REPORT_RAW)) == 10:
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TIME_MONITORED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TYPE)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_GENERATED_BY)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_ASSIGNEE)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_NRS)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDY_REPORT_NEXT, is_scroll=True)
                #     if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(self.LCT.NO_MORE_STUDY).is_displayed():
                #         return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_reports_available()
            else:
                self.wait_reports_available()
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TIME_MONITORED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TYPE)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_GENERATED_BY)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_ASSIGNEE)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_NRS)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_study_details_summary_reports_role_technician(self, row=None):
        self.wait_reports_available()
        """
        Get summary report
        :return: (list) list of dicts
        """
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.STUDY_REPORT_RAW)) == 10:
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TIME_MONITORED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TYPE)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_GENERATED_BY)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_NRS)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDY_REPORT_NEXT, is_scroll=True)
                #     if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(self.LCT.NO_MORE_STUDY).is_displayed():
                #         return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_reports_available()
            else:
                self.wait_reports_available()
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TIME_MONITORED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_TYPE)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_GENERATED_BY)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_NRS)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def navigate_study_management_notification_report_tab(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_BUTTON)
        self.browser.click(self.LCT.STUDY_REPORT_BUTTON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_NOTIFICATION)
        self.browser.click(self.LCT.STUDY_REPORT_NOTIFICATION)

    def get_study_details_notification_reports(self, row=None):
        self.wait_reports_available()
        """
        Get summary report
        :return: (list) list of dicts
        """
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.STUDY_REPORT_RAW)) == 10:
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_ASSIGNEE)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDY_REPORT_NEXT, is_scroll=True)
                #     if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(self.LCT.NO_MORE_STUDY).is_displayed():
                #         return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_reports_available()
            else:
                self.wait_reports_available()
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_ASSIGNEE)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_study_details_notification_reports_role_technician(self, row=None):
        self.wait_reports_available()
        """
        Get summary report
        :return: (list) list of dicts
        """
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.STUDY_REPORT_RAW)) == 10:
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDY_REPORT_NEXT, is_scroll=True)
                #     if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(self.LCT.NO_MORE_STUDY).is_displayed():
                #         return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_reports_available()
            else:
                self.wait_reports_available()
                header = [self.browser.get_text(self.LCT.STUDY_REPORT_ID)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_LAST_MODIFIED)]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def filter_study_details_reports(self,text_search=None):
        self.browser.input_text(self.LCT.REPORT_SEARCHTEXTBOX, text_search)
        self.wait_reports_available()

    def sort_study_details_reports(self, field, asc_or_desc):
        """
        Handle sorting the study details > reports
        :param field: (str)  sort field (headers)
        :param asc_or_desc: (str) sort condition (valid keys: asc or desc)
        :return: None
        """
        self.wait_reports_available()
        _index_header = {
            'report id': 0,
            'report status': 2,
            'type': 3,
            'last modified': 4
        }
        self.browser.click(self.LCT.STUDY_REPORT_ID)
        time.sleep(10)
        for _ in range(2):
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_DATA_HEADER)
            element_sort = self.browser.get_elements(self.LCT.REPORT_DATA_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(element_sort, 'aria-label'):
                break
            self.browser.click(element_sort)