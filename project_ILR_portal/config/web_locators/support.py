# Support
SP_SENDSUPPORT = 'xpath://span[@aria-label="mail"]/..'
# Send support
SEND_FACILITY = 'xpath:(//div[contains(@class, "ant-drawer-right") and contains(@class, open)]//div[@class="ant-select-selector"])[1]'
SEND_FACILITY_OPTIONS = 'xpath://div[contains(@class, "ant-select-dropdown") and not(contains(@class, "dropdown-hidden"))]//div[@aria-selected and contains(@class, "select-item-option")]'
SEND_SUPPORT = 'xpath:(//div[contains(@class, "ant-drawer-right") and contains(@class, open)]//div[@class="ant-select-selector"])[2]'
SEND_SUPPORT_OPTIONS = 'xpath://div[contains(@class, "ant-select-dropdown") and not(contains(@class, "dropdown-hidden"))]//div[@aria-selected and contains(@class, "select-item-option")]'
SEND_EMAIL = 'xpath://div[contains(@class, "ant-drawer-right") and contains(@class, open)]//input[@placeholder="Enter email"]'
SEND_MESSAGE = 'xpath://div[contains(@class, "ant-drawer-right") and contains(@class, open)]//textarea[@placeholder="Enter your message"]'
SEND_SEND = 'xpath://div[contains(@class, "ant-drawer-right") and contains(@class, open)]//div[@class="send-button"]/button'