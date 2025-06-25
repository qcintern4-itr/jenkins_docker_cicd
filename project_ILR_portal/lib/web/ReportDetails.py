try:
    from project_cardiac_portal.lib.WebPage import WebPage
    from project_cardiac_portal.config.web_locators import report_details as locators
    from project_cardiac_portal.lib.web.Common import Common as common

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class ReportDetails(WebPage):
    """
    Handle Report details page
    """
    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators

    def get_report_details(self):  # PDF report file: to be handled
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PATIENT_HEADER)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.PATIENT_CONTENT)
        header = self.browser.get_texts(self.LCT.PATIENT_HEADER)
        return self.browser.get_tabular_data(header, self.LCT.PATIENT_CONTENT)

    def toggle_review_report(self, value=True):
        self.browser.wait_visibility_of_element_located(self.LCT.REVIEWED_STATE)
        self.browser.toggle_checkbox(self.LCT.REVIEWED_STATE, self.LCT.REVIEWED, value)

    def get_report_log(self):
        self.browser.click(self.LCT.LOGREPORT_BUTTON)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.LOGREPORT_DATETIME)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.LOGREPORT_CONTENT)
        date_time = self.browser.get_texts(self.LCT.LOGREPORT_DATETIME)
        # close dialog
        self.browser.click(self.LCT.LOGREPORT_CLOSE)
        return self.browser.get_tabular_data(date_time, self.LCT.LOGREPORT_CONTENT)

    def add_comments(self, comments=None, is_clear=True):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ADDCOMMENT)
        self.browser.click(self.LCT.ADDCOMMENT)
        if comments:
            self.browser.input_text(self.LCT.ADDCOMMENT_BOX, comments, is_clear)
        self.browser.click(self.LCT.ADDCOMMENT_CONFIRM)
        self.browser.wait_invisibility_of_element_located(self.LCT.ADDCOMMENT_BOX + '/../../../..')

    def add_interpretation(self, interpretation=None, option=None, is_clear=True, is_add=True):
        self.browser.wait_visibility_of_element_located(self.LCT.ADDINTERPRE)
        self.browser.click(self.LCT.ADDINTERPRE)
        if interpretation:
            self.browser.input_text(self.LCT.ADDINTERPRE_BOX, interpretation, is_clear)
        if option:
            self.browser.clicks(self.LCT.ADDINTERPRE_OPTIONS,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == option.lower(),
                                stop_on_first=True)
        if is_add:
            self.browser.click(self.LCT.ADDINTERPRE_CONFIRM)
        self.browser.wait_invisibility_of_element_located(self.LCT.ADDINTERPRE_BOX + '/../../../..')

    def save_changes(self, is_save=True):
        self.browser.click(self.LCT.SAVECHANGES)
        confirm_msg = self.browser.get_text(self.LCT.SAVECHANES_CONFIRMMSG)
        if is_save:
            self.browser.click(self.LCT.SAVECHANGES_SAVE)
        else:
            self.browser.click(self.LCT.SAVECHANGES_DISCARD)
        self.browser.wait_invisibility_of_element_located(self.LCT.SAVECHANES_CONFIRMMSG + '/../..', timeout=30)
        return confirm_msg

    def get_comments(self):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ADDCOMMENT)
        self.browser.click(self.LCT.ADDCOMMENT)
        self.browser.wait_visibility_of_element_located(self.LCT.ADDCOMMENT_BOX)
        output = self.browser.get_text(self.LCT.ADDCOMMENT_BOX)
        # Close dialog after get comment
        self.browser.click(self.LCT.ADDCOMMENT_CONFIRM + '/../button[1]')
        return output

    def get_interpretation(self):
        self.browser.click(self.LCT.ADDINTERPRE)
        self.browser.wait_visibility_of_element_located(self.LCT.ADDINTERPRE_BOX)
        self.browser.wait_visibility_of_all_elements_located(self.LCT.ADDINTERPRE_OPTIONS)
        output = dict()
        output['Interpretation'] = self.browser.get_text(self.LCT.ADDINTERPRE_BOX)
        for e in self.browser.get_elements(self.LCT.ADDINTERPRE_OPTIONS):
            if 'checked' in self.browser.get_attribute_value(e, 'class'):
                output['Selected option'] = self.browser.get_text(e)
        # Close dialog after get interpretation
        self.browser.click(self.LCT.ADDINTERPRE_CLOSE)
        return output

    def back_from_report_details(self, is_leave=True):
        self.browser.click(self.LCT.ADDCOMMENT_BACK)
        if self.browser.wait_visibility_of_element_located(self.LCT.LEAVEDIALOG):
            confirm_msg = self.browser.get_text(self.LCT.LEAVE_CONFIRMMSG)
            if is_leave:
                self.browser.click(self.LCT.LEAVE)
            else:
                self.browser.click(self.LCT.LEAVE + '/../button[contains(@class, "btn-primary")]')
            return confirm_msg

    def send_report_details(self):
        pass
