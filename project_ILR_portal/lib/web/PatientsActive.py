#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import patients_active as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class PatientsActive(WebPage):
    """
    Handle Patients > Active page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_patients_active(self):
        self.browser.open_page(self.URL + '/patients/active')

    def wait_for_active_patients_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT + '//*')

    def filter_active_patients(self, by_patient=None, search_by=None, text_search=None):
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
            self.browser.click(self.LCT.TEXTSEARCH)  # handle in case of search_by box not closed
            self.browser.input_text(self.LCT.TEXTSEARCH, text_search)
        self.browser.wait_invisibility_of_element_located('selector:div.ant-spin-nested-loading span.ant-spin-dot-spin')
        self.wait_for_active_patients_available()

    def sort_active_patients(self, field, up_or_down):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_HEADER)
        locator_click = {
            'start date': self.LCT.DATA_HEADER_STARTDATE,
            'next follow-up date': self.LCT.DATA_HEADER_NEXTFUDATE
        }[field.lower()]
        element_state = self.browser.get_child_element(locator_click,
                                                       f'xpath:.//*[@aria-label="caret-{up_or_down.lower()}"]')
        for _ in range(2):  # max attempts is 2
            if 'active' in self.browser.get_attribute_value(element_state, 'class'):
                break
            self.browser.click(locator_click)
        self.wait_for_active_patients_available()

    def get_active_patients(self, row=None):
        self.wait_for_active_patients_available()
        header = self.browser.get_texts(self.LCT.DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.DATA_CONTENT, row=row)

    def _index_on_item(self, **on):
        self.wait_for_active_patients_available()
        if 'row' in on:
            return int(on['row']) - 1
        active_patients = self.get_active_patients()
        # Reformat keys of patients and on
        active_patients = [{k.replace(' ', '_').replace('-', '_').lower(): v for k, v in patient_info.items()}
                           for patient_info in list(active_patients)]
        _on = {k.replace(' ', '_').replace('-', '_').lower(): v for k, v in on.items()}
        # Get the index
        for i, patient in enumerate(active_patients):
            if _on.items() <= patient.items():
                return i
        raise Exception(f'No such active patients exist under {_on}.')

    def view_active_patient_details_on(self, **on):
        self.wait_for_active_patients_available()
        _index = self._index_on_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT_ROOT)
        self.browser.clicks(self.LCT.DATA_CONTENT_ROOT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_active_patient_appointment_summary_on(self, **on):
        _index = self._index_on_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT_PATIENTNAME)
        self.browser.clicks(self.LCT.DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def open_active_patient_new_appointment_on(self, **on):
        _index = self._index_on_item(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT_CALENDARICON)
        self.browser.clicks(self.LCT.DATA_CONTENT_CALENDARICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
