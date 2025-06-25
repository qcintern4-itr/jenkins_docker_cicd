#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import patients_inactive as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class PatientsInactive(WebPage):
    """
    Handle Patients > Active page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_patients_inactive(self):
        self.browser.open_page(self.URL + '/patients/inactive')

    def wait_for_inactive_patients_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT + '//*')

    def filter_inactive_patients(self, by_patient=None, search_by=None, text_search=None):
        if by_patient:
            self.browser.click(self.LCT.BYPATIENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BYPATIENT_OPTIONS)
            self.browser.clicks(self.LCT.BYPATIENT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.TEXTSEARCH)  # handle in case of search by text box not closed
            self.browser.input_text(self.LCT.TEXTSEARCH, text_search)
        self.browser.wait_invisibility_of_element_located('selector:div.ant-spin-nested-loading span.ant-spin-dot-spin')
        self.wait_for_inactive_patients_available()

    def get_inactive_patients(self, row=None):
        self.wait_for_inactive_patients_available()
        header = self.browser.get_texts(self.LCT.DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.DATA_CONTENT, row=row)

    def _index_on_item(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT)
        if 'row' in on:
            return int(on['row']) - 1
        inactive_patients = self.get_inactive_patients()
        # Reformat keys of patients and on
        inactive_patients = [{k.replace(' ', '_').replace('-', '_').lower(): v for k, v in patient_info.items()}
                             for patient_info in list(inactive_patients)]
        _on = {k.replace(' ', '_').replace('-', '_').lower(): v for k, v in on.items()}
        # Get the index
        for i, patient in enumerate(inactive_patients):
            if _on.items() <= patient.items():
                return i
        raise Exception(f'No such active patients exist under {_on}.')

    def view_inactive_patient_details_on(self, **on):
        self.wait_for_inactive_patients_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT_ROW)
        _index = self._index_on_item(**on)
        self.browser.clicks(self.LCT.DATA_CONTENT_ROW, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_inactive_patient_appointment_summary_on(self, **on):
        self.wait_for_inactive_patients_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT_PATIENTNAME)
        _index = self._index_on_item(**on)
        self.browser.clicks(self.LCT.DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
