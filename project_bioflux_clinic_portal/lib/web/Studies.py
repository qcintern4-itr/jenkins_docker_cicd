#!/usr/bin/env python3
import time

from selenium.webdriver.support.expected_conditions import none_of

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import studies as locators
    from corelib import Utils
    from selenium import webdriver
    from selenium.webdriver import Keys
    import re

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Studies(WebPage):
    """
    Handle Studies, new study pages
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_studies_page(self):
        """
        Navigate to Studies page via url
        :return: None
        """
        self.browser.open_page(f'{self.cfg.params["WEB_BASE_URL"]}/studies')
        self._ok_attention_if_any(timeout=5)

    def get_overview_studies(self):
        """
        Get overview of study tabs including tab name and its badge
        :return: (list/dict) tab names with their badge
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_TABS)
        return self.browser.get_texts(self.LCT.STUDY_TABS)

    def _get_current_study_tab(self):
        """
        Get current study tab (state)
        :return: (str) current study tab
        """
        for element, value in zip(self.browser.get_elements(self.LCT.STUDY_TABS),
                                  self.browser.get_texts(self.LCT.STUDY_TABS_VALUE)):
            if 'true' in self.browser.get_attribute_value(element, 'aria-selected'):
                return value

    def filter_studies(self, study_state=None, search_by=None, text_search=None):
        """
        Filter studies
        :param study_state: (str) study state (tab)
        :param search_by: (str)
        :param text_search: (str)
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_TABS, timeout=10)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_TABS, inverse=True)
        if study_state:
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_TABS) and \
                        self.browser.get_elements(self.LCT.STUDY_TABS)[0].is_displayed():
                    self.browser.clicks(self.LCT.STUDY_TABS,
                                        on_elements=lambda _, e: self.browser.get_text(e).lower().startswith
                                        (study_state.lower()), stop_on_first=True)
                    self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_TABS, inverse=True)
                    break
                elif time.time() - start_time > 1 * 60:
                    break
        if search_by:
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_ICON)
            self.browser.click(self.LCT.SEARCHBY_ICON)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_ICON, inverse=True)
            # Utils.wait_until(func=self.browser.get_attribute_value, args=(self.LCT.SEARCH_INPUT, 'placeholder'),
            #                  on_condition=lambda value: search_by.lower() in value.lower())
        if text_search is not None:
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT)
            self.browser.click(self.LCT.SEARCH_INPUT)  # to handle the case the search_by box not closed
            self.browser.clear_text(self.LCT.SEARCH_INPUT)
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT)
            self.browser.input_text(self.LCT.SEARCH_INPUT, str(text_search))
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT)
        wait_func = {
            'active': self.wait_active_studies_available,
            'completed': self.wait_completed_studies_available,
            'flagged studies': self.wait_flagged_studies_available,
            'deleted': self.wait_deleted_studies_available
        }
        wait_func[self._get_current_study_tab().lower()]()

    def sort_studies(self, asc_or_desc, study_state=None):
        """
        Sort studies by study ID
        :param study_state: (str) study state (tab)
        :param asc_or_desc: (str) sort conditions (valid keys: asc or desc)
        :return: None
        """
        if study_state:
            self.browser.clicks(self.LCT.STUDY_TABS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                    study_state.lower()), stop_on_first=True)
        for _ in range(2):
            element_sort = self.browser.get_element('xpath://th[@class="sortable"]')  # sort element
            if asc_or_desc in self.browser.get_attribute_value(element_sort, 'aria-label'):
                break
            self.browser.click(element_sort)
        wait_func = {
            'active': self.wait_active_studies_available,
            'completed': self.wait_completed_studies_available,
            'flagged studies': self.wait_flagged_studies_available,
            'deleted': self.wait_deleted_studies_available
        }
        wait_func[self._get_current_study_tab().lower()]()

    def get_current_filter(self):
        output = {
            'Study state': self._get_current_study_tab(),
            'Facility': self.browser.get_text(self.LCT.FACILITY_CURRENT),
            'Search by': self.browser.get_attribute_value(self.LCT.SEARCH_INPUT, 'placeholder').replace(
                'Search by', '').strip(),
        }
        return output

    def get_filter_options(self):
        output = dict()
        # Event state (sub tabs)
        output['Event state'] = self.browser.get_texts(self.LCT.STUDY_TABS)
        # Facility
        self.browser.click(self.LCT.FACILITY_CURRENT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_SELECTIONS)
        output['Facility'] = self.browser.get_texts(self.LCT.FACILITY_SELECTIONS)
        self.browser.click(self.LCT.FACILITY_CURRENT)  # handle in case of dropdown is not closed
        # Search by
        self.browser.click(self.LCT.SEARCHBY_ICON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
        output['Search by'] = self.browser.get_texts(self.LCT.SEARCHBY_OPTIONS)
        self.browser.click(self.LCT.SEARCHBY_ICON)  # handle in case of dropdown is not closed
        return output

    def open_new_study(self):
        """
        Open create new study page
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.NEWSTUDY_BUTTON)
        self.browser.click(self.LCT.NEWSTUDY_BUTTON)

    def scroll_to_bottom_of_new_study_page(self):
        self.browser.execute_script(
            'document.getElementsByClassName("custom-body__right-container")[0].scrollTop += 1200')

    def create_new_study_page_1(self, patient_id=None, first_name=None, middle_name=None, last_name=None, dob=None,
                                height=None, weight=None, ethnicity=None, pacemaker=False, icd=False, gender=None,
                                is_next=True):
        """
        Handle filling the Patient information (page 1)
        :param patient_id: (str)
        :param first_name: (str)
        :param middle_name: (str)
        :param last_name: (str)
        :param dob: (str) Date of birth
        :param height: (str) height (ft, in | ft)
        :param weight: (str) weight (lb)
        :param gender: (str)
        :param is_next: (bool)
        :param ethnicity: (str)
        :param icd: (bool)
        :param pacemaker: (bool)
        :return: None
        """
        if patient_id:
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_1_PATIENTID, patient_id)
        if first_name:
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_1_FIRSTNAME, first_name)
        if middle_name:
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_1_MIDDLENAME, middle_name)
        if last_name:
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_1_LASTNAME, last_name)
        if dob:
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_1_DOB, dob)
        if gender:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_1_GENDERS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_1_GENDERS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == gender.lower(),
                                stop_on_first=True)
        self.browser.execute_script('window.scrollTo(0,2500)')
        if height:
            map_measurement = {
                True: ['height (ft, in)', [self.LCT.NEW_STUDY_PAGE_1_HEIGHT_FT, self.LCT.NEW_STUDY_PAGE_1_HEIGHT_IN]],
                False: ['height (ft)', [self.LCT.NEW_STUDY_PAGE_1_HEIGHT_FT]]
            }
            cond = height.endswith('in')
            _height = re.sub('ft|in|,', ' ', height).strip().split()
            [self.browser.input_text(e, text) for e, text in zip(map_measurement[cond][1], _height)]
        if weight:
            map_measurement = {
                True: [self.LCT.NEW_STUDY_PAGE_1_WEIGHT]
            }
            cond = weight.endswith('lb')
            _weight = weight.replace('lb', '').strip()
            self.browser.input_text(map_measurement[cond][0], _weight)
        if ethnicity:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_1_ETHNICITY)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_1_ETHNICITY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_1_ETHNICITY_OPTION)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_1_ETHNICITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == ethnicity.lower(),
                                stop_on_first=True)
        if pacemaker:
            self.browser.toggle_checkbox(self.LCT.NEW_STUDY_PAGE_1_IMPLANDEVICE_PACEMAKER,
                                         self.LCT.NEW_STUDY_PAGE_1_IMPLANDEVICE_PACEMAKER + '/..', True)
        if icd:
            self.browser.toggle_checkbox(self.LCT.NEW_STUDY_PAGE_1_IMPLANDEVICE_ICD,
                                         self.LCT.NEW_STUDY_PAGE_1_IMPLANDEVICE_ICD + '/..', True)
        if is_next:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_1_NEXT)
            # self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_1_NEXT)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(self.LCT.NEW_STUDY_PAGE_1_NEXT, 'class'),
                             on_condition=lambda value: 'disabled' not in value.lower())
            self.browser.js_click(self.LCT.NEW_STUDY_PAGE_1_NEXT)
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Patient contact')

    def _add_secondary_contact(self, name=None, relationship=None, phone_number=None, email=None):
        """
        Handle filling the secondary contact information
        :param name: (str)
        :param relationship: (str)
        :param phone_number: (str)
        :param email: (str)
        :return: None
        """

        if name:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_2ND_NAME)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_2ND_NAME, name)
        if relationship:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_2ND_RELATIONSHIP)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_2ND_RELATIONSHIP, relationship)
        if phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_2ND_PHONE)
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_2ND_PHONE)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_2ND_PHONE, phone_number)
        if email:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_2ND_EMAIL)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_2ND_EMAIL, email)

    def create_new_study_page_2(self, country=None, address=None, city=None, state=None, zip_code=None,
                                primary_phone_number=None, email=None, secondary_phone_number=None,
                                secondary_contact=None, is_next=True, is_previous=False):
        """
        Handle filling the Patient contact (page 2)
        :param country: (str)
        :param address: (str)
        :param city: (str)
        :param state: (str)
        :param zip_code: (str)
        :param primary_phone_number: (str)
        :param email: (str)
        :param secondary_phone_number: (str)
        :param secondary_contact: (list/dict)
        :param is_next: (bool)
        :param is_previous: (bool)
        :return: None
        """
        if country:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_CURRENTCOUNTRY)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_2_COUNTRY_INPUT)
            # self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_COUNTRY_INPUT, country)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_2_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_2_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_2_CURRENTCOUNTRY, country)
            self.browser.wait_text_to_be_present_in_element_value(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_INPUT,
                                                                  'Enter address',
                                                                  inverse=True)
            self.browser.js_click(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_INPUT)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_INPUT, inverse=True)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_INPUT, address)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_INPUT, inverse=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_OPTIONS,
                                                                 inverse=True)
            self.browser.js_clicks(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_OPTIONS,
                                   on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                   stop_on_first=True)
            # Wait until city, state and zip available (city, state and zip will automatically input)
            self.browser.wait_text_to_be_present_in_element_value(self.LCT.NEW_STUDY_PAGE_2_CITY, 'Enter city',
                                                                  inverse=True)
            self.browser.wait_text_to_be_present_in_element_value(self.LCT.NEW_STUDY_PAGE_2_ZIPCODE, 'Enter zip code',
                                                                  inverse=True)

        if city:
            self.browser.wait_text_to_be_present_in_element_value(self.LCT.NEW_STUDY_PAGE_2_CITY, 'Enter city',
                                                                  inverse=True)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_2_CITY_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_2_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            if country in ('United States', 'Canada'):
                self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_STATE, state)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_2_STATE_OPTIONS)
                self.browser.clicks(self.LCT.NEW_STUDY_PAGE_2_STATE_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                    stop_on_first=True)
            else:
                self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_STATE, state)
        if zip_code:
            self.browser.wait_text_to_be_present_in_element_value(self.LCT.NEW_STUDY_PAGE_2_ZIPCODE, 'Enter zip code',
                                                                  inverse=True)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_ZIPCODE, zip_code)
        if primary_phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_PRIMARYPHONE, inverse=True)
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_PRIMARYPHONE)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_PRIMARYPHONE, primary_phone_number)
        if email:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_EMAIL, inverse=True)
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_EMAIL)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_EMAIL, email)
        if secondary_phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_SECONDARYPHONE, inverse=True)
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_SECONDARYPHONE)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_2_SECONDARYPHONE, secondary_phone_number)
        if secondary_contact:
            if self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_ADD2ND, timeout=3):
                self.browser.click(self.LCT.NEW_STUDY_PAGE_2_ADD2ND)
            if isinstance(secondary_contact, dict):
                self._add_secondary_contact(**secondary_contact)
            elif isinstance(secondary_contact, list):
                [self._add_secondary_contact(**contact_dict) for contact_dict in secondary_contact]
        if is_next:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_NEXT)
            # self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_NEXT)
            # self.browser.wait_visibility_of_element_located('xpath://div[@class="centered-content__body"]')
            Utils.wait_until(func=self.browser.get_attribute_value, args=(self.LCT.NEW_STUDY_PAGE_2_NEXT, 'class'),
                             on_condition=lambda value: 'disabled' not in value.lower())
            self.browser.click(self.LCT.NEW_STUDY_PAGE_2_NEXT)
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Study information')
        if is_previous:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_2_PREVIOUS)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_PREVIOUS)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_2_PREVIOUS)
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Patient information')

    def _add_new_physician(self, first_name=None, last_name=None, title=None, country=None, address=None, city=None,
                           state=None, phone_number=None, night_phone=None, email=None, fax_number=None):
        """
        Handle filling the new physician information
        :param first_name: (str)
        :param last_name: (str)
        :param title: (str)
        :param country: (str)
        :param address: (str)
        :param city: (str)
        :param state: (str)
        :param phone_number: (str)
        :param night_phone: (str)
        :param email: (str)
        :param fax_number: (str)
        :return: None
        """
        if first_name:
            self.browser.input_text(self.LCT.NEW_PHY_FIRSTNAME, first_name)
        if last_name:
            self.browser.input_text(self.LCT.NEW_PHY_LASTNAME, last_name)
        if title:
            self.browser.input_text(self.LCT.NEW_PHY_TITLE, title)
        if country:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_PHY_COUNTRY)
            self.browser.js_click(self.LCT.NEW_PHY_COUNTRY)
            self.browser.input_text(self.LCT.NEW_PHY_COUNTRY, country)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_PHY_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.NEW_PHY_COUNTRY_OPTIONS)
        if address:
            self.browser.js_click(self.LCT.NEW_PHY_ADDRESS)
            self.browser.input_text(self.LCT.NEW_PHY_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_PHY_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.NEW_PHY_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower())
        if city:
            self.browser.input_text(self.LCT.NEW_PHY_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_PHY_CITY_OPTIONS)
            self.browser.clicks(self.LCT.NEW_PHY_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            if country in ['United States', 'Canada']:  # select from dropdown
                self.browser.input_text(self.LCT.NEW_PHY_STATE, state)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_PHY_STATE_OPTIONS)
                self.browser.clicks(self.LCT.NEW_PHY_STATE_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                    stop_on_first=True)
            else:  # input
                self.browser.input_text(self.LCT.NEW_PHY_STATE, state)
        if phone_number:
            self.browser.input_text(self.LCT.NEW_PHY_PHONE, phone_number)
        if night_phone:
            self.browser.input_text(self.LCT.NEW_PHY_NIGHTPHONE, night_phone)
        if email:
            self.browser.input_text(self.LCT.NEW_PHY_EMAIL, email)
        if fax_number:
            self.browser.input_text(self.LCT.NEW_PHY_FAX, fax_number)
        self.browser.click(self.LCT.NEW_PHY_CREATE)

    def create_new_study_page_3(self, facility=None, functional_test=False, use_biodirect=False, device_type=None,
                                device_id=None, referring_physician=None, new_physician_info=None,
                                interpreting_physician=None, study_type=None, study_duration=None,
                                patient_return_visit=None, clinician_initials=None, is_next=True, is_previous=False):
        """
        Filling the Study information
        :param facility: (str)
        :param functional_test: (bool)
        :param use_biodirect: (bool)
        :param device_type: (str)
        :param device_id: (str)
        :param referring_physician: (str)
        :param new_physician_info: (list/dict)
        :param interpreting_physician: (str)
        :param study_type: (str)
        :param study_duration: (str)
        :param patient_return_visit: (str)
        :param clinician_initials: (str)
        :param is_next: (bool)
        :param is_previous: (bool)
        :return: None
        """
        self._ok_attention_if_any()
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_INPUT)
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_INTPHYSICIAN_INPUT)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_FACILITY_INPUT, inverse=True)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_FACILITY_INPUT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_3_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_3_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
            self._ok_attention_if_any()
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_3_FACILITY_INPUT, facility)
        if functional_test:
            if self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_FUNCTIONALTEST, timeout=5,
                                                               inverse=True):
                self.browser.toggle_checkbox(self.LCT.NEW_STUDY_PAGE_3_FUNCTIONALTEST,
                                             self.LCT.NEW_STUDY_PAGE_3_FUNCTIONALTEST + '/..//span', functional_test)
        if use_biodirect:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_USEBIODIRECT, inverse=True)
            self.browser.toggle_checkbox(self.LCT.NEW_STUDY_PAGE_3_USEBIODIRECT,
                                         self.LCT.NEW_STUDY_PAGE_3_USEBIODIRECT, value=use_biodirect)
        if device_type:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_DEVICE_TYPES, inverse=True)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_3_DEVICE_TYPES,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device_type.lower(),
                                stop_on_first=True)
        if device_id:
            # self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_DEVICEINPUT)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_DEVICEINPUT + '/../..')
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_3_DEVICE_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_3_DEVICE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == device_id.lower(),
                                stop_on_first=True)
            if self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_POPUP, timeout=5):
                if self.browser.get_element(self.LCT.NEW_STUDY_PAGE_3_POPUP) is not None and self.browser.get_element(
                        self.LCT.NEW_STUDY_PAGE_3_POPUP).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_CONTINUE)
                    self.browser.js_click(self.LCT.NEW_STUDY_PAGE_3_CONTINUE)
        if new_physician_info:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_INPUT, inverse=True)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_INPUT + "/../..")
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_OPTIONS)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_ADDPHYSICIAN)
            if isinstance(new_physician_info, dict):
                self._add_new_physician(**new_physician_info)
            elif isinstance(new_physician_info, list):
                [self._add_new_physician(**phy_info_dict) for phy_info_dict in new_physician_info]
        if referring_physician:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_INPUT, inverse=True)
            self.browser.js_click(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_INPUT)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_INPUT, referring_physician)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == referring_physician.lower(), stop_on_first=True)
        if interpreting_physician:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_INTPHYSICIAN_INPUT)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_3_INTPHYSICIAN_INPUT, interpreting_physician)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_3_INTPHYSICIAN_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_3_INTPHYSICIAN_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == interpreting_physician.lower(), stop_on_first=True)
        if study_type:
            study_type = study_type.replace("–", "-")
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_STUDYTYPE_INPUT)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_STUDYTYPE_INPUT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_3_STUDYTYPE_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_3_STUDYTYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == study_type.lower(),
                                stop_on_first=True)
        if study_duration:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_DURATION)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_DURATION)
            self.browser.clear_text(self.LCT.NEW_STUDY_PAGE_3_DURATION)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_DURATION)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_3_DURATION, study_duration)
        if patient_return_visit:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_PRV)
            self.browser.remove_attribute(self.LCT.NEW_STUDY_PAGE_3_PRV, 'readonly')
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_PRV)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_3_PRV, patient_return_visit)
            self.browser.get_element(self.LCT.NEW_STUDY_PAGE_3_PRV).send_keys(Keys.ENTER)
        if clinician_initials:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_INITIALS)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_3_INITIALS)
            self.browser.clear_text(self.LCT.NEW_STUDY_PAGE_3_INITIALS)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_INITIALS)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_3_INITIALS, clinician_initials)
        if is_next:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_NEXT)
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_3_NEXT)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(self.LCT.NEW_STUDY_PAGE_3_NEXT, 'class'),
                             on_condition=lambda value: 'disabled' not in value.lower())
            self.browser.js_click(self.LCT.NEW_STUDY_PAGE_3_NEXT, is_scroll=True)
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Diagnosis')
        if is_previous:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_PREVIOUS)
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_3_PREVIOUS)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_3_PREVIOUS)
            self.browser.js_click(self.LCT.NEW_STUDY_PAGE_3_PREVIOUS)
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Patient contact')

    def create_new_study_page_4(self, primary_diagnosis_code=None, primary_diagnosis_other=None,
                                primary_diagnosis_code_other_input=None,
                                secondary_diagnosis_code=None, secondary_diagnosis_other=None,
                                secondary_diagnosis_code_other_input=None,
                                patient_medication=None, physician_notes=None, insurance_type=None,
                                insurance_provider=None, pre_authorization=None, symptoms=None,
                                symptoms_times_happen=None, before_heart_monitor=None, is_initiate=True,
                                is_previous=False):
        """
        Filling the Diagnosis information
        :param primary_diagnosis_code: (str)
        :param secondary_diagnosis_other: (str)
        :param secondary_diagnosis_code_other_input: (str)
        :param secondary_diagnosis_code: (str)
        :param primary_diagnosis_other: (str)
        :param primary_diagnosis_code_other_input: (str)
        :param patient_medication: (str)
        :param physician_notes: (str)
        :param insurance_type: (str)
        :param insurance_provider: (str)
        :param pre_authorization: (str)
        :param symptoms: (str or list)
        :param symptoms_times_happen: (str)
        :param before_heart_monitor: (str)
        :param is_initiate: (bool)
        :param is_previous: (bool)
        :return: None
        """
        if primary_diagnosis_code:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO, primary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OPTIONS,
                                                                 inverse=True)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == primary_diagnosis_code.lower())
        if primary_diagnosis_other:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO)
            # self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO, primary_diagnosis_other)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OPTIONS,
                                                                 inverse=True)
            while True:
                element = self.browser.get_elements(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OPTIONS)
                self.browser.hover_to(element[0])
                self.browser.scroll_dropdown_menu()
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OPTIONS,
                                                                     inverse=True)
                if self.browser.get_element(self.LCT.NEW_STUDY_PAGE_4_HIDDEN_PRIMARY):
                    self.browser.click(self.LCT.NEW_STUDY_PAGE_4_HIDDEN_PRIMARY)
                    break
            if primary_diagnosis_other.lower() == 'other':
                self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OTHERINPUT,
                                                                inverse=True)
                self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OTHERINPUT,
                                        primary_diagnosis_code_other_input)
        if secondary_diagnosis_code:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO, secondary_diagnosis_code)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == primary_diagnosis_code.lower())
        if secondary_diagnosis_other:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO)
            # self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO, secondary_diagnosis_other)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OPTIONS,
                                                                 inverse=True)
            while True:
                element = self.browser.get_elements(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OPTIONS)
                self.browser.hover_to(element[0])
                self.browser.scroll_dropdown_menu()
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OPTIONS,
                                                                     inverse=True)
                if self.browser.get_element(self.LCT.NEW_STUDY_PAGE_4_HIDDEN_SECONDARY):
                    self.browser.click(self.LCT.NEW_STUDY_PAGE_4_HIDDEN_SECONDARY)
                    break
            if secondary_diagnosis_other.lower() == 'other':
                self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OTHERINPUT,
                                                                inverse=True)
                self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OTHERINPUT,
                                        secondary_diagnosis_code_other_input)
        if patient_medication:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_PATIENTMEDICATION)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_PATIENTMEDICATION, patient_medication)
        if physician_notes:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_PHYSICIANNOTES)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_PHYSICIANNOTES, physician_notes)
        if insurance_type:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_ISRTYPE)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_4_ISRTYPE)
            # self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_ISRTYPE, insurance_type)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_ISRTYPE_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_4_ISRTYPE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == insurance_type.lower(),
                                stop_on_first=True)
        if insurance_provider:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_ISRPROVIDER)
            self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_ISRPROVIDER, insurance_provider)
        if pre_authorization:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_PREAUTHEN)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_4_PREAUTHEN,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == pre_authorization.lower(),
                                stop_on_first=True)
        if symptoms:
            _symptoms = [s.strip() for s in symptoms.split(',')] if isinstance(symptoms, str) else symptoms  # str|list
            self.browser.click(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMS)
            for _sys in _symptoms:
                # self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMS_INPUT, _sys, is_clear=False)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMS_OPTIONS)
                self.browser.clicks(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMS_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == _sys.lower())
        if symptoms_times_happen:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMSHAPPEN)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMSHAPPEN)
            # self.browser.input_text(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMSHAPPEN, symptoms_times_happen)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMSHAPPEN_OPTIONS)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_4_SYMPTOMSHAPPEN_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == symptoms_times_happen.lower(), stop_on_first=True)
        if before_heart_monitor:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.NEW_STUDY_PAGE_4_BEFOREHEARTMONITOR)
            self.browser.clicks(self.LCT.NEW_STUDY_PAGE_4_BEFOREHEARTMONITOR,
                                on_elements=lambda _, e: self.browser.get_text(
                                    e).lower() == before_heart_monitor.lower(), stop_on_first=True)
        if is_initiate:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_4_NEXT)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_NEXT)
            self.browser.js_click(self.LCT.NEW_STUDY_PAGE_4_NEXT)
            self.wait_active_studies_available()
        if is_previous:
            self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_4_PREVIOUS)
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_PREVIOUS)
            self.browser.click(self.LCT.NEW_STUDY_PAGE_4_PREVIOUS)
            self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Study information')

    def create_new_study_page_5(self, is_done=True):
        """
        Verification the ECG signal
        :param is_done: (bool)
        :return: None
        """
        self.scroll_to_bottom_of_new_study_page()
        if is_done:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_5_DONE)
            self.browser.js_click(self.LCT.NEW_STUDY_PAGE_5_DONE)  # maybe invisibility so perform JS click

    def create_new_study(self, patient_id=None, first_name=None, middle_name=None, last_name=None, dob=None,
                         height=None, weight=None, ethnicity=None, pacemaker=False, icd=False, gender=None,
                         country=None, address=None, city=None, state=None, zip_code=None, primary_phone_number=None,
                         email=None, secondary_phone_number=None, secondary_contact_info=None, facility=None,
                         functional_test=False, use_biodirect=False, device_type=None, device_id=None,
                         referring_physician=None, new_physician_info=None, interpreting_physician=None,
                         study_type=None, study_duration=None,
                         patient_return_visit=None, clinician_initials=None, primary_diagnosis_code=None,
                         secondary_diagnosis_code=None, patient_medication=None, physician_notes=None,
                         insurance_type=None, insurance_provider=None, pre_authorization=None, symptoms=None,
                         symptoms_times_happen=None, before_heart_monitor=None, is_done=False):
        self.create_new_study_page_1(patient_id=patient_id, first_name=first_name, middle_name=middle_name,
                                     last_name=last_name, dob=dob, height=height, weight=weight, ethnicity=ethnicity,
                                     pacemaker=pacemaker, icd=icd, gender=gender)
        self.create_new_study_page_2(country=country, address=address, city=city, state=state, zip_code=zip_code,
                                     primary_phone_number=primary_phone_number, email=email,
                                     secondary_phone_number=secondary_phone_number,
                                     secondary_contact=secondary_contact_info)
        self.create_new_study_page_3(facility=facility, functional_test=functional_test, use_biodirect=use_biodirect,
                                     device_type=device_type, device_id=device_id,
                                     referring_physician=referring_physician, new_physician_info=new_physician_info,
                                     interpreting_physician=interpreting_physician, study_type=study_type,
                                     study_duration=study_duration, patient_return_visit=patient_return_visit,
                                     clinician_initials=clinician_initials)
        self.create_new_study_page_4(primary_diagnosis_code=primary_diagnosis_code,
                                     secondary_diagnosis_code=secondary_diagnosis_code,
                                     patient_medication=patient_medication, physician_notes=physician_notes,
                                     insurance_type=insurance_type, insurance_provider=insurance_provider,
                                     pre_authorization=pre_authorization, symptoms=symptoms,
                                     symptoms_times_happen=symptoms_times_happen,
                                     before_heart_monitor=before_heart_monitor)
        self.create_new_study_page_5(is_done=is_done)

    def get_current_new_study_page(self):
        time.sleep(5)
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_NAME)
        return self.browser.get_text(self.LCT.NEW_STUDY_PAGE_NAME)

    def get_new_study_values_page_1(self):
        self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Patient information')
        output = {
            'Patient ID': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_PATIENTID, 'value'),
            'First name': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_FIRSTNAME, 'value'),
            'Middle name': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_MIDDLENAME, 'value'),
            'Last name': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_LASTNAME, 'value'),
            'Date of birth': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_DOB, 'value'),
            'Gender': self.browser.get_text(self.browser.get_elements_by_condition(
                self.LCT.NEW_STUDY_PAGE_1_GENDERS,
                on_elements=lambda _, e: '-checked' in self.browser.get_attribute_value(e, 'class'),
                stop_on_first=True)[0]),
            'Height (ft)': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_HEIGHT_FT, 'value'),
            'Height (in)': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_HEIGHT_IN, 'value'),
            'Weight': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_1_WEIGHT, 'value'),
            'Ethnicity': self.browser.get_text(self.LCT.NEW_STUDY_PAGE_1_ETHNICITY),
            'Pacemaker': True if self.browser.get_element(
                self.LCT.NEW_STUDY_PAGE_1_IMPLANDEVICE_PACEMAKER).is_selected() else False,
            'ICD': True if self.browser.get_element(
                self.LCT.NEW_STUDY_PAGE_1_IMPLANDEVICE_ICD).is_selected() else False,
            'Next button': 'Active' if '--disabled' not in self.browser.get_attribute_value(
                self.LCT.NEW_STUDY_PAGE_1_NEXT, 'class') else 'Disabled'
        }
        return output

    def _wait_until_address_available(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_CITY)
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_INPUT)
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_CURRENTCOUNTRY)
        self.browser.wait_visibility_of_element_located(
            self.LCT.NEW_STUDY_PAGE_2_STATE) if self.browser.get_text(
            self.LCT.NEW_STUDY_PAGE_2_CURRENTCOUNTRY) not in ('United States', 'Canada') else \
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_CURRENTSTATE)

    def _current_address(self):
        self._wait_until_address_available()
        output = [
            self.browser.get_text(self.LCT.NEW_STUDY_PAGE_2_CURRENTCOUNTRY),
            self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_ADDRESS_INPUT, 'value'),
            self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_CITY, 'value'),
            self.browser.get_text(self.LCT.NEW_STUDY_PAGE_2_STATE) if self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_2_CURRENTCOUNTRY) not in ('United States',
                                                                  'Canada') else self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_2_CURRENTSTATE)
        ]
        return output

    def get_new_study_values_page_2(self):
        self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Patient contact')
        output = {
            'Country': self._current_address()[0],
            'Address': self._current_address()[1],
            'City': self._current_address()[2],
            'State': self._current_address()[3],
            'Zip code': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_ZIPCODE, 'value'),
            'Primary phone number': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_PRIMARYPHONE, 'value'),
            'Email': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_EMAIL, 'value'),
            'Secondary phone number': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_SECONDARYPHONE,
                                                                       'value'),
        }
        # SECONDARY CONTACT
        if self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_2_ADD2ND, timeout=3):
            self.browser.click(self.LCT.NEW_STUDY_PAGE_2_ADD2ND)
        output['Secondary contact name'] = self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_2ND_NAME, 'value')
        output['Secondary contact relationship'] = self.browser.get_attribute_value(
            self.LCT.NEW_STUDY_PAGE_2_2ND_RELATIONSHIP, 'value')
        output['Secondary contact phone number'] = self.browser.get_attribute_value(
            self.LCT.NEW_STUDY_PAGE_2_2ND_PHONE, 'value')
        output['Secondary contact email'] = self.browser.get_attribute_value(
            self.LCT.NEW_STUDY_PAGE_2_2ND_EMAIL, 'value')
        output['Next button'] = 'Active' if '--disabled' not in self.browser.get_attribute_value(
            self.LCT.NEW_STUDY_PAGE_2_NEXT, 'class') else 'Disabled'
        return output

    def get_new_study_values_page_3(self):
        self.browser.scroll_into_view(self.LCT.NEW_STUDY_PAGE_3_FACILITY_INPUT)
        self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Study information')
        output = {
            'Facility': self.browser.get_text(self.LCT.NEW_STUDY_PAGE_3_FACILITY_INPUT),
            'Functional Test': self.browser.is_checkbox_selected(
                self.LCT.NEW_STUDY_PAGE_3_FUNCTIONALTEST) if self.browser.wait_visibility_of_element_located(
                self.LCT.NEW_STUDY_PAGE_3_FUNCTIONALTEST) else None,
            'Use Biodirect': 'True' if 'true' in self.browser.get_attribute_value(
                self.LCT.NEW_STUDY_PAGE_3_USEBIODIRECT, 'aria-checked') else 'False',
            'Device ID':
                self.browser.get_attribute_value(
                    self.LCT.NEW_STUDY_PAGE_3_DEVICEINPUT, 'value') if self.browser.wait_visibility_of_element_located(
                    self.LCT.NEW_STUDY_PAGE_3_DEVICEINPUT) else None,
            'Referring physician': self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_3_REFPHYSICIAN_INPUT + '/../../..'),
            'Interpreting physician': self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_3_INTPHYSICIAN_INPUT + '/../../..'),
            'Study type': self.browser.get_text(self.LCT.NEW_STUDY_PAGE_3_STUDYTYPE_INPUT),
            'Study duration': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_3_DURATION, 'value'),
            'Patient return visit': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_3_PRV, 'value'),
            'Clinician Initials': self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_3_INITIALS, 'value'),
            'Next button': 'Active' if self.browser.get_element(
                self.LCT.NEW_STUDY_PAGE_3_NEXT).is_enabled() else 'Disabled'
        }
        return output

    def get_new_study_values_page_4(self):
        self.browser.wait_text_to_be_present_in_element(self.LCT.NEW_STUDY_PAGE_NAME, 'Diagnosis')
        output = dict()
        output['Primary diagnosis code'] = self.browser.get_text(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO)
        # Other primary diagnosis code
        if output['Primary diagnosis code'].lower() == 'other':
            output['Other primary diagnosis code'] = self.browser.get_attribute_value(
                self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OTHERINPUT, 'value')
        # Secondary diagnosis code(optional)
        output['Secondary diagnosis code'] = self.browser.get_text(
            self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO) if self.browser.wait_visibility_of_element_located(
            self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO) else None

        # Other secondary diagnosis code
        if output['Secondary diagnosis code'].lower() == 'other':
            output['Other secondary diagnosis code'] = self.browser.get_attribute_value(
                self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OTHERINPUT, 'value')

        output['Patient medication'] = self.browser.get_text(self.LCT.NEW_STUDY_PAGE_4_PATIENTMEDICATION)
        output['Physician amendments notes'] = self.browser.get_text(self.LCT.NEW_STUDY_PAGE_4_PHYSICIANNOTES)

        # Insurance type
        output['Insurance type'] = self.browser.get_text(
            self.LCT.NEW_STUDY_PAGE_4_CURRENTISRTYPE + '/../../..') if self.browser.wait_visibility_of_element_located(
            self.LCT.NEW_STUDY_PAGE_4_CURRENTISRTYPE + '/../../..') else None
        output['Provider'] = self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_4_ISRPROVIDER, 'value')
        # Pre-authorization required
        for option in self.browser.get_elements(self.LCT.NEW_STUDY_PAGE_4_PREAUTHEN):
            if '-checked' in self.browser.get_attribute_value(option, 'class'):
                output['Pre-authorization required'] = self.browser.get_text(option)

        # Symptoms the patient experienced
        output['Symptoms the patient experienced'] = self.browser.get_texts(
            self.LCT.NEW_STUDY_PAGE_4_CURRENTSYMPTOMS) if self.browser.wait_visibility_of_all_elements_located(
            self.LCT.NEW_STUDY_PAGE_4_CURRENTSYMPTOMS) else None
        if output['Symptoms the patient experienced'] is not None:
            output['How many times did the symptoms happen?'] = self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_4_CURRENTSYMPTOMSHAPPEN + '/../../..') if self.browser.wait_visibility_of_element_located(
                self.LCT.NEW_STUDY_PAGE_4_CURRENTSYMPTOMSHAPPEN + '/../../..') else None

        # Had a heart monitor before?
        for option in self.browser.get_elements(self.LCT.NEW_STUDY_PAGE_4_BEFOREHEARTMONITOR):
            if '-checked' in self.browser.get_attribute_value(option, 'class'):
                output['Had a heart monitor before?'] = self.browser.get_text(option)
        output['Initiate button'] = 'Active' if 'disabled' not in self.browser.get_attribute_value(
            self.LCT.NEW_STUDY_PAGE_4_NEXT, 'class') else 'Disabled'
        return output

    def get_new_study_values_page_5(self):  # TBD
        return self.browser.get_text(self.LCT.NEW_STUDY_LEFTCONTAINER)

    def back_from_new_study(self):
        """
        Back from new study page
        :return: None
        """
        self.browser.click(self.LCT.NEW_STUDY_BACK_ICON)
        if self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_BACK_YES):
            self.browser.click(self.LCT.NEW_STUDY_BACK_YES)

    # Active

    def wait_active_studies_available(self):
        """
        Wait until all active studies available
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_STUDY_1ST_CONTENT, inverse=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_STUDY_2ND_CONTENT)

    def get_active_studies(self):
        """
        Get active studies
        :return: (list) list of dicts, each dict is an active study on active studies view
        """
        self.wait_active_studies_available()
        output = []
        # while True:
        #     if len(self.browser.get_elements(self.LCT.ACTIVE_STUDY_DATA_ROOT)) == 10:
        #         self.browser.scroll_into_view(self.LCT.ACTIVE_STUDY_DATA_ROOT)
        #     else:
        #         return self.browser.get_elements(self.LCT.ACTIVE_STUDY_DATA_ROOT)
        # print("check element", len(root_elements))
        for root_element in self.browser.get_elements(self.LCT.ACTIVE_STUDY_DATA_ROOT):
            # Get header
            header_elements = self.browser.get_child_elements(root_element, self.LCT.ACTIVE_STUDY_1ST_HEADER)
            header_elements += self.browser.get_child_elements(root_element, self.LCT.ACTIVE_STUDY_2ND_HEADER)
            header = [text.replace(':', '') for text in self.browser.get_texts(header_elements)] + ['Progress']
            # Get content
            content_elements = self.browser.get_child_elements(root_element, self.LCT.ACTIVE_STUDY_1ST_CONTENT)
            content_elements += self.browser.get_child_elements(root_element, self.LCT.ACTIVE_STUDY_2ND_CONTENT)
            content = self.browser.get_texts(content_elements)
            if 'Biodirect' in header:
                content.append(self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_BIODIRECT)
                ).replace('\n', ' '))
            content.append(
                self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_PROGRESS)
                ).replace('\n', ' ')
            )
            # Format a study dict and append to output
            output.append({key: value for key, value in zip(header, content)})
        self.logger.info(output)
        return output

    def wait_active_study_ecg_view_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_STUDY_STRIPIMAGE) and \
                    self.browser.get_elements(self.LCT.ACTIVE_STUDY_STRIPIMAGE)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_STUDY_STRIPIMAGE, inverse=True)
                break
            elif time.time() - start_time > 2 * 60:
                break

    def check_active_study_items_available(self):
        start_time = time.time()
        output = list()
        _output = dict()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_STUDY_COPY) and \
                    self.browser.get_elements(self.LCT.ACTIVE_STUDY_COPY)[0].is_displayed():
                for root_element in self.browser.get_elements(self.LCT.ACTIVE_STUDY_DATA_ROOT):
                    _output.update({
                        'Copy button': self.browser.wait_visibility_of(
                            self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_COPY)),
                        'Get ECG button': False if self.browser.get_child_element(root_element,
                                                                                  self.LCT.ACTIVE_STUDY_GETECG).get_attribute(
                            "disabled") else True,
                        'View study button': self.browser.wait_visibility_of(
                            self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_VIEWSTUDY)),
                        'Stop button': False if self.browser.get_child_element(root_element,
                                                                               self.LCT.ACTIVE_STUDY_STOP).get_attribute(
                            "disabled") else True,
                        'Progress bar': self.browser.wait_visibility_of(
                            self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_PROGRESS)),
                        'Strip image': self.browser.wait_visibility_of(self.browser.get_child_element(
                            root_element, self.LCT.ACTIVE_STUDY_STRIPIMAGE)) if self.browser.get_child_element(
                            root_element, self.LCT.ACTIVE_STUDY_STRIPIMAGE) else 'There is no strip to display'
                    })
                    output.append(_output)
                return output
            elif time.time() - start_time > 1 * 60:
                break

    def check_active_button_items_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_STUDY_STRIPIMAGE) and \
                    self.browser.get_elements(self.LCT.ACTIVE_STUDY_STRIPIMAGE)[0].is_displayed():
                output = list()
                _output = dict()
                for root_element in self.browser.get_elements(self.LCT.ACTIVE_STUDY_DATA_ROOT):
                    _output.update({
                        'Copy button': self.browser.wait_visibility_of(
                            self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_COPY)),
                        'Get ECG button': False if self.browser.get_child_element(root_element,
                                                                                  self.LCT.ACTIVE_STUDY_GETECG).get_attribute(
                            "disabled") else True,
                        'View study button': self.browser.wait_visibility_of(
                            self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_VIEWSTUDY)),
                        'Stop button': False if self.browser.get_child_element(root_element,
                                                                               self.LCT.ACTIVE_STUDY_STOP).get_attribute(
                            "disabled") else True,
                        'Progress bar': self.browser.wait_visibility_of(
                            self.browser.get_child_element(root_element, self.LCT.ACTIVE_STUDY_PROGRESS)),
                        'Strip image': self.browser.wait_visibility_of(self.browser.get_child_element(
                            root_element, self.LCT.ACTIVE_STUDY_STRIPIMAGE)) if self.browser.get_child_element(
                            root_element, self.LCT.ACTIVE_STUDY_STRIPIMAGE) else 'There is no strip to display'
                    })
                    output.append(_output)
                return output
            elif time.time() - start_time > 1 * 60:
                break

    def _on_active_studies_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_active_studies_available()
        active_studies = self.get_active_studies()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}  # reformat `on` items
        for i, row in enumerate(active_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}  # reformat `studies` items
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such active studies exist under `{_on}`.')

    def copy_active_studies_on(self, active_studies_info=None, **on):
        """
        Copy the active studies
        :param active_studies_info:
        :param on:
        :return: None
        """
        self.wait_active_studies_available()
        _index = self._on_active_studies_item(**on)
        self.browser.clicks(self.LCT.ACTIVE_STUDY_COPY, on_elements=lambda i, _: i == _index, is_scroll=True,
                            stop_on_first=True)
        if active_studies_info:
            if isinstance(active_studies_info, dict):
                self.create_new_study(**active_studies_info)
            else:
                [self.create_new_study(**studies_info) for studies_info in active_studies_info]
        self.wait_active_studies_available()

    def get_ecg_active_studies_on(self, **on):
        self.wait_active_studies_available()
        _index = self._on_active_studies_item(**on)
        self.browser.clicks(self.LCT.ACTIVE_STUDY_GETECG, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def view_active_study_object_on(self, _object, **on):
        """
        Click to view object content in an active study
        :param _object: (str) device/study/patient
        :param on: (dict) supporting keys: row, Device, Study, Patient
        :return:
        """
        map_index = {
            'device': 0,
            'study': 1,
            'patient': 2
        }
        study_index = self._on_active_studies_item(**on)
        self.browser.clicks(self.LCT.ACTIVE_STUDY_1ST_CONTENT,
                            on_elements=lambda index, _: index == study_index * 4 + map_index[_object.lower()],
                            stop_on_first=True)

    def view_active_study_details_on(self, **on):
        self.wait_active_studies_available()
        _index = self._on_active_studies_item(**on)
        self.browser.clicks(self.LCT.ACTIVE_STUDY_VIEWSTUDY, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def stop_active_studies(self, is_stop=True, is_cancel=False, **on):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ACTIVE_STUDY_STOP) and \
                    self.browser.get_elements(self.LCT.ACTIVE_STUDY_STOP)[0].is_displayed():
                break
            elif time.time() - start_time > 1 * 60:
                break
        _index = self._on_active_studies_item(**on)
        stop_elem = self.browser.get_elements_by_condition(self.LCT.ACTIVE_STUDY_STOP,
                                                           on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
        self.browser.click(stop_elem)
        self.browser.wait_visibility_of_all_elements_located('class:custom-confirm-modal')
        if is_stop:
            self.browser.click(self.LCT.ACTIVE_STUDY_STOP_CONFIRM)
            self.browser.wait_invisibility_of_element(stop_elem, timeout=90)
            self.browser.wait_visibility_of_element_located(self.LCT.ACTIVE_STATUS, timeout=60)
        if is_cancel:
            self.browser.click(self.LCT.ACTIVE_STUDY_STOP_CANCEL)
            self.browser.wait_invisibility_of_element_located(self.LCT.ACTIVE_STUDY_STOP_CONFIRM + '/..')

    # Completed

    def wait_completed_studies_available(self):
        """
        Wait until all completed studies available
        :return: None
        """
        # start_time = time.time()
        # while True:
        #     if self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_STUDY_CONTENT) and self.browser.get_elements(self.LCT.COMPLETED_STUDY_CONTENT)[0].is_displayed():
        #         self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_STUDY_CONTENT, inverse=True)
        #         break
        #     elif time.time() - start_time > 2 * 60:
        #         break
        time.sleep(5)
        self.browser.wait_invisibility_of_element_located('selector:div.skeleton-gradient-background')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_STUDY_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_STUDY_CONTENT)

    def get_completed_studies(self, row=None):
        """
        Get current completed studies
        :return: (list) list of dicts, each dict is a completed study on completed studies view
        """
        self.wait_completed_studies_available()
        header = ['Study ID'] + self.browser.get_texts(self.LCT.COMPLETED_STUDY_HEADER)
        data = self.browser.get_tabular_data(header, self.LCT.COMPLETED_STUDY_CONTENT, row=row)
        self.logger.info(data)
        if row:
            if data:
                data['Biodirect study'] = True if 'Biodirect study' in data['Study ID'] else False
            return {k: str(v).replace('Biodirect study', '').replace('\n', ' | ').strip() for k, v in data.items()}
        for item_dict in data:
            # Handle `Biodirect study` True | False
            item_dict['Biodirect study'] = True if 'Biodirect study' in item_dict['Study ID'] else False
        # reformat and return output
        return [{k: str(v).replace(
            'Biodirect study', '').replace('\n', ' | ').strip() for k, v in item.items()} for item in data]

    def _on_completed_studies_item(self, **on):
        self.wait_completed_studies_available()
        if 'row' in on:
            return int(on['row']) - 1
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        completed_studies = self.get_completed_studies()
        for i, row in enumerate(completed_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such completed studies exist under `{_on}`.')

    def delete_completed_study_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        _row_elem = self.browser.get_elements_by_condition(
            self.LCT.COMPLETED_STUDY_ROW, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
        self.browser.hover_to(_row_elem)
        self.browser.clicks(self.LCT.COMPLETED_STUDY_DELETEICONS, on_elements=lambda index, _: index == _index,
                            stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_STUDY_BUTTON)
        self.browser.click(self.LCT.COMPLETED_STUDY_BUTTON)
        if self.browser.wait_visibility_of_element_located(
                self.LCT.COMPLETED_STUDY_DELETE_CONFIRM) and self.browser.get_element(
            self.LCT.COMPLETED_STUDY_DELETE_CONFIRM).is_displayed():  # confirm delete
            self.browser.click(self.LCT.COMPLETED_STUDY_DELETE_CONFIRM)

    def copy_completed_study_on(self, completed_study_info, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        for i, row in enumerate(self.browser.get_elements(self.LCT.COMPLETED_STUDY_ROW)):
            if i == _index:
                self.browser.hover_to(row)
                self.browser.clicks(self.LCT.COMPLETED_STUDY_COPYICONS, on_elements=lambda index, _: index == _index,
                                    stop_on_first=True)
        if completed_study_info:
            if isinstance(completed_study_info, dict):
                self.create_new_study(**completed_study_info)
            else:
                [self.create_new_study(**studies_info) for studies_info in completed_study_info]

    def manage_completed_study_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        self.logger.info(f"Managing completed study on index: {_index}")
        row_index = self.browser.get_elements_by_condition(self.LCT.COMPLETED_STUDY_ROW,
                                                           on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
        self.browser.hover_to(row_index)
        self.browser.clicks(self.LCT.COMPLETED_STUDY_MANAGEICONS, on_elements=lambda index, _: index == _index,
                            stop_on_first=True)

    def toggle_completed_studies(self, state, **on):
        self.browser.wait_presence_of_all_elements_located(self.LCT.COMPLETED_STUDY_CHECKBOXES)
        elements = self.browser.get_elements(self.LCT.COMPLETED_STUDY_CHECKBOXES)
        if 'all' in on['row']:
            self.browser.click(self.LCT.COMPLETED_STUDY_CHECKBOX_ALL)
        else:
            _index = self._on_completed_studies_item(**on)
            self.browser.toggle_checkbox(elements[_index], elements[_index], state)
            self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_STUDY_CHECKBOXES, timeout=3)

    # def delete_multiple_completed_studies(self, **on):
    #     self.browser.wait_visibility_of_all_elements_located(self.LCT.COMPLETED_STUDY_CHECKBOXES)
    #     self.toggle_completed_studies(**on)
    #     self.browser.click(self.LCT.COMPLETED_STUDY_DELETE)
    #     if self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_STUDY_DELETE_CONFIRM):  # confirm delete
    #         self.browser.click(self.LCT.COMPLETED_STUDY_DELETE_CONFIRM)

    def view_completed_study_information_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        self.browser.clicks(self.LCT.COMPLETED_STUDY_STUDYID, on_elements=lambda i, _: i == _index, stop_on_first=True)

    def view_completed_patient_information_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        self.browser.clicks(self.LCT.COMPLETED_STUDY_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_completed_device_information_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        self.browser.clicks(self.LCT.COMPLETED_STUDY_DEVICEID, on_elements=lambda i, _: i == _index, stop_on_first=True)

    # Flagged

    def wait_flagged_studies_available(self):
        """
        Wait until all flagged studies available
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FLAGGED_STUDY_1ST_CONTENT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FLAGGED_STUDY_2ND_CONTENT)

    def get_flagged_studies(self):
        """
        Get current flagged studies
        :return: (list) list of dicts, each dict is a flagged study on flagged studies view
        """
        self.wait_flagged_studies_available()
        output = []
        for root_element in self.browser.get_elements(self.LCT.FLAGGED_STUDY_DATA_ROOT):
            header_elements = self.browser.get_child_elements(root_element, self.LCT.FLAGGED_STUDY_HEADER)
            header = self.browser.get_texts(header_elements) + ['Resolved', 'Progress']
            content_elements = self.browser.get_child_elements(root_element, self.LCT.FLAGGED_STUDY_1ST_CONTENT)
            content_elements += self.browser.get_child_elements(root_element, self.LCT.FLAGGED_STUDY_2ND_CONTENT)
            content = self.browser.get_texts(content_elements)
            content += [self.browser.is_checkbox_selected(self.LCT.FLAGGED_STUDY_RESOLVED),
                        self.browser.get_text(self.LCT.FLAGGED_STUDY_PROGRESS).replace('\n', ' ')]
            output.append({key.replace(':', ''): value for key, value in zip(header, content)})
        self.logger.info(output)
        return output

    def _on_flagged_studies_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_flagged_studies_available()
        flagged_studies = self.get_flagged_studies()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(flagged_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such flagged studies exist under `{_on}`.')

    def stop_flagged_study_on(self, **on):
        self.wait_flagged_studies_available()
        _index = self._on_flagged_studies_item(**on)
        self.browser.clicks(self.LCT.FLAGGED_STUDY_STOP, on_elements=lambda i, _: i == _index, stop_on_first=True,
                            is_scroll=True)

    def resolve_flagged_study_on(self, **on):
        self.wait_flagged_studies_available()
        _index = self._on_flagged_studies_item(**on)
        for i, e in enumerate(self.browser.get_elements(self.LCT.FLAGGED_STUDY_RESOLVED)):
            if i == _index:
                self.browser.toggle_checkbox('name:isResolved', e, True)
                break

    def get_ecg_flagged_study_on(self, **on):
        self.wait_flagged_studies_available()
        _index = self._on_flagged_studies_item(**on)
        self.browser.clicks(self.LCT.FLAGGED_STUDY_GETECG, on_elements=lambda i, _: i == _index, stop_on_first=True,
                            is_scroll=True)

    def view_flagged_study_object_on(self, _object, **on):
        """
        Click to view object content in a flagged study
        :param _object: (str) device/study/patient
        :param on: (dict) supporting keys: row, Device, Study, Patient
        :return:
        """
        map_index = {
            'device': 0,
            'study': 1,
            'patient': 2
        }
        study_index = self._on_flagged_studies_item(**on)
        self.browser.clicks(self.LCT.FLAGGED_STUDY_1ST_CONTENT,
                            on_elements=lambda index, _: index == study_index * 4 + map_index[_object.lower()],
                            stop_on_first=True)

    def wait_deleted_studies_available(self):
        """
        Wait until all deleted studies available
        :return: None
        """
        time.sleep(5)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DELETED_STUDY_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DELETED_DATA_SAMPLE)

    def get_deleted_studies(self, row=None):
        """
        Get current deleted studies
        :return: (list) list of dicts, each dict is a deleted study on deleted studies view
        """
        self.wait_deleted_studies_available()
        headers = ['Study ID'] + self.browser.get_texts(self.LCT.DELETED_STUDY_HEADER)
        data = self.browser.get_tabular_data(headers, self.LCT.DELETED_STUDY_CONTENT, row=row)
        self.logger.info(data)
        return data

    def _on_deleted_studies_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_deleted_studies_available()
        deleted_studies = self.get_deleted_studies()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(deleted_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such deleted studies exist under `{_on}`.')

    def restore_deleted_studies_on(self, **on):
        self.wait_deleted_studies_available()
        _index = self._on_deleted_studies_item(**on)
        for i, e in enumerate(self.browser.get_elements(self.LCT.DELETED_STUDY_CONTENT_ROW)):
            if i == _index:
                self.browser.hover_to(e)
                self.browser.js_clicks(self.LCT.DELETED_STUDY_RESTOREICONS + "/..",
                                       on_elements=lambda index, _: index == _index,
                                       stop_on_first=True)
        if self.browser.wait_visibility_of_element_located(
                self.LCT.MESSAGE_NOTICE_CONTENT) and self.browser.get_element(
            self.LCT.MESSAGE_NOTICE_CONTENT).is_displayed():
            return True

    def view_deleted_studies_patient_information_on(self, **on):
        self.wait_deleted_studies_available()
        _index = self._on_deleted_studies_item(**on)
        self.browser.clicks(self.LCT.DELETED_STUDY_CONTENT_PATIENTNAME, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def view_deleted_studies_device_information_on(self, **on):
        self.wait_deleted_studies_available()
        _index = self._on_deleted_studies_item(**on)
        self.browser.clicks(self.LCT.DELETED_STUDY_CONTENT_DEVICEIID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_studies_current_filter_values(self):
        output = {
            'Facility': self.browser.get_text(self.LCT.FACILITY_CURRENT),
            'Study State': self._get_current_study_tab(),
            'Search By': self.browser.get_attribute_value(self.LCT.SEARCH_INPUT, 'placeholder').replace(
                'Search by ', ''),
            'Text Search': self.browser.get_attribute_value(self.LCT.SEARCH_INPUT, 'value')
        }
        return output

    def clear_studies_text_search(self):
        if self.browser.wait_visibility_of_element_located(self.LCT.CLEAR_BUTTON):
            self.browser.js_click(self.LCT.CLEAR_BUTTON)

    def custom_studies_size_per_page(self, by_size):
        # self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.scroll_into_view(self.LCT.SIZEPERPAGE_CURRENT)
        self.browser.wait_visibility_of_element_located(self.LCT.SIZEPERPAGE_CURRENT, inverse=True)
        if by_size:  # Maybe invisibility so perform js click
            self.browser.wait_attribute_value_to_be(self.LCT.SIZEPERPAGE_CURRENT, 'class', 'active')
            self.browser.click(self.LCT.SIZEPERPAGE_CURRENT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.SIZEPERPAGE_OPTIONS)
            self.browser.js_clicks(self.LCT.SIZEPERPAGE_OPTIONS,
                                   on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                       by_size.lower()),
                                   stop_on_first=False)

    def get_studies_size_per_page_options(self):
        output = list()
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_visibility_of_element_located(self.LCT.SIZEPERPAGE_CURRENT)
        self.browser.click(self.LCT.SIZEPERPAGE_CURRENT)
        for _, e in enumerate(self.browser.get_elements(self.LCT.SIZEPERPAGE_OPTIONS)):
            output.append(self.browser.execute_script('return arguments[0].innerText;', e))
        self.browser.wait_visibility_of_element_located(self.LCT.SIZEPERPAGE_OPTIONS)
        for option in self.browser.get_elements(self.LCT.SIZEPERPAGE_OPTIONS):
            if '-active' in self.browser.get_attribute_value(option, 'class'):
                self.browser.click(option)
        return output

    def pagination_studies(self, next_or_previous=None, page_number=None, is_wait=True):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_visibility_of_element_located(self.LCT.PAGINATION_NEXT, inverse=True)
        self.browser.wait_visibility_of_element_located(self.LCT.PAGINATION_PREVIOUS)
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.hover_to(self.LCT.PAGINATION_NEXT)
                self.browser.js_click(self.LCT.PAGINATION_NEXT)
                break
            if next_or_previous == 'previous':
                self.browser.hover_to(self.LCT.PAGINATION_PREVIOUS)
                self.browser.js_click(self.LCT.PAGINATION_PREVIOUS)
                break
        if page_number:
            self.browser.clicks(self.LCT.PAGINATION_PAGENUM,
                                on_elements=lambda e, _: self.browser.get_text(e).lower() == page_number.lower(),
                                stop_on_first=True)
        if is_wait:
            wait_func = {
                'active': self.wait_active_studies_available,
                'completed': self.wait_completed_studies_available,
                'flagged studies': self.wait_flagged_studies_available,
                'deleted': self.wait_deleted_studies_available
            }
            wait_func[self._get_current_study_tab().lower()]()

    def get_studies_current_pagination(self):
        output = dict()
        self.wait_completed_studies_available()
        self.browser.scroll_into_view(self.LCT.SIZEPERPAGE_CURRENT)
        output['Rows'] = self.browser.get_text(self.LCT.SIZEPERPAGE_CURRENT)
        for option in self.browser.get_elements(self.LCT.PAGINATION_BUTTONS):
            if '-active' in self.browser.get_attribute_value(option, 'class'):
                output['Page'] = self.browser.get_text(option)
        return output

    def get_clear_button_studies(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CLEAR_BUTTON)
        self.browser.get_element(self.LCT.CLEAR_BUTTON)

    def sort_study_id(self, asc_or_desc=None, row=None):
        self.wait_deleted_studies_available()
        output = []
        if asc_or_desc.lower() == self.browser.get_attribute_value(self.LCT.SORT_STUDIES_ID, 'aria-sort'):
            self.browser.wait_visibility_of_element_located(self.LCT.SORT_STUDIES_ID)
            header = ['Study ID']
            content = self.browser.get_texts(self.LCT.STUDY_ID_DATA_CONTENT)
            output = Utils.group_tabular_data(header, content, row=row)
            if row:
                return {k: v for k, v in output.items()}
            return [{k: v for k, v in c.items()} for c in output]
        if asc_or_desc.lower() != self.browser.get_attribute_value(self.LCT.SORT_STUDIES_ID, 'aria-sort'):
            self.browser.click(self.LCT.SORT_STUDIES_ID)
            self.wait_deleted_studies_available()
            header = ['Study ID']
            content = self.browser.get_texts(self.LCT.STUDY_ID_DATA_CONTENT)
            output = Utils.group_tabular_data(header, content, row=row)
            if row:
                return {k: v for k, v in output.items()}
            return [{k: v for k, v in c.items()} for c in output]
        output_newest = sorted(output, key=lambda x: x['Study ID'], reverse=True)
        if output == output_newest:
            return output_newest

    def close_popup_financial_90_day(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CLOSE_POPUP, inverse=True)
        self.browser.click(self.LCT.CLOSE_POPUP)

    def get_current_search_attribute(self):
        self.browser.wait_visibility_of_element_located(self.LCT.SEARCHBY_ICON)
        self.browser.click(self.LCT.SEARCHBY_ICON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SEARCHBY_OPTIONS)
        element = self.browser.get_elements_by_condition(
            self.LCT.SEARCHBY_OPTIONS,
            on_elements=lambda _, e: '-selected' in self.browser.get_attribute_value(e, 'class'), stop_on_first=True
        )[0]
        return self.browser.get_text(element).split('\n')[0]

    def get_message_biodirect(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_MSG_BIODIRECT)
        return self.browser.get_text(self.LCT.NEW_STUDY_MSG_BIODIRECT)

    def get_notification_biodirect(self, msg=None, is_enter=False, is_cancel=False):
        if msg:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_NOTI, inverse=True)
            return self.browser.get_text(self.LCT.NEW_STUDY_NOTI)
        if is_enter:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_ENTER_NOW)
            self.browser.click(self.LCT.NEW_STUDY_ENTER_NOW)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_CANCEL)
            self.browser.click(self.LCT.NEW_STUDY_CANCEL)

    def get_noti_email(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_NOTI_EMAIL)
        return self.browser.get_text(self.LCT.NEW_STUDY_NOTI_EMAIL)

    def get_all_completed_studies(self, row=None):
        """
        Get current completed studies
        :return: (list) list of dicts, each dict is a completed study on completed studies view
        """
        self.wait_completed_studies_available()
        output_1 = []  # Initialize output_1 as an empty list
        output_2 = []  # Initialize output_2 as an empty list
        while True:
            if len(self.browser.get_elements(self.LCT.COMPLETED_RAW)) == 10:
                header = ['Study ID'] + self.browser.get_texts(self.LCT.COMPLETED_STUDY_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_STUDY_CONTENT)
                output_1 += Utils.group_tabular_data(header, content, row=row)
                if 'disabled' in self.browser.get_attribute_value(self.LCT.PAGINATION_NEXT + '/..', 'class'):
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.browser.js_click(self.LCT.PAGINATION_NEXT, is_scroll=True)
                if self.browser.wait_visibility_of_element_located(self.LCT.NO_MORE_STUDY) and self.browser.get_element(
                        self.LCT.NO_MORE_STUDY).is_displayed():
                    return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output_1]
                self.wait_completed_studies_available()
            else:
                self.wait_completed_studies_available()
                header = ['Study ID'] + self.browser.get_texts(self.LCT.COMPLETED_STUDY_HEADER)
                content = self.browser.get_texts(self.LCT.COMPLETED_STUDY_CONTENT)
                output_2 += Utils.group_tabular_data(header, content, row=row)
                output = output_1 + output_2
                # print("output check data:", output)
                return [{k: v.replace('Biodirect study', '').replace('\n', ' | ') for k, v in c.items()} for c in
                        output]

    def check_sort_reports_completed(self):
        self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_STUDY_ID)
        self.browser.click(self.LCT.COMPLETED_STUDY_ID)
        self.wait_completed_studies_available()

    def navigate_to_studies_page_callcenter(self):
        """
        Navigate to Studies page via url
        :return: None
        """
        self.browser.open_page(f'{self.cfg.params["WEB_BASE_URL_CALLCENTER"]}/studies')
        self._ok_attention_if_any(timeout=3)

    def filter_studies_on_callcenter(self, study_type=None, facility=None, search_by=None, text_search=None):
        """
        Handle filtering studies
        :param study_type: (str)
        :param facility: (str)
        :param search_by: (str)
        :param text_search: (str)
        :return: None
        """
        if study_type:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CALLCENTER_STUDY_TABS)
            self.browser.clicks(self.LCT.CALLCENTER_STUDY_TABS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(
                                    study_type.lower()), stop_on_first=True)
        if facility:
            self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_FACILITY_INPUT)
            self.browser.input_text(self.LCT.CALLCENTER_FACILITY_INPUT, facility)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CALLCENTER_FACILITY_OPTIONS)
            self.browser.clicks(self.LCT.CALLCENTER_FACILITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                                stop_on_first=True)
        if search_by:
            self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_SEARCHBY)
            self.browser.click(self.LCT.CALLCENTER_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CALLCENTER_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.CALLCENTER_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        if text_search is not None:
            if search_by.lower() == 'study id':  # Able to enter a list/1 study id
                _studies = [s.strip() for s in text_search.split(',')] if isinstance(text_search, str) else text_search
                for st in _studies:
                    self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_TEXTSEARCH_INPUT)
                    self.browser.input_text(self.LCT.CALLCENTER_TEXTSEARCH_INPUT, st, is_clear=False)
                    self.browser.get_element(self.LCT.CALLCENTER_TEXTSEARCH_INPUT).send_keys(Keys.ENTER)
                    self.wait_studies_available_on_callcenter()
            else:
                self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_TEXTSEARCH_INPUT)
                self.browser.input_text(self.LCT.CALLCENTER_TEXTSEARCH_INPUT, text_search)
                self.browser.get_element(self.LCT.CALLCENTER_TEXTSEARCH_INPUT).send_keys(Keys.ENTER)
                self.wait_studies_available_on_callcenter()

    def wait_studies_available_on_callcenter(self):
        """
        Wait until all studies available
        :return:
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CALLCENTER_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CALLCENTER_DATA_CONTENT)

    def get_active_studies_callcenter(self, row=None):
        """
        Get the active studies
        :param row: (int)
        :return: (list or dict) list of active studies
        """
        self.wait_active_studies_available()
        headers = self.browser.get_texts(self.LCT.CALLCENTER_DATA_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.CALLCENTER_DATA_CONTENT, row=row)

    def navigate_to_order_page(self, sidebar_name=None):
        """
        Navigate to Studies page via url
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DIRECT_SIDEBAR)
        self.browser.clicks(self.LCT.DIRECT_SIDEBAR,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == sidebar_name.lower(),
                            stop_on_first=True)

    def get_order_direct(self, row=None):
        """
        Get the order direct
        :param row: (int)
        :return: (list or dict) list of order direct
        """
        self.wait_active_studies_available()
        headers = self.browser.get_texts(self.LCT.DIRECT_DATA_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.DIRECT_DATA_CONTENT, row=row)

    def filter_studies_on_direct(self, search_by=None, text_search=None):
        """
        Handle filtering studies
        :param search_by: (str)
        :param text_search: (str)
        :return: None
        """
        if search_by:
            self.browser.wait_visibility_of_element_located(self.LCT.DIRECT_SEARCHBY)
            self.browser.click(self.LCT.DIRECT_SEARCHBY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.DIRECT_SEARCHBY_OPTIONS)
            self.browser.clicks(self.LCT.DIRECT_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by.lower(),
                                stop_on_first=True)
        if text_search is not None:
            if search_by.lower() == 'study id':  # Able to enter a list/1 study id
                _studies = [s.strip() for s in text_search.split(',')] if isinstance(text_search, str) else text_search
                for st in _studies:
                    self.browser.wait_visibility_of_element_located(self.LCT.DIRECT_TEXTSEARCH_INPUT)
                    self.browser.input_text(self.LCT.DIRECT_TEXTSEARCH_INPUT, st, is_clear=False)
                    self.browser.get_element(self.LCT.DIRECT_TEXTSEARCH_INPUT).send_keys(Keys.ENTER)
                    self.wait_studies_available_on_callcenter()
            else:
                self.browser.wait_visibility_of_element_located(self.LCT.DIRECT_TEXTSEARCH_INPUT)
                self.browser.input_text(self.LCT.DIRECT_TEXTSEARCH_INPUT, text_search)
                self.browser.get_element(self.LCT.DIRECT_TEXTSEARCH_INPUT).send_keys(Keys.ENTER)
                self.wait_studies_available_on_callcenter()

    def delete_multiple_completed_studies(self, row=None):
        self.wait_completed_studies_available()
        _on = [s.strip() for s in row.split(',')] if isinstance(row, str) else row  # str|list
        output = []
        for _row in _on:
            _index = self._on_completed_studies_item(row=_row)
            self.wait_completed_studies_available()
            _row_elem = self.browser.get_elements_by_condition(
                self.LCT.COMPLETED_STUDY_ROW, on_elements=lambda index, _: index == _index, stop_on_first=True)[0]
            self.browser.hover_to(_row_elem)
            output.append({
                "Study ID": self.browser.get_text(_row_elem).split('\n')[0]
            })
            self.browser.clicks(self.LCT.COMPLETED_STUDY_DELETEICONS, on_elements=lambda index, _: index == _index,
                                stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_STUDY_BUTTON)
        self.browser.click(self.LCT.COMPLETED_STUDY_BUTTON)
        if self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_STUDY_DELETE_CONFIRM):  # confirm delete
            self.browser.click(self.LCT.COMPLETED_STUDY_DELETE_CONFIRM)
        self.wait_completed_studies_available()
        return output

    def get_error_messages_step_1(self):
        """
        Get error messages step 1
        :return: (list)
        """
        output = {
            "First name": self.browser.get_text(self.LCT.MESSAGE_FIRST_NAME),
            "Last name": self.browser.get_text(self.LCT.MESSAGE_LAST_NAME),
            "Patient ID": self.browser.get_text(self.LCT.MESSAGE_PATIENT_ID),
            "DoB": self.browser.get_text(self.LCT.MESSAGE_DOB),
            "Height": self.browser.get_text(self.LCT.MESSAGE_HEIGHT),
            "Weight": self.browser.get_text(self.LCT.MESSAGE_WEIGHT)
        }
        return output

    def get_error_messages_step_2(self):
        """
        Get error messages step 2
        :return: (list)
        """
        output = {
            "Address": self.browser.get_text(self.LCT.MESSAGE_ADDRESS),
            "City": self.browser.get_text(self.LCT.MESSAGE_CITY),
            "State": self.browser.get_text(self.LCT.MESSAGE_STATE),
            "Zip code": self.browser.get_text(self.LCT.MESSAGE_ZIP_CODE)
        }
        if self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_PRIMARYPHONE, 'value') == '':
            output["Primary phone number"] = self.browser.get_text(self.LCT.MESSAGE_PRIMARY_PHONE_NUMBER)
        if self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_PRIMARYPHONE, 'value') != '' and len(
                self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_2_PRIMARYPHONE, 'value')) < 12:
            output["Primary phone number"] = self.browser.get_text(self.LCT.MESSAGE_PRIMARY_PHONE_NUMBER)
        return output

    def get_error_messages_step_3(self):
        """
        Get error messages step 3
        :return: (list)
        """
        output = {
            "Device ID": self.browser.get_text(self.LCT.MESSAGE_DEVICE_ID) if self.browser.get_element(
                self.LCT.NEW_STUDY_PAGE_3_CURRENTDEVICE).is_displayed() else None,
            "Referring physician": self.browser.get_text(self.LCT.MESSAGE_REFERRING_PHYSICIAN),
            "Interpreting physician": None if 'disabled' in self.browser.get_attribute_value(
                self.LCT.NEW_STUDY_PAGE_3_INTPHYSICIAN_INPUT + '/../../..', 'class')
            else self.browser.get_text(self.LCT.MESSAGE_INTERPRETING_PHYSICIAN),
            "Study type": self.browser.get_text(self.LCT.MESSAGE_STUDY_TYPE),
            "Clinician Initials": self.browser.get_text(self.LCT.MESSAGE_CLINICIAN)
        }
        if int(self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_3_DURATION, 'value')) > 30 or int(
                self.browser.get_attribute_value(self.LCT.NEW_STUDY_PAGE_3_DURATION, 'value')) == 0:
            output["Study duration"] = self.browser.get_text(self.LCT.MESSAGE_STUDY_DURATION)
        return output

    def get_error_messages_step_4(self):
        """
        Get error messages step 4
        :return: (list)
        """
        output = {
            "Primary diagnosis code": self.browser.get_text(
                self.LCT.MESSAGE_PRIMARY_DIAGNOSIS_CODE) if self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO) == 'Select a code' else None,
            "Insurance type": self.browser.get_text(self.LCT.MESSAGE_INSURANCE_TYPE),
            "Other primary diagnosis code": self.browser.get_text(
                self.LCT.MESSAGE_OTHER_PRIMARY_DIAGNOSIS_CODE) if self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO) == 'Other' else None,
            "Other secondary diagnosis code": self.browser.get_text(
                self.LCT.MESSAGE_OTHER_SECONDARY_DIAGNOSIS_CODE) if self.browser.get_text(
                self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO) == 'Other' else None
        }
        return output

    def clear_text_on_other_diagnosis_code(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OTHERINPUT)
        self.browser.clear_text(self.LCT.NEW_STUDY_PAGE_4_PRIMARYDIAGNO_OTHERINPUT)
        self.browser.wait_visibility_of_element_located(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OTHERINPUT)
        self.browser.clear_text(self.LCT.NEW_STUDY_PAGE_4_SECONDARYDIAGNO_OTHERINPUT)

    def manage_completed_studies_callcenter_on(self, **on):
        _index = self._on_completed_studies_callcenter_item(**on)
        self.wait_studies_available_on_callcenter()
        self.browser.hover_to_by_index(self.LCT.CALLCENTER_COMPLETED_DATA_CONTENT_ROW, _index)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CALLCENTER_COMPLETED_DATA_CONTENT_MANAGESTUDY)
        self.browser.clicks(self.LCT.CALLCENTER_COMPLETED_DATA_CONTENT_MANAGESTUDY,
                            on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_completed_studies_callcenter(self, row=None):
        self.wait_studies_available_on_callcenter()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CALLCENTER_DATA_HEADER, inverse=True)
        header = self.browser.get_texts(self.LCT.CALLCENTER_DATA_HEADER)
        content = self.browser.get_texts(self.LCT.CALLCENTER_DATA_CONTENT)
        output = Utils.group_tabular_data(header, content, row=row)
        if row:
            return {k: v.replace('\n', ' | ') for k, v in output.items()}
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def _on_completed_studies_callcenter_item(self, **on):
        self.wait_studies_available_on_callcenter()
        if 'row' in on:
            return int(on['row']) - 1
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        completed_studies = self.get_completed_studies_callcenter()
        for i, row in enumerate(completed_studies):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such completed studies exist under `{_on}`.')

    def change_abort_study_callcenter(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_ICON_MORE)
        self.browser.click(self.LCT.CALLCENTER_ICON_MORE)
        self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_ABORT_STUDY)
        self.browser.click(self.LCT.CALLCENTER_ABORT_STUDY)
        self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_ABORT_STUDY_CONFIRM)
        self.browser.click(self.LCT.CALLCENTER_ABORT_STUDY_CONFIRM)
        self.browser.wait_invisibility_of_element_located(self.LCT.CALLCENTER_ABORT_MESSAGE, timeout=5)

    def get_message_abort_study_callcenter(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CALLCENTER_ABORT_MESSAGE)
        return self.browser.get_text(self.LCT.CALLCENTER_ABORT_MESSAGE)

    def select_aborted_study(self):
        self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_ABORT_STUDY, inverse=True)
        self.browser.click(self.LCT.COMPLETED_ABORT_STUDY)

    def get_more_completed_study_on(self, **on):
        self.wait_completed_studies_available()
        _index = self._on_completed_studies_item(**on)
        row_index = self.browser.get_elements_by_condition(self.LCT.COMPLETED_STUDY_ROW,
                                                           on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
        self.browser.hover_to(row_index)
        self.browser.clicks(self.LCT.COMPLETED_MANAGE_MORE_ICON, on_elements=lambda index, _: index == _index,
                            stop_on_first=True)
        output = {
            "Copy study": True if self.browser.wait_visibility_of_element_located(
                self.LCT.COMPLETED_COPY_STUDY) else False,
            "Delete study": True if self.browser.wait_visibility_of_element_located(
                self.LCT.COMPLETED_DELETE_STUDY) else False
        }
        return output

    def abort_study(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ACTIVE_ABORT_BUTTON)
        self.browser.click(self.LCT.ACTIVE_ABORT_BUTTON)
        self.browser.wait_visibility_of_element_located(self.LCT.ACTIVE_ABORT_CONFIRM_BUTTON)
        self.browser.click(self.LCT.ACTIVE_ABORT_CONFIRM_BUTTON)


    def verify_fields_of_studies(self, studies, name=None):
        if not studies:
            return False  # Returns False if the list is empty
        for record in studies:
            for field in record.items():
                if field== 'Patient Name' and record[field] != name:
                    return False  # If any study does not match, return False immediately
        return True  # If all studies match the desired values, return True

    def click_sort_study_id(self):
        self.browser.wait_visibility_of_element_located(self.LCT.COMPLETED_STUDY_ID)
        self.browser.click(self.LCT.COMPLETED_STUDY_ID)
        self.wait_completed_studies_available()

    def check_sorted_studies(self, studies, sort_order=None):
        self.wait_active_studies_available()
        study_id = []
        for item in studies:
            study_id_str = item['Study ID']  # Get Study ID as string
            study_id_int = int(study_id_str)  # Convert Study ID to integer
            study_id.append(study_id_int)   # Actual study ID list on the web after sorting

        # Create the ordered list as expected
        if sort_order == "asc":
            expected_sorted_list = sorted(study_id)
        else:
            expected_sorted_list = sorted(study_id, reverse=True)

        # Compare actual list with expected list
        if study_id == expected_sorted_list:
            sorted_correctly = True
        else:
            sorted_correctly = False
        return sorted_correctly

    def filter_all_studies(self, option = 'All studies'):
        self.browser.wait_visibility_of_element_located(self.LCT.ALL_STUDIES_DROPDOWN)
        self.browser.click(self.LCT.ALL_STUDIES_DROPDOWN)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ALL_STUDIES_DROPDOWN_OPTIONS)
        self.browser.clicks(self.LCT.ALL_STUDIES_DROPDOWN_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == option.lower(),
                            stop_on_first=True)