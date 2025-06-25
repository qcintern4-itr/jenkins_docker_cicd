#!/usr/bin/env python3

try:
    from datetime import date
    import os
    from selenium.webdriver import Keys
    from corelib import Utils
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import profile as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Profile(WebPage):

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def open_profile(self, is_open=True, is_close=False, open_edit_prof=False):
        self.browser.wait_visibility_of_element_located(self.LCT.PROF_SIDEBAR_AVATAR, timeout=10)
        if is_open:
            self.browser.click(self.LCT.PROF_SIDEBAR_AVATAR)
        if is_close:
            self.browser.wait_visibility_of_element_located(self.LCT.PROF_CLOSE)
            self.browser.js_click(self.LCT.PROF_CLOSE)
        if open_edit_prof:
            self.browser.wait_visibility_of_element_located(self.LCT.PROF_EDIT)
            self.browser.js_click(self.LCT.PROF_EDIT)

    def _info_is_selected(self):
        header = ["Basic info", "Contact info"]
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PROF_BASIC_INFOR_TAB)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PROF_CONTACT_INFOR_TAB)
        selected = [self.browser.get_attribute_value(self.LCT.PROF_BASIC_INFOR_TAB, 'aria-selected'),
                    self.browser.get_attribute_value(self.LCT.PROF_CONTACT_INFOR_TAB, 'aria-selected')]
        return dict(zip(header, selected))

    def contact_info(self, contact_info=True, country=None, phone_number=None, address=None, city=None, state=None,
                     zipcode=None, is_save=True, is_back=False):
        if contact_info:
            if self._info_is_selected()["Contact info"] == 'false':
                self.browser.click(self.LCT.PROF_CONTACT_INFOR_TAB)
        if country:
            self.browser.click(self.LCT.PROF_COUNTRY_INPUT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PROF_COUNTRY_OPTION)
            self.browser.clicks(self.LCT.PROF_COUNTRY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if phone_number:
            self.browser.input_text(self.LCT.PROF_PHONE_NUMBER, phone_number)
        if address:
            self.browser.input_text(self.LCT.PROF_ADDRESS_INPUT, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PROF_ADD_CITY_OPTION)
            self.browser.clicks(self.LCT.PROF_ADD_CITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.PROF_CITY_INPUT, city)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.PROF_ADD_CITY_OPTION)
            self.browser.clicks(self.LCT.PROF_ADD_CITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            self.browser.input_text(self.LCT.PROF_STATE, state)
        if zipcode:
            self.browser.input_text(self.LCT.PROF_ZIPCODE, zipcode)
        if is_save:
            self.browser.click(self.LCT.PROF_SAVE)
        self.browser.wait_invisibility_of_element_located(self.LCT.PROF_LOADING)
        if is_back:
            self.browser.click(self.LCT.PROF_BACK)

    def basic_info(self, basic_info=True, first_name=None, last_name=None, dob=None, gender=None,
                   height=None, weight=None, is_save=True):
        if basic_info:
            if self._info_is_selected()["Basic info"] == 'false':
                self.browser.click(self.LCT.PROF_BASIC_INFOR_TAB)
        if first_name:
            self.browser.input_text(self.LCT.CP_FIRSTNAME, first_name)
        if last_name:
            self.browser.input_text(self.LCT.CP_LASTNAME, last_name)
        if dob:
            self.browser.remove_attribute(self.LCT.CP_DATE, 'readonly')
            self.browser.input_text(self.LCT.CP_DATE, dob)
            self.browser.get_element(self.LCT.CP_DATE).send_keys(Keys.ENTER)
        if gender:
            self.browser.clicks(self.LCT.CP_GENDER,
                                on_elements=lambda _, e: self.browser.get_attribute_value(e, 'value').
                                lower() == gender.lower(), stop_on_first=True)
        if height:
            map_measurement = {
                True: ['Metric (cm,kg)', [self.LCT.CP_HEIGHT_CM]],
                False: ['Imperial (ft,lb)', [self.LCT.CP_HEIGHT_FT, self.LCT.CP_HEIGHT_IN]]
            }
            cond = height.endswith('cm')
            self.browser.clicks(self.LCT.CP_SYS_MEASUREMENT,
                                on_elements=lambda _, e: self.browser.get_text(e) == map_measurement[cond][0],
                                stop_on_first=True)
            _height = height.replace('cm', ' ').replace('ft', ' ').replace('in', ' ').strip().split()
            [self.browser.input_text(e, text) for e, text in zip(map_measurement[cond][1], _height)]

        if weight:
            map_measurement = {
                True: ['Metric (cm,kg)', self.LCT.CP_WEIGHT_KG],
                False: ['Imperial (ft,lb)', self.LCT.CP_WEIGHT_LBS]
            }
            cond = weight.endswith('kg')
            self.browser.clicks(self.LCT.CP_SYS_MEASUREMENT,
                                on_elements=lambda _, e: self.browser.get_text(e) == map_measurement[cond][0],
                                stop_on_first=True)
            _weight = weight.replace('lbs', '').replace('kg', '').strip()
            self.browser.input_text(map_measurement[cond][1], _weight)
        if is_save:
            self.browser.click(self.LCT.CP_SAVE)

    def complete_profile(self, first_name=None, last_name=None, dob=None, gender=None,
                         height=None, weight=None, is_continue=True, country=None, phone_number=None, address=None,
                         city=None, state=None, zipcode=None, is_save=True, is_back=False):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.CP_CONTINUE)
        self.basic_info(basic_info=False, first_name=first_name, last_name=last_name, dob=dob, gender=gender,
                        height=height, weight=weight, is_save=False)
        if is_continue:
            self.browser.click(self.LCT.CP_CONTINUE)
        self.contact_info(contact_info=False, country=country, phone_number=phone_number, address=address, city=city,
                          state=state, zipcode=zipcode, is_save=False)
        if is_save:
            self.browser.click(self.LCT.CP_SAVE)
        if is_back:
            self.browser.click(self.LCT.CP_BACK)

    def edit_profile(self, basic_info=True, contact_info=True, first_name=None, last_name=None, dob=None, gender=None,
                     height=None, weight=None, country=None, phone_number=None, address=None,
                     city=None, state=None, zipcode=None, is_save=True, is_back=False):
        self.browser.wait_visibility_of_element_located(self.LCT.PROF_SAVE)
        self.basic_info(basic_info=basic_info, first_name=first_name, last_name=last_name, dob=dob, gender=gender,
                        height=height, weight=weight, is_save=False)
        self.contact_info(contact_info=contact_info, country=country, phone_number=phone_number, address=address,
                          city=city, state=state, zipcode=zipcode, is_save=False)
        if is_save:
            self.browser.click(self.LCT.PROF_SAVE)
        self.browser.wait_invisibility_of_element_located(self.LCT.PROF_LOADING)
        if is_back:
            self.browser.click(self.LCT.PROF_BACK)

    def get_profile(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PROF_HEADER)
        header = ["username", "email"]
        header += self.browser.get_texts(self.LCT.PROF_HEADER)
        content = [self.browser.get_text(self.LCT.PROF_NAME), self.browser.get_text(self.LCT.PROF_EMAIL)]
        content += self.browser.get_texts(self.LCT.PROF_CONTENT)
        header.append(self.browser.get_text(self.LCT.PROF_BIOSPHERE))
        content.append(self.browser.get_text(self.LCT.PROF_BIOSPHERE_STATUS))
        return Utils.group_tabular_data(header, content, row=1)

    def upload_image(self, file_path=None, remove_img=False, is_save=True):
        self.browser.wait_visibility_of_element_located(self.LCT.PROF_CHANGE_IMG)
        self.browser.click(self.LCT.PROF_CHANGE_IMG)
        if file_path:
            _file_path = os.path.abspath(file_path)
            if not os.path.isfile(file_path):
                raise Exception(f'Not such file exist under {file_path}')
            self.browser.execute_script('document.getElementById("contained-button-file").style.display="block"')
            self.browser.input_text(self.LCT.PROF_IMG, _file_path, is_clear=False)
        if remove_img:
            if self.browser.wait_visibility_of_element_located(self.LCT.PROF_REMOVE_IMG):
                self.browser.click(self.LCT.PROF_REMOVE_IMG)
            else:
                self.browser.click(self.LCT.PROF_SAVE_IMG)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.PROF_SAVE_IMG)
            self.browser.click(self.LCT.PROF_SAVE_IMG)

    def get_avatar_profile(self, is_remove=False):
        if is_remove:
            self.browser.wait_visibility_of_element_located(self.LCT.PROF_AVATAR_RM)
            return self.browser.get_text(self.LCT.PROF_AVATAR_RM)
        return self.browser.get_attribute_value(self.LCT.PROF_AVATAR, 'src')

    def get_avatar_uploaded(self):
        self.browser.wait_visibility_of_element_located(self.LCT.PROF_AVATAR_RM)
        return self.browser.get_attribute_value(self.LCT.PROF_AVATAR_UPLOADED, 'src')

    def profile_picture_modal_displayed(self, is_close=False):
        if is_close:
            self.browser.wait_visibility_of_element_located(self.LCT.PROF_CLOSE_IMG)
            self.browser.click(self.LCT.PROF_CLOSE_IMG)
        return self.browser.wait_visibility_of_element_located(self.LCT.PROF_PICTURE_MODAL)
