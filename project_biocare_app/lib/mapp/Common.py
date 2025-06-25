#!/usr/bin/env python3

try:
    from selenium.webdriver import Keys
    from project_biocare_app.lib.MappScreen import MappScreen
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(MappScreen):
    """
    Handle initial screens and login screen
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, app, env):
        super().__init__(app=app, env=env, screen='common')

    def start_biocare_app(self):
        if self.app.device_os == 'ios':
            pass
        else:  # android
            self.app.desired_caps.update(appPackage='com.biotricity.biocare',
                                         appActivity='com.biotricity.biocare.MainActivity',
                                         autoGrantPermissions=True)
        self.app.start_app()

    def _next_home_screen_guide(self):
        if self.app.wait_visibility_of_element_located(self.LCT.GUIDE_SUMMARYUPDATE_CLOSE):
            self.app.tap(self.LCT.GUIDE_SUMMARYUPDATE_CLOSE)
        if self.app.wait_visibility_of_element_located(self.LCT.GUIDE_NOTICENTER_NEXT):
            self.app.tap(self.LCT.GUIDE_NOTICENTER_NEXT)
        if self.app.wait_visibility_of_element_located(self.LCT.GUIDE_INPUTMEASURE_NEXT):
            self.app.tap(self.LCT.GUIDE_INPUTMEASURE_NEXT)
        if self.app.wait_visibility_of_element_located(self.LCT.GUIDE_SUMMARYMENU_NEXT):
            self.app.tap(self.LCT.GUIDE_SUMMARYMENU_NEXT)
        if self.app.wait_visibility_of_element_located(self.LCT.GUIDE_DEVICEMENU_NEXT):
            self.app.tap(self.LCT.GUIDE_DEVICEMENU_NEXT)
        if self.app.wait_visibility_of_element_located(self.LCT.GUIDE_SERVICEMENU_NEXT):
            self.app.tap(self.LCT.GUIDE_SERVICEMENU_NEXT)

    def sign_in_biocare_app(self, email=None, password=None):
        self.app.wait_visibility_of_element_located(self.LCT.INIT_SKIP)
        self.app.tap(self.LCT.INIT_SKIP)
        if self.app.wait_visibility_of_element_located(self.LCT.INIT_GETSTARTED, timeout=3):
            self.app.tap(self.LCT.INIT_GETSTARTED)
        if self.app.wait_visibility_of_element_located(self.LCT.SIGNIN_ANOTHER_ACCOUNT, timeout=3):
            self.app.tap(self.LCT.SIGNIN_ANOTHER_ACCOUNT)
        self.app.tap(self.LCT.SIGNIN1ST)
        if email:
            self.app.input_text(self.LCT.EMAIL, email, is_tap=True)
        if password:
            self.app.input_text(self.LCT.PASSWORD, password, is_tap=True, is_text_logged=False)
        self.app.hide_keyboard()
        self.app.tap(self.LCT.SIGNIN2ST)
        self.app.wait_invisibility_of_element_located(self.LCT.SIGNIN2ST, timeout=10)
        self.app.wait_invisibility_of_element_located(self.LCT.SYNCING_DATA, timeout=30)
        self._next_home_screen_guide()  # TODO: Return errors if needed

    def get_release_version(self):
        release_version = 'undetected'
        try:
            self.app.taps(self.LCT.TABS, on_elements=lambda i, _: i == 4, stop_on_first=True)
            self.app.tap(self.LCT.PROF_ABOUT_BI0CARE)
            map_attribute = self._map_value(android='content-desc', ios=None)
            release_version = self.app.get_attribute_value(self.LCT.RELEASE_VERSION, map_attribute).split()[1]
        finally:
            return release_version

    def navigate_to_tab(self, tab_name):
        attr = self._map_value(android='content-desc', ios=None)  # TODO: fill ios value
        self.app.wait_visibility_of_all_elements_located(self.LCT.TABS)
        self.app.taps(
            self.LCT.TABS,
            on_elements=lambda _, e: self.app.get_attribute_value(e, attr).lower().startswith(tab_name.lower()),
            stop_on_first=True
        )

    def skip_to_onboarding(self):
        self.app.tap(self.LCT.INIT_SKIP)

    def back_to_sign_in(self):
        self.app.tap(self.LCT.BACK_TO_SIGNIN)

    def set_network_connection_status(self, connection_status):
        self.app.driver.set_network_connection(int(connection_status))

    def register_biocare_app(self, first_name=None, last_name=None, email=None, password=None, confirm_pass=None,
                             create_account=True):
        self.app.wait_visibility_of_all_elements_located(self.LCT.INIT_SKIP)
        self.app.tap(self.LCT.INIT_SKIP)
        self.app.tap(self.LCT.INIT_GETSTARTED)
        self.app.tap(self.LCT.REGISTERNOW)
        if first_name:
            self.app.input_text(self.LCT.FIRST_NAME, first_name)
        if last_name:
            self.app.input_text(self.LCT.LAST_NAME, last_name)
        if email:
            self.app.input_text(self.LCT.REGISTER_EMAIL, email)
        if password:
            self.app.input_text(self.LCT.REGISTER_PASSWORD, password)
        if confirm_pass:
            self.app.input_text(self.LCT.CONFIRM_PASS, confirm_pass)
        if create_account:
            self.app.tap(self.LCT.CREATE_ACCOUNT)

    def get_content_description(self, description):
        attr = self._map_value(android='content-desc', ios=None)
        return self.app.get_attribute_value(self.LCT.CONTENT_DESC + '[@' + attr + '="' + description + '"]',
                                            attr)

    def get_page_description(self, page):
        attr = self._map_value(android='content-desc', ios=None)
        return self.app.get_attribute_value(self.LCT.PAGE + '[@' + attr + '="' + page + '"]',
                                            attr)

    def privacy_policy(self, understood=True, close=False):
        self.app.tap(self.LCT.PRIVACY_POLICY)
        if understood:
            self.app.tap(self.LCT.UNDERSTOOD)
        if close:
            self.app.tap(self.LCT.CLOSE)

    def terms_of_conditions(self, understood=True, close=False):
        self.app.tap(self.LCT.TERMS_AND_CONDITIONS)
        if understood:
            self.app.tap(self.LCT.UNDERSTOOD)
        if close:
            self.app.tap(self.LCT.CLOSE)

    def forgot_password(self, email=None, send=True, verification_code=None, new_password=None, confirm_pass=None,
                        update=True, resend=False):
        self.app.tap(self.LCT.INIT_SKIP)
        self.app.tap(self.LCT.INIT_SIGNIN)
        self.app.tap(self.LCT.FORGOT_PASSWORD)
        if email:
            self.app.input_text(self.LCT.RESET_PASS_EMAIL, email, is_tap=True)
            self.app.hide_keyboard()
        if send:
            self.app.tap(self.LCT.SEND)
        if verification_code:
            self.app.wait_visibility_of_all_elements_located(self.LCT.VERIFICATION_CODE)
            [self.app.input_text(e, str(verification_code)[i], is_tap=True, is_clear=False)
             for i, e in enumerate(self.app.get_elements(self.LCT.VERIFICATION_CODE))]
        if new_password:
            self.app.input_text(self.LCT.NEW_PASS, new_password)
        if confirm_pass:
            self.app.input_text(self.LCT.CONFIRM_NEW_PASS, confirm_pass)
        if update:
            self.app.tap(self.LCT.UPDATE)
        if resend:
            self.app.tap(self.LCT.RESEND_NOW)
