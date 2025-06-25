#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from corelib import Utils
    from project_bioflux_callcenter_portal.config.web_locators import study_management as locators
    from selenium.webdriver import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class StudyManagement(WebPage):
    """
    Handle study management page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def wait_until_study_overview_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.OVV_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.OVV_CONTENT)

    def navigate_to_study_management_type(self, tab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS) and self.browser.get_elements(self.LCT.TABS)[0].is_displayed():
                self.browser.click_by_offset(self.LCT.HEADER_CONTENT, 10, 10)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS, inverse=True)
                self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_study_management_type(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        tabs = self.browser.get_elements(self.LCT.TABS + '/a')
        for tab in tabs:
            if 'active' in self.browser.get_attribute_value(tab, 'class'):
                return self.browser.get_text(tab)

    def get_study_overview(self):
        self.wait_until_study_overview_available()
        header = self.browser.get_texts(self.LCT.OVV_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.OVV_CONTENT, row=1)

    def get_study_ecg(self):
        self.wait_until_study_overview_available()
        self.browser.click(self.LCT.MOREICON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MORE_OPTIONS)
        self.browser.clicks(self.LCT.MORE_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == 'get ecg', stop_on_first=True)

    def generate_event_data(self):
        self.wait_until_study_overview_available()
        self.browser.click(self.LCT.MOREICON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MORE_OPTIONS)
        self.browser.clicks(self.LCT.MORE_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == 'generate event data',
                            stop_on_first=True)

    def view_study_patient_details(self):
        self.wait_until_study_overview_available()
        self.browser.click(self.LCT.OVV_CONTENT + '[2]')

    def view_study_facility_information(self):
        self.wait_until_study_overview_available()
        self.browser.click(self.LCT.OVV_CONTENT + '[3]')

    def back_from_study_management(self):
        self.wait_until_study_overview_available()
        self.browser.click(self.LCT.BACKICON)
        self.browser.wait_visibility_of_element_located(self.LCT.BACKICON, inverse=True)

    # Studies details

    def wait_until_study_details_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_CONTENT_ROOT)

    def get_study_details(self):
        self.wait_until_study_details_available()
        root_output = self.browser.get_texts(self.LCT.STDET_CONTENT_ROOT)
        root_output = {v.split('\n')[0]: v.split('\n')[1:] for v in root_output}
        output = dict()

        study_info = root_output['STUDY INFORMATION']
        study_info.pop(2) if self.browser.wait_visibility_of_element_located(
            self.LCT.STDET_CONTENT_ZIPFILE) and 'Zip file' in study_info else study_info
        # Reformat artifact if contains Flag
        if self.browser.wait_visibility_of_element_located(self.LCT.STDET_CONTENT_ARTIFACTTEXT):
            artifact_tag = study_info.pop(-1)  # pop and assign artifact tag
            output['STUDY INFORMATION'] = {study_info[i]: study_info[i + 1] for i in range(0, len(study_info), 2)}
            output['STUDY INFORMATION'].update({'Artifact Tag': artifact_tag})  # Add tag into list
        else:
            output['STUDY INFORMATION'] = {study_info[i]: study_info[i + 1] for i in range(0, len(study_info), 2)}
        study_setting = root_output['STUDY SETTINGS']
        output['STUDY SETTINGS'] = {study_setting[i]: study_setting[i + 1] for i in range(0, len(study_setting), 2)}
        ref_phy = root_output['REFERRING PHYSICIAN']
        output['REFERRING PHYSICIAN'] = {ref_phy[i]: ref_phy[i + 1] for i in range(0, len(ref_phy), 2)}
        inter_phy = root_output['INTERPRETING PHYSICIAN']
        output['INTERPRETING PHYSICIAN'] = {inter_phy[i]: inter_phy[i + 1] for i in range(0, len(inter_phy), 2)}

        output['STUDY LOGS'] = self.browser.get_text(self.LCT.STDET_CONTENT_STUDYLOGS)
        output['STUDY NOTES'] = self.browser.get_text(self.LCT.STDET_CONTENT_STUDYNOTES)
        output['STUDY HISTORY'] = self.browser.get_text(self.LCT.STDET_CONTENT_STUDYHISTORY)
        output['DEVICE NOTIFICATION HISTORY'] = self.browser.get_text(self.LCT.STDET_CONTENT_DEVICENOTIHISTORY)
        return output

    def edit_study_details_study_information(self, ):
        pass

    def add_study_details_study_log(self, log):
        if log:
            self.browser.input_text(self.LCT.STDET_CONTENT_STUDYLOGS, log)
        self.browser.click(self.LCT.STDET_CONTENT_STUDYLOGS_SAVE)
        self.wait_until_study_details_available()

    def add_study_details_study_notes(self, notes):
        self.browser.click(self.LCT.STDET_CONTENT_STUDYNOTES_ADD)
        self.browser.wait_visibility_of_element_located(self.LCT.STDET_CONTENT_STUDYNOTES_INPUT)
        if notes:
            self.browser.input_text(self.LCT.STDET_CONTENT_STUDYNOTES_INPUT, notes)
            self.browser.click(self.LCT.STDET_CONTENT_STUDYLOGS_SAVE)
        self.wait_until_study_details_available()

    # Reports

    def wait_until_reports_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTS_DATA_CONTENT) and self.browser.get_elements(self.LCT.REPORTS_DATA_CONTENT)[0].is_displayed():
                # self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTS_DATA_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def create_interim_report_pdf_step(self):
        pass

    def create_interim_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.REPORTS_CREATERP)
        self.browser.click(self.LCT.REPORTS_CREATERP)
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_STARTDATE, inverse=True)
        self.browser.click(self.LCT.INTERIM_STARTDATE)
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DATE_START, inverse=True)
        self.browser.click(self.LCT.INTERIM_DATE_START)
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DATE_END, inverse=True)
        self.browser.click(self.LCT.INTERIM_DATE_END)
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_LOADDATAICON, inverse=True)
        self.browser.click(self.LCT.INTERIM_LOADDATAICON)
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_LOADDATAICON, inverse=True)
        self.browser.click(self.LCT.INTERIM_SAVEREPORT)
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_LOADDATAICON, inverse=True)

    def get_datetime_interim_or_eou_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DATE_TIME_START)
        start_time = self.browser.get_attribute_value(self.LCT.INTERIM_DATE_TIME_START, 'value')
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DATE_TIME_END)
        end_time = self.browser.get_attribute_value(self.LCT.INTERIM_DATE_TIME_END, 'value')
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DATE_TIME_END, inverse=True)
        return start_time + ' - ' + end_time

    def create_end_of_use_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_LOADDATAICON, inverse=True)
        self.browser.click(self.LCT.INTERIM_LOADDATAICON)
        self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_LOADDATAICON, inverse=True)
        self.browser.click(self.LCT.INTERIM_SAVEREPORT)

    def edit_end_of_use_report(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTS_TYPE)
        elements = self.browser.get_elements(self.LCT.REPORTS_TYPE)
        filter_element = []
        for element in elements:
            if self.browser.get_text(element) == 'End Of Use':
                self.browser.hover_to(element)
                filter_element.append(element)
            else:
                self.logger.info(f'`text value not match')
        self.browser.hover_to(filter_element[0])
        self.browser.wait_visibility_of_element_located(self.LCT.REPORTS_EDIT_EOU, inverse=True)
        self.browser.click(self.browser.get_elements(self.LCT.REPORTS_EDIT_EOU)[0])

    def edit_interim_report_on(self):
        pass

    def filter_study_reports(self, by_report=None, text_search=None):
        if by_report:
            self.browser.click(self.LCT.REPORTS_BYTYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTS_BYTYPE_OPTIONS)
            self.browser.clicks(self.LCT.REPORTS_BYTYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_report.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.input_text(self.LCT.REPORTS_TEXTSEARCH, text_search)
        self.wait_until_reports_available()
        time.sleep(3)

    def get_study_reports(self, row=None):
        self.wait_until_reports_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.REPORTS_DATA_CONTENT_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.REPORTS_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.REPORTS_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if self.browser.wait_visibility_of_element_located(self.LCT.REPORTS_STUDY_NEXT) and self.browser.get_element(self.LCT.REPORTS_STUDY_NEXT).is_displayed():
                    self.browser.js_click(self.LCT.REPORTS_STUDY_NEXT)
                else:
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_until_reports_available()
            else:
                self.wait_until_reports_available()
                header = self.browser.get_texts(self.LCT.REPORTS_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.REPORTS_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_until_reports_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_study_reports()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def edit_report_on(self, **on):
        self.wait_until_reports_available()
        _index = self._on_reports_item(**on)
        self.browser.hover_to_by_index(self.LCT.REPORTS_DATA_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.REPORTS_DATA_CONTENT_EDITICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_reports_on(self, **on):
        self.wait_until_reports_available()
        _index = self._on_reports_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTS_DATA_CONTENT_ROW)
        self.browser.hover_to_by_index(self.LCT.REPORTS_DATA_CONTENT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTS_VIEW_ICON)
        self.browser.hover_to_by_index(self.LCT.REPORTS_VIEW_ICON, _index)
        self.browser.wait_visibility_of_element_located(self.LCT.REPORTS_TEXT_VIEW, inverse=True)
        view = self.browser.get_text(self.LCT.REPORTS_TEXT_VIEW)
        self.browser.clicks(self.LCT.REPORTS_VIEW_ICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        return view

    def sort_study_reports(self, field, asc_or_desc):
        header_index = {
            'report id': 0,
            'status': 2,
            'type': 3,
            'last modified': 4,
            'assignee': 5
        }
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.REPORTS_DATA_HEADER)[header_index[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)

    # Events

    def wait_until_study_events_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_CONTENT_ROOT) and self.browser.get_elements(self.LCT.STDET_CONTENT_ROOT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_CONTENT_ROOT, inverse=True)
                break
            elif time.time() - start_time > 3 * 60:
                break

    def filter_study_events(self, by_status=None, by_validity=None, by_type=None, text_search=None, advance_filter=None,
                            sort_by=None):
        self.browser.wait_invisibility_of_element_located('class:react-loading-skeleton')
        if by_status:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_CURRENTSTATUS)
            self.browser.click(self.LCT.EVENTS_CURRENTSTATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENTS_STATUS_OPTIONS)
            self.browser.clicks(self.LCT.EVENTS_STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_status.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_CURRENTSTATUS, inverse=True)
        if by_validity:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_CURRENTVALITITY, inverse=True)
            self.browser.click(self.LCT.EVENTS_CURRENTVALITITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENTS_VALITITY_OPTIONS)
            self.browser.clicks(self.LCT.EVENTS_VALITITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_validity.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_CURRENTVALITITY, inverse=True)
        if by_type:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_CURRENTTYPE)
            self.browser.click(self.LCT.EVENTS_CURRENTTYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENTS_TYPE_OPTIONS, inverse=True)
            self.browser.clicks(self.LCT.EVENTS_TYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_type.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_CURRENTTYPE, inverse=True)
        if text_search is not None:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_TEXTSEARCH)
            self.browser.click(self.LCT.EVENTS_TEXTSEARCH, text_search)
            self.browser.input_text(self.LCT.EVENTS_TEXTSEARCH, text_search)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENTS_TEXTSEARCH, inverse=True)
        if advance_filter:
            self.advance_filter_study_events(**advance_filter)  # dictionary
        if sort_by:
            self.sort_study_events(sort_by)
        self.wait_until_study_events_available()

    def sort_study_events(self, asc_or_desc):
        is_asc = 'hdGggZD0iTTIgMTMuNUwxNiAxMy41TTUgOS4wODUzN0wxMyA5LjA4NTM3TTcgNC41TDExIDQ'
        for _ in range(2):
            if asc_or_desc.lower() not in ('asc', 'desc'):
                raise Exception(f'Invalid key `{asc_or_desc}`')
            if asc_or_desc.lower() == 'asc':
                self.browser.clicks(self.LCT.EVENTS_SORTICON,
                                    on_elements=lambda _, e: is_asc not in self.browser.get_attribute_value(
                                        e, 'src'), stop_on_first=True)
            else:
                self.browser.clicks(self.LCT.EVENTS_SORTICON,
                                    on_elements=lambda _, e: is_asc in self.browser.get_attribute_value(e, 'src'),
                                    stop_on_first=True)

    def advance_filter_study_events(self, from_date=None, from_time=None, to_date=None, to_time=None,
                                    by_availability=None, is_reset=False, is_filter=True):
        self.browser.click(self.LCT.EVENTS_ADVANCED_FILTER)
        if from_date:
            self.browser.remove_attribute(self.LCT.EVENTS_ADVANCED_FILTER_STARTDATE, 'readonly')
            self.browser.input_text(self.LCT.EVENTS_ADVANCED_FILTER_STARTDATE, from_date)
            self.browser.get_element(self.LCT.EVENTS_ADVANCED_FILTER_STARTDATE).send_keys(Keys.ENTER)
        if from_time:
            self.browser.remove_attribute(self.LCT.EVENTS_ADVANCED_FILTER_STARTTIME, 'readonly')
            self.browser.input_text(self.LCT.EVENTS_ADVANCED_FILTER_STARTTIME, from_date)
            self.browser.get_element(self.LCT.EVENTS_ADVANCED_FILTER_STARTTIME).send_keys(Keys.ENTER)
        if to_date:
            self.browser.remove_attribute(self.LCT.EVENTS_ADVANCED_FILTER_ENDDATE, 'readonly')
            self.browser.input_text(self.LCT.EVENTS_ADVANCED_FILTER_ENDDATE, from_date)
            self.browser.get_element(self.LCT.EVENTS_ADVANCED_FILTER_ENDDATE).send_keys(Keys.ENTER)

        if to_time:
            self.browser.remove_attribute(self.LCT.EVENTS_ADVANCED_FILTER_ENDTIME, 'readonly')
            self.browser.input_text(self.LCT.EVENTS_ADVANCED_FILTER_ENDTIME, from_date)
            self.browser.get_element(self.LCT.EVENTS_ADVANCED_FILTER_ENDTIME).send_keys(Keys.ENTER)
        if by_availability:
            self.browser.click(self.LCT.EVENTS_ADVANCED_FILTER_AVAILABILITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENTS_ADVANCED_FILTER_AVAILABILITY_OPTIONS)
            self.browser.clicks(self.LCT.EVENTS_ADVANCED_FILTER_AVAILABILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_availability.lower(),
                                stop_on_first=True)
        if is_reset:
            self.browser.click(self.LCT.EVENTS_ADVANCED_FILTER_RESET)
        if is_filter:
            self.browser.click(self.LCT.EVENTS_ADVANCED_FILTER_FILTER)
            self.wait_until_study_events_available()

    def get_study_events(self):
        self.wait_until_study_events_available()
        output = list()
        elements = self.browser.get_elements(self.LCT.EVENT_CONTENT_ROOT)
        if not elements:
            return output
        for root_elem in elements:
            header = self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_HEADER1ST))
            header += self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_HEADER2ST))
            # study ID
            content = [self.browser.get_text(self.browser.get_child_element(root_elem, self.LCT.EVENT_CONTENT1ST))]
            # Event Type and trigger time
            content += self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_CONTENT2ST))
            # Symptom and comment
            content += self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_CONTENT3ST))
            # event = Utils.group_tabular_data(header, content, row=1)
            output.append(Utils.group_tabular_data(header, content, row=1))
        # Event type, event validity, event status, event strip -> TBD
        return output

    def get_study_events_process_later(self):
        output = list()
        elements = self.browser.get_elements(self.LCT.EVENT_CONTENT_ROOT)
        if not elements:
            return output
        for root_elem in elements:
            header = self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_HEADER1ST))
            header += self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_HEADER2ST))
            # study ID
            content = [self.browser.get_text(self.browser.get_child_element(root_elem, self.LCT.EVENT_CONTENT1ST))]
            # Event Type and trigger time
            content += self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_CONTENT2ST))
            # Symptom and comment
            content += self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.EVENT_CONTENT3ST))
            # event = Utils.group_tabular_data(header, content, row=1)
            output.append(Utils.group_tabular_data(header, content, row=1))
        # Event type, event validity, event status, event strip -> TBD
        return output

    def _on_study_event_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        events = self.get_study_events()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(events):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such study events exist under `{_on}`.')

    def view_study_event_information_on(self, **on):
        self.wait_until_study_events_available()
        _index = self._on_study_event_item(**on)
        self.browser.clicks(self.LCT.EVENT_CONTENT1ST, on_elements=lambda i, _: i == _index, stop_on_first=True)
        self.browser.switch_tab()

    def edit_study_event_on(self, **on):
        self.wait_until_study_events_available()
        _index = self._on_study_event_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_EDIT, inverse=True)
        self.browser.clicks(self.LCT.EVENT_EDIT, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def bookmark_event_on(self, **on):  # bookmark multiple events -> TBD
        self.wait_until_study_events_available()
        _index = self._on_study_event_item(**on)
        is_bookmark = 'aWxsPSIjMEQ5RTkyIiBzdHJva2U9IiMwRDlFOTIiIHN0cm9rZS13'  # is_bookmark
        [self.browser.click(elem) for i, elem in enumerate(self.browser.get_elements(
            self.LCT.EVENT_BOOKMARK)) if _index == i and is_bookmark not in self.browser.get_attribute_value(elem, 'src')]

    def unbookmark_event_on(self, **on):  # bookmark multiple events -> TBD
        self.wait_until_study_events_available()
        _index = self._on_study_event_item(**on)
        is_bookmark = 'MTVMMSAyMUwxIDFaIiBzdHJva2U9IiM0QjVCNzMiIHN0cm9rZS13'  # un_bookmark
        [self.browser.click(elem) for i, elem in enumerate(self.browser.get_elements(
            self.LCT.EVENT_BOOKMARK)) if _index == i and is_bookmark not in self.browser.get_attribute_value(elem, 'src')]

    def mark_artifact_ready_interim_report(self, is_mark=False, is_unmark=False):
        if is_mark:
            self.browser.hover_to(self.LCT.INTERIM_MARKASARTIFACT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_MARKASARTIFACT, inverse=True)
            if self.browser.get_text(self.LCT.INTERIM_MARKASARTIFACT_TEXT) == 'Mark report as artifact':
                if self.browser.get_text(self.LCT.INTERIM_MARKASARTIFACT_TEXT) == 'Mark report as artifact':
                    self.browser.click(self.LCT.INTERIM_MARKASARTIFACT)
                    self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_MARKASARTIFACT_YES, inverse=True)
                    self.browser.click(self.LCT.INTERIM_MARKASARTIFACT_YES)
                    self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_MARKASARTIFACT, inverse=True)
                else:
                    return self
        if is_unmark:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_MARKASARTIFACT)
            self.browser.click(self.LCT.INTERIM_MARKASARTIFACT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_MARKASARTIFACT, inverse=True)

    def toggle_events(self):
        pass

    def get_study_event_information(self):
        pass

    def check_active_create_interim_available(self):
        self.wait_until_reports_available()
        self.browser.wait_visibility_of_element_located(self.LCT.REPORTS_CREATERP)
        return False if 'disabled' in self.browser.get_attribute_value(self.LCT.REPORTS_CREATERP, 'class') else True

    # def get_study_reports_by_status(self, report_status=None):
    #     self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTS_DATA_CONTENT_ROW, inverse=True)
    #     elements = self.browser.get_elements(self.LCT.REPORTS_DATA_CONTENT_ROW)
    #     elements_report_status = self.browser.get_elements(self.LCT.REPORTS_STATUS)
    #     filtered_elements = []
    #     for element in elements:
    #         for element_status in elements_report_status:
    #             if self.browser.get_text(element_status) == 'Generated':
    #                 filtered_elements.append(element)
    #     return filtered_elements
