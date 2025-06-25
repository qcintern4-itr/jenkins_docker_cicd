#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import appointment as locators
    from corelib import Utils

    from selenium.webdriver.common.keys import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Appointment(WebPage):
    """
    Handle Appointment related pages, including appointment summary and new appointment
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def get_appointment_summary(self, is_close=True):
        """
        Get appointment summary info
        :return: (dict)
        """
        output = {}
        # Patient info
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTSUM_TAB1_TOPINFO)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTSUM_TAB1_BOTTOMINFO_CONTENT)
        output['Top info'] = self.browser.get_text(self.LCT.APPTSUM_TAB1_TOPINFO).split('\n')
        bottom_info_header = self.browser.get_texts(self.LCT.APPTSUM_TAB1_BOTTOMINFO_HEADER)
        if 'Caregivers' not in bottom_info_header:
            bottom_info_header += ['Caregivers']
        info_content = self.browser.get_texts(self.LCT.APPTSUM_TAB1_BOTTOMINFO_CONTENT)
        bottom_data = Utils.group_tabular_data(bottom_info_header, [v.replace('\n', ', ') for v in info_content], row=1)
        output.update(**bottom_data)
        # Appointments
        if self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTSUM_TABS, timeout=3):
            self.browser.clicks(self.LCT.APPTSUM_TABS, on_elements=lambda i, _: i == 1, stop_on_first=True)
            if self.browser.wait_visibility_of_all_elements_located(
                    self.LCT.APPTSUM_TAB2_CONTENT1) or self.browser.wait_visibility_of_all_elements_located(
                 self.LCT.APPTSUM_TAB2_CONTENT2):
                appt_header = self.browser.get_texts(self.LCT.APPTSUM_TAB2_HEADER)
                appt_content = [self.browser.get_text(self.LCT.APPTSUM_TAB2_CONTENT1),
                                [v.replace('\n', ', ') for v in self.browser.get_texts(self.LCT.APPTSUM_TAB2_CONTENT2)]]
                appt_data = Utils.group_tabular_data(appt_header, appt_content, row=1)
                output.update(**appt_data)
            # Navigate back tab1
            self.browser.clicks(self.LCT.APPTSUM_TABS, on_elements=lambda i, _: i == 0, stop_on_first=True)
        # Close the info, flag = False: not close
        if is_close:
            self.browser.click(self.LCT.APPTSUM_CLOSE_INFO)
        return output

    def go_to_patient_details(self):
        self.browser.hover_to(self.LCT.APPTSUM_GOTOPATIENTDETAIL, is_scroll=True)
        self.browser.click(self.LCT.APPTSUM_GOTOPATIENTDETAIL, is_scroll=True)

    def complete_follow_up_new_appointment(self, appt_type=None, date=None, time=None, duration=None,
                                           nurse=None, physician=None, medications=None, note=None):
        """
        Complete a new follow-up appointment
        :param appt_type: (str)
        :param date: (str)
        :param time: (str)
        :param duration: (int)
        :param nurse: (str)
        :param physician: (str)
        :param medications: (dict)
        :param note: (str)
        :return:
        """
        self.create_new_appointment_page_1(is_next=True)
        self.create_new_appointment_page_2(appt_type=appt_type, date=date, time=time, duration=duration,
                                           nurse=nurse, physician=physician, is_next=True)
        self.create_new_appointment_page_3(medications=medications, is_next=True)
        self.create_new_appointment_page_4(note=note, is_create=True)

    def get_appointment_details(self):
        """
        Get appointment details data
        :return: (dict)
        """
        self.browser.wait_invisibility_of_element_located('class:ant-space-item')
        # Left side info
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTDET_LEFT_CONTENT_BASIC)
        header = self.browser.get_texts(self.LCT.APPTDET_LEFT_HEADER) + ['Finishing actions', 'Final status']
        content = self.browser.get_texts(self.LCT.APPTDET_LEFT_CONTENT_BASIC)
        content.append(' '.join(self.browser.get_texts(self.LCT.APPTDET_LEFT_CONTENT_ATTENDEES)))
        content.append(','.join(self.browser.get_texts(self.LCT.APPTDET_LEFT_CONTENT_ACTIONS)))
        content.append(','.join(self.browser.get_texts(self.LCT.APPTDET_LEFT_CONTENT_FINALSTATUS)))
        # Condition information
        self.browser.clicks(self.LCT.APPTDET_RIGHTTABS, on_elements=lambda i, _: i == 0, stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTDET_CONDINFO_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTDET_CONDINFO_CONTENT)
        header += self.browser.get_texts(self.LCT.APPTDET_CONDINFO_HEADER)
        content += self.browser.get_texts(self.LCT.APPTDET_CONDINFO_CONTENT)
        # Vitals
        self.browser.clicks(self.LCT.APPTDET_RIGHTTABS, on_elements=lambda i, _: i == 1, stop_on_first=True)
        if self.browser.wait_visibility_of_element_located(self.LCT.APPTDET_VITALS_CONTENT, timeout=3):  # TBD
            header += ['Vitals']
            content += [self.browser.get_text(self.LCT.APPTDET_VITALS_CONTENT)]
        return Utils.group_tabular_data(header, [c.replace('\n', ', ') for c in content], row=1)

    def finish_appointment_as(self, action, confirm=None):
        """
        Finish appointment actions
        :param action: (str) action to finish appointment
        :param confirm: (str) final confirm if any (Yes/No)
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTDET_FINISHACTIONS)
        self.browser.clicks(self.LCT.APPTDET_FINISHACTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == action.lower(),
                            stop_on_first=True)
        if confirm:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.APPTDET_CONFIRM)
            self.browser.clicks(self.LCT.APPTDET_CONFIRM,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == confirm.lower(),
                                stop_on_first=True)

    def back_from_appointment_details(self):
        """
        Go back to previous page from appointment details page
        :return: None
        """
        self.browser.click(self.LCT.APPTDET_BACK)

    def create_new_appointment_page_1(self, clinic=None, patient=None, patient_name=None,
                                      is_next=True):
        """
        Handle page 1 of New Appointment flow
        :param clinic: (str)
        :param patient: (str)
        :param patient_name: (str)
        :param is_next: (bool)
        :return: None
        """
        if clinic:
            self.browser.input_text(self.LCT.NEWAPPTS_P1_CLINIC, clinic)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWAPPTS_P1_CLINIC_OPTIONS)
            self.browser.get_element(self.LCT.NEWAPPTS_P1_CLINIC).send_keys(Keys.ENTER)
        if patient:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWAPPTS_P1_PATIENT)
            self.browser.clicks(self.LCT.NEWAPPTS_P1_PATIENT,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == patient.lower(),
                                stop_on_first=True)
        if patient_name:
            self.browser.input_text(self.LCT.NEWAPPTS_P1_PATIENTNAME, patient_name)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWAPPTS_P1_PATIENTNAME_OPTIONS)
            self.browser.get_element(self.LCT.NEWAPPTS_P1_PATIENTNAME).send_keys(Keys.ENTER)
        if is_next:
            self.browser.click(self.LCT.NEWAPPTS_NEXTSTEP)

    def create_new_appointment_page_2(self, appt_type=None, date=None, time=None, duration=None,
                                      reasons=None, nurse=None, physician=None,
                                      is_next=True):
        """
        Handle page 2 of New Appointment flow
        :param appt_type: (str)
        :param date: (str)
        :param time: (str)
        :param duration: (int)
        :param reasons: (list/str)
        :param nurse: (str)
        :param physician: (str)
        :param is_next: (bool)
        :return: None
        """
        if appt_type:
            self.browser.clicks(self.LCT.NEWAPPTS_P2_TYPES,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == appt_type.lower(),
                                stop_on_first=True)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.NEWAPPTS_P2_DATE)
                self.browser.wait_visibility_of_element_located(self.LCT.NEWAPPTS_P2_DATE_TODAY)
                self.browser.click(self.LCT.NEWAPPTS_P2_DATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.NEWAPPTS_P2_DATE, 'readonly')
                self.browser.input_text(self.LCT.NEWAPPTS_P2_DATE, date)
        if time:
            self.browser.remove_attribute(self.LCT.NEWAPPTS_P2_TIME, 'readonly')
            self.browser.input_text(self.LCT.NEWAPPTS_P2_TIME, time)
            self.browser.get_element(self.LCT.NEWAPPTS_P2_TIME).send_keys(Keys.ENTER)
        if duration:
            self.browser.click(self.LCT.NEWAPPTS_P2_DURATION)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWAPPTS_P2_DURATION_OPTIONS)
            self.browser.clicks(self.LCT.NEWAPPTS_P2_DURATION_OPTIONS,
                                on_elements=lambda _, e: e.is_displayed() and self.browser.get_text(e) == str(duration),
                                stop_on_first=True)
        if reasons:
            self.browser.scroll_into_view(self.LCT.NEWAPPTS_NEXTSTEP)
            _reasons = [r.strip() for r in reasons.split(',')] if isinstance(reasons, str) else reasons
            for reason in _reasons:
                self.browser.input_text(self.LCT.NEWAPPTS_P2_REASON, reason)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWAPPTS_P2_REASON_OPTIONS)
                self.browser.clicks(self.LCT.NEWAPPTS_P2_REASON_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_attribute_value(e, 'title') == reason,
                                    stop_on_first=True)
        if nurse:
            self.browser.scroll_into_view(self.LCT.NEWAPPTS_NEXTSTEP)
            self.browser.wait_attribute_value_to_be(self.LCT.NEWAPPTS_P2_NURSE, 'disabled', None)
            self.browser.input_text(self.LCT.NEWAPPTS_P2_NURSE, nurse)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWAPPTS_P2_NURSE_OPTIONS)
            self.browser.get_element(self.LCT.NEWAPPTS_P2_NURSE).send_keys(Keys.ENTER)
        if physician:
            self.browser.scroll_into_view(self.LCT.NEWAPPTS_NEXTSTEP)
            self.browser.wait_attribute_value_to_be(self.LCT.NEWAPPTS_P2_PHYSICIAN, 'disabled', None)
            self.browser.input_text(self.LCT.NEWAPPTS_P2_PHYSICIAN, physician)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWAPPTS_P2_PHYSICIAN_OPTIONS)
            self.browser.get_element(self.LCT.NEWAPPTS_P2_PHYSICIAN).send_keys(Keys.ENTER)
        if is_next:
            self.browser.click(self.LCT.NEWAPPTS_NEXTSTEP)

    def get_new_appt_type_notice(self):
        # Get just appt type notice - dif notices: TBD
        self.browser.wait_visibility_of_element_located(self.LCT.NEWAPPTS_P2_NOTICE)
        return self.browser.get_text(self.LCT.NEWAPPTS_P2_NOTICE)

    def add_medication(self, medication, quantity, unit, frequency=None, time_to_take=None, notes=None):
        """
        Handle adding medications in New Appointment flow
        :param medication: (str)
        :param quantity: (int)
        :param unit: (str)
        :param frequency: (str)
        :param time_to_take: (list/str)
        :param notes: (str)
        :return: None
        """
        self.browser.click(self.LCT.NEWAPPTS_P3_ADDMED)
        self.browser.input_text(self.LCT.NEWAPPTS_P3_ADDMED_MEDICATION, medication)
        self.browser.input_text(self.LCT.NEWAPPTS_P3_ADDMED_QTY, quantity)
        self.browser.input_text(self.LCT.NEWAPPTS_P3_ADDMED_UNIT, unit)
        self.browser.get_element(self.LCT.NEWAPPTS_P3_ADDMED_UNIT).send_keys(Keys.ENTER)
        if frequency:
            self.browser.input_text(self.LCT.NEWAPPTS_P3_ADDMED_FREQ, frequency)
            self.browser.get_element(self.LCT.NEWAPPTS_P3_ADDMED_FREQ).send_keys(Keys.ENTER)
        if time_to_take:
            if isinstance(time_to_take, str):
                _time_to_takes = [t3.strip() for t3 in time_to_take.split(',')]
            else:  # list
                _time_to_takes = time_to_take
            for element, ttt in zip(self.browser.get_elements(self.LCT.NEWAPPTS_P3_ADDMED_TIMETOTAKES),
                                    _time_to_takes):
                self.browser.input_text(element, ttt)
                element.send_keys(Keys.ENTER)
        if notes:
            self.browser.input_text(self.LCT.NEWAPPTS_P3_ADDMED_NOTES, notes)
        self.browser.js_click(self.LCT.NEWAPPTS_P3_ADDMED_SAVE)  # overlapped on PC 13', resolution 1920 x 1080

    def create_new_appointment_page_3(self, medications=None, answers=None,
                                      is_next=True):
        """
        Handle page 3 of New Appointment flow
        :param medications: (list/dict)
        :param answers: (list/str)
        :param is_next: (bool)
        :return:
        """
        if medications:
            if isinstance(medications, dict):
                self.add_medication(**medications)
            elif isinstance(medications, list):
                [self.add_medication(**medication_dict) for medication_dict in medications]
        if answers:
            _answers = [ans.strip() for ans in answers.split(',')] if isinstance(answers, str) else answers
            for i, answer in enumerate(_answers):
                element = self.browser.get_elements(self.LCT.NEWAPPTS_P3_ANSWERS)[i]
                self.browser.input_text(element, answer)
        if is_next:
            self.browser.click(self.LCT.NEWAPPTS_NEXTSTEP)

    def create_new_appointment_page_4(self, note=None,
                                      is_create=True):
        """
        Handle page 4 of New Appointment flow
        :param note: (str)
        :param is_create: (bool)
        :return: None
        """
        if note:
            self.browser.input_text(self.LCT.NEWAPPTS_P4_ADDMED_NOTE, note)
        if is_create:
            self.browser.click(self.LCT.NEWAPPTS_P4_ADDMED_CREATE)

    def create_new_appointment(self, clinic=None, patient=None, patient_name=None, appt_type=None, date=None,
                               time=None, duration=None, reasons=None, nurse=None, physician=None, medications=None,
                               answers=None, note=None):
        """
        Create a new appointment
        :param clinic: (str)
        :param patient: (str)
        :param patient_name: (str)
        :param appt_type: (str)
        :param date: (str)
        :param time: (str)
        :param duration: (int)
        :param reasons: (list/str)
        :param nurse: (str)
        :param physician: (str)
        :param medications: (list/dict)
        :param answers: (list/str)
        :param note: (str)
        :return: None
        """
        self.create_new_appointment_page_1(clinic=clinic, patient=patient, patient_name=patient_name, is_next=True)
        self.create_new_appointment_page_2(appt_type=appt_type, date=date, time=time, duration=duration,
                                           reasons=reasons, nurse=nurse, physician=physician, is_next=True)
        self.create_new_appointment_page_3(medications=medications, answers=answers, is_next=True)
        self.create_new_appointment_page_4(note=note, is_create=True)

    def edit_appointment(self, appt_type=None, date=None, time=None, duration=None, nurse=None, physician=None):
        self.browser.click(self.LCT.APPTDET_EDIT)
        if appt_type:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDITAPPT_TYPE)
            self.browser.clicks(self.LCT.EDITAPPT_TYPE,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == appt_type.lower(),
                                is_scroll=True, stop_on_first=True)
        if date:
            if date.lower() == 'today':
                self.browser.click(self.LCT.EDITAPPT_DATE + '/..')
                self.browser.wait_visibility_of_element_located(self.LCT.EDITAPPT_DATE_TODAY)
                self.browser.click(self.LCT.EDITAPPT_DATE_TODAY)
            else:
                self.browser.hover_to(self.LCT.EDITAPPT_DATE_CLEAR)
                self.browser.click(self.LCT.EDITAPPT_DATE_CLEAR)
                self.browser.remove_attribute(self.LCT.EDITAPPT_DATE, 'readonly')
                self.browser.input_text(self.LCT.EDITAPPT_DATE, date)
                self.browser.get_element(self.LCT.EDITAPPT_DATE).send_keys(Keys.ENTER)
        if time:
            self.browser.hover_to(self.LCT.EDITAPPT_TIME_CLEAR)
            self.browser.click(self.LCT.EDITAPPT_TIME_CLEAR)
            self.browser.remove_attribute(self.LCT.EDITAPPT_TIME, 'readonly')
            self.browser.input_text(self.LCT.EDITAPPT_TIME, time)
            self.browser.get_element(self.LCT.EDITAPPT_TIME).send_keys(Keys.ENTER)
        if duration:
            self.browser.scroll_into_view(self.LCT.EDITAPPT_SAVE)
            self.browser.click(self.LCT.EDITAPPT_DURATION)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDITAPPT_DURATION_OPTIONS)
            self.browser.clicks(self.LCT.EDITAPPT_DURATION_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == duration, stop_on_first=True)
        if nurse:
            self.browser.scroll_into_view(self.LCT.EDITAPPT_SAVE)
            self.browser.hover_to(self.browser.get_element(self.LCT.EDITAPPT_NURSE + '/../../..'))
            self.browser.click(self.LCT.EDITAPPT_NURSE_CLEAR)
            self.browser.input_text(self.LCT.EDITAPPT_NURSE, nurse)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDITAPPT_NURSE_OPTIONS)
            self.browser.get_element(self.LCT.EDITAPPT_NURSE).send_keys(Keys.ENTER)
        if physician:
            self.browser.scroll_into_view(self.LCT.EDITAPPT_SAVE)
            self.browser.hover_to(self.browser.get_element(self.LCT.EDITAPPT_PHYSICIAN + '/../../..'))
            self.browser.click(self.LCT.EDITAPPT_PHYSICIAN_CLEAR)
            self.browser.input_text(self.LCT.EDITAPPT_PHYSICIAN, physician)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EDITAPPT_PHYSICIAN_OPTIONS)
            self.browser.get_element(self.LCT.EDITAPPT_PHYSICIAN).send_keys(Keys.ENTER)
        self.browser.click(self.LCT.EDITAPPT_SAVE)

    def cancel_appointment(self, yes=True):
        self.browser.click(self.LCT.APPTDET_CANCELAPPT)
        if yes:
            self.browser.click(self.LCT.APPTDET_CANCELAPPT_YES)
        self.browser.wait_invisibility_of_element_located(self.LCT.APPTDET_CANCELAPPT)

    def mark_as_done_appointment(self):
        self.browser.click(self.LCT.APPTDET_DONEAPPT)

    def mark_as_overdue_appointment(self):
        self.browser.click(self.LCT.APPTDET_OVERDUEAPPT)

    def back_from_create_appointment(self):
        self.browser.click(self.LCT.NEWAPPTS_BACK)
        self.browser.wait_visibility_of_element_located(self.LCT.NEWAPPTS_BACK_YES)
        self.browser.click(self.LCT.NEWAPPTS_BACK_YES)
