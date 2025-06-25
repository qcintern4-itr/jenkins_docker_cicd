#!/usr/bin/env python3

try:
    from project_biocare_app.lib.MappScreen import MappScreen
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Profile(MappScreen):
    """
    Handle initial screens and login screen
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, app, env):
        super().__init__(app=app, env=env, screen='profile')

    def _info_is_selected(self):
        header = ["Basic info", "Contact info"]
        self.app.wait_visibility_of_all_elements_located(self.LCT.BASIC_INFO)
        self.app.wait_visibility_of_all_elements_located(self.LCT.CONTACT_INFO)
        selected = [self.app.get_attribute_value(self.LCT.BASIC_INFO, 'selected'),
                    self.app.get_attribute_value(self.LCT.CONTACT_INFO, 'selected')]
        return dict(zip(header, selected))

    def get_bounds_location(self):
        bounds = self.app.get_attribute_value(self.LCT.DOB_MONTH, "bounds")

    def profile_basic_info(self, basic_info=True, first_name=None, last_name=None, email=None, dob=None, gender=None,
                           height=None, weight=None, is_save=True, is_back=False):
        if basic_info:
            if self._info_is_selected()["Basic info"] == 'false':
                self.app.tap(self.LCT.BASIC_INFO)
        if first_name:
            self.app.tap(self.LCT.FIRST_NAME)
            self.app.input_text(self.LCT.FIRST_NAME, first_name)
        if last_name:
            self.app.tap(self.LCT.LAST_NAME)
            self.app.input_text(self.LCT.FIRST_NAME, last_name)
        if email:
            self.app.tap(self.LCT.LAST_NAME)
            self.app.input_text(self.LCT.EMAIL, email)
        if dob:
            pass
        if gender:
            locator_map = {'male': self.LCT.GENDER_MALE, 'female': self.LCT.GENDER_FEMALE}
            self.app.tap(locator_map[gender])
        if height:
            attr = self._map_value(android='content-desc', ios=None)
            map_measurement = {
                True: 'Metric',
                False: 'Imperial'
            }
            cond = height.endswith('cm')
            self.app.taps(
                self.LCT.BODY_MEASUREMENT,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr) == map_measurement[cond],
                stop_on_first=True
            )
            self.app.tap(self.LCT.HEIGHT)
        if weight:
            attr = self._map_value(android='content-desc', ios=None)
            map_measurement = {
                True: 'Metric',
                False: 'Imperial'
            }
            cond = weight.endswith('kg')
            self.app.taps(
                self.LCT.BODY_MEASUREMENT,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr) == map_measurement[cond],
                stop_on_first=True
            )
            self.app.tap(self.LCT.WEIGHT)
            self.app.wait_visibility_of_element_located(self.LCT.WEIGHT_VALUE)
            current = float(self.app.get_attribute_value(self.LCT.WEIGHT_VALUE, attr))
            locator_map = self.LCT.RIGHT_WEIGHT if current > float(
                ''.join((filter(str.isdigit, weight)))) else self.LCT.LEFT_WEIGHT
            while True:
                self.app.scroll(self.LCT.WEIGHT_VALUE, locator_map)
                if float(self.app.get_attribute_value(self.LCT.WEIGHT_VALUE, attr)) == float(
                        ''.join((filter(str.isdigit, weight)))):
                    break
        if is_save:
            self.app.tap(self.LCT.SAVE)
        if is_back:
            self.app.tap(self.LCT.BACK)

    def profile_contact_info(self, contact_info=True, country=None, phone_number=None, address=None, city=None,
                             state=None, zipcode=None, is_save=True, is_back=False):
        if contact_info:
            if self._info_is_selected()["Contact info"] == 'false':
                self.app.tap(self.LCT.CONTACT_INFO)
        if country:
            self.app.tap(self.LCT.COUNTRY)
            attr = self._map_value(android='content-desc', ios=None)
            self.app.taps(
                self.LCT.INPUT_COUNTRY,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(country.lower()),
                stop_on_first=True
            )
            self.app.tap(self.LCT.SELECT)
        if phone_number:
            self.app.tap(self.LCT.PHONE_NUMBER)
            self.app.input_text(self.LCT.PHONE_NUMBER, phone_number)
        if address:
            self.app.tap(self.LCT.ADDRESS)
            self.app.tap(self.LCT.SEARCH_ADDRESS)
            self.app.input_text(self.LCT.SEARCH_ADDRESS, address)
            attr = self._map_value(android='content-desc', ios=None)
            self.app.taps(
                self.LCT.SELECT_ADDRESS,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(address.lower()),
                stop_on_first=True
            )
        if city:
            self.app.tap(self.LCT.CITY)
            self.app.tap(self.LCT.SEARCH_CITY)
            self.app.input_text(self.LCT.SEARCH_CITY, address)
            attr = self._map_value(android='content-desc', ios=None)
            self.app.taps(
                self.LCT.SELECT_CITY,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(city.lower()),
                stop_on_first=True
            )
        if state:
            self.app.tap(self.LCT.STATE)
            self.app.tap(self.LCT.SEARCH_STATE)
            self.app.input_text(self.LCT.SEARCH_STATE, address)
            attr = self._map_value(android='content-desc', ios=None)
            self.app.taps(
                self.LCT.SELECT_STATE,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(state.lower()),
                stop_on_first=True
            )
        if zipcode:
            self.app.tap(self.LCT.ZIPCODE)
            self.app.input_text(self.LCT.ZIPCODE, zipcode)
        if is_save:
            self.app.tap(self.LCT.SAVE)
        if is_back:
            self.app.tap(self.LCT.BACK)

    def sign_out_biocare_app(self, sign_out=True, cancel=False):
        self.app.tap(self.LCT.SIGN_OUT)
        self.app.wait_visibility_of_element_located(self.LCT.SIGNOUT_DIALOG)
        if sign_out:
            self.app.tap(self.LCT.SIGN_OUT)
        if cancel:
            self.app.tap(self.LCT.CANCEL)

    def units_settings(self, settings=True, body_measurement=None, temperature=None, distance=None):
        attr = self._map_value(android='content-desc', ios=None)
        if settings:
            self.app.tap(self.LCT.SETTINGS)
        if body_measurement:
            self.app.taps(
                self.LCT.UNITS,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(
                    body_measurement.lower()), stop_on_first=True)
        if temperature:
            self.app.taps(
                self.LCT.UNITS,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(temperature.lower()),
                stop_on_first=True
            )
        if distance:
            self.app.taps(
                self.LCT.UNITS,
                on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(distance.lower()),
                stop_on_first=True
            )

    def notification_settings(self, settings=True, medication_reminder=None, daily_reminder=None,
                              receive_reminder=None):
        if settings:
            self.app.tap(self.LCT.SETTINGS)
        if medication_reminder:
            if medication_reminder.lower() != self.app.get_attribute_value(self.LCT.MEDICATION_REMINDER,
                                                                           'checked').lower():
                self.app.tap(self.LCT.MEDICATION_REMINDER)
        if daily_reminder:
            if daily_reminder.lower() != self.app.get_attribute_value(self.LCT.DAILY_REMINDER, 'checked').lower():
                self.app.tap(self.LCT.DAILY_REMINDER)
        if receive_reminder:
            pass

    def change_password(self, current_pass=None, password=None, confirm_pass=None, update=True):
        self.app.tap(self.LCT.CHANGE_PASS)
        if current_pass:
            self.app.input_text(self.LCT.CURRENT_PASS, current_pass)
        if password:
            self.app.input_text(self.LCT.PASSWORD, password)
        if confirm_pass:
            self.app.input_text(self.LCT.CONFIRM_PASS, confirm_pass)
        if update:
            self.app.tap(self.LCT.UPDATE)

    def delete_account(self, delete=False, cancel=False):
        self.app.tap(self.LCT.DELETE_ACCOUNT)
        self.app.tap(self.LCT.DELETE_MY_ACCOUNT)
        if delete:
            self.app.tap(self.LCT.DELETE)
        if cancel:
            self.app.tap(self.LCT.CANCEL)
