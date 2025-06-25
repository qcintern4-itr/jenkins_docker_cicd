#!/usr/bin/env python3

try:
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import notification as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Notification(WebPage):

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def open_notification(self, is_open=True, is_close=False, clear_all=False):
        self.browser.wait_visibility_of_element_located(self.LCT.NOTIFICATION)
        if is_open:
            self.browser.js_click(self.LCT.NOTIFICATION)
        if is_close:
            self.browser.wait_visibility_of_element_located(self.LCT.NOTIFICATION_CLOSE)
            self.browser.click(self.LCT.NOTIFICATION_CLOSE)
        if clear_all:
            self.browser.wait_visibility_of_element_located(self.LCT.NOTIFICATION_CLEAR_ALL)
            self.browser.click(self.LCT.NOTIFICATION_CLEAR_ALL)

    def get_notifications(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.NOTIFICATION_DATA_DESC)
        output = []
        for root_element in self.browser.get_elements(self.LCT.NOTIFICATION_DATA_ROOT):
            row_data = {'title': self.browser.get_text(
                self.browser.get_child_element(root_element, self.LCT.NOTIFICATION_DATA_TITLE)
            ), 'description': self.browser.get_text(
                self.browser.get_child_element(root_element, self.LCT.NOTIFICATION_DATA_DESC)
            ), 'time': self.browser.get_text(
                self.browser.get_child_element(root_element, self.LCT.NOTIFICATION_DATA_TIME)
            ), 'read': True if 'UnRead' not in self.browser.get_attribute_value(root_element, 'class') else False}
            output.append(row_data)
        return output

    def _on_notification(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_notifications()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such notification exist under {_on}.')

    def delete_notification(self, is_delete=True, is_cancel=False, **on):
        _index = self._on_notification(**on)
        print(_index)
        element = self.browser.get_elements_by_condition(self.LCT.NOTIFICATION_CARD,
                                                         on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
        self.browser.hover_to(element)
        self.browser.wait_visibility_of_any_elements_located(self.LCT.NOTIFICATION_CARD)
        self.browser.js_click(self.LCT.NOTIFICATION_DELETE)
        if is_delete:
            self.browser.wait_visibility_of_element_located(self.LCT.NOTIFICATION_CONFIRM_DELETE)
            self.browser.click(self.LCT.NOTIFICATION_CONFIRM_DELETE)
        if is_cancel:
            self.browser.wait_visibility_of_element_located(self.LCT.NOTIFICATION_CANCEL_DELETE)
            self.browser.click(self.LCT.NOTIFICATION_CANCEL_DELETE)

    def open_what_new_notification(self):
        self.browser.wait_visibility_of_element_located(self.LCT.NOTIFICATION)
        self.browser.js_click(self.LCT.NOTIFICATION_WHAT_NEW)
