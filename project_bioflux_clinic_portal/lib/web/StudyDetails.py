#!/usr/bin/env python3
import time

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import study_details as locators
    from corelib import Utils
    from corelib import WebHandler
    from selenium.webdriver import Keys
    from selenium import webdriver
    from selenium.webdriver.common.by import By
    from datetime import datetime, timedelta
    import time
    import re

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class StudyDetails(WebPage):
    """
    Handle study details page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def wait_until_study_details_overview_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMMON_CONTENT)

    def navigate_to_study_details_tab(self, tab):
        self.browser.wait_visibility_of_all_elements_located('class:react-loading-skeleton', inverse=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        self._ok_attention_if_any(timeout=10)
        self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS, inverse=True)

    def get_current_study_details_tab(self):
        self.wait_until_study_details_overview_available()
        elem = self.browser.get_elements_by_condition(
            self.LCT.TABS, on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(
                e, 'class'), stop_on_first=True)[0]
        return self.browser.get_text(elem)

    # Study Details

    def get_study_details_overview(self):
        self.wait_until_study_details_overview_available()
        header = self.browser.get_texts(self.LCT.COMMON_HEADER)
        content = self.browser.get_texts(self.LCT.COMMON_CONTENT)
        if self.browser.wait_visibility_of_element_located(self.LCT.COMMON_CONTENT_BIODIRECT):
            header.append('Biodirect')
            content.append('True')
        output = {key: value for key, value in zip(header, content)}
        self.logger.info(output)
        return output

    def get_study_details(self):
        self.navigate_to_study_details_tab('Study details')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA_HOLTER)
        foutput = dict()
        content_header = self.browser.get_texts(self.LCT.STDET_DATA_CONTENT_HEADER)
        content_value = self.browser.get_texts(self.LCT.STDET_DATA_CONTENT_CONTENT)
        foutput['Study Information'] = {key.replace(':', ''): value for key, value in
                                        zip(content_header, content_value)}

        if foutput['Study Information']['Study type'].endswith('Follow-on'):
            foutput['Study Information']['Study type'] = foutput['Study Information'][
                'Study type'].replace('\nFollow-on', ' | Follow on')
        output = self.browser.get_texts(self.LCT.STDET_DATA_HOLTER)
        # reformat the output: TBD
        output = {o.split('\n')[0]: o.split('\n')[1::] for o in output}
        # Reformat 'Study Type' value incase `study follow on`
        value = output['Referring physician']
        foutput['Referring physician'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        value = output['Interpreting physician']
        foutput['Interpreting physician'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        value = output['Diagnosis']
        foutput['Diagnosis'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        foutput['Physician amendments notes'] = self.browser.get_text(
            self.LCT.STDET_DATA + '[4]//div[@class="content"]')
        status_history = self.browser.get_texts(
            self.LCT.STDET_DATA + '[5]//div[@class="content"]//div[@class="time-stone"]')
        foutput['Study history'] = {s.split('\n')[0]: re.sub(r'\s*\(\d+%\)', '', s).split('\n')[1::][0] for s in
                                    status_history}
        foutput['Device notification history'] = self.browser.get_text(
            self.LCT.STDET_DATA + '[6]//div[@class="content"]').replace('\n', ' | ')
        self.logger.info(foutput)
        return foutput

    def get_study_details_patient_details(self):
        self.navigate_to_study_details_tab('Patient details')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA)
        output = {}
        for root_elem in self.browser.get_elements(self.LCT.PTDET_ROOT_DATA):
            header = self.browser.get_text(self.browser.get_child_element(root_elem, self.LCT.PTDET_DATA_HEADER))
            content_header = self.browser.get_texts(
                self.browser.get_child_elements(root_elem, self.LCT.PTDET_DATA_CONTENT_HEADER)
            )
            content_value = self.browser.get_texts(
                self.browser.get_child_elements(root_elem, self.LCT.PTDET_DATA_CONTENT_CONTENT)
            )
            output[header] = {key.replace(':', ''): value for key, value in zip(content_header, content_value)}
        return output

    def wait_until_study_details_reports_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_DATA_CONTENT)

    def get_study_details_reports(self, row=None):
        self.navigate_to_study_details_tab('Reports')
        self.wait_until_study_details_reports_available()
        header = self.browser.get_texts(self.LCT.REPORT_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.REPORT_DATA_CONTENT, row=row)

    def get_study_details_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_ROOT)
        index = 10  # Initialize index outside the loop
        while True:
            elements = self.browser.get_elements(self.LCT.EVENT_ROOT)
            if len(elements) == index:
                self.browser.scroll_into_view(elements[-1])
                self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_ROOT, inverse=True)
                index += 10  # Increment index to load next chunk
            elif len(elements) < index:
                self.browser.scroll_into_view(elements[-1])
                break  # Break out of loop when all elements are loaded
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_ROOT, inverse=True)
        output = []
        for root_element in self.browser.get_elements(self.LCT.EVENT_ROOT):
            header = self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_HEADER1ST)) + self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_HEADER2ST))
            content = self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_CONTENT1ST)) + self.browser.get_texts(
                self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_CONTENT2ST))
            output.append({k.replace(':', '').strip(): v for k, v in zip(header, content)})
        self.browser.execute_script('window.scrollTo(2500,0)')
        self.logger.info(output)
        return output
        # self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_ROOT)
        # output = []
        # for root_element in self.browser.get_elements(self.LCT.EVENT_ROOT):
        #     header = self.browser.get_texts(
        #         self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_HEADER1ST)) + self.browser.get_texts(
        #         self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_HEADER2ST))
        #     content = self.browser.get_texts(
        #         self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_CONTENT1ST)) + self.browser.get_texts(
        #         self.browser.get_child_elements(root_element, self.LCT.EVENT_DATA_CONTENT2ST))
        #     output.append({k.replace(':', '').strip(): v for k, v in zip(header, content)})
        # self.logger.info(output)
        # return output

    def get_study_details_ecg_viewer(self):
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ECG_DATA) and self.browser.get_element(
                    self.LCT.ECG_DATA).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ECG_DATA, inverse=True)
                return self.browser.get_text(self.LCT.ECG_DATA)

    def view_study_information_of_follow_on_study_tracking(self):
        self.browser.hover_to(self.LCT.STDET_FLONSTTRACKING_STUDYID, is_scroll=True)
        self.browser.wait_visibility_of_element_located(self.LCT.STDET_FLONSTTRACKING_STUDYID)
        # self.browser.click(self.LCT.STDET_FLONSTTRACKING_STUDYID)

    def edit_study_details_study_information(self, study_type=None, study_duration=None, patient_return_visit=None,
                                             is_change=True, is_save=True, is_cancel=False):
        if study_type:
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_STUDYTYPE)
            self.browser.click(self.LCT.STINFO_DIALOG_STUDYTYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STINFO_DIALOG_STUDYTYPE_OPTIONS)
            self.browser.clicks(self.LCT.STINFO_DIALOG_STUDYTYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == study_type.lower(),
                                stop_on_first=True)
        if study_duration:
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_DURATION)
            self.browser.input_text(self.LCT.STINFO_DIALOG_DURATION, study_duration)
        if patient_return_visit:
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_PRV, inverse=True)
            self.browser.click(self.LCT.STINFO_DIALOG_PRV)
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_PRV, inverse=True)
            self.browser.clicks(self.LCT.ECG_DATE_OPTION,
                                on_elements=lambda _, e: int(self.browser.get_text(e)) == int(patient_return_visit),
                                stop_on_first=True)
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_PRV, inverse=True)
            # self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_PRV)
            # self.browser.click(self.LCT.STINFO_DIALOG_PRV)
            # self.browser.clear_text(self.LCT.STINFO_DIALOG_PRV)
            # self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DATE_ELEMENT, inverse=True)
            # self.browser.input_text(self.LCT.STINFO_DIALOG_PRV, patient_return_visit)
            # self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DATE_ELEMENT, inverse=True)
            # self.browser.click(self.LCT.STINFO_DATE_ELEMENT)
            # # self.browser.get_element(self.LCT.STINFO_DIALOG_PRV).send_keys(Keys.ENTER)
            # self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_PRV, inverse=True)
        if is_save:
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE)
        if is_change:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)
        if is_cancel:
            self.browser.click(self.LCT.STINFO_DIALOG_CANCEL_CONFIRM)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)

    def edit_study_details_referring_physician(self, referring_physician=None, is_change=True):
        if referring_physician:
            self.browser.wait_visibility_of_element_located(self.LCT.REFPHY_DIALOG_REFERPHYSICIAN)
            self.browser.click(self.LCT.REFPHY_DIALOG_REFERPHYSICIAN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REFPHY_DIALOG_REFERPHYSICIAN_OPTIONS)
            self.browser.clicks(self.LCT.REFPHY_DIALOG_REFERPHYSICIAN_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == referring_physician.lower(), stop_on_first=True)
        if is_change:
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)

    def edit_study_details_interpreting_physician(self, interpreting_physician=None, is_change=True):
        if interpreting_physician:
            self.browser.wait_visibility_of_element_located(self.LCT.INTERPHY_DIALOG_INTERPHYSICIAN)
            self.browser.click(self.LCT.INTERPHY_DIALOG_INTERPHYSICIAN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.INTERPHY_DIALOG_INTERPHYSICIAN_OPTIONS)
            self.browser.clicks(self.LCT.INTERPHY_DIALOG_INTERPHYSICIAN_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == interpreting_physician.lower(), stop_on_first=True)
        if is_change:
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE_CONFIRM, inverse=True)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)

    def edit_study_details_diagnosis(self, primary_diagnosis_code=None, secondary_diagnosis_code=None,
                                     patient_medication=None, is_change=True):
        self.browser.execute_script('window.scrollTo(0,2500)')
        if primary_diagnosis_code:
            self.browser.wait_visibility_of_element_located(self.LCT.DIAGNOSIS_DIALOG_PRIMARYDIAGNOSIS)
            self.browser.input_text(self.LCT.DIAGNOSIS_DIALOG_PRIMARYDIAGNOSIS, primary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.DIAGNOSIS_DIALOG_PRIMARYDIAGNOSIS_OPTIONS)
            self.browser.js_clicks(self.LCT.DIAGNOSIS_DIALOG_PRIMARYDIAGNOSIS_OPTIONS,
                                   on_elements=lambda _, e: self.browser.get_text(
                                       e).lower() == primary_diagnosis_code.lower(), stop_on_first=True)
        if secondary_diagnosis_code:
            self.browser.wait_visibility_of_element_located(self.LCT.DIAGNOSIS_DIALOG_SECONDARYDIAGNOSIS)
            self.browser.input_text(self.LCT.DIAGNOSIS_DIALOG_SECONDARYDIAGNOSIS, secondary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.DIAGNOSIS_DIALOG_SECONDARYDIAGNOSIS_OPTIONS)
            self.browser.js_clicks(self.LCT.DIAGNOSIS_DIALOG_SECONDARYDIAGNOSIS_OPTIONS,
                                   on_elements=lambda _, e: self.browser.get_text(
                                       e).lower() == secondary_diagnosis_code.lower(), stop_on_first=True)
        if patient_medication:
            self.browser.wait_visibility_of_element_located(self.LCT.DIAGNOSIS_DIALOG_PATIENTMEDICATION)
            self.browser.input_text(self.LCT.DIAGNOSIS_DIALOG_PATIENTMEDICATION, patient_medication)
        if is_change:
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)

    def edit_study_details(self, study_information=None, referring_physician=None, interpreting_physician=None,
                           diagnosis=None, physician_amendments_notes=None):
        # Maybe invisibility so perform js click
        self.browser.wait_visibility_of_element_located(self.LCT.STDET_REFPHYSICIAN_EDIT)
        self.browser.click(self.LCT.STDET_REFPHYSICIAN_EDIT)
        if study_information:
            self.edit_study_details_study_information(**study_information)
        if referring_physician:
            self.edit_study_details_referring_physician(**referring_physician)
        if interpreting_physician:
            self.edit_study_details_interpreting_physician(**interpreting_physician)
        if diagnosis:
            self.edit_study_details_diagnosis(**diagnosis)
        if physician_amendments_notes:
            self.edit_study_details_physician_amendments_notes(**physician_amendments_notes)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)

    def edit_patient_information(self, patient_id=None, first_name=None, middle_name=None, last_name=None, dob=None,
                                 gender=None, height=None, weight=None, ethnicity=None, pacemaker=False, icd=False,
                                 is_save=True):
        if patient_id:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_PATIENTID)
            self.browser.input_text(self.LCT.PINFO_PATIENTID, patient_id)
        if first_name:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_FIRSTNAME)
            self.browser.input_text(self.LCT.PINFO_FIRSTNAME, first_name)
        if middle_name:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_MIDDLENAME)
            self.browser.input_text(self.LCT.PINFO_MIDDLENAME, middle_name)
        if last_name:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_LASTNAME)
            self.browser.input_text(self.LCT.PINFO_LASTNAME, last_name)
        if dob:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_DOB)
            self.browser.input_text(self.LCT.PINFO_DOB, dob)
        if gender:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PINFO_GENDER)
            self.browser.clicks(self.LCT.PINFO_GENDER,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == gender.lower(),
                                stop_on_first=True)
        if height:
            map_measurement = {
                True: ['height (ft, in)',
                       [self.LCT.PINFO_HEIGHTFT, self.LCT.PINFO_HEIGHTIN]],
                False: ['height (ft)', [self.LCT.PINFO_HEIGHTFT]]
            }
            cond = height.endswith('in')
            _height = re.sub('ft|in|,', ' ', height).strip().split()
            [self.browser.input_text(e, text) for e, text in zip(map_measurement[cond][1], _height)]
        if weight:
            map_measurement = {
                True: [self.LCT.PINFO_WEIGHT]
            }
            cond = weight.endswith('lb')
            _weight = weight.replace('lb', '').strip()
            self.browser.input_text(map_measurement[cond][0], _weight)
        if ethnicity:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_ETHNICITY)
            self.browser.click(self.LCT.PINFO_ETHNICITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PINFO_ETHNICITY_OPTION)
            self.browser.clicks(self.LCT.PINFO_ETHNICITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == ethnicity.lower(),
                                stop_on_first=True)
        if pacemaker:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_PACEMAKER)
            self.browser.toggle_checkbox(self.LCT.PINFO_PACEMAKER,
                                         self.LCT.PINFO_PACEMAKER, True)
        if icd:
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_ICD)
            self.browser.toggle_checkbox(self.LCT.PINFO_ICD,
                                         self.LCT.PINFO_ICD, True)
        if is_save:
            self.browser.click(self.LCT.PINFO_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.PINFO_SAVE, inverse=True)
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.PINFO_SAVE_CONFIRM) and self.browser.get_element(self.LCT.PINFO_SAVE_CONFIRM).is_displayed():
                self.browser.click(self.LCT.PINFO_SAVE_CONFIRM)
                self.browser.wait_visibility_of_element_located(self.LCT.PINFO_SAVE_CONFIRM, inverse=True)

    def edit_patient_contact(self, country=None, address=None, city=None, state=None, zip_code=None,
                             primary_phone_number=None, secondary_phone_number=None, email=None, is_save=True):
        # Maybe invisibility so perform js click
        if country:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_COUNTRY, inverse=True)
            self.browser.click(self.LCT.PCONTACT_COUNTRY)
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_COUNTRY, inverse=True)
            self.browser.input_text(self.LCT.PCONTACT_COUNTRY_INPUT, country)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PCONTACT_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.PCONTACT_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_ADDRESS)
            self.browser.input_text(self.LCT.PCONTACT_ADDRESS + '//input', address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PCONTACT_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.PCONTACT_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.PCONTACT_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PCONTACT_CITY_OPTIONS)
            self.browser.clicks(self.LCT.PCONTACT_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            if country in ['United States', 'Canada']:  # State dropdown
                self.browser.click(self.LCT.PCONTACT_STATEST1)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.PCONTACT_STATEST1_OPTIONS)
                self.browser.clicks(self.LCT.PCONTACT_STATEST1_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                    stop_on_first=True)
            else:  # input box
                self.browser.input_text(self.LCT.PCONTACT_STATEST2, state)
        if zip_code:
            self.browser.input_text(self.LCT.PCONTACT_ZIPCODE, zip_code)
        if primary_phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_PRIMARYPHONE, inverse=True)
            self.browser.input_text(self.LCT.PCONTACT_PRIMARYPHONE, primary_phone_number)
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_PRIMARYPHONE, inverse=True)
        if secondary_phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_SECONDARYPHONE, inverse=True)
            self.browser.input_text(self.LCT.PCONTACT_SECONDARYPHONE, secondary_phone_number)
        if email:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_EMAIL)
            self.browser.input_text(self.LCT.PCONTACT_EMAIL, email)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACT_SAVE)
            self.browser.click(self.LCT.PCONTACT_SAVE)
            # self.browser.click(self.LCT.PCONTACT_SAVE_CONFIRM)  # confirm save
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA)

    def edit_secondary_contact(self, name=None, phone_number=None, relationship=None, email=None, is_save=True):
        # Maybe invisibility so perform js click
        if name:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACTST2_NAME)
            self.browser.input_text(self.LCT.PCONTACTST2_NAME, name)
        if phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACTST2_PHONENUMBER)
            self.browser.input_text(self.LCT.PCONTACTST2_PHONENUMBER, phone_number)
        if relationship:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACTST2_RELATIONSHIP)
            self.browser.input_text(self.LCT.PCONTACTST2_RELATIONSHIP, relationship)
        if email:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACTST2_EMAIL)
            self.browser.input_text(self.LCT.PCONTACTST2_EMAIL, email)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACTST2_SAVE)
            self.browser.click(self.LCT.PCONTACTST2_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.PCONTACTST2_SAVE, inverse=True)  # confirm save
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA, inverse=True)

    def edit_insurance(self, insurance_type=None, provider=None, pre_authorization=None, is_save=True):
        # Maybe invisibility so perform js click
        if insurance_type:
            self.browser.click(self.LCT.PINS_INSURANCETYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PINS_INSURANCETYPE_OPTIONS)
            self.browser.clicks(self.LCT.PINS_INSURANCETYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == insurance_type.lower(),
                                stop_on_first=True)
        if provider:
            self.browser.input_text(self.LCT.PINS_PROVIDER, provider)
        if pre_authorization:
            self.browser.clicks(self.LCT.PINS_PREAUTHORIZATION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == pre_authorization.lower(),
                                stop_on_first=True)
        if is_save:
            self.browser.click(self.LCT.PINS_SAVE)
            # self.browser.click(self.LCT.PINS_SAVE_CONFIRM)  # confirm save
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA)

    def edit_medical_history(self, symptoms=None, symptoms_times_happen=None,
                             heart_monitor_before=None, is_save=True):
        # Maybe invisibility so perform js click
        if symptoms:
            self.browser.wait_visibility_of_element_located(self.LCT.PMEDIHIS_SYMPTOMS)
            self.browser.click(self.LCT.PMEDIHIS_SYMPTOMS)
            while True:
                self.browser.clear_on_text_search()
                break
            _symptoms = [e.strip().lower() for e in symptoms.split(',')] if isinstance(
                symptoms, str) else symptoms  # list
            for sym in _symptoms:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.PMEDIHIS_SYMPTOMS_OPTIONS)
                self.browser.clicks(self.LCT.PMEDIHIS_SYMPTOMS_OPTIONS, is_scroll=True,
                                    on_elements=lambda _, e: self.browser.execute_script(
                                        'return arguments[0].textContent', e).lower() == sym.lower(),
                                    stop_on_first=True)
            self.browser.click(self.LCT.PMEDIHIS_SYMPTOMS)
        if symptoms_times_happen:
            self.browser.wait_visibility_of_element_located(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN)
            self.browser.click(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN_OPTIONS)
            self.browser.clicks(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == symptoms_times_happen.lower(), stop_on_first=True)
        if heart_monitor_before:
            self.browser.clicks(self.LCT.PMEDIHIS_SYMPTOMS_HEARTMONITORBEFORE,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == heart_monitor_before.lower(), stop_on_first=True)
        if is_save:
            self.browser.click(self.LCT.PMEDIHIS_SAVE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA, inverse=True)

    # def edit_medical_history(self, del_symptoms=None, add_symptoms=None, symptoms_times_happen=None,
    #                          heart_monitor_before=None, is_save=True):
    #     # Maybe invisibility so perform js click
    #     self.browser.js_click(self.LCT.PTDET_MEDICALHIS_EDIT, is_scroll=True)
    #     if del_symptoms:
    #         _symptoms = [e.strip().lower() for e in del_symptoms.split(',')] if isinstance(
    #             del_symptoms, str) else del_symptoms  # list
    #         _symptoms_iconx = self.browser.get_elements(self.LCT.PMEDIHIS_SELECTEDSYMPTOMS + '//*[local-name()="svg"]')
    #         if 'all' in _symptoms:  # delete all items
    #             [self.browser.click(e) for e in _symptoms_iconx[::-1]]
    #         else:  # find and delete items in list
    #             for e_value, e_click in zip(self.browser.get_texts(self.LCT.PMEDIHIS_SELECTEDSYMPTOMS)[::-1],
    #                                         _symptoms_iconx[::-1]):
    #                 if e_value.lower() in _symptoms:
    #                     self.browser.click(e_click)
    #     if add_symptoms:
    #         _symptoms = [e.strip().lower() for e in add_symptoms.split(',')] if isinstance(
    #             add_symptoms, str) else add_symptoms  # list
    #         self.browser.click(self.LCT.PMEDIHIS_SYMPTOMS)
    #         for sym in _symptoms:
    #             self.browser.wait_visibility_of_all_elements_located(self.LCT.PMEDIHIS_SYMPTOMS_OPTIONS)
    #             self.browser.clicks(self.LCT.PMEDIHIS_SYMPTOMS_OPTIONS, is_scroll=True,
    #                                 on_elements=lambda _, e: self.browser.execute_script(
    #                                     'return arguments[0].textContent', e).lower() == sym.lower(),
    #                                 stop_on_first=True)
    #     if symptoms_times_happen:
    #         self.browser.input_text(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN, symptoms_times_happen)
    #         self.browser.wait_visibility_of_all_elements_located(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN_OPTIONS)
    #         self.browser.clicks(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN_OPTIONS,
    #                             on_elements=lambda _, e: self.browser.get_text(
    #                                 e).lower() == symptoms_times_happen.lower(), stop_on_first=True)
    #     if heart_monitor_before:
    #         self.browser.clicks(self.LCT.PMEDIHIS_SYMPTOMS_HEARTMONITORBEFORE,
    #                             on_elements=lambda _, e: self.browser.get_text(
    #                                 e).lower() == heart_monitor_before.lower(), stop_on_first=True)
    #     if is_save:
    #         self.browser.click(self.LCT.PMEDIHIS_SAVE)
    #         self.browser.click(self.LCT.PMEDIHIS_SAVE_CONFIRM)  # confirm save
    #         self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA)

    def edit_patient_details(self, patient_info=None, patient_contact=None, secondary_contact=None, insurance=None,
                             medication_history=None):
        if patient_info:
            self.browser.click(self.LCT.PTDET_PATIENTINFO_EDIT)
            self.edit_patient_information(**patient_info)
        if patient_contact:
            self.browser.click(self.LCT.PTDET_PATIENTCONTACT_EDIT)
            self.edit_patient_contact(**patient_contact)
        if secondary_contact:
            self.browser.click(self.LCT.PTDET_SECONDARYCONTACT_EDIT, is_scroll=True)
            self.edit_secondary_contact(**secondary_contact)
        if insurance:
            self.browser.click(self.LCT.PTDET_INSURANCE_EDIT, is_scroll=True)
            self.edit_insurance(**insurance)
        if medication_history:
            self.browser.click(self.LCT.PTDET_MEDICALHIS_EDIT, is_scroll=True)
            self.edit_medical_history(**medication_history)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA)

    def filter_study_details_reports(self, by_report=None, text_search=None):
        if by_report:
            self.browser.click(self.LCT.REPORT_BYREPORT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_BYREPORT_OPTIONS)
            self.browser.clicks(self.LCT.REPORT_BYREPORT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_report.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.input_text(self.LCT.REPORT_SEARCHTEXTBOX, text_search)
        self.wait_until_study_details_reports_available()

    def sort_study_details_reports(self, field, asc_or_desc):
        """
        Handle sorting the study details > reports
        :param field: (str)  sort field (headers)
        :param asc_or_desc: (str) sort condition (valid keys: asc or desc)
        :return: None
        """
        self.wait_reports_available()
        _index_header = {
            'report id': 0,
            'last modified': 2,
            'type': 3,
            'reviewed': 4
        }
        self.browser.click(self.LCT.STUDY_REPORT_ID)
        time.sleep(10)
        for _ in range(2):
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REPORT_DATA_HEADER)
            element_sort = self.browser.get_elements(self.LCT.REPORT_DATA_HEADER)[_index_header[field.lower()]]
            if asc_or_desc in self.browser.get_attribute_value(element_sort, 'aria-sort'):
                break
            self.browser.click(element_sort)

    def sort_study_details_events(self, newest_or_oldest):
        """
        Handle sorting study details > events
        :param newest_or_oldest: (str) sort condition (valid keys: newest or oldest)
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.EVENT_SORT, inverse=True)
        self.browser.execute_script('window.scrollTo(2500,0)')
        for _ in range(2):
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_SORT, inverse=True)
            self.browser.hover_to(self.LCT.EVENT_SORT)
            if newest_or_oldest.lower() != self.browser.get_text(self.LCT.EVENT_SORT_REPORT).split()[0].strip().lower():
                break
            self.browser.hover_to(self.LCT.EVENT_BYTYPE)
            self.browser.js_click(self.LCT.EVENT_SORT)

    def refresh_study_details_events(self, refresh=True):
        if refresh:
            self.browser.click(self.LCT.EVENT_REFRESH)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_ROOT)

    def filter_study_details_events(self, from_date=None, to_date=None, by_type=None, text_search=None,
                                    sort_up_or_down=None, refresh=False):
        if from_date:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_STARTDATE, inverse=True)
            self.browser.input_text(self.LCT.EVENT_STARTDATE, from_date)
            self.browser.get_element(self.LCT.EVENT_STARTDATE).send_keys(Keys.ENTER)
        if to_date:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_STARTDATE, inverse=True)
            self.browser.input_text(self.LCT.EVENT_ENDDATE, to_date)
            self.browser.get_element(self.LCT.EVENT_ENDDATE).send_keys(Keys.ENTER)
        if by_type:
            self.browser.click(self.LCT.EVENT_BYTYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_BYTYPE_OPTIONS)
            self.browser.clicks(self.LCT.EVENT_BYTYPE_OPTIONS, on_elements=lambda _, e: self.browser.execute_script(
                'return arguments[0].textContent', e).lower() == by_type.lower(), stop_on_first=True)
        if text_search:
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_SEARCHTEXTBOX, inverse=True)
            self.browser.input_text(self.LCT.EVENT_SEARCHTEXTBOX, text_search)
            self.browser.wait_visibility_of_element_located(self.LCT.EVENT_SEARCHTEXTBOX, inverse=True)
        if sort_up_or_down:
            self.sort_study_details_events(newest_or_oldest=sort_up_or_down)
        if refresh:
            self.refresh_study_details_events(refresh=refresh)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_ROOT)

    def view_study_details_events_ecg_on(self, **on):
        def on_item(**item):
            if 'row' in item:
                return int(item['row']) - 1
            events = self.get_study_details_events()
            _on = {k.replace(' ', '_').lower(): v for k, v in item.items()}
            for i, evts in enumerate(events):
                _event = {k.replace(' ', '_').lower(): v for k, v in evts.items()}
                if _on.items() <= _event.items():
                    return i
            raise Exception(f'No such event exist under `{_on}`')

        _index = on_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_ROOT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.EVENT_DATA_CONTENT_VIEWECG)
        self.browser.clicks(self.LCT.EVENT_DATA_CONTENT_VIEWECG, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def filter_study_details_ecg_viewer(self, by_type=None, day=None):
        if day:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_BYDATE, inverse=True)
            self.browser.click(self.LCT.ECG_BYDATE)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_BYDATE, inverse=True)
            self.browser.clicks(self.LCT.ECG_DATE_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e) == day,
                                stop_on_first=True)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_BYDATE, inverse=True)
        if by_type:
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_TYPE) and self.browser.get_element(self.LCT.ECG_EVENT_TYPE).is_displayed():
                    self.browser.click(self.LCT.ECG_EVENT_TYPE)
                    self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_TYPE, inverse=True)
                    self.browser.clicks(self.LCT.ECG_EVENT_TYPE_OPTION, on_elements=lambda _, e: self.browser.execute_script(
                        'return arguments[0].textContent', e).lower() == by_type.lower(), stop_on_first=True)
                    break
                elif time.time() - start_time > 3 * 60:
                    break
        self.wait_for_all_event_ecg_available()
        # time.sleep(15)
    # Instant Reports

    def wait_until_instant_reports_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INS_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INS_DATA_CONTENT, inverse=True)

    def filter_study_details_instant_reports(self, text_search=None, sort_by=None):
        if text_search:
            self.browser.input_text(self.LCT.INS_SEARCHBY_INPUT, text_search)
        if sort_by:
            [self.sort_instant_reports(**sort_by)] if isinstance(sort_by, dict) else [
                self.sort_instant_reports(**sort_dict) for sort_dict in sort_by]  # dict/list
        self.wait_until_instant_reports_available()

    def sort_instant_reports(self, field, asc_or_desc):
        if field.lower() == 'report id':
            self.browser.click(self.LCT.STUDY_REPORT_ID)
            self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_ID, inverse=True)
            for _ in range(2):
                if asc_or_desc in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_ID, 'aria-sort'):
                    break
                self.browser.click(self.LCT.STUDY_REPORT_ID)
                self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_ID, inverse=True)
        if field.lower() == 'last modified':
            for _ in range(2):
                if asc_or_desc in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_LAST_MODIFIED, 'aria-sort'):
                    break
                self.browser.click(self.LCT.STUDY_REPORT_LAST_MODIFIED)

    def get_study_details_instant_report(self, row=None):
        self.wait_until_instant_reports_available()
        header = ['Report ID', 'Date Of Service', 'Last Modified', 'Status']
        self.logger.info(self.browser.get_tabular_data(header, self.LCT.INS_DATA_CONTENT, row=row))
        return self.browser.get_tabular_data(header, self.LCT.INS_DATA_CONTENT, row=row)

    def _on_instant_report_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        data = self.get_study_details_instant_report()
        for i, row in enumerate(data):
            _row = {key.replace(' ', '_').lower(): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such instant report exist on `{_on}`.')

    def view_study_details_instant_report_details_on(self, **on):
        _index = self._on_instant_report_item(**on)
        self.browser.hover_to(self.browser.get_elements_by_condition(
            self.LCT.INS_DATA_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True)[0])
        self.browser.clicks(self.LCT.INS_OPENREPORT, on_elements=lambda index, _: index == _index, stop_on_first=True)
        self.browser.wait_invisibility_of_element_located('class:pdf-loading-container')
        self.wait_until_instant_report_details_available()

    def delete_study_details_instant_report_on(self, is_delete=True, **on):
        _index = self._on_instant_report_item(**on)
        self.browser.hover_to(self.browser.get_elements_by_condition(
            self.LCT.INS_DATA_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True)[0])
        self.browser.clicks(self.LCT.INS_DELETEREPORT, on_elements=lambda index, _: index == _index, stop_on_first=True)
        if is_delete:
            self.browser.click(self.LCT.INS_DELETEREPORT_CONFIRM)
        self.wait_until_instant_reports_available()

    # Instant Reports Details

    def wait_until_instant_report_details_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INSDET_OVERVIEW_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INSDET_OVERVIEW_CONTENT)

    def get_overview_instant_report_details(self):
        self.wait_until_instant_report_details_available()
        header = self.browser.get_texts(self.LCT.INSDET_OVERVIEW_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.INSDET_OVERVIEW_CONTENT, row=1)

    def check_instant_report_detail_items_are_available(self, items):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.INSDET_PDFVIEWER) and self.browser.get_element(self.LCT.INSDET_PDFVIEWER).is_displayed():
                break
            elif time.time() - start_time > 1 * 60:  # 5 minutes in seconds
                break
        map_items = {
            'pdf viewer': self.browser.wait_visibility_of_element_located(self.LCT.INSDET_PDFVIEWER),
            'delete button': self.browser.wait_visibility_of_element_located(self.LCT.INSDET_DELETEICON),
            're-generate button': self.browser.wait_visibility_of_element_located(self.LCT.INSDET_REGENERATE),
            'download button': self.browser.wait_visibility_of_element_located(self.LCT.INSDET_DOWNLOADBUTTON),
            'add interpretation button': self.browser.wait_visibility_of_element_located(
                self.LCT.INSDET_ADDCOMMENTBUTTON),
            'add signature button': self.browser.wait_visibility_of_element_located(self.LCT.INSDET_ADDSIGNATUREBUTTON),
            'save button': self.browser.wait_visibility_of_element_located(self.LCT.INSDET_SAVEBUTTON),
        }
        output = dict()
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        for item in _items:
            if item.lower() not in map_items:
                raise Exception(f'No such instant_report item on {item}.')
            output.update({
                item: map_items[item.lower()]
            })
        return output

    def regenerate_instant_report(self, is_regenerate=True):
        self.browser.click(self.LCT.INSDET_REGENERATE)
        self.browser.wait_visibility_of_element_located(self.LCT.INSDET_REGENERATE_CONFIRM)
        if is_regenerate:
            self.browser.click(self.LCT.INSDET_REGENERATE_CONFIRM)

    def delete_instant_report_details(self, is_delete=True):
        self.browser.wait_visibility_of_element_located(self.LCT.INSDET_DELETEICON, inverse=True)
        self.browser.click(self.LCT.INSDET_DELETEICON)
        self.browser.wait_visibility_of_element_located(self.LCT.INS_DELETEREPORT_CONFIRM, inverse=True)
        if is_delete:
            self.browser.click(self.LCT.INS_DELETEREPORT_CONFIRM)

    def get_study_patient_details(self):
        self.navigate_to_study_details_tab('Patient details')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_ROOT_DATA)
        output = self.browser.get_texts(self.LCT.PTDET_ROOT_DATA)
        # reformat the output: TBD
        output = {o.split('\n')[0]: o.split('\n')[1:] for o in output}
        foutput = dict()
        # get info of Patient information
        value = output['Patient information']
        foutput['Patient information'] = {value[i].replace(':', ''): value[i + 1] for i in range(
            0, len(value), 2)}
        # get info of Patient contact
        value = output['Patient contact']
        foutput['Patient contact'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        # get info of Secondary contact
        value = output['Secondary contact']
        foutput['Secondary contact'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        # get info of Insurance
        value = output['Insurance']
        foutput['Insurance'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        # get info of Medical history
        for key, values in output.items():
            current_sub_dict = {}
            sub_key = ""
            for value in values:
                if value.endswith(':'):
                    sub_key = value.strip(':')
                else:
                    current_sub_dict[sub_key] = current_sub_dict.get(sub_key, '') + value + '\n'
            foutput[key] = {k: v.strip() for k, v in current_sub_dict.items()}
        return foutput

    def get_study_details_tracking(self):
        self.navigate_to_study_details_tab('Study details')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)
        output = dict()
        content_header = self.browser.get_texts(self.LCT.STDET_DATA_CONTENT_TRACKING)
        content_value = self.browser.get_texts(self.LCT.STDET_DATA_VALUE_TRACKING)
        output['Follow-on study tracking'] = {key.replace(':', ''): value for key, value in
                                              zip(content_header, content_value)}
        return output

    def get_page_header_detail(self):
        """
        Get page header detail
        :return: (str)
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.PAGE_HEADER_DETAIL) and self.browser.get_element(self.LCT.PAGE_HEADER_DETAIL).is_displayed():
                return self.browser.get_text(self.LCT.PAGE_HEADER_DETAIL).upper()
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_secondary_contact(self):
        """
        Get data current secondary contact
        :return: list()
        """
        output = {
            'Name': self.browser.get_attribute_value(self.LCT.PCONTACTST2_NAME, 'value'),
            'Phone Number': self.browser.get_attribute_value(self.LCT.PCONTACTST2_PHONENUMBER, 'value'),
            'Relationship': self.browser.get_attribute_value(self.LCT.PCONTACTST2_RELATIONSHIP, 'value'),
            'Email': self.browser.get_attribute_value(self.LCT.PCONTACTST2_EMAIL, 'value'),
        }
        return output

    def get_current_patient_contact(self):
        """
        Get data current patient contact
        :return: list()
        """
        self.browser.wait_text_to_be_present_in_element(self.LCT.PCONTACT_HEADER, 'Patient contact')
        output = {
            'Country': self.browser.get_text(self.LCT.PCONTACT_COUNTRY),
            'Address': self.browser.get_attribute_value(self.LCT.PCONTACT_ADDRESS + '//input', 'value'),
            'City': self.browser.get_attribute_value(self.LCT.PCONTACT_CITY + '//input', 'value'),
            'State': self.browser.get_attribute_value(self.LCT.PCONTACT_STATEST1 + '//input', 'value'),
            'Zip code': self.browser.get_attribute_value(self.LCT.PCONTACT_ZIPCODE, 'value'),
            'Primary phone number': self.browser.get_attribute_value(self.LCT.PCONTACT_PRIMARYPHONE, 'value'),
            'Email': self.browser.get_attribute_value(self.LCT.PCONTACT_EMAIL, 'value'),
            'Secondary phone number': self.browser.get_attribute_value(self.LCT.PCONTACT_SECONDARYPHONE, 'value'),
        }
        return output

    def get_current_patient_info(self):
        """
        Get data current patient info
        :return: list()
        """
        self.browser.wait_text_to_be_present_in_element(self.LCT.PCONTACT_HEADER, 'Patient information')
        self.browser.wait_visibility_of_element_located(self.LCT.PINFO_FIRSTNAME, inverse=True)
        output = {
            'Patient ID': self.browser.get_attribute_value(self.LCT.PINFO_PATIENTID, 'value'),
            'Name': self.browser.get_attribute_value(self.LCT.PINFO_FIRSTNAME,
                                                     'value') + ' ' + self.browser.get_attribute_value(
                self.LCT.PINFO_LASTNAME, 'value'),
            'Middle name': self.browser.get_attribute_value(self.LCT.PINFO_MIDDLENAME, 'value'),
            'DOB': self.browser.get_attribute_value(self.LCT.PINFO_DOB, 'value'),
            'Gender': self.browser.get_text(self.browser.get_elements_by_condition(
                self.LCT.PINFO_GENDER + '/..',
                on_elements=lambda _, e: '-checked' in self.browser.get_attribute_value(e, 'class'),
                stop_on_first=True)[0]),
            'Height': self.browser.get_attribute_value(self.LCT.PINFO_HEIGHTFT,
                                                       'value') + ' ft ' + self.browser.get_attribute_value(
                self.LCT.PINFO_HEIGHTIN, 'value') + ' in',
            'Weight': self.browser.get_attribute_value(self.LCT.PINFO_WEIGHT, 'value'),
            'Ethnicity': self.browser.get_text(self.LCT.PINFO_ETHNICITY),
            'Pacemaker': 'Yes' if 'checked' in self.browser.get_attribute_value(
                self.LCT.PINFO_PACEMAKER, 'class') else 'No',
            'ICD': 'Yes' if 'checked' in self.browser.get_attribute_value(
                self.LCT.PINFO_ICD, 'class') else 'No',
        }
        return output

    def get_current_insurance(self):
        """
        Get data current insurance
        :return: list()
        """
        output = {
            'Insurance type': self.browser.get_text(self.LCT.PINS_INSURANCETYPE),
            'Provider': self.browser.get_attribute_value(self.LCT.PINS_PROVIDER, 'value'),
        }
        for option in self.browser.get_elements(self.LCT.PINS_PREAUTHORIZATION):
            if '-checked' in self.browser.get_attribute_value(option, 'class'):
                output['Pre-authorization required'] = self.browser.get_text(option)
        return output

    def get_current_medical_history(self):
        """
        Get data current medical history
        :return: list()
        """
        output = {
            'Symptoms the patient experienced': self.browser.get_text(self.LCT.PMEDIHIS_SYMPTOMS),
            'Symptom frequency': self.browser.get_text(self.LCT.PMEDIHIS_SYMPTOMS_TIMEHAPPEN),
        }
        for option in self.browser.get_elements(self.LCT.PMEDIHIS_SYMPTOMS_HEARTMONITORBEFORE):
            if '-checked' in self.browser.get_attribute_value(option, 'class'):
                output['Used heart monitor'] = self.browser.get_text(option)
        return output

    def get_page_header_quick_access(self):
        """
        Get page header quick access
        """
        self.browser.wait_visibility_of_element_located(self.LCT.PAGE_HEADER_QUICK_ACCESS)
        return self.browser.get_text(self.LCT.PAGE_HEADER_QUICK_ACCESS).split('\n')

    def get_status_attribute_tracking(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA_HOLTER)
        return self.browser.get_texts(self.LCT.STDET_DATA_STATUS_TRACKING)

    def get_current_referring_physician(self):
        """
        Get data current referring physician
        :return: list()
        """
        output = {
            'Referring physician': self.browser.get_text(self.LCT.REFPHY_DIALOG_REFERPHYSICIAN)
        }
        return output

    def edit_study_details_physician_amendments_notes(self, physician_amendments_notes=None, is_change=True):
        if physician_amendments_notes:
            self.browser.wait_visibility_of_element_located(self.LCT.PYAN_DIALOG_INPUT)
            self.browser.scroll_into_view(self.LCT.PYAN_DIALOG_INPUT)
            self.browser.wait_visibility_of_element_located(self.LCT.PYAN_DIALOG_INPUT)
            self.browser.js_click(self.LCT.PYAN_DIALOG_INPUT)
            self.browser.clear_text(self.LCT.PYAN_DIALOG_INPUT)
            self.browser.input_text(self.LCT.PYAN_DIALOG_INPUT, physician_amendments_notes)
        if is_change:
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.click(self.LCT.STINFO_DIALOG_SAVE_CONFIRM)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)

    def get_current_physician_amendments_notes(self):
        """
        Get data current Physician Amendments Notes
        :return: list()
        """
        output = {
            'Physician amendments notes': self.browser.get_text(self.LCT.PYAN_DIALOG_INPUT)
        }
        return output

    def get_current_diagnosis(self):
        """
        Get data current diagnosis
        :return: list()
        """
        output = {
            'Primary diagnosis code': self.browser.get_text(self.LCT.DIAGNOSIS_DIALOG_PRIMARYDIAGNOSIS + '/../..'),
            'Secondary diagnosis code': self.browser.get_text(self.LCT.DIAGNOSIS_DIALOG_SECONDARYDIAGNOSIS + '/../..'),
            'Patient medication': self.browser.get_text(self.LCT.DIAGNOSIS_DIALOG_PATIENTMEDICATION)
        }
        return output

    def get_current_session_edit_study_detail(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STDET_REFPHYSICIAN_EDIT)
        self.browser.click(self.LCT.STDET_REFPHYSICIAN_EDIT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STEDIT_DATA_TITLE)
        return self.browser.get_texts(self.LCT.STEDIT_DATA_TITLE)

    def get_study_details_return_visit(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STDET_REFPHYSICIAN_EDIT)
        self.browser.click(self.LCT.STDET_REFPHYSICIAN_EDIT)
        self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_STUDY_DURATION)
        num_duration = self.browser.get_attribute_value(self.LCT.STINFO_DIALOG_STUDY_DURATION, 'value')
        current_date = datetime.now().date()
        after_days = current_date + timedelta(days=int(num_duration))
        current_date_active = after_days + timedelta(days=1)
        before_3_days = current_date_active + timedelta(days=2)
        output = []

        # Define a function to check if a date is a weekend (Saturday or Sunday)
        def is_weekend(date):
            return date.weekday() in [5, 6]
        while current_date_active <= before_3_days:
            if is_weekend(current_date_active):
                current_date_active += timedelta(days=1)
                before_3_days += timedelta(days=1)
                continue
            # Format the date in the same format as the date input
            date_format = "%m/%d/%Y"
            formatted_date = current_date_active.strftime(date_format)
            output.append(formatted_date)
            current_date_active += timedelta(days=1)
        self.browser.click(self.LCT.STINFO_DIALOG_CANCEL)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)
        return output

    def get_noti_patient_return_visit(self):
        """
        Get notification patient return visit
        """
        output = {
            "Date": self.browser.get_attribute_value(self.LCT.STINFO_DIALOG_PRV, 'value')
        }
        if self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_NOTI_VISIT):
            output['Notification'] = self.browser.get_text(self.LCT.STINFO_DIALOG_NOTI_VISIT)
        else:
            output['Notification'] = ''
        return output

    def get_current_interpreting_physician(self):
        """
        Get data current interpreting physician
        :return: list()
        """
        output = {
            'Interpreting physician': self.browser.get_text(self.LCT.INTERPHY_DIALOG_INTERPHYSICIAN)
        }
        return output

    def get_time_eta_by_time_erased(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA_HOLTER)
        date_erased = str(self.browser.get_text(self.LCT.STHISTORY_DATE).strip())
        date_format = "%m/%d/%Y"
        # Convert string to datetime object
        current_date = datetime.strptime(date_erased, date_format)
        # Now you can use strftime to format the date
        after_days = current_date + timedelta(days=4)
        output = []

        # Define a function to check if a date is a weekend (Saturday or Sunday)
        def is_weekend(date):
            return date.weekday() in [5, 6]

        while current_date <= after_days:
            if is_weekend(current_date):
                current_date += timedelta(days=1)
                after_days += timedelta(days=1)
                continue
            # Format the date in the same format as the date input
            date_format = "%m/%d/%Y"
            formatted_date = current_date.strftime(date_format)
            output.append(formatted_date)
            current_date += timedelta(days=1)
        return output

    def get_events_viewer(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EVENT_NONE, inverse=True)
        return self.browser.get_text(self.LCT.EVENT_NONE)

    def get_message_instant_report_archived(self):
        output = {
            "Create button": True if self.browser.wait_visibility_of_element_located(self.LCT.INSDET_CREATE) else False,
            "Message": self.browser.get_text(self.LCT.INSDET_MESSAGE)
        }
        return output

    def wait_reports_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_CONTENT, inverse=True)

    def get_study_details_summary_reports(self, row=None):
        self.wait_reports_available()
        """
        Get summary report
        :return: (list) list of dicts
        """
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.STUDY_REPORT_RAW)) == 10:
                header = [self.browser.get_attribute_value(self.LCT.STUDY_REPORT_ID, 'aria-label')] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + [
                             self.browser.get_attribute_value(self.LCT.STUDY_REPORT_LAST_MODIFIED, 'aria-label')] + [
                             self.browser.get_attribute_value(self.LCT.STUDY_REPORT_REPORT_TYPE, 'aria-label')] + \
                         [self.browser.get_attribute_value(self.LCT.STUDY_REPORT_STATUS, 'aria-label')]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDY_REPORT_NEXT, is_scroll=True)
                #     if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(self.LCT.NO_MORE_STUDY).is_displayed():
                #         return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_reports_available()
            else:
                self.wait_reports_available()
                header = [self.browser.get_attribute_value(self.LCT.STUDY_REPORT_ID, 'aria-label')] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + [
                             self.browser.get_attribute_value(self.LCT.STUDY_REPORT_LAST_MODIFIED, 'aria-label')] + [
                             self.browser.get_attribute_value(self.LCT.STUDY_REPORT_REPORT_TYPE, 'aria-label')] + \
                         [self.browser.get_attribute_value(self.LCT.STUDY_REPORT_STATUS, 'aria-label')]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def navigate_to_study_details_subtab(self, subtab):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_SUBTABS)
        self.browser.clicks(self.LCT.STUDY_REPORT_SUBTABS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == subtab.lower(),
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_SUBTABS, inverse=True)

    def get_study_details_notification_reports(self, row=None):
        self.wait_reports_available()
        """
        Get summary report
        :return: (list) list of dicts
        """
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.STUDY_REPORT_RAW)) == 10:
                header = ['Report ID'] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + ['Last modified'] + \
                         [self.browser.get_attribute_value(self.LCT.STUDY_REPORT_STATUS, 'aria-label')]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_NEXT, 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDY_REPORT_NEXT, is_scroll=True)
                #     if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(self.LCT.NO_MORE_STUDY).is_displayed():
                #         return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_reports_available()
            else:
                self.wait_reports_available()
                header = ['Report ID'] + \
                         [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + ['Last modified'] + \
                         [self.browser.get_attribute_value(self.LCT.STUDY_REPORT_STATUS, 'aria-label')]
                content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                self.logger.info(output)
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def get_study_details_notification_reports_on_page(self, row=None):
        self.wait_reports_available()
        """
        Get summary report
        :return: (list) list of dicts
        """
        header = ['Report ID'] + \
                 [self.browser.get_text(self.LCT.STUDY_REPORT_DOS)] + ['Last Modified'] + \
                 [self.browser.get_attribute_value(self.LCT.STUDY_REPORT_STATUS, 'aria-label')]
        content = self.browser.get_texts(self.LCT.STUDY_REPORT_CONTENT)
        output = Utils.group_tabular_data(header, content, row=row)
        self.logger.info(output)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def view_the_reports_on(self, **on):
        _index = self._on_study_detail_notification_reports(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_REPORT_VIEW)
        self.browser.clicks(self.LCT.STUDY_REPORT_VIEW, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_study_detail_notification_reports(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        data = self.get_study_details_notification_reports()
        for i, row in enumerate(data):
            _row = {key.replace(' ', '_').lower(): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such instant report exist on `{_on}`.')

    def back_study_detail_reports(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_BACK, inverse=True)
        self.browser.click(self.LCT.STUDY_REPORT_BACK)
        self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_BACK, inverse=True)

    def get_message_aborted_study_detail(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_ABORTED_MESSAGE)
        return self.browser.get_text(self.LCT.STUDY_REPORT_ABORTED_MESSAGE)

    def get_current_range_date(self):
        output = {
            'Start Date': self.browser.get_attribute_value(self.LCT.EVENT_STARTDATE, 'value'),
            'End Date': self.browser.get_attribute_value(self.LCT.EVENT_ENDDATE, 'value')
        }
        return output

    def check_filter_by_range_date(self, check_dates=None):
        range_date = self.get_current_range_date()
        start_date = datetime.strptime(range_date['Start Date'], '%m/%d/%Y')
        end_date = datetime.strptime(range_date['End Date'], '%m/%d/%Y')
        for date_str in check_dates:
            check_date = datetime.strptime(date_str, '%m/%d/%Y')
            if start_date <= check_date <= end_date:
                return True
            else:
                return False

    def get_study_details_tab(self):
        self.wait_until_study_details_overview_available()
        return self.browser.get_texts(self.LCT.TABS)

    def check_study_details_ecg_viewer_available(self):
        output = {
            'Refresh': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_REFRESH) and self.browser.get_element(self.LCT.ECG_REFRESH).get_attribute(
                'disabled') else True,
            'Indicator': True if self.browser.get_element(
                self.LCT.ECG_INDICATORS_CHECKBOX).get_attribute('disabled') is None and self.browser.get_element(self.LCT.ECG_INDICATORS_CHECKBOX).get_attribute(
                'checked') is not None else False,
            'Speed': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_SPEED) and self.browser.get_element(self.LCT.ECG_SPEED).get_attribute(
                'disabled') else True,
            'Gain': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_GAIN) and self.browser.get_element(self.LCT.ECG_GAIN).get_attribute('disabled') else True,
            'High Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_HIGH_PASS) and self.browser.get_element(self.LCT.ECG_HIGH_PASS).get_attribute(
                'disabled') else True,
            'Low Pass': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_LOW_PASS) and self.browser.get_element(self.LCT.ECG_LOW_PASS).get_attribute(
                'disabled') else True,
            'Show/Hide CH1': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_SHOW_HIDE_CH1) and self.browser.get_element(self.LCT.ECG_SHOW_HIDE_CH1).get_attribute(
                'disabled') else True,
            'Show/Hide CH2': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_SHOW_HIDE_CH2) and self.browser.get_element(self.LCT.ECG_SHOW_HIDE_CH2).get_attribute(
                'disabled') else True,
            'Show/Hide CH3': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_SHOW_HIDE_CH3) and self.browser.get_element(self.LCT.ECG_SHOW_HIDE_CH3).get_attribute(
                'disabled') else True,
            'Beat Marker Tool': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_BEAT_MARKER_TOOL) and self.browser.get_element(
                self.LCT.ECG_BEAT_MARKER_TOOL).get_attribute('disabled') else True,
            'View All Strip': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_VIEW_ALL_STRIP) and self.browser.get_element(self.LCT.ECG_VIEW_ALL_STRIP).get_attribute(
                'disabled') else True,
            'Add Beat Marker N': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_BEAT_MARKER_N) and self.browser.get_element(self.LCT.ECG_BEAT_MARKER_N).get_attribute(
                'disabled') else True,
            'Add Beat Marker S': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_BEAT_MARKER_S) and self.browser.get_element(self.LCT.ECG_BEAT_MARKER_S).get_attribute(
                'disabled') else True,
            'Add Beat Marker V': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_BEAT_MARKER_V) and self.browser.get_element(self.LCT.ECG_BEAT_MARKER_V).get_attribute(
                'disabled') else True,
            'Add Beat Marker Q': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_BEAT_MARKER_Q) and self.browser.get_element(self.LCT.ECG_BEAT_MARKER_Q).get_attribute(
                'disabled') else True,
            'Beat Marker Delete': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_BEAT_MARKER_DELETE) and self.browser.get_element(
                self.LCT.ECG_BEAT_MARKER_DELETE).get_attribute('disabled') else True,
        }
        self.logger.info(output)
        return output

    def get_study_details_ecg_viewer_filter(self):
        output = dict()
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_SPEED, inverse=True)
        self.browser.click(self.LCT.ECG_SPEED)
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_SPEED, inverse=True)
        output['Speed'] = self.browser.get_texts(self.LCT.ECG_SPEED_OPTION)

        self.browser.click(self.LCT.ECG_GAIN)
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_GAIN, inverse=True)
        output['Gain'] = self.browser.get_texts(self.LCT.ECG_SPEED_OPTION)

        self.browser.click(self.LCT.ECG_EVENT_TYPE)
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_TYPE, inverse=True)
        output['Event Type'] = self.browser.get_texts(self.LCT.ECG_EVENT_TYPE_OPTION)
        return output

    def wait_for_all_event_ecg_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_DATA_CONTENT, inverse=True)

    def get_study_details_ecg_viewer_events(self, row=None):
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.wait_for_all_event_ecg_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.ECG_DATA_ROW)) == 10:
                header = self.browser.get_texts(self.LCT.ECG_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ECG_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'true' in self.browser.get_attribute_value(self.LCT.STUDY_REPORT_NEXT, 'aria-disabled'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.STUDY_REPORT_NEXT)
                self.wait_for_all_event_ecg_available()
            else:
                self.wait_for_all_event_ecg_available()
                header = self.browser.get_texts(self.LCT.ECG_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.ECG_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                # print("check output", output)
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def view_study_details_event_ecg_viewer_on(self, **on):
        def on_item(**item):
            if 'row' in item:
                return int(item['row']) - 1
            events = self.get_study_details_ecg_viewer_events()
            _on = {k.replace(' ', '_').lower(): v for k, v in item.items()}
            for i, evts in enumerate(events):
                _event = {k.replace(' ', '_').lower(): v for k, v in evts.items()}
                if _on.items() <= _event.items():
                    return i
            raise Exception(f'No such event exist under `{_on}`')
        _index = on_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_DATA_CONTENT)
        self.browser.clicks(self.LCT.ECG_DATA_CONTENT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        self.browser.execute_script('window.scrollTo(2500,0)')

    def get_event_filter_ecg_viewer(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_FILTER_EVENT, inverse=True)
        event_filter_text = self.browser.get_texts(self.LCT.ECG_FILTER_EVENT)[0]
        output = event_filter_text.split('\n')
        output[0] = output[0].split()[1]
        return output

    def create_instant_report_on_study_details(self):
        self.browser.wait_visibility_of_element_located(self.LCT.INS_CREATE_INSREPORT)
        self.browser.click(self.LCT.INS_CREATE_INSREPORT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INS_SELECTED_DATE, inverse=True)
        self.browser.click(self.LCT.INS_SELECTED_DATE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INS_SELECTED_DATE, inverse=True)
        self.browser.click(self.LCT.INS_SELECTED_DATE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.INS_SELECTED_DATE, inverse=True)
        self.browser.wait_visibility_of_element_located(self.LCT.INS_CREATE_INSREPORT_SUBMIT, inverse=True)
        self.browser.click(self.LCT.INS_CREATE_INSREPORT_SUBMIT)
        self.browser.wait_visibility_of_element_located(self.LCT.INS_CREATE_INSREPORT, inverse=True)
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.INS_CHECKED_CREATED) and self.browser.get_elements(self.LCT.INS_CHECKED_CREATED)[0].is_displayed():
                break
            elif time.time() - start_time > 1 * 60:  # 5 minutes in seconds
                break

    def open_study_details_device_returned(self, turn_on=False, turn_off=False):
        if turn_on:
            self.browser.wait_visibility_of_element_located(self.LCT.RS_DEVICE_RETURNED, inverse=True)
            if 'true' in self.browser.get_attribute_value(self.LCT.RS_DEVICE_RETURNED, 'aria-checked'):
                return self
            else:
                self.browser.click(self.LCT.RS_DEVICE_RETURNED)
                self.browser.wait_visibility_of_element_located(self.LCT.RS_DEVICE_RETURNED, inverse=True)
                self.browser.click(self.LCT.RS_SAVE)
                self.browser.wait_visibility_of_element_located(self.LCT.RS_SAVE, inverse=True)
        if turn_off:
            self.browser.wait_visibility_of_element_located(self.LCT.RS_DEVICE_RETURNED, inverse=True)
            if 'false' in self.browser.get_attribute_value(self.LCT.RS_DEVICE_RETURNED, 'aria-checked'):
                return self
            else:
                self.browser.click(self.LCT.RS_DEVICE_RETURNED)
                self.browser.wait_visibility_of_element_located(self.LCT.RS_DEVICE_RETURNED, inverse=True)
                self.browser.click(self.LCT.RS_SAVE)
                self.browser.wait_visibility_of_element_located(self.LCT.RS_SAVE, inverse=True)

    def check_return_status_received_items_available(self):
        output = {
            'Device': True if 'checked' in self.browser.get_attribute_value(self.LCT.RS_DEVICE, 'class') else False,
            'Accessories': True if 'checked' in self.browser.get_attribute_value(self.LCT.RS_ACCESSORIES, 'class') else False,
            'Box': True if 'checked' in self.browser.get_attribute_value(self.LCT.RS_BOX, 'class') else False,
            'Cable': True if 'checked' in self.browser.get_attribute_value(self.LCT.RS_CABLE, 'class') else False,
            'Charger': True if 'checked' in self.browser.get_attribute_value(self.LCT.RS_CHARGER, 'class') else False,
            'Quick Guide': True if 'checked' in self.browser.get_attribute_value(self.LCT.RS_QUICK_GUIDE, 'class') else False,
        }
        self.logger.info(output)
        return output

    def edit_study_details_return_status(self, edit_notes=None, is_save=True):
        if edit_notes:
            self.browser.wait_visibility_of_element_located(self.LCT.RS_NOTES_INPUT, inverse=True)
            self.browser.input_text(self.LCT.RS_NOTES_INPUT, edit_notes)
            self.browser.wait_visibility_of_element_located(self.LCT.RS_NOTES_INPUT, inverse=True)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.RS_SAVE)
            self.browser.click(self.LCT.RS_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.RS_SAVE, inverse=True)

    def get_current_return_status_note(self):
        self.browser.wait_visibility_of_element_located(self.LCT.RS_NOTES_INPUT)
        return self.browser.get_text(self.LCT.RS_NOTES_INPUT)

    def get_completed_study_details_return_visit(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STDET_REFPHYSICIAN_EDIT)
        self.browser.click(self.LCT.STDET_REFPHYSICIAN_EDIT)
        self.browser.wait_visibility_of_element_located(self.LCT.STINFO_DIALOG_STUDY_DURATION)
        current_date = datetime.now().date()
        after_days = current_date + timedelta(days=0)
        current_date_active = after_days + timedelta(days=1)
        before_3_days = current_date_active + timedelta(days=2)
        output = []

        # Define a function to check if a date is a weekend (Saturday or Sunday)
        def is_weekend(date):
            return date.weekday() in [5, 6]
        while current_date_active <= before_3_days:
            if is_weekend(current_date_active):
                current_date_active += timedelta(days=1)
                before_3_days += timedelta(days=1)
                continue
            # Format the date in the same format as the date input
            date_format = "%m/%d/%Y"
            formatted_date = current_date_active.strftime(date_format)
            output.append(formatted_date)
            current_date_active += timedelta(days=1)
        self.browser.click(self.LCT.STINFO_DIALOG_CANCEL)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STDET_DATA)
        return output

    def get_diagnosis_code_text(self):
        self.browser.execute_script('window.scrollTo(0, 700)')
        self.browser.wait_visibility_of_element_located(self.LCT.DIAGNOSIS_PRIMARYDIAGNOSIS)
        data = [
            {"primary":None ,"second": None}
        ]
        data[0]["primary"]=self.browser.get_text(self.LCT.DIAGNOSIS_PRIMARYDIAGNOSIS)
        data[0]["second"] = self.browser.get_text(self.LCT.DIAGNOSIS_SECONDARYDIAGNOSIS)
        return data


    def get_facility_information(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STDET_FACILITY)
        output=self.browser.get_text(self.LCT.STDET_FACILITY)
        # time.sleep(5)
        self.browser.click(self.LCT.INSDET_BACK)
        return output
