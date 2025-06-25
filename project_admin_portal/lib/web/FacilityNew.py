#!/usr/bin/env python3

try:
    from project_admin_portal.lib.WebPage import WebPage
    from project_admin_portal.config.web_locators import facility_new as locators
    from selenium.webdriver import Keys

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class FacilityNew(WebPage):
    """
    Handle Create New Facility page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def add_clinic_support_contacts(self, name=None, phone_number=None, email=None, description=None):
        if name:
            self.browser.input_text(self.LCT.ACS_NAME, name)
        if phone_number:
            self.browser.input_text(self.LCT.ACS_PHONENUMBER, phone_number)
        if email:
            self.browser.input_text(self.LCT.ACS_EMAIL, email)
        if description:
            self.browser.input_text(self.LCT.ACS_DESCRIPTION, description)
        self.browser.click(self.LCT.ACS_ADDCONTACT)

    def create_new_facility_page_1(self, facility_name=None, short_name=None, country=None, address=None, city=None,
                                   state=None, zip_code=None, phone_number=None, fax_number=None,
                                   clinic_support_contacts=None, facility_note=None, is_next=True):
        if facility_name:
            self.browser.input_text(self.LCT.CFI_NAME, facility_name)
        if short_name:
            self.browser.input_text(self.LCT.CFI_SHORTNAME, short_name)
        if country:
            self.browser.click(self.LCT.CFI_COUNTRY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CFI_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.CFI_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.CFI_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CFI_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.CFI_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.CFI_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CFI_CITY_OPTIONS)
            self.browser.clicks(self.LCT.CFI_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            self.browser.click(self.LCT.CFI_STATE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CFI_STATE_OPTIONS)
            self.browser.clicks(self.LCT.CFI_STATE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                stop_on_first=True)
        if zip_code:
            self.browser.input_text(self.LCT.CFI_ZIPCODE, zip_code)
        if phone_number:
            self.browser.input_text(self.LCT.CFI_PHONENUMBER, phone_number)
        if fax_number:
            _fax_numbers = [f.strip() for f in fax_number.split(',')] if isinstance(fax_number, str) else fax_number
            for fax in _fax_numbers:
                self.browser.input_text(self.LCT.CFI_FAX + '/input', fax)
                self.browser.get_element(self.LCT.CFI_FAX + '/input').send_keys(Keys.ENTER)
        if clinic_support_contacts:
            self.browser.click(self.LCT.CFI_ADDCLINICCONTACT)
            if isinstance(clinic_support_contacts, dict):
                self.add_clinic_support_contacts(**clinic_support_contacts)
            elif isinstance(clinic_support_contacts, list):
                [self.add_clinic_support_contacts(**clinic) for clinic in clinic_support_contacts]
        if facility_note:
            self.browser.input_text(self.LCT.CFI_FACILITYNOTE, facility_note)
        if is_next:
            self.browser.click(self.LCT.CFI_NEXT)
            self.browser.wait_invisibility_of_element_located(self.LCT.NEXTLOADING)

    def create_new_facility_page_2(self, service_type=None, facility_status=None, notification_emails=None,
                                   facility_group=None, reports_faxing=None, eval_start=None, eval_end=None,
                                   other_configs=None, is_next=True):
        self.browser.execute_script("window.scrollTo(0,0)")
        if service_type:
            self.browser.click(self.LCT.CFS_SERVICETYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CFS_SERVICETYPE_OPTIONS)
            self.browser.clicks(self.LCT.CFS_SERVICETYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == service_type.lower(),
                                stop_on_first=True)
        if facility_status:
            self.browser.click(self.LCT.CFS_FACILITYSTATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CFS_FACILITYSTATUS_OPTIONS)
            self.browser.clicks(self.LCT.CFS_FACILITYSTATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility_status.lower(),
                                stop_on_first=True)
        if notification_emails:
            _emails = [eml.strip() for eml in notification_emails.split(',')] if isinstance(
                notification_emails, str) else notification_emails
            for email in _emails:
                self.browser.wait_attribute_value_to_be(self.LCT.CFS_NOTIFICATIONEMAIL, 'value', None, timeout=2)
                self.browser.input_text(self.LCT.CFS_NOTIFICATIONEMAIL, email, is_clear=False)
                self.browser.get_element(self.LCT.CFS_NOTIFICATIONEMAIL).send_keys(Keys.ENTER)
        if facility_group:
            self.browser.click(self.LCT.CFS_FACILITYGROUP)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CFS_FACILITYGROUP_OPTIONS)
            self.browser.clicks(self.LCT.CFS_FACILITYGROUP_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility_group.lower(),
                                stop_on_first=True)
        if reports_faxing:
            _report = [rp.strip() for rp in reports_faxing.split(',')] if isinstance(reports_faxing,
                                                                                     str) else reports_faxing
            for r_checkbox, r_report in zip(self.browser.get_elements(self.LCT.CFS_REPORTFAXING + '/../input'),
                                            self.browser.get_elements(self.LCT.CFS_REPORTFAXING)):
                if self.browser.get_text(r_report) not in _report:
                    self.browser.toggle_checkbox(r_checkbox, r_report, value=False)
                else:
                    self.browser.toggle_checkbox(r_checkbox, r_report, value=True)
        if eval_start:
            self.browser.remove_attribute(self.LCT.CFS_EVALSTARTDAY, 'readonly')
            self.browser.input_text(self.LCT.CFS_EVALSTARTDAY, eval_start)
            self.browser.get_element(self.LCT.CFS_EVALSTARTDAY).send_keys(Keys.ENTER)
        if eval_end:
            self.browser.remove_attribute(self.LCT.CFS_EVALENDDAY, 'readonly')
            self.browser.input_text(self.LCT.CFS_EVALENDDAY, eval_end, eval_end)
            self.browser.get_element(self.LCT.CFS_EVALENDDAY).send_keys(Keys.ENTER)
        if other_configs:
            _confs = [c.strip() for c in other_configs.split(',')] if isinstance(other_configs, str) else other_configs
            for c_checkbox, c_confs in zip(self.browser.get_elements(self.LCT.CFS_OTHERCONFIGS + '/../input'),
                                           self.browser.get_elements(self.LCT.CFS_OTHERCONFIGS)):
                if self.browser.get_text(c_confs) not in _confs:
                    self.browser.toggle_checkbox(c_checkbox, c_confs, value=False)
                else:
                    self.browser.toggle_checkbox(c_checkbox, c_confs, value=True)
        if is_next:
            self.browser.click(self.LCT.CFS_NEXT)
            self.browser.wait_invisibility_of_element_located(self.LCT.NEXTLOADING)

    def create_new_facility_page_3(self, name=None, email=None, country=None, address=None, city=None,
                                   state=None, zip_code=None, phone_number=None, day_financial_hold=None,
                                   fax_number=None, is_next=True):
        self.browser.execute_script("window.scrollTo(0,0)")
        if name:
            self.browser.input_text(self.LCT.CAP_NAME, name)
        if email:
            self.browser.input_text(self.LCT.CAP_EMAIL, email)
        if country:
            self.browser.click(self.LCT.CAP_COUNTRY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CAP_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.CAP_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.CAP_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CAP_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.CAP_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.CAP_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CAP_CITY_OPTIONS)
            self.browser.clicks(self.LCT.CAP_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            self.browser.click(self.LCT.CAP_STATE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CAP_STATE_OPTIONS)
            self.browser.clicks(self.LCT.CAP_STATE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                stop_on_first=True)
        if zip_code:
            self.browser.input_text(self.LCT.CAP_ZIPCODE, zip_code)
        if phone_number:
            self.browser.input_text(self.LCT.CAP_PHONENUMBER, phone_number)
        if day_financial_hold:
            self.browser.clicks(self.LCT.CAP_FINANCIALHOLD,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == day_financial_hold.lower(),
                                stop_on_first=True)
        if fax_number:
            self.browser.input_text(self.LCT.CAP_FAX, fax_number)
        if is_next:
            self.browser.click(self.LCT.CAP_NEXT)
            self.browser.wait_invisibility_of_element_located(self.LCT.NEXTLOADING)

    def create_new_facility_page_4(self, file_path=None, is_next=True):  # Upload file
        if file_path:  # To do
            pass
        if is_next:
            self.browser.click(self.LCT.CNP_CREATE)
            self.browser.wait_invisibility_of_element_located(self.LCT.NEXTLOADING)

    def create_new_facility_page_5(self, study_duration=None, pre_event_time=None, post_event_time=None,
                                   brady_thrs=None, tachy_thrs=None, pause_lv_duration=None, afib_detection=None,
                                   pause_detection=None, diagnostic_lead=None, is_create=True):
        self.browser.execute_script("window.scrollTo(0,0)")
        if study_duration:
            self.browser.input_text(self.LCT.CDS_STUDYDURATION, study_duration)
        if pre_event_time:
            self.browser.click(self.LCT.CDS_PREEVENTTIME)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CDS_PREEVENTTIME_OPTIONS)
            self.browser.clicks(self.LCT.CDS_PREEVENTTIME_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == pre_event_time, stop_on_first=True)
        if post_event_time:
            self.browser.click(self.LCT.CDS_POSTEVENTTIME)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CDS_POSTEVENTTIME_OPTIONS)
            self.browser.clicks(self.LCT.CDS_POSTEVENTTIME_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == post_event_time,
                                stop_on_first=True)
        if brady_thrs:
            self.browser.input_text(self.LCT.CDS_BRADYTHRS, brady_thrs)
        if tachy_thrs:
            self.browser.input_text(self.LCT.CDS_TACHYTHRS, tachy_thrs)
        if pause_lv_duration:
            self.browser.input_text(self.LCT.CDS_PAUSELVDURATION, pause_lv_duration)
        if afib_detection:
            self.browser.clicks(self.LCT.CDS_AFIBDETECTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == afib_detection.lower(),
                                stop_on_first=True)
        if pause_detection:
            self.browser.clicks(self.LCT.CDS_PAUSEDETECTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == pause_detection.lower(),
                                stop_on_first=True)
        if diagnostic_lead:
            self.browser.clicks(self.LCT.CDS_DIAGNOSTICLEAD,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == diagnostic_lead.lower(),
                                stop_on_first=True)
        if is_create:
            self.browser.click(self.LCT.CDS_CREATE)
