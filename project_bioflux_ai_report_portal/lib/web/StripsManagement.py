#!/usr/bin/env python3
import time

try:
    from project_bioflux_ai_report_portal.lib.WebPage import WebPage
    from project_bioflux_ai_report_portal.config.web_locators import strips_management as locators
    from selenium.webdriver import Keys
    from selenium.webdriver.common.by import By
    from corelib import Utils
    from datetime import datetime, timedelta

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class StripsManagement(WebPage):
    """
    Handle StripsManagement page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_tab_menu_strips_management(self, menu=None, nested_div_id=None):
        """
        Navigate to tab menu
        :param menu: The menu name to click
        :param nested_div_id: The id of the nested div to distinguish buttons
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_EVENTS_WAITING) and \
                    self.browser.get_element(self.LCT.ELEMENT_AUTO_EVENTS_WAITING).is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_TABS_MENU, inverse=True)
                self.browser.clicks(
                    self.LCT.ELEMENT_TABS_MENU,
                    on_elements=lambda _, e: (
                            self.browser.get_text(e).lower().split('\n')[0] == menu.lower()
                            and (nested_div_id is None or self._get_nested_div_id(e) == nested_div_id)
                    ),
                    is_scroll=True,
                    stop_on_first=True
                )
                # self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_TABS_MENU, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                print("Timeout: Unable to navigate to the specified tab.")
                break

    def navigate_to_event_tab(self, tab_name=None):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_TABS_MENU)
        tab_mapping = {
            "INCLUDE IN REPORT": self.LCT.ELEMENT_EVENT_INCLUDE_IN_REPORT,
            "PATIENT TRIGGERED": self.LCT.ELEMENT_EVENT_PATIENT_TRIGGERED,
            "OTHER DEVICE": self.LCT.ELEMENT_EVENT_OTHER_DEVICE,
            "AUTO EVENTS": self.LCT.ELEMENT_EVENT_AUTO_EVENTS,
            "OTHER AUTO": self.LCT.ELEMENT_EVENT_OTHER_AUTO,
            "VE": self.LCT.ELEMENT_EVENT_VE,
            "SVE": self.LCT.ELEMENT_EVENT_SVE,
            "AFIB": self.LCT.ELEMENT_EVENT_AFIB,
            "TACHY": self.LCT.ELEMENT_EVENT_TACHY,
            "BRADY": self.LCT.ELEMENT_EVENT_BRADY,
            "PAUSE": self.LCT.ELEMENT_EVENT_PAUSE,
            "VT": self.LCT.ELEMENT_EVENT_VT,
            "SVT": self.LCT.ELEMENT_EVENT_SVT,
            "MIN HR": self.LCT.ELEMENT_EVENT_MIN_HR,
            "MAX HR": self.LCT.ELEMENT_EVENT_MAX_HR,
            "HB": self.LCT.ELEMENT_EVENT_HB,
        }

        tab_key = tab_name.upper()
        if tab_key not in tab_mapping:
            self.logger.warning(f"Tab name '{tab_name}' is not recognized.")
            return False

        tab_element = tab_mapping[tab_key]
        if self.browser.wait_visibility_of_element_located(tab_element, timeout=5):
            self.browser.click(tab_element)
            self.logger.info(f"Clicked on tab '{tab_key}'")
            return True
        else:
            self.logger.warning(f"Tab '{tab_key}' not visible after {5} seconds.")
            return False

    def _get_nested_div_id(self, element):
        """
        Extracts the nested div's id from the button element.
        :param element: WebElement representing the button
        :return: String id of the nested div
        """
        try:
            nested_div = element.find_element(By.CLASS_NAME, 'ml-auto')
            return nested_div.get_attribute('id')
        except Exception as e:
            return None

    def wait_filter_header_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_FILTER_HEADER) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_FILTER_HEADER).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_FILTER_HEADER, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_filters_strip(self):
        self.wait_filter_header_available()
        output = {
            'Type of event': self.browser.get_text(self.LCT.ELEMENT_STRIPS_FILTER_EVENT_TYPE),
            'Validity': self.browser.get_text(self.LCT.ELEMENT_STRIPS_FILTER_VALIDITY)
        }
        return output

    def filter_strips_management(self, text_search=None, asc_or_desc=None, validity=None,
                                 size=None, search_by=False, filter_submit=False, filter_reset=False,
                                 include_report=None, include_strip=None, edit_strip=False,
                                 zoom_tool_device_events=False,zoom_tool_auto_events=False,
                                 search_by_validity=None, search_by_event_type=None,
                                 is_save=False,is_captured=False,is_done=False):
        if text_search:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_SEARCH_BY_EVENT_ID, inverse=True)
            self.browser.input_text(self.LCT.ELEMENT_SEARCH_BY_EVENT_ID, text_search)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_SEARCH_BY_EVENT_ID, inverse=True)
        if not self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_CHECKBOX_REPORT, 'disabled'):
            self.browser.toggle_checkbox(self.LCT.ELEMENT_STRIPS_CHECKBOX_REPORT, self.LCT.ELEMENT_STRIPS_CHECKBOX_REPORT + '/..',
                                         include_report)
        if not self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_CHECKBOX_STRIP, 'disabled'):
            self.browser.toggle_checkbox(self.LCT.ELEMENT_STRIPS_CHECKBOX_STRIP, self.LCT.ELEMENT_STRIPS_CHECKBOX_STRIP + '/..',
                                         include_strip)
        if asc_or_desc:
            for _ in range(2):
                if asc_or_desc in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_SORT, 'type'):
                    break
                self.browser.click(self.LCT.ELEMENT_STRIPS_SORT)
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_SORT, inverse=True)
        if validity:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS)
            self.browser.click(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS_OPTION, inverse=True)
            self.browser.clicks(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == validity.lower(), is_scroll=True,
                                stop_on_first=True)
        if size:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_SIZE)
            self.browser.click(self.LCT.ELEMENT_STRIPS_SIZE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_SIZE, inverse=True)
            self.browser.clicks(self.LCT.ELEMENT_STRIPS_SIZE_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == size.lower(), is_scroll=True,
                                stop_on_first=True)
        if search_by:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_FILTER)
            self.browser.click(self.LCT.ELEMENT_STRIPS_FILTER)
        if search_by_validity:
            self.browser.click(self.LCT.ELEMENT_STRIPS_FILTER_VALIDITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_FILTER_VALIDITY_OPTION, inverse=True)
            self.browser.clicks(self.LCT.ELEMENT_STRIPS_FILTER_VALIDITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by_validity.lower(), is_scroll=True,
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_FILTER_VALIDITY_OPTION, inverse=True)
        if search_by_event_type:
            self.browser.click(self.LCT.ELEMENT_STRIPS_FILTER_EVENT_TYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_FILTER_EVENT_TYPE_OPTION, inverse=True)
            self.browser.clicks(self.LCT.ELEMENT_STRIPS_FILTER_EVENT_TYPE_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by_event_type.lower(), is_scroll=True,
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_FILTER_EVENT_TYPE_OPTION, inverse=True)
        if filter_reset:
            # self.wait_filter_header_available()
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_FILTER_RESET)
            self.browser.click(self.LCT.ELEMENT_STRIPS_FILTER_RESET)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_FILTER_RESET, inverse=True)
        if filter_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_FILTER_SUBMIT)
            self.browser.click(self.LCT.ELEMENT_STRIPS_FILTER_SUBMIT)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_FILTER_SUBMIT, inverse=True)
        if edit_strip:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_EDIT_BUTTON, inverse=True)
            self.browser.click(self.LCT.ELEMENT_STRIPS_EDIT_BUTTON, is_scroll=True)
        if zoom_tool_device_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_ZOOM_TOOL)
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_ZOOM_TOOL).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_ZOOM_TOOL)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_ZOOM_TOOL, inverse=True)
            element = self.browser.get_element(self.LCT.ELEMENT_STRIPS_ECG_CHART)
            self.browser.click_by_offset(element, 100, 100)
        if zoom_tool_auto_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_EVENTS_ZOOM_TOOL)
            self.browser.get_element(self.LCT.ELEMENT_AUTO_EVENTS_ZOOM_TOOL).is_displayed()
            self.browser.click(self.LCT.ELEMENT_AUTO_EVENTS_ZOOM_TOOL)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_EVENTS_ZOOM_TOOL, inverse=True)
            element = self.browser.get_element(self.LCT.ELEMENT_AUTO_EVENTS_ECG_CHART)
            self.browser.click_by_offset(element, 100, 100)
        if is_captured:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CAPTURE)
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CAPTURE).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CAPTURE)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CAPTURE_EDIT)
            self.browser.click(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CAPTURE_EDIT)
        if is_done:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_DONE)
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_DONE).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_MANAGEMENT_DONE)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_SAVE_BUTTON, inverse=True)
            self.browser.click(self.LCT.ELEMENT_SAVE_BUTTON)
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT) and self.browser.get_elements(self.LCT.ELEMENT_STRIPS_MANAGEMENT)[0].is_displayed():
                    self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)
                    break
                elif time.time() - start_time > 2 * 60:  # 15 minutes in seconds
                    return False

    def set_ecg_disclosure(self, is_confirm=False, is_cancel=False):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_EVENT_DISCLOSURE)
        self.browser.click(self.LCT.ELEMENT_EVENT_DISCLOSURE)
        if is_confirm:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CONFIRM)
            self.browser.click(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CONFIRM)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CONFIRM, inverse=True)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CANCEL)
            self.browser.click(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CANCEL)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CANCEL, inverse=True)




    def get_validity_options(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS)
        self.browser.click(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS_OPTION, inverse=True)
        output = self.browser.get_texts(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS_OPTION)
        self.browser.click(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS)
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS, inverse=True)
        return output

    def get_size_options(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_SIZE)
        self.browser.click(self.LCT.ELEMENT_STRIPS_SIZE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_SIZE, inverse=True)
        output = self.browser.get_texts(self.LCT.ELEMENT_STRIPS_SIZE_OPTION)
        self.browser.click(self.LCT.ELEMENT_STRIPS_SIZE)
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_SIZE, inverse=True)
        return output

    def get_message_strip_management(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_NO_DATA)
        return self.browser.get_text(self.LCT.ELEMENT_STRIPS_NO_DATA)

    def get_strips_management(self):
        self.wait_strips_items_available()
        output = []
        for element in self.browser.get_elements(self.LCT.ELEMENT_STRIPS_MANAGEMENT):
            data_dict = {
                'DateTime': self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_EVENT_TIME)),
                'Comment': self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_STRIPS_COMMENT)),
            }
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_EVENT_ID) and self.browser.get_elements(self.LCT.ELEMENT_EVENT_ID)[0].is_displayed():
                data_dict['Event ID'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_EVENT_ID)).replace('#', '')
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_STATUS_EDIT) and self.browser.get_elements(self.LCT.ELEMENT_STRIPS_STATUS_EDIT)[0].is_displayed():
                data_dict['Status'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_STRIPS_STATUS_EDIT))
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_EVENT_VALIDITY_STATUS) and self.browser.get_elements(self.LCT.ELEMENT_EVENT_VALIDITY_STATUS)[0].is_displayed():
                data_dict['Validity Status'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_EVENT_VALIDITY_STATUS))
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_ROOT_TYPE) and self.browser.get_elements(self.LCT.ELEMENT_STRIPS_ROOT_TYPE)[0].is_displayed():
                root_data = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_STRIPS_ROOT_TYPE)).split('\n')
                key = root_data[0].split(':')[0]
                data_dict[key] = root_data[1]
            if self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_REPORT) is not None and self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_REPORT).is_displayed():
                data_dict['Include report'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_REPORT))
            if self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_STRIP) is not None and self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_STRIP).is_displayed():
                data_dict['Include strip'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_STRIP))
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_strips_management_selected(self):
        # start_time = time.time()
        # while True:
        #     if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_EVENT_TIME) and self.browser.get_elements(self.LCT.ELEMENT_EVENT_TIME)[0].is_displayed():
        #         break
        #     elif time.time() - start_time > 1 * 60:
        #         break
        time.sleep(5)
        output = []
        for element in self.browser.get_elements(self.LCT.ELEMENT_STRIPS_MANAGEMENT_SELECTED):
            data_dict = {
                'DateTime': self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_EVENT_TIME)),
                'Comment': self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_STRIPS_COMMENT)),
                'Title': self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_STRIPS_TITLE)),
            }
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_EVENT_ID_SELECTED) and self.browser.get_elements(self.LCT.ELEMENT_EVENT_ID_SELECTED)[0].is_displayed():
                data_dict['Event ID'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_EVENT_ID)).replace('#', '')
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_EVENT_VALIDITY_STATUS_SELECTED) and self.browser.get_elements(self.LCT.ELEMENT_EVENT_VALIDITY_STATUS_SELECTED)[0].is_displayed():
                data_dict['Validity Status'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_EVENT_VALIDITY_STATUS))
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_ROOT_TYPE_SELECTED) and self.browser.get_elements(self.LCT.ELEMENT_STRIPS_ROOT_TYPE_SELECTED)[0].is_displayed():
                root_data = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_STRIPS_ROOT_TYPE)).split('\n')
                key = root_data[0].split(':')[0]
                data_dict[key] = root_data[1]
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_STATUS_EDIT) and self.browser.get_elements(self.LCT.ELEMENT_STRIPS_STATUS_EDIT)[0].is_displayed():
                data_dict['Status'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_STRIPS_STATUS_EDIT))
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_INCLUDE_REPORT_SELECTED) and self.browser.get_elements(self.LCT.ELEMENT_INCLUDE_REPORT_SELECTED)[0].is_displayed():
                data_dict['Include report'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_REPORT))
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_INCLUDE_STRIP_SELECTED) and self.browser.get_elements(self.LCT.ELEMENT_INCLUDE_STRIP_SELECTED)[0].is_displayed():
                data_dict['Include strip'] = self.browser.get_text(self.browser.get_child_element(element, self.LCT.ELEMENT_INCLUDE_STRIP))
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_strips_management_box(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_BOX_CONTENT, inverse=True)
        header = self.browser.get_texts(self.LCT.ELEMENT_STRIPS_BOX_HEADER) + [self.browser.get_text(self.LCT.ELEMENT_STRIPS_BOX_TECHNICIAN)]
        content = self.browser.get_texts(self.LCT.ELEMENT_STRIPS_BOX_CONTENT) + [self.browser.get_text(self.LCT.ELEMENT_STRIPS_BOX_TECHNICIAN_COMMENT)]
        data = Utils.group_tabular_data(header, content, row=1)
        output = {}
        for key, value in data.items():
            output[key[:-1]] = value
        self.logger.info(output)
        return output

    def get_start_time_edit_strip(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_START_TIME_EDIT)
        return self.browser.get_text(self.LCT.ELEMENT_START_TIME_EDIT)

    def check_toolbar_strips_management_available(self):
        output = {
            'Size': False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_SIZE, 'class') else True,
            'Include strip': False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_CHECKBOX_STRIP, 'class') else True,
            'Include event in report': False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_CHECKBOX_REPORT, 'class') else True,
            'Refresh': False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_REFRESH, 'class') else True,
        }
        if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS).is_displayed():
            output['Validity Status'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS, 'class') else True
        if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_DELETE) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_DELETE).is_displayed():
            output['Delete'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_DELETE, 'class') else True
        if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_SEARCH_BY_EVENT_ID + '/..') and self.browser.get_element(self.LCT.ELEMENT_SEARCH_BY_EVENT_ID + '/..').is_displayed():
            output['Search'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_SEARCH_BY_EVENT_ID + '/..', 'class') else True
        if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_SORT) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_SORT).is_displayed():
            output['Sort'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_SORT, 'class') else True
        return output

    def check_mark_include_toolbar_available(self):
        output = {
            'Include strip': False if 'checked' not in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_CHECKBOX_STRIP, 'class') else True,
            'Include event in report': False if 'checked' not in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_CHECKBOX_REPORT, 'class') else True,
        }
        return output

    def get_current_values_toolbar_strips_management(self):
        output = {
            'Size': self.browser.get_text(self.LCT.ELEMENT_STRIPS_SIZE).split()[-1],
        }
        if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS).is_displayed():
            output['Validity Status'] = self.browser.get_text(self.LCT.ELEMENT_STRIPS_VALIDITY_STATUS)
        if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_HIDE_EXCLUDED) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_HIDE_EXCLUDED).is_displayed():
            output['Hide excluded'] = False if 'checked' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_HIDE_EXCLUDED, 'class') else True
        return output

    def wait_strips_items_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT) and self.browser.get_elements(self.LCT.ELEMENT_STRIPS_MANAGEMENT)[0].is_displayed():
                # self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def sort_asc_by_datetime(self, date_time=None):
        self.wait_strips_items_available()
        # Convert times to datetime objects
        formatted_times = [datetime.strptime(time_1, "%m/%d, %H:%M:%S") for time_1 in date_time]
        # Sort the datetime objects (ascending)
        sorted_times = sorted(formatted_times, reverse=False)
        # Convert sorted times back to the original format
        sorted_times_formatted = [time_1.strftime("%m/%d, %H:%M:%S") for time_1 in sorted_times]
        if date_time == sorted_times_formatted:
            return sorted_times_formatted

    def sort_desc_by_datetime(self, date_time=None):
        self.wait_strips_items_available()
        # Convert times to datetime objects
        formatted_times = [datetime.strptime(time_1, "%m/%d, %H:%M:%S") for time_1 in date_time]
        # Sort the datetime objects (ascending)
        sorted_times = sorted(formatted_times, reverse=True)
        # Convert sorted times back to the original format
        sorted_times_formatted = [time_1.strftime("%m/%d, %H:%M:%S") for time_1 in sorted_times]
        if date_time == sorted_times_formatted:
            return sorted_times_formatted

    def view_strips_management_on(self, row):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)
        _on = [s.strip() for s in row.split(',')] if isinstance(row, str) else row  # str|list
        for _row in _on:
            _index = self._on_strips_management_items(row=_row)
            _row_elem = self.browser.get_elements_by_condition(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
            self.browser.hover_to(_row_elem)
            self.browser.ctrl_and_click(_row_elem)

    def select_strips_management_on(self, row=None):
        self.wait_strips_items_available()
        _on = [s.strip() for s in row.split(',')] if isinstance(row, str) else row  # str|list
        for _row in _on:
            _index = self._on_strips_management_items(row=_row)
            _row_elem = self.browser.get_elements_by_condition(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
            self.browser.hover_to(_row_elem)
            self.browser.click(_row_elem)

    def _on_strips_management_items(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_strips_items_available()
        all_data = self.get_strips_management()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such pending notification report exist on {_on}.')

    def open_to_event_details(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_OPEN)
        self.browser.click(self.LCT.ELEMENT_STRIPS_OPEN)

    def get_number_strips_on_tab_menu(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_NUMBER)
        return self.browser.get_text(self.LCT.ELEMENT_STRIPS_NUMBER)

    def get_speed_edit_strip_config(self,is_device_events=False, is_auto_events=False):
        if is_device_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_ECG_SPEED)
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_ECG_SPEED).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_ECG_SPEED)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_ECG_SPEED, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)
        if is_auto_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_ECG_SPEED)
            self.browser.get_element(self.LCT.ELEMENT_AUTO_ECG_SPEED).is_displayed()
            self.browser.click(self.LCT.ELEMENT_AUTO_ECG_SPEED)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_AUTO_ECG_SPEED, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)

    def get_gain_edit_strip_config(self, is_device_events=False, is_auto_events=False):
        if is_device_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_ECG_GAIN)
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_ECG_GAIN).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_ECG_GAIN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_ECG_GAIN, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)
        if is_auto_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_ECG_GAIN)
            self.browser.get_element(self.LCT.ELEMENT_AUTO_ECG_GAIN).is_displayed()
            self.browser.click(self.LCT.ELEMENT_AUTO_ECG_GAIN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_AUTO_ECG_GAIN, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)

    def get_highpass_edit_strip_config(self, is_device_events=False, is_auto_events=False):
        if is_auto_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_HIGH_PASS)
            self.browser.get_element(self.LCT.ELEMENT_AUTO_HIGH_PASS).is_displayed()
            self.browser.click(self.LCT.ELEMENT_AUTO_HIGH_PASS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_AUTO_HIGH_PASS, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)
        if is_device_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_HIGH_PASS)
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_HIGH_PASS).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_HIGH_PASS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_HIGH_PASS, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)

    def get_lowpass_edit_strip_config(self,is_device_events=False, is_auto_events=False):
        if is_auto_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_LOW_PASS)
            self.browser.get_element(self.LCT.ELEMENT_AUTO_LOW_PASS).is_displayed()
            self.browser.click(self.LCT.ELEMENT_AUTO_LOW_PASS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_AUTO_LOW_PASS, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)
        if is_device_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_LOW_PASS)
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_LOW_PASS).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_LOW_PASS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_LOW_PASS, inverse=True)
            return self.browser.get_texts(self.LCT.ELEMENT_STRIPS_ECG_OPTION)

    def wait_edit_strip_auto_events_page_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_EVENTS_ECG_CHART) and self.browser.get_element(self.LCT.ELEMENT_AUTO_EVENTS_ECG_CHART).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_AUTO_EVENTS_ECG_CHART, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_edit_strip_device_events_page_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_ECG_CHART) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_ECG_CHART).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_ECG_CHART, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_value_strips_config(self):
        self.wait_edit_strip_device_events_page_available()
        output = {
            'Speed': self.browser.get_text(self.LCT.ELEMENT_STRIPS_ECG_SPEED + '//div[@class="value"]'),
            'Gain': self.browser.get_text(self.LCT.ELEMENT_STRIPS_ECG_GAIN + '//div[@class="value"]'),
            'High Pass': self.browser.get_text(self.LCT.ELEMENT_STRIPS_HIGH_PASS + '//div[@class="value"]'),
            'Low Pass': self.browser.get_text(self.LCT.ELEMENT_STRIPS_LOW_PASS + '//div[@class="value"]'),
        }
        return output

    def get_current_value_auto_event_config(self):
        self.wait_edit_strip_auto_events_page_available()
        output = {
            'Speed': self.browser.get_text(self.LCT.ELEMENT_AUTO_ECG_SPEED + '//div[@class="value"]'),
            'Gain': self.browser.get_text(self.LCT.ELEMENT_AUTO_ECG_GAIN + '//div[@class="value"]'),
            'High Pass': self.browser.get_text(self.LCT.ELEMENT_AUTO_HIGH_PASS + '//div[@class="value"]'),
            'Low Pass': self.browser.get_text(self.LCT.ELEMENT_AUTO_LOW_PASS + '//div[@class="value"]'),
        }
        return output

    def delete_events_strips_management(self,by_hotkey=False):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_DELETE)
        if by_hotkey:
            self.browser.action_by_keyword('D')
        else:
            self.browser.get_element(self.LCT.ELEMENT_STRIPS_DELETE).is_displayed()
            self.browser.click(self.LCT.ELEMENT_STRIPS_DELETE)


    def get_current_pagination_strips_management(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_PAGINATION) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_PAGINATION).is_displayed():
                output = dict()
                output['Page'] = self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_PAGINATION, 'value')
                return output
            elif time.time() - start_time > 1 * 60:
                break

    def edit_page_number_strip_management(self, page_number=None):
        if page_number:
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_PAGE)
            element_input = self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_PAGE)
            self.browser.click_by_offset(element_input, 20, 10)
            self.browser.input_text(self.LCT.ELEMENT_STRIPS_MANAGEMENT_PAGE, page_number)
            self.browser.click_by_offset(element_input, 50, 20)
            self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_PAGE, inverse=True)
            if 'error' in self.browser.get_attribute_value(self.LCT.ELEMENT_STRIPS_MANAGEMENT_PAGE, 'class'):
                return False
            else:
                return True

    def get_current_total_page_strip_management(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_TOTAL_PAGE)
        output = self.browser.get_text(self.LCT.ELEMENT_STRIPS_MANAGEMENT_TOTAL_PAGE)
        number_str = output.split('/')[1].strip()
        number = int(number_str)
        return number

    def pagination_strips_management(self, next_or_previous=None):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_NEXT)
                self.browser.js_click(self.LCT.ELEMENT_STRIPS_NEXT)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)
                break
            if next_or_previous == 'previous':
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_PREVIOUS)
                self.browser.js_click(self.LCT.ELEMENT_STRIPS_PREVIOUS)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)
                break

    @staticmethod
    def convert_datetime_to_timezone(input_data):
        # Extract the timestamp string
        timestamp_str = input_data
        # Remove the timezone part from the string
        timestamp_str_without_tz = timestamp_str[:-4].strip()
        # Define the format of the timestamp without timezone
        timestamp_format_without_tz = '%m/%d/%Y, %H:%M:%S'
        # Parse the timestamp string to a datetime object
        datetime_obj = datetime.strptime(timestamp_str_without_tz, timestamp_format_without_tz)
        # Create the output dictionary
        output = datetime_obj.strftime(timestamp_format_without_tz)
        return output

    def check_toolbar_ecg_viewer_strips_management_available(self):
        output = {
            'Speed': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT_SPEED) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_SPEED).get_attribute(
                'disabled') else True,
            'Gain': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT_GAIN) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_GAIN).get_attribute('disabled') else True,
            'High Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT_HIGH_PASS) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_HIGH_PASS).get_attribute(
                'disabled') else True,
            'Low Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT_LOW_PASS) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_LOW_PASS).get_attribute(
                'disabled') else True,
            'Show/Hide CH1': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT_SHOW_HIDE_CH1) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_SHOW_HIDE_CH1).get_attribute(
                'disabled') else True,
            'Show/Hide CH2': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT_SHOW_HIDE_CH2) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_SHOW_HIDE_CH2).get_attribute(
                'disabled') else True,
            'Show/Hide CH3': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ELEMENT_STRIPS_MANAGEMENT_SHOW_HIDE_CH3) and self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_SHOW_HIDE_CH3).get_attribute(
                'disabled') else True,
            'Capture': False if (self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CAPTURE) and
                                    self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_CAPTURE).get_attribute('disabled')) else True,
            'View All Strip': False if (self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_VIEW_ALL_STRIP) and
                                            self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_VIEW_ALL_STRIP).get_attribute('disabled')) else True,
            'Zoom In': False if (self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT_ZOOM_TOOL) and
                                    self.browser.get_element(self.LCT.ELEMENT_STRIPS_MANAGEMENT_ZOOM_TOOL).get_attribute('disabled')) else True,
        }
        self.logger.info(output)
        return output

    def get_total_number_events_strips_management(self):
        time.sleep(5)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)
        while True:
            if self.get_current_total_page_strip_management() == 1:
                elements = self.browser.get_elements(self.LCT.ELEMENT_STRIPS_MANAGEMENT)
                return len(elements)
            else:
                number_events_on_page = self.browser.get_elements(self.LCT.ELEMENT_STRIPS_MANAGEMENT)
                number_pages = self.get_current_total_page_strip_management()
                self.edit_page_number_strip_management(page_number=number_pages)
                last_number_event = self.browser.get_elements(self.LCT.ELEMENT_STRIPS_MANAGEMENT)
                total_events = ((number_pages - 1) * len(number_events_on_page)) + len(last_number_event)
                return total_events

    def input_technician_title(self, title=None):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_BOX_TECHNICIAN_TITLE)
        self.browser.input_text(self.LCT.ELEMENT_STRIPS_BOX_TECHNICIAN_TITLE, title)
        self.browser.click(self.LCT.ELEMENT_SAVE_TECHNICIAN_COMMENT_BUTTON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)

    def input_technician_comment(self, comment=None):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_STRIPS_BOX_TECHNICIAN_COMMENT)
        self.browser.input_text(self.LCT.ELEMENT_STRIPS_BOX_TECHNICIAN_COMMENT, comment)
        self.browser.click(self.LCT.ELEMENT_SAVE_TECHNICIAN_COMMENT_BUTTON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ELEMENT_STRIPS_MANAGEMENT, inverse=True)
