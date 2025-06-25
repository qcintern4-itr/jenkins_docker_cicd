#!/usr/bin/env python3
import logging
import time
from operator import index

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import inbox as locators
    from corelib import Utils
    from corelib import WebHandler
    from selenium.webdriver import Keys
    from datetime import datetime, timedelta

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Inbox(WebPage):
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_inbox(self):
        self.browser.open_page(self.URL + '/inbox')

    def navigate_to_report_type(self, report_type):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.OVERVIEW_REPORTS) and self.browser.get_elements(self.LCT.OVERVIEW_REPORTS)[0].is_displayed():
                self.browser.clicks(self.LCT.OVERVIEW_REPORTS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == report_type.lower(),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.OVERVIEW_REPORTS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def check_report_items_are_available(self, items):
        self.wait_inbox_items_available()
        map_items = {
            'report types': self.browser.wait_visibility_of_all_elements_located(self.LCT.OVERVIEW_REPORTS),
            'facility': self.browser.wait_visibility_of_element_located(self.LCT.CURRENTFACILITY),
            'sort': self.browser.wait_visibility_of_element_located(self.LCT.SORT_ICON),
            'search by': self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_ICON),
            'inbox items': self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE),
            'search bar': self.browser.wait_visibility_of_element_located(
                self.LCT.SEARCH_INPUT_PHYSICIAN) if self._current_search_by() == 'Physician'
            else self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_ELEMENT),
        }
        # Priority
        if self.get_current_report_type().lower() != 'instant reports':
            map_items['priority'] = self.browser.wait_visibility_of_element_located(self.LCT.PRIORITY_CURRENT)
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        output = dict()
        for item in _items:
            if item.lower() not in map_items:
                raise Exception(f'No such item on {item}.')
            output.update({
                item: map_items[item.lower()]
            })
        return output

    def wait_inbox_items_available(self):
        """
        Wait until all report items available
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE) and self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)[0].is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.All_REPORT_DATA_SAMPLE, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_report_detail_available(self):
        """
        Wait until report detail available
        :return: None
        """
        if self.browser.wait_visibility_of_element_located('class:modal-content', timeout=10):
            self.browser.click('xpath://div[@class="modal-content"]//span[text()="OK"]')
        self.browser.wait_visibility_of_all_elements_located('class:title-block')
        self.browser.wait_visibility_of_element_located('id:pdf-viewer')

    def get_current_report_type(self):
        """
        Get current selection on inbox report type and the number of unread reports
        :return: (str) current report type and the number of unread reports
        """
        self.browser.wait_visibility_of_element_located(self.LCT.CURRENT_REPORT_TYPE)
        return self.browser.get_text(self.LCT.CURRENT_REPORT_TYPE).replace('\n', ' | ')

    def get_inbox_overview(self, to_dict=True):
        """
        Get overview of all reports in inbox menu
        :param to_dict: (bool) True to return a dict, False to return a list of texts
        :return: (dict or list) report titles with their badge
        """
        _reports = self.browser.get_texts(self.LCT.OVERVIEW_REPORTS)
        if to_dict:
            return {text.split('\n')[0]: text.split('\n')[1] if '\n' in text else None
                    for text in _reports}
        return [text.replace('\n', ' ') for text in _reports]

    def get_current_pagination(self):
        """
        Get current info of inbox pagination
        :return: (str)
        """
        return self.browser.get_text(
            self.browser.get_elements_by_condition(self.LCT.CURRENT_PAGE, on_elements=lambda _, e: e.is_displayed(),
                                                   stop_on_first=True)[0]
        )

    def filter_inbox(self, report_type=None, search_by=None, text_search=None,
                     priority=None, sort_inbox=None, status_report=None):
        """
        Filter Inbox report type
        :param report_type: (str) report type
        :param search_by: (str) patient name / patient id / study id / physician, None: don't care
        :param text_search: (str) text search, None: don't care
        :param sort_inbox: (str) click sort asc or desc (valid keys asc or desc)
        :param priority: (str) priority, None: don't care
        :param status_report: (str) status_report, None: don't care
        :return:
        """
        if report_type:
            self.wait_inbox_items_available()
            self.navigate_to_report_type(report_type)
        if status_report:
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_STATUS)
            self.browser.click(self.LCT.SEARCHBY_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_STATUS_OPTION)
            for option in self.browser.get_elements(self.LCT.SEARCHBY_STATUS_OPTION):
                if 'checked' not in self.browser.get_attribute_value(option, 'class'):
                    output = self.browser.get_text(option)
                    if output.lower() == status_report.lower():
                        self.browser.click(option)
                        self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_STATUS, inverse=True)
                        self.browser.click(self.LCT.SEARCHBY_STATUS)
                        self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_STATUS, inverse=True)
                    return output
                elif 'checked' in self.browser.get_attribute_value(option, 'class'):
                    self.browser.click(self.LCT.SEARCHBY_STATUS)
                    self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_STATUS, inverse=True)
                    break
        if search_by:
            self.logger.info(f'Search by: {search_by}')
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_ELEMENT)
            self.browser.click(self.LCT.SEARCHBY_ELEMENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_ELEMENT, inverse=True)
        if text_search is not None:
            self.logger.info(f'Text search: {text_search}')
            if search_by.lower() != 'physician':
                self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT)
                self.browser.input_text(self.LCT.SEARCH_INPUT, str(text_search))
            elif report_type.lower() in ['recent reports', 'all reports', 'end of use reports', 'interim reports', 'notification reports']:
                self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT_PHYSICIAN)
                self.browser.click(self.LCT.SEARCH_INPUT_PHYSICIAN)
                self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_PHYSICIAN_DROPDOWN)
                while True:
                    self.browser.hover_to(self.browser.get_elements(self.LCT.SEARCH_PHYSICIAN_DROPDOWN)[0])
                    self.browser.scroll_dropdown_menu()
                    if self.browser.get_element(self.LCT.SEARCH_PHYSICIAN_DROPDOWN):
                        self.browser.clicks(self.LCT.SEARCH_PHYSICIAN_DROPDOWN,
                                            on_elements=lambda _, e: self.browser.get_text(e).lower() == text_search.lower(),
                                            stop_on_first=True)
                        break

            else:
                self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT_INSTANT_PHYSICIAN)
                self.browser.click(self.LCT.SEARCH_INPUT_INSTANT_PHYSICIAN)
                self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_PHYSICIAN_DROPDOWN)
                self.browser.clicks(self.LCT.SEARCH_PHYSICIAN_DROPDOWN,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == text_search.lower(),
                                    stop_on_first=True)
        if priority:
            self.logger.info(f'Priority: {priority}')
            self.browser.wait_visibility_of_element_located(self.LCT.PRIORITY_CURRENT)
            self.browser.click(self.LCT.PRIORITY_CURRENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRIORITY_OPTIONS)
            self.browser.clicks(self.LCT.PRIORITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == priority.lower(),
                                stop_on_first=True)
        if sort_inbox:
            src_asc = 'Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTIgMTMuNUwxNiAxM'
            src_desc = 'Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTIgNC41TDE2IDQuN'
            self.logger.info('Toggle the sort')
            if sort_inbox.lower() == 'asc':
                self.browser.clicks(self.LCT.SORT_ICON,
                                    on_elements=lambda _, e: src_asc not in self.browser.get_attribute_value(e, 'src'),
                                    stop_on_first=True)
            elif sort_inbox.lower() == 'desc':
                self.browser.clicks(self.LCT.SORT_ICON,
                                    on_elements=lambda _, e: src_desc not in self.browser.get_attribute_value(e, 'src'),
                                    stop_on_first=True)
            else:
                raise Exception(f'Invalid key `{sort_inbox}`.')
        self.wait_inbox_items_available()

    def clear_inbox_text_search(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT_CLEARTEXT):
            return self.browser.click(self.LCT.SEARCH_INPUT_CLEARTEXT)
        else:
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT_CLEARTEXT_PHYSICIAN)
            self.browser.hover_to(self.LCT.SEARCH_INPUT_CLEARTEXT_PHYSICIAN)
            return self.browser.click(self.LCT.SEARCH_INPUT_CLEARTEXT_PHYSICIAN)

    def _current_search_by(self):
        self.browser.click(self.LCT.SEARCHBY_ELEMENT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
        for option in self.browser.get_elements(self.LCT.SEARCHBY_OPTIONS):
            if '--active' in self.browser.get_attribute_value(option, 'class'):
                output = self.browser.get_text(option)
                self.browser.click(option)  # handle in case of search_by popup is not closed
                return output

    def get_inbox_current_filter(self):
        output = {
            'Facility': self.browser.get_text(self.LCT.CURRENTFACILITY),
            'Report Type': self.get_current_report_type(),
            'Pagination': self.get_current_pagination() if self.browser.wait_visibility_of_element_located(
                self.LCT.CURRENT_PAGE) else None,
            'Search By': self.browser.get_attribute_value(self.LCT.SEARCH_INPUT_NONPHYSICIAN, 'title').replace(
                'by ', '') if self.browser.wait_visibility_of_element_located(
                self.LCT.SEARCH_INPUT_NONPHYSICIAN) else 'Physician',
        }
        # Priority
        if self.get_current_report_type().lower() != 'instant reports':
            output['Priority'] = self.browser.get_text(self.LCT.PRIORITY_CURRENT)
        if self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT):
            output['Text Search'] = self.browser.get_attribute_value(
                self.LCT.SEARCH_INPUT, 'value') if self.browser.get_attribute_value(
                self.LCT.SEARCH_INPUT,
                'value') != '' else None
        if self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT_PHYSICIAN):
            output['Text Search'] = self.browser.get_text(self.LCT.SEARCH_INPUT_PHYSICIAN)
            if self.browser.get_text(self.LCT.SEARCH_INPUT_PHYSICIAN) == 'Search...':
                output['Text Search'] = None
        return output

    def get_inbox_filter_options(self):
        output = dict()
        # report types
        self.browser.wait_visibility_of_all_elements_located(self.LCT.OVERVIEW_REPORTS)
        output['Report Types'] = [label.replace('\n', ' | ') for label in self.browser.get_texts(
            self.LCT.OVERVIEW_REPORTS)]
        # facility
        self.browser.click(self.LCT.CURRENTFACILITY)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_SELECTIONS)
        output['Facility'] = self.browser.get_texts(self.LCT.FACILITY_SELECTIONS)
        # Handle in case dropdown is not closed
        self.browser.clicks(self.LCT.FACILITY_SELECTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == self.browser.get_text(
                                self.LCT.CURRENTFACILITY).lower(), stop_on_first=True)
        # priority not applied for instance reports
        if self.get_current_report_type().lower() != 'instant reports':
            self.browser.click(self.LCT.PRIORITY_CURRENT + '/..')
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRIORITY_OPTIONS)
            output['Priority'] = self.browser.get_texts(self.LCT.PRIORITY_OPTIONS)
            # Handle in case dropdown is not closed
            self.browser.clicks(self.LCT.PRIORITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == self.browser.get_text(
                                    self.LCT.PRIORITY_CURRENT).lower(), stop_on_first=True)
        # search_by
        self.browser.click(self.LCT.SEARCHBY_ELEMENT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
        output['Search By'] = self.browser.get_texts(self.LCT.SEARCHBY_OPTIONS)
        self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                            on_elements=lambda _, e: '-active' in self.browser.get_attribute_value(e, 'class').lower(),
                            stop_on_first=True)  # Handle in case dropdown is not closed
        # text search
        output['Text Search'] = self.browser.get_attribute_value(self.LCT.SEARCH_INPUT, 'value')
        return output

    def go_next_page(self, is_wait=True):
        """
        Click on next page
        :param is_wait: (bool) post-wait for all report items loaded
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.All_REPORT_DATA_SAMPLE)
        self.browser.click(self.browser.get_elements_by_condition(self.LCT.GO_NEXT_PAGE,
                           on_elements=lambda _, e: e.is_displayed(), stop_on_first=True)[0])
        self.browser.wait_visibility_of_element_located(self.LCT.All_REPORT_DATA_SAMPLE, inverse=True)
        if is_wait:
            self.wait_inbox_items_available()

    def go_previous_page(self, is_wait=True):
        """
        Click on previous page
        :param is_wait: (bool) post-wait for all report items loaded
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.GO_PREVIOUS_PAGE, inverse=True)
        self.browser.click(
            self.browser.get_elements_by_condition(self.LCT.GO_PREVIOUS_PAGE,
                                                   on_elements=lambda _, e: e.is_displayed(), stop_on_first=True)[0]
        )
        self.browser.wait_visibility_of_element_located(self.LCT.GO_PREVIOUS_PAGE, inverse=True)
        if is_wait:
            self.wait_inbox_items_available()

    def get_all_reports_on_page(self):
        """
        Get inbox all reports displayed on current page
        :return:
        """
        self.wait_inbox_items_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE, inverse=True)
            if len(self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)) == 10:
                root_elements = self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)
                for root_element in root_elements:
                    output_1.append({
                        'Patient Name': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTNAME)),
                        'Study ID': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYID)).split()[-1].strip(),
                        'Patient ID': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTID)),
                        'Physician': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PHYSICIAN)),
                        'Time': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_TIME)),
                        'Study Type': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYTYPE)),
                        'Comments': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_COMMENTS)),
                        'Updated': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_UPDATED)),
                        'Is New': '--new' in self.browser.get_attribute_value(root_element, 'class'),
                        'Facility': self.browser.get_text(
                            self.browser.get_child_element(root_element,
                                                           self.LCT.REPORT_FACILITY)) if self.browser.get_child_element(
                            root_element, self.LCT.REPORT_FACILITY) else None
                    })
                    # Get priority
                    if self.get_current_report_type().lower() != 'instant reports':
                        output_1[-1]['Priority'] = self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PRIORITY))

                    # Get report_type
                    if self.browser.get_text(self.LCT.INBOX_REPORT_TYPE).lower() in ('recent reports', 'all reports'):
                        output_1[-1]['Report Type'] = self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_TYPE))
                    # Get artifact and reviewed
                    wrap_artifact_review_element = self.browser.get_child_element(root_element, self.LCT.ARTIFACT_REVIEW)
                    values = [self.browser.get_attribute_value(element, 'alt')
                              for element in self.browser.get_child_elements(wrap_artifact_review_element, 'xpath:.//img')]
                    # if 'Error mark icon' in values:
                    output_1[-1]['Artifact'] = True if 'Artifact Icon' in values else False
                    # if 'Review checkmark icon' in values:
                    output_1[-1]['Reviewed'] = True if 'Check Circle Icon' in values else False
                if self.browser.wait_visibility_of_element_located(self.LCT.GO_NEXT_PAGE) and self.browser.get_element(self.LCT.GO_NEXT_PAGE).get_attribute('disabled'):
                    return output_1
                self.browser.click(self.LCT.GO_NEXT_PAGE)
                self.browser.wait_visibility_of_element_located(self.LCT.GO_NEXT_PAGE)
            else:
                self.wait_inbox_items_available()
                root_elements = self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)
                for root_element in root_elements:
                    output_2.append({
                        'Patient Name': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTNAME)),
                        'Study ID': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYID)).split()[-1].strip(),
                        'Patient ID': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTID)),
                        'Physician': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PHYSICIAN)),
                        'Time': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_TIME)),
                        'Study Type': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYTYPE)),
                        'Comments': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_COMMENTS)),
                        'Updated': self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_UPDATED)),
                        'Is New': '--new' in self.browser.get_attribute_value(root_element, 'class'),
                        'Facility': self.browser.get_text(
                            self.browser.get_child_element(root_element,
                                                           self.LCT.REPORT_FACILITY)) if self.browser.get_child_element(
                            root_element, self.LCT.REPORT_FACILITY) else None
                    })
                    # Get priority
                    if self.get_current_report_type().lower() != 'instant reports':
                        output_2[-1]['Priority'] = self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_PRIORITY))

                    # Get report_type
                    if self.browser.get_text(self.LCT.INBOX_REPORT_TYPE).lower() in ('recent reports', 'all reports'):
                        output_2[-1]['Report Type'] = self.browser.get_text(
                            self.browser.get_child_element(root_element, self.LCT.REPORT_TYPE))
                    # Get artifact and reviewed
                    wrap_artifact_review_element = self.browser.get_child_element(root_element, self.LCT.ARTIFACT_REVIEW)
                    values = [self.browser.get_attribute_value(element, 'alt')
                              for element in self.browser.get_child_elements(wrap_artifact_review_element, 'xpath:.//img')]
                    # if 'Error mark icon' in values:
                    output_2[-1]['Artifact'] = True if 'Artifact Icon' in values else False
                    # if 'Review checkmark icon' in values:
                    output_2[-1]['Reviewed'] = True if 'Check Circle Icon' in values else False
                output_all = output_1 + output_2
                self.logger.info(output_all)
                return output_all

    def get_reports_on_page(self):
        """
        Get inbox all reports displayed on current page
        :return:
        """
        self.wait_inbox_items_available()
        output = []
        root_elements = self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)
        if not root_elements:
            return output
        for root_element in root_elements:
            output.append({
                'Patient Name': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTNAME)),
                'Study ID': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYID)).split()[-1].strip(),
                'Patient ID': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTID)),
                'Physician': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PHYSICIAN)),
                'Time': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_TIME)),
                'Study Type': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYTYPE)),
                'Comments': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_COMMENTS)),
                'Updated': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_UPDATED)),
                'Is New': '--new' in self.browser.get_attribute_value(root_element, 'class'),
                'Facility': self.browser.get_text(
                    self.browser.get_child_element(root_element,
                                                   self.LCT.REPORT_FACILITY)) if self.browser.get_child_element(
                    root_element, self.LCT.REPORT_FACILITY) else None
            })
            # Get priority
            if self.get_current_report_type().lower() != 'instant reports':
                output[-1]['Priority'] = self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PRIORITY))

            # Get report_type
            if self.browser.get_text(self.LCT.INBOX_REPORT_TYPE).lower() in ('recent reports', 'all reports'):
                output[-1]['Report Type'] = self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_TYPE))
            # Get artifact and reviewed
            wrap_artifact_review_element = self.browser.get_child_element(root_element, self.LCT.ARTIFACT_REVIEW)
            values = [self.browser.get_attribute_value(element, 'alt')
                        for element in self.browser.get_child_elements(wrap_artifact_review_element, 'xpath:.//img')]
            # if 'Error mark icon' in values:
            output[-1]['Artifact'] = True if 'Artifact Icon' in values else False
            # if 'Review checkmark icon' in values:
            output[-1]['Reviewed'] = True if 'Check Circle Icon' in values else False
        self.logger.info(output)
        return output

    def get_reports_on_inbox(self):
        self.wait_inbox_items_available()
        output = []
        root_elements = self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)
        if not root_elements:
            self.logger.info("No reports found in inbox.")
            no_result_msg = self.browser.get_text(self.LCT.NO_RESULTS_MESSAGE)
            return output, no_result_msg

        self.logger.info(f"Found {len(root_elements)} reports in inbox.")
        for root_element in root_elements:
            output.append({
                'Patient Name': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTNAME)),
                'Study ID': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYID)).split()[-1].strip(),
                'Patient ID': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTID)),
                'Physician': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PHYSICIAN)),
                'Time': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_TIME_NOTIFICATION)),
                'Study Type': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYTYPE)),
                'Comments': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_COMMENTS)),
                'Updated': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_UPDATED)),
                'Is New': '--new' in self.browser.get_attribute_value(root_element, 'class'),
                'Facility': self.browser.get_text(
                    self.browser.get_child_element(root_element,
                                                   self.LCT.REPORT_FACILITY)) if self.browser.get_child_element(
                    root_element, self.LCT.REPORT_FACILITY) else None
            })
        self.logger.info(f"Report list: {output}")
        return output

    def _click_on_report(self, locator_to_click, **on):
        """
        Wrap function of functions clicking on any fields of each report item
        :param locator_to_click: (str) locator format
        :param on: (dict) support either of the following keys: row, patient_name
        :return: None
        """
        if 'row' in on:
            _index = -1 if on['row'] == 'last' else int(on['row']) - 1
            self.browser.clicks(locator_to_click, on_elements=lambda i, _: i == _index, stop_on_first=True)
        elif 'patient_name' in on:
            patient_names = self.browser.get_texts(self.LCT.REPORT_PATIENTNAME)
            self.browser.clicks(locator_to_click,
                                on_elements=lambda i, _: i == patient_names.index(on['patient_name']),
                                stop_on_first=True)
        elif 'report_type' in on:
            report_types = self.browser.get_texts(self.LCT.REPORT_TYPE)
            self.browser.clicks(locator_to_click,
                                on_elements=lambda i, _: i == report_types.index(on['report_type']),
                                stop_on_first=True)
        else:
            self.logger.error('`on` valid keys: row, patient_name')
            raise

    def select_report(self, **on):
        """
        Select the report to see report detail
        :param on: (dict) support either of the following keys: row, patient_name
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE) and self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break
        self._click_on_report(locator_to_click=self.LCT.All_REPORT_DATA_SAMPLE, **on)
        self._ok_attention_if_any()
        # Loading report...
        self.browser.wait_invisibility_of_element_located('selector:div.pdf-loading-container', timeout=60)
        self.wait_report_detail_available()

    def view_patient_info(self, **on):
        """
        View Patient info of a report
        :param on: (dict) support either of the following keys: row, patient_name
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.REPORT_PATIENTID, inverse=True)
        self._click_on_report(locator_to_click=self.LCT.REPORT_PATIENTID, **on)

    def view_study_info(self, **on):
        """
        View Study info of a report
        :param on: (dict) support either of the following keys: row, patient_name
        :return: None
        """
        self._click_on_report(locator_to_click=self.LCT.REPORT_STUDYID, **on)

    # Report details

    def back_from_report_detail(self):
        """
        Go back from the report detail view
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.CANCEL_REPORT_DETAIL_ELEMENT, inverse=True)
        self.browser.click(self.LCT.CANCEL_REPORT_DETAIL_ELEMENT)

    def get_report_detail(self):
        """
        Get report detail view, excluding parts inside pdf
        :return: (dict) report detail info
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_DETAIL_CONTENT) and self.browser.get_elements(self.LCT.REPORT_DETAIL_CONTENT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_DETAIL_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break
        header = self.browser.get_texts(self.LCT.REPORT_DETAIL_HEADER)
        data = self.browser.get_texts(self.LCT.REPORT_DETAIL_CONTENT)
        if self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_REVIEWED_KEY)\
                and self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_REVIEWED_CHECKBOX):
            header += self.browser.get_texts(self.LCT.REPORT_DETAIL_REVIEWED_KEY)
            data += ['green-button' in self.browser.get_attribute_value(self.LCT.REPORT_DETAIL_REVIEWED_CHECKBOX, 'class')]
        if self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_ARTIFACT_KEY) and self.browser.get_element(self.LCT.REPORT_DETAIL_ARTIFACT_KEY).is_displayed():
            header += self.browser.get_texts(self.LCT.REPORT_DETAIL_ARTIFACT_KEY) + ['Message']
            data += (self.browser.hover_to(self.LCT.REPORT_DETAIL_ARTIFACT_KEY) and self.browser.get_texts(self.LCT.REPORT_DETAIL_ARTIFACT_CONTENT))
            data += self.browser.get_texts(self.LCT.REPORT_DETAIL_ARTIFACT_DATA)
        output = {
            key: value for key, value in zip(header, data)
        }
        return output

    def open_add_interpretation_dialog(self):
        self.wait_report_detail_available()
        self.browser.hover_to(self.LCT.REPORT_DETAIL_ADDINTERPRETATION)
        self.browser.click(self.LCT.REPORT_DETAIL_ADDINTERPRETATION)
        self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_COMMENTDIALOG)
        self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_COMMENTINPUT)

    def add_interpretation(self, comments=None, is_save=False):
        if comments:
            self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_COMMENTINPUT, inverse=True)
            self.browser.input_text(self.LCT.REPORT_DETAIL_COMMENTINPUT, comments)
            self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_ADDCOMMENT)
            self.browser.click(self.LCT.REPORT_DETAIL_ADDCOMMENT)
            self.browser.wait_invisibility_of_element_located(self.LCT.REPORT_DETAIL_COMMENTDIALOG)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_SAVE, inverse=True)
            self.browser.click(self.LCT.REPORT_DETAIL_SAVE)
            self.browser.wait_invisibility_of_element_located('class:loading-page__text', timeout=60)

    def get_interpretation(self, is_close=False):
        output = self.browser.get_text(self.LCT.REPORT_DETAIL_COMMENTINPUT)
        if is_close:
            self.browser.click(self.LCT.REPORT_DETAIL_CLOSECOMMENT)
            self.browser.wait_invisibility_of_element_located(self.LCT.REPORT_DETAIL_COMMENTDIALOG)
        return output

    def clear_interpretation(self, is_save=True):
        if Utils.get_machine_info().get('system').lower() == 'windows':
            self.browser.get_element(self.LCT.REPORT_DETAIL_COMMENTINPUT).send_keys(Keys.CONTROL + 'a', Keys.DELETE)
        self.browser.click(self.LCT.REPORT_DETAIL_ADDCOMMENT)
        self.browser.wait_invisibility_of_element_located(self.LCT.REPORT_DETAIL_COMMENTDIALOG)
        if Utils.get_machine_info().get('system').lower() == 'darwin':
            self.browser.get_element(self.LCT.REPORT_DETAIL_COMMENTINPUT).send_keys(Keys.COMMAND + 'a', Keys.DELETE)
        if is_save:
            self.browser.click(self.LCT.REPORT_DETAIL_SAVE)
            self.browser.wait_invisibility_of_element_located('class:loading-page__text', timeout=60)
        self.wait_report_detail_available()

    def mark_as_review_report(self, is_review=True):
        if is_review:
            self.browser.clicks(self.LCT.REPORT_DETAIL_REVIEWED_CHECKBOX,
                                on_elements=lambda _, e: '--check' not in self.browser.get_attribute_value(
                                    e, 'class').lower())
        else:
            self.browser.clicks(self.LCT.REPORT_DETAIL_REVIEWED_CHECKBOX,
                                on_elements=lambda _, e: 'green-button' in self.browser.get_attribute_value(
                                    e, 'class').lower())
        self.wait_report_detail_available()

    def check_report_detail_items_are_available(self, items):
        map_items = {
            'pdf viewer': self.browser.wait_visibility_of_element_located(self.LCT.PDF_VIEWER_ELEMENT),
            'back button': self.browser.wait_visibility_of_element_located(self.LCT.CANCEL_REPORT_DETAIL_ELEMENT),
            'reviewed checkbox': self.browser.wait_visibility_of_element_located(
                self.LCT.REPORT_DETAIL_REVIEWED_CHECKBOX),
            'download button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_DOWNLOAD),
            'add interpretation button': self.browser.wait_visibility_of_element_located(
                self.LCT.REPORT_DETAIL_ADDINTERPRETATION),
            'add signature button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_SIGNATURE),
            'save button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_SAVE)
        }
        output = dict()
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        for item in _items:
            if item.lower() not in map_items:
                raise Exception(f'No such item on {item}.')
            output.update({
                item: map_items[item.lower()]
            })

        return output

    # Instant

    def check_instant_report_items_are_available(self, items):
        map_items = {
            'pdf viewer': self.browser.wait_visibility_of_element_located(self.LCT.PDF_VIEWER_ELEMENT),
            'delete report button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_DELETEICON),
            'open study button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_OPENSTUYDY),
            'back button': self.browser.wait_visibility_of_element_located(self.LCT.CANCEL_REPORT_DETAIL_ELEMENT),
            'download button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_DOWNLOAD),
            'add interpretation button': self.browser.wait_visibility_of_element_located(
                self.LCT.REPORT_DETAIL_ADDINTERPRETATION),
            'add signature button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_SIGNATURE),
            'save button': self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_SAVE)
        }
        output = dict()
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        for item in _items:
            if item.lower() not in map_items:
                raise Exception(f'No such item on {item}.')
            output.update({
                item: map_items[item.lower()]
            })

        return output

    def delete_instant_report(self, is_delete=True):
        self.browser.click(self.LCT.REPORT_DETAIL_DELETEICON)
        if is_delete:
            self.browser.click(self.LCT.REPORT_DETAIL_DELETE_CONFIRM)

    def open_instant_report_study_details(self):
        self.browser.click(self.LCT.REPORT_DETAIL_OPENSTUYDY)
        self.browser.wait_visibility_of_all_elements_located('class:skeleton-info-item', inverse=True)

    def check_notification_sort_reports(self, sort_time=None):
        self.wait_inbox_items_available()
        if sort_time == 'Newest':
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_DATA_SAMPLE, inverse=True)
            times = self.browser.get_texts(self.LCT.REPORT_TIME)
            # Convert times to datetime objects
            formatted_times = [datetime.strptime(time_1, "%m/%d/%Y, %H:%M:%S") for time_1 in times]
            # Sort the datetime objects (oldest to newest)
            sorted_times = sorted(formatted_times, reverse=True)
            # Convert sorted times back to the original format
            sorted_times_formatted = [time_1.strftime("%m/%d/%Y, %H:%M:%S") for time_1 in sorted_times]
            if times == sorted_times_formatted:
                return sorted_times_formatted
        if sort_time == 'Oldest to Newest':
            self.browser.click(self.LCT.SORT_ICON)
            self.browser.wait_visibility_of_element_located(self.LCT.SORT_ICON, inverse=True)
            times = self.browser.get_texts(self.LCT.REPORT_TIME)
            # Convert times to datetime objects
            formatted_times = [datetime.strptime(time_1, "%m/%d/%Y, %H:%M:%S") for time_1 in times]
            # Sort the datetime objects (oldest to newest)
            sorted_times = sorted(formatted_times)
            # Convert sorted times back to the original format
            sorted_times_formatted = [time_1.strftime("%m/%d/%Y, %H:%M:%S") for time_1 in sorted_times]
            if times == sorted_times_formatted:
                return sorted_times_formatted
        if sort_time == 'Newest to Oldest':
            self.browser.click(self.LCT.SORT_ICON)
            self.browser.wait_visibility_of_element_located(self.LCT.SORT_ICON, inverse=True)
            times = self.browser.get_texts(self.LCT.REPORT_TIME)
            # Convert times to datetime objects
            formatted_times = [datetime.strptime(time_1, "%m/%d/%Y, %H:%M:%S") for time_1 in times]
            # Sort the datetime objects (oldest to newest)
            sorted_times = sorted(formatted_times, reverse=True)
            # Convert sorted times back to the original format
            sorted_times_formatted = [time_1.strftime("%m/%d/%Y, %H:%M:%S") for time_1 in sorted_times]
            if times == sorted_times_formatted:
                return sorted_times_formatted

    def get_reports_on_page_2(self):
        """
        Get inbox instant reports or notification reports displayed on current page
        :return:
        """
        self.wait_inbox_items_available()
        output = []
        root_elements = self.browser.get_elements(self.LCT.REPORT_DATA_SAMPLE)
        if not root_elements:
            return output
        for root_element in root_elements:
            output.append({
                'Patient Name': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTNAME)),
                'Study ID': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYID)).split()[-1].strip(),
                'Patient ID': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PATIENTID)),
                'Physician': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PHYSICIAN)),
                'Time': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_TIME)),
                'Study Type': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_STUDYTYPE)),
                'Comments': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_COMMENTS)),
                'Updated': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_UPDATED)),
                'Is New': '--new' in self.browser.get_attribute_value(root_element, 'class'),
                'Facility': self.browser.get_text(
                    self.browser.get_child_element(root_element,
                                                   self.LCT.REPORT_FACILITY)) if self.browser.get_child_element(
                    root_element, self.LCT.REPORT_FACILITY) else None
            })
            # Get priority
            if self.get_current_report_type().lower() != 'instant reports':
                output[-1]['Priority'] = self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_PRIORITY))

            # Get report_type
            if self.browser.get_text(self.LCT.INBOX_REPORT_TYPE).lower() in ('recent reports', 'all reports'):
                output[-1]['Report type'] = self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.REPORT_TYPE))
        return output

    def get_data_on_reports_page(self, study_type=False, report_type=False, priority=False, biodirect=False):
        if study_type:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_STUDYTYPE)
            return self.browser.get_texts(self.LCT.REPORT_STUDYTYPE)
        if report_type:
            if self.browser.get_text(self.LCT.INBOX_REPORT_TYPE).lower() in ('recent reports', 'all reports'):
                return self.browser.get_texts(self.LCT.REPORT_TYPE)
        if priority:
            if self.get_current_report_type().lower() != 'instant reports':
                return self.browser.get_texts(self.LCT.REPORT_PRIORITY)
        if biodirect:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_BIODIRECT)
            return self.browser.get_texts(self.LCT.REPORT_BIODIRECT)

    @staticmethod
    def _get_convert_to_datetime(duration):
        if 'hour' in duration:
            hours = int(duration.split()[0])
            return timedelta(hours=hours)
        elif 'day' in duration:
            days = int(duration.split()[0])
            return timedelta(days=days)
        elif 'month' in duration:
            months = int(duration.split()[0])
            return timedelta(days=30 * months)
        elif 'year' in duration:
            years = int(duration.split()[0])
            return timedelta(days=365 * years)
        else:
            return timedelta(0)

    def sort_ascending_reports(self):
        self.wait_inbox_items_available()
        output_1 = []
        output_2 = []
        self.browser.hover_to(self.LCT.SORT_ICON)
        if 'Oldest' in self.browser.get_text(self.LCT.SORT_REPORTS).split()[0].strip():
            self.browser.wait_visibility_of_element_located(self.LCT.SORT_ICON)
            self.browser.click(self.LCT.SORT_ICON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE, timeout=5)
        while True:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE, inverse=True)
            if len(self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)) == 10:
                self.wait_inbox_items_available()
                output_1 += self.browser.get_texts(self.LCT.REPORT_SORT_TIME)
                if self.browser.get_element(self.LCT.GO_NEXT_PAGE).get_attribute('disabled'):
                    sorted_times = sorted(output_1, key=lambda x: self._get_convert_to_datetime(x))
                    if output_1 == sorted_times:
                        return sorted_times
                    else:
                        break
                self.browser.click(self.LCT.GO_NEXT_PAGE)
                self.browser.wait_visibility_of_element_located(self.LCT.GO_NEXT_PAGE)
            else:
                self.wait_inbox_items_available()
                output_2 += self.browser.get_texts(self.LCT.REPORT_SORT_TIME)
                output = output_1 + output_2
                sorted_times = sorted(output, key=lambda x: self._get_convert_to_datetime(x))
                if output == sorted_times:
                    return sorted_times
                else:
                    break

    def sort_descending_reports(self):
        output_1 = []
        output_2 = []
        self.browser.hover_to(self.LCT.SORT_ICON)
        if 'Newest' in self.browser.get_text(self.LCT.SORT_REPORTS).split()[0].strip():
            self.browser.wait_visibility_of_element_located(self.LCT.SORT_ICON)
            self.browser.click(self.LCT.SORT_ICON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE, timeout=5)
        while True:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.All_REPORT_DATA_SAMPLE, inverse=True)
            if len(self.browser.get_elements(self.LCT.All_REPORT_DATA_SAMPLE)) == 10:
                self.wait_inbox_items_available()
                output_1 += self.browser.get_texts(self.LCT.REPORT_SORT_TIME)
                if self.browser.get_element(self.LCT.GO_NEXT_PAGE).get_attribute('disabled'):
                    sorted_times = sorted(output_1, key=lambda x: self._get_convert_to_datetime(x), reverse=True)
                    if output_1 == sorted_times:
                        return sorted_times
                    else:
                        break
                self.browser.click(self.LCT.GO_NEXT_PAGE)
                self.browser.wait_visibility_of_element_located(self.LCT.GO_NEXT_PAGE)
            else:
                self.wait_inbox_items_available()
                output_2 += self.browser.get_texts(self.LCT.REPORT_SORT_TIME)
                output = output_1 + output_2
                sorted_times = sorted(output, key=lambda x: self._get_convert_to_datetime(x), reverse=True)
                if output == sorted_times:
                    return sorted_times
                else:
                    break

    def clear_dialog_button(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CANCEL_REPORT_DETAIL_ELEMENT)
        self.browser.click(self.LCT.CANCEL_REPORT_DETAIL_ELEMENT)
        self.wait_inbox_items_available()

    def add_signature(self, is_save=False):
        self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_SIGNATURE, inverse=True)
        self.browser.click(self.LCT.REPORT_DETAIL_SIGNATURE)
        self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_ADDCOMMENT)
        self.browser.click(self.LCT.REPORT_DETAIL_ADDCOMMENT)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_SAVE, inverse=True)
            self.browser.click(self.LCT.REPORT_DETAIL_SAVE)
            self.browser.wait_invisibility_of_element_located('class:loading-page__text', timeout=60)

    def view_study_info_from_detail(self):
        """
        View Study info of a report from report details page
        :param: (dict) support either of the following keys: row, patient_name
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_STUDYID, inverse=True)
        self.browser.click(self.LCT.REPORT_DETAIL_STUDYID)

    def view_patient_info_from_detail(self):
        """
        View Patient info of a report from report details page
        :param: (dict) support either of the following keys: row, patient_name
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.REPORT_DETAIL_PATIENT, inverse=True)
        self.browser.click(self.LCT.REPORT_DETAIL_PATIENT)

    def edit_report_status(self, status=None):
        if status:
            self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_STATUS)
            self.browser.click(self.LCT.STUDY_REPORT_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_STATUS_OPTION)
            self.browser.clicks(self.LCT.STUDY_REPORT_STATUS_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == status.lower(),
                                stop_on_first=False)
            return self.browser.get_texts(self.LCT.STUDY_REPORT_STATUS_OPTION)

    def get_current_report_status(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_STATUS, inverse=True)
        return self.browser.get_text(self.LCT.STUDY_REPORT_STATUS)
