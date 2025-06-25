#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import common as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Common(WebPage):
    """
    Handle login page, left-hand-side main menu
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def navigate_to_callcenter_sign_in_page(self):
        version = 'undetected'
        try:
            self.browser.open_page(self.URL)
            self.browser.wait_visibility_of_element_located('class:login-page-callcenter', timeout=15)
            version = self.browser.get_text(self.LCT.FOOTER).split()[-1][1:]
        finally:
            return version

    def sign_in_callcenter(self, username, password):
        self.browser.wait_visibility_of_element_located(self.LCT.USERNAME, inverse=True)
        self.browser.wait_visibility_of_element_located(self.LCT.PASSWORD, inverse=True)
        self.browser.input_text(self.LCT.USERNAME, username)
        self.browser.input_text(self.LCT.PASSWORD, password, is_text_logged=False)
        self.browser.click(self.LCT.SIGNIN)
        time.sleep(10)
        if self.browser.wait_visibility_of_element_located('class:app', timeout=10):
            return self.browser.execute_script('return window.localStorage.getItem("accessToken")')
        return self.browser.get_text(self.LCT.SIGNIN_ERROR_MSG)

    def sign_out_callcenter(self):
        self.browser.click(self.LCT.AVATAR)
        self.browser.wait_visibility_of_element_located(self.LCT.SIGNOUT)
        self.browser.click(self.LCT.SIGNOUT)

    def change_password_callcenter(self,oldpassword, newpassword, confirmpassword):
        self.browser.click(self.LCT.AVATAR)
        self.browser.wait_visibility_of_element_located(self.LCT.CHANGEPW)
        self.browser.click(self.LCT.CHANGEPW)
        self.browser.wait_visibility_of_element_located(self.LCT.CHANGEPWHEADER)
        self.browser.input_text(self.LCT.OLDPASSWORD, oldpassword)
        self.browser.input_text(self.LCT.NEWPASSWORD, newpassword)
        self.browser.input_text(self.LCT.CONFIRMPASSWORD, confirmpassword)
        self.browser.click(self.LCT.CHANGEPASSWORD)

    def get_text_error_message_old_password(self):
        old_error_message = self.browser.get_text(self.LCT.OLDPASSWORD_ERROR_MSG)
        return old_error_message

    def get_text_error_message_new_password(self):
        new_error_message = self.browser.get_text(self.LCT.NEWPASSWORD_ERROR_MSG)
        return new_error_message

    def get_text_error_message_confirm_password(self):
        confirm_error_message = self.browser.get_text(self.LCT.CONFIRMPASSWORD_ERROR_MSG)
        return confirm_error_message

    def close_change_password_modal(self):
        self.browser.wait_visibility_of_element_located(self.LCT.CLOSE_CHANGEPW)
        self.browser.click(self.LCT.CLOSE_CHANGEPW)

    def navigate_to_callcenter_menu(self, menu):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU) and self.browser.get_elements(self.LCT.MENU)[0].is_displayed():
                self.browser.clicks(self.LCT.MENU, on_elements=lambda _, e: self.browser.get_text(e).lower() == menu.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def wait_study_information_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDYINFO_CONTENT_ROOT) and self.browser.get_elements(self.LCT.STUDYINFO_CONTENT_ROOT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDYINFO_CONTENT_ROOT, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def get_study_information(self, is_close=True):  # TBD
        self.wait_study_information_available()
        root_output = self.browser.get_texts(self.LCT.STUDYINFO_CONTENT_ROOT)
        root_output = {v.split('\n')[0]: v.split('\n')[1:] for v in root_output}
        output = dict()
        study_info = root_output['STUDY INFORMATION']
        study_info.remove('Zip file') if self.browser.wait_visibility_of_element_located(
            self.LCT.STUDYINFO_ZIPFILE, timeout=3) and 'Zip file' in study_info else study_info  # remove Zipfile
        study_info.remove('EOL') if self.browser.wait_visibility_of_element_located(
            self.LCT.STUDYINFO_CONTENT_CONTENT_RMATAG, timeout=3) and 'EOL' in study_info else study_info  # remove EOL tag
        study_info.remove('FO') if self.browser.wait_visibility_of_element_located(
            self.LCT.STUDYINFO_CONTENT_CONTENT_FOLLOWONTAG, timeout=3) and 'FO' in study_info else study_info  # remove FO tag
        study_info.remove('Potentially lost') if self.browser.wait_visibility_of_element_located(
            self.LCT.STUDYINFO_CONTENT_POTENTIALLY, timeout=3) and 'Potentially lost' in study_info else study_info  # Potentially lost tag
        # Reformat artifact if contains warning tag
        if self.browser.wait_visibility_of_element_located(self.LCT.STUDYINFO_CONTENT_ARTIFACTTAG, timeout=3):
            artifact_tag = study_info.pop(-1)  # pop and assign artifact tag
            output['STUDY INFORMATION'] = {study_info[i]: study_info[i + 1] for i in range(0, len(study_info), 2)}
            output['STUDY INFORMATION'].update({'Artifact Tag': artifact_tag})  # Add tag into list
        else:
            output['STUDY INFORMATION'] = {study_info[i].replace(':', ''): study_info[i + 1] for i in range(0, len(
                study_info), 2)}
        output['STUDY INFORMATION'].update({'EOL': True if self.browser.wait_visibility_of_element_located(
            self.LCT.STUDYINFO_CONTENT_CONTENT_RMATAG, timeout=3) else False})  # add EOL tag
        # FOLLOW-ON STUDY TRACKING if available
        if 'FOLLOW-ON STUDY TRACKING' in root_output:
            study_tracking = root_output['FOLLOW-ON STUDY TRACKING']
            output['FOLLOW-ON STUDY TRACKING'] = {study_tracking[i].replace(':', ''): study_tracking[i + 1] for i in
                                                  range(0, len(study_tracking), 2)}
        study_notes = root_output['STUDY NOTES']
        output['STUDY NOTES'] = study_notes
        phy_notes = root_output['PHYSICIAN AMENDMENTS NOTES']
        output['PHYSICIAN AMENDMENTS NOTES'] = phy_notes
        ref_phy = root_output['REFERRING PHYSICIAN']
        output['REFERRING PHYSICIAN'] = {ref_phy[i].replace(':', ''): ref_phy[i + 1] for i in range(0, len(ref_phy), 2)}
        inter_phy = root_output['INTERPRETING PHYSICIAN']
        output['INTERPRETING PHYSICIAN'] = {inter_phy[i].replace(':', ''): inter_phy[i + 1] for i in range(
            0, len(inter_phy), 2)}
        if is_close:
            self.browser.click(self.LCT.STUDYINFO_CLOSE)
        self.logger.info(output)
        return output

    def wait_devices_information_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.DEVICEINFO_CONTENT_ROOT) and self.browser.get_elements(self.LCT.DEVICEINFO_CONTENT_ROOT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.DEVICEINFO_CONTENT_ROOT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def get_device_information(self, is_close=True):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEVICEINFO_CONTENT_ROOT)
        root_output = self.browser.get_texts(self.LCT.DEVICEINFO_CONTENT_ROOT)
        root_output = {v.split('\n')[0]: v.split('\n')[1:] for v in root_output}
        output = dict()
        values = root_output['GENERAL INFO']
        output['GENERAL INFO'] = {values[i].replace(':', ''): values[i + 1] for i in range(0, len(values), 2)}
        values = root_output['LAST SYNCED STATUS']
        output['LAST SYNCED STATUS'] = {values[i].replace(':', ''): values[i + 1] for i in range(0, len(values), 2)}
        if is_close:
            self.browser.click(self.LCT.DEVICEINFO_CLOSE)
        return output

    def go_to_study_management(self):
        self.browser.wait_visibility_of_element_located(self.LCT.STUDYINFO_CONTENT_ROOT + '/../..')
        self.browser.click(self.LCT.STUDYINFO_GOTOSTUDYMANAGE, is_scroll=True)
        self.browser.switch_tab()

    def wait_patient_information_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_CONTENT_ROOT) and self.browser.get_elements(self.LCT.PTDET_CONTENT_ROOT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.PTDET_CONTENT_ROOT, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def get_patient_details(self, is_close=True):
        self.wait_patient_information_available()
        root_output = self.browser.get_texts(self.LCT.PTDET_CONTENT_ROOT)
        root_output = {v.split('\n')[0]: v.split('\n')[1:] for v in root_output}
        output = dict()
        values = root_output['PATIENT INFORMATION']
        output['PATIENT INFORMATION'] = {values[i].replace(':', ''): values[i + 1] for i in range(0, len(values), 2)}
        values = root_output['PATIENT CONTACT']
        output['PATIENT CONTACT'] = {values[i].replace(':', ''): values[i + 1] for i in range(0, len(values), 2)}
        values = root_output['DIAGNOSIS INFORMATION']
        output['DIAGNOSIS INFORMATION'] = {values[i].replace(':', ''): values[i + 1] for i in range(0, len(values), 2)}
        if is_close:
            self.browser.click(self.LCT.PTDET_CLOSEICON)
        return output

    def get_current_page_header(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.PAGEHEADER) and self.browser.get_element(self.LCT.PAGEHEADER).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.PAGEHEADER, inverse=True)
                return self.browser.get_text(self.LCT.PAGEHEADER)
            elif time.time() - start_time > 1 * 60:
                break

    def close_info_view(self):
        """
        Close information view
        :return:
        """
        self.browser.clicks(self.LCT.DEVICE_INFO_CLOSE, on_elements=lambda _, e: e.is_displayed(), stop_on_first=True)

    def get_device_info_view(self, is_close=True):
        """
        Get patient info
        :param is_close: (bool) post-close the info view
        :return: (dict)
        """
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DEVICE_INFO_HEADER)
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

    # def navigate_to_page(self, page=None):
    #     """
    #     Navigate to page
    #     """
    #     if page:
    #         self.browser.open_page(self.URL + '/' + page)

    def get_filter_facilities_options(self):
        """
        Get all options of filter values
        :return: (dict) list of all options of filter values
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.PAGE_FACILITY_ELEMENT + '/../../..') and self.browser.get_element(self.LCT.PAGE_FACILITY_ELEMENT + '/../../..').is_displayed():
                output = dict()
                self.browser.click(self.LCT.PAGE_FACILITY_ELEMENT + '/../../..')
                time.sleep(1)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.PAGE_FACILITY_OPTIONS)
                output['Facilities'] = self.browser.get_texts(self.LCT.PAGE_FACILITY_OPTIONS)
                return output
            elif time.time() - start_time > 5 * 60:
                break

    def get_current_filter_values(self):
        """
        Get all current filter values on page
        :return: (dict) list of current filter values
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.PAGE_FACILITY_ELEMENT + '/../../..') and self.browser.get_element(self.LCT.PAGE_FACILITY_ELEMENT + '/../../..').is_displayed():
                output = {
                    'Facility': self.browser.get_text(self.LCT.PAGE_FACILITY_ELEMENT + '/../../..'),
                }
                self.browser.wait_visibility_of_element_located(self.LCT.PAGE_FACILITY_ELEMENT + '/../../..', inverse=True)
                return output
            elif time.time() - start_time > 1 * 60:
                break

    def get_header_facility_information(self):
        """
        Get current facility info on page
        :return: (dict) list of current filter values
        """
        self.browser.wait_visibility_of_element_located(self.LCT.PAGE_FACILITY_HEADER)
        return self.browser.get_text(self.LCT.PAGE_FACILITY_HEADER)

    def get_current_pagination(self):
        self.wait_for_data_available()
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_visibility_of_element_located(self.LCT.BYROW)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PGN_PAGENUM)
        output = dict()
        if self.browser.wait_visibility_of_element_located(self.LCT.BYROW) and self.browser.get_element(self.LCT.BYROW).is_displayed():
            output['Rows'] = self.browser.get_text(self.LCT.BYROW)
        output['Page'] = self.browser.get_text(
            self.browser.get_elements_by_condition(
                self.LCT.PGN_PAGENUM, on_elements=lambda _, e: 'filled' in self.browser.get_attribute_value(
                    e, 'class').lower(), stop_on_first=True)[0]
        )
        return output

    def pagination_reports(self, next_or_previous=None, page_number=None, is_wait=True):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_NEXT)
                self.browser.js_click(self.LCT.PGN_NEXT)
                self.wait_for_data_available()
                break
            if next_or_previous == 'previous':
                self.browser.wait_visibility_of_element_located(self.LCT.PGN_PREVIOUS)
                self.browser.js_click(self.LCT.PGN_PREVIOUS)
                self.wait_for_data_available()
                break
        if page_number:
            self.browser.js_clicks(self.LCT.PGN_PAGENUM,
                                   on_elements=lambda e, _: self.browser.get_text(e) == page_number,
                                   stop_on_first=True)
            # Utils.wait_until(self.browser.get_text, self.browser.get_elements_by_condition(
            #     self.LCT.PGN_PAGENUM, on_elements=lambda _, e: 'filled-btn' in self.browser.get_attribute_value(
            #         e, 'class').lower(), stop_on_first=True)[0], on_condition=lambda _, e: e.lower() == page_number)

    def custom_reports_size_rows(self, rows):
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_attribute_value_to_be(self.LCT.PGN_PAGENUM, 'class', 'active')
        self.browser.execute_script("arguments[0].click();", self.browser.get_element(self.LCT.BYROW))
        self.browser.execute_script('window.scrollTo(0,2500)')
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BYROW_OPTIONS)
        self.browser.clicks(self.LCT.BYROW_OPTIONS,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == rows.lower(),
                            stop_on_first=True, is_scroll=True)

    def wait_for_data_available(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.DATA_CONTENT, inverse=True)

    def sign_in_clinic(self, username, password, url_clinic=None):
        self.browser.open_page(url_clinic)
        if not self.browser.wait_url_matches(r'^https:[/][/].*[/]sign-in', timeout=15):
            raise Exception(
                f'Redirecting to biocare sign-in page got issue, current url: {self.browser.driver.current_url}')
        self.browser.wait_visibility_of_element_located(self.LCT.USERNAME_CLINIC, inverse=True)
        self.browser.input_text(self.LCT.USERNAME_CLINIC, username)
        self.browser.wait_visibility_of_element_located(self.LCT.PASSWORD_CLINIC, inverse=True)
        self.browser.input_text(self.LCT.PASSWORD_CLINIC, password, is_text_logged=False)
        self.browser.click(self.LCT.SIGNIN_CLINIC)
        self.browser.wait_staleness_of(self.browser.get_element(self.LCT.SIGNIN_LOADING))
        if self.browser.wait_url_matches(r'^https:[/][/].*[/]dashboard', timeout=15):
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
        return self.browser.get_text(self.LCT.ERRORMESSAGE1ST)

    def get_release_version_clinic(self):
        version = 'undetected'
        try:
            version = self.browser.get_text(self.LCT.RELEASE_VERSION).split()[-1][1:]
        finally:
            return version

    def get_event_information(self, is_close=True):  # TBD
        self.browser.wait_visibility_of_all_elements_located(self.LCT.STUDYINFO_CONTENT_ROOT)
        root_output = self.browser.get_texts(self.LCT.STUDYINFO_CONTENT_ROOT)
        root_output = {v.split('\n')[0]: v.split('\n')[1:] for v in root_output}
        output = dict()
        event_info = root_output['EVENT INFORMATION']
        output['EVENT INFORMATION'] = {event_info[i].replace(':', ''): event_info[i + 1] for i in range(0, len(event_info), 2)}
        technician_comment = root_output['TECHNICIAN COMMENTS']
        output['TECHNICIAN COMMENTS'] = technician_comment
        if is_close:
            self.browser.wait_visibility_of_element_located(self.LCT.STUDYINFO_CLOSE, inverse=True)
            self.browser.click(self.LCT.STUDYINFO_CLOSE)
        return output

    def sign_in_erp_page(self, username, password):
        self.browser.open_page('https://erp.customer.biotricity.com/portal')
        self.browser.wait_visibility_of_element_located('class:login-page', timeout=15)
        self.browser.click(self.LCT.ERP_LOGIN_PAGE)
        # time.sleep(5)
        # self.browser.wait_visibility_of_element_located(self.LCT.ERP_LOGIN_PAGE_NEXT, inverse=True)
        # self.browser.click(self.LCT.ERP_LOGIN_PAGE_NEXT)
        # start_time = time.time()
        # while True:
        #     if self.browser.wait_visibility_of_element_located()
        self.browser.wait_visibility_of_element_located(self.LCT.ERP_USERNAME, inverse=True)
        self.browser.input_text(self.LCT.ERP_USERNAME, username)
        self.browser.wait_visibility_of_element_located(self.LCT.ERP_USERNAME, inverse=True)
        self.browser.click(self.LCT.ERP_LOGIN_PAGE_NEXT)
        self.browser.wait_visibility_of_element_located(self.LCT.ERP_PASSWORD, inverse=True)
        self.browser.input_text(self.LCT.ERP_PASSWORD, password)
        self.browser.wait_visibility_of_element_located(self.LCT.ERP_PASSWORD, inverse=True)
        self.browser.click(self.LCT.ERP_LOGIN_PAGE_NEXT)
        self.browser.wait_visibility_of_element_located(self.LCT.ERP_LOGIN_PAGE_NEXT, inverse=True)
        self.browser.click(self.LCT.ERP_LOGIN_PAGE_NEXT)
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ERP_SKIP_SETUP) and self.browser.get_element(self.LCT.ERP_SKIP_SETUP).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ERP_SKIP_SETUP, inverse=True)
                self.browser.click(self.LCT.ERP_SKIP_SETUP)
                self.browser.wait_visibility_of_element_located(self.LCT.ERP_SKIP_SETUP, inverse=True)
                self.browser.click(self.LCT.ERP_LOGIN_PAGE_NEXT)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def navigate_to_erp_repo(self, repo):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.ERP_MENU_REPO) and self.browser.get_elements(self.LCT.ERP_MENU_REPO)[0].is_displayed():
                self.browser.clicks(self.LCT.ERP_MENU_REPO, on_elements=lambda _, e: self.browser.get_text(e).lower() == repo.lower(),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 1 * 60:
                break

    def back_from_page(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_BACK, inverse=True)
        self.browser.click(self.LCT.ELEMENT_BACK)


