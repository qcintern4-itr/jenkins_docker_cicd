#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import patient_details as locators
    from project_cardiac_portal.lib.web.Common import Common
    from corelib import Utils
    from selenium.webdriver import Keys
    import calendar
    import re
    import os

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class PatientDetails(WebPage):
    """
    Handle Patient Details page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def get_patient_details_available_tabs(self):
        """
        Get all present/available tabs in patient details page
        :return: (list) names of all present/available tabs
        """
        self.browser.wait_presence_of_all_elements_located(self.LCT.TABS)
        # Some hidden tabs may not be displayed/visible, use execute_script instead of get_texts
        return [self.browser.execute_script('return arguments[0].textContent', e)
                for e in self.browser.get_elements(self.LCT.TABS)]

    def navigate_to_patient_details_tab(self, tab):
        """
        Navigate to right side tab of patient details page
        :param tab: (str)
        :return: None
        """
        self.browser.wait_visibility_of_any_elements_located(self.LCT.TABS)
        # Some tabs may be hidden, so use js click and textContent
        self.browser.js_clicks(
            self.LCT.TABS,
            on_elements=lambda _, e: self.browser.execute_script('return arguments[0].textContent', e).strip() == tab,
            stop_on_first=True
        )

    def get_patient_details_current_tab(self):
        """
        Get current tab on patient details
        @return: (str) current tab
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        output = ''
        for element in self.browser.get_elements(self.LCT.TABS + '/..'):
            if self.browser.get_attribute_value(element, 'aria-selected') == 'true':
                output = self.browser.get_text(element)
        return output

    def get_patient_details_common(self):
        """
        Get patient details common info (left-hand side)
        :return: (dict)
        """
        output = dict()
        # Top Info (title) and Middle Info
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_TOPINFO)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_MIDINFO_DATA)
        top_mid_data = self.browser.get_texts(self.LCT.COMMON_TOPINFO)
        top_mid_data += self.browser.get_texts(self.LCT.COMMON_MIDINFO_DATA)
        output.update({data.split('\n')[0]: '\n'.join(data.split('\n')[1:]) for data in top_mid_data})
        # Clinic and Care givers
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_REGCLINIC_CAREGIVERS_DATA)
        clinic_givers_data = self.browser.get_texts(self.LCT.COMMON_REGCLINIC_CAREGIVERS_DATA)
        output.update({clinic_givers_data[i]: clinic_givers_data[i + 1]
                       for i in range(len(clinic_givers_data)) if i % 2 == 0})
        # Return format output
        return [{k.replace('\nEdit', ''): re.sub('\n--\n|\n', ', ', v).replace('\n--', '') for k, v in output.items()}]

    def get_initial_intake_info_allergies(self):
        self.browser.wait_visibility_of_element_located(self.LCT.INITINTAKE_ALLERGIES_DATA_CONTENT)
        return self.browser.get_tabular_data(['Allergies'], self.LCT.INITINTAKE_ALLERGIES_DATA_CONTENT, row=1)

    def get_initial_intake_info_general_cardiac_history(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INITINTAKE_CARDIACHISTORY_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INITINTAKE_CARDIACHISTORY_DATA_CONTENT)
        header = self.browser.get_texts(self.LCT.INITINTAKE_CARDIACHISTORY_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.INITINTAKE_CARDIACHISTORY_DATA_CONTENT, row=1)

    def get_patient_details_initial_intake_info(self):
        """
        Get Initial Intake info
        :return: (str)
        """
        self.navigate_to_patient_details_tab('Initial intake info')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INITINTAKE_DATA + '/div')
        return self.browser.get_text(self.LCT.INITINTAKE_DATA)

    def get_patient_details_baseline_info(self):
        """
        Get Baseline info
        :return: (str)
        """
        self.navigate_to_patient_details_tab('Baseline info')
        self.browser.wait_visibility_of_all_elements_located(
            self.LCT.BASELINE_DATA + '/div//div[contains(@class, "display-data") and contains (@class, "item")]')
        return self.browser.get_text(self.LCT.BASELINE_DATA)

    def get_patient_details_care_plan(self):
        """
        Get Care plan info
        :return: (dict)
        """
        self.navigate_to_patient_details_tab('Care plan')
        output = dict()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        # Overview
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Overview',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_OVERVIEW + '/div')
        output['Overview'] = self.browser.get_text(self.LCT.CAREPLAN_MENU_OVERVIEW)
        # Conditions information
        self.browser.clicks(self.LCT.CAREPLAN_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Conditions information',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_CONDINFO + '/div')
        output['Conditions information'] = self.browser.get_text(self.LCT.CAREPLAN_MENU_CONDINFO)
        # Medication Active
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Active',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(
            self.LCT.CAREPLAN_MENU_MED_ACTIVE + '//div[contains(@class, "medications")]', timeout=3)
        output['Medication Active'] = self.browser.get_text(self.LCT.CAREPLAN_MENU_MED_ACTIVE)
        # Medication Inactive
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Inactive',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(
            self.LCT.CAREPLAN_MENU_MED_INACTIVE + '//div[contains(@class, "medications")]', timeout=3)
        output['Medication Inactive'] = self.browser.get_text(self.LCT.CAREPLAN_MENU_MED_INACTIVE)
        # Quality of life
        self.browser.clicks(self.LCT.CAREPLAN_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Quality of life',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(
            self.LCT.CAREPLAN_MENU_QOL + '//div[contains(@class, "ant-collapse")]', timeout=3)
        output['Quality of life'] = self.browser.get_text(self.LCT.CAREPLAN_MENU_QOL)
        # Report settings
        self.browser.clicks(self.LCT.CAREPLAN_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Report settings',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(
            self.LCT.CAREPLAN_MENU_RPSETTINGS + '//div[contains(@class, "data-item")]', timeout=3)
        output['Report settings'] = self.browser.get_text(self.LCT.CAREPLAN_MENU_RPSETTINGS)
        # Return
        return [{k: v.replace('\n', ', ') for k, v in output.items()}]

    def get_care_plan_overview(self):
        self.navigate_to_patient_details_tab('Care plan')
        # Overview - Maybe invisible, so perform js click
        self.browser.js_clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Overview',
                               stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_OVERVIEW + '/div//div')
        output = self.browser.get_texts(self.LCT.CAREPLAN_MENU_OVERVIEW + '/div')
        # Reformat and output
        return {line.split('\n')[0]: line.split('\n')[1:] for line in output}

    def get_care_plan_conditions_information(self):
        head = ['Baseline conditions'] + ['Conditions being monitored']
        self.browser.clicks(self.LCT.CAREPLAN_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Conditions information',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_CONDINFO +
                                                             '//div[contains(@class,"baseline-conditions-table-item")]')
        _head_selected = self.browser.get_texts(self.LCT.CAREPLAN_MENU_CONDINFO +
                                                '//div[contains(@class, "left-item")]')
        _content_selected = self.browser.get_texts(self.LCT.CAREPLAN_MENU_CONDINFO +
                                                   '//div[contains(@class, "right-item")]')
        items_list = self.browser.get_texts(self.LCT.CAREPLAN_MENU_CONDINFO +
                                            '//div[contains(@class,"baseline-conditions-table-item")]')
        content = [items_list] + [self.browser.get_tabular_data(_head_selected, self.LCT.CAREPLAN_MENU_CONDINFO +
                                                                '//div[contains(@class, "right-item")]', row=1)]
        return Utils.group_tabular_data(head, content, row=1)

    def get_care_plan_active_medications(self):
        # Get active medications prescribed, others TDB
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Active',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_ROOT)
        output = list()
        for root_element in self.browser.get_elements(self.LCT.MEDICATIONACT_ROOT):
            header = ['Medication'] + self.browser.get_texts(self.browser.get_child_elements(
                root_element, self.LCT.MEDICATIONACT_HEADER))
            content = [self.browser.get_text(self.browser.get_child_element(
                root_element, self.LCT.MEDICATIONACT_MEDICATION_HEAD))] + self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.MEDICATIONACT_CONTENT))
            output.append({k.replace(':', ''): v for k, v in zip(header, content)})
        return output

    def get_care_plan_archived_medications(self):
        # Get archived medications prescribed, others TDB
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Active',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_ARCHIVE_ROOT)
        output = list()
        for root_element in self.browser.get_elements(self.LCT.MEDICATIONACT_ARCHIVE_ROOT):
            header = ['Medication'] + self.browser.get_texts(self.browser.get_child_elements(
                root_element, self.LCT.MEDICATIONACT_ARCHIVE_HEADER))
            content = [self.browser.get_text(self.browser.get_child_element(
                root_element, self.LCT.MEDICATIONACT_ARCHIVE_MEDICATIONHEAD))] + self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.MEDICATIONACT_ARCHIVE_CONTENT))
            output.append({k.replace(':', ''): v for k, v in zip(header, content)})
        return output

    def get_care_plan_inactive_medications(self):
        # Get inactive medications prescribed, others TDB
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Inactive',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONINACT_ROOT)
        output = list()
        for root_element in self.browser.get_elements(self.LCT.MEDICATIONINACT_ROOT):
            header = ['Medication'] + self.browser.get_texts(self.browser.get_child_elements(
                root_element, self.LCT.MEDICATIONINACT_HEADER))
            content = [self.browser.get_text(self.browser.get_child_element(
                root_element, self.LCT.MEDICATIONINACT_MEDICATION_HEAD))] + self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.MEDICATIONINACT_CONTENT))
            output.append({k.replace(':', ''): v for k, v in zip(header, content)})
        return output

    def get_patient_details_medical_test_results(self):
        """
        Get Medical test results info
        :return: (dict)
        """
        self.navigate_to_patient_details_tab('Medical test results')
        output = dict()
        for element_menu in self.browser.get_elements(self.LCT.MEDTESTRES_MENU):
            self.browser.js_click(element_menu)  # some tab maybe invisible, so perform js click
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')
            output[self.browser.get_text(element_menu)] = self.browser.get_text(
                self.LCT.MEDTESTRES_MENU_SAMPLEINFO).replace('\n', ' | ')
        return output

    def get_patient_details_heart_monitor(self):
        """
        Get Heart monitor
        :return: (dict)
        """
        self.navigate_to_patient_details_tab('Heart monitor')
        output = dict()
        for element_menu in self.browser.get_elements(self.LCT.HEARTMON_MENU):
            text_menu = self.browser.get_text(element_menu)
            self.browser.click(element_menu)
            self.browser.wait_visibility_of_all_elements_located(
                self.LCT.HEARTMON_MENU_SAMPLEINFO + f'//div[contains(@class, "{text_menu.lower().split()[0]}")]',
                timeout=3
            )
            output[text_menu] = self.browser.get_text(self.LCT.HEARTMON_MENU_SAMPLEINFO)
        return output

    def get_patient_details_heart_monitor_current_study(self):
        """
        Get heart monitor current study
        :return: (str)
        """
        self.browser.clicks(self.LCT.HEARTMON_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Current study', stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.HEARTMON_MENU_SAMPLEINFO + '/div')
        return self.browser.get_text(self.LCT.HEARTMON_MENU_SAMPLEINFO).replace('\n', ' | ')

    def get_patient_details_reports(self, report_id_search=None, by_notif_report_status=None,
                                    by_monthly_report_status=None):
        """
        Get Reports
        :param report_id_search: (str)
        :param by_notif_report_status: (str)
        :param by_monthly_report_status: (str)
        :return:
        """
        self.navigate_to_patient_details_tab('Reports')
        output = dict()
        # On-demand reports
        self.browser.clicks(self.LCT.REPORTS_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'On-demand reports',
                            stop_on_first=True)
        if report_id_search:
            self.browser.input_text(self.LCT.REPORTS_MENU_ODR_TEXTSEARCH, report_id_search)
        self.browser.wait_presence_of_all_elements_located(self.LCT.REPORTS_MENU_ODR_CONTENT, timeout=3)
        header = self.browser.get_texts(self.LCT.REPORTS_MENU_ODR_HEADER)
        output['On-demand reports'] = self.browser.get_tabular_data(header, self.LCT.REPORTS_MENU_ODR_CONTENT)
        # Notification reports
        self.browser.clicks(self.LCT.REPORTS_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Notification reports',
                            stop_on_first=True)
        if by_notif_report_status:
            self.browser.click(self.LCT.REPORTS_MENU_NR_BYSTATUS)
            self.browser.clicks(self.LCT.REPORTS_MENU_NR_BYSTATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == by_notif_report_status,
                                stop_on_first=True)
        self.browser.wait_presence_of_all_elements_located(self.LCT.REPORTS_MENU_NR_CONTENT, timeout=3)
        header = self.browser.get_texts(self.LCT.REPORTS_MENU_NR_HEADER)
        output['Notification reports'] = self.browser.get_tabular_data(header, self.LCT.REPORTS_MENU_NR_CONTENT)
        # Monthly reports
        self.browser.clicks(self.LCT.REPORTS_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Monthly reports',
                            stop_on_first=True)
        if by_monthly_report_status:
            self.browser.click(self.LCT.REPORTS_MENU_MR_BYSTATUS)
            self.browser.clicks(self.LCT.REPORTS_MENU_MR_BYSTATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == by_monthly_report_status,
                                stop_on_first=True)
        self.browser.wait_presence_of_all_elements_located(self.LCT.REPORTS_MENU_MR_CONTENT, timeout=3)
        header = self.browser.get_texts(self.LCT.REPORTS_MENU_MR_HEADER)
        output['Monthly reports'] = self.browser.get_tabular_data(header, self.LCT.REPORTS_MENU_MR_CONTENT)
        # Return
        return output

    def get_patient_details_time_tracking(self, sort_date=None, filter_by_status=None, row=None):
        """
        Get Time tracking
        :param sort_date: (str) up or down
        :param filter_by_status: (str)
        :param row: (int) row number
        :return: (dict)
        """
        self.navigate_to_patient_details_tab('Time tracking')
        if filter_by_status:
            self.browser.click(self.LCT.TTK_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_STATUS_OPTIONS)
            self.browser.clicks(self.LCT.TTK_STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == filter_by_status.lower(),
                                stop_on_first=True)
        if sort_date:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_HEADER)
            sort_locator = f'xpath://th[1]//span[@aria-label="caret-{sort_date.lower()}"]'
            for _ in range(2):  # max attempts is 2
                if 'active' in self.browser.get_attribute_value(sort_locator, 'class'):
                    break
                self.browser.click(sort_locator + '/../../..')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_CONTENTS)
        header = self.browser.get_texts(self.LCT.TTK_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.TTK_CONTENTS, row=row)

    def get_patient_details_time_tracking_details(self, sort_date=None, *filters):
        """
        Get Time tracking details
        :param sort_date: (str) up or down
        :param filters: (tuple)
        :return: (dict)
        """
        header = []
        content = []
        if filters:
            self.browser.click(self.LCT.TIMETRACK_FILTER)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_FILTER_OPTIONS)
            self.browser.clicks(self.LCT.TIMETRACK_FILTER_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) in filters)
            self.browser.click(self.LCT.TIMETRACK_FILTER)  # close
        if sort_date:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_DATA_HEADER)
            sort_locator = f'xpath://th[1]//span[@aria-label="caret-{sort_date.lower()}"]'
            for _ in range(2):  # max attempts is 2
                if 'active' in self.browser.get_attribute_value(sort_locator, 'class'):
                    break
                self.browser.click(sort_locator + '/../../..')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_DATA_HEADER)
        if self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_DATA_CONTENT, timeout=3):
            output = list()
            output.append(self.browser.get_text(self.LCT.TIMETRACK_TOTALTIME))
            header = self.browser.get_texts(self.LCT.TIMETRACK_DATA_HEADER)
            content = self.browser.get_texts(self.LCT.TIMETRACK_DATA_CONTENT)
        if self.browser.wait_visibility_of_element_located(self.LCT.TIMETRACK_SUPERBILL):  # Super bill
            header += ['Superbill']
            content += [self.browser.get_text(self.LCT.TIMETRACK_SUPERBILL)]
        return Utils.group_tabular_data(header, [c.replace('\n|\n', ', ').replace(':\n', ': ').replace('\n', ', ')
                                                 for c in content])

    def get_patient_details_change_history(self):
        """
        Get Change history
        :return: (list)
        """
        self.navigate_to_patient_details_tab('Change history')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CHANGEHIST_DATA)
        return [log.replace('\n', ', ') for log in self.browser.get_texts(self.LCT.CHANGEHIST_DATA)]

    def get_patient_details_medical_records(self):
        """
        Get Medical records
        :return: (dict)
        """
        self.navigate_to_patient_details_tab('Medical records')
        output = dict()
        for element_menu in self.browser.get_elements(self.LCT.MEDRECORD_MENU):
            self.browser.click(element_menu)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDRECORD_MENU_SAMPLEINFO + '/div/div')
            output[self.browser.get_text(element_menu)] = self.browser.get_text(self.LCT.MEDRECORD_MENU_SAMPLEINFO)
        return output

    def get_patient_details_daily_entry(self, date):
        """

        :param date: (str) `Today` or `yyyy-mm-dd`
        :return: (dict) if data is available, (str) if no data
        """
        self.navigate_to_patient_details_tab('Daily entry')
        self.browser.wait_visibility_of_element_located(self.LCT.DAILYENTRY_DATEITEMS)
        if date.lower() == 'today':
            self.browser.click(self.LCT.DAILYENTRY_TODAY)
        else:
            target_year, target_month = date.split('-')[0:2]
            curr_year = self.browser.get_text(self.LCT.DAILYENTRY_YEAR)
            curr_month = format(list(calendar.month_name).index(self.browser.get_text(self.LCT.DAILYENTRY_MONTH)), '02')
            while not (curr_year == target_year and curr_month == target_month):
                self.browser.click(self.LCT.DAILYENTRY_BACK)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.DAILYENTRY_DATEITEMS)
                curr_year = self.browser.get_text(self.LCT.DAILYENTRY_YEAR)
                curr_month = format(list(calendar.month_name).index(self.browser.get_text(self.LCT.DAILYENTRY_MONTH)),
                                    '02')
        self.browser.clicks(self.LCT.DAILYENTRY_DATEITEMS,
                            on_elements=lambda _, e: self.browser.get_attribute_value(e, 'title') == date,
                            stop_on_first=True)
        if self.browser.wait_visibility_of_any_elements_located(self.LCT.DAILYENTRY_CONTENT):
            header = self.browser.get_texts(self.LCT.DAILYENTRY_HEADER)
            return self.browser.get_tabular_data(header, self.LCT.DAILYENTRY_CONTENT, row=1)
        return self.browser.get_text(self.LCT.DAILYENTRY_CONTENTEMPTY)

    def back_from_patient_details(self):
        # Handle Leave site when logs not be saved
        self.browser.click(self.LCT.BACK)
        if self.browser.wait_visibility_of_element_located(self.LCT.BACK_CONFIRM):
            self.browser.click(self.LCT.BACK_CONFIRM)

    def open_edit_patient_information(self):
        self.browser.js_click(self.LCT.COMMON_EDIT)
        self.browser.wait_invisibility_of_element_located(self.LCT.EDIT_LOADING)

    def edit_insurance_details(self, insurance_name=None, provincial_billing=None, expiration_date=None):
        if insurance_name:
            if self.browser.get_text(self.LCT.EDIT_COUNTRY) == 'United States':
                self.browser.click(self.LCT.EDIT_INSURANCENAMEV2)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.EDIT_INSURANCENAMEV2_OPTIONS)
                self.browser.clicks(self.LCT.EDIT_INSURANCENAMEV2_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == insurance_name.lower(),
                                    stop_on_first=True)
            else:
                self.browser.input_text(self.LCT.EDIT_INSURANCENAMEV1, insurance_name)
        if provincial_billing:
            self.browser.input_text(self.LCT.EDIT_INSURANCEPROVINCIALBILLING, provincial_billing)
        if expiration_date:
            if expiration_date.lower() == 'today':
                self.browser.click(self.LCT.EDIT_INSURANCEEXPIREDATE)
                self.browser.wait_visibility_of_element_located(self.LCT.EDIT_INSURANCEEXPIREDATE_TODAY)
                self.browser.click(self.LCT.EDIT_INSURANCEEXPIREDATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.EDIT_INSURANCEEXPIREDATE, 'readonly')
                self.browser.input_text(self.LCT.EDIT_INSURANCEEXPIREDATE, expiration_date)
                self.browser.get_element(self.LCT.EDIT_INSURANCEEXPIREDATE).send_keys(Keys.ENTER)

    def edit_patient_information(self, email=None, first_name=None, last_name=None, dob=None, gender=None,
                                 phone_number=None, country=None, address=None, city=None, state=None,
                                 zip_code=None, height=None, weight=None, payment_type=None,
                                 insurance_details=None, is_save=True):
        if email:
            self.browser.input_text(self.LCT.EDIT_EMAIL, email)
        if first_name:
            self.browser.input_text(self.LCT.EDIT_FIRSTNAME, first_name)
        if last_name:
            self.browser.input_text(self.LCT.EDIT_LASTNAME, last_name)
        if dob:
            if dob.lower() == 'today':
                self.browser.click(self.LCT.EDIT_DOB)
                self.browser.wait_visibility_of_element_located(self.LCT.EDIT_DOB_TODAY)
                self.browser.click(self.LCT.EDIT_DOB_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.EDIT_DOB, "readonly")
                self.browser.input_text(self.LCT.EDIT_DOB, dob)
                self.browser.get_element(self.LCT.EDIT_DOB).send_keys(Keys.ENTER)
        if gender:
            self.browser.click(self.LCT.EDIT_GENDER)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDIT_GENDER_OPTIONS)
            self.browser.clicks(self.LCT.EDIT_GENDER_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == gender.lower(),
                                stop_on_first=True)
        if phone_number:
            self.browser.input_text(self.LCT.EDIT_PHONENUMBER, phone_number)
        if country:
            self.browser.click(self.LCT.EDIT_COUNTRY + '/..')
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDIT_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.EDIT_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.EDIT_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDIT_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.EDIT_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.EDIT_CITY, city)
        if state:
            self.browser.scroll_into_view(self.LCT.EDIT_PAYMENTTYPE)
            country = self.browser.get_text(self.LCT.EDIT_COUNTRY)
            if country == 'United States' or country == 'Canada':
                self.browser.input_text(self.LCT.EDIT_STATEV2, state)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.EDIT_STATEV2_OPTIONS)
                self.browser.clicks(
                    self.LCT.EDIT_STATEV2_OPTIONS, on_elements=lambda _, e: self.browser.get_attribute_value(
                        e, 'title').lower() == state.lower(), stop_on_first=True)
            else:
                self.browser.input_text(self.LCT.EDIT_STATEV1, state)
        if zip_code:
            self.browser.input_text(self.LCT.EDIT_ZIPCODE, zip_code)
        if height:
            map_measurement = {
                True: ['height (ft, in)', [self.LCT.EDIT_HEIGHT_FT, self.LCT.EDIT_HEIGHT_IN]],
                False: ['height (ft)', [self.LCT.EDIT_HEIGHT_FT]]
            }
            cond = height.endswith('in')
            _height = re.sub('ft|in|,', ' ', height).strip().split()
            [self.browser.input_text(e, text) for e, text in zip(map_measurement[cond][1], _height)]
        if weight:
            map_measurement = {
                True: [self.LCT.EDIT_WEIGHT]
            }
            cond = weight.endswith('lb')
            _weight = weight.replace('lb', '').strip()
            self.browser.input_text(map_measurement[cond][0], _weight)
        if payment_type:
            self.browser.clicks(self.LCT.EDIT_PAYMENTTYPE,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == payment_type.lower(),
                                stop_on_first=True)
        if insurance_details:
            self.edit_insurance_details(**insurance_details) if isinstance(insurance_details, dict) else [
                self.edit_insurance_details(**insurance_detail) for insurance_detail in insurance_details]
        if is_save:
            self.browser.click(self.LCT.EDIT_SAVE)

    def open_create_new_appointment(self):
        """
        Open a new appointment in Patient Details
        :return: None
        """
        # Scroll to the bottom of common patient details side
        self.browser.execute_script(
            "document.querySelector('div.details-page-content-left div.patient-info-body').scrollTop=800")
        self.browser.wait_visibility_of_element_located(self.LCT.COMMON_CREATEAPPOINTMENT)
        self.browser.hover_to(self.LCT.COMMON_CREATEAPPOINTMENT)
        self.browser.click(self.LCT.COMMON_CREATEAPPOINTMENT)

    def delete_care_plan(self, is_delete=True):
        if is_delete:
            self.browser.click(self.LCT.COMMON_DELETECAREPLAN)
            self.browser.wait_visibility_of_element_located(self.LCT.COMMON_DELETECAREPLAN_YES)
            self.browser.click(self.LCT.COMMON_DELETECAREPLAN_YES)

    def assign_nurse(self, nurse):  # nurse only
        self.browser.wait_invisibility_of_element_located('selector:main.ant-layout-content>div.loading-space')
        self.browser.scroll_into_view(self.LCT.COMMON_DELETECAREPLAN)
        self.browser.wait_visibility_of_element_located(self.LCT.COMMON_ASSIGNNURSE)
        self.browser.click(self.LCT.COMMON_ASSIGNNURSE + '/..')
        if nurse.lower() == 'me':
            self.browser.click(self.LCT.AN_ASSIGNTOME)
        else:
            self.browser.input_text(self.LCT.AN_NURSE, nurse)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AN_NURSE_OPTIONS)
            self.browser.get_element(self.LCT.AN_NURSE).send_keys(Keys.ENTER)
            self.browser.click(self.LCT.AN_ASSIGN)
        self.browser.wait_invisibility_of_element_located(self.LCT.COMMON_ASSIGNNURSE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_REGCLINIC_CAREGIVERS_DATA)

    def assign_physician(self, physician):  # nurse only
        self.browser.wait_visibility_of_element_located(self.LCT.COMMON_CAREGIVERS_EDIT)
        self.browser.click(self.LCT.COMMON_ASSIGNPHYSICIAN, is_scroll=True)
        if physician:
            self.browser.input_text(self.LCT.AP_PHYSICIAN, physician)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AP_PHYSICAN_OPTIONS)
            self.browser.get_element(self.LCT.AP_PHYSICIAN).send_keys(Keys.ENTER)
        self.browser.click(self.LCT.AP_ASSIGN)
        self.browser.wait_invisibility_of_element_located(self.LCT.COMMON_ASSIGNPHYSICIAN)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_REGCLINIC_CAREGIVERS_DATA)

    def edit_caregivers(self, nurse=None, physician=None, is_change=True):
        # Scroll to the bottom of common patient details side
        self.browser.execute_script(
            "document.querySelector('div.details-page-content-left div.patient-info-body').scrollTop=800")
        self.browser.wait_visibility_of_element_located(self.LCT.COMMON_CAREGIVERS_EDIT)
        self.browser.click(self.LCT.COMMON_CAREGIVERS_EDIT, is_scroll=True)
        if nurse:
            self.browser.input_text(self.LCT.ECAREGIVERS_NURSE, nurse)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ECAREGIVERS_NURSE_OPTIONS)
            self.browser.get_element(self.LCT.ECAREGIVERS_NURSE).send_keys(Keys.ENTER)
        if physician:
            self.browser.input_text(self.LCT.ECAREGIVERS_PHYSICIAN, physician)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ECAREGIVERS_PHYSICIAN_OPTIONS)
            self.browser.get_element(self.LCT.ECAREGIVERS_PHYSICIAN).send_keys(Keys.ENTER)
        if is_change:
            self.browser.click(self.LCT.ECAREGIVERS_CHANGE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_REGCLINIC_CAREGIVERS_DATA)

    def start_health_care_program(self):
        self.browser.click(self.LCT.COMMON_STARTHEALTHCARE)

    def stop_health_care_program(self, reason=None):
        self.browser.click(self.LCT.COMMON_STOPHEALTHCARE, is_scroll=True)
        if reason:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STOPHC_REASON_OPTIONS)
            self.browser.clicks(self.LCT.STOPHC_REASON_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == reason.lower(),
                                stop_on_first=True)
        self.browser.click(self.LCT.STOPHC_STOP)
        self.browser.wait_invisibility_of_element_located(self.LCT.STOPHC_STOP)

    def resend_reference_code(self):
        self.browser.click(self.LCT.COMMON_RESENDRFCODE)
        self.browser.wait_visibility_of_element_located(self.LCT.RESENDRF_RESEND)
        self.browser.click(self.LCT.RESENDRF_RESEND)

    def reactivate_care_plan(self):
        # Scroll to the bottom of common patient details side
        self.browser.execute_script(
            "document.querySelector('div.details-page-content-left div.patient-info-body').scrollTop=800")
        self.browser.wait_visibility_of_element_located(self.LCT.COMMON_REACTIVATECAREPLAN)
        self.browser.js_click(self.LCT.COMMON_REACTIVATECAREPLAN)
        self.browser.wait_visibility_of_element_located(self.LCT.REACTCP_REACTIVATE)
        self.browser.click(self.LCT.REACTCP_REACTIVATE)
        self.browser.wait_invisibility_of_element_located(self.LCT.REACTCP_REACTIVATE)

    def add_bloodwork(self, frequency=None, unit=None, due_next=None, test_types=None):
        self.browser.wait_visibility_of_all_elements_located(
            'xpath://button[contains(@class, "bloodwork-toggle")]/..//div[contains(@class, "input")]')
        if frequency:
            self.browser.input_text(self.LCT.CPO_BLOODWORK_FREQUENCY, frequency)
        if unit:
            self.browser.input_text(self.LCT.CPO_BLOODWORK_FREQUENCYUNIT, unit)
            self.browser.get_element(self.LCT.CPO_BLOODWORK_FREQUENCYUNIT).send_keys(Keys.ENTER)
        if due_next:
            self.browser.remove_attribute(self.LCT.CPO_BLOODWORK_DUENEXT, 'readonly')
            self.browser.input_text(self.LCT.CPO_BLOODWORK_DUENEXT, due_next)
            self.browser.get_element(self.LCT.CPO_BLOODWORK_DUENEXT).send_keys(Keys.ENTER)
        if test_types:
            _test_types = [ts.strip() for ts in test_types.split(',')] if isinstance(test_types, str) else test_types
            self.browser.click(self.LCT.CPO_BLOODWORK_TESTTYPE)
            for tt in _test_types:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CPO_BLOODWORK_TESTTYPE_OPTIONS)
                self.browser.clicks(self.LCT.CPO_BLOODWORK_TESTTYPE_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == tt.lower(),
                                    stop_on_first=True, is_scroll=True)

    def add_stress_test(self, frequency=None, unit=None, due_next=None):
        if frequency:
            self.browser.input_text(self.LCT.CPO_STRESSTEST_FREQUENCY, frequency)
        if unit:
            self.browser.input_text(self.LCT.CPO_STRESSTEST_FREQUENCYUNIT, unit)
            self.browser.get_element(self.LCT.CPO_STRESSTEST_FREQUENCYUNIT).send_keys(Keys.ENTER)
        if due_next:
            self.browser.remove_attribute(self.LCT.CPO_STRESSTEST_DUENEXT, 'readonly')
            self.browser.input_text(self.LCT.CPO_STRESSTEST_DUENEXT, due_next)
            self.browser.get_element(self.LCT.CPO_STRESSTEST_DUENEXT).send_keys(Keys.ENTER)

    def add_care_plan_overview(self, patient_edu=None, equipments=None, bloodwork=None, stress_test=None,
                               fwu_schedule=None, notes=None, is_add=True):
        self.browser.js_clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Overview',
                               stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.CPO_ADDCAPLANOVERVIEW)
        self.browser.click(self.LCT.CPO_ADDCAPLANOVERVIEW)
        if patient_edu:  # disabled in care plan overview
            pass
        if equipments:
            _equip = [p.strip() for p in equipments.split(',')] if isinstance(equipments, str) else equipments
            for e_check, e_value in zip(self.browser.get_elements(self.LCT.CPO_EQUIPMENT + '//input'),
                                        self.browser.get_elements(self.LCT.CPO_EQUIPMENT)):
                if self.browser.get_text(e_value).lower() not in [e.lower() for e in _equip]:
                    self.browser.toggle_checkbox(e_check, e_value, False)
                else:
                    self.browser.toggle_checkbox(e_check, e_value, True)
        if bloodwork:
            self.browser.js_click(self.LCT.CPO_BLOODWORK)
            self.browser.scroll_into_view(self.LCT.CPO_STRESSTEST)
            if isinstance(bloodwork, dict):
                self.add_bloodwork(**bloodwork)
            if isinstance(bloodwork, list):
                [self.add_bloodwork(**blood) for blood in bloodwork]
        if stress_test:
            self.browser.scroll_into_view(self.LCT.CPO_NOTES)
            self.browser.js_click(self.LCT.CPO_STRESSTEST)
            if isinstance(stress_test, dict):
                self.add_stress_test(**stress_test)
            if isinstance(stress_test, list):
                [self.add_stress_test(**stress) for stress in stress_test]
        if fwu_schedule:
            self.browser.scroll_into_view(self.LCT.CPO_ADD)
            self.browser.input_text(self.LCT.CPO_FWUSCHEDULE, fwu_schedule)
            self.browser.get_element(self.LCT.CPO_FWUSCHEDULE).send_keys(Keys.ENTER)
        if notes:
            self.browser.scroll_into_view(self.LCT.CPO_ADD)
            self.browser.input_text(self.LCT.CPO_NOTES, notes)
        if is_add:
            # Invisible, so perform js click
            self.browser.js_click(self.LCT.CPO_ADD)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_OVERVIEW + '/div//div')
        self.browser.wait_visibility_of_element_located(self.LCT.CPO_EDIT)

    def select_care_plan_conditions_information(self, diagnosed_conditions=None, at_risk_conditions=None):
        self.browser.clicks(self.LCT.CAREPLAN_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Conditions information',
                            stop_on_first=True)
        self.browser.click(self.LCT.CONDITIONINFO_SELECTCONDITION)
        if diagnosed_conditions:
            _conditions = [d.strip() for d in diagnosed_conditions.split(',')] if isinstance(
                diagnosed_conditions, str) else diagnosed_conditions
            self.browser.click(self.LCT.CONDITIONINFO_DIAGNOSED + '/..')
            for con in _conditions:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CONDITIONINFO_DIAGNOSED_OPTIONS)
                self.browser.clicks(self.LCT.CONDITIONINFO_DIAGNOSED_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_attribute_value(
                                        e, 'title').lower() == con.lower(), stop_on_first=True)
            # To handle if dropdown not close
            self.browser.click(self.LCT.CONDITIONINFO_DIAGNOSED + '/..')
            self.browser.wait_invisibility_of_element_located(self.LCT.CONDITIONINFO_DIAGNOSED_OPTIONS + '/../../..')
        if at_risk_conditions:
            _conditions = [con.strip() for con in at_risk_conditions.split(',')] if isinstance(
                at_risk_conditions, str) else at_risk_conditions
            self.browser.click(self.LCT.CONDITIONINFO_AT_RISK + '/..')
            for con in _conditions:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CONDITIONINFO_AT_RISK_OPTIONS)
                self.browser.clicks(self.LCT.CONDITIONINFO_AT_RISK_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_attribute_value(
                                        e, 'title').lower() == con.lower(), stop_on_first=True)
            # to handle if dropdown not close
            self.browser.click(self.LCT.CONDITIONINFO_AT_RISK + '/..')
        self.browser.click(self.LCT.CONDITIONINFO_ADD)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_CONDINFO +
                                                             '//div[contains(@class,"baseline-conditions-table-item")]')

    def open_add_medication_side(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Active',
                            stop_on_first=True)
        # Scroll to the bottom of medication field
        self.browser.execute_script(
            "document.querySelector('div.ant-tabs-tabpane-active.care-plan-change-history-className').scrollTop=700")
        self.browser.wait_visibility_of_element_located(self.LCT.MEDICATIONACT_ADD)
        self.browser.click(self.LCT.MEDICATIONACT_ADD)

    def add_care_plan_active_medications(self, medications, save_changes=True):
        def add_medication(medication, quantity, unit, frequency=None, time_to_take=None, notes=None,
                           save_action='Save'):
            if medication:
                self.browser.input_text(self.LCT.MEDICATIONACT_MEDI, medication)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_MEDI_OPTIONS)
                self.browser.clicks(self.LCT.MEDICATIONACT_MEDI_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == medication.lower(),
                                    stop_on_first=True)
            if quantity:
                self.browser.input_text(self.LCT.MEDICATIONACT_QUANTITY, quantity)
            if unit:
                self.browser.input_text(self.LCT.MEDICATIONACT_QUANTITYUNIT, unit)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_QUANTITYUNIT_OPTIONS)
                self.browser.get_element(self.LCT.MEDICATIONACT_QUANTITYUNIT).send_keys(Keys.ENTER)
            if frequency:
                self.browser.input_text(self.LCT.MEDICATIONACT_FREQUENCY, frequency)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_FREQUENCY_OPTIONS)
                self.browser.clicks(self.LCT.MEDICATIONACT_FREQUENCY_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == frequency.lower(),
                                    stop_on_first=True)
            if time_to_take:
                _time_to_take = [ttt.strip() for ttt in time_to_take.split(',')] if isinstance(time_to_take,
                                                                                               str) else time_to_take
                for e_input, ttt in zip(self.browser.get_elements(self.LCT.MEDICATIONACT_TIMETOTAKE), _time_to_take):
                    self.browser.input_text(e_input, ttt)
                    e_input.send_keys(Keys.ENTER)
            if notes:
                self.browser.input_text(self.LCT.MEDICATIONACT_NOTES, notes)
            if save_action:
                self.browser.clicks(self.LCT.MEDICATIONACT_SAVE_ACTIONS, on_elements=lambda _, e: self.browser.get_text(
                    e).lower() == save_action.lower(), stop_on_first=True)

        # Enter medication info
        if medications:
            add_medication(**medications) if isinstance(medications, dict) else [
                add_medication(**kwarg) for kwarg in medications]
        # final action - save changes
        if save_changes:
            self.browser.click(self.LCT.MEDICATIONACT_SAVECHANGES)

    def _on_active_medication_item(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_CONTENT)
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_care_plan_active_medications()
        data = [{k.replace(' ', '_').lower(): v for k, v in medication.items()}
                for medication in list(data)]
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, medi in enumerate(data):
            if on.items() <= medi.items():
                return i
        raise Exception(f'No such active medication exist under `{_on}`.')

    def _edit_care_plan_medication(self, quantity=None, unit=None, frequency=None, time_to_take=None, notes=None):
        if quantity:
            self.browser.input_text(self.LCT.MEDICATIONACT_QUANTITY, quantity)
        if unit:
            self.browser.input_text(self.LCT.MEDICATIONACT_QUANTITYUNIT, unit)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_QUANTITYUNIT_OPTIONS)
            self.browser.get_element(self.LCT.MEDICATIONACT_QUANTITYUNIT).send_keys(Keys.ENTER)
        if frequency:
            self.browser.input_text(self.LCT.MEDICATIONACT_FREQUENCY, frequency)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_FREQUENCY_OPTIONS)
            self.browser.clicks(self.LCT.MEDICATIONACT_FREQUENCY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == frequency.lower(),
                                stop_on_first=True)
        if time_to_take:
            _time_to_take = [ttt.strip() for ttt in time_to_take.split(',')] if isinstance(time_to_take,
                                                                                           str) else time_to_take
            for e_input, ttt in zip(self.browser.get_elements(self.LCT.MEDICATIONACT_TIMETOTAKE), _time_to_take):
                self.browser.input_text(e_input, ttt)
                e_input.send_keys(Keys.ENTER)
        if notes:
            self.browser.input_text(self.LCT.MEDICATIONACT_NOTES, notes)
        self.browser.click(self.LCT.MEDICATIONACT_SAVE_ACTIONS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_MED_ACTIVE + '/div//div', timeout=3)

    def edit_care_plan_medication_active_on(self, medications, save_changes=True, **on):
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Active',
                            stop_on_first=True)
        self.browser.click(self.LCT.MEDICATIONACT_EDITMEDI)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_CONTENT)
        _index = self._on_active_medication_item(**on)
        self.browser.clicks(self.LCT.MEDICATIONACT_EDIT, on_elements=lambda i, _: i == _index, stop_on_first=True,
                            is_scroll=True)
        if medications:
            self._edit_care_plan_medication(**medications)  # dict
        if save_changes:
            self.browser.click(self.LCT.MEDICATIONACT_SAVECHANGES)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_MED_ACTIVE + '/div//div', timeout=3)

    def archive_care_plan_active_medication_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Active',
                            stop_on_first=True)
        self.browser.click(self.LCT.MEDICATIONACT_EDITMEDI)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_ARCHIVE)
        if 'row' in on and on['row'] == 'all':
            for element in self.browser.get_elements(self.LCT.MEDICATIONACT_ARCHIVE)[::-1]:
                self.browser.wait_visibility_of(element)
                self.browser.js_click(element)  # maybe invisibility so perform js click
        else:
            _index = self._on_active_medication_item(**on)
            self.browser.clicks(self.LCT.MEDICATIONACT_ARCHIVE, on_elements=lambda i, _: i == _index,
                                stop_on_first=True, is_scroll=True)
        self.browser.click(self.LCT.MEDICATIONACT_SAVECHANGES)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU_MED_ACTIVE + '/div//div', timeout=3)

    def _prescribe_care_plan_medication(self, quantity=None, unit=None, frequency=None, time_to_take=None, notes=None):
        if quantity:
            self.browser.input_text(self.LCT.MEDICATIONACT_QUANTITY, quantity)
        if unit:
            self.browser.input_text(self.LCT.MEDICATIONACT_QUANTITYUNIT, unit)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_QUANTITYUNIT_OPTIONS)
            self.browser.get_element(self.LCT.MEDICATIONACT_QUANTITYUNIT).send_keys(Keys.ENTER)
        if frequency:
            self.browser.input_text(self.LCT.MEDICATIONACT_FREQUENCY, frequency)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_FREQUENCY_OPTIONS)
            self.browser.clicks(self.LCT.MEDICATIONACT_FREQUENCY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == frequency.lower(),
                                stop_on_first=True)
        if time_to_take:
            _time_to_take = [ttt.strip() for ttt in time_to_take.split(',')] if isinstance(time_to_take,
                                                                                           str) else time_to_take
            for e_input, ttt in zip(self.browser.get_elements(self.LCT.MEDICATIONACT_TIMETOTAKE), _time_to_take):
                self.browser.input_text(e_input, ttt)
                e_input.send_keys(Keys.ENTER)
        if notes:
            self.browser.input_text(self.LCT.MEDICATIONACT_NOTES, notes)

    def prescribe_care_plan_recently_archived_medication_on(self, medications=None, save_changes=True, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Active',
                            stop_on_first=True)

        def on_item(**_on):
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_ARCHIVE_CONTENT)
            if 'row' in _on:
                return int(_on['row']) - 1
            data = self.get_care_plan_archived_medications()
            _on = {k.replace(' ', '_').lower(): v for k, v in _on.items()}
            for i, medi in enumerate(data):
                _medication = {k.replace(' ', '_').lower(): v for k, v in medi.items()}
                if _on.items() <= _medication.items():
                    return i
            raise Exception(f'No such archived medication exist under `{_on}`.')

        # wait to click edit button
        self.browser.wait_visibility_of_element_located(self.LCT.MEDICATIONACT_EDITMEDI)
        self.browser.click(self.LCT.MEDICATIONACT_EDITMEDI)
        # get index
        _index = on_item(**on)
        self.browser.clicks(self.LCT.MEDICATIONACT_PRESCRIBE, on_elements=lambda i, _: i == _index, stop_on_first=True,
                            is_scroll=True)
        if medications:  # enter medication
            self._prescribe_care_plan_medication(**medications)  # dict
        self.browser.click(self.LCT.MEDICATIONACT_CONFIRMPRESCRIBE)
        if save_changes:
            self.browser.click(self.LCT.MEDICATIONACT_SAVECHANGES)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONACT_ARCHIVE_ROOT +
                                                             '//div[contains(@class, "medication-info")]')

    def _on_inactive_medication_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_care_plan_inactive_medications()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, e in enumerate(data):
            _medication = {k.replace(' ', '_').lower(): v for k, v in e.items()}
            if _on.items() <= _medication.items():
                return i
        raise Exception(f'No such inactive medication exist under `{on}`')

    def delete_care_plan_inactive_medication_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Inactive',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONINACT_DELETE)
        if 'row' in on and on['row'] == 'all':
            for element in self.browser.get_elements(self.LCT.MEDICATIONINACT_DELETE)[::-1]:
                self.browser.wait_visibility_of(element)  # webElement
                self.browser.click(element)
                self.browser.click(self.LCT.MEDICATIONINACT_DELETE_CONFIRM)  # confirm delete
        else:
            # get index
            _index = self._on_inactive_medication_item(**on)
            self.browser.clicks(self.LCT.MEDICATIONINACT_DELETE, on_elements=lambda i, _: i == _index,
                                stop_on_first=True, is_scroll=True)
            self.browser.click(self.LCT.MEDICATIONINACT_DELETE_CONFIRM)  # confirm delete

    def prescribe_care_plan_inactive_medication_on(self, medications=None, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CAREPLAN_MENU)
        self.browser.clicks(self.LCT.CAREPLAN_MENU, on_elements=lambda _, e: self.browser.get_text(e) == 'Inactive',
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONINACT_PRESCRIBE)
        # get index
        _index = self._on_inactive_medication_item(**on)
        self.browser.clicks(self.LCT.MEDICATIONINACT_PRESCRIBE, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        if medications:
            self._prescribe_care_plan_medication(**medications)
        self.browser.click(self.LCT.MEDICATIONACT_CONFIRMPRESCRIBE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDICATIONINACT_ROOT +
                                                             '//div[contains(@class, "medication-info")]')

    # initial intake info tab
    def add_general_cardiac_history(self, current_symptoms=None, past_medicals=None, medications_previously=None,
                                    medications_currently=None, answers=None, is_add=True):
        self.navigate_to_patient_details_tab('Initial intake info')
        self.browser.click(self.LCT.INITINTAKE_CARDIACHISTORY)
        if current_symptoms:
            _symptoms = [s.strip() for s in current_symptoms.split(',')] if isinstance(current_symptoms,
                                                                                       str) else current_symptoms
            self.browser.click(self.LCT.INITINTAKE_CURRENTSYMPTOMS)
            for medical in _symptoms:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.INITINTAKE_CURRENTSYMPTOMS_OPTIONS)
                self.browser.clicks(self.LCT.INITINTAKE_CURRENTSYMPTOMS_OPTIONS, is_scroll=True,
                                    on_elements=lambda _, e: self.browser.execute_script(
                                        'return arguments[0].textContent', e).lower() == medical.lower(),
                                    stop_on_first=True)
        if past_medicals:
            self.browser.wait_presence_of_element_located(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_NO)
            self.browser.scroll_into_view(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_NO)
            _medicals = [p.strip() for p in past_medicals.split(',')] if isinstance(
                past_medicals, str) else past_medicals
            for medical in _medicals:
                self.browser.input_text(self.LCT.INITINTAKE_PASTMEDICAL, medical)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.INITINTAKE_PASTMEDICAL_OPTIONS)
                if medical.lower() in [pm.lower() for pm in self.browser.get_texts(
                        self.LCT.INITINTAKE_PASTMEDICAL_OPTIONS)]:
                    self.browser.clicks(self.LCT.INITINTAKE_PASTMEDICAL_OPTIONS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower() == medical.lower(),
                                        stop_on_first=True)
                else:
                    self.browser.click(self.LCT.INITINTAKE_PASTMEDICAL_OPTIONS + '[1]')
        if medications_previously:
            self.browser.wait_presence_of_element_located(self.LCT.INITINTAKE_MEDICATIONCURRENTLY)
            self.browser.scroll_into_view(self.LCT.INITINTAKE_MEDICATIONCURRENTLY)
            if medications_previously.lower() == 'no':
                self.browser.wait_visibility_of_element_located(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_NO)
                self.browser.toggle_checkbox(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_NO + '//input',
                                             self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_NO, value=True)
            else:
                _pre_medications = [pm.strip() for pm in medications_previously.split(',')] if isinstance(
                    medications_previously, str) else medications_previously
                for medication in _pre_medications:
                    self.browser.input_text(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY, medication)
                    self.browser.wait_visibility_of_all_elements_located(
                        self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_OPTIONS)
                    _actual_pre_medications = [s.lower() for s in
                                               self.browser.get_texts(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_OPTIONS)]
                    if medication.lower() in _actual_pre_medications:
                        self.browser.clicks(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_OPTIONS,
                                            on_elements=lambda _, e: self.browser.get_text(
                                                e).lower() == medication.lower(), is_scroll=True, stop_on_first=True)
                    elif medication.lower() not in _actual_pre_medications:
                        self.browser.click(self.LCT.INITINTAKE_MEDICATIONPREVIOUSLY_OPTIONS + '[1]')
        if medications_currently:
            self.browser.wait_presence_of_element_located(self.LCT.INITINTAKE_ADD)
            self.browser.scroll_into_view(self.LCT.INITINTAKE_ADD)
            if medications_currently.lower() == 'no':
                self.browser.toggle_checkbox(self.LCT.INITINTAKE_MEDICATIONCURRENTLY_NO + '//input',
                                             self.LCT.INITINTAKE_MEDICATIONCURRENTLY_NO, True)
            else:
                _c_medications = [cm.strip() for cm in medications_currently.split(',')] if isinstance(
                    medications_currently, str) else medications_currently
                for medication in _c_medications:
                    self.browser.input_text(self.LCT.INITINTAKE_MEDICATIONCURRENTLY, medication)
                    self.browser.wait_visibility_of_all_elements_located(
                        self.LCT.INITINTAKE_MEDICATIONCURRENTLY_OPTIONS)
                    _actual_c_medications = [cm.lower() for cm in
                                             self.browser.get_texts(self.LCT.INITINTAKE_MEDICATIONCURRENTLY_OPTIONS)]
                    if medication.lower() in _actual_c_medications:
                        self.browser.clicks(self.LCT.INITINTAKE_MEDICATIONCURRENTLY_OPTIONS,
                                            on_elements=lambda _, e: self.browser.get_text(
                                                e).lower() == medication.lower(), is_scroll=True, stop_on_first=True)
                    elif medication.lower() not in _actual_c_medications:
                        self.browser.click(self.LCT.INITINTAKE_MEDICATIONCURRENTLY_OPTIONS + '[1]')
        if answers:
            pass
        if is_add:
            self.browser.click(self.LCT.INITINTAKE_ADD, is_scroll=True)

    def edit_general_cardiac_history(self, del_current_symptoms):
        pass

    def add_patient_allergies(self, answers):
        self.navigate_to_patient_details_tab('Initial intake info')
        self.browser.wait_visibility_of_element_located(self.LCT.INITINTAKE_ALLERGIES)
        self.browser.click(self.LCT.INITINTAKE_ALLERGIES)
        self.browser.input_text(self.LCT.ALLERGIES_ANSWER, answers)
        self.browser.click(self.LCT.ALLERGIES_SAVE)

    def add_quality_of_life(self, answers):
        pass

    # Baseline info tab
    def add_baseline_info_step_1(self, diagnosed_conditions=None, onset_date=None, confirm_via=None, add_more=False,
                                 at_risk_conditions=None, notes=None, is_next=True):
        if diagnosed_conditions:
            self.browser.click(self.LCT.BASELINE_DIAGNOSEDCONDITIONS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BASELINE_DIAGNOSEDCONDITIONS_OPTIONS)
            self.browser.clicks(self.LCT.BASELINE_DIAGNOSEDCONDITIONS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == diagnosed_conditions.lower(), stop_on_first=True)
        if onset_date:
            if onset_date.lower() == 'today':
                self.browser.click(self.LCT.BASELINE_DIAGNOSEDONSETDATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.BASELINE_DIAGNOSEDONSETDATE_TODAY)
                self.browser.click(self.LCT.BASELINE_DIAGNOSEDONSETDATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.BASELINE_DIAGNOSEDONSETDATE, 'readonly')
                self.browser.input_text(self.LCT.BASELINE_DIAGNOSEDONSETDATE, onset_date)
                self.browser.get_element(self.LCT.BASELINE_DIAGNOSEDONSETDATE).send_keys(Keys.ENTER)
        if confirm_via:
            self.browser.click(self.LCT.BASELINE_DIAGNOSEDCONFIRMEDVIA)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BASELINE_DIAGNOSEDCONFIRMEDVIA_OPTIONS)
            self.browser.clicks(self.LCT.BASELINE_DIAGNOSEDCONFIRMEDVIA_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == confirm_via.lower(),
                                stop_on_first=True)
        if add_more:
            pass
        if at_risk_conditions:
            self.browser.scroll_into_view(self.LCT.BASELINE_NEXT)
            _conditions = [con.strip() for con in at_risk_conditions.split(',')] if isinstance(
                at_risk_conditions, str) else at_risk_conditions
            for _con in _conditions:
                self.browser.input_text(self.LCT.BASELINE_RISKCONDITIONS, _con)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.BASELINE_RISKCONDITIONS_OPTIONS)
                if _con in self.browser.get_texts(self.LCT.BASELINE_RISKCONDITIONS_OPTIONS):
                    self.browser.clicks(self.LCT.BASELINE_RISKCONDITIONS_OPTIONS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower() == _con.lower(),
                                        stop_on_first=True)
                else:
                    self.browser.click(self.LCT.BASELINE_RISKCONDITIONS_OPTIONS + '[1]')
        if notes:
            self.browser.input_text(self.LCT.BASELINE_RISKCONDITIONS_NOTES, notes)
        if is_next:
            self.browser.click(self.LCT.BASELINE_NEXT)

    def add_baseline_info_step_2(self, blood_count_date=None, blood_count_summary=None, blood_count_path=None,
                                 function_test_date=None, function_test_summary=None, function_test_path=None,
                                 leads_ecg_date=None, leads_ecg_summary=None, leads_ecg_path=None, is_next=True):
        if blood_count_date:
            if blood_count_date.lower() == 'today':
                self.browser.click(self.LCT.BASELINE_CBC_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.BASELINE_CBC_DATE_TODAY)
                self.browser.click(self.LCT.BASELINE_CBC_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.BASELINE_CBC_DATE, 'readonly')
                self.browser.input_text(self.LCT.BASELINE_CBC_DATE, blood_count_date)
                self.browser.get_element(self.LCT.BASELINE_CBC_DATE).send_keys(Keys.ENTER)
        if blood_count_summary:
            self.browser.input_text(self.LCT.BASELINE_CBC_SUMMARY, blood_count_summary)
        if blood_count_path:
            _file_path = os.path.abspath(blood_count_path)
            if not os.path.isfile(blood_count_path):
                raise Exception(f'Not such file exist under {blood_count_path}')
            self.browser.set_attribute_element(self.LCT.BASELINE_CBC_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.BASELINE_CBC_ATTACHMENT, _file_path, is_clear=False)
        if function_test_date:
            if function_test_date.lower() == 'today':
                self.browser.click(self.LCT.BASELINE_LFT_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.BASELINE_LFT_DATE_TODAY)
                self.browser.click(self.LCT.BASELINE_LFT_DATE_TODAY, is_scroll=True)
            else:
                self.browser.remove_attribute(self.LCT.BASELINE_LFT_DATE, 'readonly')
                self.browser.input_text(self.LCT.BASELINE_LFT_DATE, function_test_date)
                self.browser.get_element(self.LCT.BASELINE_LFT_DATE).send_keys(Keys.ENTER)
        if function_test_summary:
            self.browser.input_text(self.LCT.BASELINE_LFT_SUMMARY, function_test_summary)
        if function_test_path:
            _file_path = os.path.abspath(function_test_path)
            if not os.path.isfile(function_test_path):
                raise Exception(f'Not such file exist under {function_test_path}')
            self.browser.set_attribute_element(self.LCT.BASELINE_LFT_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.BASELINE_LFT_ATTACHMENT, _file_path, is_clear=False)
        if leads_ecg_date:
            if function_test_date.lower() == 'today':
                self.browser.click(self.LCT.BASELINE_LEADS_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.BASELINE_LEADS_DATE_TODAY)
                self.browser.click(self.LCT.BASELINE_LEADS_DATE_TODAY, is_scroll=True)
            else:
                self.browser.remove_attribute(self.LCT.BASELINE_LEADS_DATE, 'readonly')
                self.browser.input_text(self.LCT.BASELINE_LEADS_DATE, function_test_date)
                self.browser.get_element(self.LCT.BASELINE_LEADS_DATE).send_keys(Keys.ENTER)
        if leads_ecg_summary:
            self.browser.input_text(self.LCT.BASELINE_LEADS_SUMMARY, leads_ecg_summary)
        if leads_ecg_path:
            _file_path = os.path.abspath(leads_ecg_path)
            if not os.path.isfile(leads_ecg_path):
                raise Exception(f'Not such file exist under {leads_ecg_path}')
            self.browser.set_attribute_element(self.LCT.BASELINE_LEADS_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.BASELINE_LEADS_ATTACHMENT, _file_path, is_clear=False)
        if is_next:
            self.browser.click(self.LCT.BASELINE_NEXT)

    def add_baseline_info_step_3(self, exercise_testing_date=None, exercise_testing_summary=None,
                                 exercise_testing_path=None, echo_date=None, echo_lvef=None, is_next=True):
        if exercise_testing_date:
            if exercise_testing_date.lower() == 'today':
                self.browser.click(self.LCT.BASELINE_EST_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.BASELINE_EST_DATE_TODAY)
                self.browser.click(self.LCT.BASELINE_EST_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.BASELINE_EST_DATE, 'readonly')
                self.browser.input_text(self.LCT.BASELINE_EST_DATE, exercise_testing_date)
                self.browser.get_element(self.LCT.BASELINE_EST_DATE).send_keys(Keys.ENTER)
        if exercise_testing_summary:
            self.browser.input_text(self.LCT.BASELINE_EST_SUMMARY, exercise_testing_summary)
        if exercise_testing_path:
            _file_path = os.path.abspath(exercise_testing_path)
            if not os.path.isfile(exercise_testing_path):
                raise Exception(f'Not such file exist under {exercise_testing_path}')
            self.browser.set_attribute_element(self.LCT.BASELINE_EST_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.BASELINE_EST_ATTACHMENT, _file_path, is_clear=False)
        if echo_date:
            if echo_date.lower() == 'today':
                self.browser.click(self.LCT.BASELINE_ECHO_DATE)
                self.browser.wait_visibility_of_element_located(self.LCT.BASELINE_EST_DATE)
                self.browser.click(self.LCT.BASELINE_ECHO_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.BASELINE_ECHO_DATE + '//input', 'readonly')
                self.browser.input_text(self.LCT.BASELINE_ECHO_DATE + '//input', echo_date)
                self.browser.get_element(self.LCT.BASELINE_ECHO_DATE + '//input').send_keys(Keys.ENTER)
        if echo_lvef:
            self.browser.input_text(self.LCT.BASELINE_ECHO_LVEF, echo_lvef)
        if is_next:
            self.browser.click(self.LCT.BASELINE_NEXT)

    def add_baseline_info_step_4(self, cha2ds2_vasc_scores=None, is_next=True):
        _scores = [c.strip() for c in cha2ds2_vasc_scores.split(',')] if isinstance(cha2ds2_vasc_scores, str) \
            else cha2ds2_vasc_scores
        for e_checkbox, e_value in zip(self.browser.get_elements(
                self.LCT.BASELINE_VASC_SCORE + '//input'), self.browser.get_elements(self.LCT.BASELINE_VASC_SCORE)):
            if self.browser.get_text(e_value) not in _scores:
                self.browser.toggle_checkbox(e_checkbox, e_value, False)
            else:
                self.browser.toggle_checkbox(e_checkbox, e_value, True)
        if is_next:
            self.browser.click(self.LCT.BASELINE_NEXT)

    def add_baseline_info_step_5(self, has_bled_clinical_characteristic=None, is_next=True):
        _chars = [c.strip() for c in has_bled_clinical_characteristic.split(',')] if isinstance(
            has_bled_clinical_characteristic, str) else has_bled_clinical_characteristic
        for e_checkbox, e_value in zip(self.browser.get_elements(self.LCT.BASELINE_CLINICALCHAR + '//input'),
                                       self.browser.get_elements(self.LCT.BASELINE_CLINICALCHAR)):
            if self.browser.get_text(e_value) not in _chars:
                self.browser.toggle_checkbox(e_checkbox, e_value, False)
            else:
                self.browser.toggle_checkbox(e_checkbox, e_value, True)
        if is_next:
            self.browser.click(self.LCT.BASELINE_NEXT)

    def add_baseline_info_step_6(self, ehra_score=None, is_next=True):
        if ehra_score:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BASELINE_EHRASCORE)
            self.browser.clicks(self.LCT.BASELINE_EHRASCORE,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == ehra_score.lower(),
                                stop_on_first=True)
        if is_next:
            self.browser.click(self.LCT.BASELINE_NEXT)

    def add_baseline_info_step_7(self, add_framingham_risk_score=False, gender=None, age=None, smoker=None,
                                 total_cholesterol=None, hdl_cholesterol=None, systolic_bp=None, blood_pressure=None,
                                 is_finish=True):
        if add_framingham_risk_score:
            self.browser.toggle_checkbox(self.LCT.BASELINE_FRS_CHECK, self.LCT.BASELINE_FRS_CHECK + '/..', True)
        if gender:
            self.browser.click(self.LCT.BASELINE_FRS_GENDER)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BASELINE_FRS_GENDER_OPTIONS)
            self.browser.clicks(self.LCT.BASELINE_FRS_GENDER_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == gender.lower(),
                                stop_on_first=True)
        if age:
            self.browser.input_text(self.LCT.BASELINE_FRS_AGE, age)
        if smoker:
            self.browser.clicks(self.LCT.BASELINE_FRS_SMOKER,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == smoker.lower(),
                                stop_on_first=True)
        if total_cholesterol:
            self.browser.input_text(self.LCT.BASELINE_TOTALCHOLESTEROL, total_cholesterol)
        if hdl_cholesterol:
            self.browser.input_text(self.LCT.BASELINE_HDLCHOLESTEROL, hdl_cholesterol)
        if systolic_bp:
            self.browser.input_text(self.LCT.BASELINE_SYSTOLICBP, systolic_bp)
        if blood_pressure:
            self.browser.clicks(self.LCT.BASELINE_BLOODPRESSURE,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == blood_pressure.lower(),
                                stop_on_first=True)
        if is_finish:
            self.browser.click(self.LCT.BASELINE_FINISH)

    def add_baseline_information(self, diagnosed_conditions=None, onset_date=None, confirm_via=None, add_more=False,
                                 at_risk_conditions=None, notes=None, blood_count_date=None, blood_count_summary=None,
                                 blood_count_path=None,
                                 function_test_date=None, function_test_summary=None, function_test_path=None,
                                 leads_ecg_date=None, leads_ecg_summary=None, leads_ecg_path=None,
                                 exercise_testing_date=None, exercise_testing_summary=None, exercise_testing_path=None,
                                 echo_date=None, echo_lvef=None, cha2ds2_vasc_scores=None,
                                 has_bled_clinical_characteristic=None, ehra_score=None,
                                 add_framingham_risk_score=False, gender=None, age=None, smoker=None,
                                 total_cholesterol=None, hdl_cholesterol=None, systolic_bp=None, blood_pressure=None):
        self.navigate_to_patient_details_tab('Baseline info')
        self.browser.wait_visibility_of_element_located(self.LCT.BASELINE_INPUTBASELINE)
        self.browser.click(self.LCT.BASELINE_INPUTBASELINE)
        self.add_baseline_info_step_1(diagnosed_conditions=diagnosed_conditions, onset_date=onset_date,
                                      confirm_via=confirm_via, add_more=add_more, at_risk_conditions=at_risk_conditions,
                                      notes=notes)
        self.add_baseline_info_step_2(blood_count_date=blood_count_date, blood_count_summary=blood_count_summary,
                                      blood_count_path=blood_count_path, function_test_date=function_test_date,
                                      function_test_summary=function_test_summary,
                                      function_test_path=function_test_path, leads_ecg_date=leads_ecg_date,
                                      leads_ecg_summary=leads_ecg_summary, leads_ecg_path=leads_ecg_path)
        self.add_baseline_info_step_3(exercise_testing_date=exercise_testing_date,
                                      exercise_testing_summary=exercise_testing_summary,
                                      exercise_testing_path=exercise_testing_path, echo_date=echo_date,
                                      echo_lvef=echo_lvef)
        self.add_baseline_info_step_4(cha2ds2_vasc_scores=cha2ds2_vasc_scores)
        self.add_baseline_info_step_5(has_bled_clinical_characteristic=has_bled_clinical_characteristic)
        self.add_baseline_info_step_6(ehra_score=ehra_score)
        self.add_baseline_info_step_7(add_framingham_risk_score=add_framingham_risk_score, gender=gender, age=age,
                                      smoker=smoker, total_cholesterol=total_cholesterol,
                                      hdl_cholesterol=hdl_cholesterol, systolic_bp=systolic_bp,
                                      blood_pressure=blood_pressure)

    # Time Tracking
    def add_new_time_log(self, activity=None, date=None, duration=None, notes=None, add_more_participant=False,
                         participant=None, is_add=True):
        self.browser.click(self.LCT.TTK_ADDNEWTIMELOG)
        if activity:
            self.browser.input_text(self.LCT.ATL_ACTIVITY, activity)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ATL_ACTIVITY_OPTIONS)
            self.browser.clicks(self.LCT.ATL_ACTIVITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == activity.lower(),
                                stop_on_first=True)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.ATL_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.ATL_DATE_TODAY)
                self.browser.click(self.LCT.ATL_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.ATL_DATE, 'readonly')
                self.browser.input_text(self.LCT.ATL_DATE, date)
                self.browser.get_element(self.LCT.ATL_DATE).send_keys(Keys.ENTER)
        if duration:
            _dur = [d.strip() for d in duration.split(':')] if isinstance(duration, str) else duration
            self.browser.input_text(self.LCT.ATL_DURATION_MM, _dur[0])
            self.browser.input_text(self.LCT.ATL_DURATION_SS, _dur[1])
        if notes:
            self.browser.input_text(self.LCT.ATL_NOTES, notes)
        # add more 1
        if add_more_participant:
            self.browser.click(self.LCT.ATL_ADDMOREPARTI)
        if participant:
            self.browser.input_text(self.LCT.ATL_NURSEORPHISICIAN, participant)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ATL_NURSEORPHISICIAN_OPTIONS)
            self.browser.get_element(self.LCT.ATL_NURSEORPHISICIAN).send_keys(Keys.ENTER)
        if is_add:
            self.browser.click(self.LCT.ATL_ADD)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_CONTENTS)

    def _on_time_tracking_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_patient_details_time_tracking()
        _on = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(data):
            _row = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such time tracking exist under {_on}.')

    def _on_time_tracking_details_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_patient_details_time_tracking_details()
        _on = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(data):
            _row = {re.sub(r'[()]', '', k).replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such time tracking exist under {_on}.')

    def delete_time_log(self, yes=True):
        self.browser.click(self.LCT.TIMETRACK_DELETE)
        if yes:
            self.browser.click(self.LCT.TIMETRACK_DELETE_YES)
        if not yes:
            self.browser.click('xpath://span[@text="No"]')

    def view_time_tracking_details_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_CONTENTS)
        _index = self._on_time_tracking_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_CONTENT_ROW)
        self.browser.clicks(self.LCT.TTK_CONTENT_ROW, on_elements=lambda i, _: _index == i,
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_DATA_CONTENT)

    def view_time_log_information_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_DATA_CONTENT)
        _index = self._on_time_tracking_details_item(**on)
        self.browser.clicks(self.LCT.TIMETRACK_DATA_ROW, on_elements=lambda i, _: _index == i,
                            stop_on_first=True)

    def get_time_log_information(self, is_close=True):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_HEADERINF)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TIMETRACK_CONTENTINF)
        header = self.browser.get_texts(self.LCT.TIMETRACK_HEADERINF)
        content = self.browser.get_texts(self.LCT.TIMETRACK_CONTENTINF)
        # close
        if is_close:
            self.browser.js_click(self.LCT.TIMETRACK_CLOSE)
        # format values and return
        return Utils.group_tabular_data(header, [c.replace('\n', ', ') for c in content], row=1)

    def edit_time_log(self, activity=None, date=None, duration=None, delete_participant=False,
                      add_more_participant=False, participant=None, notes=None, is_save=True):
        self.browser.click(self.LCT.TIMETRACK_EDIT)
        if activity:
            self.browser.input_text(self.LCT.ETL_ACTIVITY, activity)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ETL_ACTIVITY_OPTIONS)
            self.browser.clicks(self.LCT.ETL_ACTIVITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == activity.lower(),
                                stop_on_first=True)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.ETL_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.ETL_DATE_TODAY)
                self.browser.click(self.LCT.ETL_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.ETL_DATE, 'readonly')
                self.browser.input_text(self.LCT.ETL_DATE, date)
                self.browser.get_element(self.LCT.ETL_DATE).send_keys(Keys.ENTER)
        if duration:
            _dur = [d.strip() for d in duration.split(':')] if isinstance(duration, str) else duration
            self.browser.input_text(self.LCT.ETL_DURATION_MM, _dur[0])
            self.browser.input_text(self.LCT.ETL_DURATION_SS, _dur[1])
        if notes:
            self.browser.input_text(self.LCT.ETL_NOTES, notes)
        if delete_participant:
            self.browser.click(self.LCT.ETL_DELETEPARTI)
        # add more 1
        if add_more_participant:
            self.browser.click(self.LCT.ETL_ADDMOREPARTI)
        if participant:
            self.browser.input_text(self.LCT.ETL_NURSEORPHISICIAN, participant)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ETL_NURSEORPHISICIAN_OPTIONS)
            self.browser.get_element(self.LCT.ETL_NURSEORPHISICIAN).send_keys(Keys.ENTER)
        if is_save:
            self.browser.click(self.LCT.ETL_ADD)

    def back_from_time_tracking_details(self):
        self.browser.click(self.LCT.TIMETRACK_BACK)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TTK_CONTENTS)

    def create_superbill(self, diagnoses=None, services=None, amount_paid=None, status=None, is_save=True):
        self.browser.click(self.LCT.TIMETRACK_CREATESUPERBILL)
        # To close if billing warning dialog showed
        if self.browser.wait_visibility_of_element_located(self.LCT.TIMETRACK_BILLINGWARNING):
            self.browser.click(self.LCT.TIMETRACK_BILLINGWARNING_YES)
        if diagnoses:  # Should search by diagnoses code
            _diagnoses = [d.strip() for d in diagnoses.split(',')] if isinstance(diagnoses, str) else diagnoses
            for d in _diagnoses:
                self.browser.input_text(self.LCT.SUPERBILL_DIAGNOSES + '//input', d)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPERBILL_DIAGNOSES_OPTIONS)
                self.browser.clicks(self.LCT.SUPERBILL_DIAGNOSES_OPTIONS,
                                    on_elements=lambda _, e: d.lower() in self.browser.get_text(e).lower(),
                                    stop_on_first=True)
                self.browser.click(self.LCT.SUPERBILL_DIAGNOSES_ADD)
        if services:  # Should search by services code (unit & price: TBD)
            _services = [s.strip() for s in services.split(',')] if isinstance(services, str) else services
            for s in _services:
                self.browser.scroll_into_view(self.LCT.SUPERBILL_AMOUNTPAID)
                self.browser.input_text(self.LCT.SUPERBILL_SERVICE + '//input', s)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPERBILL_SERVICE_OPTIONS)
                self.browser.clicks(self.LCT.SUPERBILL_SERVICE_OPTIONS,
                                    on_elements=lambda _, e: s.lower() in self.browser.get_text(e).lower(),
                                    stop_on_first=True)
                self.browser.click(self.LCT.SUPERBILL_SERVICE_ADD)
        if amount_paid:
            self.browser.scroll_into_view(self.LCT.SUPERBILL_AMOUNTPAID)
            self.browser.input_text(self.LCT.SUPERBILL_AMOUNTPAID, amount_paid)
        if status:
            self.browser.scroll_into_view(self.LCT.SUPERBILL_AMOUNTPAID)
            self.browser.click(self.LCT.SUPERBILL_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPERBILL_STATUS_OPTIONS)
            self.browser.clicks(self.LCT.SUPERBILL_STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == status.lower(),
                                stop_on_first=True)
        if is_save:
            self.browser.click(self.LCT.SUPERBILL_SAVE)

    def upload_care_plan_consent_file(self, file_path):
        """
        Auto generate file and upload to consent forms
        :param file_path: (str) file path
        :return: (str) message
        """
        self.browser.js_clicks(self.LCT.CAREPLAN_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Consent forms',
                               stop_on_first=True)
        msg = ''
        if file_path:
            _file_path = os.path.abspath(file_path)
            if not os.path.isfile(file_path):
                raise Exception(f'Not such file exist under {file_path}')
            self.browser.set_attribute_element(self.LCT.CONSENT_UPLOAD, 'style', 'display: true;')
            self.browser.input_text(self.LCT.CONSENT_UPLOAD, _file_path, is_clear=False)
            # Confirm if dialog is showed (update file)
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CONSENT_CONFIRMDIALOG + '/div'):
                self.browser.click(self.LCT.CONSENT_CONFIRMDIALOG + '//button[contains(@class, "ant-btn-primary")]')
            # message
            self.browser.wait_visibility_of_element_located(self.LCT.CONSENT_VALIDATIONMSG)
            msg = self.browser.get_text(self.LCT.CONSENT_VALIDATIONMSG)
        # waiting for consent preview field display
        if 'Invalid file type' not in msg:
            self.browser.wait_visibility_of_element_located(self.LCT.CONSENT_PDFVIEW, timeout=5)
        return msg

    def upload_care_plan_consent_file_by_automatically_generate_file(self, file_name):
        """
        Auto generate file and upload to consent forms (can not using this incase update consent)
        :param file_name: (str) file name
        :return: (str) message
        """
        self.browser.js_clicks(self.LCT.CAREPLAN_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Consent forms',
                               stop_on_first=True)
        msg = ''
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.CONSENT_UPLOAD, 'style', 'display: true;')
            self.browser.input_text(self.LCT.CONSENT_UPLOAD, _file_path, is_clear=False)
            self.browser.wait_visibility_of_element_located(self.LCT.CONSENT_VALIDATIONMSG)
            msg = self.browser.get_text(self.LCT.CONSENT_VALIDATIONMSG)
            # Confirm if dialog is showed (update file)
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CONSENT_CONFIRMDIALOG + '/div'):
                self.browser.click(self.LCT.CONSENT_CONFIRMDIALOG + '//button[contains(@class, "ant-btn-primary")]')
            # remove above file
            os.remove(os.path.abspath('tmp/' + file_name))
        return msg

    def prescribe_new_study(self, use_biodirect=False, device=None, study_type=None, study_duration=None,
                            primary_diagnosis_code=None, secondary_diagnosis_code=None, notes=None, is_add=True):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.HEARTMON_MENU, timeout=10)
        self.browser.clicks(self.LCT.HEARTMON_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Current study', stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.CURSTUDY_PRESCRIBENEWSTUDY)
        self.browser.click(self.LCT.CURSTUDY_PRESCRIBENEWSTUDY)
        if use_biodirect:
            self.browser.wait_visibility_of_element_located(self.LCT.PRESCRIBE_BIODIRECT, timeout=2)
            self.browser.toggle_checkbox(self.LCT.PRESCRIBE_BIODIRECT, self.LCT.PRESCRIBE_BIODIRECT + '/../..', True)
        if device:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIBE_DEVICE, timeout=2)
            self.browser.clicks(self.LCT.PRESCRIBE_DEVICE,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device.lower(),
                                stop_on_first=True)
        if study_type:
            self.browser.input_text(self.LCT.PRESCRIBE_STUDYTYPE + '//input', study_type)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIBE_STUDYTYPE_OPTIONS)
            self.browser.clicks(self.LCT.PRESCRIBE_STUDYTYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == study_type.lower(),
                                stop_on_first=True)
        if study_duration:
            self.browser.input_text(self.LCT.PRESCRIBE_STUDYDURATION, study_duration)
        if primary_diagnosis_code:
            self.browser.input_text(self.LCT.PRESCRIBE_PRIMARYDIAGNOCODE, primary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIBE_PRIMARYDIAGNOCODE_OPTIONS)
            self.browser.get_element(self.LCT.PRESCRIBE_PRIMARYDIAGNOCODE).send_keys(Keys.ENTER)
        if secondary_diagnosis_code:
            self.browser.input_text(self.LCT.PRESCRIBE_SECONDARYDIAGNOCODE, secondary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIBE_SECONDARYDIAGNOCODE_OPTIONS)
            self.browser.get_element(self.LCT.PRESCRIBE_SECONDARYDIAGNOCODE).send_keys(Keys.ENTER)
        if notes:
            self.browser.input_text(self.LCT.PRESCRIBE_NOTES, notes)
        if is_add:
            self.browser.click(self.LCT.PRESCRIBE_ADD)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.HEARTMON_MENU_SAMPLEINFO + '/div')
        self.browser.wait_visibility_of_element_located(self.LCT.CURSTUDY_CANCELSTUDY)

    def cancel_study_prescription(self):
        self.browser.clicks(self.LCT.HEARTMON_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Current study', stop_on_first=True)
        # Maybe overlapped so perform js click
        self.browser.js_click(self.LCT.CURSTUDY_CANCELSTUDY)
        self.browser.wait_visibility_of_element_located(self.LCT.CURSTUDY_CANCELSTUDY_YES)
        self.browser.click(self.LCT.CURSTUDY_CANCELSTUDY_YES)
        self.browser.wait_visibility_of_element_located(self.LCT.CURSTUDY_PRESCRIBENEWSTUDY)

    def add_secondary_contact(self, name=None, relationship=None, phone_number=None, email=None):
        if name:
            self.browser.input_text(self.LCT.STUDY_P1_CONTACT_NAME, name)
        if relationship:
            self.browser.input_text(self.LCT.STUDY_P1_CONTACT_RELATIONSHIP, relationship)
        if phone_number:
            self.browser.input_text(self.LCT.STUDY_P1_CONTACT_PHONE, phone_number)
        if email:
            self.browser.input_text(self.LCT.STUDY_P1_CONTACT_EMAIL, email)

    def create_heart_monitor_study_page_1(self, patient_id=None, pacemaker=None,
                                          secondary_phone_number=None, secondary_contact=None,
                                          is_next=True):
        if patient_id:
            self.browser.input_text(self.LCT.STUDY_P1_PATIENTID, patient_id)
        if pacemaker:
            self.browser.clicks(self.LCT.STUDY_P1_PACEMAKER,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == pacemaker.lower(),
                                stop_on_first=True)
        if secondary_phone_number:
            self.browser.input_text(self.LCT.STUDY_P1_SECONDARYPHONE, secondary_phone_number)
        if secondary_contact:
            self.browser.click(self.LCT.STUDY_P1_ADDCONTACT)
            if isinstance(secondary_contact, dict):
                self.add_secondary_contact(**secondary_contact)
            elif isinstance(secondary_contact, list):
                [self.add_secondary_contact(**_contact) for _contact in secondary_contact]
        if is_next:
            self.browser.click(self.LCT.STUDY_P1_NEXT)

    def create_heart_monitor_study_page_2(self, use_biodirect=True, device_type=None, device=None,
                                          interpreting_physician=None, referring_physician=None,
                                          study_type=None, study_duration=None, patient_return_visit=None,
                                          clinician_initials=None, is_next=True):
        if use_biodirect:
            self.browser.toggle_checkbox(self.LCT.STUDY_P2_DEVICE_BIODIRECT, self.LCT.STUDY_P2_DEVICE_BIODIRECT, True)
        if device_type:
            self.browser.clicks(self.LCT.STUDY_P2_DEVICETYPE,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device_type.lower(),
                                stop_on_first=True)
        if device:  # Relative mobile app setting: TBD
            pass
        if interpreting_physician:
            self.browser.input_text(self.LCT.STUDY_P2_INTERPRETPHYSICIAN, interpreting_physician)
            self.browser.get_element(self.LCT.STUDY_P2_INTERPRETPHYSICIAN).send_keys(Keys.ENTER)
        if referring_physician:
            self.browser.input_text(self.LCT.STUDY_P2_REFERPHYSICIAN, referring_physician)
            self.browser.get_element(self.LCT.STUDY_P2_REFERPHYSICIAN).send_keys(Keys.ENTER)
        if study_type:
            self.browser.input_text(self.LCT.STUDY_P2_STUDYTYPE, study_type)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_P2_STUDYTYPE_OPTIONS)
            self.browser.get_element(self.LCT.STUDY_P2_STUDYTYPE).send_keys(Keys.ENTER)
        if study_duration:
            self.browser.input_text(self.LCT.STUDY_P2_DURATION, study_duration)
        if patient_return_visit:
            if patient_return_visit.lower() == 'today':
                self.browser.click(self.LCT.STUDY_P2_PATIENTREVISITDATE)
                self.browser.wait_visibility_of_element_located(self.LCT.STUDY_P2_PATIENTREVISITDATE_TODAY)
                self.browser.click(self.LCT.STUDY_P2_PATIENTREVISITDATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.STUDY_P2_PATIENTREVISITDATE + '//input', 'readonly')
                self.browser.input_text(self.LCT.STUDY_P2_PATIENTREVISITDATE + '//input', patient_return_visit)
                self.browser.get_element(self.LCT.STUDY_P2_PATIENTREVISITDATE + '//input').send_keys(Keys.ENTER)
        if clinician_initials:
            self.browser.input_text(self.LCT.STUDY_P2_CLINICINITIALS, clinician_initials)
        if is_next:
            self.browser.click(self.LCT.STUDY_P2_NEXT)

    def create_heart_monitor_study_page_3(self, primary_diagnosis_code=None,
                                          secondary_diagnosis_code=None, patient_medication=None,
                                          physician_amend_notes=None, insurance_type=None,
                                          insurance_provider=None, insurance_pre_auth_required=None,
                                          medication_symptoms=None, medication_symptom_answer1=None,
                                          medication_symptom_answer2=None, is_init=True):
        if primary_diagnosis_code:
            self.browser.input_text(self.LCT.STUDY_P3_PRIMARYDIAGNOSIS, primary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_P3_PRIMARYDIAGNOSIS_OPTIONS)
            self.browser.clicks(self.LCT.STUDY_P3_PRIMARYDIAGNOSIS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == primary_diagnosis_code.lower(), stop_on_first=True)
        if secondary_diagnosis_code:
            self.browser.input_text(self.LCT.STUDY_P3_SECONDARYDIAGNOSIS, secondary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_P3_SECONDARYDIAGNOSIS_OPTIONS)
            self.browser.clicks(self.LCT.STUDY_P3_SECONDARYDIAGNOSIS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == secondary_diagnosis_code.lower(), stop_on_first=True)
        if patient_medication:
            self.browser.input_text(self.LCT.STUDY_P3_MEDICATION, patient_medication)
        if physician_amend_notes:
            self.browser.input_text(self.LCT.STUDY_P3_NOTES, physician_amend_notes)
        if insurance_type:  # Relative mobile app setting: TBD
            pass
        if insurance_provider:
            self.browser.input_text(self.LCT.STUDY_P3_INSURANCEPROVIDER, insurance_provider)
        if insurance_pre_auth_required:
            self.browser.clicks(self.LCT.STUDY_P3_INSURANCEPREAUTHEN, on_elements=lambda _, e: self.browser.get_text(
                e).lower() == insurance_pre_auth_required.lower().lower(), stop_on_first=True)
        if medication_symptoms:
            _symptoms = [symp.strip() for symp in medication_symptoms.split(',')] if isinstance(
                medication_symptoms, str) else medication_symptoms
            for symp in _symptoms:
                self.browser.input_text(self.LCT.STUDY_P3_MEDIHISSYMPTOM, symp)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_P3_MEDIHISSYMPTOM_OPTIONS)
                self.browser.get_element(self.LCT.STUDY_P3_MEDIHISSYMPTOM).send_keys(Keys.ENTER)
        if medication_symptom_answer1:
            self.browser.click(self.LCT.STUDY_P3_MEDICATIONHIS_ANSWER1)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_P3_MEDICATIONHIS_ANSWER1_OPTIONS)
            self.browser.clicks(self.LCT.STUDY_P3_MEDICATIONHIS_ANSWER1_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == medication_symptom_answer1.lower(), stop_on_first=True)
        if medication_symptom_answer2:
            self.browser.clicks(self.LCT.STUDY_P3_MEDICATIONHIS_ANSWER2, on_elements=lambda _, e: self.browser.get_text(
                e).lower() == medication_symptom_answer2.lower(), stop_on_first=True)
        if is_init:
            self.browser.click(self.LCT.STUDY_P3_INITSTUDY)
        self.browser.wait_visibility_of_element_located(self.LCT.CURSTUDY_VIEWALL)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.HEARTMON_MENU_SAMPLEINFO + '/div')

    def create_heart_monitor_study_page_4(self):  # Relative mobile app setting: TBD
        pass

    def create_heart_monitor_study(self, patient_id=None, pacemaker=None, secondary_phone_number=None,
                                   secondary_contact=None, use_biodirect=True, device_type=None,
                                   device=None, interpreting_physician=None, referring_physician=None,
                                   study_type=None, study_duration=None, patient_return_visit=None,
                                   clinician_initials=None, primary_diagnosis_code=None,
                                   secondary_diagnosis_code=None, patient_medication=None,
                                   physician_amend_notes=None, insurance_type=None,
                                   insurance_provider=None, insurance_pre_auth_required=None,
                                   medication_symptoms=None, medication_symptom_answer1=None,
                                   medication_symptom_answer2=None, initiate_study=True):
        self.browser.clicks(self.LCT.HEARTMON_MENU,
                            on_elements=lambda _, e: self.browser.get_text(e) == 'Current study', stop_on_first=True)
        self.browser.click(self.LCT.CURSTUDY_CREATESTUDY)
        self.create_heart_monitor_study_page_1(patient_id=patient_id, pacemaker=pacemaker,
                                               secondary_phone_number=secondary_phone_number,
                                               secondary_contact=secondary_contact, is_next=True)
        self.create_heart_monitor_study_page_2(use_biodirect=use_biodirect, device_type=device_type,
                                               device=device,
                                               interpreting_physician=interpreting_physician,
                                               referring_physician=referring_physician,
                                               study_type=study_type, study_duration=study_duration,
                                               patient_return_visit=patient_return_visit,
                                               clinician_initials=clinician_initials, is_next=True)
        self.create_heart_monitor_study_page_3(primary_diagnosis_code=primary_diagnosis_code,
                                               secondary_diagnosis_code=secondary_diagnosis_code,
                                               patient_medication=patient_medication,
                                               physician_amend_notes=physician_amend_notes,
                                               insurance_type=insurance_type,
                                               insurance_provider=insurance_provider,
                                               insurance_pre_auth_required=insurance_pre_auth_required,
                                               medication_symptoms=medication_symptoms,
                                               medication_symptom_answer1=medication_symptom_answer1,
                                               medication_symptom_answer2=medication_symptom_answer2,
                                               is_init=initiate_study)

    def view_patient_details_study_information(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.HEARTMON_MENU_SAMPLEINFO + '/div')
        self.browser.click(self.LCT.CURSTUDY_VIEWALL)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDYINFO_CONTENT + '/div')
        output = self.browser.get_texts(self.LCT.STUDYINFO_CONTENT)
        # Reformat and output results
        output = {o.split('\n')[0]: o.split('\n')[1:] for o in output}
        d_output = {k: {v[i]: v[i + 1] for i in range(0, len(v), 2)} for k, v in output.items()}
        d_output.update({'Physician amendments notes': self.browser.get_text(
            self.LCT.STUDYINFO_CONTENT + '/..//div[@class="physician-notes"]')})
        return d_output

    def add_medical_test_results_stress_test(self, date=None, summary=None, file_name=None, is_add=False):
        # Some tabs maybe hidden, so perform js click
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Stress test', stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDISTRESSTEST_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDISTRESSTEST_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDISTRESSTEST_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDISTRESSTEST_DATE_TODAY)
                self.browser.click(self.LCT.MEDISTRESSTEST_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDISTRESSTEST_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDISTRESSTEST_DATE, date)
                self.browser.get_element(self.LCT.MEDISTRESSTEST_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDISTRESSTEST_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDISTRESSTEST_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDISTRESSTEST_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDISTRESSTEST_ADDRESULTS)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_complete_blood_count(self, date=None, summary=None, file_name=None,
                                                                is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Complete blood count',
                               stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDICOMPBLOOD_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDICOMPBLOOD_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDICOMPBLOOD_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDICOMPBLOOD_DATE_TODAY)
                self.browser.click(self.LCT.MEDICOMPBLOOD_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDICOMPBLOOD_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDICOMPBLOOD_DATE, date)
                self.browser.get_element(self.LCT.MEDICOMPBLOOD_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDICOMPBLOOD_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDICOMPBLOOD_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDICOMPBLOOD_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDICOMPBLOOD_ADDRESULTS)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_liver_function_testing(self, date=None, summary=None, file_name=None,
                                                                  is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Liver function testing',
                               stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDILIVERFUNC_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDILIVERFUNC_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDILIVERFUNC_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDILIVERFUNC_DATE_TODAY)
                self.browser.click(self.LCT.MEDILIVERFUNC_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDILIVERFUNC_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDILIVERFUNC_DATE, date)
                self.browser.get_element(self.LCT.MEDILIVERFUNC_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDILIVERFUNC_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDILIVERFUNC_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDILIVERFUNC_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDILIVERFUNC_ADDRESULTS)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_fasting_blood_sugar(self, date=None, summary=None, file_name=None,
                                                               is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Fasting blood sugar',
                               stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDIFASTBLOOD_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDIFASTBLOOD_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDIFASTBLOOD_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDIFASTBLOOD_DATE_TODAY)
                self.browser.click(self.LCT.MEDIFASTBLOOD_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDIFASTBLOOD_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDIFASTBLOOD_DATE, date)
                self.browser.get_element(self.LCT.MEDIFASTBLOOD_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDIFASTBLOOD_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDIFASTBLOOD_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDIFASTBLOOD_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDIFASTBLOOD_ADDRESULTS)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_lipid_profile(self, date=None, summary=None, file_name=None,
                                                         is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Lipid profile',
                               stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDILIPIDPROFILE_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDILIPIDPROFILE_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDILIPIDPROFILE_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDILIPIDPROFILE_DATE_TODAY)
                self.browser.click(self.LCT.MEDILIPIDPROFILE_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDILIPIDPROFILE_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDILIPIDPROFILE_DATE, date)
                self.browser.get_element(self.LCT.MEDILIPIDPROFILE_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDILIPIDPROFILE_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDILIPIDPROFILE_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDILIPIDPROFILE_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDILIPIDPROFILE_ADDRESULTS)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_inr(self, date=None, inr_result=None, summary=None, file_name=None,
                                               is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'INR', stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDIINR_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDIINR_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDIINR_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDIINR_DATE_TODAY)
                self.browser.click(self.LCT.MEDIINR_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDIINR_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDIINR_DATE, date)
                self.browser.get_element(self.LCT.MEDIINR_DATE).send_keys(Keys.ENTER)
        if inr_result:
            self.browser.input_text(self.LCT.MEDIINR_RESULTS, inr_result)
        if summary:
            self.browser.input_text(self.LCT.MEDIINR_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDIINR_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDIINR_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.js_click(self.LCT.MEDIINR_ADDRESULTS, is_scroll=True)  # maybe invisible, so perform js click
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_tsh(self, date=None, summary=None, file_name=None,
                                               is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'TSH', stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDITSH_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDITSH_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDITSH_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDITSH_DATE_TODAY)
                self.browser.click(self.LCT.MEDITSH_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDITSH_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDITSH_DATE, date)
                self.browser.get_element(self.LCT.MEDITSH_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDITSH_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDITSH_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDITSH_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDITSH_ADDRESULTS, is_scroll=True)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_creatinine(self, date=None, summary=None, file_name=None,
                                                      is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Creatinine', stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDICATININE_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDICATININE_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDICATININE_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDICATININE_DATE_TODAY)
                self.browser.click(self.LCT.MEDICATININE_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDICATININE_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDICATININE_DATE, date)
                self.browser.get_element(self.LCT.MEDICATININE_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDICATININE_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDICATININE_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDICATININE_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDICATININE_ADDRESULTS, is_scroll=True)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_bloodwork_hba1c(self, date=None, percent=None, summary=None, file_name=None,
                                                 is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'HbA1c', stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDIHBA1C_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDIHBA1C_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDIHBA1C_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDIHBA1C_DATE_TODAY)
                self.browser.click(self.LCT.MEDIHBA1C_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDIHBA1C_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDIHBA1C_DATE, date)
                self.browser.get_element(self.LCT.MEDIHBA1C_DATE).send_keys(Keys.ENTER)
        if percent:
            self.browser.input_text(self.LCT.MEDIHBA1C_PERCENT, percent)
        if summary:
            self.browser.input_text(self.LCT.MEDIHBA1C_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDIHBA1C_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDIHBA1C_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDIHBA1C_ADDRESULTS, is_scroll=True)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_echocardiogram(self, date=None, lvef=None, summary=None, file_name=None,
                                                is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Echocardiogram',
                               stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDIECHO_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDIECHO_ADDNEW)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDIECHO_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDIECHO_DATE_TODAY)
                self.browser.click(self.LCT.MEDIECHO_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDIECHO_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDIECHO_DATE, date)
                self.browser.get_element(self.LCT.MEDIECHO_DATE).send_keys(Keys.ENTER)
        if lvef:
            self.browser.input_text(self.LCT.MEDIECHO_LVEF, lvef)
        if summary:
            self.browser.input_text(self.LCT.MEDIECHO_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDIECHO_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDIECHO_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDIECHO_ADDRESULTS, is_scroll=True)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results_other_tests(self, title=None, date=None, summary=None, file_name=None,
                                             is_add=False):
        self.browser.js_clicks(self.LCT.MEDTESTRES_MENU,
                               on_elements=lambda _, e: self.browser.get_text(e) == 'Other tests', stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.MEDIOTHER_ADDNEW, timeout=10)
        self.browser.click(self.LCT.MEDIOTHER_ADDNEW)
        if title:
            self.browser.input_text(self.LCT.MEDIOTHER_TITLE, title)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.MEDIOTHER_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.MEDIOTHER_DATE_TODAY)
                self.browser.click(self.LCT.MEDIOTHER_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.MEDIOTHER_DATE, 'readonly')
                self.browser.input_text(self.LCT.MEDIOTHER_DATE, date)
                self.browser.get_element(self.LCT.MEDIOTHER_DATE).send_keys(Keys.ENTER)
        if summary:
            self.browser.input_text(self.LCT.MEDIOTHER_SUMMARY, summary)
        if file_name:
            _file_path = os.path.abspath('tmp/' + file_name)
            open(_file_path, 'w')
            self.browser.set_attribute_element(self.LCT.MEDIOTHER_ATTACHMENT, 'style', 'display: true')
            self.browser.input_text(self.LCT.MEDIOTHER_ATTACHMENT, _file_path, is_clear=False)
            os.remove(os.path.abspath('tmp/' + file_name))
        if is_add:
            self.browser.click(self.LCT.MEDIOTHER_ADDRESULTS, is_scroll=True)
            self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center',
                                                              timeout=10)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MEDTESTRES_MENU_SAMPLEINFO + '/div')

    def add_medical_test_results(self, add_stress_test=False, stress_test_date=None, stress_test_summary=None,
                                 stress_test_attachment=None, add_blood_count=False, blood_count_date=None,
                                 blood_count_summary=None, blood_count_attachment=None,
                                 add_func_test=False, func_test_date=None, func_test_summary=None,
                                 func_test_attachment=None, add_blood_sugar=False, blood_sugar_date=None,
                                 blood_sugar_summary=None, blood_sugar_attachment=None, add_lipid_profile=False,
                                 lipid_profile_date=None, lipid_profile_summary=None, lipid_profile_attachment=None,
                                 add_inr=False, inr_date=None, inr_result=None, inr_summary=None, inr_attachment=None,
                                 tsh_date=None, tsh_summary=None, add_tsh=False, tsh_attachment=None,
                                 creatinine_date=None, creatinine_summary=None, add_hba1c=False, hba1c_date=None,
                                 hba1c_percent=None, hba1c_summary=None, hba1c_attachment=None, add_creatinine=False,
                                 creatinine_attachment=None, echocardiogram_date=None, echocardiogram_summary=None,
                                 echocardiogram_lvef=None, add_echocardiogram=False, echocardiogram_attachment=None,
                                 other_test_title=None, other_test_date=None, other_test_summary=None,
                                 add_other_test=False, other_test_attachment=None):
        self.add_medical_test_results_stress_test(date=stress_test_date, summary=stress_test_summary,
                                                  file_name=stress_test_attachment, is_add=add_stress_test)
        self.add_medical_test_results_bloodwork_complete_blood_count(date=blood_count_date, summary=blood_count_summary,
                                                                     file_name=blood_count_attachment,
                                                                     is_add=add_blood_count)
        self.add_medical_test_results_bloodwork_liver_function_testing(date=func_test_date, summary=func_test_summary,
                                                                       file_name=func_test_attachment,
                                                                       is_add=add_func_test)
        self.add_medical_test_results_bloodwork_fasting_blood_sugar(date=blood_sugar_date, summary=blood_sugar_summary,
                                                                    file_name=blood_sugar_attachment,
                                                                    is_add=add_blood_sugar)
        self.add_medical_test_results_bloodwork_lipid_profile(date=lipid_profile_date, summary=lipid_profile_summary,
                                                              file_name=lipid_profile_attachment,
                                                              is_add=add_lipid_profile)
        self.add_medical_test_results_bloodwork_inr(date=inr_date, summary=inr_summary, inr_result=inr_result,
                                                    file_name=inr_attachment, is_add=add_inr)
        self.add_medical_test_results_bloodwork_tsh(date=tsh_date, summary=tsh_summary, file_name=tsh_attachment,
                                                    is_add=add_tsh)
        self.add_medical_test_results_bloodwork_creatinine(date=creatinine_date, summary=creatinine_summary,
                                                           file_name=creatinine_attachment, is_add=add_creatinine)
        self.add_medical_test_results_bloodwork_hba1c(date=hba1c_date, percent=hba1c_percent, summary=hba1c_summary,
                                                      file_name=hba1c_attachment, is_add=add_hba1c)
        self.add_medical_test_results_echocardiogram(date=echocardiogram_date, lvef=echocardiogram_lvef,
                                                     summary=echocardiogram_summary,
                                                     file_name=echocardiogram_attachment, is_add=add_echocardiogram)
        self.add_medical_test_results_other_tests(title=other_test_title, date=other_test_date,
                                                  summary=other_test_summary, file_name=other_test_attachment,
                                                  is_add=add_other_test)
