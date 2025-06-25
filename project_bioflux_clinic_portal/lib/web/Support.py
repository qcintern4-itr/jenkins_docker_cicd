#!/usr/bin/env python3
import time

from corelib.WebHandler import BY_MAP

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import support as locators
    from selenium.webdriver import Keys

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
        self.browser.open_page(self.URL + '/support')

    def navigate_to_support_menu(self, menu=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU)
        self.browser.clicks(self.LCT.MENU,
                            on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(menu.lower()),
                            stop_on_first=True)

    def get_support_menu(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU)
        return [menu.split('\n')[0] for menu in self.browser.get_texts(self.LCT.MENU)]

    def get_support_contact(self):
        output = {
            'Email': self.browser.get_text(self.LCT.CONTACT_EMAIL),
            'Phone': self.browser.get_text(self.LCT.CONTACT_PHONE),
            'Send feedback': self.browser.get_text(self.LCT.SEND_FEEDBACK)
        }
        return output

    def frequently_asked_questions(self):
        pass

    def send_feedback_or_feature_request(self, category=None, facility=None, email=None, message=None, is_submit=True):
        # self.navigate_to_support_menu(menu='Send Feedback')
        self.browser.click(self.LCT.FEEDBACK_BUTTON)
        if category:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FEEDBACK_CATEGORY)
            self.browser.clicks(
                self.LCT.FEEDBACK_CATEGORY,
                on_elements=lambda _, e: self.browser.get_text(
                    e.find_element(BY_MAP['xpath'], './span[last()]')).lower() == category.lower(),
                stop_on_first=True
            )
        if facility:
            # self.browser.input_text(self.LCT.FEEDBACK_FACILITY, facility)
            self.browser.click(self.LCT.FEEDBACK_FACILITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.FEEDBACK_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.FEEDBACK_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if email:
            self.browser.input_text(self.LCT.FEEDBACK_EMAIL, email)
        if message:
            self.browser.input_text(self.LCT.FEEDBACK_MESSAGE, message)
        if is_submit:
            self.browser.click(self.LCT.FEEDBACK_SUBMIT)

    def get_email_err_feedback(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FEEDBACK_EMAIL_ERROR)
        email_err = self.browser.get_text(self.LCT.FEEDBACK_EMAIL_ERROR)
        return email_err

    def get_message_err_feedback(self):
        self.browser.wait_visibility_of_element_located(self.LCT.FEEDBACK_MESSAGE_ERROR)
        message_err = self.browser.get_text(self.LCT.FEEDBACK_MESSAGE_ERROR)
        return message_err

    def close_send_feedback_modal(self):
        self.browser.click(self.LCT.FEEDBACK_CLOSE_MODAL)

    def wait_until_support_requests_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPPORTRQ_DATA_CONTENT) and self.browser.get_elements(self.LCT.SUPPORTRQ_DATA_CONTENT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPPORTRQ_DATA_CONTENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def sort_support_request(self, asc_or_desc):
        for _ in range(2):
            sort_elem = self.browser.get_elements(self.LCT.SUPPORTRQ_DATA_HEADER)[1]
            if asc_or_desc in self.browser.get_attribute_value(sort_elem, 'aria-label'):
                break
            self.browser.click(sort_elem)

    def filter_support_request(self, by_status=None, by_category=None, text_search=None, sort=None):
        self.wait_until_support_requests_available()
        if by_status:
            self.browser.wait_visibility_of_element_located(self.LCT.SUPPORTRQ_BYSTATUS)
            self.browser.click(self.LCT.SUPPORTRQ_BYSTATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPPORTRQ_BYSTATUS_OPTIONS)
            self.browser.clicks(self.LCT.SUPPORTRQ_BYSTATUS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_status.lower(),
                                stop_on_first=True)
            time.sleep(5)

        if by_category:
            self.browser.wait_visibility_of_element_located(self.LCT.SUPPORTRQ_BYCATEGORY)
            self.browser.click(self.LCT.SUPPORTRQ_BYCATEGORY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPPORTRQ_BYCATEGORY_OPTIONS)
            self.browser.clicks(self.LCT.SUPPORTRQ_BYCATEGORY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_category.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.wait_visibility_of_element_located(self.LCT.SUPPORTRQ_TEXTSEARCH)
            self.browser.input_text(self.LCT.SUPPORTRQ_TEXTSEARCH, text_search)
        if sort:
            self.sort_support_request(asc_or_desc=sort)
        self.wait_until_support_requests_available()

    def get_support_requests(self, row=None):
        self.wait_until_support_requests_available()
        header = self.browser.get_texts(self.LCT.SUPPORTRQ_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.SUPPORTRQ_DATA_CONTENT, row=row)

    def get_support_request_current_filter(self):
        output = {
            'Facility': self.browser.get_text(self.LCT.CURRENT_FACILITY),
            'Status': self.browser.get_text(self.LCT.SUPPORTRQ_BYSTATUS),
            'Category': self.browser.get_text(self.LCT.SUPPORTRQ_BYCATEGORY),
            'Search By': self.browser.get_attribute_value(self.LCT.SUPPORTRQ_TEXTSEARCH, 'placeholder').replace(
                'Search by ', ''),
            'Text Search': self.browser.get_attribute_value(self.LCT.SUPPORTRQ_TEXTSEARCH, 'value')
        }
        return output

    def get_support_request_filter_options(self):
        output = dict()
        # Facilities
        self.browser.click(self.LCT.CURRENT_FACILITY)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_SELECTIONS)
        output['Facilities'] = self.browser.get_texts(self.LCT.FACILITY_SELECTIONS)
        self.browser.clicks(self.LCT.FACILITY_SELECTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == self.browser.get_text(
                                self.LCT.CURRENT_FACILITY).lower(), stop_on_first=True)  # handle facility dropdown
        # Statuses
        self.browser.click(self.LCT.SUPPORTRQ_BYSTATUS)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPPORTRQ_BYSTATUS_OPTIONS)
        output['Statuses'] = self.browser.get_texts(self.LCT.SUPPORTRQ_BYSTATUS_OPTIONS)
        self.browser.clicks(self.LCT.SUPPORTRQ_BYSTATUS_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == self.browser.get_text(
                                self.LCT.SUPPORTRQ_BYSTATUS).lower(), stop_on_first=True)
        # Categories
        self.browser.click(self.LCT.SUPPORTRQ_BYCATEGORY)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPPORTRQ_BYCATEGORY_OPTIONS)
        output['Categories'] = self.browser.get_texts(self.LCT.SUPPORTRQ_BYCATEGORY_OPTIONS)
        self.browser.clicks(self.LCT.SUPPORTRQ_BYCATEGORY_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == self.browser.get_text(
                                e).lower(), stop_on_first=True)
        return output

    def _on_support_request_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_until_support_requests_available()
        supports = self.get_support_requests()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(supports):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such support request exist on `{on}`.')

    def view_support_request_on(self, **on):
        _index = self._on_support_request_item(**on)
        self.wait_until_support_requests_available()
        self.browser.hover_to_by_index(self.LCT.SUPPORTRQ_DATA_CONTENT_ROW, _index)

    def navigate_to_new_support_request(self):
        self.browser.click(self.LCT.SUPPORTRQ_NEWREQUEST)
        self.browser.wait_url_contains('new-support-request')

    # New Support Request

    def back_from_new_support_request(self):
        self.browser.click(self.LCT.SUBMR_BACKICON)

    def check_new_support_request_are_available(self, items):
        map_items = {
            'facility': self.browser.wait_visibility_of_element_located(self.LCT.SUBMR_FACILITY),
            'categories': self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CATEGORY),
            'request information': self.browser.wait_visibility_of_element_located(
                'xpath://span[text()="Request Information"]'),
            'message': self.browser.wait_visibility_of_element_located(self.LCT.SUBMR_MESSAGE),
            'email': self.browser.wait_visibility_of_element_located(self.LCT.SUBMR_EMAIL),
            'send request': self.browser.wait_visibility_of_element_located(self.LCT.SUBMR_SUBMIT)
        }
        output = dict()
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        for item in _items:
            if item.lower() not in map_items:
                raise Exception(f'No such item on {item}.')
            output.update({
                item: map_items[item.lower()]
            })

        return output

    def _get_current_billing_question(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_BILLINGISSUE_SELECTIONS)
        for radio, value in zip(self.browser.get_elements(self.LCT.SUBMR_BILLINGISSUE_SELECTIONS + '//input'),
                                self.browser.get_elements(self.LCT.SUBMR_BILLINGISSUE_SELECTIONS)):
            if self.browser.is_checkbox_selected(radio):
                return self.browser.get_text(value)
        return 'Deselected'

    def _get_current_request_category(self):
        element = self.browser.get_elements_by_condition(
            self.LCT.SUBMR_CATEGORY, on_elements=lambda _, e: '-checked' in self.browser.get_attribute_value(
                e, 'class'), stop_on_first=True)[0]
        return self.browser.get_text(element)

    def get_change_study_type_search_by_study_options(self, search_by=None, text_search=None):
        if search_by:
            self.browser.click(self.LCT.SUBMR_CRQST_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SUBMR_CRQST_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        self.browser.input_text(self.LCT.SUBMR_CRQST_TEXTSEARCH, text_search)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_ROOT)
        if self.browser.wait_visibility_of_element_located(self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_NOOPTIONS):
            return self.browser.get_text(self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_NOOPTIONS)  # Get msg `No results match`
        output = list()
        for root in self.browser.get_elements(self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_ROOT):
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_BOTTOMTITLE)
            header = ['Patient Name', 'Study Type'] + self.browser.get_texts(self.browser.get_child_elements(
                root, self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_BOTTOMTITLE))
            content = [self.browser.get_text(
                self.browser.get_child_element(root, self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_PATIENTNAME))]
            content += [self.browser.get_text(
                self.browser.get_child_element(root, self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_STUDYTYPE))]
            content += self.browser.get_texts(self.browser.get_child_elements(
                root, self.LCT.SUBMR_CRQST_SEARCHBYSTUDY_BOTTOMCONTENT))
            output.append({k: v for k, v in zip(header, content)})
        return output

    def _get_change_study_type_selected_studies(self):
        output = list()
        for root in self.browser.get_elements(self.LCT.SUBMR_CRQST_SELECTEDSTUDY_ROOT):
            data = dict()
            data['Patient name'] = self.browser.get_text(
                self.browser.get_child_element(root, self.LCT.SUBMR_CRQST_SELECTEDSTUDY_PATIENTNAME))
            data['Study ID'] = self.browser.get_text(
                self.browser.get_child_element(root, self.LCT.SUBMR_CRQST_SELECTEDSTUDY_STUDYID))
            data['Start date'] = self.browser.get_text(
                self.browser.get_child_element(root, self.LCT.SUBMR_CRQST_SELECTEDSTUDY_STARTDATE))
            data['End date'] = self.browser.get_text(
                self.browser.get_child_element(root, self.LCT.SUBMR_CRQST_SELECTEDSTUDY_ENDDATE))
            data['Current study type'] = self.browser.get_text(
                self.browser.get_child_element(root, self.LCT.SUBMR_CRQST_SELECTEDSTUDY_CURRSTUDYTYPE))
            data['New study type'] = self.browser.get_text(self.browser.get_child_element(
                root, self.LCT.SUBMR_CRQST_SELECTEDSTUDY_NEWSTUDYTYPE)) if self.browser.get_child_element(
                root, self.LCT.SUBMR_CRQST_SELECTEDSTUDY_NEWSTUDYTYPE) else ''
            output.append(data)
        return output

    def get_current_new_support_request_values(self):
        output = {
            'Facility': self.browser.get_text(self.LCT.SUBMR_FACILITY + '/../../..'),
            'Request category': self._get_current_request_category(),
        }
        # Request Information
        if self._get_current_request_category().lower() == 'change study type':
            output['Studies'] = self._get_change_study_type_selected_studies()
        if self._get_current_request_category().lower() in ('abort study', 'report request'):
            output['Study IDs'] = self.browser.get_texts('class:multi-id-search__multi-value__label')
        if self._get_current_request_category().lower() == 'billing questions':
            output['Billing issue'] = self._get_current_billing_question()
        # Message
        output['Message'] = self.browser.get_text(self.LCT.SUBMR_MESSAGE)
        # Email
        output['Notification email'] = self.browser.get_texts(self.LCT.SUBMR_EMAIL + '/../div[@data-tag="true"]')

        return output

    def get_new_support_request_options(self):
        output = dict()
        # Facilities
        self.browser.click(self.LCT.SUBMR_FACILITY + '/../../..')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_FACILITY_OPTIONS)
        output['Facilities'] = self.browser.get_texts(self.LCT.SUBMR_FACILITY_OPTIONS)
        self.browser.clicks(self.LCT.SUBMR_FACILITY_OPTIONS,
                            on_elements=lambda _, e: e == self.get_current_new_support_request_values()['Facility'],
                            stop_on_first=True)
        # Request Categories
        output['Request Categories'] = self.browser.get_texts(self.LCT.SUBMR_CATEGORY)
        # change study type > Search by
        if self._get_current_request_category().lower() == 'change study type':
            self.browser.click(self.LCT.SUBMR_CRQST_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_SEARCHBY_OPTIONS)
            output['Search by'] = self.browser.get_texts(self.LCT.SUBMR_CRQST_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SUBMR_CRQST_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: '-selected' in self.browser.get_attribute_value(e, 'class'),
                                stop_on_first=True)
        # billing questions > Billing issue
        if self._get_current_request_category().lower() == 'billing questions':
            output['Billing issue'] = self.browser.get_texts(self.LCT.SUBMR_BILLINGISSUE_SELECTIONS)

        return output

    def _enter_request_change_study_type(self, search_by=None, text_search=None, new_study_type=None):
        if search_by:
            self.browser.click(self.LCT.SUBMR_CRQST_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SUBMR_CRQST_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        if text_search:
            self.browser.input_text(self.LCT.SUBMR_CRQST_TEXTSEARCH, text_search)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_TEXTSEARCH_OPTIONS)
            if search_by.lower() == 'study id':
                self.browser.clicks(
                    self.LCT.SUBMR_CRQST_TEXTSEARCH_OPTIONS + '//div[@class="studyId"]/div[@class="value"]',
                    on_elements=lambda _, e: self.browser.get_text(e).startswith(text_search), stop_on_first=True)
            if search_by.lower() == 'patient name':
                self.browser.clicks(
                    self.LCT.SUBMR_CRQST_TEXTSEARCH_OPTIONS + '//div[@class="patientName"]',
                    on_elements=lambda _, e: text_search in self.browser.get_text(e), stop_on_first=True)
        if new_study_type:  # Support 1 selection | TBD
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_NEWSTUDYTYPE)
            self.browser.click(self.LCT.SUBMR_CRQST_NEWSTUDYTYPE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CRQST_NEWSTUDYTYPE_OPTIONS)
            self.browser.clicks(self.LCT.SUBMR_CRQST_NEWSTUDYTYPE_OPTIONS,
                                lambda _, e: self.browser.get_text(e).lower() == new_study_type.lower(),
                                stop_on_first=True)

    def _enter_request_abort_study_or_report_request(self, study_ids):
        _studies = [stid.strip() for stid in study_ids.split(',')] if isinstance(study_ids, str) else study_ids
        for study_id in _studies:
            self.browser.input_text(self.LCT.SUBMR_ABORT_SEARCHINPUT, study_id, is_clear=False)
            # self.browser.click('xpath://span[text()="Request Information"]/../..')

    def _enter_request_billing_questions(self, billing_issue):
        if billing_issue:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_BILLINGISSUE_SELECTIONS)
            self.browser.clicks(self.LCT.SUBMR_BILLINGISSUE_SELECTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == billing_issue.lower(),
                                stop_on_first=True)

    def create_new_support_request(self, facility=None, category=None, change_study_type_filter=None,
                                   study_ids=None, billing_issue=None, email=None,
                                   message=None, send_request=True):
        if not self.browser.wait_url_contains('new-support-request'):
            self.navigate_to_new_support_request()
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.SUBMR_FACILITY)
            self.browser.input_text(self.LCT.SUBMR_FACILITY, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.SUBMR_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if category:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBMR_CATEGORY)
            self.browser.clicks(self.LCT.SUBMR_CATEGORY,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == category.lower(),
                                stop_on_first=True)
        # Action after category selected
        if change_study_type_filter and self._get_current_request_category().lower() == 'change study type':  # TBD
            self._enter_request_change_study_type(**change_study_type_filter) if isinstance(change_study_type_filter,
                                                                                            dict) else [
                self._enter_request_change_study_type(**_dict) for _dict in change_study_type_filter]
        if study_ids and self._get_current_request_category().lower() in ('abort study', 'report request'):
            self._enter_request_abort_study_or_report_request(study_ids)
        if billing_issue and self._get_current_request_category().lower() == 'billing questions':
            self._enter_request_billing_questions(billing_issue)
        if message:
            self.browser.input_text(self.LCT.SUBMR_MESSAGE, message)
        if email:
            self.browser.scroll_into_view(self.LCT.SUBMR_SUBMIT)
            _email = [e.strip() for e in email.split(',')] if isinstance(email, str) else email
            for mail in _email:
                self.browser.input_text(self.LCT.SUBMR_EMAIL, mail)
                self.browser.get_element(self.LCT.SUBMR_EMAIL).send_keys(Keys.ENTER)
            self.browser.execute_script('window.scrollBy(0,document.body.scrollHeight)')
        if send_request:
            self.browser.wait_visibility_of_element_located(self.LCT.SUBMR_SUBMIT)
            self.browser.click(self.LCT.SUBMR_SUBMIT, is_scroll=True)

    # Support materials

    def check_support_material_are_available(self, items):  # Items in PDF: TBD
        map_items = {
            'Subtabs': self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPMATERIAL_SUBTABS),
            'Categories': self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPMATERIAL_CATEGORY),
            'Pdf Report': self.browser.wait_visibility_of_element_located(self.LCT.REPORTPDF_FIELD),
        }
        _items = [item.strip() for item in items.split(',')] if isinstance(items, str) else items  # str / list
        output = dict()
        for item in _items:
            if item.lower() not in map_items:
                raise Exception(f'No such item on {item}.')
            output.update({
                item: map_items[item.lower()]
            })

        return output

    def filter_support_materials(self, sub_tab=None, by_category=None):
        if sub_tab:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPMATERIAL_SUBTABS)
            self.browser.clicks(self.LCT.SUPMATERIAL_SUBTABS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == sub_tab.lower(),
                                stop_on_first=True)
        if by_category:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPMATERIAL_CATEGORY)
            self.browser.clicks(self.LCT.SUPMATERIAL_CATEGORY,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_category.lower(),
                                stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.REPORTPDF_FIELD)

    def get_support_materials_current_filter(self):
        output = dict()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPMATERIAL_SUBTABS)
        current_subtab = self.browser.get_elements_by_condition(
            self.LCT.SUPMATERIAL_SUBTABS + '/..', on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(
                e, 'class'), stop_on_first=True)[0]
        # Sub-tab
        output['Subtab'] = self.browser.get_text(current_subtab)
        # Category
        if self.browser.wait_visibility_of_element_located(self.LCT.SUPMATERIAL_CATEGORY):
            current_category = self.browser.get_elements_by_condition(
                self.LCT.SUPMATERIAL_CATEGORY, on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(
                    e, 'class'), stop_on_first=True)[0]
            output['Category'] = self.browser.get_text(current_category)
        return output

    def get_support_materials_filter_options(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPMATERIAL_SUBTABS)
        output = {
            'Subtabs': (self.browser.get_texts(self.LCT.SUPMATERIAL_SUBTABS)),
            'Categories': self.browser.get_texts(
                self.LCT.SUPMATERIAL_CATEGORY) if self.browser.wait_visibility_of_all_elements_located(
                self.LCT.SUPMATERIAL_CATEGORY) else None}
        return output

    # Send Feedback

    def get_send_feedback_current_filter(self):
        output = {
            'Current Facility': self.browser.get_text(self.LCT.CURRENT_FACILITY),
            'Your Facility': self.browser.get_text(self.LCT.FEEDBACK_YOURFACILITY),
            'Your Email': self.browser.get_attribute_value(self.LCT.FEEDBACK_EMAIL, 'value'),
            'Your Message': self.browser.get_text(self.LCT.FEEDBACK_MESSAGE),
        }

        for ele in self.browser.get_elements(self.LCT.FEEDBACK_CATEGORY + '/..'):
            if 'checked' in self.browser.get_attribute_value(ele, 'class'):
                output['Category'] = self.browser.get_text(ele)

        return output

    def get_list_support_request(self, row=None):
        self.wait_until_support_requests_available()
        header = ['Request ID'] + self.browser.get_texts(self.LCT.SUPPORTRQ_DATA_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.SUPPORTRQ_DATA_CONTENT, row=row)

    def get_status_support_requests(self):
        self.wait_until_support_requests_available()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUPPORTRQ_STATUS)
        return self.browser.get_texts(self.LCT.SUPPORTRQ_STATUS)

    def navigate_to_send_feedback(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SEND_FEEDBACK)
        self.browser.click(self.LCT.SEND_FEEDBACK)
        self.browser.wait_visibility_of_element_located(self.LCT.FEEDBACK_SUBMIT)
