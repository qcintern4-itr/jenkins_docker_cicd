#!/usr/bin/env python3

try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import devices_studies as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class DevicesStudies(WebPage):
    """
    Handle Devices > Heart Studies
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_devices_heart_studies(self):
        self.browser.open_page(self.URL + '/heartmonitor/study')

    def wait_for_heart_studies_prescription_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIPTION_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIPTION_CONTENT + '//*')

    def wait_for_heart_studies_active_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_HEADER_1)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_HEADER_2)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT_1)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_DATA_CONTENT_2)

    def wait_for_heart_studies_completed_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_CONTENT + '//*')

    def filter_heart_studies_prescription(self, by_prescription=None, search_by=None, text_search=None):
        self.browser.clicks(self.LCT.TABS, on_elements=lambda i, _: i == 0, stop_on_first=True)
        if by_prescription:
            self.browser.click(self.LCT.PRESCRIPTION_BYPRESCRIPTION)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIPTION_BYPRESCRIPTION_OPTIONS)
            self.browser.clicks(self.LCT.PRESCRIPTION_BYPRESCRIPTION_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_prescription.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.click(self.LCT.PRESCRIPTION_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PRESCRIPTION_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.PRESCRIPTION_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.PRESCRIPTION_TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.PRESCRIPTION_TEXTSEARCH)
            self.browser.input_text(self.LCT.PRESCRIPTION_TEXTSEARCH, text_search)
        self.browser.wait_invisibility_of_element_located('selector:div.ant-spin-nested-loading span.ant-spin-dot-spin')
        self.wait_for_heart_studies_prescription_available()

    def filter_heart_studies_active(self, by_patient=None, search_by=None, text_search=None):
        self.browser.clicks(self.LCT.TABS, on_elements=lambda i, _: i == 1, stop_on_first=True)
        if by_patient:
            if 'Clinic Physician' in self.get_user_role():
                self.browser.click(self.LCT.ACTIVE_BYBATIENT)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_BYBATIENT_OPTIONS)
                self.browser.clicks(self.LCT.ACTIVE_BYBATIENT_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e),
                                    stop_on_first=True)
            else:
                raise Exception('Is not visible in User with role = ' + self.get_user_role())
        if search_by:
            self.browser.click(self.LCT.ACTIVE_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.ACTIVE_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.ACTIVE_TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.ACTIVE_TEXTSEARCH)
            self.browser.input_text(self.LCT.ACTIVE_TEXTSEARCH, text_search)
        self.wait_for_heart_studies_active_available()

    def filter_heart_studies_completed(self, by_patient=None, search_by=None, text_search=None):
        self.browser.clicks(self.LCT.TABS, on_elements=lambda i, _: i == 2, stop_on_first=True)
        if by_patient:
            if 'Clinic Physician' in self.get_user_role():
                self.browser.click(self.LCT.COMPLETED_BYPATIENT)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_BYPATIENT_OPTIONS)
                self.browser.clicks(self.LCT.COMPLETED_BYPATIENT_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == by_patient.lower(),
                                    stop_on_first=True)
            else:
                raise Exception('Is not visible in User with role = ' + self.get_user_role())
        if search_by:
            self.browser.click(self.LCT.COMPLETED_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.COMPLETED_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.COMPLETED_TEXTSEARCH, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.click(self.LCT.COMPLETED_TEXTSEARCH)  # to handle the case the search_by box not closed
            self.browser.input_text(self.LCT.COMPLETED_TEXTSEARCH, text_search)
        self.wait_for_heart_studies_completed_available()

    def get_heart_studies_prescription(self, row=None):
        self.wait_for_heart_studies_prescription_available()
        header = self.browser.get_texts(self.LCT.PRESCRIPTION_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.PRESCRIPTION_CONTENT, row=row)

    def get_heart_studies_active(self):
        self.wait_for_heart_studies_active_available()
        output = []
        for root_element in self.browser.get_elements(self.LCT.ACTIVE_STUDY_DATA_ROOT):
            # get header
            header_elements = self.browser.get_child_elements(root_element, self.LCT.ACTIVE_DATA_HEADER_1)
            header_elements += self.browser.get_child_elements(root_element, self.LCT.ACTIVE_DATA_HEADER_2)
            header = [text.replace(':', '') for text in
                      self.browser.get_texts(header_elements)] + ['Facility name'] + ['Study status'] + ['Progress']
            # get facility
            facility_name = self.browser.get_child_elements(root_element, self.LCT.ACTIVE_FACILITYNAME)
            facility = self.browser.get_texts(facility_name)
            # get study status
            study_status = self.browser.get_child_elements(root_element, self.LCT.ACTIVE_STUDYSTATUS)
            status = self.browser.get_texts(study_status)
            # get progress
            study_progress = self.browser.get_child_elements(root_element, self.LCT.ACTIVE_STUDYPROGRESS)
            progress = self.browser.get_texts(study_progress)
            # get content
            content_elements = self.browser.get_child_elements(root_element, self.LCT.ACTIVE_DATA_CONTENT_1)
            content_elements += self.browser.get_child_elements(root_element, self.LCT.ACTIVE_DATA_CONTENT_2)
            content = self.browser.get_texts(content_elements) + facility + status + progress
            # format + append study to output
            output.append({key: value.replace('\n', ' | ') for key, value in zip(header, content)})
        self.logger.info(output)
        return output

    def get_heart_studies_completed(self, row=None):
        self.wait_for_heart_studies_completed_available()
        header = self.browser.get_texts(self.LCT.COMPLETED_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.COMPLETED_CONTENT, row=row)

    def _on_active_study_item(self, **on):
        self.wait_for_heart_studies_active_available()
        if 'row' in on:
            return int(on['row'] - 1)
        _active_studies = self.get_heart_studies_active()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(_active_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such study prescription items exist under `{_on}`.')

    def view_heart_studies_active_study_appointment_summary_on(self, **on):
        self.wait_for_heart_studies_active_available()
        _index = self._on_active_study_item(**on)
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_heart_studies_active_study_information_on(self, **on):
        self.wait_for_heart_studies_active_available()
        _index = self._on_active_study_item(**on)
        self.browser.clicks(self.LCT.ACTIVE_DATA_CONTENT_CAREPLAN, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_study_prescription_item(self, **on):
        self.wait_for_heart_studies_prescription_available()
        if 'row' in on:
            return int(on['row']) - 1
        prescribe_studies = self.get_heart_studies_prescription()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(prescribe_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such study prescription items exist under `{_on}`.')

    def view_heart_studies_prescription_study_details_on(self, **on):
        self.wait_for_heart_studies_prescription_available()
        _index = self._on_study_prescription_item(**on)
        self.browser.clicks(self.LCT.PRESCRIPTION_BASICON, on_elements=lambda i, _: i == _index, stop_on_first=True)
        # Switch to new tab
        self.browser.switch_tab()
        self.wait_for_heart_studies_prescription_available()

    def view_heart_studies_prescription_study_appointment_summary_on(self, **on):
        self.wait_for_heart_studies_prescription_available()
        _index = self._on_study_prescription_item(**on)
        self.browser.clicks(self.LCT.PRESCRIPTION_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def _on_completed_study_item(self, **on):
        self.wait_for_heart_studies_completed_available()
        if 'row' in on:
            return int(on['row']) - 1
        completed_studies = self.get_heart_studies_completed()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(completed_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such study completed items exist under `{_on}`.')

    def view_heart_studies_completed_study_information_on(self, **on):
        self.wait_for_heart_studies_completed_available()
        _index = self._on_completed_study_item(**on)
        self.browser.clicks(self.LCT.COMPLETED_CONTENT_STUDYID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_heart_studies_completed_study_appointment_summary_on(self, **on):
        self.wait_for_heart_studies_completed_available()
        _index = self._on_completed_study_item(**on)
        self.browser.clicks(self.LCT.COMPLETED_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def stop_heart_studies_active_studies(self):
        pass
