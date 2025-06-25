#!/usr/bin/env python3
import time

try:
    from project_bioflux_ai_report_portal.lib.WebPage import WebPage
    from project_bioflux_ai_report_portal.config.web_locators import pdf_report as locators
    from selenium.webdriver import Keys
    from corelib import Utils
    from datetime import datetime, timedelta
    import requests
    from bs4 import BeautifulSoup
    from selenium import webdriver

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class PdfReport(WebPage):
    """
    Handle Reports page
    """

    ROBOT_LIBRARY_SCOPE = 'SUITE'

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def wait_for_pdf_viewer_available(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(
                    self.LCT.ELEMENT_PDF_REPORT_IFRAME) and self.browser.get_element(
                    self.LCT.ELEMENT_PDF_REPORT_IFRAME).is_displayed():
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_IFRAME, inverse=True)
                break
            elif start_time - time.time() > 5 * 60:
                break

    def download_file_pdf(self):
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_DOWNLOAD) and self.browser.get_element(self.LCT.ELEMENT_PDF_REPORT_DOWNLOAD).get_attribute('disabled') is None:
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_DOWNLOAD, inverse=True)
                self.browser.click(self.LCT.ELEMENT_PDF_REPORT_DOWNLOAD)
                self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_DOWNLOAD, inverse=True)
                self.browser.get_download_file_pdf()
                break
            elif time.time() - start_time > 10 * 60:
                break

    def get_image_pdf_report_page(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_PAGE, inverse=True)
        self.browser.take_screenshot_by_element(self.LCT.ELEMENT_PDF_REPORT_PAGE, image_name='pdf_report_page')
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_PAGE, inverse=True)

    def hidden_pdf_viewer(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_IFRAME)
        self.browser.hide_element(self.LCT.ELEMENT_PDF_REPORT_IFRAME)

    def hidden_findings_pdf_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_FINDINGS)
        self.browser.hide_element(self.LCT.ELEMENT_PDF_REPORT_FINDINGS)

    def generate_pdf_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_GENERATE)
        self.browser.click(self.LCT.ELEMENT_PDF_REPORT_GENERATE)
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_GENERATE, inverse=True)

    def navigate_to_subtab_menu(self, tab):
        """
        Navigate to studies type (tab)
        :param tab: (str) Study type (tab)
        :return: None
        """
        start_time = time.time()
        while True:
            if self.browser.wait_visibility_of_all_elements_located(self.LCT.SUB_TABS) and self.browser.get_elements(self.LCT.SUB_TABS + '/a')[0].get_attribute('disabled') is None:
                self.browser.wait_visibility_of_all_elements_located(self.LCT.SUB_TABS + '/a')
                self.browser.clicks(self.LCT.SUB_TABS + '/a',
                                    on_elements=lambda _, e: self.browser.get_text(e).lower().startswith(tab.lower()),
                                    stop_on_first=True)
                break
            elif time.time() - start_time > 3 * 60:
                break

    def update_findings_on_pdf_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_FINDINGS)
        self.browser.wait_visibility_of_element_located(self.LCT.UPDATE_FINDINGS)
        self.browser.click(self.LCT.UPDATE_FINDINGS)
        self.browser.wait_visibility_of_element_located(self.LCT.CONTINUE_BUTTON)
        self.browser.click(self.LCT.CONTINUE_BUTTON)
        self.browser.wait_visibility_of_element_located(self.LCT.UPDATE_FINDINGS, inverse=True, timeout=10)

    def get_fingdings_pdf_report(self):
        self.browser.wait_visibility_of_element_located(self.LCT.ELEMENT_PDF_REPORT_FINDINGS)
        return self.browser.get_element(self.LCT.ELEMENT_PDF_REPORT_FINDINGS).get_attribute('value')
