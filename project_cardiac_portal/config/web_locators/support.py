# Support
SP_SENDSUPPORT = 'xpath://span[@aria-label="mail"]/..'
# Send support
SEND_FACILITY = 'xpath:(//div[contains(@class, "ant-drawer-right") and contains(@class, open)]//div[@class="ant-select-selector"])[1]'
SEND_FACILITY_OPTIONS = 'xpath://div[contains(@class, "ant-select-dropdown") and not(contains(@class, "dropdown-hidden"))]//div[@aria-selected and contains(@class, "select-item-option")]'
SEND_SUPPORT = 'xpath:(//div[contains(@class, "ant-drawer-right") and contains(@class, open)]//div[@class="ant-select-selector"])[2]'
SEND_SUPPORT_OPTIONS = 'xpath://div[contains(@class, "ant-select-dropdown") and not(contains(@class, "dropdown-hidden"))]//div[@aria-selected and contains(@class, "select-item-option")]'
SEND_EMAIL = 'xpath://div[@class="ant-select-selection-search"]//input'
SEND_MESSAGE = 'xpath://div[contains(@class, "ant-drawer-right") and contains(@class, open)]//textarea[@placeholder="Enter your message"]'
SEND_SEND = 'xpath://div[@class="button-container"]/button'
FILTER_SUPPORT = 'xpath://button[@class="ant-btn ant-btn-default custom-button ant-dropdown-trigger filter-button"]'
BUTTON_APPLY = 'xpath=//button[contains(@class, "ant-btn-primary") and .//span[text()="Apply"] and not(ancestor::div[contains(@style, "display: none")])]'
FILTER_OPENS_OPTIONS = 'xpath://label[.//input[@value="Open"] and not(ancestor::div[contains(@style, "display: none")])]'
FILTER_RESOLVED_OPTIONS = 'xpath://label[.//input[@value="Resolved"] and not(ancestor::div[contains(@style, "display: none")])]'
FILTER_WEB_OPTIONS = 'xpath://label[.//input[@value="WebPortalIssues"] and not(ancestor::div[contains(@style, "display: none")])]'
FILTER_OTHERS_OPTIONS = 'xpath://label[.//input[@value="Other"] and not(ancestor::div[contains(@style, "display: none")])]'

SUPPORT_LOADING = 'xpath://div[@class="ant-spin ant-spin-lg ant-spin-spinning"]'