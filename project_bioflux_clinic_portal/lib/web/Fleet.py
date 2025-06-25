#!/usr/bin/env python3
import time

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import fleet as locators
    from datetime import datetime
    from selenium.webdriver import Keys
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Fleet(WebPage):
    """
    Handle the Fleet page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_fleet(self):
        self.browser.open_page(self.URL + '/rma')

    def navigate_to_fleet_tab(self, tab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS) and self.browser.get_elements(self.LCT.TABS)[0].is_displayed():
                self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_for_rmg_request_items_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_DATA_CONTENT, inverse=True)

    def wait_for_maintenance_items_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MTN_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MTN_DATA_CONTENT)

    def get_fleet_rma_request_items(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_DATA_CONTENT, inverse=True)
        header = ['RMA ID'] + self.browser.get_texts(self.LCT.RMAREQ_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.RMAREQ_DATA_CONTENT, row=row)

    def get_fleet_maintenance_items(self, row=None):
        self.wait_for_maintenance_items_available()
        header = ['Device ID'] + self.browser.get_texts(self.LCT.MTN_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.MTN_DATA_CONTENT, row=row)

    def filter_fleet_rma_request(self, by_status=None, text_search=None, search_by=None):
        self.navigate_to_fleet_tab('RMA Request')
        if by_status:
            self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_STATUS)
            self.browser.click(self.LCT.RMAREQ_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_STATUS_OPTIONS)
            self.browser.clicks(self.LCT.RMAREQ_STATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_status.lower(),
                                stop_on_first=True)
        if text_search:
            self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SEARCH_INPUT)
            self.browser.input_text(self.LCT.RMAREQ_SEARCH_INPUT, text_search)
        if search_by:
            self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SEARCH_BY)
            self.browser.click(self.LCT.RMAREQ_SEARCH_BY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_SEARCH_BY_OPTION)
            self.browser.clicks(self.LCT.RMAREQ_SEARCH_BY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        self.wait_for_rmg_request_items_available()

    def filter_fleet_maintenance(self, by_model=None, text_search=None):
        self.navigate_to_fleet_tab('Maintenance')
        if by_model:
            self.browser.click(self.LCT.MTN_MODEL)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.MTN_MODEL_OPTIONS)
            self.browser.clicks(self.LCT.MTN_MODEL_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_model.lower(),
                                stop_on_first=True)
        if text_search:
            self.browser.input_text(self.LCT.MTN_SEARCHBOX, text_search)
        self.wait_for_maintenance_items_available()

    def sort_fleet_rma_request(self, field, asc_or_desc):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_DATA_HEADER)
        index_header = {
            'rma id': 0,
            'request date': 5,
            'returned date': 6
        }
        for _ in range(2):
            element_sort = self.browser.get_elements(self.LCT.RMAREQ_DATA_HEADER)[index_header[field.lower()]]
            if asc_or_desc.lower() in self.browser.get_attribute_value(element_sort, 'aria-label'):
                break
            self.browser.click(element_sort)
        self.wait_for_rmg_request_items_available()

    def sort_fleet_rma_request_unactive(self, asc_or_desc=None):
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SORT_RMAID)
        self.browser.click(self.LCT.RMAREQ_SORT_RMAID)
        if asc_or_desc.lower() in self.browser.get_attribute_value(self.LCT.RMAREQ_SORT_RMAID, 'aria-sort'):
            return self
        else:
            self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SORT_RMAID)
            self.browser.click(self.LCT.RMAREQ_SORT_RMAID)

    def sort_fleet_rma_request_active(self, asc_or_desc=None):
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SORT_RQDATE)
        if asc_or_desc.lower() in self.browser.get_attribute_value(self.LCT.RMAREQ_SORT_RQDATE, 'aria-sort'):
            return self
        else:
            self.browser.click(self.LCT.RMAREQ_SORT_RQDATE)
            self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SORT_RQDATE, inverse=True)

    def sort_asc_and_desc_data(self, asc_or_desc=None, data=None):
        self.wait_for_rmg_request_items_available()
        if asc_or_desc == 'descending':
            # Convert date strings to datetime objects
            date_objects = [datetime.strptime(date_str, "%m/%d/%Y") for date_str in data]
            # Sort datetime objects in descending order
            sorted_dates_desc = sorted(date_objects, reverse=True)
            # Convert back to date strings if needed
            sorted_date_strings_desc = [date.strftime("%m/%d/%Y") for date in sorted_dates_desc]
            return sorted_date_strings_desc
        elif asc_or_desc == 'ascending':
            # Convert date strings to datetime objects
            date_objects = [datetime.strptime(date_str, "%m/%d/%Y") for date_str in data]
            # Sort datetime objects in descending order
            sorted_dates_desc = sorted(date_objects)
            # Convert back to date strings if needed
            sorted_date_strings_desc = [date.strftime("%m/%d/%Y") for date in sorted_dates_desc]
            return sorted_date_strings_desc

    def sort_fleet_maintenance(self, asc_or_desc):
        for _ in range(2):
            element_sort = self.browser.get_element(self.LCT.MTN_DATA_HEADER + '[1]')
            if asc_or_desc in self.browser.get_attribute_value(element_sort, 'aria-label'):
                break
            self.browser.click(element_sort)
        self.wait_for_maintenance_items_available()

    def _on_rma_request_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_rmg_request_items_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        rma_requests = self.get_fleet_rma_request_items()
        for i, row in enumerate(rma_requests):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            print(_row)
            if on.items() <= _row.items():
                return i
        raise Exception(f'No such rmg request item exist under `{_on}`.')

    def _on_maintenance_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_for_maintenance_items_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        maintenance_items = self.get_fleet_maintenance_items()
        for i, row in enumerate(maintenance_items):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if on.items() <= _row.items():
                return i
        raise Exception(f'No such maintenance item exist under `{_on}`.')

    def view_rma_request_details_on(self, **on):
        self.wait_for_rmg_request_items_available()
        _index = self._on_rma_request_item(**on)
        self.browser.hover_to(self.browser.get_elements_by_condition(
            self.LCT.RMAREQ_DATA_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True
        )[0], is_scroll=True)
        self.browser.clicks(self.LCT.RMAREQ_DATA_VIEW_OR_EDIT, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def view_initiate_maintenance_on(self, **on):
        self.wait_for_maintenance_items_available()
        _index = self._on_maintenance_item(**on)
        self.browser.hover_to(self.browser.get_elements_by_condition(
            self.LCT.MTN_DATA_ROW, on_elements=lambda i, _: i == _index, stop_on_first=True)[0], is_scroll=True)
        self.browser.clicks(self.LCT.MTN_DATA_INITIATE, on_elements=lambda index, _: index == _index,
                            stop_on_first=True)

    def toggle_maintenance_checkbox_on(self, **on):
        self.wait_for_maintenance_items_available()
        _index = self._on_maintenance_item(**on)
        self.browser.clicks(self.LCT.MTN_DATA_CHECKBOXES, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def _fill_rma_device_information(self, device_id=None, replacement_device=None, reasons=None, patient_impact=None,
                                     date_of_event=None, add_more=False):
        self.browser.click(self.LCT.NEWRMA_DEVINFO_ADDMORE_DEVICE)
        self.browser.wait_visibility_of_element_located(self.LCT.NEWRMA_DEVINFO_ADDMORE_DEVICE, inverse=True)
        if device_id:
            self.browser.click(self.LCT.NEWRMA_DEVINFO_DEVID)
            self.browser.input_text(self.LCT.NEWRMA_DEVINFO_DEVID, device_id)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWRMA_DEVINFO_DEVID_OPTIONS, inverse=True)
            self.browser.clicks(self.LCT.NEWRMA_DEVINFO_DEVID_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == device_id, stop_on_first=True)
        if replacement_device:
            self.browser.input_text(self.LCT.NEWRMA_DEVINFO_REPLACEMENTDEVID, replacement_device)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWRMA_DEVINFO_REPLACEMENTDEVID_OPTIONS)
            self.browser.clicks(self.LCT.NEWRMA_DEVINFO_REPLACEMENTDEVID_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == replacement_device.lower(),
                                stop_on_first=True)
        if reasons:
            _reasons = [r.strip() for r in reasons.split(',')] if isinstance(reasons, str) else reasons  # else > list
            self.browser.click(self.LCT.NEWRMA_DEVINFO_RMAREASON)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWRMA_DEVINFO_RMAREASON_OPTIONS)
            for reason in _reasons:
                self.browser.clicks(self.LCT.NEWRMA_DEVINFO_RMAREASON_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == reason.lower(),
                                    stop_on_first=True)
            self.browser.click(self.LCT.NEWRMA_DEVINFO_RMAREASON)
        if patient_impact:
            self.browser.click(self.LCT.NEWRMA_DEVINFO_PATIENTIMPACT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWRMA_DEVINFO_PATIENTIMPACT_OPTIONS)
            self.browser.clicks(self.LCT.NEWRMA_DEVINFO_PATIENTIMPACT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == patient_impact.lower(),
                                stop_on_first=True)
        if date_of_event:
            if date_of_event.lower() == 'today':
                self.browser.click(self.LCT.NEWRMA_DEVINFO_EVENTDATE + '/../..')
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWRMA_DEVINFO_EVENTDATE_TODAY)
                self.browser.click(self.LCT.NEWRMA_DEVINFO_EVENTDATE_TODAY)
            else:
                self.browser.remove_attribute(self.LCT.NEWRMA_DEVINFO_EVENTDATE, 'readonly')
                self.browser.input_text(self.LCT.NEWRMA_DEVINFO_EVENTDATE, date_of_event)
                self.browser.get_element(self.LCT.NEWRMA_DEVINFO_EVENTDATE).send_keys(Keys.ENTER)
        if add_more:
            self.browser.click(self.LCT.NEWRMA_DEVINFO_ADD_DEVICE)

    def _fill_shipping_address(self, country=None, address=None, city=None, state=None, zip_code=None,
                               contact_phone=None, contact_email=None):
        if country:
            self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_COUNTRY)
            self.browser.input_text(self.LCT.SHIPADDRESS_COUNTRY, country)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SHIPADDRESS_COUNTRY_OPTIONS, inverse=True)
            self.browser.clicks(self.LCT.SHIPADDRESS_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_ADDRESS)
            self.browser.input_text(self.LCT.SHIPADDRESS_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SHIPADDRESS_ADDRESS_OPTIONS, inverse=True)
            self.browser.clicks(self.LCT.SHIPADDRESS_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_CITY)
            self.browser.input_text(self.LCT.SHIPADDRESS_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SHIPADDRESS_CITY_OPTIONS, inverse=True)
            self.browser.clicks(self.LCT.SHIPADDRESS_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            if state in ['United States', 'Canada']:
                self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_STATE)
                self.browser.input_text(self.LCT.SHIPADDRESS_STATE, state)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.SHIPADDRESS_STATE_OPTIONS, inverse=True)
                self.browser.clicks(self.LCT.SHIPADDRESS_STATE_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                    stop_on_first=True)
            else:
                self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_STATE)
                self.browser.input_text(self.LCT.SHIPADDRESS_STATE, state)
        if zip_code:
            self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_ZIPCODE)
            self.browser.input_text(self.LCT.SHIPADDRESS_ZIPCODE, zip_code)
        if contact_phone:
            self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_PHONE)
            self.browser.input_text(self.LCT.SHIPADDRESS_PHONE, contact_phone)
        if contact_email:
            self.browser.wait_visibility_of_element_located(self.LCT.SHIPADDRESS_EMAIL)
            self.browser.input_text(self.LCT.SHIPADDRESS_EMAIL, contact_email)

    def _fill_returning_address(self, country=None, address=None, city=None, state=None, zip_code=None,
                                contact_phone=None, contact_email=None):
        self.browser.wait_visibility_of_element_located(self.LCT.RETURNADDRESS_SWITCH)
        for _ in range(2):
            if 'false' in self.browser.get_attribute_value(self.LCT.RETURNADDRESS_SWITCH, 'aria-checked').lower():
                break
            self.browser.click(self.LCT.RETURNADDRESS_SWITCH)
        if country:
            self.browser.input_text(self.LCT.RETURNADDRESS_COUNTRY, country)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.RETURNADDRESS_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.RETURNADDRESS_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.RETURNADDRESS_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.RETURNADDRESS_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.RETURNADDRESS_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.RETURNADDRESS_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.RETURNADDRESS_CITY_OPTIONS)
            self.browser.clicks(self.LCT.RETURNADDRESS_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            if state in ['United States', 'Canada']:
                self.browser.input_text(self.LCT.RETURNADDRESS_STATE, state)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.RETURNADDRESS_STATE_OPTIONS)
                self.browser.clicks(self.LCT.RETURNADDRESS_STATE_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                    stop_on_first=True)
            else:
                self.browser.input_text(self.LCT.RETURNADDRESS_STATE_OPTIONS, state)
        if zip_code:
            self.browser.input_text(self.LCT.RETURNADDRESS_ZIP, zip_code)
        if contact_phone:
            self.browser.input_text(self.LCT.RETURNADDRESS_PHONE, contact_phone)
        if contact_email:
            self.browser.input_text(self.LCT.RETURNADDRESS_EMAIL, contact_email)

    def add_new_rma_request(self, facility=None, rma_device_info=None, notification_email=None, notes=None,
                            shipping_address=None, returning_address=None, is_submit=True):
        self.browser.click(self.LCT.RMAREQ_NEWRMA)
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_NEWRMA, inverse=True)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.NEWRMA_FACILITY)
            self.browser.input_text(self.LCT.NEWRMA_FACILITY, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEWRMA_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.NEWRMA_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if rma_device_info:  # list
            self._fill_rma_device_information(**rma_device_info)
        if notification_email:
            self.browser.wait_visibility_of_element_located(self.LCT.NOTIFEMAIL, inverse=True)
            self.browser.input_text(self.LCT.NOTIFEMAIL, notification_email)
        if notes:
            self.browser.wait_visibility_of_element_located(self.LCT.NOTES, inverse=True)
            self.browser.input_text(self.LCT.NOTES, notes)
        if shipping_address:  # dict
            self._fill_shipping_address(**shipping_address)
        if returning_address:  # dict
            self._fill_returning_address(**returning_address)
        if is_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.NEWRMA_SUBMIT)
            self.browser.click(self.LCT.NEWRMA_SUBMIT)
            if self.browser.wait_visibility_of_element_located(self.LCT.NEWRMA_CONFIRM) and self.browser.get_element(self.LCT.NEWRMA_CONFIRM).is_displayed():
                self.browser.click(self.LCT.NEWRMA_CONFIRM)
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_CANCEL_REQUEST, inverse=True)

    def _get_current_rma_type(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        element = self.browser.get_elements_by_condition(
            self.LCT.TABS,
            on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(e, 'class'), stop_on_first=True
        )[0]
        return self.browser.get_text(element).split('\n')[0]

    def get_fleet_current_filter_values(self):
        return {
            'Facility': self.browser.get_text(self.LCT.FACILITY_CURRENT),
            'RMA Type': self._get_current_rma_type(),
            'RMA State': self.browser.get_text(
                self.LCT.RMAREQ_STATUS) if self._get_current_rma_type().lower() == 'rma request' else None,
            'Search By': self.browser.get_attribute_value(
                self.LCT.RMAREQ_SEARCHBOX, 'title') if self._get_current_rma_type().lower(
            ) == 'rma request' else self.browser.get_attribute_value(self.LCT.MTN_SEARCHBOX, 'placeholder'),
            'Text Search': self.browser.get_attribute_value(self.LCT.SEARCHBOX, 'value')
        }

    def get_fleet_rma_request_status_options(self):
        self.browser.click(self.LCT.RMAREQ_STATUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_STATUS_OPTIONS)
        data = self.browser.get_texts(self.LCT.RMAREQ_STATUS_OPTIONS)
        self.browser.clicks(self.LCT.RMAREQ_STATUS_OPTIONS, on_elements=lambda _, e: self.browser.get_attribute_value(
            e, 'class').endswith('active'), stop_on_first=True)
        return data

    def clear_fleet_text_search(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.CLEARTEXTSEARCH_ICON):
            self.browser.click(self.LCT.CLEARTEXTSEARCH_ICON)

    def get_rma_details_overview(self):
        header = self.browser.get_texts(self.LCT.RMADET_OVERVIEW_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.RMADET_OVERVIEW_CONTENT, row=1)

    def navigate_to_rma_request_details_tab(self, tab):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RMADET_TABS)
        self.browser.clicks(self.LCT.RMADET_TABS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                            stop_on_first=True)

    def get_current_rma_request_details_tab(self):
        return self.browser.get_text(self.browser.get_elements_by_condition(
            self.LCT.RMADET_TABS, on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(e, 'class'),
            stop_on_first=True)[0])

    def get_rma_details_device_info_header(self):
        return self.browser.get_texts(self.LCT.RMADET_DEVICEINFO_HEADER)

    def get_rma_details_device_info(self, row=None):
        header = self.browser.get_texts(self.LCT.RMADET_DEVICEINFO_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.RMADET_DEVICEINFO_CONTENT, row=row)

    def get_rma_request_details_other_info(self):
        header = self.browser.get_texts(self.LCT.RMADET_OTHERINFO_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.RMADET_OTHERINFO_CONTENT, row=1)

    def get_rma_request_details_shipping_info(self):
        address_type_header = self.browser.get_texts(self.LCT.RMADET_SHIPPINGINFO_HEADER)
        shipping_addr = {k: v for k, v in zip(self.browser.get_texts(self.LCT.RMADET_SHIPPINGINFO_SHIPADDR_HEADER),
                                              self.browser.get_texts(self.LCT.RMADET_SHIPPINGINFO_SHIPADDR_CONTENT))}
        returning_addr = {k: v for k, v in zip(self.browser.get_texts(self.LCT.RMADET_SHIPPINGINFO_RETURNADDR_HEADER),
                                               self.browser.get_texts(self.LCT.RMADET_SHIPPINGINFO_RETURNADDR_CONTENT))}
        return {
            address_type_header[0]: shipping_addr,
            address_type_header[1]: returning_addr
        }

    # TODO: --
    def get_rma_request_details_tracking_information(self):
        return self.browser.get_texts(self.LCT.RMADET_SHIPPINGINFO_TRACKING_INFO)

    def get_fleet_rma_request_details(self):
        """
        Get the rma request details without pending status
        @return: (dict)
        """
        output = {
            'Current request status': self.browser.get_text(self.LCT.RMADET_CURRENTRMASTATUS),
            'Current tab': self.get_current_rma_request_details_tab(),
            'RMA device information': self.get_rma_details_device_info(),
            'Other information': self.get_rma_request_details_other_info(),
            'Shipping information': self.get_rma_request_details_shipping_info(),
            'Tracking information': self.get_rma_request_details_tracking_information()
        }
        return output

    # Pending RMA

    def get_pending_rma_details_device_info(self, row=None):
        header = self.browser.get_texts(self.LCT.RMADET_PENDING_DEVICEINFO_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.RMADET_PENDING_DEVICEINFO_CONTENT, row=row)

    def get_pending_rma_request_shipping_address(self):
        header = self.browser.get_texts(self.LCT.RMADET_PEND_SHIPPINGADDRESS_HEADER)
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_SHIPPINGADDRESS_ADDRESS, 'style',
                                           'visibility: visible;')
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_SHIPPINGADDRESS_CITY, 'style', 'visibility: visible;')
        content = [
            self.browser.get_text(self.LCT.RMADET_PEND_SHIPPINGADDRESS_COUNTRY),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_SHIPPINGADDRESS_ADDRESS, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_SHIPPINGADDRESS_CITY, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_SHIPPINGADDRESS_STATE,
                                             'value') if self.browser.get_text(
                self.LCT.RMADET_PEND_SHIPPINGADDRESS_COUNTRY).lower() not in (
                                                             'canada', 'united states') else self.browser.get_text(
                self.LCT.RMADET_PEND_SHIPPINGADDRESS_STATE + '/../..'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_SHIPPINGADDRESS_ZIP, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_SHIPPINGADDRESS_PHONE, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_SHIPPINGADDRESS_EMAIL, 'value')
        ]
        # Rollback visibility of fields to default
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_SHIPPINGADDRESS_ADDRESS, 'style', 'visibility: hidden;')
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_SHIPPINGADDRESS_CITY, 'style', 'visibility: hidden;')
        return Utils.group_tabular_data(header, content, row=1)

    def get_pending_rma_request_returning_address(self):
        header = self.browser.get_texts(self.LCT.RMADET_PEND_RETURNINGADDRESS_HEADER)
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_RETURNINGADDRESS_ADDRESS, 'style',
                                           'visibility: visible;')
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_RETURNINGADDRESS_CITY, 'style', 'visibility: visible;')
        content = [
            self.browser.get_text(self.LCT.RMADET_PEND_RETURNINGADDRESS_COUNTRY),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_RETURNINGADDRESS_ADDRESS, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_RETURNINGADDRESS_CITY, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_RETURNINGADDRESS_STATE,
                                             'value') if self.browser.get_text(
                self.LCT.RMADET_PEND_RETURNINGADDRESS_COUNTRY).lower() not in (
                                                             'canada', 'united states') else self.browser.get_text(
                self.LCT.RMADET_PEND_RETURNINGADDRESS_STATE + '/../..'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_RETURNINGADDRESS_ZIP, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_RETURNINGADDRESS_PHONE, 'value'),
            self.browser.get_attribute_value(self.LCT.RMADET_PEND_RETURNINGADDRESS_EMAIL, 'value')
        ]
        # Rollback visibility attribute to default
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_RETURNINGADDRESS_ADDRESS, 'style',
                                           'visibility: hidden;')
        self.browser.set_attribute_element(self.LCT.RMADET_PEND_RETURNINGADDRESS_CITY, 'style', 'visibility: hidden;')
        return Utils.group_tabular_data(header, content, row=1)

    def get_fleet_pending_rma_request_details(self):
        """
        Get the pending rma request details
        @return: (dict)
        """
        output = {
            'Overview': self.get_rma_details_overview(),
            'Rma Device Information': self.get_pending_rma_details_device_info(),
            'Notification Email': self.browser.get_texts(self.LCT.RMADET_PEND_NOTIFEMAIL),
            'Shipping Address': self.get_pending_rma_request_shipping_address(),
            'Returning address': self.get_pending_rma_request_returning_address()
        }
        return output

    def get_fleet_rma_request_list_item(self, row=None):
        self.wait_for_rmg_request_items_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_DATA_CONTENT)
        header = ['RMA ID', 'Status', 'Facility', 'Outbound Devices', 'Inbound Devices', 'Request Date', 'Returned Date']
        return self.browser.get_tabular_data(header, self.LCT.RMAREQ_DATA_CONTENT, row=row)

    def get_all_fleet_rma(self, row=None):
        self.wait_for_rmg_request_items_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.RMAREQ_DATA_ROW)) == 10:
                header = ['RMA ID', 'Status', 'Facility', 'Outbound Devices', 'Inbound Devices', 'Request Date', 'Returned Date']
                content = self.browser.get_texts(self.LCT.RMAREQ_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.FLEET_PAGINATION_NEXT + '/..', 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.FLEET_PAGINATION_NEXT, is_scroll=True)
                if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_FLEET) and self.browser.get_element(self.LCT.NO_MORE_FLEET).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_for_rmg_request_items_available()
            else:
                self.wait_for_rmg_request_items_available()
                header = ['RMA ID', 'Status', 'Facility', 'Outbound Devices', 'Inbound Devices', 'Request Date', 'Returned Date']
                content = self.browser.get_texts(self.LCT.RMAREQ_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                self.logger.info(output)
                return [{k: v for k, v in c.items()} for c in output]

    def get_page_header_rma_detail(self):
        """
        Get page header rma detail
        :return: (str)
        """
        self.browser.wait_visibility_of_element_located(self.LCT.PAGE_HEADER_RMA_DETAIL)
        return self.browser.get_text(self.LCT.PAGE_HEADER_RMA_DETAIL).upper()

    def get_pending_rma_other_info(self):
        """
        Get other information
        :return: (str)
        """
        self.browser.wait_visibility_of_element_located(self.LCT.RMADET_PEND_RETURNINGADDRESS_NOTI_EMAIL)
        self.browser.wait_visibility_of_element_located(self.LCT.RMADET_PEND_RETURNINGADDRESS_NOTES)
        output = {
            'Notification email': self.browser.get_texts(self.LCT.RMADET_PEND_RETURNINGADDRESS_NOTI_EMAIL),
            'Notes': self.browser.get_text(self.LCT.RMADET_PEND_RETURNINGADDRESS_NOTES)
        }
        return output

    def get_rma_size_per_page_options(self):
        output = list()
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SIZEPERPAGE_CURRENT)
        self.browser.click(self.LCT.RMAREQ_SIZEPERPAGE_CURRENT)
        for _, e in enumerate(self.browser.get_elements(self.LCT.RMAREQ_SIZEPERPAGE_OPTIONS)):
            output.append(self.browser.execute_script('return arguments[0].innerText;', e))
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SIZEPERPAGE_OPTIONS)
        for option in self.browser.get_elements(self.LCT.RMAREQ_SIZEPERPAGE_OPTIONS):
            if '-active' in self.browser.get_attribute_value(option, 'class'):
                self.browser.click(option)
        return output

    def get_rma_current_pagination(self):
        output = dict()
        self.wait_for_rmg_request_items_available()
        self.browser.scroll_into_view(self.LCT.RMAREQ_SIZEPERPAGE_CURRENT)
        output['Rows'] = self.browser.get_text(self.LCT.RMAREQ_SIZEPERPAGE_CURRENT)
        for option in self.browser.get_elements(self.LCT.RMAREQ_PAGINATION_BUTTONS):
            if '-active' in self.browser.get_attribute_value(option, 'class'):
                output['Page'] = self.browser.get_text(option)
        return output

    def pagination_rma(self, next_or_previous=None, page_number=None, is_wait=True):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        time.sleep(20)
        self.browser.wait_visibility_of_element_located(self.LCT.FLEET_PAGINATION_NEXT)
        self.browser.wait_visibility_of_element_located(self.LCT.FLEET_PAGINATION_PREVIOUS)
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.hover_to(self.LCT.FLEET_PAGINATION_NEXT)
                self.browser.js_click(self.LCT.FLEET_PAGINATION_NEXT)
                break
            if next_or_previous == 'previous':
                self.browser.hover_to(self.LCT.FLEET_PAGINATION_PREVIOUS)
                self.browser.js_click(self.LCT.FLEET_PAGINATION_PREVIOUS)
                break
        if page_number:
            self.browser.clicks(self.LCT.FLEET_PAGINATION_PAGENUM,
                                on_elements=lambda e, _: self.browser.get_text(e).lower() == page_number.lower(),
                                stop_on_first=True)

    def custom_rma_size_per_page(self, by_size):
        # self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.scroll_into_view(self.LCT.RMAREQ_SIZEPERPAGE_CURRENT)
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_SIZEPERPAGE_CURRENT, timeout=5)
        if by_size:  # Maybe invisibility so perform js click
            self.browser.click(self.LCT.RMAREQ_SIZEPERPAGE_CURRENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.RMAREQ_SIZEPERPAGE_OPTIONS)
            self.browser.js_clicks(self.LCT.RMAREQ_SIZEPERPAGE_OPTIONS,
                                   on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                       by_size.lower()),
                                   stop_on_first=False)

    def clear_rma_request_on(self, **on):
        self.wait_for_rmg_request_items_available()
        _index = self._on_rma_request_item(**on)
        row_index = self.browser.get_elements_by_condition(self.LCT.RMAREQ_DATA_ROW,
                                                           on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
        self.browser.hover_to(row_index)
        self.browser.clicks(self.LCT.RMAREQ_DATA_VIEW_OR_EDIT, on_elements=lambda index, _: index == _index,
                            stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_CANCEL_REQUEST)
        self.browser.click(self.LCT.RMAREQ_CANCEL_REQUEST)
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_CANCEL_REQUEST_CONFIRM, inverse=True)
        self.browser.click(self.LCT.RMAREQ_CANCEL_REQUEST_CONFIRM)
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_CANCEL_MESSAGE, inverse=True)

    def get_message_canceled_request(self):
        self.browser.wait_visibility_of_element_located(self.LCT.RMAREQ_CANCEL_MESSAGE)
        return self.browser.get_text(self.LCT.RMAREQ_CANCEL_MESSAGE)

    def wait_for_waiting_for_return_items_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.WFRETURN_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.WFRETURN_DATA_CONTENT, inverse=True)

    def get_fleet_waiting_for_return_items(self, row=None):
        self.wait_for_waiting_for_return_items_available()
        header = self.browser.get_texts(self.LCT.WFRETURN_DATA_HEADER) + ['Study stop date', 'Facility']
        self.logger.info(self.browser.get_tabular_data(header, self.LCT.WFRETURN_DATA_CONTENT, row=row))
        return self.browser.get_tabular_data(header, self.LCT.WFRETURN_DATA_CONTENT, row=row)

    def filter_fleet_waiting_for_return(self, text_search=None, search_by=None):
        if search_by:
            self.browser.wait_visibility_of_element_located(self.LCT.WFRETURN_SEARCH_BY)
            self.browser.click(self.LCT.WFRETURN_SEARCH_BY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.WFRETURN_SEARCH_BY_OPTION)
            self.browser.clicks(self.LCT.WFRETURN_SEARCH_BY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        if text_search:
            self.browser.wait_visibility_of_element_located(self.LCT.WFRETURN_SEARCH_INPUT)
            self.browser.input_text(self.LCT.WFRETURN_SEARCH_INPUT, text_search)
        self.wait_for_waiting_for_return_items_available()
