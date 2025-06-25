# Login
USERNAME = 'id:username'
PASSWORD = 'id:password'
SIGNIN = 'xpath://button[@type="submit"]'
ICONSHORTCUT = 'xpath://a[@class="shortcuts-widget-item"][2]'
ERRORMESSAGE = 'selector:div.error-message'
BF_RELEASE_VERSION = 'class:side-bar-version'
# # Left Menu
MENU_ITEMS = 'xpath://ul[@role="menu"]/li/*[@class="ant-menu-title-content" or @role="menuitem"]'
SUBMENU_ITEMS = 'xpath:.//*[@class="ant-menu-title-content"]/a'
# HEADER
CLINIC_INPUT = 'xpath://input[@role="combobox"]'
CLINIC_AREA = 'xpath://input[@role="combobox"]/../..'
CLINIC_OPTIONS = 'xpath://div[@aria-selected and @title]'
PAGEHEADER = 'xpath://div[@class="ant-page-header-heading"]'
# Bottom left notice message
BOTTOM_SUCCESSMESSAGE = 'xpath://div[contains(@class, "ant-notification-notice-success")]//div[contains(@class, "notification-notice-message")]'
BOTTOM_ERRMESSAGE = 'xpath://div[contains(@class, "ant-notification-notice-error")]//div[contains(@class, "notification-notice-message")]'
# Confirmation message
CONFIRM_MSG = 'xpath://div[@class="confirmation-layout-wrapper"]'
