#!/usr/bin/env python3
import time

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import devices as locators
    from corelib import Utils
    from corelib import WebHandler
    from selenium.webdriver import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Devices(WebPage):
    """
    Handle the Devices page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_devices(self):
        self.browser.open_page(self.URL + '/devices')

    def wait_for_all_devices_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ALLDV_DATA_CONTENT) and self.browser.get_elements(self.LCT.ALLDV_DATA_CONTENT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ALLDV_DATA_HEADER, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_for_lost_or_inactive_devices_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INACTDV_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INACTDV_DATA_CONTENT, inverse=True)

    def wait_for_unused_devices_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UNUSED_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UNUSED_DATA_CONTENT, inverse=True)

    def navigate_to_devices_tab(self, tab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS) and self.browser.get_elements(self.LCT.TABS)[0].is_displayed():
                self.browser.clicks(self.LCT.TABS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                return self

    def navigate_to_devices_subtabs(self, subtab):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBTABS, inverse=True)
        self.browser.clicks(self.LCT.SUBTABS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == subtab.lower(),
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBTABS, inverse=True)

    def get_devices_subtabs(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBTABS)
        return self.browser.get_texts(self.LCT.SUBTABS)

    def _get_current_devices_tab(self):
        element = self.browser.get_elements_by_condition(
            self.LCT.TABS,
            on_elements=lambda _, e: '-active' in self.browser.get_attribute_value(e, 'class'), stop_on_first=True
        )[0]
        return self.browser.get_text(element).split('\n')[0]

    def _get_current_devices_state(self):
        element = self.browser.get_elements_by_condition(
            self.LCT.SUBTABS,
            on_elements=lambda _, e: '-selected' in self.browser.get_attribute_value(e, 'class'), stop_on_first=True
        )[0]
        return self.browser.get_text(element).split('\n')[0]

    def _get_current_devices_last_used(self):
        element = self.browser.get_elements_by_condition(
            self.LCT.SUBTABS_USED,
            on_elements=lambda _, e: 'selected' in self.browser.get_attribute_value(e, 'class'), stop_on_first=True
        )[0]
        return self.browser.get_text(element).split('\n')[0]

    def get_devices_current_filter(self):
        output = {
            'Facility': self.browser.get_text(self.LCT.FACILITY_CURRENT),
            'Device Type': self._get_current_devices_tab(),
            'Device State': self._get_current_devices_state() if self._get_current_devices_tab().lower(
            ) == 'all devices' else None,
            'Last Used': self._get_current_devices_last_used() if self._get_current_devices_tab().lower(
            ) == 'unused' else None,
            'Search By': self.browser.get_attribute_value(self.LCT.SEARCHTEXTBOX, 'placeholder').replace(
                'Search by ', ''),
            'Model': self.browser.get_text(self.LCT.BYMODEL),
            'Text Search': self.browser.get_attribute_value(self.LCT.SEARCHTEXTBOX, 'value'),
        }
        if self.browser.wait_visibility_of_element_located(self.LCT.SORT_DEVICES_ID) and self.browser.get_element(self.LCT.SORT_DEVICES_ID).is_displayed():
            output['Sort'] = self.browser.get_attribute_value(self.LCT.SORT_DEVICES_ID, 'aria-sort')
        return output

    def get_devices_filter_options(self):
        output = {
            'Device Types': self.browser.get_texts(self.LCT.TABS),
            'Device State': self.browser.get_texts(self.LCT.SUBTABS) if self._get_current_devices_tab().lower(
            ) == 'all devices' else None,
            'Last Used': self.browser.get_texts(self.LCT.SUBTABS) if self._get_current_devices_tab().lower(
            ) == 'unused' else None,
        }

        # Facilities
        self.browser.click(self.LCT.FACILITY_CURRENT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_SELECTIONS)
        output['Facilities'] = self.browser.get_texts(self.LCT.FACILITY_SELECTIONS)
        # handle in case of facility dropdown not closed
        self.browser.clicks(self.LCT.FACILITY_SELECTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower(
                            ) == self.get_devices_current_filter()['Facility'].lower(), stop_on_first=True)

        # Models
        self.browser.click(self.LCT.BYMODEL)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BYMODEL_OPTIONS)
        output['Model'] = self.browser.get_texts(self.LCT.BYMODEL_OPTIONS)
        # handle in case of model dropdown not closed
        self.browser.clicks(self.LCT.BYMODEL_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower(
                            ) == self.get_devices_current_filter()['Model'].lower(), stop_on_first=True)
        return output

    def get_all_devices(self, row=None):
        self.wait_for_all_devices_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.DEVICE_ROW)) == 10:
                header = ['Device ID'] + self.browser.get_texts(self.LCT.ALLDV_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ALLDV_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.PGN_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.PGN_NEXT)
                if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_DEVICES) and self.browser.get_element(self.LCT.NO_MORE_DEVICES).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
                # self.wait_for_all_devices_available()
            else:
                self.wait_for_all_devices_available()
                header = ['Device ID'] + self.browser.get_texts(self.LCT.ALLDV_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ALLDV_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_lost_or_inactive_devices(self, row=None):
        self.wait_for_lost_or_inactive_devices_available()
        header = self.browser.get_texts(self.LCT.INACTDV_DATA_HEADER)
        output = self.browser.get_tabular_data(header, self.LCT.INACTDV_DATA_CONTENT, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_unused_devices(self, row=None):
        self.wait_for_unused_devices_available()
        header = ['Device ID'] + self.browser.get_texts(self.LCT.UNUSED_DATA_HEADER)
        output = self.browser.get_tabular_data(header, self.LCT.UNUSED_DATA_CONTENT, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def sort_devices(self, asc_or_desc=None):
        if asc_or_desc:
            for _ in range(2):
                self.wait_for_all_devices_available()
                element_sort = self.browser.get_element(self.LCT.SORT_DEVICES_ID)
                if self.browser.get_attribute_value(element_sort, 'aria-sort').endswith(asc_or_desc):
                    break
                self.browser.click(self.LCT.SORT_DEVICES_ID)

    def filter_devices(self, devices_tab=None, devices_subtab=None, by_model=None, text_search=None, sort_devices=None):
        if devices_tab:
            self.navigate_to_devices_tab(devices_tab)
        if devices_subtab:
            self.navigate_to_devices_subtabs(devices_subtab)
        if by_model:
            self.browser.wait_visibility_of_element_located(self.LCT.BYMODEL, inverse=True)
            self.browser.click(self.LCT.BYMODEL)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BYMODEL_OPTIONS)
            self.browser.clicks(self.LCT.BYMODEL_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_model.lower(), stop_on_first=True)
        if text_search is not None:
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCHTEXTBOX)
            self.browser.input_text(self.LCT.SEARCHTEXTBOX, text_search)
        if sort_devices:  # valid keys: asc or desc
            self.sort_devices(sort_devices)
        wait_func = {
            'all devices': self.wait_for_all_devices_available,
            'lost/inactive': self.wait_for_lost_or_inactive_devices_available,
            'unused': self.wait_for_unused_devices_available
        }
        wait_func[self._get_current_devices_tab().lower()]()

    def custom_devices_size_per_page(self, rows):
        # Maybe invisibility so perform js click
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_attribute_value_to_be(self.LCT.PGN_PAGENUM, 'class', 'active')
        self.browser.scroll_into_view(self.LCT.BYROW)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BYROW_OPTIONS, inverse=True)
        self.browser.click(self.LCT.BYROW)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BYROW_OPTIONS)
        self.browser.clicks(self.LCT.BYROW_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == rows.lower(),
                            stop_on_first=True, is_scroll=True)

    def pagination_devices(self, next_or_previous=None, page_number=None, is_wait=True):
        if next_or_previous.lower() not in ('next', 'previous', 'next_lost', 'previous_lost'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(4):
            if next_or_previous == 'next':
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
                self.browser.js_click(self.LCT.PGN_NEXT)
                break
            if next_or_previous == 'previous':
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_PREVIOUS)
                self.browser.js_click(self.LCT.PGN_PREVIOUS)
                break
            if next_or_previous == 'previous_lost':
                self.browser.wait_visibility_of_element_located(self.LCT.LOST_PGN_PREVIOUS)
                self.browser.js_click(self.LCT.LOST_PGN_PREVIOUS)
                break
            if next_or_previous == 'next_lost':
                self.browser.wait_visibility_of_element_located(self.LCT.LOST_PGN_NEXT)
                self.browser.js_click(self.LCT.LOST_PGN_NEXT)
                break
        if page_number:
            self.browser.js_clicks(self.LCT.PGN_PAGENUM,
                                   on_elements=lambda e, _: self.browser.get_text(e) == page_number,
                                   stop_on_first=True)
            # Utils.wait_until(self.browser.get_text, self.browser.get_elements_by_condition(
            #     self.LCT.PGN_PAGENUM, on_elements=lambda _, e: 'filled-btn' in self.browser.get_attribute_value(
            #         e, 'class').lower(), stop_on_first=True)[0], on_condition=lambda _, e: e.lower() == page_number)
        if is_wait:
            wait_func = {
                'all devices': self.wait_for_all_devices_available,
                'lost/inactive': self.wait_for_lost_or_inactive_devices_available,
                'unused': self.wait_for_unused_devices_available
            }
            wait_func[self._get_current_devices_tab().lower()]()

    def get_devices_current_pagination(self):
        self.browser.execute_script('window.scrollTo(0,2500)')
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.BYROW) and self.browser.get_element(self.LCT.BYROW).is_displayed():
                output = dict()
                output['Rows'] = self.browser.get_text(self.LCT.BYROW)
                output['Page'] = self.browser.get_text(
                    self.browser.get_elements_by_condition(
                        self.LCT.PGN_PAGENUM, on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(
                            e, 'class').lower(), stop_on_first=True)[0]
                )
                return output
            elif time.time() - start_time > 1 * 60:
                break

    def _on_all_device_items(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_all_devices_available()
        all_devices = self.get_all_devices()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_devices):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such device exist under `{_on}`.')

    def view_all_devices_device_information_on(self, **on):
        self.wait_for_all_devices_available()
        _index = self._on_all_device_items(**on)
        self.browser.clicks(self.LCT.ALLDV_DATA_CONTENT_DEVICEID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_all_devices_study_information_on(self, **on):
        self.wait_for_all_devices_available()
        _index = self._on_all_device_items(**on)
        self.browser.clicks(self.LCT.ALLDV_DATA_CONTENT_STUDYID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_lost_or_inactive_device_items(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_lost_or_inactive_devices_available()
        devices = self.get_lost_or_inactive_devices()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(devices):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such lost or inactive device exist under `{_on}`.')

    def view_lost_or_inactive_devices_device_information_on(self, **on):
        self.wait_for_lost_or_inactive_devices_available()
        _index = self._on_lost_or_inactive_device_items(**on)
        self.browser.clicks(self.LCT.INACTDV_DATA_CONTENT_DEVICEID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_lost_or_inactive_devices_study_information_on(self, **on):
        self.wait_for_lost_or_inactive_devices_available()
        _index = self._on_lost_or_inactive_device_items(**on)
        self.browser.clicks(self.LCT.INACTDV_DATA_CONTENT_STUDYID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_unused_device_items(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_unused_devices_available()
        devices = self.get_unused_devices()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(devices):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such unused device exist under `{_on}`.')

    def view_unused_devices_device_information_on(self, **on):
        self.wait_for_unused_devices_available()
        _index = self._on_unused_device_items(**on)
        self.browser.clicks(self.LCT.UNUSED_DATA_CONTENT_DEVICEID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def clear_devices_text_search(self):
        self.browser.wait_visibility_of_element_located(self.LCT.SEARCHTEXTBOX)
        text_search = self.browser.get_attribute_value(self.LCT.SEARCHTEXTBOX, 'value')
        self.browser.click(self.LCT.SEARCHTEXTBOX)
        for _ in text_search:
            self.browser.clear_on_text_search()

    def check_sort_reports(self):
        self.browser.wait_visibility_of_element_located(self.LCT.SORT_DEVICES_ID)
        self.browser.click(self.LCT.SORT_DEVICES_ID)
        self.wait_for_all_devices_available()

    def get_devices_on_page(self, row=None):
        self.wait_for_all_devices_available()
        header = ['Device ID'] + self.browser.get_texts(self.LCT.ALLDV_DATA_HEADER)
        content = self.browser.get_texts(self.LCT.ALLDV_DATA_CONTENT)
        output = Utils.group_tabular_data(header, content, row=row)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_all_devices_on_lost_tab(self, row=None):
        self.wait_for_all_devices_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.DEVICE_ROW)) == 10:
                self.wait_for_all_devices_available()
                header = ['Device ID'] + self.browser.get_texts(self.LCT.ALLDV_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ALLDV_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.LOST_PGN_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.LOST_PGN_NEXT)
                self.browser.wait_visibility_of_element_located(self.LCT.LOST_PGN_NEXT)
            else:
                self.wait_for_all_devices_available()
                header = ['Device ID'] + self.browser.get_texts(self.LCT.ALLDV_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ALLDV_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_current_pagination_on_lost_tab(self):
        self.wait_for_all_devices_available()
        self.browser.wait_visibility_of_element_located(self.LCT.LOST_BYROW)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.LOST_PGN_PAGENUM)
        output = dict()
        output['Rows'] = self.browser.get_text(self.LCT.LOST_BYROW)
        output['Page'] = self.browser.get_text(
            self.browser.get_elements_by_condition(
                self.LCT.LOST_PGN_PAGENUM, on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(
                    e, 'class').lower(), stop_on_first=True)[0]
        )
        return output

    def custom_devices_size_per_page_on_lost_tab(self, rows):
        # Maybe invisibility so perform js click
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_attribute_value_to_be(self.LCT.LOST_PGN_PAGENUM, 'class', 'active')
        self.browser.click(self.LCT.LOST_BYROW)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BYROW_OPTIONS)
        self.browser.clicks(self.LCT.BYROW_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == rows.lower(),
                            stop_on_first=True, is_scroll=True)

    def get_current_filter(self):
        output = {
            'Facility': self.browser.get_text(self.LCT.FACILITY_CURRENT),
            'Device Type': self._get_current_devices_tab(),
            'Last Used': self._get_current_devices_last_used() if self._get_current_devices_tab().lower(
            ) == 'unused' else None,
            'Model': self.browser.get_text(self.LCT.BYMODEL),
            'Text Search': self.browser.get_attribute_value(self.LCT.SEARCHTEXTBOX, 'value'),
        }
        return output
