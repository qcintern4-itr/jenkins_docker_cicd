#!/usr/bin/env python3
import platform
import time

import pandas as pd

from corelib.WebHandler import BY_MAP
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

try:
    from project_bioflux_ai_report_portal.lib.WebPage import WebPage
    from project_bioflux_ai_report_portal.config.web_locators import crawl_data as locators
    from corelib import Utils
    from selenium.webdriver.common.keys import Keys
    from selenium.webdriver.common.by import By

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise

pids = [
3649,
9190,
12259,
9434,
16907,
4812,
4426,
16386,
16372,
16300,
16196,
16290,
14388,
11468,
8727,
15159,
9434,
15477,
13646,
2782,
15176,
9796,
7741,
14079,
14390,
9989,
14155,
14499,
9989,
11487,
17102,
14890,
8677,
17224,
15593,
12477,
8626,
14533,
16260
]

class CrawlData(WebPage):
    """
    Handle login page, left-hand-side main menu
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_crawl_data_home_page(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.CRAWL_DATA_GO) and self.browser.get_element(
                    self.LCT.CRAWL_DATA_GO).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.CRAWL_DATA_GO, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break
        self.browser.click(self.LCT.CRAWL_DATA_GO)
        self.browser.wait_visibility_of_element_located(self.LCT.CRAWL_DATA_GO, inverse=True)
        self.browser.wait_visibility_of_element_located(self.LCT.CRAWL_DATA_GO, inverse=True)

    def open_quickview(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CRAWL_DATA_DROP_DOWN)
        self.browser.click(self.LCT.CRAWL_DATA_DROP_DOWN)
        self.browser.wait_visibility_of_element_located(self.LCT.CRAWL_DATA_QUICKVIEW_BUTTON)
        self.browser.click(self.LCT.CRAWL_DATA_QUICKVIEW_BUTTON)
        self.browser.wait_visibility_of_element_located(self.LCT.CRAWL_DATA_QUICKVIEW, inverse=False)
        time.sleep(2)

    def filter_crawl_data_search(self, patient_id=None):
        time.sleep(5)
        self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HEADER)
        self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
        self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).click()
        self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(Keys.BACKSPACE)
        time.sleep(2)
        self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(patient_id, Keys.ENTER)
        self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
        self.browser.switch_to_default_content()

    def read_patient_data_xlsx(self, filepath="tmp/raw_patients.xlsx"):
        """
        Reads the specified Excel file containing patient data, skipping the top rows
        until the correct header row, then renames columns to:
        ['firstname', 'lastname', 'dob', 'mobile', 'email'].

        :param filepath: The path to the Excel file.
        :return: A list of dictionaries, each representing a patient's info.
        """
        # Read the Excel file, skip the first 2 rows (so the third row becomes the header)
        df = pd.read_excel(filepath, skiprows=2)

        # Rename the columns to something consistent
        df.columns = ['firstname', 'lastname', 'dob', 'mobile', 'email']

        # Replace NaN with an empty string
        df.fillna("", inplace=True)

        # Convert to a list of dictionaries
        patient_list = df.to_dict(orient="records")

        return patient_list

    def filling_field_in_find_a_patient(self, input_field, value):
        input_field.click()

        if platform.system() == "Darwin":
            # macOS
            input_field.send_keys(Keys.COMMAND, "a")
        else:
            # Windows & Linux
            input_field.send_keys(Keys.CONTROL, "a")

        input_field.send_keys(Keys.DELETE)
        input_field.send_keys(value)

    def filter_patient_info(self, last_name = '', dob = '', phone_number = ''):
        self.browser.wait_visibility_of_element_located(self.LCT.FIND_A_PATIENT)

        self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HOST)
        self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_CONTENT)
        self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_PATIENT)

        for i in range(6):
            self.browser.execute_script('document.querySelector(".gs_c_filterable-list__add button").click();')

        patient_name_elem = self.browser.get_element(self.LCT.PATIENT_NAME)
        dob_elem = self.browser.get_element(self.LCT.DOB)
        phone_number_elem = self.browser.get_element(self.LCT.PHONE)

        self.filling_field_in_find_a_patient(patient_name_elem, last_name)
        if phone_number:
            self.filling_field_in_find_a_patient(phone_number_elem, phone_number)
        self.filling_field_in_find_a_patient(dob_elem, dob)

        find_button = self.browser.get_element(self.LCT.FIND_BUTTON)
        find_button.click()
        time.sleep(3)

        patient_id_elem = self.browser.get_element(self.LCT.PATIENT_ID)

        patient_case_link = self.browser.get_element(self.LCT.PATIENT_CASE)
        patient_case_link.click()

        pid = self.browser.get_text(patient_id_elem)
        return pid

    def get_patient_information(self, use_id = True):
        # output_all = []
        try:
            if use_id:
                patients = pids
            else:
                patients = self.read_patient_data_xlsx("tmp/raw_patients.xlsx")

            for patient in patients:
                output = {}
                if use_id :
                    pid = patient
                    self.logger.info(f"Use id: Searching for patient with ID: {pid}")
                    self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HEADER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).click()
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(Keys.BACKSPACE)
                    time.sleep(2)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(pid, Keys.ENTER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    time.sleep(10)
                else:
                    self.filter_crawl_data_search("An Invalid Text to make the search return no result")
                    pid = self.filter_patient_info(last_name=patient["lastname"], dob=patient["dob"], phone_number=patient["mobile"])
                    self.logger.info(f"Use name: Searching for patient with ID: {pid}")
                    time.sleep(10)

                self.browser.switch_to_default_content()
                time.sleep(5)
                self.browser.click_by_offset(self.LCT.CRAWL_DATA_IFRAME_HOST, 10, 200)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HOST)
                time.sleep(5)
                # self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_IFRAME_HOST, inverse=True)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_CONTENT)
                time.sleep(5)
                # self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_IFRAME_CONTENT, inverse=True)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_PATIENT)
                time.sleep(10)
                self.browser.click_chart_alert_icon()
                time.sleep(5)
                # self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_IFRAME_PATIENT, inverse=True)
                element_date_of_birth = self.browser.get_element_date_of_birth()
                self.browser.hover_to_element(element_date_of_birth)
                time.sleep(5)

                output['Legal First Name'] = self.browser.execute_script(
                    'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div.fe_c_popup__content > div > div:nth-child(2) > div:nth-child(2)").textContent')
                if self.browser.execute_script(
                        'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div.fe_c_popup__content > div > div:nth-child(2) > div:nth-child(3)").textContent') == 'Legal Last Name':
                    output['Legal Last Name'] = self.browser.execute_script(
                        'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div.fe_c_popup__content > div > div:nth-child(2) > div:nth-child(4)").textContent')
                elif self.browser.execute_script(
                        'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div.fe_c_popup__content > div > div:nth-child(2) > div:nth-child(5)").textContent') == 'Legal Last Name':

                    output['Legal Last Name'] = self.browser.execute_script(
                        'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div.fe_c_popup__content > div > div:nth-child(2) > div:nth-child(6)").textContent')
                elif self.browser.execute_script(
                        'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div.fe_c_popup__content > div > div:nth-child(2) > div:nth-child(7)").textContent') == 'Legal Last Name':

                    output['Legal Last Name'] = self.browser.execute_script(
                        'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div.fe_c_popup__content > div > div:nth-child(2) > div:nth-child(8)").textContent')

                output['Patient ID'] = pid
                output['Gender'] = (self.browser.execute_script(
                    'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("span:nth-child(1)").textContent')).split()[
                    1]

                output['Primary Insurance'] = self.browser.execute_script('''
                    let shadowRoot = document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot;
    
                    // Find the Insurance Module
                    let insuranceRow = Array.from(shadowRoot.querySelectorAll(".pb_c_modular-data-module"))
                        .find(module => module.querySelector(".pb_c_modular-data-module__category")?.textContent.trim() === "Insurance");
    
                    if (!insuranceRow) return null;  // Return null if insurance section is not found
    
                    // Extract the text inside the pb_c_modular-data-module__value
                    let insuranceText = insuranceRow.querySelector(".pb_c_modular-data-module__value")?.textContent.trim();
    
                    return insuranceText || null;
                ''')


                output['Date of birth'] = self.browser.format_datetime_to_yyyymmdd(self.browser.execute_script(
                    'return document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot.querySelector("div:nth-child(4) > div:nth-child(2)").textContent'))

                element_phone = self.browser.get_element_phone_number()
                self.browser.hover_to_element(element_phone)
                print('hovered')
                time.sleep(5)
                if self.browser.get_element_mobile().is_displayed():

                    # Extract Mobile Number
                    output['Mobile'] = self.browser.execute_script('''
                        let contactPopup = document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot;
                        let mobileRow = Array.from(contactPopup.querySelectorAll(".pb_c_universal-popover__three-columns"))
                            .find(row => row.children[0].textContent.trim() === "Mobile");
                        return mobileRow ? mobileRow.querySelector("a.pb_c_universal-popover__number-hyperlink div").textContent.trim() : null;
                    ''')

                    # Extract Home Number
                    output['Home'] = self.browser.execute_script('''
                        let contactPopup = document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner").shadowRoot;
                        let homeRow = Array.from(contactPopup.querySelectorAll(".pb_c_universal-popover__three-columns"))
                            .find(row => row.children[0].textContent.trim() === "Home");
                        return homeRow ? homeRow.querySelector("a.pb_c_universal-popover__number-hyperlink div").textContent.trim() : null;
                    ''')

                time.sleep(5)

                self.open_quickview()
                time.sleep(10)
                self.browser.execute_script("window.scrollBy(0, 800);")
                domographic_elements = self.browser.get_element(self.LCT.CRAWL_DATA_DEMOGRAPHICS)
                self.browser.execute_script("arguments[0].scrollIntoView();", domographic_elements)
                race_elem, eth_elem = self.browser.get_element_race_ethnicity()
                output['Race'] = race_elem.text.strip() if race_elem else ""
                output['Ethnicity'] = eth_elem.text.strip() if eth_elem else ""

                is_home_displayed = self.browser.execute_script('''
                    let banner = document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner");
                    if (!banner) return false;
    
                    let shadowRoot = banner.shadowRoot;
                    if (!shadowRoot) return false;
    
                    let contactSections = shadowRoot.querySelectorAll('.pb_c_modular-data-module__key');
                    for (let section of contactSections) {
                        let label = section.textContent.trim();
                        if (label === 'Home') {
                            let homeLink = section.closest('.pb_c_modular-data-module__data-row')
                                                  .querySelector('.pb_c_modular-data-module__value-href div');
                            return homeLink ? homeLink.textContent.trim() : false;
                        }
                    }
                    return false;
                ''')


                if is_home_displayed:
                    print(5)
                    output['Home'] = is_home_displayed  # Stores Home phone directly
                else:
                    print(7)
                    section_label = self.browser.execute_script('''
                        let banner = document.querySelector("#nimbus-banner-container > div.autostart.aggressive-start-banner");
                        if (!banner) return null;
    
                        let shadowRoot = banner.shadowRoot;
                        if (!shadowRoot) return null;
    
                        let contactSections = shadowRoot.querySelectorAll('.pb_c_modular-data-module__key');
                        for (let section of contactSections) {
                            let label = section.textContent.trim();
                            if (label === 'Mobile') return 'Mobile';
                            if (label === 'Home') return 'Home';
                        }
                        return null;
                    ''')

                    print(8)
                    if section_label == 'Mobile':
                        print(9)
                        output['Home'] = ''
                    elif section_label == 'Home':
                        print(10)
                        output['Mobile'] = ''

                self.browser.switch_to_default_content()
                time.sleep(5)
                self.browser.export_patient_info_to_excel_file(output)
                # output_all.append(output)
        except Exception as e:
            print(f"Ễcption Error: {e}")
        # finally:
        #     return output_all

    def get_medication_information(self, use_id = True):

        # output_all = []
        try:
            if use_id:
                patients = pids
            else:
                patients = self.read_patient_data_xlsx("tmp/raw_patients.xlsx")

            for patient in patients:
                if use_id:
                    pid = patient
                    self.logger.info(f"Use id: Searching for patient with ID: {pid}")
                    self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HEADER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).click()
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(Keys.BACKSPACE)
                    time.sleep(2)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(pid, Keys.ENTER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    time.sleep(10)
                else :
                    self.filter_crawl_data_search("An Invalid Text to make the search return no result")
                    pid = self.filter_patient_info(last_name=patient["lastname"], dob=patient["dob"], phone_number=patient["mobile"])
                    self.logger.info(f"Use name: Searching for patient with ID: {pid}")
                    time.sleep(10)
                self.browser.switch_to_default_content()
                time.sleep(5)
                self.browser.click_by_offset(self.LCT.CRAWL_DATA_IFRAME_HOST, 10, 200)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HOST)
                time.sleep(5)
                # self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_IFRAME_HOST, inverse=True)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_CONTENT)
                time.sleep(5)
                # self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_IFRAME_CONTENT, inverse=True)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_PATIENT)
                time.sleep(5)

                self.browser.execute_script('return document.querySelector("ul > li:nth-child(4)")').click()
                time.sleep(5)
                self.browser.close_the_popup()
                time.sleep(5)
                self.browser.close_the_popup()
                time.sleep(5)
                number_elements = self.browser.execute_script(
                    'return document.querySelectorAll(\'li[data-section="medications"]\')')
                for element in number_elements:
                    # Extract medication name
                    time.sleep(5)
                    element_medication_name = self.browser.get_element_medication(element, "div.medication-name")
                    medication_name = element_medication_name.text.strip() if element_medication_name else None
                    # Extract notes
                    element_medication_note = self.browser.get_element_medication(element, "div.read-only-sig")
                    medication_note = element_medication_note.text.strip() if element_medication_note else ''
                    # Append to output list as a single entry
                    output = {
                        'Medication name': medication_name if medication_name else '',
                        'Notes': medication_note,
                        'Patient ID': pid
                    }
                    self.browser.export_to_excel_file_medication(output)
                self.browser.switch_to_default_content()
            # return output_all
        except Exception as e:
            print(f"Ễcption Error: {e}")

    def get_allergy_information(self, use_id = True):
        # output_all = []
        try:
            if use_id:
                patients = pids
            else:
                patients = self.read_patient_data_xlsx("tmp/raw_patients.xlsx")
            for patient in patients:
                if use_id:
                    pid = patient
                    self.logger.info(f"Use id: Searching for patient with ID: {pid}")
                    self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HEADER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).click()
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(Keys.BACKSPACE)
                    time.sleep(2)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(pid, Keys.ENTER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    time.sleep(10)
                else :
                    self.filter_crawl_data_search("An Invalid Text to make the search return no result")
                    pid = self.filter_patient_info(last_name=patient["lastname"], dob=patient["dob"], phone_number=patient["mobile"])
                    self.logger.info(f"Use name: Searching for patient with ID: {pid}")
                    time.sleep(10)
                self.browser.switch_to_default_content()
                time.sleep(5)
                self.browser.click_by_offset(self.LCT.CRAWL_DATA_IFRAME_HOST, 10, 200)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HOST)
                time.sleep(5)
                # self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_IFRAME_HOST, inverse=True)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_CONTENT)
                time.sleep(5)
                # self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_IFRAME_CONTENT, inverse=True)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_PATIENT)
                time.sleep(5)
                self.browser.execute_script('return document.querySelector("ul > li:nth-child(2)")').click()
                time.sleep(3)
                is_home_displayed = self.browser.execute_script('''
                    let homeLink = document.querySelector("div.active-historical-content.active-historical-status-active-list > ul");
                    if (homeLink) {
                        return window.getComputedStyle(homeLink).display !== 'none';
                    }
                    return false;
                ''')
                if is_home_displayed:
                    texts = self.browser.execute_script('''return Array.from(document.querySelectorAll("div.active-historical-content.active-historical-status-active-list > ul > li > div.accordion-trigger.clickable.name > div > span"))
                            .map(element => element.textContent);''')
                    allergy_name = '; '.join(texts) if texts else ''
                else:
                    allergy_name = None
                time.sleep(5)
                self.browser.switch_to_default_content()
                output = {'Patient ID': pid, 'Allergy name': allergy_name}
                self.browser.export_to_excel_file_allergy(output)
                # output_all.append({'Patient ID': pid, 'Allergy name': allergy_name})
        except Exception as e:
            print(f"Ễcption Error: {e}")

    def get_diagnoses_information(self, use_id=True):
        try:
            # Decide whether we're using IDs directly or reading from a file
            if use_id:
                patients = pids
            else:
                patients = self.read_patient_data_xlsx("tmp/raw_patients.xlsx")

            for patient in patients:
                if use_id:
                    pid = patient
                    self.logger.info(f"Use id: Searching for patient with ID: {pid}")
                    self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HEADER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH,
                                                                             inverse=True)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).click()
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(Keys.BACKSPACE)
                    time.sleep(2)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(pid, Keys.ENTER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH,
                                                                             inverse=True)
                    time.sleep(10)
                else:
                    self.filter_crawl_data_search("An Invalid Text to make the search return no result")
                    pid = self.filter_patient_info(last_name=patient["lastname"], dob=patient["dob"],
                                                   phone_number=patient["mobile"])
                    self.logger.info(f"Use name: Searching for patient with ID: {pid}")
                    time.sleep(10)

                # Switch to correct frames
                self.browser.switch_to_default_content()
                time.sleep(5)
                self.browser.click_by_offset(self.LCT.CRAWL_DATA_IFRAME_HOST, 10, 200)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HOST)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_CONTENT)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_PATIENT)
                time.sleep(10)

                print("id", pid)
                self.browser.execute_script('return document.querySelector("ul > li:nth-child(3)")').click()
                time.sleep(15)

                # Check if "Home" link is displayed
                is_home_displayed = self.browser.execute_script('''
                    let homeLink = document.querySelector("div.fe_c_accordion-item__content.fe_is-expanded ul li");
                    if (homeLink) {
                        return window.getComputedStyle(homeLink).display !== 'none';
                    }
                    return false;
                ''')
                print("is_home_displayed", is_home_displayed)

                # We'll store every diagnosis in a list
                diagnoses_list = []

                if is_home_displayed:
                    number_elements = self.browser.get_elements(self.LCT.CRAWL_DATA_PROMBLEM)
                    for element in number_elements:
                        time.sleep(5)
                        self.browser.hover_to_element(element)
                        time.sleep(5)
                        element.click()
                        time.sleep(10)

                        # Extract Active (Status)
                        element_status = self.browser.get_element_medication(
                            element,
                            "div:nth-child(1) > div:nth-child(2) > div > div > div.is-selected"
                        )
                        diagnosis_active = element_status.text.strip()

                        # Extract Chronic (Type)
                        time.sleep(3)
                        try:
                            element_type = self.browser.get_element_medication(
                                element,
                                "div:nth-child(2) > div:nth-child(2) > div > div > div.is-selected"
                            )
                            element_chronic = element_type.text.strip()
                        except Exception:
                            element_chronic = "Not categorized"

                        # Extract Onset date
                        element_date = self.browser.execute_script(
                            'return document.querySelector(\'input[name="onset-date"]\')'
                        )
                        element_onset_date = self.browser.format_datetime_to_yyyymmdd(
                            element_date.get_attribute('value')
                        )

                        # Extract Diagnosis code
                        element_diagnosis_code = self.browser.get_element_medication(element, "button.flowsheet-icon")
                        element_diagnosis_code.click()
                        time.sleep(20)

                        # Initialize a dictionary for the current diagnosis
                        diag_data = {
                            "Status": diagnosis_active if diagnosis_active in ["Active", "Historical"] else "",
                            "Type": element_chronic if element_chronic in ["Chronic", "Acute"] else "Not categorized",
                            "Date of Diagnosis": element_onset_date if element_onset_date else "",
                            "Patient ID": pid,
                        }

                        # Check for diagnosis code text
                        is_diagnosis_code_text = self.browser.execute_script('''
                            let diagnosisTextLink = document.querySelector("div.briefing.autostart.sticky-container > div> div > div > div:nth-child(4) > div > div.draggable-flowsheet-opened > div > div.flowsheet-content-container > div.tabular-view > div.visit-notes");
                            if (diagnosisTextLink) {
                                return window.getComputedStyle(diagnosisTextLink).display !== 'none';
                            }
                            return false;
                        ''')
                        if is_diagnosis_code_text:
                            element_diagnosis_code_text = self.browser.execute_script('''
                                return document.querySelector(
                                    "div.briefing.autostart.sticky-container > div> div > div > div:nth-child(4) > div > div.draggable-flowsheet-opened > div > div.flowsheet-content-container > div.tabular-view > div.visit-notes"
                                )
                            ''')
                            element_diagnosis_code_text.click()
                            time.sleep(5)
                            element_diagnosis_code_text = self.browser.execute_script('''
                                return document.querySelector(
                                    "div.sticky-container > div > div > div > div:nth-child(4) > div > div > div > div.flowsheet-content-container > div.tabular-view > div > div > div.visit-list > div:nth-child(1) > div.content > div.icd10"
                                )
                            ''')
                            code_diagnosis = element_diagnosis_code_text.text.strip()
                            diag_data["Diagnosis code"] = code_diagnosis
                            time.sleep(5)
                        else:
                            diag_data["Diagnosis code"] = ""

                        # Check for notes
                        is_note_displayed = self.browser.execute_script('''
                            let noteLink = document.querySelector('div[class="plw_c_diagnosis-note"]');
                            if (noteLink) {
                                return window.getComputedStyle(noteLink).display !== 'none';
                            }
                            return false;
                        ''')
                        if is_note_displayed:
                            notes_diagnosis = self.browser.execute_script(
                                'return document.querySelector(\'div[class="plw_c_diagnosis-note"]\').textContent'
                            )
                            diag_data["Notes"] = notes_diagnosis
                            time.sleep(5)
                        else:
                            diag_data["Notes"] = ""

                        print("diag_data", diag_data)
                        diagnoses_list.append(diag_data)

                # Now that the for-loop is done, we have all diagnoses in `diagnoses_list`.
                # Export each diagnosis (or export them in bulk if your method supports a list).
                for diagnosis in diagnoses_list:
                    self.browser.export_to_excel_file_diagnosis(diagnosis)

                self.browser.switch_to_default_content()

        except Exception as e:
            print(f"Exception Error: {e}")

    def get_patient_address_information(self, use_id = True):

        # output_all = []
        try:
            if use_id:
                patients = pids
            else:
                patients = self.read_patient_data_xlsx("tmp/raw_patients.xlsx")

            for patient in patients:
                if use_id:
                    pid = patient
                    self.logger.info(f"Use id: Searching for patient with ID: {pid}")
                    self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HEADER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).click()
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(Keys.BACKSPACE)
                    time.sleep(2)
                    self.browser.get_element(self.LCT.CRAWL_DATA_INPUT_SEARCH).send_keys(pid, Keys.ENTER)
                    self.browser.wait_frame_to_be_available_and_switch_to_it(self.LCT.CRAWL_DATA_INPUT_SEARCH, inverse=True)
                    time.sleep(10)
                else :
                    self.filter_crawl_data_search("An Invalid Text to make the search return no result")
                    pid = self.filter_patient_info(last_name=patient["lastname"], dob=patient["dob"], phone_number=patient["mobile"])
                    self.logger.info(f"Use name: Searching for patient with ID: {pid}")
                    time.sleep(10)

                self.browser.switch_to_default_content()
                time.sleep(5)
                self.browser.click_by_offset(self.LCT.CRAWL_DATA_IFRAME_HOST, 10, 200)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_HOST)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_CONTENT)
                time.sleep(5)
                self.browser.switch_to_frame(self.LCT.CRAWL_DATA_IFRAME_PATIENT)
                time.sleep(5)
                self.browser.execute_script(
                    'return document.querySelector("div.header > div.relocated-gray-bar > div > div.patient-action-anchor")').click()
                time.sleep(5)
                self.browser.execute_script(
                    'return document.querySelector("div > ul > li.quickview > div.action-option-label")').click()
                time.sleep(20)
                element_address = self.browser.execute_script(
                    'return document.querySelector("td:nth-child(3) > div > button")')
                self.browser.hover_to_element(element_address)
                element_address.click()
                time.sleep(5)
                # element_email = self.browser.execute_script('return document.querySelector("#edit-contact-form")')
                # self.browser.click_by_offset(element_email, 10, 50)
                # time.sleep(5)
                element_email = self.browser.execute_script('return document.querySelector("#email")')
                email = element_email.get_attribute('value') if element_email else None
                element_address_line_1 = self.browser.execute_script(
                    'return document.querySelector(\'input[name="statementaddress1"]\')')
                address_line_1 = element_address_line_1.get_attribute('value') if element_address_line_1 else None
                element_address_line_2 = self.browser.execute_script('return document.querySelector("#statementaddress2")')
                address_line_2 = element_address_line_2.get_attribute('value') if element_address_line_2 else None
                element_zip_code = self.browser.execute_script('return document.querySelector("#statementzip")')
                zip_code = element_zip_code.get_attribute('value') if element_zip_code else None
                element_city = self.browser.execute_script('return document.querySelector("#statementcity")')
                city = element_city.get_attribute('value') if element_city else None
                element_state = self.browser.execute_script('return document.querySelector(\'input[name="statementstate"]\')')
                state = element_state.get_attribute('value') if element_state else None
                time.sleep(5)
                output = {
                    'Patient ID': pid,
                    'Email': email if email else '',
                    'Address line 1': address_line_1 if address_line_1 else '',
                    'Address line 2': address_line_2 if address_line_2 else '',
                    'ZIP code': zip_code if zip_code else '',
                    'City': city if city else '',
                    'State': state if state else '',
                }
                self.browser.export_to_excel_file_address(output)
                self.browser.switch_to_default_content()
        except Exception as e:
            print(f"Ễcption Error: {e}")
