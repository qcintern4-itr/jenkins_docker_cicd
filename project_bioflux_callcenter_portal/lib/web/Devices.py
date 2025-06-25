#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import devices as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Devices(WebPage):
    """
    Handle devices page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_devices(self):
        """
        Navigate to devices page
        :return: None
        """
        self.browser.open_page(self.URL + '/devices')

    def wait_in_study_devices_available(self):
        """
        Wait until in study devices available
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INSTUDY_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INSTUDY_DATA_CONTENT)

    def wait_end_of_life_devices_available(self):
        """
        Wait until end of life devices available
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOL_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOL_DATA_CONTENT)

    def wait_all_devices_available(self):
        """
        Wait until all devices available
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ALL_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ALL_DATA_CONTENT, inverse=True)

    def navigate_to_devices_menu(self, tab):
        """
        Navigate to devices state (tab)
        :param tab: (str) device state
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                            stop_on_first=True)

    def filter_devices(self, facility=None, by_model=None, text_search=None):
        """
        Filter devices
        :param facility: (str)
        :param by_model: (str)
        :param text_search: (str)
        :return: None
        """
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_INPUT)
            self.browser.input_text(self.LCT.FACILITY_INPUT, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if by_model:
            self.browser.wait_visibility_of_element_located(self.LCT.CURRENTMODEL)
            self.browser.click(self.LCT.CURRENTMODEL)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BYMODELS_OPTIONS)
            self.browser.clicks(self.LCT.BYMODELS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_model.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.wait_visibility_of_element_located(self.LCT.TEXTSEARCH)
            self.browser.input_text(self.LCT.TEXTSEARCH, text_search)
            self.browser.wait_visibility_of_element_located(self.LCT.TEXTSEARCH, inverse=True)
        # wait_func = {
        #     'in study': self.wait_in_study_devices_available,
        #     'end of life': self.wait_end_of_life_devices_available,
        #     'all devices': self.wait_all_devices_available
        # }
        # wait_func[self.get_current_devices_state().lower()]()

    def get_current_devices_state(self):
        """
        Get current of devices state
        :return: (str) current devices state (tab)
        """
        for tab in self.browser.get_elements(self.LCT.TABS + '/a'):
            if 'active' in self.browser.get_attribute_value(tab, 'class'):
                return self.browser.get_text(tab)

    def get_devices_current_filter_values(self):
        """
        Get all current filter values on page
        :return: (dict) list of current filter values
        """
        output = {
            'Device State': self.get_current_devices_state(),
            'Facility': self.browser.get_text(self.LCT.FACILITY_INPUT + '/../../..'),
            'Model': self.browser.get_text(self.LCT.CURRENTMODEL),
            'Search By': self.browser.get_attribute_value(self.LCT.TEXTSEARCH, 'placeholder').replace('Search by', ''),
            'Text Search': self.browser.get_attribute_value(self.LCT.TEXTSEARCH, 'value')
        }
        return output

    def get_devices_filter_options(self):
        """
        Get all options of filter values
        :return: (dict) list of all options of filter values
        """
        output = dict()
        self.browser.click(self.LCT.FACILITY_INPUT + '/../../..')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS)
        output['Facilities'] = self.browser.get_texts(self.LCT.FACILITY_OPTIONS)
        self.browser.click(self.LCT.CURRENTMODEL)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BYMODELS_OPTIONS)
        output['Models'] = self.browser.get_texts(self.LCT.BYMODELS_OPTIONS)
        return output

    def clear_devices_text_search(self):
        self.browser.click(self.LCT.TEXTSEARCH_CLEAR)

    # In study

    def sort_in_study_devices(self, field, asc_or_desc):
        """
        Handle sorting in study devices
        :param field: (str) header (sort element)
        :param asc_or_desc: (str) sort condition (valid key: asc or desc)
        :return: None
        """
        field_index = {
            'device id': 0,
            'artifact reports': 6,
        }
        sort_elem = self.browser.get_elements(self.LCT.INSTUDY_DATA_HEADER)[field_index[field.lower()]]
        for _ in range(2):
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_in_study_devices_available()

    def get_in_study_devices(self, row=None):
        """
        Get the list of in study devices
        :param row: (int)
        :return: (list or dict)
        """
        self.wait_in_study_devices_available()
        header = self.browser.get_texts(self.LCT.INSTUDY_DATA_HEADER)
        output = self.browser.get_tabular_data(header, self.LCT.INSTUDY_DATA_CONTENT, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_in_study_devices_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_in_study_devices_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_in_study_devices()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such devices exist on `{_on}`.')

    def _in_study_devices_header_index(self, header):
        """
        Get index of content header on in study devices
        :param header: (str)
        :return: None
        """
        for index, head in enumerate(self.browser.get_elements(self.LCT.INSTUDY_DATA_HEADER)):
            if self.browser.get_text(head).lower() == header.lower():
                return index + 1
        raise Exception(f'No such header exist on `{header}`.')

    def view_in_study_devices_device_information_on(self, **on):
        """
        Open right side and view the device information
        :param on: (dict) supporting keys: row and all content headers
        :return: None
        """
        _row_index = self._on_in_study_devices_item(**on)
        _column_index = str(self._in_study_devices_header_index('device id'))
        self.browser.clicks(self.LCT.INSTUDY_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    # End of life

    def sort_end_of_life_devices(self, field, asc_or_desc):
        """
        Handle sorting end of life devices
        :param field: (str) header (sort element)
        :param asc_or_desc: (str) sort condition (valid key: asc or desc)
        :return: None
        """
        field_index = {
            'device id': 0,
            'artifact reports': 6
        }
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.EOL_DATA_HEADER)[field_index[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_end_of_life_devices_available()

    def get_end_of_life_devices(self, row=None):
        """
        Get the list of end of life devices
        :param row: (int)
        :return: (list or dict)
        """
        self.wait_end_of_life_devices_available()
        header = self.browser.get_texts(self.LCT.EOL_DATA_HEADER)
        output = self.browser.get_tabular_data(header, self.LCT.EOL_DATA_CONTENT, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_end_of_life_devices_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_end_of_life_devices_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_end_of_life_devices()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such devices exist on `{_on}`.')

    def _eol_devices_header_index(self, header):
        """
        Get index of content header on end of life devices
        :param header: (str)
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EOL_DATA_HEADER)
        for index, head in enumerate(self.browser.get_elements(self.LCT.EOL_DATA_HEADER)):
            if self.browser.get_text(head).lower() == header.lower():
                return index + 1
        raise Exception(f'No such header exist on `{header}`.')

    def view_end_of_life_devices_device_information_on(self, **on):
        """
        Open right side and view the device information
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _row_index = self._on_end_of_life_devices_item(**on)
        _column_index = str(self._eol_devices_header_index('device id'))
        self.browser.clicks(self.LCT.EOL_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    # All devices

    def _all_devices_header_index(self, header):
        """
        Get index of content header on all devices
        :param header: (str)
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ALL_DATA_HEADER)
        for index, head in enumerate(self.browser.get_elements(self.LCT.ALL_DATA_HEADER)):
            if self.browser.get_text(head).lower() == header.lower():
                return index + 1
        raise Exception(f'No such header exist on `{header}`.')

    def sort_all_devices(self, field, asc_or_desc):
        """
        Handle sorting all devices
        :param field: (str) header (sort element)
        :param asc_or_desc: (str) sort condition (valid key: asc or desc)
        :return: None
        """
        field_index = {
            'device id': 0,
            'artifact reports': 6
        }
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.ALL_DATA_HEADER)[field_index[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_all_devices_available()

    def get_all_devices(self, row=None):
        """
        Get the list of all devices
        :param row: (int)
        :return: (list or dict)
        """
        self.wait_all_devices_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.DEVICE_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.ALL_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ALL_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                self.browser.click(self.LCT.PGN_NEXT)
                if self.browser.wait_visibility_of_element_located(self.LCT.PGN_MESSAGE) and self.browser.get_element(self.LCT.PGN_MESSAGE).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
            else:
                header = self.browser.get_texts(self.LCT.ALL_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ALL_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                # print("ouput_1", output)
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_all_devices_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_all_devices_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_all_devices()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such devices exist on `{_on}`.')

    def view_all_devices_device_information_on(self, **on):
        """
        Open right side and view the device information
        :param on: (dict) supporting keys: row or all content headers
        :return: None
        """
        _row_index = self._on_all_devices_item(**on)
        _column_index = str(self._all_devices_header_index('device id'))
        self.browser.clicks(self.LCT.ALL_DATA_CONTENT + f'[{_column_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def sort_on_device_id(self):
        self.browser.wait_visibility_of_element_located(self.LCT.SORT_DEVICES_ID)
        self.browser.click(self.LCT.SORT_DEVICES_ID)
        self.wait_all_devices_available()

    def wait_devices_on_page_available(self):
        start_time = time.time()
        while True:
            if 'relative' not in self.browser.get_attribute_value(self.LCT.DEVICE_LOADING, 'class'):
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ALL_DATA_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_devices_on_page(self, row=None):
        """
        Get the list of all devices
        :param row: (int)
        :return: (list or dict)
        """
        self.wait_devices_on_page_available()
        header = self.browser.get_texts(self.LCT.ALL_DATA_HEADER)
        output = self.browser.get_tabular_data(header, self.LCT.ALL_DATA_CONTENT, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_devices_current_pagination(self):
        self.wait_all_devices_available()
        self.browser.wait_visibility_of_element_located(self.LCT.DEVICE_BYROW)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEVICE_PGN_PAGENUM)
        output = dict()
        output['Rows'] = self.browser.get_text(self.LCT.DEVICE_BYROW)
        output['Page'] = self.browser.get_text(
            self.browser.get_elements_by_condition(
                self.LCT.DEVICE_PGN_PAGENUM, on_elements=lambda _, e: 'filled-btn' in self.browser.get_attribute_value(
                    e, 'class').lower(), stop_on_first=True)[0]
        )
        return output

    def pagination_devices(self, next_or_previous=None, page_number=None):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
                self.browser.js_click(self.LCT.PGN_NEXT)
                break
            if next_or_previous == 'previous':
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_PREVIOUS)
                self.browser.js_click(self.LCT.PGN_PREVIOUS)
                break
        if page_number:
            self.browser.js_clicks(self.LCT.DEVICE_PGN_PAGENUM,
                                   on_elements=lambda e, _: self.browser.get_text(e) == page_number,
                                   stop_on_first=True)
        self.wait_in_study_devices_available()

    def custom_devices_size_per_page(self, rows):
        # Maybe invisibility so perform js click
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_attribute_value_to_be(self.LCT.DEVICE_PGN_PAGENUM, 'class', 'filled-btn')
        self.browser.click(self.LCT.DEVICE_BYROW)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEVICE_BYROW_OPTIONS)
        self.browser.clicks(self.LCT.DEVICE_BYROW_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == rows.lower(),
                            stop_on_first=True, is_scroll=True)

    def _on_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_devices_on_page_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_devices_on_page()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def edit_devices_on(self, **on):
        _index = self._on_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.ALL_DATA_CONTENT, _index)
        self.browser.clicks(self.LCT.DEVICE_EDIT_ICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_users_on(self, **on):
        self.wait_devices_on_page_available()
        _index = self._on_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.ALL_DATA_CONTENT, _index)
        self.browser.clicks(self.LCT.USER_EDIT_ICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_groups_on(self, **on):
        self.wait_devices_on_page_available()
        _index = self._on_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.ALL_DATA_CONTENT, _index)
        self.browser.clicks(self.LCT.GROUPS_EDIT_ICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
