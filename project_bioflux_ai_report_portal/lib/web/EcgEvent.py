#!/usr/bin/env python3
import time

try:
    from project_bioflux_ai_report_portal.lib.WebPage import WebPage
    from project_bioflux_ai_report_portal.config.web_locators import ecgevent as locators
    from selenium.webdriver import Keys
    from corelib import Utils
    from datetime import datetime, timedelta
    import cv2
    import os
    import re
    import numpy as np
    # from PIL import Image
    import random

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class EcgEvent(WebPage):
    """
    Handle EcgEvent page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def wait_for_all_element_visibility(self, elements_or_locators):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(elements_or_locators) and self.browser.get_elements(elements_or_locators)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(elements_or_locators, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:  # 5 minutes in seconds
                break

    def navigate_to_ecg_events_subtab(self, subtab):
        # Wait for the container of subtabs to load.
        self.wait_for_all_element_visibility(self.LCT.ECG_EVENT_SUBTAB)
        start_time = time.time()

        while True:
            # Retrieve the list of subtab elements.
            elements = self.browser.get_elements(self.LCT.ECG_EVENT_SUBTAB)

            # Check if at least one element is visible.
            if elements and any(e.is_displayed() for e in elements):
                # Attempt to click on the element whose text matches the expected subtab.
                self.browser.clicks(
                    self.LCT.ECG_EVENT_SUBTAB,
                    on_elements=lambda _, e: self.browser.get_text(e).lower().split('\n')[0] == subtab.lower(),
                    is_scroll=True,
                    stop_on_first=True
                )
                # Wait until the non-active subtab elements become hidden.
                self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_SUBTAB, inverse=True)

                # Verify that the active subtab matches the expected text.
                if self.browser.get_text(self.LCT.ECG_EVENT_SUBTAB_ACTIVE).lower() == subtab.lower():
                    return  # Successfully navigated.
                else:
                    # If the active subtab is not as expected, scroll down and try again.
                    self.browser.execute_script("window.scrollBy(0, 200);")
                    time.sleep(0.5)
            else:
                # If no subtabs are visible, scroll down to reveal more.
                self.browser.execute_script("window.scrollBy(0, 200);")
                time.sleep(0.5)

            # Check if we have exceeded the 5-minute timeout.
            if time.time() - start_time > 5 * 60:
                self.browser.quit_browser()
                raise Exception(f"Timeout: The subtab '{subtab}' is not available after scrolling.")

    def check_subtab_is_active(self, sub_tab):
        if self.browser.get_text(self.LCT.ECG_EVENT_SUBTAB_ACTIVE).lower() == sub_tab.lower():
            return self
        else:
            raise Exception(f'The subtab {sub_tab} is not available.')

    def get_list_rhythm_menu_ecg_events(self):
        self.wait_for_all_element_visibility(self.LCT.ECG_EVENT_RHYTHM_LEFT_MENU)
        contents = self.browser.get_texts(self.LCT.ECG_EVENT_RHYTHM_LEFT_MENU)
        output = {}
        for item in contents:
            condition, value = item.split('\n')
            if value.isdigit():
                value = int(value)
            output[condition] = value
        self.logger.info(output)
        return output

    def get_list_beat_events_menu(self):
        self.wait_for_all_element_visibility(self.LCT.ECG_EVENT_BEAT_EVENTS_MENU)
        contents = self.browser.get_texts(self.LCT.ECG_EVENT_BEAT_EVENTS_MENU)
        output = {}
        for item in contents:
            condition, value = item.split('\n')
            if value.isdigit():
                value = int(value)
            output[condition] = value
        self.logger.info(output)
        return output

    def filter_option_select_all(self, mark_all_artifact=False, reset_all_change=False, delete_all_events=False):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_OPTION) and self.browser.get_element(self.LCT.ECG_EVENT_RHYTHM_OPTION).is_displayed():
                self.browser.click(self.LCT.ECG_EVENT_RHYTHM_OPTION)
                break
            elif time.time() - start_time > 5 * 60:  # 15 minutes in seconds
                return self
        if mark_all_artifact:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_MARK_ALL)
            self.browser.click(self.LCT.ECG_EVENT_RHYTHM_MARK_ALL)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_MARK_ALL, inverse=True)
        if reset_all_change:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_RESET_ALL, inverse=True)
            self.browser.click(self.LCT.ECG_EVENT_RHYTHM_RESET_ALL)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_RESET_ALL, inverse=True)
        if delete_all_events:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_DELETE_ALL)
            self.browser.click(self.LCT.ECG_EVENT_RHYTHM_DELETE_ALL)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_DELETE_ALL, inverse=True)

    def check_select_all_option_available(self):
        output = dict()
        if self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RHYTHM_RESET_ALL) and self.browser.get_element(self.LCT.ECG_EVENT_RHYTHM_RESET_ALL).is_displayed():
            output["Mark all as artifact"] = True
            return output

    def check_button_thumbnail_header_available(self):
        output = {
            'Delete event': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_EVENT_DELETE_EVENT) and self.browser.get_element(self.LCT.ECG_EVENT_DELETE_EVENT).get_attribute(
                'disabled') is not None else True,
            'Mark as artifact': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_EVENT_MARK_ARTIFACT) and self.browser.get_element(self.LCT.ECG_EVENT_MARK_ARTIFACT).get_attribute(
                'disabled') is not None else True,
            'Change event duration': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_EVENT_CHANGE_EVENT_DURATION) and self.browser.get_element(self.LCT.ECG_EVENT_CHANGE_EVENT_DURATION).get_attribute(
                'disabled') is not None else True,
            'Mark as reviewed': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_EVENT_MARK_REVIEWED) and self.browser.get_element(self.LCT.ECG_EVENT_MARK_REVIEWED).get_attribute(
                'disabled') is not None else True,
            'Filter event': False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_EVENT_FILTER_EVENT) and self.browser.get_element(self.LCT.ECG_EVENT_FILTER_EVENT).get_attribute(
                'disabled') is not None else True,
        }
        if self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE) and self.browser.get_element(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE).is_displayed():
            output['Change event type'] = False if (self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE) and self.browser.get_element(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE).get_attribute(
                'disabled') is not None) else True
        else:
            output['Change event type'] = False
        if self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RESET_CHANGE) and self.browser.get_element(self.LCT.ECG_EVENT_RESET_CHANGE).is_displayed():
            output['Reset Changes'] = False if self.browser.wait_visibility_of_element_located(
                self.LCT.ECG_EVENT_RESET_CHANGE) and self.browser.get_element(self.LCT.ECG_EVENT_RESET_CHANGE).get_attribute(
                'disabled') is not None else True
        self.logger.info(output)
        return output

    def get_thumbnail_ecg_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS)
        for item in contents:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            hr_data = parts[3].split()
            hr_min = hr_data[2]
            hr_avg = hr_data[5]
            hr_max = hr_data[8]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration,
                'Heart rate': f"Min: {hr_min} bpm | Avg: {hr_avg} bpm | Max: {hr_max} bpm"
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_thumbnail_ventricular_ecg_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS)
        for item in contents:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_thumbnail_ecg_events_has_beats(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS)
        contents_beats = self.browser.get_texts(self.LCT.ECG_EVENT_NUMBER_OF_BEATS)
        data = []
        for content, content_beat in zip(contents, contents_beats):
            data.append(f"{content}\n{content_beat}")
        for item in data:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            hr_data = parts[3].split()
            hr_min = hr_data[2]
            hr_avg = hr_data[5]
            hr_max = hr_data[8]
            number_beats = parts[4]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration,
                'Heart rate': f"Min: {hr_min} bpm | Avg: {hr_avg} bpm | Max: {hr_max} bpm",
                'Number Beats': number_beats,
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_thumbnail_ecg_events_has_beats_selected(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS_SELECTED, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS_SELECTED)
        contents_beats = self.browser.get_texts(self.LCT.ECG_EVENT_NUMBER_OF_BEATS_SELECTED)
        data = []
        for content, content_beat in zip(contents, contents_beats):
            data.append(f"{content}\n{content_beat}")
        for item in data:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            hr_data = parts[3].split()
            hr_min = hr_data[2]
            hr_avg = hr_data[5]
            hr_max = hr_data[8]
            number_beats = parts[4]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration,
                'Heart rate': f"Min: {hr_min} bpm | Avg: {hr_avg} bpm | Max: {hr_max} bpm",
                'Number Beats': number_beats,
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_thumbnail_ecg_events_selected(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS_SELECTED, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.ECG_EVENT_THUMBNAIL_EVENTS_SELECTED)
        self.logger.info(contents)
        for item in contents:
            parts = item.split('\n')
            time_number = parts[0].split(' ')
            channel = parts[1]
            duration = parts[2].split(': ')[1]
            hr_data = parts[3].split()
            hr_min = hr_data[2]
            hr_avg = hr_data[5]
            hr_max = hr_data[8]
            data_dict = {
                'Start Time': time_number[0],
                'Day Number': time_number[1][1:-1],
                'Channel': channel,
                'Duration': duration,
                'Heart rate': f"Min: {hr_min} bpm | Avg: {hr_avg} bpm | Max: {hr_max} bpm"
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_list_events_type(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE, inverse=True)
        self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_DROPDOWN)
        output = self.browser.get_texts(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_OPTION)
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE, inverse=True)
        self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_DROPDOWN)
        return output

    def _is_select_events_type(self, event_type=None):
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE, inverse=True)
        self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_DROPDOWN)
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE, inverse=True)
        time.sleep(5)
        self.browser.clicks(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_OPTION,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == event_type.lower(), is_scroll=True,
                            stop_on_first=True)
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE, inverse=True)
        if self.browser.get_text(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_DROPDOWN).lower() != event_type.lower():
            raise Exception(f'Have not a event type {event_type}.')

    def filter_thumbnail_option(self, select_event_type=None, by_hotkey=None, is_deleted_event=False,
                                change_event_duration=False, jum_to_start_time=False, jum_to_end_time=False,
                                is_change_event_type=False, is_done=False, is_cancel=False, is_add=False,
                                is_mark_as_artifact=False, is_save=False, pick_on_end_time=False, is_reset_change=False
                                ,use_add_all_afib=False, is_deleted_bookmark=False, by_hotkey_delete_bookmark=False):
        if is_change_event_type:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE)
            self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE)
        if select_event_type:
            self._is_select_events_type(select_event_type)
        if is_deleted_event:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_DELETE_EVENT, inverse=True)
            self.browser.click(self.LCT.ECG_EVENT_DELETE_EVENT)
        if by_hotkey:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_DELETE_EVENT, inverse=True)
            self.browser.action_by_keyword(by_hotkey)
        if change_event_duration:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_DURATION, inverse=True)
            self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_DURATION)
        if jum_to_start_time:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_JUM_TO_START_TIME, inverse=True)
            self.browser.click(self.LCT.ECG_EVENT_JUM_TO_START_TIME)
        if jum_to_end_time:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_JUM_TO_END_TIME, inverse=True)
            self.browser.double_click(self.LCT.ECG_EVENT_JUM_TO_END_TIME)
        if is_mark_as_artifact:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_MARK_ARTIFACT, inverse=True)
            self.browser.click(self.LCT.ECG_EVENT_MARK_ARTIFACT)
        if pick_on_end_time:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_PICK_ON_END_TIME, inverse=True)
            self.browser.click(self.LCT.ECG_EVENT_PICK_ON_END_TIME)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_PICK_ON_END_TIME, inverse=True)
        if is_done:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_DONE)
            self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_DONE)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_SAVE)
            self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_SAVE)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_TYPE_SAVE, inverse=True)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_CANCEL)
            self.browser.click(self.LCT.ECG_EVENT_CHANGE_EVENT_CANCEL)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_CHANGE_EVENT_CANCEL, inverse=True)
        if is_add:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_ADD)
            self.browser.click(self.LCT.ECG_EVENT_ADD)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_ADD, inverse=True)
        if is_reset_change:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_RESET_CHANGE)
            self.browser.click(self.LCT.ECG_EVENT_RESET_CHANGE)
        if use_add_all_afib:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_USE_ADD_ALL_AFIB_CHECKBOX)
            self.browser.click(self.LCT.ECG_EVENT_USE_ADD_ALL_AFIB_CHECKBOX)
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_USE_ADD_ALL_AFIB_CHECKBOX, inverse=True)
        if is_deleted_bookmark:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_DELETE_BOOKMARK)
            if by_hotkey_delete_bookmark :
                self.browser.action_by_keyword('D')
            else:
                self.browser.click(self.LCT.ECG_EVENT_DELETE_BOOKMARK)
                self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_DELETE_BOOKMARK, inverse=True)

    def verify_unsaved_symbol(self):
        self.browser.wait_visibility_of_element_located(self.LCT.UNSAVED_SYMBOL)
        unsaved_symbol_element = self.browser.get_element(self.LCT.UNSAVED_SYMBOL)
        if unsaved_symbol_element:
            return unsaved_symbol_element.is_displayed()
        return False

    def verify_use_add_all_afib_in_ecg_event(self):
        try:
            self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_USE_ADD_ALL_AFIB_CHECKBOX)
            element = self.browser.get_element(self.LCT.ECG_EVENT_USE_ADD_ALL_AFIB_CHECKBOX)
            return element is not None
        except Exception:
            return False

    def navigate_to_bookmarks(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_BOOKAMARKS)
        self.browser.click(self.LCT.ECG_EVENT_BOOKAMARKS)
        self.browser.wait_visibility_of_element_located(self.LCT.ECG_EVENT_BOOKAMARKS, inverse=True)