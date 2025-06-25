#!/usr/bin/env python3
import time

try:
    from project_bioflux_clinic_portal.lib.WebPage import WebPage
    from project_bioflux_clinic_portal.config.web_locators import common as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    """
    Handle login page, left-hand-side main menu and headers
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def sign_in_bioflux(self, username, password):
        """
        Sign in to Bioflux
        @param username: (str)
        @param password: (str)
        @return: access-token if login is successful, error message if login is unsuccessful
        """
        self.browser.open_page(self.URL)
        if not self.browser.wait_url_matches(r'^https:[/][/].*[/]sign-in', timeout=10):
            raise Exception(
                f'Redirecting to biocare sign-in page got issue, current url: {self.browser.driver.current_url}')
        self.browser.wait_visibility_of_element_located(self.LCT.USERNAME, inverse=True)
        self.browser.input_text(self.LCT.USERNAME, username)
        # self.browser.wait_visibility_of_element_located(self.LCT.PASSWORD, inverse=True)
        self.browser.input_text(self.LCT.PASSWORD, password, is_text_logged=False)
        self.browser.click(self.LCT.SIGNIN)
        self.browser.wait_staleness_of(self.browser.get_element(self.LCT.SIGNIN_LOADING))
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ICONSHORTCUT) and self.browser.get_element(self.LCT.ICONSHORTCUT).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ICONSHORTCUT, inverse=True)
                self.browser.click(self.LCT.ICONSHORTCUT)
                self.browser.switch_tab()
                if self.browser.wait_visibility_of_element_located(self.LCT.POPUP_VIDEO, timeout=10) and self.browser.get_element(self.LCT.POPUP_VIDEO).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.POPUP_GOT_IT_VIDEO)
                    self.browser.click(self.LCT.POPUP_GOT_IT_VIDEO)
                self.browser.execute_script('window.localStorage.setItem("isShowMarketingBanner", false)')
                self.browser.execute_script('window.localStorage.setItem("willViewTutorialLater", false)')
                self.browser.execute_script('window.localStorage.setItem("willShowWhatNewPopup", false)')
                self.browser.execute_script('window.localStorage.setItem("isCheckedNotiCommonQuestions", true)')
                return ''.join([item['value'] for item in self.browser.get_all_cookies() if item['name'].endswith(
                    'accessToken')])
            elif time.time() - start_time > 1 * 60:
                return self.browser.get_text(self.LCT.ERRORMESSAGE1ST)

    def get_release_version(self):
        version = 'undetected'
        try:
            version = self.browser.get_text(self.LCT.RELEASE_VERSION).split()[-1][1:]
        finally:
            return version

    def navigate_to_top_menu(self, item):
        """
        Navigate to top menu: Inbox, Studies, Reports, Devices, Support, Events
        :param item: (str) inbox / studies / reports / devices / support / events
        :return: None
        """
        self.browser.clicks(self.LCT.TOP_MENU_ITEMS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == item.lower(),
                            stop_on_first=True)

    def navigate_to_bottom_menu(self, item):
        """
        Navigate to bottom menu: What's New, Notifications, Avatar
        :param item: whatsnew / notifications / avatar
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.BOTTOM_MENU_WHATSNEW)
        self.browser.wait_visibility_of_element_located(self.LCT.BOTTOM_MENU_NOTIFICATIONS)
        self.browser.wait_visibility_of_element_located(self.LCT.BOTTOM_MENU_AVATAR)
        map_locator = {
            'whatsnew': self.LCT.BOTTOM_MENU_WHATSNEW,
            'notifications': self.LCT.BOTTOM_MENU_NOTIFICATIONS,
            'avatar': self.LCT.BOTTOM_MENU_AVATAR
        }
        self.browser.click(map_locator[item.lower()])

    def navigate_to_profile(self):
        self.navigate_to_bottom_menu('avatar')
        self.browser.wait_visibility_of_element_located(self.LCT.AVATAR_USERNAME)
        self.browser.click(self.LCT.AVATAR_USERNAME)

    def change_language(self, language):
        """
        Change language
        :param language: (str)
        :return: None
        """
        self.navigate_to_bottom_menu('avatar')
        self.browser.click(self.LCT.AVATAR_LANG)
        self.browser.clicks(self.LCT.AVATAR_LANG_SELECTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == language.lower(),
                            stop_on_first=True)

    def sign_out_bioflux(self):
        """
        Sign out
        :return: None
        """
        self.navigate_to_bottom_menu('avatar')
        self.browser.wait_visibility_of_element_located(self.LCT.AVATAR_SIGNOUT)
        self.browser.click(self.LCT.AVATAR_SIGNOUT)
        self.browser.wait_url_matches(r'^https:[/][/]biocare[.].*/sign-in')

    def get_current_facility(self):
        """
        Get current facility
        :return: (str) the current facility
        """
        self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_CURRENT)
        return self.browser.get_text(self.LCT.FACILITY_CURRENT)

    def select_facility(self, facility, text_search=None):
        """
        Select the facility
        :param facility: (str) the facility to select
        :param text_search: (str) search text before select
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_CURRENT, inverse=True)
        if text_search:
            self.browser.input_text(self.LCT.FACILITY_INPUT, str(text_search))
        else:
            self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_SELECTIONS, timeout=5)
            self.browser.click(self.LCT.FACILITY_CURRENT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_SELECTIONS)
        self.browser.clicks(self.LCT.FACILITY_SELECTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                            stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_CURRENT, inverse=True)
        # self._ok_attention_if_any()

    def get_patient_info_view(self, is_close=True):
        """
        Get patient info
        :param is_close: (bool) post-close the info view
        :return: (dict)
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PATIENT_INFO_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PATIENT_INFO_SUBHEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PATIENT_INFO_SUBCONTENT)
        header_elements = [e for e in self.browser.get_elements(self.LCT.PATIENT_INFO_HEADER) if e.is_displayed()]
        _data = {}
        for header_element in header_elements:
            header = self.browser.get_texts(
                self.browser.get_child_elements(header_element, self.LCT.PATIENT_INFO_SUBHEADER)
            )
            content = self.browser.get_texts(
                self.browser.get_child_elements(header_element, self.LCT.PATIENT_INFO_SUBCONTENT)
            )
            _data[self.browser.get_text(header_element)] = {key.replace(':', ''): value
                                                            for key, value in zip(header, content)}
        if is_close:
            self.close_info_view()
        return _data

    def get_study_info_view(self, is_close=True):
        """
        Get study info
        :param is_close: (bool) post-close the info view
        :return: (dict)
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_INFO_HEADER)
        header_elements = self.browser.get_elements(self.LCT.STUDY_INFO_HEADER)
        _data = {}
        for header_element in header_elements:
            key = self.browser.get_text(self.browser.get_child_element(header_element,  self.LCT.STUDY_INFO_TITLE))
            _values = self.browser.get_texts(
                self.browser.get_child_elements(header_element, self.LCT.STUDY_INFO_DATA_RAW)
            )
            _data[key] = {
                _value.split('\n')[0].replace(':', ''):
                    '\n'.join(_value.split('\n')[1:]).replace('\n', ' | ') if _value.count('\n') > 0 else ''
                for _value in _values
            } if len(_values) > 0 else None
        if is_close:
            self.close_info_view()
        # print('check data', _data)
        return _data

    def get_device_info_view(self, is_close=True):
        """
        Get patient info
        :param is_close: (bool) post-close the info view
        :return: (dict)
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEVICE_INFO_HEADER, timeout=10)
        header_elements = [e for e in self.browser.get_elements(self.LCT.DEVICE_INFO_HEADER) if e.is_displayed()]
        _data = {}
        for header_element in header_elements:
            header = self.browser.get_texts(
                self.browser.get_child_elements(header_element, self.LCT.DEVICE_INFO_SUBHEADER)
            )
            content = self.browser.get_texts(
                self.browser.get_child_elements(header_element, self.LCT.DEVICE_INFO_SUBCONTENT)
            )
            _data[self.browser.get_text(header_element)] = {key.replace(':', ''): value
                                                            for key, value in zip(header, content)}
        if is_close:
            self.close_info_view()
        return _data

    def close_info_view(self):
        """
        Close information view
        :return:
        """
        self.browser.clicks(self.LCT.DEVICE_INFO_CLOSE, on_elements=lambda _, e: e.is_displayed(), stop_on_first=True)

    def go_to_study_management(self):
        self.browser.wait_visibility_of_element_located(self.LCT.DEVICE_INFO_HEADER)
        self.browser.click(self.LCT.STUDY_INFO_GOTOSTUDYMANAGE, is_scroll=True)
        self.browser.switch_tab()

    def get_user_roles(self):
        """
        Get roles of current user
        :return: (list) list of role
        """
        return self.browser.execute_script('return window.localStorage.getItem("roles")')

    def get_page_header(self):
        """
        Get page header
        :return: (str)
        """
        self.browser.wait_visibility_of_element_located(self.LCT.PAGE_HEADER)
        return self.browser.get_text(self.LCT.PAGE_HEADER).upper()

    def get_error_messages(self):
        """
        Get error messages
        :return: (list)
        """
        return self.browser.get_texts(self.LCT.ERRORMSG)

    def get_toast_success_message(self):
        """
        Get success message from toast-bottom-left-message field
        :return: (str) Success message
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.TOAST_SUCCESSMSG) and self.browser.get_element(self.LCT.TOAST_SUCCESSMSG).is_displayed():
                return self.browser.get_text(self.LCT.TOAST_SUCCESSMSG)
            elif time.time() - start_time > 1 * 60:
                break

    def get_toast_error_message(self):
        """
        Get error message from toast-bottom-left-message field
        :return: (str) Error message
        """
        self.browser.wait_presence_of_element_located(self.LCT.TOAST_ERRORMSG)
        return self.browser.get_text(self.LCT.TOAST_ERRORMSG)

    def forgot_password(self, username=None, is_forgot_password=True, is_cancel=False, go_back=False):
        if self.browser.wait_visibility_of_element_located(self.LCT.FORGOT_PASSWORD, timeout=2):
            self.browser.click(self.LCT.FORGOT_PASSWORD)
        if username is not None:
            self.browser.input_text(self.LCT.FORGOT_PASSWORD_USERNAME, username)
        if is_forgot_password:
            self.browser.click(self.LCT.FORGOT_PASSWORD_CONFIRM)
            return self.browser.get_text('class:email-sent-text')
        if is_cancel:
            self.browser.click(self.LCT.FORGOT_PASSWORD_CANCEL)
        if go_back:
            self.browser.click(self.LCT.FORGOT_PASSWORD_GOBACK)

    # def select_facility_devices(self, facility, text_search=None):
    #     """
    #     Select the facility of page devices
    #     :param facility: (str) the facility to select
    #     :param text_search: (str) search text before select
    #     :return: None
    #     """
    #     self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_CURRENT)
    #     if text_search:
    #         self.browser.input_text(self.LCT.FACILITY_INPUT, str(text_search))
    #     else:
    #         self.browser.click(self.LCT.FACILITY_CURRENT)
    #         self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_SELECTIONS_DEVICES, inverse=True)
    #     self.browser.clicks(self.LCT.FACILITY_SELECTIONS_DEVICES,
    #                         on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
    #                         stop_on_first=True)
    #     self._ok_attention_if_any()

    def select_facility_studies(self, facility, text_search=None):
        """
        Select the facility of page devices
        :param facility: (str) the facility to select
        :param text_search: (str) search text before select
        :return: None
        """
        self.browser.wait_visibility_of_element_located(self.LCT.FACILITY_CURRENT)
        if text_search:
            self.browser.input_text(self.LCT.FACILITY_INPUT, str(text_search))
        else:
            self.browser.click(self.LCT.FACILITY_CURRENT)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.FACILITY_SELECTIONS_STUDIES)
        self.browser.clicks(self.LCT.FACILITY_SELECTIONS_STUDIES,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == facility.lower(),
                            stop_on_first=True)
        self._ok_attention_if_any()

    def navigate_to_other_page(self, page):
        """
        Navigate to other page via url
        :return: None
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.OTHER_PAGE)
        self.browser.clicks(self.LCT.OTHER_PAGE,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == page.lower(),
                            stop_on_first=True)
        self._ok_attention_if_any(timeout=3)

    def navigate_to_callcenter_sign_in_page(self, url_callcenter=None):
        version = 'undetected'
        try:
            self.browser.open_page(url_callcenter)
            self.browser.wait_visibility_of_element_located('class:login-page-callcenter', timeout=10)
            version = self.browser.get_text(self.LCT.FOOTER).split()[-1][1:]
        finally:
            return version

    def sign_in_callcenter(self, username, password):
        self.browser.wait_visibility_of_element_located(self.LCT.USERNAME_CALLCENTER, inverse=True)
        self.browser.input_text(self.LCT.USERNAME_CALLCENTER, username)
        self.browser.wait_visibility_of_element_located(self.LCT.PASSWORD_CALLCENTER, inverse=True)
        self.browser.input_text(self.LCT.PASSWORD_CALLCENTER, password, is_text_logged=False)
        self.browser.click(self.LCT.SIGNIN_CALLCENTER)
        if self.browser.wait_visibility_of_element_located('class:app', timeout=10):
            return self.browser.execute_script('return window.localStorage.getItem("accessToken")')
        return self.browser.get_text(self.LCT.SIGNIN_ERROR_MSG)

    def navigate_to_direct_sign_in_page(self, url_direct=None):
        version = 'undetected'
        try:
            self.browser.open_page(url_direct)
            self.browser.wait_visibility_of_element_located('class:login-page-callcenter', timeout=10)
            version = self.browser.get_text(self.LCT.FOOTER_DIRECT).split()[-1][1:]
        finally:
            return version

    def sign_in_direct(self, username, password):
        self.browser.wait_visibility_of_element_located(self.LCT.USERNAME_CALLCENTER, inverse=True)
        self.browser.input_text(self.LCT.USERNAME_CALLCENTER, username)
        self.browser.wait_visibility_of_element_located(self.LCT.PASSWORD_CALLCENTER, inverse=True)
        self.browser.input_text(self.LCT.PASSWORD_CALLCENTER, password, is_text_logged=False)
        self.browser.wait_visibility_of_element_located(self.LCT.SIGNIN_CALLCENTER)
        self.browser.click(self.LCT.SIGNIN_CALLCENTER)
        if self.browser.wait_visibility_of_element_located('class:app', timeout=10):
            return self.browser.execute_script('return window.localStorage.getItem("accessToken")')
        # return self.browser.get_text(self.LCT.SIGNIN_ERROR_MSG)

    # def sign_in_clinic(self, username, password, url_clinic=None):
    #     self.browser.open_page(url_clinic)
    #     if not self.browser.wait_url_matches(r'^https:[/][/].*[/]sign-in', timeout=15):
    #         raise Exception(
    #             f'Redirecting to biocare sign-in page got issue, current url: {self.browser.driver.current_url}')
    #     self.browser.wait_visibility_of_element_located(self.LCT.USERNAME, inverse=True)
    #     self.browser.input_text(self.LCT.USERNAME, username)
    #     self.browser.wait_visibility_of_element_located(self.LCT.PASSWORD, inverse=True)
    #     self.browser.input_text(self.LCT.PASSWORD, password, is_text_logged=False)
    #     self.browser.click(self.LCT.SIGNIN)
    #     self.browser.wait_staleness_of(self.browser.get_element(self.LCT.SIGNIN_LOADING))
    #     if self.browser.wait_url_matches(r'^https:[/][/].*[/]dashboard', timeout=10):
    #         self.browser.click(self.LCT.ICONSHORTCUT)
    #         self.browser.switch_tab()
    #         if self.browser.wait_visibility_of_element_located(self.LCT.POPUP_VIDEO, timeout=10) and self.browser.get_element(self.LCT.POPUP_VIDEO).is_displayed():
    #             self.browser.wait_visibility_of_element_located(self.LCT.POPUP_GOT_IT_VIDEO)
    #             self.browser.click(self.LCT.POPUP_GOT_IT_VIDEO)
    #         self.browser.execute_script('window.localStorage.setItem("isShowMarketingBanner", false)')
    #         self.browser.execute_script('window.localStorage.setItem("willViewTutorialLater", false)')
    #         self.browser.execute_script('window.localStorage.setItem("willShowWhatNewPopup", false)')
    #         self.browser.execute_script('window.localStorage.setItem("isCheckedNotiCommonQuestions", true)')
    #         return ''.join([item['value'] for item in self.browser.get_all_cookies() if item['name'].endswith(
    #             'accessToken')])
    #     return self.browser.get_text(self.LCT.ERRORMESSAGE1ST)

    def wait_report_pdf_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_PDF) and self.browser.get_element(
                    self.LCT.STUDY_REPORT_PDF).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.STUDY_REPORT_PDF, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:  # 5 minutes in seconds
                break

    def edit_inbox_detail_report_status(self, status=None):
        self.wait_report_pdf_available()
        if status:
            self.browser.wait_visibility_of_element_located(self.LCT.STUDY_INBOX_REPORT_STATUS)
            self.browser.click(self.LCT.STUDY_INBOX_REPORT_STATUS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDY_INBOX_REPORT_STATUS_OPTION)
            self.browser.clicks(self.LCT.STUDY_INBOX_REPORT_STATUS_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == status.lower(),
                                stop_on_first=False)
            return self.browser.get_texts(self.LCT.STUDY_INBOX_REPORT_STATUS_OPTION)

    def get_current_inbox_report_status(self):
        self.wait_report_pdf_available()
        self.browser.wait_visibility_of_element_located(self.LCT.STUDY_INBOX_REPORT_STATUS, inverse=True)
        return self.browser.get_text(self.LCT.STUDY_INBOX_REPORT_STATUS)

    def sign_in_diagnostics(self, username, password, url_diagnostics=None):
        self.browser.open_page(url_diagnostics)
        if not self.browser.wait_url_matches(r'^https:[/][/].*[/]sign-in', timeout=10):
            raise Exception(
                f'Redirecting to biocare sign-in page got issue, current url: {self.browser.driver.current_url}')
        self.browser.wait_visibility_of_element_located(self.LCT.USERNAME, inverse=True)
        self.browser.input_text(self.LCT.USERNAME, username)
        self.browser.wait_visibility_of_element_located(self.LCT.PASSWORD, inverse=True)
        self.browser.input_text(self.LCT.PASSWORD, password, is_text_logged=False)
        self.browser.click(self.LCT.SIGNIN)
        self.browser.wait_staleness_of(self.browser.get_element(self.LCT.SIGNIN_LOADING))
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ICONSHORTCUT) and self.browser.get_element(self.LCT.ICONSHORTCUT).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ICONSHORTCUT, inverse=True)
                self.browser.click(self.LCT.ICONSHORTCUT)
                self.browser.switch_tab()
                if self.browser.wait_visibility_of_element_located(self.LCT.POPUP_VIDEO, timeout=10) and self.browser.get_element(self.LCT.POPUP_VIDEO).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.POPUP_GOT_IT_VIDEO)
                    self.browser.click(self.LCT.POPUP_GOT_IT_VIDEO)
                self.browser.execute_script('window.localStorage.setItem("isShowMarketingBanner", false)')
                self.browser.execute_script('window.localStorage.setItem("willViewTutorialLater", false)')
                self.browser.execute_script('window.localStorage.setItem("willShowWhatNewPopup", false)')
                self.browser.execute_script('window.localStorage.setItem("isCheckedNotiCommonQuestions", true)')
                return ''.join([item['value'] for item in self.browser.get_all_cookies() if item['name'].endswith(
                    'accessToken')])
            elif time.time() - start_time > 1 * 60:
                return self.browser.get_text(self.LCT.ERRORMESSAGE1ST)

    def sign_in_bioflux_1(self, username,password, studyID):
        self.browser.input_text(self.LCT.username_1, username)
        self.browser.input_text(self.LCT.password_1, password)
        self.browser.click(self.LCT.signin_1)
        time.sleep(10)
        self.browser.wait_visibility_of_element_located(self.LCT.signin_diagnostics,)
        self.browser.click(self.LCT.signin_diagnostics)
        time.sleep(10)
        self.browser.wait_visibility_of_element_located(self.LCT.click_icon, )
        self.browser.switch_tab()
        self.browser.click(self.LCT.click_studies)
        self.browser.click(self.LCT.click_filter_patient_name)
        self.browser.wait_visibility_of_element_located(self.LCT.click_filter_study_ID, )
        self.browser.click(self.LCT.click_filter_study_ID)
        self.browser.click(self.LCT.click_textbox_search)
        self.browser.wait_visibility_of_element_located(self.LCT.click_textbox_search, )
        self.browser.input_text(self.LCT.click_textbox_search, studyID)
        self.browser.wait_visibility_of_element_located(self.LCT.click_textbox_search, )
        self.browser.click(self.LCT.click_button_openstudy)

        time.sleep(5)
        # self.browser.click(self.LCT.click_icon, )
        # self.browser.click(self.LCT.click_signout)

        time.sleep(20)
