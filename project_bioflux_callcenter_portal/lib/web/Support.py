#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import support as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Support(WebPage):
    """
    Handle support page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_support(self):
        """
        Navigate to support page
        :return: None
        """
        self.browser.open_page(self.URL + '/support')

    def wait_open_support_available(self):
        """
        Wait until open support items available
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.OPEN_DATA_CONTENT) and self.browser.get_elements(self.LCT.OPEN_DATA_CONTENT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.OPEN_DATA_HEADER, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def wait_resolved_support_available(self):
        """
        Wait until resolved support items available
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located('class:react-loading-skeleton', inverse=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RES_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RES_DATA_CONTENT, inverse=True)

    def navigate_to_support_menu(self, tab):
        """
        Navigate to support menu (tab)
        :param tab: (str) support menu (tab)
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS) and self.browser.get_elements(self.LCT.TABS)[0].is_displayed():
                self.browser.clicks(self.LCT.TABS, on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def filter_support(self, support_state=None, facility=None, by_category=None, text_search=None):
        """
        Filter support
        :param support_state: (str) support state (tab)
        :param facility: (str) facility
        :param by_category: (str) category
        :param text_search: (str)
        :return: None
        """
        if support_state:
            self.navigate_to_support_menu(tab=support_state)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_INPUT)
            self.browser.click(self.LCT.FACILITY_INPUT + '/../../../..')
            self.browser.input_text(self.LCT.FACILITY_INPUT, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if by_category:
            self.browser.click(self.LCT.CURRENTCATEGORY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CATEGORY_OPTIONS)
            self.browser.clicks(self.LCT.CATEGORY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_category.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.input_text(self.LCT.TEXTSEARCH, text_search)
        wait_func = {
            'open': self.wait_open_support_available,
            'resolved': self.wait_resolved_support_available
        }
        wait_func[self.get_current_support_state().lower()]()

    def get_current_support_state(self):
        """
        Get the current support state (tab)
        :return: (str) Support state (Open or Resolved)
        """
        for elem in self.browser.get_elements(self.LCT.TABS + '/a'):
            if 'active' in self.browser.get_attribute_value(elem, 'class'):
                return self.browser.get_text(elem)

    def get_support_current_filter_values(self):
        """
        Get current filter values on page
        :return: (dict)
        """
        output = {
            'Support State': self.get_current_support_state(),
            'Facility': self.browser.get_text(self.LCT.FACILITY_INPUT + '/../../..'),
            'Category': self.browser.get_text(self.LCT.CURRENTCATEGORY),
            'Text Search': self.browser.get_attribute_value(self.LCT.TEXTSEARCH, 'value')
        }
        return output

    def get_support_filter_options(self):
        output = dict()
        self.browser.click(self.LCT.FACILITY_INPUT + '/../../..')  # facility
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_OPTIONS)
        output['Facility'] = self.browser.get_texts(self.LCT.FACILITY_OPTIONS)
        self.browser.click(self.LCT.CURRENTCATEGORY)  # category
        output['Category'] = self.browser.get_texts(
            self.LCT.CATEGORY_OPTIONS) if self.browser.wait_visibility_of_all_elements_located(
            self.LCT.CATEGORY_OPTIONS) else ''
        return output

    def clear_support_text_search(self):
        self.browser.click(self.LCT.TEXTSEARCH_CLEAR)

    # Open

    def get_open_supports(self, row=None):
        """
        Get open reports
        :param row: (int) row index
        :return: (list or dict)
        """
        self.wait_open_support_available()
        # self.browser.wait_visibility_of_all_elements_located(self.LCT.OPEN_DATA_HEADER, inverse=True)
        header = self.browser.get_texts(self.LCT.OPEN_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.OPEN_DATA_CONTENT, row=row)

    def sort_open_support(self, asc_or_desc):  # Sort by Request ID
        """
        Sort the open support
        :param asc_or_desc: (str) sort condition (valid keys: asc or desc)
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.OPEN_DATA_HEADER)
        for _ in range(2):
            sort_elem = self.browser.get_element(self.LCT.OPEN_DATA_HEADER + '[1]')
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)

    def _on_open_support_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_open_support_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_open_supports()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such open support item exist on `{_on}`.')

    def _get_open_support_header_index(self, header):
        for i, elem in enumerate(self.browser.get_elements(self.LCT.OPEN_DATA_HEADER)):
            if header.lower() == self.browser.get_text(elem).lower():
                return i + 1
        raise Exception(f'No such open support header on `{header}`.')

    def view_open_support_facility_information_on(self, **on):
        _row_index = self._on_open_support_item(**on)
        _col_index = self._get_open_support_header_index('facility')
        self.wait_open_support_available()
        self.browser.clicks(self.LCT.OPEN_DATA_CONTENT + f'[{_col_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index,
                            stop_on_first=True)

    def view_open_support_request_on(self, **on):
        _index = self._on_open_support_item(**on)
        self.wait_open_support_available()
        self.browser.hover_to_by_index(self.LCT.OPEN_DATA_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.OPEN_DATA_CONTENT_VIEWREQUEST, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    # Resolved support

    def get_resolved_supports(self, row=None):
        self.wait_resolved_support_available()
        header = self.browser.get_texts(self.LCT.RES_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.RES_DATA_CONTENT, row=row)

    def sort_resolved_support(self, asc_or_desc):  # Sort by Request ID
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RES_DATA_HEADER)
        for _ in range(2):
            sort_elem = self.browser.get_element(self.LCT.RES_DATA_HEADER + '[1]')
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)

    def _on_resolved_support_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_resolved_support_available()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_resolved_supports()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such resolved support item exist on `{_on}`.')

    def _get_resolved_support_header_index(self, header):
        for i, elem in enumerate(self.browser.get_elements(self.LCT.OPEN_DATA_HEADER)):
            if header.lower() == self.browser.get_text(elem).lower():
                return i + 1
        raise Exception(f'No such resolved support header on `{header}`.')

    def view_resolved_support_facility_information_on(self, **on):
        _row_index = self._on_resolved_support_item(**on)
        _col_index = self._get_resolved_support_header_index('facility')
        self.wait_resolved_support_available()
        self.browser.clicks(self.LCT.RES_DATA_CONTENT + f'[{_col_index}]' + '//button',
                            on_elements=lambda i, _: i == _row_index, stop_on_first=True)

    def view_resolved_support_request_on(self, **on):
        _index = self._on_resolved_support_item(**on)
        self.wait_resolved_support_available()
        self.browser.hover_to_by_index(self.LCT.RES_DATA_CONTENT_ROW, _index)
        self.browser.clicks(self.LCT.RES_DATA_CONTENT_VIEWREQUEST, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    # Support request details

    def wait_support_request_details_available(self):
        self.browser.wait_visibility_of_element_located('class:support-requeset-detail-page')

    def resolve_support_request(self, is_resolve=True):
        self.wait_support_request_details_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SQUEST_RESOLVE)
        self.browser.click(self.LCT.SQUEST_RESOLVE)
        if is_resolve:
            self.browser.click(self.LCT.SQUEST_RESOLVE_CONFIRM)
        else:
            self.browser.click(self.LCT.SQUEST_RESOLVE_CANCEL)

    def send_support_request(self, message):
        self.wait_support_request_details_available()
        if message:
            self.browser.wait_visibility_of_element_located(self.LCT.SQUEST_MESSAGE_INPUT)
            self.browser.input_text(self.LCT.SQUEST_MESSAGE_INPUT, message)
            self.browser.wait_visibility_of_element_located(self.LCT.SQUEST_MESSAGE_SEND)
            self.browser.click(self.LCT.SQUEST_MESSAGE_SEND)
            self.browser.wait_visibility_of_element_located(self.LCT.SQUEST_MESSAGE_SEND, inverse=True)
            return message

    def get_support_request_details(self):
        self.wait_support_request_details_available()
        output = dict()
        output['Header'] = {
            'Request ID': self.browser.get_text(self.LCT.SQUEST_REQUESTID).split()[0],
            'Request State': self.browser.get_text(self.LCT.SQUEST_REQUESTID).split()[-1],
            'Request Type': self.browser.get_text(self.LCT.SQUEST_REQUESTTYPE),
            'Facility': self.browser.get_text(self.LCT.SQUEST_FACILITY)
        }
        if self.browser.get_text(self.LCT.SQUEST_REQUESTTYPE).lower() in ('abort study', 'report request'):
            output['Requests'] = {
                'Study ID': self.browser.get_texts(self.LCT.SREQUEST_STUDY_ID),
                'Message': self.browser.get_text(self.LCT.SREQUEST_MESSAGE)
            }
        if self.browser.wait_visibility_of_all_elements_located(self.LCT.SREQUEST_MESSAGE_COMMUNICATION) and self.browser.get_elements(self.LCT.SREQUEST_MESSAGE_COMMUNICATION)[0].is_displayed():
            output['Communication'] = {
                'Avatar': self.browser.get_texts(self.LCT.SQUEST_AVATAR),
                'Name': self.browser.get_texts(self.LCT.SQUEST_NAME),
                'DateTime': self.browser.get_texts(self.LCT.SQUEST_DATETIME),
                'Description': self.browser.get_texts(self.LCT.SQUEST_DESCRIPTION)
            }
        if self.browser.wait_visibility_of_all_elements_located(self.LCT.SQUEST_INTERNAL_NOTES_ROW) and self.browser.get_elements(self.LCT.SQUEST_INTERNAL_NOTES_ROW)[0].is_displayed():
            output['Internal'] = {
                'Name': [name.split(' (')[0] for name in self.browser.get_texts(self.LCT.SQUEST_INTERNAL_NAME)],
                'Role': self.browser.get_texts(self.LCT.SQUEST_INTERNAL_ROLE),
                'DateTime': self.browser.get_texts(self.LCT.SQUEST_INTERNAL_DATETIME),
                'Description': self.browser.get_texts(self.LCT.SQUEST_INTERNAL_CONTENT)
            }
        if self.browser.get_text(self.LCT.SQUEST_REQUESTTYPE).lower() == 'change study type':
            header = self.browser.get_texts(self.LCT.SQUEST_STUDYLIST_HEADER)
            output['Study List'] = self.browser.get_tabular_data(header, self.LCT.SQUEST_STUDYLIST_CONTENT, row=None)
        print("output", output)
        return output

    def view_support_request_facility_information(self):
        self.wait_support_request_details_available()
        self.browser.click(self.LCT.SQUEST_FACILITY)

    def view_support_request_study_information_on(self):  # view st info from study list at comment: TBD
        pass

    def back_from_support_request(self):
        self.browser.click(self.LCT.SQUEST_BACKICON)

    def get_all_supports(self, row=None):
        output_1 = []
        output_2 = []
        while True:
            if len(self.browser.get_texts(self.LCT.RES_DATA_CONTENT_ROW)) == 10:
                self.wait_resolved_support_available()
                header = self.browser.get_texts(self.LCT.RES_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.RES_DATA_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                self.browser.js_click(self.LCT.PGN_NEXT)
                if self.browser.wait_visibility_of_element_located(self.LCT.SUPPORT_PGN_MESSAGE) and self.browser.get_element(self.LCT.SUPPORT_PGN_MESSAGE).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
            else:
                self.wait_resolved_support_available()
                header = self.browser.get_texts(self.LCT.RES_DATA_HEADER)
                content = self.browser.get_texts(self.LCT.RES_DATA_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def send_internal_note(self, internal_note):
        self.wait_support_request_details_available()
        if internal_note:
            self.browser.wait_visibility_of_element_located(self.LCT.SQUEST_INTERNAL_NOTE_INPUT)
            self.browser.input_text(self.LCT.SQUEST_INTERNAL_NOTE_INPUT, internal_note)
            self.browser.wait_visibility_of_element_located(self.LCT.SQUEST_INTERNAL_NOTE_ADD)
            self.browser.click(self.LCT.SQUEST_INTERNAL_NOTE_ADD)
            self.browser.wait_visibility_of_element_located(self.LCT.SQUEST_INTERNAL_NOTE_ADD, inverse=True)
            return internal_note

    def get_support_request_internal_note(self):
        self.wait_support_request_details_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SQUEST_INTERNAL_ITEMS, inverse=True)
        output = []
        root_elements = self.browser.get_elements(self.LCT.SQUEST_INTERNAL_ITEMS)
        if not root_elements:
            return output
        for element in root_elements:
            name_and_role = self.browser.get_text(self.browser.get_child_element(element, self.LCT.SQUEST_INTERNAL_NAME)).split()
            name = ' '.join(name_and_role[:-1])  # Join all except the last element (Role)
            role = name_and_role[-1]  # The last element is Role
            output.append({
                'Name': name,
                'Role': role,
                'DateTime': self.browser.get_text(self.browser.get_child_element(element, self.LCT.SQUEST_INTERNAL_DATETIME)),
                'Content': self.browser.get_text(self.browser.get_child_element(element, self.LCT.SQUEST_INTERNAL_CONTENT))
            })
        # print("output", output)
        return output
