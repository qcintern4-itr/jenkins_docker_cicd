#!/usr/bin/env python3

try:
    from project_admin_portal.lib.WebPage import WebPage
    from project_admin_portal.config.web_locators import users as locators
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class Users(WebPage):
    """
    Handle Users page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def navigate_to_users(self):
        self.browser.open_page(self.URL + '/users')

    def filter_call_center_users(self, search_by=None, text_search=None):
        if search_by:
            self.browser.click(self.LCT.UCT_SEARCHBY)
            self.browser.clicks(self.LCT.UCT_SEARCHBY_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == search_by,
                                stop_on_first=True)
            Utils.wait_until(func=self.browser.get_attribute_value, args=(
                self.LCT.UCT_SEARCHBOX, 'placeholder'),
                             on_condition=lambda value: search_by.lower() in value.lower())
        if text_search:
            self.browser.input_text(self.LCT.UCT_SEARCHBOX, text_search)

    def get_users(self, row=None):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.US_DATA_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.US_DATA_CONTENT)
        headers = self.browser.get_texts(self.LCT.US_DATA_HEADER)
        return self.browser.get_tabular_data(headers, self.LCT.US_DATA_CONTENT, row=row)

    def _on_item(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        users = self.get_users()
        for i, user in enumerate(users):
            if on.items() <= user.items():
                return i
        raise Exception('No such user exist to edit')

    def open_edit_user_on(self, **on):
        _index = self._on_item(**on)
        element = self.browser.get_elements_by_condition(self.LCT.UCT_EDIT, on_elements=lambda i, _: i == _index,
                                                         stop_on_first=True)[0]
        self.browser.hover_to(element)
        self.browser.wait_visibility_of_any_elements_located(self.LCT.UCT_EDIT)
        self.browser.click(element)
