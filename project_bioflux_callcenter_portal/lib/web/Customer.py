#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import customer as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Customer(WebPage):
    """
    Handle login page, left-hand-side main menu
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_admin_subtab(self, subtab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_SUBTAB) and self.browser.get_elements(self.LCT.CUSTOMER_SUBTAB + '/a')[0].get_attribute('disabled') is None:
                self.browser.clicks(self.LCT.CUSTOMER_SUBTAB + '/a',
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == subtab.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_page_header_admin(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_PAGEHEADER) and self.browser.get_element(self.LCT.CUSTOMER_PAGEHEADER).is_displayed():
                # self.browser.wait_visibility_of_element_located(self.LCT.PAGEHEADER, inverse=True)
                return self.browser.get_text(self.LCT.CUSTOMER_PAGEHEADER)
            elif time.time() - start_time > 1 * 60:
                break

    def navigate_to_admin_subtab_menu(self, subtab_menu):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_MENU_SUBTAB) and self.browser.get_elements(self.LCT.CUSTOMER_MENU_SUBTAB)[0].get_attribute('disabled') is None:
                self.browser.clicks(self.LCT.CUSTOMER_MENU_SUBTAB,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == subtab_menu.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_admin_facilities_details_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_FACILITIES_DETAIL) and self.browser.get_element(self.LCT.CUSTOMER_FACILITIES_DETAIL).is_displayed():
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_facilities_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_FACILITY_CONTENT) and self.browser.get_element(self.LCT.CUSTOMER_FACILITY_CONTENT).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_FACILITY_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_facilities_on_page(self, row=None):
        self.wait_facilities_available()
        header = self.browser.get_texts(self.LCT.CUSTOMER_FACILITY_HEADER)
        output = self.browser.get_tabular_data(header, self.LCT.CUSTOMER_FACILITY_CONTENT, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_facilities_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_facilities_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_facilities_on_page()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def edit_access_to_portal_on(self, **on):
        self.wait_facilities_available()
        _index = self._on_facilities_item(**on)
        self.browser.hover_to_by_index(self.LCT.CUSTOMER_FACILITY_CONTENT, _index)
        self.browser.clicks(self.LCT.CUSTOMER_FACILITY_ACCESS, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_facilities_on(self, **on):
        self.wait_facilities_available()
        _index = self._on_facilities_item(**on)
        self.browser.hover_to_by_index(self.LCT.CUSTOMER_FACILITY_CONTENT, _index)
        self.browser.clicks(self.LCT.CUSTOMER_FACILITY_EDIT_ICON, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def navigate_to_facilities_portal(self, facilities_portal):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_FACILITY_PORTAL) and self.browser.get_elements(self.LCT.CUSTOMER_FACILITY_PORTAL)[0].is_displayed():
                self.browser.clicks(self.LCT.CUSTOMER_FACILITY_PORTAL,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == facilities_portal.lower(),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_FACILITY_PORTAL_SUBMIT)
                self.browser.click(self.LCT.CUSTOMER_FACILITY_PORTAL_SUBMIT)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_content_header_page(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_CONTENT_HEADER) and self.browser.get_elements(self.LCT.CUSTOMER_CONTENT_HEADER)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_CONTENT_HEADER, inverse=True)
                return self.browser.get_text(self.LCT.CUSTOMER_CONTENT_HEADER).split('\n')
            elif time.time() - start_time > 1 * 60:
                break

    def get_content_header_page_biocare(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_CONTENT_HEADER_BIOCARE) and self.browser.get_element(self.LCT.CUSTOMER_CONTENT_HEADER_BIOCARE).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_CONTENT_HEADER_BIOCARE, inverse=True)
                return self.browser.get_text(self.LCT.CUSTOMER_CONTENT_HEADER_BIOCARE).split('\n')
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_page_header_billing(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_PAGEHEADER_BILLING) and self.browser.get_element(self.LCT.CUSTOMER_PAGEHEADER_BILLING).is_displayed():
                # self.browser.wait_visibility_of_element_located(self.LCT.PAGEHEADER, inverse=True)
                return self.browser.get_text(self.LCT.CUSTOMER_PAGEHEADER_BILLING)
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_page_header_biocare(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_PAGEHEADER_BIOCARE) and self.browser.get_element(self.LCT.CUSTOMER_PAGEHEADER_BIOCARE).is_displayed():
                # self.browser.wait_visibility_of_element_located(self.LCT.PAGEHEADER, inverse=True)
                return self.browser.get_text(self.LCT.CUSTOMER_PAGEHEADER_BIOCARE)
            elif time.time() - start_time > 1 * 60:
                break

    def wait_admin_facilities_user_details_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_EDIT_USER_USERNAME) and self.browser.get_elements(self.LCT.CUSTOMER_EDIT_USER_USERNAME)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_EDIT_USER_USERNAME, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_admin_facilities_contents_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_CONTENT_PAGE) and self.browser.get_element(self.LCT.CUSTOMER_CONTENT_PAGE).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_CONTENT_PAGE, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_dashboard_sales_portal_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_SALES_DASHBOARD) and self.browser.get_elements(self.LCT.CUSTOMER_SALES_DASHBOARD)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_SALES_DASHBOARD, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_sales_team_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_SALES_VIEW_ACCOUNT) and self.browser.get_elements(self.LCT.CUSTOMER_SALES_VIEW_ACCOUNT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_SALES_VIEW_ACCOUNT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_account_details_sales_team_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_SALES_ACCOUNT_DETAILS) and self.browser.get_element(self.LCT.CUSTOMER_SALES_ACCOUNT_DETAILS).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_SALES_ACCOUNT_DETAILS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def view_account_details_on(self, row=None):
        self.wait_sales_team_available()
        elements = self.browser.get_elements(self.LCT.CUSTOMER_SALES_VIEW_ACCOUNT)
        self.browser.hover_to(elements[int(row)])
        self.browser.click(elements[int(row)])

    def navigate_to_sales_team_subtab(self, subtab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.CUSTOMER_SALES_TEAM_SUBTAB) and self.browser.get_elements(self.LCT.CUSTOMER_SALES_TEAM_SUBTAB)[0].is_displayed():
                self.browser.clicks(self.LCT.CUSTOMER_SALES_TEAM_SUBTAB,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == subtab.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def edit_biodirect_on(self, **on):
        self.wait_biodirect_available()
        _index = self._on_biodirect_item(**on)
        self.browser.hover_to_by_index(self.LCT.CUSTOMER_BIODIRECT_CONTENT, _index)
        self.browser.clicks(self.LCT.CUSTOMER_BIODIRECT_EDIT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_support_on(self, **on):
        self.wait_biodirect_available()
        _index = self._on_biodirect_item(**on)
        self.browser.hover_to_by_index(self.LCT.CUSTOMER_BIODIRECT_CONTENT, _index)
        self.browser.clicks(self.LCT.CUSTOMER_SUPPORT_EDIT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def open_support_on(self, **on):
        self.wait_biodirect_available()
        _index = self._on_biodirect_item(**on)
        self.browser.hover_to_by_index(self.LCT.CUSTOMER_BIODIRECT_CONTENT, _index)
        self.browser.clicks(self.LCT.CUSTOMER_SUPPORT_OPEN, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_support_rma_on(self, **on):
        self.wait_biodirect_available()
        _index = self._on_biodirect_item(**on)
        self.browser.hover_to_by_index(self.LCT.CUSTOMER_BIODIRECT_CONTENT, _index)
        self.browser.clicks(self.LCT.CUSTOMER_SUPPORT_EDIT_RMA, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def edit_operation_forms_rma_on(self, **on):
        self.wait_biodirect_available()
        _index = self._on_biodirect_item(**on)
        self.browser.hover_to_by_index(self.LCT.CUSTOMER_BIODIRECT_CONTENT, _index)
        self.browser.clicks(self.LCT.CUSTOMER_SUPPORT_EDIT_OPERATION, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def wait_biodirect_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_BIODIRECT_CONTENT) and self.browser.get_element(self.LCT.CUSTOMER_BIODIRECT_CONTENT).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_BIODIRECT_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_biodirect_on_page(self, row=None):
        self.wait_biodirect_available()
        header = self.browser.get_texts(self.LCT.CUSTOMER_BIODIRECT_HEADER)
        output = self.browser.get_tabular_data(header, self.LCT.CUSTOMER_BIODIRECT_CONTENT, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_biodirect_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_biodirect_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_biodirect_on_page()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def get_current_page_header_oder(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER) and self.browser.get_element(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER).is_displayed():
                # self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER, inverse=True)
                return self.browser.get_text(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER)
            elif time.time() - start_time > 1 * 60:
                break

    def get_current_page_header_support(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER) and self.browser.get_element(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER, inverse=True)
                return self.browser.get_text(self.LCT.CUSTOMER_BIODIRECT_CONTENT_HEADER)
            elif time.time() - start_time > 1 * 60:
                break
