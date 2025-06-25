#!/usr/bin/env python3

try:
    from project_admin_portal.lib.WebPage import WebPage
    from project_admin_portal.config.web_locators import facilities as locators
    from selenium.webdriver import Keys
    from corelib import Utils
    import re

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Facilities(WebPage):
    """
    Handle Facilities page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_facilities(self):
        self.browser.open_page(self.URL + '/facility')

    def filter_facilities(self, facility_name=None):
        if facility_name:
            self.browser.input_text(self.LCT.FC_SEARCHBOX, facility_name)

    def get_facilities(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FC_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FC_CONTENT)
        header = self.browser.get_texts(self.LCT.FC_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.FC_CONTENT, row=row)

    def _on_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_facilities()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such facilities exist under {_on}.')

    def open_edit_facility_on(self, **on):
        _index = self._on_item(**on)
        element = self.browser.get_elements_by_condition(self.LCT.FC_EDITICONS, on_elements=lambda i, _: i == _index,
                                                         stop_on_first=True)[0]
        self.browser.hover_to(element)
        self.browser.wait_visibility_of_any_elements_located(self.LCT.FC_EDITICONS)
        self.browser.click(element)

    def toggle_facility_information_field(self, field, expand_or_collapse):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ED_INFOFIELDS)
        _field_items = [f for f in self.browser.get_elements(self.LCT.ED_INFOFIELDS) if
                        self.browser.get_text(f).lower() == field.lower()]
        if not _field_items:
            raise Exception(f'Item `{field}` not found.')
        value = {
            'expand': 'hide',
            'collapse': 'show'
        }[expand_or_collapse]
        if value in self.browser.get_attribute_value(_field_items[0], 'class'):
            self.browser.click(_field_items[0])

    def expand_facility_information_field(self, field):
        self.toggle_facility_information_field(field, 'expand')

    def collapse_facility_information_field(self, field):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        self.toggle_facility_information_field(field, 'collapse')

    def edit_clinic_support_contact(self, clinic_card_id=0, edit_name=None, edit_phone=None, edit_email=None,
                                    edit_description=None):
        self.browser.clicks(self.LCT.FI_EDITCLINICSUPPORT, on_elements=lambda i, _: i == int(clinic_card_id) - 1,
                            stop_on_first=True)
        if edit_name:
            self.browser.wait_visibility_of_element_located(self.LCT.ECS_NAME)
            self.browser.input_text(self.LCT.ECS_NAME, edit_name)
        if edit_phone:
            self.browser.wait_visibility_of_element_located(self.LCT.ECS_PHONENUMBER)
            self.browser.input_text(self.LCT.ECS_PHONENUMBER, edit_phone)
        if edit_email:
            self.browser.wait_visibility_of_element_located(self.LCT.ECS_EMAIL)
            self.browser.input_text(self.LCT.ECS_EMAIL, edit_email)
        if edit_description:
            self.browser.wait_visibility_of_element_located(self.LCT.ECS_DESCRIPTION)
            self.browser.input_text(self.LCT.ECS_DESCRIPTION, edit_description)
        self.browser.click(self.LCT.ECS_SAVEBUTTON)

    def add_clinic_support_contact(self, add_name=None, add_phone=None, add_email=None, add_description=None):
        self.browser.click(self.LCT.FI_ADDCLINICSUPPORT)
        if add_name:
            self.browser.wait_visibility_of_element_located(self.LCT.ACS_CLINICNAME)
            self.browser.input_text(self.LCT.ACS_CLINICNAME, add_name)
        if add_phone:
            self.browser.wait_visibility_of_element_located(self.LCT.ACS_PHONENUMBER)
            self.browser.input_text(self.LCT.ACS_PHONENUMBER, add_phone)
        if add_email:
            self.browser.wait_visibility_of_element_located(self.LCT.ACS_EMAIL)
            self.browser.input_text(self.LCT.ACS_EMAIL, add_email)
        if add_description:
            self.browser.wait_visibility_of_element_located(self.LCT.ACS_DESCRIPTION)
            self.browser.input_text(self.LCT.ACS_DESCRIPTION, add_description)
        self.browser.click(self.LCT.ACS_ADDBUTTON)

    def edit_facility_information(self, facility_name=None, country=None, address=None, city=None, state=None,
                                  zip_code=None, fax_number=None, short_name=None, phone_number=None,
                                  edit_clinic_support_contact=None, add_clinic_support_contacts=None,
                                  facility_note=None, is_save=False):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 0, stop_on_first=True)
        self.expand_facility_information_field('facility information')
        if facility_name:
            self.browser.input_text(self.LCT.FI_FACLITYNAME, facility_name)
        if short_name:
            self.browser.input_text(self.LCT.FI_SHORTNAME, short_name)
        if country:
            self.browser.click(self.LCT.FI_CITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FI_CITY_OPTIONS)
            self.browser.clicks(self.LCT.FI_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.FI_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FI_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.FI_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.FI_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FI_CITY_OPTIONS)
            self.browser.clicks(self.LCT.FI_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)

        if state:
            self.browser.click(self.LCT.FI_STATEDROPDOWN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FI_STATE_OPTIONS)
            self.browser.clicks(self.LCT.FI_STATE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                stop_on_first=True)
        if zip_code:
            self.browser.input_text(self.LCT.FI_ZIPCODE, zip_code)
        if phone_number:
            self.browser.input_text(self.LCT.FI_PHONENUMBER, phone_number)
        if fax_number:
            _fax_numbers = [f.strip() for f in fax_number.split(',')] if isinstance(fax_number, str) else fax_number
            for fax in _fax_numbers:
                self.browser.input_text(self.LCT.FI_FAX, fax)
                self.browser.get_element(self.LCT.FI_FAX).send_keys(Keys.ENTER)
        if edit_clinic_support_contact:
            if isinstance(edit_clinic_support_contact, list):
                [self.edit_clinic_support_contact(**clinic) for clinic in edit_clinic_support_contact]
            elif isinstance(edit_clinic_support_contact, dict):
                self.edit_clinic_support_contact(**edit_clinic_support_contact)
        if add_clinic_support_contacts:
            if isinstance(add_clinic_support_contacts, list):
                [self.add_clinic_support_contact(**clinic) for clinic in add_clinic_support_contacts]
            elif isinstance(add_clinic_support_contacts, dict):
                self.add_clinic_support_contact(**add_clinic_support_contacts)
        if facility_note:
            self.browser.input_text(self.LCT.FI_FACILITYNOTE, facility_note)
        if is_save:
            self.browser.click(self.LCT.ED_SAVE)

    def edit_facility_setting(self, service_type=None, facility_status=None,
                              del_notification_emails=None, add_notification_emails=None,
                              facility_group=None, reports_faxing=None, eval_start_day=None, eval_end_day=None,
                              other_configs=None, is_save=False):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 0, stop_on_first=True)
        self.expand_facility_information_field('facility setting')
        if service_type:
            self.browser.click(self.LCT.FS_SERVICETYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FS_SERVICETYPE_OPTIONS)
            self.browser.clicks(self.LCT.FS_SERVICETYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == service_type.lower(),
                                stop_on_first=True)
        if facility_status:
            self.browser.click(self.LCT.FS_FACILITYSTATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FS_FACILITYSTATUS_OPTIONS)
            self.browser.clicks(self.LCT.FS_FACILITYSTATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility_status.lower(),
                                stop_on_first=True)
        if del_notification_emails:
            if del_notification_emails.lower() == 'all':  # Delete all
                [self.browser.click(e) for e in self.browser.get_elements(self.LCT.FS_EMAILS + '//span')[::-1]]
            else:  # delete by email/emails
                _del_emails = [e.strip() for e in del_notification_emails.split(',')] if isinstance(
                    del_notification_emails, str) else del_notification_emails
                for email in _del_emails:
                    for index, eml in enumerate(
                            [re.sub('×', '', e).strip() for e in self.browser.get_texts(self.LCT.FS_EMAILS)]):
                        if email == eml:
                            self.browser.click_by_index(self.LCT.FS_EMAILS + '//span', index)
        if add_notification_emails:
            _emails = [e.strip() for e in add_notification_emails.split(',')] if isinstance(
                add_notification_emails, str) else add_notification_emails
            for email in _emails:
                self.browser.wait_attribute_value_to_be(self.LCT.FS_NOTIFICATIONEMAIL, 'value', None, timeout=3)
                self.browser.input_text(self.LCT.FS_NOTIFICATIONEMAIL, email, is_clear=False)
                self.browser.get_element(self.LCT.FS_NOTIFICATIONEMAIL).send_keys(Keys.ENTER)
        if facility_group:
            self.browser.click(self.LCT.FS_FACILITYGROUP)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FS_FACILITYGROUP_OPTIONS)
            self.browser.clicks(self.LCT.FS_FACILITYGROUP_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility_group.lower(),
                                stop_on_first=True)
        if reports_faxing:
            _report = [rp.strip() for rp in reports_faxing.split(',')] if isinstance(reports_faxing,
                                                                                     str) else reports_faxing
            for r_checkbox, r_report in zip(self.browser.get_elements(self.LCT.FS_REPORTSFAXING_CHECKBOX),
                                            self.browser.get_elements(self.LCT.FS_REPORTSFAXING)):
                if self.browser.get_text(r_report) not in _report:
                    self.browser.toggle_checkbox(r_checkbox, r_report, value=False)
                else:
                    self.browser.toggle_checkbox(r_checkbox, r_report, value=True)
        if eval_start_day:
            self.browser.remove_attribute(self.LCT.FS_EVAL_STARTDATE, 'readonly')
            self.browser.input_text(self.LCT.FS_EVAL_STARTDATE, eval_start_day)
            self.browser.get_element(self.LCT.FS_EVAL_STARTDATE).send_keys(Keys.ENTER)
        if eval_end_day:
            self.browser.remove_attribute(self.LCT.FS_EVAL_ENDDATE, 'readonly')
            self.browser.input_text(self.LCT.FS_EVAL_ENDDATE, eval_end_day)
            self.browser.get_element(self.LCT.FS_EVAL_ENDDATE).send_keys(Keys.ENTER)
        if other_configs:
            _confs = [c.strip() for c in other_configs.split(',')] if isinstance(other_configs, str) else other_configs
            for c_checkbox, c_confs in zip(self.browser.get_elements(self.LCT.FS_OTHERCONFIGS + '/../input'),
                                           self.browser.get_elements(self.LCT.FS_OTHERCONFIGS)):
                if self.browser.get_text(c_confs) not in _confs:
                    self.browser.toggle_checkbox(c_checkbox, c_confs, value=False)
                else:
                    self.browser.toggle_checkbox(c_checkbox, c_confs, value=True)
        if is_save:
            self.browser.click(self.LCT.ED_SAVE)

    def edit_account_payable(self, name=None, email=None, country=None, address=None, city=None, state=None,
                             zip_code=None, phone_number=None, fax_number=None, day_financial_hold=None, is_save=False):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 0, stop_on_first=True)
        self.expand_facility_information_field('account payable')
        if name:
            self.browser.input_text(self.LCT.AP_ACCOUNTNAME, name)
        if email:
            self.browser.input_text(self.LCT.AP_EMAIL, email)
        if country:
            self.browser.click(self.LCT.AP_COUNTRY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AP_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.AP_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.AP_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AP_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.AP_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.AP_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AP_CITY_OPTIONS)
            self.browser.clicks(self.LCT.AP_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            self.browser.click(self.LCT.AP_STATE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AP_STATE_OPTIONS)
            self.browser.clicks(self.LCT.AP_STATE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                stop_on_first=True)
        if zip_code:
            self.browser.input_text(self.LCT.AP_ZIPCODE, zip_code)
        if phone_number:
            self.browser.input_text(self.LCT.AP_PHONENUMBER, phone_number)
        if fax_number:
            self.browser.input_text(self.LCT.AP_FAX, fax_number)
        if day_financial_hold:
            self.browser.clicks(self.LCT.AP_DAYSFINANCIALHOLD,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == day_financial_hold.lower(),
                                stop_on_first=True)
        if is_save:
            self.browser.click(self.LCT.ED_SAVE)

    def edit_facility_notification_protocol(self):
        pass

    def edit_devices_settings(self, study_duration=None, pre_event_time=None, post_event_time=None, brady_thrs=None,
                              tachy_thrs=None, pause_lv_duration=None, afib_detection=None, pause_detection=None,
                              diagnostic_lead=None, is_save=False):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        self.expand_facility_information_field('devices settings')
        if study_duration:
            self.browser.input_text(self.LCT.DV_STUDYDURATION, study_duration)
        if pre_event_time:
            self.browser.click(self.LCT.DV_PREEVENTTIME)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_PREEVENTTIME_OPTIONS)
            print(self.browser.get_texts(self.LCT.DV_PREEVENTTIME_OPTIONS))
            self.browser.clicks(self.LCT.DV_PREEVENTTIME_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == pre_event_time, stop_on_first=True)
        if post_event_time:
            self.browser.click(self.LCT.DV_POSTEVENTTIME)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_POSTEVENTTIME_OPTIONS)
            self.browser.clicks(self.LCT.DV_POSTEVENTTIME_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == post_event_time,
                                stop_on_first=True)
        if brady_thrs:
            self.browser.input_text(self.LCT.DV_BRADYTHRS, brady_thrs)
        if tachy_thrs:
            self.browser.input_text(self.LCT.DV_TACHYTHRS, tachy_thrs)
        if pause_lv_duration:
            self.browser.input_text(self.LCT.DV_PAUSELVDURATION, pause_lv_duration)
        if afib_detection:
            self.browser.clicks(self.LCT.DV_AFIBDETECTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == afib_detection.lower(),
                                stop_on_first=True)
        if pause_detection:
            self.browser.clicks(self.LCT.DV_PAUSEDETECTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == pause_detection.lower(),
                                stop_on_first=True)
        if diagnostic_lead:
            self.browser.clicks(self.LCT.DV_DIAGNOSTICLEAD,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == diagnostic_lead.lower(),
                                stop_on_first=True)
        if is_save:
            self.browser.click(self.LCT.ED_SAVE)

    def assign_devices(self, devices_id=None):  # Handle assign/add devices at edit assigned field
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        self.expand_facility_information_field('assigned devices')
        self.browser.scroll_into_view(self.LCT.DV_PAUSELVDURATION)
        if devices_id:
            self.browser.click(self.LCT.AD_ADDDEVICEBUTTON)
            _devices = [device.strip() for device in devices_id.split(',')] if isinstance(devices_id,
                                                                                          str) else devices_id
            for dv in _devices:
                self.browser.input_text(self.LCT.AD_DEVICEID, dv, is_clear=False)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.AD_DEVICEID_OPTIONS)
                self.browser.clicks(self.LCT.AD_DEVICEID_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e) == dv, stop_on_first=True)
            self.browser.click(self.LCT.AD_BUTTON)
        self.browser.wait_visibility_of_element_located(self.LCT.AD_DATA_CONTENT)

    def unassign_devices(self, row=None, unassign=True):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        self.expand_facility_information_field('assigned devices')
        self.browser.scroll_into_view(self.LCT.DV_PAUSELVDURATION)
        if row == 'all':  # unassign all
            self.browser.wait_visibility_of_element_located(self.LCT.AD_DATA_CONTENT)
            self.browser.wait_visibility_of_element_located(self.LCT.AD_ALLDEVICECHECKBOX)
            self.browser.toggle_checkbox(self.LCT.AD_ALLDEVICECHECKBOX, self.LCT.AD_ALLDEVICECHECKBOX,
                                         is_scroll=True)
        else:  # unassign by row index
            self.browser.wait_visibility_of_element_located(self.LCT.AD_DEVICECHECKBOXES)
            elements = self.browser.get_elements(self.LCT.AD_DEVICECHECKBOXES)
            _index = int(row) - 1
            self.browser.toggle_checkbox(elements[_index], elements[_index], is_scroll=True)
        if unassign:
            self.browser.scroll_into_view(self.LCT.DV_PAUSELVDURATION)
            self.browser.wait_visibility_of_element_located(self.LCT.AD_UNASSIGNBUTTON)
            self.browser.click(self.LCT.AD_UNASSIGNBUTTON)
        self.browser.wait_visibility_of_element_located(self.LCT.AD_DATA_CONTENT)

    def get_clinic_contacts(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FI_CND_DATA_CONTENT)
        output = []
        for root_element in self.browser.get_elements(self.LCT.FI_CNS_ROOT):
            header = ['Name']
            header += self.browser.get_texts(self.browser.get_child_elements(root_element, self.LCT.FI_CNS_DATA_HEADER))
            content = [self.browser.get_text(
                self.browser.get_child_element(root_element, self.LCT.FI_CND_DATA_TITLE)).replace('\n', ', ')]
            content += self.browser.get_texts(self.browser.get_child_elements(root_element,
                                                                              self.LCT.FI_CND_DATA_CONTENT))
            output.append(Utils.group_tabular_data(header, content, row=1))
        return output

    def get_facility_information(self):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 0, stop_on_first=True)
        self.expand_facility_information_field('facility information')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FI_DATA_HEADERS)
        headers = self.browser.get_texts(self.LCT.FI_DATA_HEADERS)
        content = list()
        content.append(self.browser.get_attribute_value(self.LCT.FI_FACLITYNAME, 'value'))  # facility name
        content.append(self.browser.get_attribute_value(self.LCT.FI_SHORTNAME, 'value'))  # short name
        content.append(self.browser.get_text(self.LCT.FI_COUNTRY + '/div/div'))  # country
        content.append(self.browser.get_attribute_value(self.LCT.FI_ADDRESS, 'value'))  # address
        content.append(self.browser.get_attribute_value(self.LCT.FI_CITY, 'value'))  # city
        # state
        content.append(
            self.browser.get_text(self.LCT.FI_STATEDROPDOWN + '//div[contains(@class, "input__single-value")]'))
        content.append(self.browser.get_attribute_value(self.LCT.FI_ZIPCODE, 'value'))  # zip code
        content.append(self.browser.get_attribute_value(self.LCT.FI_PHONENUMBER, 'value'))  # phone number
        # fax numbser
        content.append(
            [fax.replace('×', '').strip() for fax in self.browser.get_texts(self.LCT.FI_FAX + '/..//div[@data-tag]')])
        content.append(self.get_clinic_contacts())  # Clinic contacts
        content.append(self.browser.get_text(self.LCT.FI_FACILITYNOTE))  # facility note
        return Utils.group_tabular_data(headers, content, row=1)

    def get_facility_setting(self):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 0, stop_on_first=True)
        self.expand_facility_information_field('facility setting')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FS_DATA_HEADERS)
        headers = self.browser.get_texts(self.LCT.FS_DATA_HEADERS)
        headers.append(self.browser.get_text(self.LCT.FS_OTHERCONFIGHEADER))
        content = list()
        content.append(self.browser.get_text(self.LCT.FS_SERVICETYPE + '//input/../div'))
        content.append(self.browser.get_text(self.LCT.FS_FACILITYSTATUS + '//input/../div'))
        content.append([email.replace('×', '').strip() for email in self.browser.get_texts(self.LCT.FS_EMAILS)])
        content.append(self.browser.get_text(self.LCT.FS_FACILITYGROUP))
        # init and get report faxing
        report_faxing = []
        for f_checkbox, f_report in zip(self.browser.get_elements(self.LCT.FS_REPORTSFAXING + '/input'),
                                        self.browser.get_elements(self.LCT.FS_REPORTSFAXING)):
            if self.browser.is_checkbox_selected(f_checkbox):
                report_faxing.append(self.browser.get_text(f_report))
        content.append(report_faxing)
        # init and get eval start and end days
        eval_days = []
        if 'Eval Start - Stop Day' in headers:
            eval_days.append(self.browser.get_attribute_value(self.LCT.FS_EVAL_STARTDATE, 'value'))
            eval_days.append(self.browser.get_attribute_value(self.LCT.FS_EVAL_ENDDATE, 'value'))
            content.append(eval_days)
        # init and get other configs
        other_configs = []
        for f_checkbox, f_config in zip(
                self.browser.get_elements(self.LCT.FS_OTHERCONFIGS + '/../input'),
                self.browser.get_elements(self.LCT.FS_OTHERCONFIGS)):
            if self.browser.is_checkbox_selected(f_checkbox):
                other_configs.append(self.browser.get_text(f_config))
        content.append(other_configs)
        return Utils.group_tabular_data(headers, content, row=1)

    def get_facility_account_payable(self):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 0, stop_on_first=True)
        self.expand_facility_information_field('account payable')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AP_DATA_HEADERS)
        headers = self.browser.get_texts(self.LCT.AP_DATA_HEADERS)
        content = list()
        content.append(self.browser.get_attribute_value(self.LCT.AP_ACCOUNTNAME, 'value'))
        content.append(self.browser.get_attribute_value(self.LCT.AP_EMAIL, 'value'))
        content.append(self.browser.get_text(self.LCT.AP_COUNTRY + '//input/..'))
        content.append(self.browser.get_attribute_value(self.LCT.AP_ADDRESS, 'value'))
        content.append(self.browser.get_attribute_value(self.LCT.AP_CITY, 'value'))
        content.append(self.browser.get_text(self.LCT.AP_STATE + '//input/..'))
        content.append(self.browser.get_attribute_value(self.LCT.AP_ZIPCODE, 'value'))
        content.append(self.browser.get_attribute_value(self.LCT.AP_PHONENUMBER, 'value'))
        content.append(self.browser.get_attribute_value(self.LCT.AP_FAX, 'value'))
        for e_rdbox, e_day in zip(self.browser.get_elements(self.LCT.AP_DAYSFINANCIALHOLD + '/../input'),
                                  self.browser.get_elements(self.LCT.AP_DAYSFINANCIALHOLD)):
            if self.browser.is_checkbox_selected(e_rdbox):
                content.append(self.browser.get_text(e_day))
        return Utils.group_tabular_data(headers, content, row=1)

    def get_facility_notification_protocol(self):
        pass

    def get_devices_settings(self):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        self.expand_facility_information_field('devices settings')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_DATA_HEADERS)
        # get all header
        headers = self.browser.get_texts(self.LCT.DV_DATA_HEADERS) + ['AFIB detection', 'Pause detection',
                                                                      'Diagnostic lead']
        content = list()
        content.append(self.browser.get_attribute_value(self.LCT.DV_STUDYDURATION, 'value'))
        content.append(self.browser.get_text(self.LCT.DV_PREEVENTTIME + '//input/..'))
        content.append(self.browser.get_text(self.LCT.DV_POSTEVENTTIME + '//input/..'))
        content.append(self.browser.get_attribute_value(self.LCT.DV_BRADYTHRS, 'value'))
        content.append(self.browser.get_attribute_value(self.LCT.DV_TACHYTHRS, 'value'))
        content.append(self.browser.get_attribute_value(self.LCT.DV_PAUSELVDURATION, 'value'))
        # AFIB detection
        for rd_box, d_efib in zip(self.browser.get_elements(self.LCT.DV_AFIBDETECTION + '/../input'),
                                  self.browser.get_elements(self.LCT.DV_AFIBDETECTION)):
            if self.browser.is_checkbox_selected(rd_box):
                content.append(self.browser.get_text(d_efib))
        # Pause detection
        for rd_box, d_pause in zip(self.browser.get_elements(self.LCT.DV_PAUSEDETECTION + '/../input'),
                                   self.browser.get_elements(self.LCT.DV_PAUSEDETECTION)):
            if self.browser.is_checkbox_selected(rd_box):
                content.append(self.browser.get_text(d_pause))
        # Diagnostic lead
        for rd_box, dia_lead in zip(self.browser.get_elements(self.LCT.DV_DIAGNOSTICLEAD + '/../input'),
                                    self.browser.get_elements(self.LCT.DV_DIAGNOSTICLEAD)):
            if self.browser.is_checkbox_selected(rd_box):
                content.append(self.browser.get_text(dia_lead))
        return Utils.group_tabular_data(headers, content, row=1)

    def get_total_devices(self):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        self.expand_facility_information_field('assigned devices')
        self.browser.scroll_into_view(self.LCT.DV_PAUSELVDURATION)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AD_TOTALDEVICES)
        data = self.browser.get_texts(self.LCT.AD_TOTALDEVICES)
        output = self.browser.get_tabular_data(data, self.LCT.AD_TOTALDEVICES)
        return [{k.split(':')[0]: v.split(':')[1].strip() for k, v in sub.items()} for sub in output]

    def get_assigned_devices(self, row=None):
        self.browser.clicks(self.LCT.ED_TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        self.expand_facility_information_field('assigned devices')
        self.browser.scroll_into_view(self.LCT.AD_ADDDEVICEBUTTON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AD_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AD_DATA_CONTENT)
        header = self.browser.get_texts(self.LCT.AD_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.AD_DATA_CONTENT, row=row)

    def open_create_new_facility(self):
        self.browser.click(self.LCT.FC_CREATENEWFACILITY)
