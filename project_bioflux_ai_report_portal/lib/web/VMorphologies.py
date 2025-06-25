#!/usr/bin/env python3
import time

try:
    from project_bioflux_ai_report_portal.lib.WebPage import WebPage
    from project_bioflux_ai_report_portal.config.web_locators import v_morphologies as locators
    from selenium.webdriver import Keys
    from selenium.webdriver.common.by import By
    from corelib import Utils
    from datetime import datetime, timedelta
    import re

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class VMorphologies(WebPage):
    """
    Handle all actions and elements in the VMorphologies page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def _on_thumbnail_template(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_TEMPLATE_THUMBNAIL)
        all_data = self.browser.get_texts(self.LCT.V_MORPHOLOGIES_TEMPLATE_THUMBNAIL)
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(all_data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i

    def navigate_to_template_on(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_TEMPLATE_THUMBNAIL, inverse=True)
        _index = self._on_thumbnail_template(**on)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_TEMPLATE_THUMBNAIL)
        self.browser.clicks(self.LCT.V_MORPHOLOGIES_TEMPLATE_THUMBNAIL, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)
    def navigate_to_unclassified(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_TEMPLATE_UNCLASSIFIED)
        self.browser.click(self.LCT.V_MORPHOLOGIES_TEMPLATE_UNCLASSIFIED)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_TEMPLATE_THUMBNAIL, inverse=True)

    def view_each_beats_on_thumbnail(self, **on):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_BEATS_THUMBNAIL, inverse=True)
        _index = self._on_thumbnail_template(**on)
        self.browser.hover_to_by_index(self.LCT.V_MORPHOLOGIES_BEATS_THUMBNAIL, _index)
        self.browser.clicks(self.LCT.V_MORPHOLOGIES_BEATS_THUMBNAIL, on_elements=lambda i, _: i == _index,
                            stop_on_first=True)

    def get_current_total_pages_airp_pagination(self):
        self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_TOTAL_PAGE)
        output = self.browser.get_text(self.LCT.V_MORPHOLOGIES_TOTAL_PAGE)
        number_str = output.split('/')[1].strip()
        number = int(number_str)
        return number

    def edit_pages_number(self, page_number=None):
        if page_number:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_PAGE)
            element_input = self.browser.get_element(self.LCT.V_MORPHOLOGIES_PAGE)
            time.sleep(5)
            self.browser.click_by_offset(element_input, 20, 10)
            self.browser.input_text(self.LCT.V_MORPHOLOGIES_PAGE, page_number)
            self.browser.click_by_offset(element_input, 50, 20)
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_PAGE, inverse=True)
            if 'error' in self.browser.get_attribute_value(self.LCT.V_MORPHOLOGIES_PAGE, 'class'):
                return False
            else:
                return True

    def get_total_number_beats(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_EVENTS, inverse=True)
        while True:
            if self.get_current_total_pages_airp_pagination() == 1:
                elements = self.browser.get_elements(self.LCT.V_MORPHOLOGIES_EVENTS)
                return len(elements)
            else:
                time.sleep(2)
                number_events_on_page = self.browser.get_elements(self.LCT.V_MORPHOLOGIES_EVENTS)
                number_pages = self.get_current_total_pages_airp_pagination()
                self.edit_pages_number(page_number=number_pages)
                last_number_event = self.browser.get_elements(self.LCT.V_MORPHOLOGIES_EVENTS)
                total_events = ((number_pages - 1) * len(number_events_on_page)) + len(last_number_event)
                return total_events

    def _is_select_template_number(self, template_type=None):
        self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_SWAP_TEMPLATE, inverse=True)
        template_options = self.browser.get_elements(self.LCT.V_MORPHOLOGIES_SWAP_TEMPLATE_OPTION)
        hovered_element = None
        for element in template_options:
            if self.browser.get_text(element).lower() == template_type.lower():
                hovered_element = element
                break
        if hovered_element:
            self.browser.click(hovered_element, is_scroll=True)
            time.sleep(2)
            self.browser.click(self.LCT.V_MORPHOLOGIES_SWAP)
        self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_SWAP_TEMPLATE, inverse=True)

    def get_number_beats(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_NUMBER_BEATS_ON_TEMPLATE, inverse=True)
        elements = self.browser.get_text(self.LCT.V_MORPHOLOGIES_NUMBER_BEATS_ON_TEMPLATE)
        numbers = [re.findall(r'\d+', elem) for elem in elements]
        combined_number = ''.join(num for sublist in numbers for num in sublist)
        final_number = int(combined_number) if combined_number else 0
        print(final_number)
        return final_number

    def get_all_numbers_beats(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_ALL_NUMBER_BEATS, inverse=True)
        elements = self.browser.get_texts(self.LCT.V_MORPHOLOGIES_ALL_NUMBER_BEATS)
        numbers = [re.findall(r'\d+', elem)[0] for elem in elements if re.findall(r'\d+', elem)]
        print(numbers)
        return numbers

    def filter_action(self,is_save=False, is_swap_template=False,select_template_type=None,is_mark_as_reviewed=False,by_hotkey=False,
                      is_include_in_report=False,is_okay=False,is_back_second=False,is_next_second=False):
        if is_swap_template:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_SWAP_TEMPLATE, inverse=True)
            self.browser.click(self.LCT.V_MORPHOLOGIES_SWAP_TEMPLATE)
        if select_template_type:
            self._is_select_template_number(select_template_type)
        if is_save:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_TYPE_SAVE, inverse=True)
            self.browser.click(self.LCT.V_MORPHOLOGIES_TYPE_SAVE)
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_element_located(
                        self.LCT.V_MORPHOLOGIES_TYPE_SAVE) and self.browser.get_element(
                    self.LCT.V_MORPHOLOGIES_TYPE_SAVE).is_displayed():
                    self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_TYPE_SAVE, inverse=True)
                    break
                elif time.time() - start_time > 2 * 60:  # 2 minutes in seconds
                    return False
        if is_mark_as_reviewed:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_MARK_AS_REVIEWED)
            if by_hotkey:
                self.browser.action_by_keyword('R')
            else:
                self.browser.click(self.LCT.V_MORPHOLOGIES_MARK_AS_REVIEWED)
                self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_MARK_AS_REVIEWED, inverse=True)
        if is_include_in_report:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_INCLUDE_IN_REPORT)
            self.browser.click(self.LCT.V_MORPHOLOGIES_INCLUDE_IN_REPORT)
        if is_okay:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_OKAY_BUTTON)
            self.browser.click(self.LCT.V_MORPHOLOGIES_OKAY_BUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_OKAY_BUTTON, inverse=True)
        if is_back_second:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_BACK_TO_ECG_VIEWER_BUTTON)
            self.browser.click(self.LCT.V_MORPHOLOGIES_BACK_TO_ECG_VIEWER_BUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_BACK_TO_ECG_VIEWER_BUTTON, inverse=True)
        if is_next_second:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_NEXT_TO_ECG_VIEWER_BUTTON)
            self.browser.click(self.LCT.V_MORPHOLOGIES_NEXT_TO_ECG_VIEWER_BUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_NEXT_TO_ECG_VIEWER_BUTTON, inverse=True)


    def check_template_displayed(self):
        output = {
            'Identifier': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_INDENTIFIER)
                                  and 0 < len(self.browser.get_elements(self.LCT.V_MORPHOLOGIES_INDENTIFIER)) <= 10 else False,
            'Waveform': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_WAVEFORM)
                                and 0 < len(self.browser.get_elements(self.LCT.V_MORPHOLOGIES_WAVEFORM)) <= 10 else False,
            'Beat Count': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_ALL_NUMBER_BEATS)
                            and 0 < len(self.browser.get_elements(self.LCT.V_MORPHOLOGIES_ALL_NUMBER_BEATS)) <= 10 else False,
            'Swap Template': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_SWAP_TEMPLATE)
                                      and self.browser.get_element(self.LCT.V_MORPHOLOGIES_SWAP_TEMPLATE) else False,
            'Mark as reviewed': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_MARK_AS_REVIEWED)
                                 and self.browser.get_element(self.LCT.V_MORPHOLOGIES_MARK_AS_REVIEWED).is_enabled() else False,
            'Include in report': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_INCLUDE_IN_REPORT)
                                          and self.browser.get_element(self.LCT.V_MORPHOLOGIES_INCLUDE_IN_REPORT).is_enabled() else False,
            'Beat N': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_BEAT_N)
                               and self.browser.get_element(self.LCT.V_MORPHOLOGIES_BEAT_N) else False,
            'Beat S': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_BEAT_S)
                               and self.browser.get_element(self.LCT.V_MORPHOLOGIES_BEAT_S) else False,
            'Beat V': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_BEAT_V)
                               and self.browser.get_element(self.LCT.V_MORPHOLOGIES_BEAT_V) else False,
            'Beat Q': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_BEAT_Q)
                               and self.browser.get_element(self.LCT.V_MORPHOLOGIES_BEAT_Q) else False,
            'Delete Beat': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_DELETE_BEAT)
                                 and self.browser.get_element(self.LCT.V_MORPHOLOGIES_DELETE_BEAT) else False,
            'List of Beats': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_EVENTS)
                                 and self.browser.get_element(self.LCT.V_MORPHOLOGIES_EVENTS) else False,
            'All beats actions': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_ALL_BEATS_ACTIONS)
                                     and self.browser.get_element(self.LCT.V_MORPHOLOGIES_ALL_BEATS_ACTIONS) else False,
            'Page actions': True if self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_PAGE_ACTIONS)
                               and self.browser.get_element(self.LCT.V_MORPHOLOGIES_PAGE_ACTIONS) else False,
        }
        self.logger.info(output)
        return output

    def get_a_number_of_beats(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_BEATS_THUMBNAIL_ACTIVE, inverse=True)
        elements = self.browser.get_elements(self.LCT.V_MORPHOLOGIES_BEATS_THUMBNAIL_ACTIVE)
        return len(elements)

    def get_number_the_v_morphologies_list(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_WAVEFORM, inverse=True)
        elements = self.browser.get_elements(self.LCT.V_MORPHOLOGIES_WAVEFORM)
        return len(elements)

    def get_icon_in_template(self,timeout=10):
        try:
            self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_ICON_IN_TEMPLATE,timeout=timeout)
            element=self.browser.get_element(self.LCT.V_MORPHOLOGIES_ICON_IN_TEMPLATE)
            return element is not None
        except Exception:
            return False

    def get_modal_texts(self):
        self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_MODAL_CONTENT)
        headers = ['Title', 'Message']
        title = self.browser.get_text(self.LCT.V_MORPHOLOGIES_MODAL_HEADER)
        message = self.browser.get_text(self.LCT.V_MORPHOLOGIES_MODAL_BODY)
        contents = [title, message]
        output = Utils.group_tabular_data(headers, contents)
        self.logger.info(output)
        return [{k: v.replace('\n', ' | ') for k, v in c.items()} for c in output]

    def verify_popup_turn_off(self):
        try:
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_MODAL_CONTENT)
            self.browser.click(self.LCT.V_MORPHOLOGIES_OKAY_BUTTON)
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_MODAL_CONTENT, inverse=True)
            self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_OKAY_BUTTON, inverse=True)
            return True
        except Exception as e:
            self.logger.error(f"Popup did not close properly: {e}")
            return False

    def get_thumbnail_events(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.V_MORPHOLOGIES_THUMBNAIL_EVENTS, inverse=True)
        output = []
        contents = self.browser.get_texts(self.LCT.V_MORPHOLOGIES_THUMBNAIL_EVENTS)
        for item in contents:
            parts = item.split('\n')
            channel = parts
            data_dict = {
                'Channel': channel,
            }
            output.append(data_dict)
        self.logger.info(output)
        return output

    def get_time_strip_info(self):
        self.browser.wait_visibility_of_element_located(self.LCT.V_MORPHOLOGIES_TIME_STRIP_INFO)
        time.sleep(5)
        content = self.browser.get_text(self.LCT.V_MORPHOLOGIES_TIME_STRIP_INFO)

        try:
            date_part, time_range = content.split(", ")
            start_time, end_time = [t.strip() for t in time_range.split("-")]
            data_dict = {
                "Date": date_part,
                "Start Time": start_time,
                "Stop Time": end_time
            }
            self.logger.info(data_dict)
            return data_dict
        except Exception as e:
            self.logger.warn(f"[get_time_strip_info] Invalid format: '{content}' | Error: {e}")
            return {}



