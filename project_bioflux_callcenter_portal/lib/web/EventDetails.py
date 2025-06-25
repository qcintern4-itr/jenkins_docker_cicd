#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import event_details as locators
    from corelib import WebHandler

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class EventDetails(WebPage):
    """
    Handle event details page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_event_tab(self, tab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_TABS) and 'disabled' not in self.browser.get_attribute_value(self.browser.get_elements(self.LCT.NAV_TABS)[0], 'class'):
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_TABS, inverse=True)
                self.browser.js_clicks(self.LCT.NAV_TABS, on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                                       stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_TABS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:  # 5 minutes in seconds
                break

    def get_event_summary(self):  # TBD
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_HEADER) and self.browser.get_elements(self.LCT.NAV_HEADER)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_CONTENT, inverse=True)
                header = self.browser.get_texts(self.LCT.NAV_HEADER)
                return self.browser.get_tabular_data(header, self.LCT.NAV_CONTENT, row=1)
            elif time.time() - start_time > 1 * 60:
                break

    def toggle_bookmark_event(self, is_toggle=True):
        is_checked = 'xOSAyVjIyTDEyIDE2TDUgMjJMNSAyWiIgZmlsbD0iIzBEOUU5MiIgc3Ryb2tl'
        for _ in range(2):
            if is_toggle:
                if is_checked in self.browser.get_attribute_value(self.LCT.NAV_BOOKMARK, 'src'):
                    break
                self.browser.click(self.LCT.NAV_BOOKMARK + '/..')
            else:
                if is_checked not in self.browser.get_attribute_value(self.LCT.NAV_BOOKMARK, 'src'):
                    break
                self.browser.click(self.LCT.NAV_BOOKMARK + '/..')

    def view_event_details_study_information(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_CONTENT)
        self.browser.click(self.LCT.NAV_CONTENT + '[2]')

    def view_event_details_patient_details(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_CONTENT)
        self.browser.click(self.LCT.NAV_CONTENT + '[3]')

    def view_event_details_facility_information(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NAV_CONTENT)
        self.browser.click(self.LCT.NAV_CONTENT + '[4]')

    def back_from_event_details(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NAV_BACK, inverse=True)
        self.browser.click(self.LCT.NAV_BACK)
        self.browser.wait_url_to_be(self.URL + '/events')

    #   Event details

    def get_top_event_detail_options(self):  # The options from dropdown on the top
        output = dict()
        # event type
        if 'disabled' not in self.browser.get_attribute_value(self.LCT.EDET_EVENTTYPE, 'class'):
            self.browser.click(self.LCT.EDET_EVENTTYPE)
            output['Event Types'] = self.browser.get_texts(self.LCT.EDET_EVENTCALL_OPTIONS)
        if 'disabled' in self.browser.get_attribute_value(self.LCT.EDET_EVENTTYPE, 'class'):
            output['Event Types'] = []
        # Validity
        if 'disabled' not in self.browser.get_attribute_value(self.LCT.EDET_EVENTVALIDITY, 'class'):
            self.browser.click(self.LCT.EDET_EVENTVALIDITY)
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTVALIDITY)
            output['Validity'] = self.browser.get_texts(self.LCT.EDET_EVENTVALIDITY_OPTIONS)
        if 'disabled' in self.browser.get_attribute_value(self.LCT.EDET_EVENTVALIDITY, 'class'):
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTVALIDITY)
            output['Validity'] = []

        # Call
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTCALL, inverse=True)
        self.browser.click(self.LCT.EDET_EVENTCALL)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_EVENTCALL_OPTIONS, inverse=True)
        output['Call Options'] = self.browser.get_texts(self.LCT.EDET_EVENTCALL_OPTIONS)
        self.browser.click(self.LCT.EDET_EVENTCALL)

        return output

    def get_event_details(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_CONTENT_ROOT, timeout=10)
        root_content = self.browser.get_texts(self.LCT.EDET_CONTENT_ROOT)
        root_content = {content.split('\n')[0]: content.split('\n')[1::] for content in root_content}
        output = dict()
        # Top info
        output['Event Type'] = self.browser.get_text(self.LCT.EDET_EVENTTYPE)
        output['Validity'] = self.browser.get_text(self.LCT.EDET_EVENTVALIDITY)
        output['Call Option'] = self.browser.get_text(self.LCT.EDET_EVENTCALL)
        if output['Validity'].lower() == 'valid':
            output.update({'Include in report': self.browser.is_checkbox_selected(self.LCT.EDET_INCLUDEREPORT)})

        # EVENT PARAMETERS if available
        if self.browser.wait_visibility_of_element_located(
                'xpath://div[contains(@class, "-parameters")]') and 'EVENT PARAMETERS' in root_content:
            value = root_content['EVENT PARAMETERS']
            output['EVENT PARAMETERS'] = ' | '.join(value)
        # EVENT INFORMATION
        value = root_content['EVENT INFORMATION']
        if 'Event logs' in value[0]:  # remove event logs
            value.pop(0)
        output['EVENT INFORMATION'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        # TECHNICIAN COMMENTS (comments and tags)
        output['TECHNICIAN COMMENTS'] = {
            'Comment': self.browser.get_text(self.LCT.EDET_COMMENTFIELD),
            'Event Tags': self.browser.get_text(self.LCT.EDET_COMMENTEVENTTAG)
        }
        # STUDY SETTINGS'
        value = root_content['STUDY SETTINGS']
        output['STUDY SETTINGS'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}

        # Include in report
        output['Include in report'] = self.browser.is_checkbox_selected(
            self.LCT.EDET_INCLUDEREPORT) if self.browser.wait_visibility_of_element_located(
            self.LCT.EDET_INCLUDEREPORT) else None
        self.logger.info(output)
        return output

    def edit_event_details(self, event_type=None, event_parameters=None, event_validity=None, call_option=None, include_report=None,
                           is_save=True, is_close=False):
        if event_type:
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTTYPE)
            self.browser.click(self.LCT.EDET_EVENTTYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_EVENTTYPE_OPTIONS)
            self.browser.clicks(self.LCT.EDET_EVENTTYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                    event_type.lower()), stop_on_first=True)
        if event_validity:
            if self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTVALIDITY) and self.browser.get_element(self.LCT.EDET_EVENTVALIDITY).get_attribute('disabled') is not None:
                self.logger.info(f'`The event has been valid')
            else:
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTVALIDITY)
                self.browser.click(self.LCT.EDET_EVENTVALIDITY)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_EVENTVALIDITY_OPTIONS, inverse=True)
                self.browser.clicks(self.LCT.EDET_EVENTVALIDITY_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == event_validity.lower(),
                                    stop_on_first=True)
        if event_parameters:
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_PARAMETERS)
            self.browser.input_text(self.LCT.EDET_EVENT_PARAMETERS, event_parameters)
        if call_option:
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTCALL)
            self.browser.click(self.LCT.EDET_EVENTCALL)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_EVENTCALL_OPTIONS)
            self.browser.clicks(self.LCT.EDET_EVENTCALL_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == call_option.lower(),
                                stop_on_first=True)
        if self.get_event_details()['Validity'].lower() == 'valid' and not self.browser.get_attribute_value(
                self.LCT.EDET_INCLUDEREPORT, 'disabled'):
            self.browser.toggle_checkbox(self.LCT.EDET_INCLUDEREPORT, self.LCT.EDET_INCLUDEREPORT + '/..',
                                         include_report)
        if is_close:
            if self.browser.wait_visibility_of_element_located(self.LCT.EDET_CLOSE) and self.browser.get_element(self.LCT.EDET_CLOSE).is_displayed():
                self.browser.click(self.LCT.EDET_CLOSE)
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_CLOSE, inverse=True)
            else:
                self.logger.info(f'`close is not displayed')
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_SAVE, inverse=True)
            self.browser.click(self.LCT.EDET_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_SAVE)
            if self.browser.wait_visibility_of_element_located(self.LCT.EDET_MESSAGE) and self.browser.get_element(self.LCT.EDET_MESSAGE).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_MIN_HR_INPUT, inverse=True)
                self.browser.input_text(self.LCT.EDET_EVENT_MIN_HR_INPUT, '10')
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_MAX_HR_INPUT, inverse=True)
                self.browser.input_text(self.LCT.EDET_EVENT_MAX_HR_INPUT, '10')
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_EVENT_DURATION_INPUT, inverse=True)
                self.browser.input_text(self.LCT.EDET_EVENT_EVENT_DURATION_INPUT, '10')
                if self.browser.wait_visibility_of_element_located(self.LCT.EDET_CLOSE) and self.browser.get_element(self.LCT.EDET_CLOSE).is_displayed():
                    self.browser.click(self.LCT.EDET_CLOSE)
                    self.browser.wait_visibility_of_element_located(self.LCT.EDET_CLOSE, inverse=True)
                self.browser.click(self.LCT.EDET_SAVE)
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_SAVE, inverse=True)
            else:
                self.logger.info(f'`Save successfully')
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_SAVE, inverse=True)

    def check_events_items_available(self, items):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_SAVE)
        map_locator = {
            "event type": self.browser.wait_visibility_of_element_located(
                self.LCT.EDET_EVENTTYPE) if 'disabled' not in self.browser.get_attribute_value(
                self.LCT.EDET_EVENTTYPE, 'class') else 'disabled',
            "event validity": self.browser.wait_visibility_of_element_located(
                self.LCT.EDET_EVENTVALIDITY) if 'disabled' not in self.browser.get_attribute_value(
                self.LCT.EDET_EVENTVALIDITY, 'class') else 'disabled',
            "event call": self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENTCALL),
            "include report": self.browser.wait_visibility_of_element_located(
                self.LCT.EDET_INCLUDEREPORT) if 'disabled' not in self.browser.get_attribute_value(
                self.LCT.EDET_INCLUDEREPORT, 'class') else 'disabled',
            "save": False if 'disabled' in self.browser.get_attribute_value(
                self.LCT.EDET_SAVE, 'class') else True,
            "close": self.browser.wait_visibility_of_element_located(self.LCT.EDET_CLOSE)
        }
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items
        output = dict()
        for item in _items:
            if item.lower() not in map_locator:
                raise Exception(f'No such item `{item}` in list `{map_locator.keys()}`.')
            output.update({
                item: map_locator[item.lower()]
            })
        return output

    # Notification criteria

    def get_notification_criteria(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NOTIF_CONTENT_ROOT, inverse=True)
        text = self.browser.get_texts(self.LCT.NOTIF_CONTENT_ROOT)
        return text

    def add_notification_criteria_study_log(self):
        pass

    def add_notification_criteria_study_notes(self):
        pass

    # Event Report

    def get_event_tag(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_TAG)
        self.browser.scroll_into_view(self.LCT.EDET_EVENT_TAG)
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_TAG, inverse=True)
        self.browser.click(self.LCT.EDET_EVENT_TAG)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_EVENT_TAG_OPTION, inverse=True)
        self.browser.clear_on_text_search()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_EVENT_TAG_OPTION, inverse=True)
        event_tag = self.browser.get_texts(self.LCT.EDET_EVENT_TAG_OPTION)
        self.browser.click(self.LCT.EDET_EVENT_TAG)
        return event_tag

    def edit_event_tag(self, event_name=None, is_save=False):
        if event_name:
            self.browser.scroll_into_view(self.LCT.EDET_EVENT_TAG)
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_TAG, inverse=True)
            self.browser.click(self.LCT.EDET_EVENT_TAG)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDET_EVENT_TAG_OPTION, inverse=True)
            element = self.browser.get_elements(self.LCT.EDET_EVENT_TAG_OPTION)
            self.browser.hover_to(element[0])
            self.browser.js_clicks(self.LCT.EDET_EVENT_TAG_OPTION,
                                   on_elements=lambda _, e: self.browser.get_text(e).lower() == event_name.lower(),
                                   stop_on_first=True)
            self.browser.click(self.LCT.EDET_EVENT_TAG)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_SAVE_BUTTON, inverse=True)
            self.browser.click(self.LCT.EDET_EVENT_SAVE_BUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_SAVE_BUTTON, inverse=True)
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_SAVE_BUTTON, inverse=True)

    def get_current_event_tag(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_TAG)
        self.browser.scroll_into_view(self.LCT.EDET_EVENT_TAG)
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_TAG)
        current_event_tag = self.browser.get_text(self.LCT.EDET_EVENT_INPUT)
        return current_event_tag

    def get_current_technician_comment(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT, inverse=True)
        self.browser.scroll_into_view(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT)
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT, inverse=True)
        current_technician_comments = self.browser.get_text(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT)
        return current_technician_comments

    def clear_event_tag(self):
        self.browser.execute_script('window.scrollTo(0,2500)')
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_CLEAR) and self.browser.get_element(self.LCT.EDET_EVENT_CLEAR).is_displayed():
            self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_CLEAR, inverse=True)
            self.browser.hover_to(self.LCT.EDET_EVENT_CLEAR)
            self.browser.click(self.LCT.EDET_EVENT_CLEAR)

    def add_technician_comments(self, technician_comments):
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT, inverse=True)
        self.browser.input_text(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT, technician_comments)
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT, inverse=True)

    def get_toast_message(self):
        while True:
            start_time = time.time()
            if self.browser.wait_visibility_of_element_located(self.LCT.EDET_MESSAGE) and self.browser.get_element(self.LCT.EDET_MESSAGE):
                return self.browser.get_text(self.LCT.EDET_MESSAGE)
            elif time.time() - start_time > 1 * 60:  # 1 minutes in seconds
                break
            time.sleep(5)

    def clear_technician_comments(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT)
        self.browser.clear_text(self.LCT.EDET_TECHNICIAN_COMMENTS_INPUT)

    def clear_event_text_search(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CLEAR_ICON)
        self.browser.click(self.LCT.CLEAR_ICON)
        self.browser.wait_visibility_of_element_located(self.LCT.CLEAR_ICON, inverse=True)

    def get_message_locking(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_MESSAGE_LOCKING) and self.browser.get_element(self.LCT.EDET_MESSAGE_LOCKING).is_displayed():
            return self.browser.get_text(self.LCT.EDET_MESSAGE_LOCKING)

    def get_count_user_opening(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_COUNT_USER)
        elements = self.browser.get_elements(self.LCT.EDET_COUNT_USER)
        return len(elements)

    def generate_event_report_data(self):
        time.sleep(5)
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE)
        self.browser.scroll_into_view(self.LCT.EDET_ICON_GENARATE)
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE, inverse=True)
        self.browser.js_click(self.LCT.EDET_ICON_GENARATE)
        self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE, inverse=True)
        # time.sleep(5)

    def check_generate_successful(self):
        self.browser.execute_script('window.scrollTo(2500,0)')
        time.sleep(10)
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_REPORT_PDF) and self.browser.get_element(self.LCT.EDET_EVENT_REPORT_PDF).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_REPORT_PDF, inverse=True)
                return True
            elif self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is None:
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE, inverse=True)
                return True

    def check_generate_successful_for_interim_report(self):
        self.browser.execute_script('window.scrollTo(2500,0)')
        time.sleep(5)
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is None:
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE, inverse=True)
                return True
            elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_UPLOAD) and self.browser.get_element(self.LCT.EVENT_REPORT_UPLOAD).get_attribute('disabled') is None:
                self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE, inverse=True)
                return True
            elif self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_REPORT_PDF) and self.browser.get_element(self.LCT.EDET_EVENT_REPORT_PDF).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_LOADING, inverse=True)
                return True
            else:
                return False

    def get_text_or_none(self, locator):
        element = self.browser.get_element(locator)
        return element.text if element is not None else None

    def is_element_disabled(self, locator):
        element = self.browser.get_element(locator)
        if element is not None and element.is_displayed():
            return 'disabled' in self.browser.get_attribute_value(locator, 'class')
        return False

    def is_priority_disabled(self, locator):
        element = self.browser.get_element(locator)
        if self.browser.wait_visibility_of_element_located(locator) and element.get_attribute('disabled') is None:
            return True
        else:
            return False

    def check_active_event_report_available(self):
        time.sleep(5)

        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_ICON_MORE) and self.browser.get_element(self.LCT.EVENT_ICON_MORE).is_displayed():
            self.browser.click(self.LCT.EVENT_ICON_MORE)
            time.sleep(2)

        output = {
                'Text Report': self.get_text_or_none(self.LCT.EVENT_REPORT_STATUS) or self.get_text_or_none(self.LCT.INTERIM_REPORT_STATUS),
                'Text Dismiss': self.get_text_or_none(self.LCT.EVENT_REPORT_DISMISS) or self.get_text_or_none(self.LCT.INTERIM_DISMISS),
                'Generate Report': True if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is None else False,
                'Upload Report': True if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_UPLOAD) and self.browser.get_element(self.LCT.EVENT_REPORT_UPLOAD).get_attribute('disabled') is None else False,
                'Status Report': self.is_element_disabled(self.LCT.EVENT_REPORT_STATUS + '//button') or self.is_element_disabled(self.LCT.INTERIM_REPORT_STATUS),
                'Status Report Technician': self.is_element_disabled(self.LCT.EVENT_REPORT_STATUS),
                'Priority': self.is_priority_disabled(self.LCT.EVENT_REPORT_PRIORITY + '//input') or self.is_priority_disabled(self.LCT.INTERIM_PRIORITY + '//input'),
                # 'Assign': True if self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is None else False
                'Assigned': self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED) is not None and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed(),
                'PDF Viewer': True if self.browser.wait_visibility_of_element_located(self.LCT.EDET_EVENT_REPORT_PDF) and self.browser.get_element(self.LCT.EDET_EVENT_REPORT_PDF).is_displayed() else False,
                'Download Report': self.is_priority_disabled(self.LCT.EVENT_REPORT_DOWNLOAD) or self.is_priority_disabled(self.LCT.EVENT_REPORT_DOWNLOAD),
            }

        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_ICON_MORE) and self.browser.get_element(self.LCT.EVENT_ICON_MORE).is_displayed():
            self.browser.click(self.LCT.EVENT_ICON_MORE)
            time.sleep(2)
        return output

    def check_active_event_interim_report_available(self):
        output = dict()
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_EMAIL) and self.browser.get_element(self.LCT.EVENT_REPORT_EMAIL).is_displayed():
            output['Email'] = True if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_EMAIL) and self.browser.get_element(self.LCT.EVENT_REPORT_EMAIL).get_attribute('disabled') is None else False
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_RECALL) and self.browser.get_element(self.LCT.EVENT_REPORT_RECALL).is_displayed():
            output['Recall'] = True if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_RECALL) and self.browser.get_element(self.LCT.EVENT_REPORT_RECALL).get_attribute('disabled') is None else False
        if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).is_displayed():
            output['Mark Or Unmark'] = True if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).get_attribute('disabled') is None else False
        if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_SAVE_REPORT) and self.browser.get_element(self.LCT.INTERIM_SAVE_REPORT).is_displayed():
            output['Save Report'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.INTERIM_SAVE_REPORT, 'class') else True
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS) and self.browser.get_element(self.LCT.EVENT_REPORT_DISMISS).is_displayed():
            output['Dismiss'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.EVENT_REPORT_DISMISS, 'class') else True
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DISMISS) and self.browser.get_element(self.LCT.INTERIM_DISMISS).is_displayed():
            output['Dismiss'] = False if 'disabled' in self.browser.get_attribute_value(self.LCT.INTERIM_DISMISS, 'class') else True
        return output

    def check_active_assignee_available(self):
        time.sleep(5)
        output = {
                'Assigned': self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED) is not None and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed()
            }
        return output

    def check_displayed_on_event_report(self):
        output = {
                'Text Dismiss': self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED) is not None and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed(),
                'Assigned': self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED) is not None and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed(),
            }
        return output

    def filter_event_report(self, priority=None, is_click=False, is_cancel=False, is_send=False, is_dismiss=False, is_dismiss_submit=False):
        time.sleep(5)

        if priority:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_PRIORITY)
            self.browser.click(self.LCT.EVENT_REPORT_PRIORITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_REPORT_PRIORITY_OPTION)
            self.logger.info("start clicking on priority")
            self.browser.clicks(self.LCT.EVENT_REPORT_PRIORITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == priority.lower(),
                                stop_on_first=True)
            self.logger.info("clicked on priority")

        if is_click:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS)
            self.browser.click(self.LCT.EVENT_REPORT_STATUS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
        if is_dismiss:
            self.browser.execute_script('window.scrollTo(2500,0)')
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
            self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_CANCEL_BUTTON)
            self.browser.click(self.LCT.EVENT_REPORT_CANCEL_BUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
        if is_send:
            if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_SEND_BUTTON)
                self.browser.click(self.LCT.EVENT_REPORT_SEND_BUTTON)
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
            elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGNED) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed():
                return self
        if is_dismiss_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_SEND_BUTTON)
            self.browser.click(self.LCT.EVENT_REPORT_SEND_BUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)

    def get_message_notice_assigned(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_MESSAGE_EVENT_REPORT) and self.browser.get_element(self.LCT.EDET_MESSAGE_EVENT_REPORT).is_displayed():
            return self.browser.get_text(self.LCT.EDET_MESSAGE_EVENT_REPORT)

    def back_to_event_original(self, is_recall=False, is_click=False, is_interim_click=False):
        if is_recall:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_RECALL)
            self.browser.click(self.LCT.EVENT_REPORT_RECALL)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
        if is_click:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS)
            self.browser.click(self.LCT.EVENT_REPORT_STATUS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
        if is_interim_click:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
            self.browser.click(self.LCT.INTERIM_REPORT_STATUS)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)

    def get_message_report_dismissed(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_MESSAGE_DISMISSED_REPORT) and self.browser.get_element(self.LCT.EDET_MESSAGE_DISMISSED_REPORT).is_displayed():
            return self.browser.get_text(self.LCT.EDET_MESSAGE_DISMISSED_REPORT)

    def assign_event_reports_to_you(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).is_displayed():
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN, inverse=True)
            self.browser.click(self.LCT.EVENT_REPORT_ASSIGN)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN, inverse=True)
        # if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
        #     self.logger.info(f'`generate button is disabled')
        # else:
        #     self.generate_event_report_data()
        #     self.check_generate_successful()
        # # check
        # if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is not None:
        #     self.back_to_event_original(is_recall=True, is_click=True)
        #     self.browser.click(self.LCT.EVENT_REPORT_ASSIGN)
        #     self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN, inverse=True)
        # elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is None:
        #     self.browser.click(self.LCT.EVENT_REPORT_ASSIGN)
        #     self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN, inverse=True)
        # elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGNED) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed():
        #     value = self.browser.get_text(self.LCT.EVENT_REPORT_STATUS)
        #     if value == 'Ready':
        #         self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS)
        #         self.browser.click(self.LCT.EVENT_REPORT_STATUS)
        #         self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
        #     elif value == 'Send':
        #         self.logger.info(f'Event report assign to you successful')
        #     elif value == 'Update':
        #         self.back_to_event_original(is_recall=True, is_click=True)
        # elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS) and 'disabled' in self.browser.get_attribute_value(self.LCT.EVENT_REPORT_STATUS, 'class'):
        #     self.filter_event_report(priority='Low', is_click=True)
        #     self.browser.click(self.LCT.EVENT_REPORT_ASSIGN)
        #     self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN, inverse=True)
        # else:
        #     self.filter_event_report(is_click=True)
        #     self.browser.click(self.LCT.EVENT_REPORT_ASSIGN)
        #     self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN, inverse=True)

    def create_event_reports_with_status_is_ready(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
            self.logger.info(f'`generate button is disabled')
        else:
            self.generate_event_report_data()
            self.check_generate_successful()
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True, is_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is None:
            self.logger.info(f'`assign button is enabled')
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN, inverse=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGNED) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed():
            value = self.browser.get_text(self.LCT.EVENT_REPORT_STATUS)
            if value == 'Ready':
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS)
                self.browser.click(self.LCT.EVENT_REPORT_STATUS)
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
                # self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
                # self.filter_event_report(is_click=True, is_send=True)
            elif value == 'Send':
                self.logger.info(f'`the status report is ready')
            elif value == 'Update':
                self.back_to_event_original(is_recall=True, is_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS) and self.browser.get_text(self.LCT.EVENT_REPORT_DISMISS) == 'Reenable':
            self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
            self.generate_event_report_data()
            self.check_generate_successful()
            self.filter_event_report(is_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS) and 'disabled' in self.browser.get_attribute_value(self.LCT.EVENT_REPORT_STATUS, 'class'):
            self.filter_event_report(priority='Low', is_click=True)
        else:
            self.filter_event_report(is_click=True)

    def create_event_reports_with_status_is_sent(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
            self.logger.info(f'`generate button is disabled')
        else:
            self.generate_event_report_data()
            self.check_generate_successful()
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True, is_click=True)
            self.filter_event_report(is_click=True, is_send=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is None:
            self.filter_event_report(is_click=True, is_send=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGNED) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed():
            value = self.browser.get_text(self.LCT.EVENT_REPORT_STATUS)
            if value == 'Ready':
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS)
                self.browser.click(self.LCT.EVENT_REPORT_STATUS)
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS, inverse=True)
                self.filter_event_report(is_click=True, is_send=True)
            elif value == 'Send':
                self.filter_event_report(is_click=True, is_send=True)
            elif value == 'Update':
                self.back_to_event_original(is_recall=True, is_click=True)
                self.filter_event_report(is_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS) and self.browser.get_text(self.LCT.EVENT_REPORT_DISMISS) == 'Reenable':
            self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
            self.generate_event_report_data()
            self.get_toast_message()
            self.check_generate_successful()
            self.filter_event_report(priority='Low', is_click=True)
            self.filter_event_report(is_click=True, is_send=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS) and 'disabled' in self.browser.get_attribute_value(self.LCT.EVENT_REPORT_STATUS, 'class'):
            self.filter_event_report(priority='Low', is_click=True)
            self.filter_event_report(is_click=True, is_send=True)
        else:
            self.filter_event_report(is_click=True)
            self.filter_event_report(is_click=True, is_send=True)

    def create_event_reports_with_status_is_generate(self):
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True)
            self.generate_event_report_data()
            # self.get_toast_message()
            self.check_generate_successful()
            return
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is None:
            self.filter_event_report(is_click=True, is_send=True)
            self.back_to_event_original(is_recall=True)
            self.generate_event_report_data()
            # self.get_toast_message()
            self.check_generate_successful()
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGNED) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed():
            value = self.browser.get_text(self.LCT.EVENT_REPORT_STATUS)
            if value == 'Ready':
                self.generate_event_report_data()
                # self.get_toast_message()
                self.check_generate_successful()
            elif value == 'Send':
                self.filter_event_report(is_click=True)
                self.back_to_event_original(is_recall=True)
                self.generate_event_report_data()
                # self.get_toast_message()
                self.check_generate_successful()
            elif value == 'Update':
                self.back_to_event_original(is_recall=True)
                self.generate_event_report_data()
                # self.get_toast_message()
                self.check_generate_successful()
            return
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS) and 'disabled' in self.browser.get_attribute_value(self.LCT.EVENT_REPORT_STATUS, 'class') and self.browser.get_text(self.LCT.EVENT_REPORT_DISMISS) != 'Reenable':
            self.generate_event_report_data()
            # self.get_toast_message()
            self.check_generate_successful()
            self.filter_event_report(priority='Low')
            return

        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_ICON_MORE) and self.browser.get_element(self.LCT.EVENT_ICON_MORE).is_displayed():
            self.browser.click(self.LCT.EVENT_ICON_MORE)
            time.sleep(2)
        self.logger.info("Clicked icon more")
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS) and self.browser.get_text(self.LCT.EVENT_REPORT_DISMISS) == 'Reenable':
            self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
            self.generate_event_report_data()
            # self.get_toast_message()
            self.check_generate_successful()
            return

        self.generate_event_report_data()
        # self.get_toast_message()
        self.check_generate_successful()

    def create_event_reports_with_status_is_dismissed(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
            self.logger.info(f'`generate button is disabled')
        else:
            self.generate_event_report_data()
            self.get_toast_message()
            self.check_generate_successful()
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True)
            self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGN) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGN).get_attribute('disabled') is None:
            self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_ASSIGNED) and self.browser.get_element(self.LCT.EVENT_REPORT_ASSIGNED).is_displayed():
            value = self.browser.get_text(self.LCT.EVENT_REPORT_STATUS)
            if value == 'Ready':
                self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
            elif value == 'Send':
                self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
            elif value == 'Update':
                self.back_to_event_original(is_recall=True)
                self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
                self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS) and 'disabled' in self.browser.get_attribute_value(self.LCT.EVENT_REPORT_STATUS, 'class'):
            self.browser.click(self.LCT.EVENT_REPORT_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_DISMISS, inverse=True)

    def filter_interim_report(self, priority=None, is_click=False, is_cancel=False, is_send=False, is_dismiss=False, is_dismiss_submit=False):
        if priority:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_PRIORITY, inverse=True)
            self.browser.click(self.LCT.INTERIM_PRIORITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.INTERIM_PRIORITY_OPTION)
            self.browser.clicks(self.LCT.INTERIM_PRIORITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == priority.lower(),
                                stop_on_first=True)
        if is_click:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
            self.browser.click(self.LCT.INTERIM_REPORT_STATUS)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
        if is_dismiss:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DISMISS, inverse=True)
            self.browser.click(self.LCT.INTERIM_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DISMISS, inverse=True)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_CANCEL, inverse=True)
            self.browser.click(self.LCT.INTERIM_CANCEL)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
        if is_send:
            if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGN) and self.browser.get_element(self.LCT.INTERIM_ASSIGN).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_SUBMIT, inverse=True)
                self.browser.click(self.LCT.INTERIM_SUBMIT)
                self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
            elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGNED) and self.browser.get_element(self.LCT.INTERIM_ASSIGNED).is_displayed():
                return self
        if is_dismiss_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_SUBMIT, inverse=True)
            self.browser.click(self.LCT.INTERIM_SUBMIT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)

    def create_interim_reports_with_status_is_sent(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
            self.logger.info(f'`generate button is disabled')
        elif self.browser.hover_to(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_text(self.LCT.INTERIM_CHECK_MARKASARTIFACT) == 'Unmark report as artifact' and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).get_attribute('disabled') is None:
            self.browser.click(self.LCT.INTERIM_REPORT_MARKASARTIFACT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
        elif self.browser.hover_to(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_text(self.LCT.INTERIM_CHECK_MARKASARTIFACT) == 'Unmark report as artifact' and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.browser.click(self.LCT.INTERIM_REPORT_MARKASARTIFACT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
        else:
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGN) and self.browser.get_element(self.LCT.INTERIM_ASSIGN).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True, is_interim_click=True)
            self.filter_interim_report(is_click=True, is_send=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGN) and self.browser.get_element(self.LCT.INTERIM_ASSIGN).get_attribute('disabled') is None:
            self.filter_interim_report(is_click=True, is_send=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGNED) and self.browser.get_element(self.LCT.INTERIM_ASSIGNED).is_displayed():
            value = self.browser.get_text(self.LCT.INTERIM_REPORT_STATUS)
            if value == 'Ready':
                self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS)
                self.browser.click(self.LCT.INTERIM_REPORT_STATUS)
                self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
                self.filter_interim_report(is_click=True, is_send=True)
            elif value == 'Send':
                self.filter_interim_report(is_click=True, is_send=True)
            elif value == 'Update':
                self.back_to_event_original(is_recall=True, is_interim_click=True)
                self.filter_interim_report(is_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS) and 'disabled' in self.browser.get_attribute_value(self.LCT.INTERIM_REPORT_STATUS, 'class'):
            self.filter_interim_report(priority='Low', is_click=True)
            self.filter_interim_report(is_click=True, is_send=True)
        else:
            self.filter_interim_report(is_click=True)
            self.filter_interim_report(is_click=True, is_send=True)

    def create_interim_reports_with_status_is_ready(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
            self.logger.info(f'`generate button is disabled')
        elif self.browser.hover_to(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_text(self.LCT.INTERIM_CHECK_MARKASARTIFACT) == 'Unmark report as artifact' and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).get_attribute('disabled') is None:
            self.browser.click(self.LCT.INTERIM_REPORT_MARKASARTIFACT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
        elif self.browser.hover_to(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_text(self.LCT.INTERIM_CHECK_MARKASARTIFACT) == 'Unmark report as artifact' and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.browser.click(self.LCT.INTERIM_REPORT_MARKASARTIFACT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
            self.filter_interim_report(is_click=True)
        else:
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGN) and self.browser.get_element(self.LCT.INTERIM_ASSIGN).get_attribute('disabled') is not None:
            self.back_to_event_original(is_recall=True, is_interim_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGN) and self.browser.get_element(self.LCT.INTERIM_ASSIGN).get_attribute('disabled') is None:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
            self.logger.info(f'`assign button is enabled')
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_ASSIGNED) and self.browser.get_element(self.LCT.INTERIM_ASSIGNED).is_displayed():
            value = self.browser.get_text(self.LCT.INTERIM_REPORT_STATUS)
            if value == 'Ready':
                self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS)
                self.browser.click(self.LCT.INTERIM_REPORT_STATUS)
                self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS, inverse=True)
            elif value == 'Send':
                self.logger.info(f'`the status report is ready')
            elif value == 'Update':
                self.back_to_event_original(is_recall=True, is_interim_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DISMISS) and self.browser.get_text(self.LCT.INTERIM_DISMISS) == 'Reenable':
            self.browser.click(self.LCT.INTERIM_DISMISS)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_DISMISS, inverse=True)
            # if self.browser.hover_to(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_text(self.LCT.INTERIM_CHECK_MARKASARTIFACT) == 'Unmark report as artifact' and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).get_attribute('disabled') is None:
            #     self.browser.click(self.LCT.INTERIM_REPORT_MARKASARTIFACT)
            #     self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
            self.filter_interim_report(priority='Low', is_click=True)
        elif self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS) and 'disabled' in self.browser.get_attribute_value(self.LCT.INTERIM_REPORT_STATUS, 'class'):
            self.filter_interim_report(priority='Low', is_click=True)
        else:
            self.filter_interim_report(is_click=True)

    def get_text_sent_message(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_SENT_MESSAGE, inverse=True)
        return self.browser.get_text(self.LCT.EVENT_REPORT_SENT_MESSAGE)

    def create_ready_interim_reports_for_technician(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
            self.logger.info(f'`generate button is disabled')
        elif self.browser.hover_to(self.LCT.INTERIM_REPORT_MARKASARTIFACT) and self.browser.get_text(self.LCT.INTERIM_CHECK_MARKASARTIFACT) == 'Unmark report as artifact' and self.browser.get_element(self.LCT.INTERIM_REPORT_MARKASARTIFACT).get_attribute('disabled') is None:
            self.browser.click(self.LCT.INTERIM_REPORT_MARKASARTIFACT)
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
            self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_MARKASARTIFACT, inverse=True)
        else:
            self.generate_event_report_data()
            self.check_generate_successful_for_interim_report()
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.INTERIM_REPORT_STATUS) and self.browser.get_element(self.LCT.INTERIM_REPORT_STATUS).is_displayed():
            value = self.browser.get_text(self.LCT.INTERIM_REPORT_STATUS)
            if value == 'Ready':
                self.filter_interim_report(priority='Low', is_click=True)
            elif value == 'Send':
                self.logger.info(f'`the status report is ready')

    def create_ready_event_reports_for_technician(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.EDET_ICON_GENARATE) and self.browser.get_element(self.LCT.EDET_ICON_GENARATE).get_attribute('disabled') is not None:
            self.logger.info(f'`generate button is disabled')
        else:
            self.generate_event_report_data()
            self.get_toast_message()
            self.check_generate_successful()
        # check
        if self.browser.wait_visibility_of_element_located(self.LCT.EVENT_REPORT_STATUS) and self.browser.get_element(self.LCT.EVENT_REPORT_STATUS).is_displayed():
            value = self.browser.get_text(self.LCT.EVENT_REPORT_STATUS)
            if value == 'Ready':
                self.filter_event_report(priority='Low', is_click=True)
            elif value == 'Send':
                self.logger.info(f'`the status report is ready')
