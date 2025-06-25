#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import dashboard as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Dashboard(WebPage):
    """
    Handle Dashboard page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_dashboard(self):
        self.browser.open_page(self.URL + '/dashboard')

    def wait_until_dashboard_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.HEAD_DATA_ROOT)
        self.browser.wait_visibility_of_all_elements_located('class:dashboard-detail-card-wrapper')

    # Dashboard overview

    def get_dashboard_info_overview(self):
        self.wait_until_dashboard_available()
        output = {}
        for content_root in self.browser.get_elements(self.LCT.HEAD_DATA_ROOT):
            header = self.browser.get_text(self.browser.get_child_element(content_root, self.LCT.HEAD_HEADER))
            title = self.browser.get_texts(self.browser.get_child_elements(content_root, self.LCT.HEAD_CONTENT_TITLE))
            value = self.browser.get_texts(self.browser.get_child_elements(content_root, self.LCT.HEAD_CONTENT_VALUE))
            content = {k: v for k, v in zip(title, value)}
            output[header.replace('\n', ' | ')] = content
        return output

    def _on_dashboard_overview_item(self):
        pass

    def view_dashboard_info_details_on(self):
        pass

    def view_active_studies(self):
        self.wait_until_dashboard_available()
        self.browser.click(self.LCT.HEAD_VIEWACTIVESTUDIES)

    def schedule_new_appointment(self):
        self.wait_until_dashboard_available()
        self.browser.click(self.LCT.HEAD_SCHEDULENEWAPPT)

    # Upcoming events

    def get_dashboard_upcoming_events(self):
        data = list()
        self.wait_until_dashboard_available()
        for root in self.browser.get_elements(self.LCT.UPCOMINGEVENTS_DATA_ROOT):
            event = {
                'Booking time': self.browser.get_text(self.browser.get_child_element(
                    root, self.LCT.UPCOMINGEVENTS_DATA_BKTIME)),
                'Reason for visit': self.browser.get_text(self.browser.get_child_element(
                    root, self.LCT.UPCOMINGEVENTS_DATA_REASON)),
                'Event type': self.browser.get_text(self.browser.get_child_element(
                    root, self.LCT.UPCOMINGEVENTS_DATA_STATUS)),
                'Patient name': self.browser.get_text(self.browser.get_child_element(
                    root, self.LCT.UPCOMINGEVENTS_DATA_PATIENTNAME)),
                'Care plan ID': self.browser.get_text(
                    self.browser.get_child_element(root, self.LCT.UPCOMINGEVENTS_DATA_CAREPLANID)).replace(
                    'Care plan ID:', '').strip() if self.browser.get_child_element(
                    root, self.LCT.UPCOMINGEVENTS_DATA_CAREPLANID) else ''
            }

            data.append(event)
        return data

    def go_to_calendar_page(self):
        self.wait_until_dashboard_available()
        self.browser.click(self.LCT.UPCOMINGEVENTS_GOTOCALENDAR)

    def _on_upcoming_event_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        events = self.get_dashboard_upcoming_events()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for index, event in enumerate(events):
            _event = {k.replace(' ', '_').lower(): v for k, v in event.items()}
            if _on.items() <= _event.items():
                return index
        raise Exception(f'No such event exist on `{_on}`.')

    def view_dashboard_upcoming_event_details_on(self, **on):
        index = self._on_upcoming_event_item(**on)
        self.wait_until_dashboard_available()
        self.browser.clicks(self.LCT.UPCOMINGEVENTS_DATA_ROOT, on_elements=lambda i, _: i == index, stop_on_first=True)

    def view_dashboard_upcoming_events_appointment_summary_on(self, **on):
        index = self._on_upcoming_event_item(**on)
        self.wait_until_dashboard_available()
        self.browser.clicks(self.LCT.UPCOMINGEVENTS_DATA_PATIENTNAME, on_elements=lambda i, e: i == index,
                            stop_on_first=True)

    # Notification reports

    def get_dashboard_notification_reports(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NOTIF_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NOTIF_CONTENT)
        header = self.browser.get_texts(self.LCT.NOTIF_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.NOTIF_CONTENT, row=row)

    def go_to_notification_reports_page(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NOTIF_GOTONOTIF)
        self.browser.click(self.LCT.NOTIF_GOTONOTIF)

    def _on_notification_reports_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_reports = self.get_dashboard_notification_reports()
        _on = {k.replace(' ', '_').lower(): v.lower() for k, v in on.items()}
        for i, row in enumerate(all_reports):
            _row = {k.replace(' ', '_').lower(): v.lower() for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such notification report exist under `{on}`')

    def view_dashboard_notification_report_details_on(self, **on):
        _index = self._on_notification_reports_item(**on)
        self.browser.clicks(self.LCT.NOTIF_CONTENTS_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def view_dashboard_notification_reports_appointment_summary_on(self, **on):
        _index = self._on_notification_reports_item(**on)
        self.browser.clicks(self.LCT.NOTIF_CONTENTS_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def see_more_dashboard_notification_reports(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NOTIF_SEEMORE)
        self.browser.click(self.LCT.NOTIF_SEEMORE)
