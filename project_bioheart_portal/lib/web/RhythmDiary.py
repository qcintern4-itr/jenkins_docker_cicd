#!/usr/bin/env python3

try:
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import rhythm_diary as locators
    from selenium.webdriver import Keys
    from corelib import Utils

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class RhythmDiary(WebPage):

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def select_tab(self, tab):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RHY_TAB)
        self.browser.clicks(self.LCT.RHY_TAB,
                            on_elements=lambda _, e: self.browser.get_text(e).lower() == tab.lower(),
                            stop_on_first=True)

    def get_info_snapshot(self):
        output = []
        self.browser.wait_visibility_of_element_located(self.LCT.RHY_SNAPSHOT_NOTE)
        for root_element in self.browser.get_elements(self.LCT.RHY_SNAPSHOT_ROOT):
            row_data = {
                'start_time': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.RHY_SNAPSHOT_START_TIME)),
                'created_time': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.RHY_SNAPSHOT_CREATED_TIME)),
                'duration': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.RHY_SNAPSHOT_DURATION)).replace('\n', ' '),
                'heart_rate': self.browser.get_text(
                    self.browser.get_child_element(root_element, self.LCT.RHY_SNAPSHOT_HR)).replace('\n', ' '),
                'tags': self.browser.get_texts(
                    self.browser.get_child_elements(root_element, self.LCT.RHY_SNAPSHOT_TAG)),
                'notes': None if not self.browser.get_child_element(root_element, self.LCT.RHY_SNAPSHOT_NOTE) else
                self.browser.get_text(self.browser.get_child_element(root_element, self.LCT.RHY_SNAPSHOT_NOTE)),
                'star': False if not self.browser.get_child_element(root_element, self.LCT.RHY_SNAPSHOT_STAR) else True
            }
            output.append(row_data)
        return output

    def _on_snapshot_info(self, **on):
        if 'row' in on:
            return int(on['row']) - 1
        data = self.get_info_snapshot()
        _on = {k.replace(' ', '_').lower(): v for k, v in on.items()}
        for i, row in enumerate(data):
            _row = {k.replace(' ', '_').lower(): v for k, v in row.items()}
            if _on.items() <= _row.items():
                return i
        raise Exception(f'No such notification exist under {_on}.')

    def click_on_snapshot(self, **on):
        _index = self._on_snapshot_info(**on)
        print(_index)
        self.browser.wait_visibility_of_any_elements_located(self.LCT.RHY_SNAPSHOT_ROOT)
        element = self.browser.get_elements_by_condition(self.LCT.RHY_SNAPSHOT_ROOT,
                                                         on_elements=lambda i, _: i == _index, stop_on_first=True)[0]
        self.browser.click(element)

    def get_info_snapshot_detail(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.RHY_SNAPSHOT_DETAIL)
        header = ["start_time", "heart_rate", "tags", "notes"]
        content = [self.browser.get_text(self.LCT.RHY_SNAPSHOT_DETAIL_START),
                   self.browser.get_text(self.LCT.RHY_SNAPSHOT_DETAIL_HR).replace('\n', ' ').strip(),
                   self.browser.get_texts(self.LCT.RHY_SNAPSHOT_DETAIL_TAG),
                   None if not self.browser.wait_visibility_of_element_located(self.LCT.RHY_SNAPSHOT_DETAIL_NOTE,
                                                                               timeout=3) else self.browser.get_text(
                       self.LCT.RHY_SNAPSHOT_DETAIL_NOTE)
                   ]
        return dict(zip(header, content))
