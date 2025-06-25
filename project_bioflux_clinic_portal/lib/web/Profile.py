#!/usr/bin/env python3

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import profile as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Profile(WebPage):

    """
    Handle profile page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_profile_page(self):
        self.browser.open_page(self.URL + '/profile')

    def wait_until_profile_info_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT_VALUE)

    def get_profile_information(self):
        output = dict()
        self.wait_until_profile_info_available()
        root_content = self.browser.get_texts(self.LCT.DATA_ROOT)
        # reformat information
        root_content = {v.split('\n')[0]: v.split('\n')[1:] for v in root_content}
        # GENERAL INFORMATION
        value = root_content['GENERAL INFORMATION']
        output['GENERAL INFORMATION'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}
        # FACILITY
        output['FACILITY'] = self.browser.get_texts(self.LCT.DATA_CONTENT_FACILITY)
        # CONTACT INFORMATION
        value = root_content['CONTACT INFORMATION']
        output['CONTACT INFORMATION'] = {value[i].replace(':', ''): value[i + 1] for i in range(0, len(value), 2)}

        output['Is Verified Email'] = False if self.browser.wait_visibility_of_element_located(
            self.LCT.VERIFICATION_BUTTON) else True

        return output

    def edit_general_information(self, new_first_name=None, new_last_name=None, new_email=None, new_title=None,
                                 is_save=True, is_close=False):
        self.browser.click(self.LCT.GENERALINFO_EDITICON)
        if new_first_name is not None:
            self.browser.input_text(self.LCT.GENINFO_FIRSTNAME, new_first_name)
        if new_last_name is not None:
            self.browser.input_text(self.LCT.GENINFO_LASTNAME, new_last_name)
        if new_email is not None:
            self.browser.input_text(self.LCT.GENINFO_EMAIL, new_email)
        if new_title is not None:
            self.browser.input_text(self.LCT.GENINFO_TITLE, new_title)
        if is_save:
            self.browser.click(self.LCT.GENINFO_SAVE)
        if is_close:
            self.browser.click(self.LCT.GENINFO_CLOSE)
        self.wait_until_profile_info_available()

    def edit_contact_information(self, country=None, address=None, city=None, state=None, zipcode=None,
                                 day_phone_number=None, after_hour_phone_number=None, fax_number=None, is_save=None):
        self.browser.click(self.LCT.CONTACTINFO_EDITICON)
        if country is not None:
            self.browser.input_text(self.LCT.CI_COUNTRY, country)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CI_COUNTRY_OPTIONS)
            self.browser.clicks(self.LCT.CI_COUNTRY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower())
        if address is not None:
            self.browser.input_text(self.LCT.CI_ADDRESS, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CI_ADDRESS_OPTIONS)
            self.browser.clicks(self.LCT.CI_ADDRESS_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city is not None:
            self.browser.input_text(self.LCT.CI_CITY, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.CI_CITY_OPTIONS)
            self.browser.clicks(self.LCT.CI_CITY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state is not None:
            if country.lower() in ('canada', 'united state'):
                self.browser.click(self.LCT.CI_STATE1ST)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.CI_STATE1ST_OPTIONS)
                self.browser.clicks(self.LCT.CI_STATE1ST_OPTIONS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == state.lower(),
                                    stop_on_first=True)
            else:
                self.browser.input_text(self.LCT.CI_STATE2ST, state)
        if zipcode is not None:
            self.browser.input_text(self.LCT.CI_ZIPCODE, zipcode)
        if day_phone_number is not None:
            self.browser.input_text(self.LCT.CI_DAYPHONE, day_phone_number)
        if after_hour_phone_number is not None:
            self.browser.input_text(self.LCT.CI_NIGHTPHONE, after_hour_phone_number)
        if fax_number is not None:
            self.browser.input_text(self.LCT.CI_FAX, fax_number)
        if is_save:
            self.browser.click(self.LCT.CI_SAVE)
        self.wait_until_profile_info_available()

    def change_your_password(self, current_password=None, new_password=None, confirm_new_password=None, is_change=True):
        self.browser.click(self.LCT.CHANGEPWD_BUTTON)
        if current_password is not None:
            self.browser.input_text(self.LCT.CPW_CURRENTPASSWD, current_password)
        if new_password is not None:
            self.browser.input_text(self.LCT.CPW_NEWPASSWD, new_password)
        if confirm_new_password is not None:
            self.browser.input_text(self.LCT.CPW_NEWPASSWD_CONFIRM, confirm_new_password)
        if is_change:
            self.browser.click(self.LCT.CPW_CHANGEPWD)
        self.browser.wait_url_contains('/login')

    def send_email_verification(self):
        self.browser.click(self.LCT.VERIFICATION_BUTTON)
        self.browser.wait_visibility_of_element_located('xpath://span[text()="Okay"]')
        self.browser.click('xpath://span[text()="Okay"]')

    def edit_profile(self, general_information=None, contact_information=None, change_password=None,
                     send_email_verification=False):
        if general_information:
            self.edit_general_information(**general_information)
        if contact_information:
            self.edit_contact_information(**contact_information)
        if change_password:
            self.change_your_password(**change_password)
        if send_email_verification:
            self.send_email_verification()
