#!/usr/bin/env python3
import time

try:
    from project_biocare_portal.lib.WebPage import WebPage
    from project_biocare_portal.config.web_locators import common as locators
    from corelib import Utils
    import os

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_biocare_sign_in_page(self):
        version = '2.24.0'
        try:
            self.browser.open_page(self.URL + '/sign-in')
            # version = self.browser.get_text(self.LCT.VERSION).split()[-1][2:-1]
        finally:
            return version

    def sign_in_biocare_portal(self, username=None, password=None):
        if not self.browser.wait_url_matches(r'^https:[/][/].*[/]sign-in', timeout=10):
            raise Exception(
                f'Redirecting to biocare sign-in page got issue, current url: {self.browser.driver.current_url}')
        self.browser.wait_visibility_of_element_located(self.LCT.AUTH_USERNAME, inverse=True)
        self.browser.input_text(self.LCT.AUTH_USERNAME, username)
        self.browser.wait_visibility_of_element_located(self.LCT.AUTH_PASSWORD, inverse=True)
        self.browser.input_text(self.LCT.AUTH_PASSWORD, password, is_text_logged=False)
        self.browser.click(self.LCT.AUTH_SIGNIN)
        self.browser.wait_visibility_of_element_located(self.LCT.AUTH_MAIN_PAGE, timeout=5)

    def sign_out_biocare_portal(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AUTH_HEADER_RIGHT, inverse=True)
        self.browser.click(self.LCT.AUTH_HEADER_RIGHT)
        self.browser.wait_visibility_of_element_located(self.LCT.AUTH_SIGNOUT, inverse=True)
        self.browser.click(self.LCT.AUTH_SIGNOUT)

    def navigate_to_biocare_portal(self):
        self.browser.open_page(self.URL + '/dashboard')

    def navigate_to_biocare_diagnostics(self):
        self.browser.click(self.LCT.SCUT_DIAGNOSTIC)

    def navigate_to_biocare_disease_management(self):
        self.browser.click(self.LCT.SCUT_DISEASE)

    def wait_visibility_of_all_element_in_page(self):
        return self.browser.wait_visibility_of_all_elements_located(self.LCT.HOME)

    def change_avatar(self, avatar_path, is_saved=True, is_closed=False):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.EDAVATAR) and self.browser.get_element(
                    self.LCT.EDAVATAR).is_displayed():
                break
            elif time.time() - start_time > 5 * 60:  # 5 minutes in seconds
                break
        self.browser.click(self.LCT.EDAVATAR)
        self.browser.wait_visibility_of_element_located(self.LCT.EDAVATAR_OPTIONS, inverse=True)
        self.browser.click(self.LCT.EDAVATAR_OPTIONS + "[1]")
        self.browser.get_element(self.LCT.EDAVATAR_UPLOAD_IMG).send_keys(os.path.abspath(avatar_path))
        if is_saved:
            self.browser.click(self.LCT.EDAVATAR_SAVE)
        if is_closed:
            self.browser.click(self.LCT.CLOSE_MODAL)
        self.browser.wait_invisibility_of_element_located(self.LCT.ANT_MODAL)

    def remove_avatar(self):
        self.browser.wait_visibility_of_element_located(self.LCT.EDAVATAR, inverse=True)
        self.browser.click(self.LCT.EDAVATAR)
        self.browser.wait_visibility_of_element_located(self.LCT.EDAVATAR_OPTIONS, inverse=True)
        self.browser.click(self.LCT.EDAVATAR_OPTIONS + "[2]")

    def get_account_information(self):
        self.browser.wait_visibility_of_element_located(self.LCT.INFO_NAME, inverse=True)
        name_info = self.browser.get_text(self.LCT.INFO_NAME).split(', ')
        address_info = self.browser.get_text(self.LCT.INFO_ADDRESS).split(', ')
        return {
            'name': name_info[0],
            'title': name_info[1],
            'username': self.browser.get_text(self.LCT.INFO_USERNAME),
            'email': self.browser.get_text(self.LCT.INFO_EMAIL),
            'country': self.browser.get_text(self.LCT.INFO_COUNTRY),
            'address': address_info[0],
            'city': address_info[1],
            'state': address_info[2],
            'zip_code': address_info[3],
            'day_phone_number': self.browser.get_text(self.LCT.INFO_PHONE),
            'after_hour_phone_number': self.browser.get_text(self.LCT.INFO_AFTER_HOUR_PHONE),
            'fax_number': self.browser.get_text(self.LCT.INFO_FAX),
            'facilities': self.browser.get_text(self.LCT.INFO_FACILITIES).split('\n'),
        }

    def select_account_setting(self, option):
        settings = {
            'edit your profile': self.LCT.ACCSETTING_EDIT_PROFILE,
            'update your email': self.LCT.ACCSETTING_UPDATE_EMAIL,
            'change your password': self.LCT.ACCSETTING_CHANGE_PASSWORD,
        }

        self.browser.execute_script("""
            var style = document.createElement('style');
            style.innerHTML = '.ant-drawer-mask { display: none !important; }';
            document.head.appendChild(style);
        """)

        self.browser.wait_visibility_of_element_located(self.LCT.ACCSETTING, timeout=10)
        self.browser.click(self.LCT.ACCSETTING)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ACCSETTING_OPTIONS)
        self.browser.click(settings[option.lower()])

    def _clear_current_values(self, fields):
        clear_fields = [field.strip()
                        for field in fields.split(',')] if isinstance(fields, str) else fields
        format_fields = [f.lower().replace(' ', '_') for f in clear_fields]
        map_element = {
            'first_name': self.LCT.EDPROFILE_FIRST_NAME,
            'last_name': self.LCT.EDPROFILE_LAST_NAME,
            'title': self.LCT.EDPROFILE_TITLE,
            'address': self.LCT.EDPROFILE_ADDRESS,
            'city': self.LCT.EDPROFILE_CITY,
            'state': self.LCT.EDPROFILE_STATE,
            'zip_code': self.LCT.EDPROFILE_ZIPCODE,
            'phone_number': self.LCT.EDPROFILE_PHONE,
            'after_hour_phone_number': self.LCT.EDPROFILE_AFTER_HOUR_PHONE,
            'fax_number': self.LCT.EDPROFILE_FAX,
        }
        for field in format_fields:
            if field in ['state', 'zip_code', 'phone_number', 'after_hour_phone_number', 'fax_number']:
                self.browser.scroll_into_view(map_element[field])
            if field == 'state':
                self.browser.hover_to(map_element['state'])
                self.browser.click(self.LCT.EDPROFILE_STATE_REMOVE)
            else:
                self.browser.clear_text(map_element[field])

    def edit_profile(self, first_name=None, last_name=None, title=None, country=None, address=None, city=None,
                     state=None, zip_code=None, day_phone_number=None, after_hour_phone_number=None, fax=None,
                     clear_fields=None, is_saved=True, is_closed=False):
        self.browser.wait_visibility_of_element_located(self.LCT.SIDEBAR_MODAL)
        if clear_fields:
            self._clear_current_values(clear_fields)

        if first_name:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_FIRST_NAME, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_FIRST_NAME, first_name)

        if last_name:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_LAST_NAME, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_LAST_NAME, last_name)

        if title:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_TITLE, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_TITLE, title)

        if country:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_COUNTRY, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_COUNTRY, country)
            time.sleep(1)
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_COUNTRY, inverse=True)
            self.browser.clicks(
                self.LCT.EDPROFILE_COUNTRY_OPTIONS,
                on_elements=lambda _, e: country.lower() in self.browser.get_text(e).lower() and len(
                    self.browser.get_text(e)) > 0,
                stop_on_first=True
            )

        if address:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_ADDRESS, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_ADDRESS, address, is_clear=True)
            time.sleep(1)
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_ADDRESS_OPTIONS)
            self.browser.clicks(
                self.LCT.EDPROFILE_ADDRESS_OPTIONS,
                on_elements=lambda _, e: address.lower() in self.browser.get_text(e).lower() and len(
                    self.browser.get_text(e)) > 0,
                stop_on_first=True
            )
            time.sleep(1)

        if city:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_CITY, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_CITY, city, is_clear=True)
            time.sleep(1)
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_CITY_OPTIONS)
            self.browser.clicks(
                self.LCT.EDPROFILE_CITY_OPTIONS,
                on_elements=lambda _, e: city.lower() in self.browser.get_text(e).lower() and len(
                    self.browser.get_text(e)) > 0,
                stop_on_first=True
            )
        time.sleep(1)

        if state:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_STATE, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_STATE, state, is_clear=True)
            time.sleep(1)
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_STATE_OPTIONS)
            self.browser.clicks(
                self.LCT.EDPROFILE_STATE_OPTIONS,
                on_elements=lambda _, e: state.lower() in self.browser.get_text(e).lower() and len(
                    self.browser.get_text(e)) > 0,
                stop_on_first=True
            )
            time.sleep(1)

        if zip_code:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_ZIPCODE, timeout=3)
            self.browser.click(self.LCT.EDPROFILE_ZIPCODE)
            self.browser.input_text(self.LCT.EDPROFILE_ZIPCODE, zip_code)

        if day_phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_PHONE, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_PHONE, day_phone_number)

        if after_hour_phone_number:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_AFTER_HOUR_PHONE, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_AFTER_HOUR_PHONE, after_hour_phone_number)

        if fax:
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_FAX, timeout=3)
            self.browser.input_text(self.LCT.EDPROFILE_FAX, fax)

        if is_saved:
            self.browser.click(self.LCT.EDPROFILE_SAVE, is_scroll=True)
            self.browser.wait_visibility_of_element_located(self.LCT.EDPROFILE_SAVE, inverse=True)

        if is_closed:
            self.browser.click(self.LCT.CLOSE_MODAL)
            self.browser.wait_visibility_of_element_located(self.LCT.CLOSE_MODAL, inverse=True)

        return self.browser.wait_invisibility_of_element_located(self.LCT.SIDEBAR_MODAL)

    def update_email(self, new_email=None, is_saved=True, is_closed=False):
        self.browser.wait_visibility_of_element_located(self.LCT.UPDMAIL_MODAL)
        if new_email:
            self.browser.input_text(self.LCT.UPDMAIL_NEW_EMAIL, new_email)
        if is_saved:
            self.browser.click(self.LCT.UPDMAIL_SAVE)
        if is_closed:
            self.browser.click(self.LCT.CLOSE_ANT_MODAL)
        return self.browser.wait_invisibility_of_element_located(self.LCT.UPDMAIL_MODAL)

    def change_password(self, current_password=None, new_password=None, confirm_password=None, is_saved=True,
                        is_closed=False):
        self.browser.wait_visibility_of_element_located(self.LCT.SIDEBAR_MODAL)
        if current_password:
            self.browser.input_text(self.LCT.CHANGEPASS_CURRENT_PASSWORD, current_password, is_text_logged=False)
        if new_password:
            self.browser.input_text(self.LCT.CHANGEPASS_NEW_PASSWORD, new_password, is_text_logged=False)
        if confirm_password:
            self.browser.input_text(self.LCT.CHANGEPASS_CONFIRM_PASSWORD, confirm_password, is_text_logged=False)
        if is_saved:
            self.browser.click(self.LCT.CHANGEPASS_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.CHANGEPASS_SAVE, timeout=5)
        if is_closed:
            self.browser.click(self.LCT.CLOSE_MODAL)
        return self.browser.wait_invisibility_of_element_located(self.LCT.SIDEBAR_MODAL)

    def get_success_message(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.SUCCESS_MESSAGE) and self.browser.get_element(
                    self.LCT.SUCCESS_MESSAGE).is_displayed():
                return self.browser.get_text(self.LCT.SUCCESS_MESSAGE)
            elif time.time() - start_time > 5 * 60:  # 5 minutes in seconds
                break
        self.browser.wait_visibility_of_element_located(self.LCT.SUCCESS_MESSAGE, inverse=True)

    def get_error_message(self):
        return self.browser.get_texts(self.LCT.ERROR_MESSAGE)
