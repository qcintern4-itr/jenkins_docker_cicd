#!/usr/bin/env python3

try:
    from project_bioheart_portal.lib.WebPage import WebPage
    from project_bioheart_portal.config.web_locators import purchase_biosphereplus as locators

except ImportError as imp_err:
    print('There was an error importing files - From %s' % __file__)
    print('\n---{{{ Failed - ' + format(imp_err) + ' }}}---\n')
    raise


class PurchaseBiosphereplus(WebPage):

    def __init__(self, browser, env):
        super().__init__(browser, env, locators)
        self.LCT = locators  # re-assign to support inspect locators

    def upgrade_biosphereplus(self, pakages=None, billing_plan=None, email=None, country=None, address=None,
                              city=None, state=None, zip_code=None, phone_code=None, phone_number=None,
                              tax_code=None, tax_id=None, cc_number=None, card_expiry=None, card_cvc=None,
                              billing_name=None, region=None, enable_stripe=False, phone_num_stripe=None):
        self.browser.click(self.LCT.UPG_BIOSPEREPLUS)
        self.upgrade_biosphereplus_page_1(pakages=pakages, is_next=True)
        self.upgrade_biosphereplus_page_2(billing_plan=billing_plan, email=email, country=country, address=address,
                                          city=city, state=state, zip_code=zip_code, phone_code=phone_code,
                                          phone_number=phone_number, tax_code=tax_code, tax_id=tax_id, is_pay=True)
        self.upgrade_biosphereplus_page_3(cc_number=cc_number, card_expiry=card_expiry, card_cvc=card_cvc,
                                          billing_name=billing_name, region=region, enable_stripe=enable_stripe,
                                          phone_num_stripe=phone_num_stripe, subscribe=True)

    def upgrade_biosphereplus_page_1(self, pakages=None, is_next=True):
        if pakages:
            self.browser.clicks(self.LCT.UPG_PACKAGES_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == pakages.lower(),
                                stop_on_first=True)
        if is_next:
            self.browser.click(self.LCT.UPG_NEXT)

    def upgrade_biosphereplus_page_2(self, billing_plan=None, email=None, country=None, address=None, city=None,
                                     state=None, zip_code=None, phone_code=None, phone_number=None,
                                     tax_code=None, tax_id=None, is_pay=True):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_BILLING_PLAN)
        if billing_plan:
            self.browser.clicks(self.LCT.UPG_BILLING_PLAN,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == billing_plan.lower(),
                                stop_on_first=True)
        if email:
            self.browser.input_text(self.LCT.UPG_EMAIL)
        if country:
            self.browser.click(self.LCT.UPG_COUNTRY)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_OPTION)
            self.browser.clicks(self.LCT.UPG_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == country.lower(),
                                stop_on_first=True)
        if address:
            self.browser.input_text(self.LCT.UPG_ADDRESS_INPUT, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_ADDRESS_CITY_OPTION)
            self.browser.clicks(self.LCT.UPG_ADDRESS_CITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == address.lower(),
                                stop_on_first=True)
        if city:
            self.browser.input_text(self.LCT.UPG_CITY_INPUT, address)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_ADDRESS_CITY_OPTION)
            self.browser.clicks(self.LCT.UPG_ADDRESS_CITY_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == city.lower(),
                                stop_on_first=True)
        if state:
            self.browser.input_text(self.LCT.UPG_STATE, state)
        if zip_code:
            self.browser.input_text(self.LCT.UPG_ZIP_CODE, zip_code)
        if phone_code:
            self.browser.click(self.LCT.UPG_PHONE_CODE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_OPTION)
            self.browser.clicks(self.LCT.UPG_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == phone_code.lower(),
                                stop_on_first=True)
        if phone_number:
            self.browser.input_text(self.LCT.UPG_PHONE_NUMBER, phone_number)
        if tax_code:
            self.browser.click(self.LCT.UPG_TAX_CODE)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_OPTION)
            self.browser.clicks(self.LCT.UPG_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == tax_code.lower(),
                                stop_on_first=True)
        if tax_id:
            self.browser.input_text(self.LCT.UPG_TAX_ID, tax_id)
        if is_pay:
            self.browser.click(self.LCT.UPG_PAY_BTN)

    def upgrade_biosphereplus_page_3(self, cc_number=None, card_expiry=None, card_cvc=None, billing_name=None,
                                     region=None, enable_stripe=False, phone_num_stripe=None, subscribe=True):
        self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_CC_NUMBER)
        if cc_number:
            self.browser.input_text(self.LCT.UPG_CC_NUMBER, cc_number)
        if card_expiry:
            self.browser.input_text(self.LCT.UPG_CARD_EXPIRY, card_expiry)
        if card_cvc:
            self.browser.input_text(self.LCT.UPG_CARD_CCV, card_cvc)
        if billing_name:
            self.browser.input_text(self.LCT.UPG_BILLING_NAME, billing_name)
        if region:
            self.browser.click(self.LCT.UPG_REGION)
            self.browser.wait_visibility_of_all_elements_located(self.LCT.UPG_REGION_OPTION)
            self.browser.clicks(self.LCT.UPG_REGION_OPTION,
                                on_elements=lambda _, e: self.browser.get_text(e).lower() == region.lower(),
                                stop_on_first=True)
        if enable_stripe:
            self.browser.js_click(self.LCT.UPG_ENABLE_STRIPE)
            if phone_num_stripe:
                self.browser.input_text(self.LCT.UPG_PHONE_NUMBER_STRIPE_PASS, phone_num_stripe)
        if subscribe:
            self.browser.click(self.LCT.UPG_SUBSCRIBE)
