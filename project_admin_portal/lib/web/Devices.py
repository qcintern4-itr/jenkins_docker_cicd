#!/usr/bin/env python3

try:
    from project_admin_portal.lib.WebPage import WebPage
    from project_admin_portal.config.web_locators import devices as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Devices(WebPage):
    """
    Handle Devices page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_devices(self):
        self.browser.open_page(self.URL + '/devices')

    def _clear_facilities(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ITF_FACILITY_CLEARICON)
        self.browser.click(self.LCT.ITF_FACILITY_CLEARICON)

    def _select_facilities_at_in_the_field(self, *facilities):
        for fc in facilities:
            self.browser.input_text(self.LCT.ITF_FACILITY + '//input', fc, is_clear=False)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ITF_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.ITF_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == fc.lower(),
                                stop_on_first=True)

    def filter_in_the_field_device(self, model=None, facilities=None, text_search=None):
        self.browser.clicks(self.LCT.TABS_HEADER, on_elements=lambda i, _: i == 0, stop_on_first=True)
        if model:
            self.browser.click(self.LCT.ITF_MODEL)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ITF_MODEL_OPTIONS)
            self.browser.clicks(self.LCT.ITF_MODEL_OPTIONS, on_elements=lambda _, e: self.browser.get_text(e) == model,
                                stop_on_first=True)
        if facilities:
            if isinstance(facilities, list):
                _fc = facilities
            else:
                _fc = [f.strip() for f in facilities.split(',')]
            values = self.browser.get_text(self.LCT.ITF_FACILITY)
            if 'Search by Facility' not in values:
                self._clear_facilities()
            self._select_facilities_at_in_the_field(*_fc)
        if text_search:
            self.browser.input_text(self.LCT.ITF_SEARCHBOX, text_search)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_CONTENT)

    def filter_inventory_device(self, model=None, text_search=None):
        self.browser.clicks(self.LCT.TABS_HEADER, on_elements=lambda i, _: i == 1, stop_on_first=True)
        if model:
            self.browser.click(self.LCT.IVT_MODEL)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.IVT_MODEL_OPTIONS)
            self.browser.clicks(self.LCT.IVT_MODEL_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == model.lower(),
                                stop_on_first=True)
        if text_search:
            self.browser.click(self.LCT.IVT_SEARCHBOX, text_search)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_CONTENT)

    def get_devices(self, row=None):  # Get devices on current screen (applied both In The Field and Inventory screens)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_CONTENT)
        header = self.browser.get_texts(self.LCT.DV_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.DV_CONTENT, row=row)

    def _on_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_devices()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such devices exist under {_on}.')

    def _select_item(self, locator_to_click, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_CONTENT)
        index = self._on_item(**on)
        self.browser.clicks(locator_to_click, on_elements=lambda i, _: i == index, stop_on_first=True)

    def view_device_info_on(self, **on):
        self._select_item(self.LCT.DV_DEVICEID, **on)

    def get_device_information(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DI_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DI_CONTENT)
        header = self.browser.get_texts(self.LCT.DI_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.DI_CONTENT, row=row)

    def _select_edit_icon(self, locator_to_click, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DV_EDITICONS)
        index = self._on_item(**on)
        self.browser.js_clicks(locator_to_click, on_elements=lambda i, _: i == index, stop_on_first=True)

    def open_edit_single_device_on(self, **on):
        self._select_edit_icon(self.LCT.DV_EDITICONS, **on)

    def edit_single_device(self, device_model=None, location=None, facility=None, is_save=True):
        if device_model:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ESD_DEVICEMODELS)
            self.browser.clicks(self.LCT.ESD_DEVICEMODELS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device_model.lower(),
                                stop_on_first=True)
        if location:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ESD_LOCATIONS)
            self.browser.clicks(self.LCT.ESD_LOCATIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == location.lower(),
                                stop_on_first=True)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.ESD_FACILITY)
            self.browser.input_text(self.LCT.ESD_FACILITY, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.ESD_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.ESD_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if is_save:
            self.browser.click(self.LCT.ESD_SAVEBUTTON)

    def open_edit_multi_devices(self):
        self.browser.click(self.LCT.DV_EDITBUTTON)

    def _select_devices(self, *devices_id):
        for dv in devices_id:
            self.browser.click(self.LCT.EMD_DEVICE)  # re-focus on text box
            self.browser.input_text(self.LCT.EMD_DEVICE + '//input', dv)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EMD_DEVICE_OPTIONS)
            self.browser.clicks(self.LCT.EMD_DEVICE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e) == dv,
                                stop_on_first=True)

    def edit_multi_devices(self, device_id=None, device_model=None, location=None, facility=None, is_save=True):
        if device_id:
            _dv = device_id if isinstance(device_id, list) else [dv.strip() for dv in device_id.split(',')]
            self._select_devices(*_dv)
        if device_model:
            self.browser.wait_visibility_of_element_located(self.LCT.EMD_DEVICEMODEL)
            self.browser.click(self.LCT.EMD_DEVICEMODEL)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EMD_DEVICEMODEL_OPTIONS)
            self.browser.clicks(self.LCT.EMD_DEVICEMODEL_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device_model.lower(),
                                stop_on_first=True)
        if location:
            self.browser.clicks(self.LCT.EMD_LOCATIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == location.lower(),
                                stop_on_first=True)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.EMD_FACILITY)
            self.browser.input_text(self.LCT.EMD_FACILITY, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.EMD_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.EMD_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower())
        if is_save:
            self.browser.click(self.LCT.EMD_SAVEBUTTON)

    def open_create_new_device(self):
        self.browser.click(self.LCT.DV_CREATENEWBUTTON)

    def create_single_device(self, device_id=None, device_model=None, facility=None, is_create=True):
        self.browser.clicks(self.LCT.TABS_TYPECREATE, on_elements=lambda i, _: i == 0, stop_on_first=True)
        if device_id:
            self.browser.input_text(self.LCT.CSD_DEVICEID, device_id)
        if device_model:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CSD_DEVICEMODELS)
            self.browser.clicks(self.LCT.CSD_DEVICEMODELS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device_model.lower(),
                                stop_on_first=True)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.CSD_FACILITY)
            self.browser.input_text(self.LCT.CSD_FACILITY, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CSD_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.CSD_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if is_create:
            self.browser.click(self.LCT.CSD_CREATEBUTTON)

    def create_multiple_devices(self, from_dv=None, to_dv=None, device_model=None, facility=None, is_create=True):
        self.browser.clicks(self.LCT.TABS_TYPECREATE, on_elements=lambda i, _: i == 1, stop_on_first=True)
        if from_dv:
            self.browser.input_text(self.LCT.CMD_FROMDEVICEID, from_dv)
        if to_dv:
            self.browser.input_text(self.LCT.CMD_TODEVICEID, to_dv)
        if device_model:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CMD_DEVICEMODELS)
            self.browser.clicks(self.LCT.CMD_DEVICEMODELS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device_model.lower(),
                                stop_on_first=True)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.CMD_FACILITY)
            self.browser.input_text(self.LCT.CMD_FACILITY, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CMD_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.CMD_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if is_create:
            self.browser.click(self.LCT.CMD_CREATEBUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.CMD_CONFIRM_YES)
            self.browser.click(self.LCT.CMD_CONFIRM_YES)
