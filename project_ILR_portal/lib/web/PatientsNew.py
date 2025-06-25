#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import patients_new as locators
    from corelib import Utils
    from selenium.webdriver import Keys
    import re
    import os

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class PatientsNew(WebPage):
    """
    Handle Patients > New page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_patients_new(self):
        self.browser.open_page(self.URL + '/patients/new')

    def wait_for_registered_patients_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_CONTENT + '//*')

    def wait_for_assigned_patients_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASN_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASN_DATA_CONTENT + '//*')

    def wait_for_deleted_patients_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEL_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEL_DATA_CONTENT + '//*')

    def wait_for_new_patients_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_DATA_CONTENT + '//*')

    def filter_registered_patients(self, by_status=None, search_by=None, text_search=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: 'Registered' in self.browser.get_text(e),
                            stop_on_first=True)
        if by_status:
            self.browser.click(self.LCT.REG_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_STATUS_OPTIONS)
            self.browser.clicks(self.LCT.REG_STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_status.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.REG_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.REG_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.REG_TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.input_text(self.LCT.REG_TEXTSEARCH, text_search)
        self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_CONTENT)

    def get_registered_patients(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_CONTENT)
        header = self.browser.get_texts(self.LCT.REG_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.REG_DATA_CONTENT, row=row)

    def _index_on_registered_patients(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_CONTENT)
        if 'row' in on:
            return int(on['row']) - 1
        registered_patients = self.get_registered_patients()
        # Reformat keys of patients and on
        registered_patients = [{k.replace(' ', '_').lower(): v for k, v in patient_info.items()}
                               for patient_info in list(registered_patients)]
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        # Get the index
        for i, patient in enumerate(registered_patients):
            if _on.items() <= patient.items():
                return i
        raise Exception(f'No such registered patients exist under {_on}.')

    def view_registered_patient_details_on(self, **on):
        _index = self._index_on_registered_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_CONTENT)
        self.browser.clicks(self.LCT.REG_DATA_CONTENT_ROOT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_registered_patient_appointment_summary_on(self, **on):
        _index = self._index_on_registered_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_CONTENT_PATIENTNAME)
        self.browser.clicks(self.LCT.REG_DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def open_registered_patient_new_appointment_on(self, **on):
        _index = self._index_on_registered_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_CONTENT)
        self.browser.clicks(self.LCT.REG_CALENDARICON, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def filter_assigned_patients(self, by_patient=None, search_by=None, text_search=None):
        self.browser.clicks(self.LCT.TABS,
                            on_elements=lambda _, e: 'Healthcare Team Assigned' in self.browser.get_text(e),
                            stop_on_first=True)
        if by_patient:
            self.browser.click(self.LCT.ASN_BYPATIENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ASN_BYPATIENT_OPTIONS)
            self.browser.clicks(self.LCT.ASN_BYPATIENT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.ASN_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ASN_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.ASN_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.ASN_TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.ASN_TEXTSEARCH)  # resolve case of textbox not closed
            self.browser.input_text(self.LCT.ASN_TEXTSEARCH, text_search)
        self.browser.wait_invisibility_of_element_located('selector:div.loading-space.ant-space-align-center')
        self.wait_for_assigned_patients_available()

    def get_assigned_patients(self, row=None):
        self.wait_for_assigned_patients_available()
        header = self.browser.get_texts(self.LCT.ASN_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.ASN_DATA_CONTENT, row=row)

    def _index_on_assigned_patients(self, **on):
        self.wait_for_assigned_patients_available()
        if 'row' in on:
            return int(on['row']) - 1
        assigned_patients = self.get_assigned_patients()
        # Reformat keys of patients and on
        assigned_patients = [{k.replace(' ', '_').lower(): v for k, v in patient_info.items()}
                             for patient_info in list(assigned_patients)]
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        # Get the index
        for i, patient in enumerate(assigned_patients):
            if _on.items() <= patient.items():
                return i
        raise Exception(f'No such assigned patients exist under {_on}.')

    def view_assigned_patient_details_on(self, **on):
        self.wait_for_assigned_patients_available()
        _index = self._index_on_assigned_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASN_DATA_CONTENT_ROW + '//div')
        self.browser.clicks(self.LCT.ASN_DATA_CONTENT_ROW, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_assigned_patient_appointment_summary_on(self, **on):
        self.wait_for_assigned_patients_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASN_DATA_CONTENT_PATIENTNAME)
        _index = self._index_on_assigned_patients(**on)
        self.browser.clicks(self.LCT.ASN_DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def open_assigned_patient_new_appointment_on(self, **on):
        _index = self._index_on_assigned_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ASN_CALENDARICON)
        self.browser.clicks(self.LCT.ASN_CALENDARICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def filter_deleted_patients(self, by_patient=None, search_by=None, text_search=None):
        self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: 'Deleted' in self.browser.get_text(e),
                            stop_on_first=True)
        if by_patient:
            self.browser.click(self.LCT.DEL_BYPATIENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.DEL_BYPATIENT_OPTIONS)
            self.browser.clicks(self.LCT.DEL_BYPATIENT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.DEL_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.DEL_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.DEL_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.DEL_SEARCHBOX, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.DEL_SEARCHBOX)
            self.browser.input_text(self.LCT.DEL_SEARCHBOX, text_search)
        self.browser.wait_invisibility_of_element_located('selector:div.ant-spin-nested-loading span.ant-spin-dot-spin')
        self.wait_for_deleted_patients_available()

    def get_deleted_patients(self, row=None):
        self.wait_for_deleted_patients_available()
        header = self.browser.get_texts(self.LCT.DEL_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.DEL_DATA_CONTENT, row=row)

    def _index_on_deleted_patients(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEL_DATA_CONTENT)
        if 'row' in on:
            return int(on['row']) - 1
        deleted_patients = self.get_deleted_patients()
        # Reformat keys of patients and on
        deleted_patients = [{k.replace(' ', '_').lower(): v for k, v in patient_info.items()}
                            for patient_info in list(deleted_patients)]
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        # Get the index
        for i, patient in enumerate(deleted_patients):
            if _on.items() <= patient.items():
                return i
        raise Exception(f'No such deleted patients exist under {_on}.')

    def open_deleted_patient_new_appointment_on(self, **on):
        _index = self._index_on_deleted_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEL_DATA_CONTENT_PATIENTNAME)
        self.browser.clicks(self.LCT.DEL_DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def restore_care_plan_on(self, **on):
        _index = self._index_on_deleted_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEL_DATA_RESTORE)
        self.browser.clicks(self.LCT.DEL_DATA_RESTORE, on_elements=lambda i, _: i == _index, stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.DEL_DATA_RESTORE_YES)
        self.browser.click(self.LCT.DEL_DATA_RESTORE_YES)

    def filter_new_patients(self, by_patient=None, by_status=None, search_by=None, text_search=None):
        self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: 'New' in self.browser.get_text(e),
                            stop_on_first=True)
        if by_patient:
            self.browser.click(self.LCT.NEW_BYPATIENT)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_BYPATIENT_OPTIONS)
            self.browser.clicks(self.LCT.NEW_BYPATIENT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                stop_on_first=True)
        if by_status:
            self.browser.click(self.LCT.NEW_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STATUS_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_status.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.NEW_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.NEW_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.NEW_SEACHBOX, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.NEW_SEACHBOX)
            self.browser.input_text(self.LCT.NEW_SEACHBOX, text_search)
        self.browser.wait_invisibility_of_element_located('selector:div.ant-spin-nested-loading')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_DATA_CONTENT)

    def get_new_patients(self, row=None):
        self.wait_for_new_patients_available()
        headers = self.browser.get_texts(self.LCT.NEW_DATA_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.NEW_DATA_CONTENT, row=row)

    def _index_on_new_patients(self, **on):
        self.wait_for_new_patients_available()
        if 'row' in on:
            return int(on['row']) - 1
        new_patients = self.get_new_patients()
        new_patients = [{k.replace(' ', '_').lower(): v for k, v in patient_info.items()} for patient_info in
                        list(new_patients)]
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, patient in enumerate(new_patients):
            if _on.items() <= patient.items():
                return i
        raise Exception(f'No such new patients exist under {_on}')

    def view_new_patient_details_on(self, **on):
        self.wait_for_new_patients_available()
        _index = self._index_on_new_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_DATA_CONTENT_ROW)
        self.browser.clicks(self.LCT.NEW_DATA_CONTENT_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def view_new_patient_appointment_summary_on(self, **on):
        self.wait_for_new_patients_available()
        _index = self._index_on_new_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_DATA_CONTENT_PATIENTNAME)
        self.browser.clicks(self.LCT.NEW_DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def open_new_patient_new_appointment_on(self, **on):
        self.wait_for_new_patients_available()
        _index = self._index_on_new_patients(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_CALENDARICON)
        self.browser.clicks(self.LCT.NEW_CALENDARICON, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def open_add_new_patient(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ADDNEWPATIENT)
        self.browser.click(self.LCT.ADDNEWPATIENT)
        self.browser.wait_invisibility_of_element_located(self.LCT.ADDNEWPATIENT)

    def add_insurance_details(self, insurance_name=None, provincial_billing=None, insurance_expiration=None):
        if insurance_name:
            if self.browser.get_text(self.LCT.ANP_COUNTRY) == 'United States':
                self.browser.click(self.LCT.ANP_INSURANCENAMEV2)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_INSURANCENAMEV2_OPTIONS)
                self.browser.clicks(self.LCT.ANP_INSURANCENAMEV2_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == insurance_name.lower(),
                                    stop_on_first=True)
            else:
                self.browser.input_text(self.LCT.ANP_INSURANCENAMEV1, insurance_name)
        if provincial_billing:
            self.browser.input_text(self.LCT.ANP_INSURANCEPROVINCIAL, provincial_billing)
        if insurance_expiration:
            if insurance_expiration == 'today':
                self.browser.click(self.LCT.ANP_INSURANCEEXPIRIREDATE)
                self.browser.wait_visibility_of_element_located(self.LCT.ANP_INSURANCEEXPIRIREDATE_TODAY)
                self.browser.click(self.LCT.ANP_INSURANCEEXPIRIREDATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.ANP_INSURANCEEXPIRIREDATE, "readonly")
                self.browser.input_text(self.LCT.ANP_INSURANCEEXPIRIREDATE, insurance_expiration)
                self.browser.get_element(self.LCT.ANP_INSURANCEEXPIRIREDATE).send_keys(Keys.ENTER)

    def add_new_patient_by_manual_input(self, clinic_info=None, template=None, email=None, first_name=None,
                                        last_name=None, phone_number=None, dob=None, gender=None, country=None,
                                        address=None, city=None, state=None, zip_code=None, height=None, weight=None,
                                        payment_type=None, insurance_details=None, is_add=True):
        # Input Type
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_INPUTTYPES, timeout=10)
        self.browser.clicks(self.LCT.ANP_INPUTTYPES, on_elements=lambda i, _: i == 0, stop_on_first=True)
        if clinic_info:
            self.browser.input_text(self.LCT.ANP_CLINICINFO + '//input', clinic_info)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_CLINICINFO_OPTIONS)
            self.browser.clicks(self.LCT.ANP_CLINICINFO_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == clinic_info.lower(),
                                stop_on_first=True)
        if template:
            self.browser.input_text(self.LCT.ANP_TEMPLATE + '//input', template)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_TEMPLATE_OPTIONS)
            self.browser.get_element(self.LCT.ANP_TEMPLATE + '//input').send_keys(Keys.ENTER)
        if email:
            self.browser.input_text(self.LCT.ANP_EMAIL, email)
        if first_name:
            self.browser.input_text(self.LCT.ANP_FNAME, first_name)
        if last_name:
            self.browser.input_text(self.LCT.ANP_LNAME, last_name)
        if dob:
            if dob == 'today':
                self.browser.click(self.LCT.ANP_DOB)
                self.browser.wait_visibility_of_element_located(self.LCT.ANP_DOB_TODAY)
                self.browser.click(self.LCT.ANP_DOB_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.ANP_DOB, "readonly")
                self.browser.input_text(self.LCT.ANP_DOB, dob)
                self.browser.get_element(self.LCT.ANP_DOB).send_keys(Keys.ENTER)
        if gender:
            self.browser.click(self.LCT.ANP_GENDER)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_GENDER_OPTIONS)
            self.browser.clicks(self.LCT.ANP_GENDER_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == gender.lower(),
                                stop_on_first=True)
        if phone_number:
            self.browser.input_text(self.LCT.ANP_PHONENUMBER, phone_number)
        if country:
            self.browser.click(self.LCT.ANP_COUNTRY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.ANP_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.ANP_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.ANP_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.ANP_CITY, city)
        if state:
            self.browser.scroll_into_view(self.LCT.ANP_PAYMENTTYPE)
            country = self.browser.get_text(self.LCT.ANP_COUNTRY)
            if country == 'Canada' or country == 'United States':
                self.browser.input_text(self.LCT.ANP_STATEV2 + '//input', state)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_STATEV2_OPTIONS)
                self.browser.clicks(self.LCT.ANP_STATEV2_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                    stop_on_first=True)
            else:
                self.browser.input_text(self.LCT.ANP_STATEV1)
        if zip_code:
            self.browser.input_text(self.LCT.ANP_ZIPCODE, zip_code)
        if height:
            map_measurement = {
                True: ['height (ft, in)', [self.LCT.ANP_HEIGHT_AF, self.LCT.ANP_HEIGHT_XF]],
                False: ['height (ft)', [self.LCT.ANP_HEIGHT_AF]]
            }
            cond = height.endswith('in')
            _height = re.sub('ft|in|,', ' ', height).strip().split()
            [self.browser.input_text(e, text) for e, text in zip(map_measurement[cond][1], _height)]
        if weight:
            map_measurement = {
                True: [self.LCT.ANP_WEIGHT]
            }
            cond = weight.endswith('lb')
            _weight = weight.replace('lb', '').strip()
            self.browser.input_text(map_measurement[cond][0], _weight)
        if payment_type:
            self.browser.clicks(self.LCT.ANP_PAYMENTTYPE,
                                on_elements=lambda _, e:
                                self.browser.get_attribute_value(e, 'value').lower() == payment_type.lower(),
                                stop_on_first=True)
        if insurance_details:
            self.add_insurance_details(**insurance_details) if isinstance(insurance_details, dict) else [
                self.add_insurance_details(**insurance_detail) for insurance_detail in insurance_details]
        if is_add:
            self.browser.click(self.LCT.ANP_ADDBUTTON)
        # wait for register loaded
        self.browser.wait_visibility_of_all_elements_located(self.LCT.REG_DATA_HEADER)

    def add_patient_list(self, is_add=True):
        """
        Add the patients into system after import xlxs/csv file
        @param is_add:
        @type is_add:
        @return:
        @rtype:
        """
        if is_add:
            self.browser.click(self.LCT.APL_ADDPATIENTS)
        self.browser.wait_invisibility_of_element_located(self.LCT.APL_ADDPATIENTS)

    def add_new_patients_by_bulk_import(self, file_path, clinic_info=None, template=None, add_patients=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_INPUTTYPES, timeout=10)
        self.browser.js_clicks(self.LCT.ANP_INPUTTYPES, on_elements=lambda i, _: i == 1, stop_on_first=True,
                               is_scroll=True)
        if clinic_info:
            self.browser.wait_visibility_of_element_located(self.LCT.ANP_CLINICINFO)
            self.browser.click(self.LCT.ANP_CLINICINFO)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ANP_CLINICINFO_OPTIONS)
            self.browser.clicks(self.LCT.ANP_CLINICINFO_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == clinic_info.lower(),
                                stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.ANP_IMPORTPLIST)
        self.browser.js_click(self.LCT.ANP_IMPORTPLIST)
        if template:
            self.browser.wait_visibility_of_element_located(self.LCT.APL_TEMPLATE)
            self.browser.input_text(self.LCT.APL_TEMPLATE, template)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.APL_TEMPLATE_OPTIONS)
            self.browser.clicks(self.LCT.APL_TEMPLATE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == template.lower(),
                                stop_on_first=True)
        if file_path:
            _file_path = os.path.abspath(file_path)
            if not os.path.isfile(file_path):
                raise Exception(f'Not such file exist under {file_path}')
            self.browser.set_attribute_element(self.LCT.APL_IMPORTAREA, 'style', 'display: true')
            self.browser.input_text(self.LCT.APL_IMPORTAREA, _file_path, is_clear=False)
        # overlapped (invisible) after importing, so perform js click
        self.browser.js_click(self.LCT.APL_CONFIRMIMPORT)
        if add_patients:
            self.add_patient_list(add_patients)

    def get_import_patient_list(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APL_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.APL_DATA_CONTENT)
        header = self.browser.get_texts(self.LCT.APL_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.APL_DATA_CONTENT, row=row)

    def open_management_templates(self):
        self.browser.click(self.LCT.MANAGETEMPLATES)
