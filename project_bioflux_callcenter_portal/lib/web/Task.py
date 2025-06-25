#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import task as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Task(WebPage):
    """
    Handle task page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_task(self):
        self.browser.open_page(self.URL + '/task')

    def wait_unassigned_task_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UNASSIGNED_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UNASSIGNED_CONTENT, inverse=True)

    def wait_assigned_task_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSIGNED_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSIGNED_CONTENT, inverse=True)

    def toggle_qa_team_field(self, expand_or_collapse):
        if expand_or_collapse.lower() == 'expand':
            for _ in range(2):  # Expand field
                if '--collapse' not in self.browser.get_attribute_value(
                        self.LCT.QATEAM_EXPANDORCOLLAPSE + '/..', 'class'):
                    break
                self.browser.click(self.LCT.QATEAM_EXPANDORCOLLAPSE)
        if expand_or_collapse.lower() == 'collapse':
            for _ in range(2):  # Collapse field
                if '--collapse' in self.browser.get_attribute_value(self.LCT.QATEAM_EXPANDORCOLLAPSE + '/..', 'class'):
                    break
                self.browser.click(self.LCT.QATEAM_EXPANDORCOLLAPSE)

    def get_qa_team_members(self):
        self.toggle_qa_team_field(expand_or_collapse='expand')
        output = list()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.QATEAM_CONTENT_ROOT)
        for root_elem in self.browser.get_elements(self.LCT.QATEAM_CONTENT_ROOT):
            # Get data and append into dict
            qa_info = {
                'Name': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.QATEAM_CONTENT_QANAME)),
                'Schedule': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.QATEAM_CONTENT_TIME)),
                'Summary report': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.QATEAM_CONTENT_SUMMARYRP)).replace(
                    '\n', ' | ').replace('done', ' done').replace('assigned', ' assigned'),
                'Notification report': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.QATEAM_CONTENT_NOTIFICATIONRP)).replace('done',
                                                                                                               ' done')
            }
            # reformat and return
            output.append(qa_info)
        return output

    def get_team_members_assign_tasks(self):
        self.toggle_qa_team_field(expand_or_collapse='expand')
        output = list()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UNASSIGNED_ASSIGN_TASK_ROOT)
        for root_elem in self.browser.get_elements(self.LCT.UNASSIGNED_ASSIGN_TASK_ROOT):
            # Get data and append into dict
            qa_info = {
                'Name': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.UNASSIGNED_ASSIGN_TASK_NAME)),
                'Schedule': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.UNASSIGNED_ASSIGN_TASK_TIME)),
                'Summary report': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.UNASSIGNED_ASSIGN_TASK_SUMMARYRP)).replace(
                    '\n', ' | ').replace('done', ' done').replace('assigned', ' assigned'),
                'Notification report': self.browser.get_text(
                    self.browser.get_child_element(root_elem, self.LCT.UNASSIGNED_ASSIGN_TASK_NOTIFICATIONRP)).replace('done', ' done')
            }
            # reformat and return
            output.append(qa_info)
        return output

    def get_current_task_type(self):
        for elem in self.browser.get_elements(self.LCT.TABS + '/a'):
            if 'active' in self.browser.get_attribute_value(elem, 'class'):
                return self.browser.get_text(elem)

    def get_current_report_type(self):
        for elem in self.browser.get_elements(self.LCT.REPORTTYPES):
            if '--active' in self.browser.get_attribute_value(elem, 'class'):
                return self.browser.get_text(elem).replace('\n', ' | ')

    def filter_task(self, task_type=None, facility=None, by_report=None, by_report_type=None):
        if task_type:
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS) and self.browser.get_elements(self.LCT.TABS)[0].is_displayed():
                    self.browser.clicks(self.LCT.TABS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower() == task_type.lower(),
                                        stop_on_first=True)
                    break
                elif time.time() - start_time > 1 * 60:
                    self.logger.info('waiting over 1 minute')
                    break

        if facility:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_INPUT, inverse=True)
            self.browser.input_text(self.LCT.FACILITY_INPUT, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if by_report:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORTTYPES, inverse=True)
            self.browser.clicks(self.LCT.REPORTTYPES,
                                on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(by_report.lower()),
                                stop_on_first=True)
        if by_report_type:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.TASK_REPORT_TYPE)
            self.browser.click(self.LCT.TASK_REPORT_TYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.TASK_REPORT_TYPE_OPTION, inverse=True)
            self.browser.clicks(self.LCT.TASK_REPORT_TYPE_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_report_type.lower(),
                                stop_on_first=True)
        # wait_func = {
        #     'unassigned': self.wait_unassigned_task_available,
        #     'assigned': self.wait_assigned_task_available
        # }
        # wait_func[task_type.lower()]()

    def get_task_current_filter_values(self):
        output = {
            'Facility': self.browser.get_text(self.LCT.FACILITY_INPUT + '/../../..'),
            'Task Type': self.get_current_task_type(),
            'Report Type': self.get_current_report_type() if self.browser.wait_visibility_of_all_elements_located(
                self.LCT.REPORTTYPES) else None,
        }
        return output

    # Overview
    def wait_overview_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.OVERVIEW_BODY) and self.browser.get_element(self.LCT.OVERVIEW_BODY).is_displayed():
                break
            elif time.time() - start_time > 1 * 60:
                self.logger.info('waiting over 1 minute')
                break

    def get_overview_task(self):  # TBD
        pass

    # Unassigned

    def sort_unassigned_task(self, field, asc_or_desc):
        field_index = dict()
        if self.get_current_report_type().lower().startswith('notification reports'):
            field_index.update({
                'study id': 0,
                'study type': 1,
                'priority': 3
            })
        if self.get_current_report_type().lower().startswith('interim reports'):
            field_index.update({
                'study id': 0,
                'report id': 1,
                'study type': 2,
                'creation time': 4
            })
        if self.get_current_report_type().lower().startswith('end of use reports'):
            field_index.update({
                'study id': 0,
                'study type': 1,
                'creation time': 3
            })
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UNASSIGNED_HEADER)
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.UNASSIGNED_HEADER)[field_index[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_unassigned_task_available()

    def get_unassigned_task(self, row=None):
        self.wait_unassigned_task_available()
        output_1 = []
        output_2 = []
        while True:
            if len(self.browser.get_texts(self.LCT.UNASSIGNED_CONTENT_ROW)) == 10:
                headers = self.browser.get_texts(self.LCT.UNASSIGNED_HEADER)
                contents = self.browser.get_texts(self.LCT.UNASSIGNED_CONTENT)
                output_1 += Utils.group_tabular_data(headers, contents, row=row)
                if self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT) and self.browser.get_element(self.LCT.PGN_NEXT).is_displayed():
                    self.browser.js_click(self.LCT.PGN_NEXT)
                else:
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
            else:
                headers = self.browser.get_texts(self.LCT.UNASSIGNED_HEADER)
                contents = self.browser.get_texts(self.LCT.UNASSIGNED_CONTENT)
                output_2 += Utils.group_tabular_data(headers, contents, row=row)
                output = output_1 + output_2
                self.logger.info(output)
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_unassigned_task_on_page(self, row=None):
        self.wait_unassigned_task_available()
        output = []
        headers = self.browser.get_texts(self.LCT.UNASSIGNED_HEADER)
        contents = self.browser.get_texts(self.LCT.UNASSIGNED_CONTENT)
        output += Utils.group_tabular_data(headers, contents, row=row)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_unassigned_task_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_unassigned_task_available()
        all_data = self.get_unassigned_task()
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        for i, row in enumerate(all_data):
            _row = {key.replace(' ', '_').lower(): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such unassigned task exist on `{_on}`.')

    def toggle_unassigned_task_checkbox(self, is_toggle=True):
        self.browser.toggle_checkbox(self.LCT.UNASSIGNED_CONTENT_CHECKBOXES, self.LCT.UNASSIGNED_CONTENT_CHECKBOXES,
                                     is_toggle)

    def view_unassigned_task_study_information_on(self, **on):
        _index = self._on_unassigned_task_item(**on)
        self.wait_unassigned_task_available()
        self.browser.clicks(self.LCT.UNASSIGNED_STUDY_ID,
                            on_elements=lambda i, _: i == _index, stop_on_first=True)
        time.sleep(10)

    def view_unassigned_task_patient_details_on(self, **on):
        _index = self._on_unassigned_task_item(**on)
        self.wait_unassigned_task_available()
        self.browser.clicks(self.LCT.UNASSIGNED_PATIENT_NAME,
                            on_elements=lambda i, _: i == _index, stop_on_first=True)

    def assign_unassigned_task_on(self, assignee=None, row=None, is_assignee=True):
        self.wait_unassigned_task_available()
        _on = [s.strip() for s in row.split(',')] if isinstance(row, str) else row  # str|list
        output = []
        if assignee:
            if 'all' in row.lower():  # assign all
                self.wait_unassigned_task_available()
                self.browser.click(self.LCT.UNASSIGNED_HEADER_CHECKBOX + '/..')
                self.browser.click(self.LCT.UNASSIGNED_ASSIGN)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSSIGNTASKS_OPTIONS, timeout=10)
                if is_assignee:
                    self.browser.clicks(self.LCT.ASSSIGNTASKS_OPTIONS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                            assignee.lower()), stop_on_first=True)
                    self.browser.wait_visibility_of_all_elements_located(self.LCT.UNASSIGNED_CONTENT_ROW, inverse=True)
            else:
                self.wait_unassigned_task_available()
                for _row in _on:
                    _index = self._on_unassigned_task_item(row=_row)
                    self.wait_unassigned_task_available()
                    _row_elem = self.browser.get_elements_by_condition(
                        self.LCT.UNASSIGNED_CONTENT_ROW, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
                    self.browser.hover_to(_row_elem)
                    output.append({
                        "Study ID": self.browser.get_text(_row_elem).split('\n')[0]
                    })
                    self.browser.clicks(self.LCT.UNASSIGNED_CONTENT_CHECKBOXES, on_elements=lambda index, _: index == _index,
                                        stop_on_first=True)
                self.browser.wait_visibility_of_element_located(self.LCT.UNASSIGNED_ASSIGN)
                self.browser.click(self.LCT.UNASSIGNED_ASSIGN)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSSIGNTASKS_OPTIONS, timeout=10)
                if is_assignee:
                    self.browser.clicks(self.LCT.ASSSIGNTASKS_OPTIONS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                            assignee.lower()), stop_on_first=True)
                    self.browser.wait_visibility_of_all_elements_located(self.LCT.UNASSIGNED_CONTENT_ROW, inverse=True)
        return output
        # Assigned

    def assign_to_me_ready_interim_reports_by(self, assignee=None, **on):
        if assignee:
            _index = self._on_unassigned_task_item(**on)
            row_index = self.browser.get_elements_by_condition(self.LCT.UNASSIGNED_CONTENT_ROW,
                                                               on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
            self.browser.hover_to(row_index)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSIGN_BUTTON, inverse=True)
            self.browser.clicks(self.LCT.ASSIGN_BUTTON, on_elements=lambda index, _: index == _index,
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSSIGNTASKS_OPTIONS, timeout=10)
            self.browser.clicks(self.LCT.ASSSIGNTASKS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                    assignee.lower()), stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UNASSIGNED_CONTENT_ROW, inverse=True)

    def sort_assigned_task(self, field, asc_or_desc):
        field_index = dict()
        if self.get_current_report_type().lower().startswith('notification reports'):
            field_index.update({
                'study id': 0,
                'study type': 1,
                'priority': 3
            })
        if self.get_current_report_type().lower().startswith('interim reports'):
            field_index.update({
                'study id': 0,
                'report id': 1,
                'study type': 2,
                'creation time': 4
            })
        if self.get_current_report_type().lower().startswith('end of use reports'):
            field_index.update({
                'study id': 0,
                'study type': 1,
                'creation time': 3
            })
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSIGNED_HEADER)
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.ASSIGNED_HEADER)[field_index[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)
        self.wait_assigned_task_available()

    def get_assigned_task(self, row=None):
        self.wait_assigned_task_available()
        output_1 = []
        output_2 = []
        while True:
            if len(self.browser.get_texts(self.LCT.ASSIGNED_CONTENT_ROW)) == 10:
                headers = self.browser.get_texts(self.LCT.ASSIGNED_HEADER)
                contents = self.browser.get_texts(self.LCT.ASSIGNED_CONTENT)
                output_1 += Utils.group_tabular_data(headers, contents, row=row)
                if self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT) and self.browser.get_element(self.LCT.PGN_NEXT).is_displayed():
                    self.browser.js_click(self.LCT.PGN_NEXT)
                else:
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
            else:
                headers = self.browser.get_texts(self.LCT.ASSIGNED_HEADER)
                contents = self.browser.get_texts(self.LCT.ASSIGNED_CONTENT)
                output_2 += Utils.group_tabular_data(headers, contents, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_assigned_task_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        all_data = self.get_assigned_task()
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        for i, row in enumerate(all_data):
            _row = {key.replace(' ', '_'): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such assigned task exist on `{_on}`.')

    def view_assigned_task_study_information_on(self, **on):
        _index = self._on_assigned_task_item(**on)
        self.wait_assigned_task_available()
        self.browser.clicks(self.LCT.ASSIGNED_STUDY_ID,
                            on_elements=lambda i, _: i == _index, stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.ASSIGNED_STUDY_ID, inverse=True)

    def view_assigned_task_patient_details_on(self, **on):
        _index = self._on_assigned_task_item(**on)
        self.wait_unassigned_task_available()
        self.browser.clicks(self.LCT.ASSIGNED_PATIENT_NAME,
                            on_elements=lambda i, _: i == _index, stop_on_first=True)

    def change_assignee_assigned_task_on(self, assignee=None, **on):
        output = []
        _index = self._on_assigned_task_item(**on)
        self.wait_unassigned_task_available()
        _row_elem = self.browser.get_elements_by_condition(
                    self.LCT.ASSIGNED_CONTENT_ROW, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
        self.browser.hover_to(_row_elem)
        output.append({
            "Study ID": self.browser.get_text(_row_elem).split('\n')[0]
        })
        self.browser.clicks(self.LCT.ASSIGNED_CONTENT + '//div[@class="username"]',
                            on_elements=lambda i, _: i == _index, stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSIGNED_CONTENT_ASSIGNEE)
        self.browser.clicks(self.LCT.ASSIGNED_CONTENT_ASSIGNEE,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == assignee.lower(),
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASSIGNED_CONTENT_ASSIGNEE, inverse=True)
        return output

    def unassign_assigned_task_on(self, is_unassign=True, row=None):
        _on = [s.strip() for s in row.split(',')] if isinstance(row, str) else row  # str|list
        output = []
        if 'all' in row.lower():
            self.browser.wait_visibility_of_element_located(self.LCT.ASSIGNED_HEADER_CHECKBOX, inverse=True)
            self.browser.click(self.LCT.ASSIGNED_HEADER_CHECKBOX + '/..')
            self.browser.wait_visibility_of_element_located(self.LCT.ASSIGNED_UNASSIGN, inverse=True)
            self.browser.click(self.LCT.ASSIGNED_UNASSIGN)
        else:
            self.wait_assigned_task_available()
            for _row in _on:
                _index = self._on_assigned_task_item(row=_row)
                self.wait_assigned_task_available()
                _row_elem = self.browser.get_elements_by_condition(
                    self.LCT.ASSIGNED_CONTENT_ROW, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
                self.browser.hover_to(_row_elem)
                output.append({
                    "Study ID": self.browser.get_text(_row_elem).split('\n')[0]
                })
                self.browser.clicks(self.LCT.UNASSIGNED_CONTENT_CHECKBOXES, on_elements=lambda index, _: index == _index,
                                    stop_on_first=True)
            self.browser.wait_visibility_of_element_located(self.LCT.ASSIGNED_UNASSIGN, inverse=True)
            self.browser.click(self.LCT.ASSIGNED_UNASSIGN)
            self.wait_assigned_task_available()
        if is_unassign:  # Confirm unassign
            self.browser.wait_visibility_of_element_located(self.LCT.ASSIGNED_UNASSIGN_CONFIRM, inverse=True)  # confirm dialog
            self.browser.click(self.LCT.ASSIGNED_UNASSIGN_CONFIRM)
        if not is_unassign:
            self.browser.wait_visibility_of_element_located(self.LCT.ASSIGNED_UNASSIGN_CANCEL, inverse=True)
            self.browser.click(self.LCT.ASSIGNED_UNASSIGN_CANCEL)
        self.wait_assigned_task_available()
        return output
