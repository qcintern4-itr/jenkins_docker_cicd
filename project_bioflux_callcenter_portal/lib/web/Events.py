#!/usr/bin/env python3
import time

try:
    from project_bioflux_callcenter_portal.lib.WebPage import WebPage
    from project_bioflux_callcenter_portal.config.web_locators import events as locators
    from selenium.webdriver import Keys
    from corelib import Utils
    import re

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Events(WebPage):
    """
    Handle events page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_events(self):
        self.browser.open_page(self.URL + '/events')

    def get_current_event_state(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS)
        element = self.browser.get_elements_by_condition(
            self.LCT.TABS + '/a', on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(
                e, 'class'), stop_on_first=True)[0]
        return self.browser.get_text(element).replace('\n', ' | ')

    def get_current_event_bucket(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBTABS)
        element = self.browser.get_elements_by_condition(
            self.LCT.SUBTABS, on_elements=lambda _, e: 'active' in self.browser.get_attribute_value(
                e, 'class'), stop_on_first=True)[0]
        return self.browser.get_text(element).replace('\n', ' | ')

    def get_event_columns(self):
        self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_CONTENT_ROOT + '[1]', inverse=True)
        return 'Two Columns' if 'two-columns' in self.browser.get_attribute_value(
            self.LCT.OPENEVENTS_CONTENT_ROOT + '[1]', 'class') else 'One Column'

    def navigate_to_event_menu(self, tab):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS) and self.browser.get_elements(self.LCT.TABS)[0].is_displayed():
                self.browser.clicks(self.LCT.TABS,
                                    on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(tab.lower()),
                                    stop_on_first=True)
                self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS, inverse=True)
                break
            elif time.time() - start_time > 5 * 60:
                break

    def filter_events(self, event_bucket=None, by_layout=None, text_search=None, exit_search_mode=False):
        if event_bucket:  # Maybe invisibility so perform JS click
            start_time = time.time()
            while True:
                if self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBTABS) and self.browser.get_elements(self.LCT.SUBTABS)[0].is_displayed():
                    self.browser.js_clicks(self.LCT.SUBTABS + '/span[starts-with(@class, "content")]',
                                           on_elements=lambda _, e: self.browser.get_text(e).lower() == event_bucket.lower(),
                                           stop_on_first=True)
                    break
                elif time.time() - start_time > 5 * 60:
                    break
        if by_layout:
            self.browser.click(self.LCT.BYLAYOUT)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.BYLAYOUT_OPTIONS)
            self.browser.clicks(self.LCT.BYLAYOUT_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == by_layout.lower(),
                                stop_on_first=True)
        if text_search is not None:
            self.browser.click(self.LCT.SEARCH_ICON)
            self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT, timeout=5)
            self.browser.input_text(self.LCT.SEARCH_INPUT, text_search)
            self.browser.get_element(self.LCT.SEARCH_INPUT).send_keys(Keys.ENTER)
            self.browser.wait_text_to_be_present_in_element(
                'class:events-match-container', f'Events match "{text_search}"')
        if exit_search_mode:
            self.browser.click(self.LCT.SEARCH_CLOSE)
            self.browser.wait_invisibility_of_element_located(self.LCT.SEARCH_INPUT)
        # self.wait_open_events_available()

    # Open events

    def wait_open_events_available(self):
        # self.browser.wait_invisibility_of_element_located('class:skeleton-gradient-background', timeout=10)
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.OPENEVENTS_CONTENT_ROOT) and self.browser.get_elements(self.LCT.OPENEVENTS_CONTENT_ROOT)[0].is_displayed():
                self.browser.wait_visibility_of_all_elements_located(self.LCT.OPENEVENTS_CONTENT_STRIPIMAGE, inverse=True)
                break
            elif time.time() - start_time > 3 * 60:
                break

    def check_open_event_items_available(self, event_items):
        map_items = {
            'event menu': self.browser.wait_visibility_of_all_elements_located(self.LCT.TABS),
            'event bucket': self.browser.wait_visibility_of_all_elements_located(self.LCT.SUBTABS),
            'search icon': self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_ICON),
            'search bar': self.browser.wait_visibility_of_element_located(self.LCT.SEARCH_INPUT),
            'change layout icon': self.browser.wait_visibility_of_element_located(self.LCT.BYLAYOUT),
            'start event processing': self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_STARTPROCESS),
            'stop processing': self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_STOPPROCESS),
            'event items': self.browser.wait_visibility_of_all_elements_located(self.LCT.OPENEVENTS_CONTENT_ROOT),
            'load more': self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_LOADMORE),  # button
            'close all': self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_CLOSEALL)
        }
        _items = [item.strip() for item in event_items.split(',')] if isinstance(event_items, str) else event_items
        output = dict()
        for item in _items:
            if item.lower() not in map_items:
                raise Exception(f'No such item `{item}` in list `{map_items.keys()}`.')
            output.update({
                item: map_items[item.lower()]
            })
        return output

    def start_open_event_processing(self):
        self.browser.click(self.LCT.OPENEVENTS_STARTPROCESS)
        self.wait_open_events_available()

    def stop_open_event_processing(self):
        self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_STOPPROCESS)
        self.browser.click(self.LCT.OPENEVENTS_STOPPROCESS)
        self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_STARTPROCESS)

    def get_open_events(self):
        # self.wait_open_events_available()
        output = []
        if self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_NO_OPEN) and self.browser.get_element(self.LCT.OPENEVENTS_NO_OPEN).is_displayed():
            self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_CONTENT_NODATA_TEXT, inverse=True)
            return self.browser.get_text(self.LCT.OPENEVENTS_CONTENT_NODATA_TEXT)  # Return msg if no data
        self.browser.wait_visibility_of_all_elements_located(self.LCT.OPENEVENTS_CONTENT_ROOT, inverse=True)
        for root_elem in self.browser.get_elements(self.LCT.OPENEVENTS_CONTENT_ROOT):
            # header
            header = self.browser.get_texts(self.browser.get_child_elements(root_elem, self.LCT.OPENEVENTS_HEADER1ST))
            header += [
                ' '.join(self.browser.get_text(self.browser.get_child_element(
                    root_elem, self.LCT.OPENEVENTS_HEADER2ST)).replace(':', '').split()[:2]),
                'Event Type', 'Strip Image']
            # content
            content = list()
            content.append(self.browser.get_text(self.browser.get_child_element(root_elem,
                                                                                self.LCT.OPENEVENTS_CONTENT_STUDYID)))
            content.append(self.browser.get_text(self.browser.get_child_element(root_elem,
                                                                                self.LCT.OPENEVENTS_CONTENT_EVENTID)))
            content.append(self.browser.get_text(self.browser.get_child_element(root_elem,
                                                                                self.LCT.OPENEVENTS_CONTENT_AISG)))
            content.append(self.browser.get_text(self.browser.get_child_element(
                root_elem, self.LCT.OPENEVENTS_CONTENT_EVENTTYPE))) if self.browser.get_child_element(
                root_elem, self.LCT.OPENEVENTS_CONTENT_EVENTTYPE) else content.append('Auto')
            content.append('Display') if self.browser.get_child_element(
                root_elem, self.LCT.OPENEVENTS_CONTENT_STRIPIMAGE) else content.append('Unavailable')
            # reformat output
            output.append({
                key: value for key, value in zip(header, content)
            })
        return output

    def get_open_events_buckets(self):
        header = self.browser.get_texts(self.LCT.SUBTABS + '//span[contains(@class, "content")]')
        content = self.browser.get_texts(self.LCT.SUBTABS + '//span[contains(@class, "count")]')
        return Utils.group_tabular_data(header, content, row=1)

    def _on_open_events_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        self.wait_open_events_available()
        all_data = self.get_open_events()
        _on = {key.replace(' ', '_').lower(): value for key, value in on.items()}
        for i, row in enumerate(all_data):
            _row = {re.sub(r'[()]', '', key).replace(' ', '_').lower(): value for key, value in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such open events exist on {_on}.')

    def move_open_events_to_viable_sub_tab_on(self, **on):
        _index = self._on_open_events_item(**on)
        self.wait_open_events_available()
        self.browser.hover_to_by_index(self.LCT.OPENEVENTS_CONTENT_ROOT, _index, is_scroll=True)
        self.browser.clicks(self.LCT.OPENEVENTS_CONTENT_MOVE, on_elements=lambda i, _: i == _index, stop_on_first=True,
                            is_scroll=True)

    # available with all open event buckets | except none-available and pause
    def close_single_open_event_as_on(self, close_option, **on):
        _index = self._on_open_events_item(**on)
        self.wait_open_events_available()
        if close_option:
            self.browser.hover_to_by_index(self.LCT.OPENEVENTS_CONTENT_ROOT, _index, is_scroll=True)
            self.browser.click_by_index(self.LCT.OPENEVENTS_CONTENT_CLOSE, _index)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.OPENEVENTS_CONTENT_CLOSE_OPTIONS)
            self.browser.clicks(self.LCT.OPENEVENTS_CONTENT_CLOSE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == close_option.lower(),
                                stop_on_first=True)

    def _toggle_open_events_checkbox_on(self, is_toggle=True, **on):
        self.wait_open_events_available()
        if 'row' in on and on['row'].lower() == 'all':
            self.browser.click(self.LCT.OPENEVENTS_CONTENT_CHECKBOX + '[1]/..')
            self.browser.clicks(self.LCT.OPENEVENTS_SELECTEDOPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == 'select all',
                                stop_on_first=True)
        else:
            _index = self._on_open_events_item(**on)
            for i, checkbox in enumerate(self.browser.get_elements(self.LCT.OPENEVENTS_CONTENT_CHECKBOX)):
                if i == _index:
                    self.browser.toggle_checkbox(checkbox, checkbox, is_toggle, is_scroll=True)

    def close_multiple_open_events_as_on(self, close_type, **on):
        if close_type.lower() not in ('close as valid', 'close as invalid', 'close all'):
            raise Exception(f'No such close option on {close_type}.')
        if self.get_current_event_bucket().lower().startswith('non-viable') and close_type.lower() == 'close all':
            self.browser.click(self.LCT.OPENEVENTS_CLOSEALL)
        else:
            self._toggle_open_events_checkbox_on(**on)
            self.browser.clicks(self.LCT.OPENEVENTS_SELECTEDOPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == close_type.lower(),
                                stop_on_first=True)

    def view_open_events_details_on(self, **on):
        self.wait_open_events_available()
        _index = self._on_open_events_item(**on)
        self.browser.hover_to_by_index(self.LCT.OPENEVENTS_CONTENT_ROOT, _index)
        self.browser.clicks(self.LCT.OPENEVENTS_CONTENT_EDITBT, on_elements=lambda i, _: i == _index,
                            stop_on_first=True, is_scroll=True)
        self.browser.switch_tab()

    def view_open_events_study_information_on(self, **on):
        _index = self._on_open_events_item(**on)
        self.wait_open_events_available()
        self.browser.clicks(self.LCT.OPENEVENTS_CONTENT_STUDYID, on_elements=lambda i, _: i == _index,
                            stop_on_first=True, is_scroll=True)

    def view_open_events_as_strip_on(self, **on):
        _index = self._on_open_events_item(**on)
        self.wait_open_events_available()
        self.browser.clicks(self.LCT.OPENEVENTS_CONTENT_VIEWALLTRIPS, on_elements=lambda i, _: i == _index,
                            stop_on_first=True, is_scroll=True)

    def open_event_details_from_view_all_strip(self, is_open=True):
        self.browser.wait_visibility_of_element_located('class:view-all-strips-container')
        if is_open:
            self.browser.click(self.LCT.OPENEVENTS_VIEWALLTRIPS_OPEN)

    def load_more_open_events(self):
        self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_LOADMORE)
        self.browser.scroll_into_view(self.LCT.OPENEVENTS_LOADMORE)
        self.browser.js_click(self.LCT.OPENEVENTS_LOADMORE)
        self.wait_open_events_available()
    #  Closed event: TBD maybe removed in next version

    def check_active_edit_event_technician(self):
        output = True if self.browser.wait_visibility_of_element_located(self.LCT.OPENEVENTS_EDIT_TECHNICIAN) and self.browser.get_element(self.LCT.OPENEVENTS_EDIT_TECHNICIAN).get_attribute('disabled') is None else False
        return output


