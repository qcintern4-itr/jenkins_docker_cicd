#!/usr/bin/env python3
import time
import re
from platform import system

try:
    from project_bioflux_ai_report_portal.lib.WebPage import WebPage
    from project_bioflux_ai_report_portal.config.web_locators import common as locators
    from corelib import Utils
    from datetime import datetime, timedelta
    from selenium.webdriver import Keys
    import pyotp

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
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.USERNAME) and self.browser.get_element(
                    self.LCT.USERNAME).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.USERNAME, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break
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

    def navigate_to_callcenter_menu(self, menu):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.MENU)
        self.browser.clicks(self.LCT.MENU, on_elements=lambda _, e: self.browser.get_text(e).lower() == menu.lower(),
                            stop_on_first=True)

    def navigate_to_page(self, page=None):
        """
        Navigate to page
        """
        if page:
            self.browser.open_page(self.URL + '/' + page)

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
            if self.browser.wait_visibility_of_element_located(self.LCT.POPUP_VIDEO,
                                                               timeout=10) and self.browser.get_element(
                self.LCT.POPUP_VIDEO).is_displayed():
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

    def filter_header(
            self, channel=None, size=None, gain=None, highpass=None,
            is_reset_change=False, is_deleted=False, is_save=False, is_undo=False,
            panel_tab=None, action=None, mark_reviewed=False,
            is_reset_rhythm=False, is_mark_artifact=False, by_hotkey=False,
            is_redo=False
    ):
        if channel:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_THUMBNAIL_CHANNEL, inverse=True)
            _symptoms = [s.strip() for s in channel.split(',')] if isinstance(channel, str) else channel  # str|list
            for _sys in _symptoms:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_THUMBNAIL_CHANNEL)
                self.browser.clicks(self.LCT.AI_REPORT_THUMBNAIL_CHANNEL,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower() == _sys.lower())
        if size:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_THUMBNAIL_SIZE)
            self.browser.click(self.LCT.AI_REPORT_THUMBNAIL_SIZE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_THUMBNAIL_OPTION)
            self.browser.clicks(self.LCT.AI_REPORT_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == size.lower(),
                                stop_on_first=True)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_STRIP_BEATS_OPTION)
            elements = self.browser.get_elements(self.LCT.AI_REPORT_STRIP_BEATS_OPTION)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_STRIP_BEATS_OPTION, inverse=True)
            return len(elements)
        if gain:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_THUMBNAIL_GAIN, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_THUMBNAIL_GAIN)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_THUMBNAIL_GAIN, inverse=True)
            self.browser.clicks(self.LCT.AI_REPORT_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == size.lower(),
                                stop_on_first=True)
        if highpass:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_THUMBNAIL_HIGHPASS, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_THUMBNAIL_HIGHPASS)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_THUMBNAIL_HIGHPASS, inverse=True)
            self.browser.clicks(self.LCT.AI_REPORT_THUMBNAIL_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == size.lower(),
                                stop_on_first=True)
        if panel_tab:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_PANEL_TAB)
            self.browser.clicks(self.LCT.AI_REPORT_PANEL_TAB,
                                on_elements=lambda _, e: panel_tab.lower() in self.browser.get_text(e).lower(),
                                is_scroll=True,
                                stop_on_first=True)
        if is_reset_change:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_RESET_CHANGE, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_RESET_CHANGE)
        if is_reset_rhythm:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_RESET_CHANGE_RHYTHM, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_RESET_CHANGE_RHYTHM)
        if action:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ACTION)
            self.browser.click(self.LCT.AI_REPORT_ACTION)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ACTION)
            self.browser.js_clicks(self.LCT.AI_REPORT_ACTION_OPTION,
                                   on_elements=lambda _, e: self.browser.get_text(e).lower() == action.lower(),
                                   stop_on_first=True)
        if mark_reviewed:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_MARK_REVIEWED)
            if by_hotkey:
                self.browser.action_by_keyword('R')
            else:
                self.browser.click(self.LCT.AI_REPORT_MARK_REVIEWED)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_MARK_REVIEWED, inverse=True)
        if is_mark_artifact:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_MARK_ARTIFACT)
            if by_hotkey:
                self.browser.action_by_keyword('A')
            else:
                self.browser.click(self.LCT.AI_REPORT_MARK_ARTIFACT)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_MARK_ARTIFACT, inverse=True)
        if is_deleted:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_DELETED)
            self.browser.click(self.LCT.AI_REPORT_DELETED)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_DELETED, inverse=True)
        if is_undo:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_UNDO)
            self.browser.click(self.LCT.AI_REPORT_UNDO)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_UNDO, inverse=True)
        if is_redo:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_REDO)
            self.browser.click(self.LCT.AI_REPORT_REDO)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_REDO, inverse=True)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_SAVE_BUTTON, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_SAVE_BUTTON)
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.AI_REPORT_SAVE_BUTTON) and self.browser.get_element(
                    self.LCT.AI_REPORT_SAVE_BUTTON).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_SAVE_BUTTON, inverse=True)
                    break
                elif time.time() - start_time > 2 * 60:  # 2 minutes in seconds
                    return False

    def filter_each_event(self, captured_strips=None, hide_reviewed_event=None, is_submit=False, is_reset=False):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_FILTER_EVENT, inverse=True)
        self.browser.click(self.LCT.AI_REPORT_FILTER_EVENT)
        if hide_reviewed_event:
            for _ in range(2):
                if hide_reviewed_event in self.browser.get_attribute_value(self.LCT.AI_REPORT_HIDE_REVIEWED, "class"):
                    break
                self.browser.click(self.LCT.AI_REPORT_HIDE_REVIEWED)
        if captured_strips:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURED_STRIPS, inverse=True)
            for _ in range(2):
                if captured_strips in self.browser.get_attribute_value(self.LCT.AI_REPORT_CAPTURED_STRIPS, "class"):
                    break
                self.browser.js_click(self.LCT.AI_REPORT_CAPTURED_STRIPS)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURED_STRIPS, inverse=True)
        if is_reset:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_HIDE_REVIEWED_RESET, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_HIDE_REVIEWED_RESET)
        if is_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_HIDE_REVIEWED_SUBMIT, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_HIDE_REVIEWED_SUBMIT)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_FILTER_EVENT, inverse=True)

    def get_current_total_page_airp_pagination(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_TOTAL_PAGE)
        output = self.browser.get_text(self.LCT.AI_REPORT_TOTAL_PAGE)
        number_str = output.split('/')[1].strip()
        number = int(number_str)
        return number

    def edit_page_number(self, page_number=None):
        if page_number:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_PAGE)
            element_input = self.browser.get_element(self.LCT.AI_REPORT_PAGE)
            time.sleep(5)
            self.browser.click_by_offset(element_input, 20, 10)
            self.browser.input_text(self.LCT.AI_REPORT_PAGE, page_number)
            self.browser.click_by_offset(element_input, 50, 20)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_PAGE, inverse=True)
            if 'error' in self.browser.get_attribute_value(self.LCT.AI_REPORT_PAGE, 'class'):
                return False
            else:
                return True

    def get_total_number_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_EACH_EVENT, inverse=True)
        while True:
            if self.get_current_total_page_airp_pagination() == 1:
                elements = self.browser.get_elements(self.LCT.AI_REPORT_EACH_EVENT)
                return len(elements)
            else:
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_EACH_EVENT)
                number_events_on_page = self.browser.get_elements(self.LCT.AI_REPORT_EACH_EVENT)
                number_pages = self.get_current_total_page_airp_pagination()
                self.edit_page_number(number_pages)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_EACH_EVENT)
                last_number_event = self.browser.get_elements(self.LCT.AI_REPORT_EACH_EVENT)
                total_events = ((number_pages - 1) * len(number_events_on_page)) + len(last_number_event)
                self.edit_page_number(1)
                return total_events

    def get_number_events_on_tab_menu(self):
        # Just hover out of the AI_REPORT_NUMBER_EVENTS_SUBTAB
        # self.browser.hover_to(self.LCT.AI_REPORT_EACH_EVENT)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NUMBER_EVENTS_SUBTAB)
        total = self.browser.get_text(self.LCT.AI_REPORT_NUMBER_EVENTS_SUBTAB)
        if total == "":
            return 0
        if total != "99+":
            return int(total)
        self.browser.hover_to(self.LCT.AI_REPORT_NUMBER_EVENTS_SUBTAB)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NUMBER_EVENTS)
        output = self.browser.get_text(self.LCT.AI_REPORT_NUMBER_EVENTS)
        return int(output)

    def get_zoom_tool_hr_chart(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ZOOM_TOOL)
        return self.browser.get_text(self.LCT.AI_REPORT_ZOOM_TOOL)

    def filter_zoom_tool(self, min_or_max_percent=None, is_reset_zoom=False, min_percent=None):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ZOOM_TOOL_MIN)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ZOOM_TOOL_MAX)
        if min_or_max_percent:
            for _ in range(6):
                if self.browser.get_text(self.LCT.AI_REPORT_ZOOM_TOOL) == min_or_max_percent:
                    break
                self.browser.click(self.LCT.AI_REPORT_ZOOM_TOOL_MAX)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ZOOM_TOOL, inverse=True)
        if min_percent:
            for _ in range(6):
                if self.browser.get_text(self.LCT.AI_REPORT_ZOOM_TOOL) == min_percent:
                    break
                self.browser.click(self.LCT.AI_REPORT_ZOOM_TOOL_MIN)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ZOOM_TOOL_MIN, inverse=True)
        if is_reset_zoom:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_RESET_ZOOM, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_RESET_ZOOM)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_RESET_ZOOM, inverse=True)

    @staticmethod
    def format_datetime_to_mmdd(datetime_str):
        datetime_obj = datetime.strptime(datetime_str, "%m/%d/%Y, %H:%M:%S")
        formatted_date = datetime_obj.strftime("%m/%d")
        return formatted_date

    def get_current_datetime_start_date(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_START_DATETIME)
        contents = self.browser.get_text(self.LCT.AI_REPORT_START_DATETIME).split()
        output = {
            'Date': contents[0],
            'Number of event': int(contents[1][1:-1]),
        }
        self.logger.info(output)
        return output

    def pagination_datetime(self, next_or_previous=None):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_START_DATETIME_NEXT)
                self.browser.js_click(self.LCT.AI_REPORT_START_DATETIME_NEXT)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_START_DATETIME_NEXT, inverse=True)
                break
            if next_or_previous == 'previous':
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_START_DATETIME_PREVIOUS)
                self.browser.js_click(self.LCT.AI_REPORT_START_DATETIME_PREVIOUS)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_START_DATETIME_PREVIOUS,
                                                                inverse=True)
                break

    def filter_toolbar_ecg_viewer(self, speed=None, gain=None, hp=None, lp=None, ch1=False, ch2=False, ch3=False,
                                  capture=False, beat_mark=False, zoom_tool=False, view_all=False, beat_close=False):
        if speed:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_SPEED)
            self.browser.click(self.LCT.AI_REPORT_ECG_SPEED)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_SPEED, inverse=True)
            self.browser.clicks(self.LCT.AI_REPORT_ECG_SPEED_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == speed.lower(),
                                stop_on_first=True)
        if gain:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_GAIN)
            self.browser.click(self.LCT.AI_REPORT_ECG_GAIN)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_GAIN, inverse=True)
            self.browser.clicks(self.LCT.AI_REPORT_ECG_SPEED_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == gain.lower(),
                                stop_on_first=True)
        if gain:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_GAIN)
            self.browser.click(self.LCT.AI_REPORT_ECG_GAIN)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_GAIN, inverse=True)
            self.browser.clicks(self.LCT.AI_REPORT_ECG_SPEED_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == gain.lower(),
                                stop_on_first=True)
        if hp:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_HIGH_PASS)
            self.browser.click(self.LCT.AI_REPORT_ECG_HIGH_PASS)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_HIGH_PASS, inverse=True)
            self.browser.clicks(self.LCT.AI_REPORT_ECG_SPEED_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == hp.lower(),
                                stop_on_first=True)
        if lp:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_LOW_PASS)
            self.browser.click(self.LCT.AI_REPORT_ECG_LOW_PASS)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_LOW_PASS, inverse=True)
            self.browser.clicks(self.LCT.AI_REPORT_ECG_SPEED_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == lp.lower(),
                                stop_on_first=True)
        if ch1:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_SHOW_HIDE_CH1)
            self.browser.click(self.LCT.AI_REPORT_ECG_SHOW_HIDE_CH1)
        if ch2:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_SHOW_HIDE_CH2)
            self.browser.click(self.LCT.AI_REPORT_ECG_SHOW_HIDE_CH2)
        if ch3:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_SHOW_HIDE_CH3)
            self.browser.click(self.LCT.AI_REPORT_ECG_SHOW_HIDE_CH3)
        if capture:
            return self
        if beat_mark:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_BEAT_MARKER_TOOL)
            self.browser.click(self.LCT.AI_REPORT_ECG_BEAT_MARKER_TOOL)
        if zoom_tool:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_ZOOM)
            self.browser.click(self.LCT.AI_REPORT_ECG_ZOOM)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_ZOOM, inverse=True)
            element = self.browser.get_element(self.LCT.AI_REPORT_ECG_HR_CHART)
            self.browser.click_by_offset(element, 100, 100)
        if view_all:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_VIEW_ALL_STRIP)
            self.browser.click(self.LCT.AI_REPORT_ECG_VIEW_ALL_STRIP)
        if beat_close:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.AI_REPORT_ECG_BEAT_CLOSE, timeout=10) and self.browser.get_element(
                self.LCT.AI_REPORT_ECG_BEAT_CLOSE).is_displayed():
                self.browser.click(self.LCT.AI_REPORT_ECG_BEAT_CLOSE)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_BEAT_CLOSE, inverse=True)

    def select_all_events_on_page(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_EACH_EVENT, inverse=True)
        elements = self.browser.get_elements(self.LCT.AI_REPORT_EACH_EVENT)
        self.browser.click(elements[0])
        self.browser.select_all_value()
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_EACH_EVENT, inverse=True)
        return len(elements)

    def navigate_chart_scroller(self, x_offset=None, y_offset=None):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.AI_REPORT_CHART_SCROLLER) and self.browser.get_element(
                self.LCT.AI_REPORT_CHART_SCROLLER).is_displayed():
                element = self.browser.get_element(self.LCT.AI_REPORT_CHART_SCROLLER)
                self.browser.click_by_offset(element, x_offset, y_offset)
                break
            elif time.time() - start_time > 5 * 60:
                return self
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CHART_SCROLLER, inverse=True)

    def get_current_airp_pagination(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_PAGE, inverse=True)
        output = dict()
        output['Page'] = self.browser.get_attribute_value(self.LCT.AI_REPORT_PAGE, 'value')
        return output

    def navigate_to_add_new_event(self,use_add_all_afib=False):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.AI_REPORT_ADD_EVENT) and self.browser.get_element(
                self.LCT.AI_REPORT_ADD_EVENT).is_displayed():
                self.browser.click(self.LCT.AI_REPORT_ADD_EVENT)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ADD_EVENT, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                return False
        if use_add_all_afib:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_USE_ADD_ALL_AFIB_CHECKBOX)
            self.browser.click(self.LCT.AI_REPORT_USE_ADD_ALL_AFIB_CHECKBOX)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_USE_ADD_ALL_AFIB_CHECKBOX, inverse=True)

    def verify_use_add_all_afib(self):
        try:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_USE_ADD_ALL_AFIB_CHECKBOX)
            element = self.browser.get_element(self.LCT.AI_REPORT_USE_ADD_ALL_AFIB_CHECKBOX)
            return element is not None
        except Exception:
            return False

    def navigate_to_event_draft_status(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.AI_REPORT_EVENT_DRAFT_STATUS) and self.browser.get_element(
                self.LCT.AI_REPORT_EVENT_DRAFT_STATUS).is_displayed():
                self.browser.click(self.LCT.AI_REPORT_EVENT_DRAFT_STATUS)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_EVENT_DRAFT_STATUS, inverse=True)
                break
            elif time.time() - start_time > 1 * 60:
                return False

    def _on_new_events_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_NEW_EVENTS_OPTION)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_new_events()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def _on_new_events(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_AFIB_EVENTS)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_events()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def view_new_events_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_NEW_EVENTS_OPTION, inverse=True)
        _index = self._on_new_events_item(**on)
        self.browser.hover_to_by_index(self.LCT.AI_REPORT_NEW_EVENTS_OPTION, _index)
        self.browser.clicks(self.LCT.AI_REPORT_NEW_EVENTS_VIEW, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def delete_new_events_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_NEW_EVENTS_OPTION, inverse=True)
        _index = self._on_new_events_item(**on)
        self.browser.hover_to_by_index(self.LCT.AI_REPORT_NEW_EVENTS_OPTION, _index)
        self.browser.clicks(self.LCT.AI_REPORT_NEW_EVENTS_DELETED, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_NEW_EVENTS_REMOVE, inverse=True)
        self.browser.click(self.LCT.AI_REPORT_NEW_EVENTS_REMOVE)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_NEW_EVENTS_OPTION, inverse=True)

    def get_new_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_NEW_EVENTS_OPTION)
        elements = self.browser.get_elements(self.LCT.AI_REPORT_NEW_EVENTS_OPTION)
        return elements

    def get_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_AFIB_EVENTS)
        elements = self.browser.get_elements(self.LCT.BEAT_HR_AFIB_EVENTS)
        return elements

    def get_thumbnail_new_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_NEW_EVENTS_THUMBNAIL, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.AI_REPORT_NEW_EVENTS_THUMBNAIL)
        self.logger.info(contents)
        for item in contents:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration,
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_thumbnail_events_no_hr(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_THUMBNAIL_EVENTS_NO_HR, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.AI_REPORT_THUMBNAIL_EVENTS_NO_HR)
        for item in contents:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_thumbnail_events_selected_no_hr(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_THUMBNAIL_EVENTS_SELECTED_NO_HR,
                                                             inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.AI_REPORT_THUMBNAIL_EVENTS_SELECTED_NO_HR)
        for item in contents:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_events_mark_reviewed_on_page(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_EVENT_MARK_REVIEWED) and \
                    self.browser.get_elements(self.LCT.AI_REPORT_EVENT_MARK_REVIEWED)[0].is_displayed():
                element = self.browser.get_elements(self.LCT.AI_REPORT_EVENT_MARK_REVIEWED)
                return len(element)
            elif time.time() - start_time > 3 * 60:
                return self

    def view_events_on_date_on(self, **on):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_START_DATETIME)
        self.browser.click(self.LCT.AI_REPORT_START_DATETIME)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_START_DATETIME)
        _index = self._on_new_events_item(**on)
        self.browser.clicks(self.LCT.AI_REPORT_START_DATETIME_OPTION, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_list_date(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_START_DATETIME)
        self.browser.click(self.LCT.AI_REPORT_START_DATETIME)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_START_DATETIME_OPTION, inverse=True)
        elements = self.browser.get_elements(self.LCT.AI_REPORT_START_DATETIME_OPTION)
        return elements

    def _on_date_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_START_DATETIME_OPTION)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        all_data = self.get_list_date()
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such reports exist on `{_on}`')

    def filter_capture(self, duration=None, channel=None, comment=None, title=None, is_submit=False):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE, timeout=5) and \
                    self.browser.get_element(self.LCT.AI_REPORT_CAPTURE).is_displayed():
                self.browser.click(self.LCT.AI_REPORT_CAPTURE)
                break
            elif self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ECG_BEAT_CLOSE, timeout=2) and \
                    self.browser.get_element(self.LCT.AI_REPORT_ECG_BEAT_CLOSE).is_displayed():
                self.browser.click(self.LCT.AI_REPORT_ECG_BEAT_CLOSE)
                self.browser.wait_visibility_of_element_located(
                    self.LCT.AI_REPORT_ECG_BEAT_CLOSE, timeout=5, inverse=True)
            elif time.time() - start_time > 60:
                break
        if duration:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_CAPTURE_DURATION)
            self.browser.clicks(self.LCT.AI_REPORT_CAPTURE_DURATION,
                                on_elements=lambda _, e: self.browser.get_text(e) == duration,
                                stop_on_first=True)
        if channel:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_CAPTURE_CHANNEL)
            self.browser.clicks(self.LCT.AI_REPORT_CAPTURE_CHANNEL,
                                on_elements=lambda _, e: self.browser.get_text(e) == channel,
                                stop_on_first=True)
        if comment:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_COMMENT, inverse=True)
            self.browser.input_text(self.LCT.AI_REPORT_CAPTURE_COMMENT, comment)
        if is_submit:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_COMMENT, inverse=True)
            self.browser.click(self.LCT.AI_REPORT_CAPTURE_SUBMMIT)
        if title:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_TITLE, inverse=True)
            self.browser.input_text(self.LCT.AI_REPORT_CAPTURE_TITLE, title)

    def get_value_capture_duration(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_CAPTURE_DURATION_OPTION, inverse=True)
        return self.browser.get_texts(self.LCT.AI_REPORT_CAPTURE_DURATION_OPTION)

    def get_value_highlight_channel(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_CAPTURE_CHANNEL_OPTION, inverse=True)
        return self.browser.get_texts(self.LCT.AI_REPORT_CAPTURE_CHANNEL_OPTION)

    def get_total_number_afib_events_beats_hr(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.BEAT_HR_AFIB_EVENTS, inverse=True)
        while True:
            if self.get_current_total_page_airp_pagination() == 1:
                elements = self.browser.get_elements(self.LCT.BEAT_HR_AFIB_EVENTS)
                return len(elements)
            else:
                time.sleep(2)
                number_events_on_page = self.browser.get_elements(self.LCT.BEAT_HR_AFIB_EVENTS)
                number_pages = self.get_current_total_page_airp_pagination()
                self.edit_page_number(page_number=number_pages)
                last_number_event = self.browser.get_elements(self.LCT.BEAT_HR_AFIB_EVENTS)
                total_events = ((number_pages - 1) * len(number_events_on_page)) + len(last_number_event)
                return total_events

    def get_events_selected(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_EVENT_STRIPS, inverse=True)
        output = self.browser.get_texts(self.LCT.AI_REPORT_EVENT_STRIPS_SELECTED)
        return output

    def navigate_events_selected(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_EVENT_STRIPS)
        _index = self._on_new_events(**on)
        self.browser.hover_to_by_index(self.LCT.AI_REPORT_EVENT_STRIPS, _index)
        self.browser.clicks(self.LCT.AI_REPORT_EVENT_STRIPS, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    @staticmethod
    def get_time_the_next_minute(current_time=None):
        time_obj = datetime.strptime(current_time, "%H:%M:%S")
        new_time_obj = time_obj + timedelta(minutes=1)
        output = new_time_obj.strftime("%H:%M:%S")
        return output

    @staticmethod
    def get_time_the_previous_minute(current_time=None):
        time_obj = datetime.strptime(current_time, "%H:%M:%S")
        new_time_obj = time_obj - timedelta(minutes=1)
        output = new_time_obj.strftime("%H:%M:%S")
        return output

    def pagination_minute(self, next_or_previous=None):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(2):
            if next_or_previous == 'next':
                # self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NEXT_MINUTE)
                self.browser.hover_to(self.LCT.AI_REPORT_CHART_SCROLLER)
                self.browser.click(self.LCT.AI_REPORT_NEXT_MINUTE)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NEXT_MINUTE, inverse=True)
                break
            if next_or_previous == 'previous':
                # self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_PREVIOUS_MINUTE)
                self.browser.hover_to(self.LCT.AI_REPORT_CHART_SCROLLER)
                self.browser.click(self.LCT.AI_REPORT_PREVIOUS_MINUTE)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_PREVIOUS_MINUTE, inverse=True)
                break

    @staticmethod
    def format_datetime_to_datetime(datetime_str):
        datetime_obj = datetime.strptime(datetime_str, "%m/%d/%Y, %H:%M:%S")
        formatted_date = datetime_obj.strftime("%m/%d/%Y, %H:%M")
        return formatted_date

    def pagination_min_max_hr(self, next_or_previous=None):
        if next_or_previous.lower() not in ('next', 'previous'):
            raise Exception(f'Invalid key {next_or_previous}.')
        self.browser.execute_script('window.scrollTo(0,2500)')
        for _ in range(2):
            if next_or_previous == 'next':
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NEXT_MIN_MAX_HR)
                self.browser.click(self.LCT.AI_REPORT_NEXT_MIN_MAX_HR)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NEXT_MIN_MAX_HR, inverse=True)
                break
            if next_or_previous == 'previous':
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_PREVIOUS_MIN_MAX_HR)
                self.browser.click(self.LCT.AI_REPORT_PREVIOUS_MIN_MAX_HR)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_PREVIOUS_MIN_MAX_HR, inverse=True)
                break

    def check_pagination_min_max_hr(self, pagination_next=False):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_NEXT_MIN_MAX_HR)
        if pagination_next:
            for i in range(10):
                is_next_button_disabled = self.browser.get_element(self.LCT.AI_REPORT_NEXT_MIN_MAX_HR).get_attribute(
                    'disabled')
                if is_next_button_disabled:
                    return True
                self.browser.click(self.LCT.AI_REPORT_NEXT_MIN_MAX_HR)

            is_next_button_disabled = self.browser.get_element(self.LCT.AI_REPORT_NEXT_MIN_MAX_HR).get_attribute(
                'disabled')
            return True if is_next_button_disabled else False

    @staticmethod
    def check_number_event_strips(total_number_event=None, number_on_section=None):
        if int(total_number_event) > 100:
            if number_on_section == '99+':
                return True
        elif int(total_number_event) < 100:
            if int(total_number_event) == int(number_on_section):
                return True
        else:
            return False

    def get_list_panel_tab(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_PANEL_TAB)
        return self.browser.get_texts(self.LCT.AI_REPORT_PANEL_TAB)

    def filter_panel(self, view_detail=False, remove_strip=False, is_cancel=False, is_done=False,
                     technician_comment=None, title_name=None):
        if view_detail:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_VIEW)
            self.browser.click(self.LCT.AI_REPORT_CAPTURE_VIEW)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_VIEW, inverse=True)
        if title_name:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT)
            self.browser.input_text(self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT, title_name)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT, inverse=True)
        if technician_comment:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_TECHNICIAN_COMMENT)
            self.browser.input_text(self.LCT.AI_REPORT_CAPTURE_TECHNICIAN_COMMENT, technician_comment)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_TECHNICIAN_COMMENT, inverse=True)
        if remove_strip:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DELETE)
            self.browser.click(self.LCT.AI_REPORT_CAPTURE_DELETE)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DELETE, inverse=True)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_CANCEL)
            self.browser.click(self.LCT.AI_REPORT_CAPTURE_CANCEL)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_CANCEL, inverse=True)
        if is_done:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DONE)
            self.browser.click(self.LCT.AI_REPORT_CAPTURE_DONE)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DONE, inverse=True)

    def get_capture_detail_info(self):
        output = {
            "DateTime": self.browser.get_text(self.LCT.AI_REPORT_CAPTURE_DATETIME).split('\n'),
            "Technician comment": self.browser.get_text(self.LCT.AI_REPORT_CAPTURE_TECHNICIAN_COMMENT)
        }
        if self.browser.wait_visibility_of_element_located(
                self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT) and self.browser.get_element(
            self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT).is_displayed():
            output['Title'] = self.browser.get_attribute_value(self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT, 'value')
        return output

    def navigate_to_crawl_data_sign_in_page(self):
        self.browser.open_page(self.URL)

    def get_athena_otp(self) -> str:
        _SECRET = "IADHIU2D7ZTNYG6L" # Should improve this to be more secure
        """Return the current 6-digit TOTP for *secret*."""
        otp = pyotp.TOTP(_SECRET).now()
        self.logger.info(f"{otp}")
        return otp

    def sign_in_crawl_data(self, username, password):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.USERNAME_ATHENA) and self.browser.get_element(
                    self.LCT.USERNAME_ATHENA).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.USERNAME_ATHENA, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break
        self.browser.input_text(self.LCT.USERNAME_ATHENA, username)
        self.browser.input_text(self.LCT.PASSWORD_ATHENA, password, is_text_logged=False)
        self.browser.click(self.LCT.SIGNIN_ATHENA)
        time.sleep(5)
        otp = self.get_athena_otp()
        self.browser.input_text(self.LCT.OTP_CODE_INPUT, otp)
        self.browser.click(self.LCT.VERIFY_BUTTON_TEXT)
        time.sleep(10)


    def check_undo_button_is_enabled(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_UNDO)
        disabled_attr = self.browser.get_attribute_value(self.LCT.AI_REPORT_UNDO, 'disabled')
        return False if disabled_attr else True
    def check_redo_button_is_enabled(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_REDO)
        disabled_attr = self.browser.get_attribute_value(self.LCT.AI_REPORT_REDO, 'disabled')
        return False if disabled_attr else True

    def view_captured_strip(self) -> bool:
        if self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP, timeout=1):
            self.browser.click(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP)
            return True

        start_time = time.time()
        while not self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP, timeout=1):
            self.pagination_minute(next_or_previous='next')
            if time.time() - start_time > 20:
                break

        if self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP, timeout=1):
            self.browser.click(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP)
            return True

        return False

    def jump_to_not_captured_strip(self):
        start_time = time.time()
        while self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP, timeout=1):
            self.pagination_minute(next_or_previous='next')
            if time.time() - start_time > 20:
                break

        if not self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP, timeout=1):
            return True

        return False

    def check_is_strip_captured(self):
        return self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_VIEW_CAPTURED_STRIP, timeout=1)

    def edit_strip_technician_comment(self, title=None, comment=None, must_be_different=False, click_view=True):
        if title is None and comment is None:
            self.logger.error('Please provide title or comment to edit')
            return

        if click_view:
            if self.view_captured_strip() is False:
                self.logger.error('Cannot view captured strip, please check the data')
                return

        if title:
            old_title = self.browser.get_element(self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT).get_attribute('value')
            new_title = f"{old_title} new" if must_be_different else title
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT)
            self.browser.input_text(self.LCT.AI_REPORT_CAPTURE_TITLE_INPUT, new_title)

        if comment:
            old_comment = self.browser.get_element(self.LCT.AI_REPORT_CAPTURE_TECHNICIAN_COMMENT).get_attribute('value')
            new_comment = f"{old_comment} new" if must_be_different else comment
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_TECHNICIAN_COMMENT)
            self.browser.input_text(self.LCT.AI_REPORT_CAPTURE_TECHNICIAN_COMMENT, new_comment)

        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DONE)
        self.browser.click(self.LCT.AI_REPORT_CAPTURE_DONE)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DONE, inverse=True)

    def remove_strip(self):
        if self.view_captured_strip() is False:
            self.logger.error('Cannot view captured strip, please check the data')
            return

        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DELETE)
        self.browser.click(self.LCT.AI_REPORT_CAPTURE_DELETE)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CAPTURE_DELETE, inverse=True)

    def click_save(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_SAVE_BUTTON)
        self.browser.click(self.LCT.AI_REPORT_SAVE_BUTTON)

    def press_ctrl_and_key(self, key):
        self.browser.ctrl_and_key(key)

    def get_min_max_avg_hr(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_MIN_MAX_AVG_HR)
        output = []
        contents = self.browser.get_texts(self.LCT.AI_REPORT_MIN_MAX_AVG_HR)
        for item in contents:

            numbers = re.findall(r'\b\d+\b', item)
            if len(numbers) >= 3:
                min_val = int(numbers[0])
                avg_val = int(numbers[1])
                max_val = int(numbers[2])
                processed_entry = {
                    'Min': min_val,
                    'Avg': avg_val,
                    'Max': max_val
                }
                output.append(processed_entry)
        return output

    def action_unsaved_changes(self, is_discard_changes=False, is_keep_editing=False):
        if is_discard_changes:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_DISCARD_CHANGES)
            self.browser.click(self.LCT.AI_REPORT_DISCARD_CHANGES)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_DISCARD_CHANGES, inverse=True)
            time.sleep(5)
        if is_keep_editing:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_KEEP_EDITING)
            self.browser.click(self.LCT.AI_REPORT_KEEP_EDITING)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_KEEP_EDITING, inverse=True)
            time.sleep(5)

    def add_beats_in_ecg_viewer(self, is_add_N_beat=False, is_add_S_beat=False, is_add_V_beat=False,
                                is_add_Q_beat=False,is_delete_beat=False,
                                x_offset_time=None, y_offset_time=None, use_hotkey=False):
        if self.browser.is_element_visible(self.LCT.AI_REPORT_BEAT_MARKER_TOOL):
            self.browser.click(self.LCT.AI_REPORT_BEAT_MARKER_TOOL)
        beat_options = [
            ('N', is_add_N_beat, self.LCT.AI_REPORT_BEAT_MARKER_N),
            ('S', is_add_S_beat, self.LCT.AI_REPORT_BEAT_MARKER_S),
            ('V', is_add_V_beat, self.LCT.AI_REPORT_BEAT_MARKER_V),
            ('Q', is_add_Q_beat, self.LCT.AI_REPORT_BEAT_MARKER_Q),
            ('D', is_delete_beat, self.LCT.AI_REPORT_BEAT_MARKER_D),
        ]
        for key, is_enabled, locator in beat_options:
            if is_enabled:
                if use_hotkey:
                    self.browser.action_by_keyword(key)
                else:
                    self.browser.wait_visibility_of_element_located(locator)
                    self.browser.click(locator)

                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CANVAS)
                element = self.browser.get_element(self.LCT.AI_REPORT_CANVAS)
                self.browser.click_by_offset(element, x_offset_time, y_offset_time)

    @staticmethod
    def verify_format_mmdd(date_string: str) -> bool:
        """
        Check if string is in MM/DD format.
        Returns True if valid, False otherwise.
        """
        try:
            datetime.strptime(date_string, "%m/%d")
            return True
        except ValueError:
            return False

    def add_beats_in_ecg_viewer_from_context_menu(self, is_add_N_beat=False, is_add_S_beat=False,
                                    is_add_V_beat=False, is_add_Q_beat=False,
                                    x_offset_time=None, y_offset_time=None):
        if self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CANVAS):
            self.browser.context_click(self.LCT.AI_REPORT_CANVAS)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ADD_BEATS_CONTEXT_MENU, inverse=True)
        self.browser.click(self.LCT.AI_REPORT_ADD_BEATS_CONTEXT_MENU)
        beat_options = [
            (is_add_N_beat, self.LCT.AI_REPORT_ADD_BEATS_CONTEXT_MENU_N),
            (is_add_S_beat, self.LCT.AI_REPORT_ADD_BEATS_CONTEXT_MENU_S),
            (is_add_V_beat, self.LCT.AI_REPORT_ADD_BEATS_CONTEXT_MENU_V),
            (is_add_Q_beat, self.LCT.AI_REPORT_ADD_BEATS_CONTEXT_MENU_Q),
        ]
        for is_enabled, locator in beat_options:
            if is_enabled:
                self.browser.wait_visibility_of_element_located(locator)
                self.browser.click(locator)
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CANVAS)
                element = self.browser.get_element(self.LCT.AI_REPORT_CANVAS)
                self.browser.click_by_offset(element, x_offset_time, y_offset_time)

    def remove_beats_in_ecg_viewer_from_context_menu(self,x_offset_time=None, y_offset_time=None):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CANVAS)
        element = self.browser.get_element(self.LCT.AI_REPORT_CANVAS)
        self.browser.context_click_by_offset(element, x_offset_time, y_offset_time)
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_DELETE_BEATS_CONTEXT_MENU, inverse=True)
        self.browser.click(self.LCT.AI_REPORT_DELETE_BEATS_CONTEXT_MENU)

    def undo_until_disabled(self):
        while True:
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_UNDO)
            is_disabled = self.browser.get_attribute_value(self.LCT.AI_REPORT_UNDO, 'disabled')
            if is_disabled:
                self.logger.info("Undo button is disabled. Stopping undo.")
                break
            self.logger.info("Clicking Undo button.")
            self.browser.click(self.LCT.AI_REPORT_UNDO)
            self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_UNDO, inverse=True)

    def get_study_information(self):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_STUDY_INFORMATION_BUTTON)
        self.browser.click(self.LCT.AI_REPORT_STUDY_INFORMATION_BUTTON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.AI_REPORT_STUDY_INFORMATION)
        output = {}

        simple_fields = {
            "Status": self.LCT.AI_REPORT_STATUS,
            "Study Type": self.LCT.AI_REPORT_STUDY_TYPE,
            "Patient Return Visit": self.LCT.AI_REPORT_PATIENT_RETURN_VISIT,
            "Device ID": self.LCT.AI_REPORT_DEVICE_ID,
            "Duration": self.LCT.AI_REPORT_DURATION,
            "Facility": self.LCT.AI_REPORT_FACILITY,
            "Total Artifact": self.LCT.AI_REPORT_TOTAL_ARTIFACTS
        }

        for label, locator in simple_fields.items():
            try:
                output[label] = self.browser.get_text(locator)
            except:
                output[label] = ""
        try:
            start_time_raw = self.browser.get_text(self.LCT.AI_REPORT_START_TIME)
            start_date, start_time_with_tz = start_time_raw.split(", ")
            start_time = " ".join(start_time_with_tz.split(" ")[:-1])
            output["Start Date"] = start_date.strip()
            output["Start Time"] = start_time.strip()
        except:
            output["Start Date"] = ""
            output["Start Time"] = ""
        try:
            end_time_raw = self.browser.get_text(self.LCT.AI_REPORT_END_TIME)
            end_date, end_time_with_tz = end_time_raw.split(", ")
            end_time = " ".join(end_time_with_tz.split(" ")[:-1])
            output["End Date"] = end_date.strip()
            output["End Time"] = end_time.strip()
        except:
            output["End Date"] = ""
            output["End Time"] = ""

        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CLOSE_TAB_INFORNATION)
        self.browser.click(self.LCT.AI_REPORT_CLOSE_TAB_INFORNATION)

        self.logger.info(output)
        return output

    def get_time_event(self,start_date=False, end_date=False, end_time=False, start_time=False, is_checkbox_checked=False ):
        self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_ADD_EVENT)
        if start_date:
            start_date = self.browser.get_element(self.LCT.AI_REPORT_ADD_START_DATE).get_attribute('value')
            return start_date
        if end_date:
            end_date = self.browser.get_element(self.LCT.AI_REPORT_ADD_END_DATE).get_attribute('value')
            return end_date
        if start_time:
            start_time = self.browser.get_element(self.LCT.AI_REPORT_ADD_START_TIME).get_attribute('value')
            return start_time
        if end_time:
            end_time = self.browser.get_element(self.LCT.AI_REPORT_ADD_END_TIME).get_attribute('value')
            return end_time
        if is_checkbox_checked:
            try:
                self.browser.wait_visibility_of_element_located(self.LCT.AI_REPORT_CHECKED_THE_CHECKBOX)
                element = self.browser.get_element(self.LCT.AI_REPORT_CHECKED_THE_CHECKBOX)
                return element is not None
            except Exception:
                return False


