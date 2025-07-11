PAGE_HEADER = 'xpath://div[@class="flex items-center"]'
ERRORMSG = 'xpath://div[contains(@class, "error-message")]'
OTHER_PAGE = 'xpath://div[@class="menu-icon-container"]//div[@class="sidebar-tab-content"]'
# Message from toast field
TOAST_ERRORMSG = 'xpath://img[@alt="Error message icon"]/..'
TOAST_SUCCESSMSG = 'xpath://img[@alt="Success message icon"]/..'
SIGNIN_ERROR_MSG = 'xpath://div[contains(@class, "__error-message")]'
# Login
USERNAME = 'xpath://*[@id="username"]'
USERNAME_CALLCENTER = 'xpath://*[@name="username"]'
PASSWORD = 'xpath://*[@id="password"]'
PASSWORD_CALLCENTER = 'xpath://*[@name="password"]'
SIGNIN = 'xpath://button[@type="submit"]'
SIGNIN_CALLCENTER = 'xpath://button[contains(@class, "sign-in-btn")]'
SIGNIN_LOADING = 'selector:.ant-btn-loading-icon'
ICONSHORTCUT = 'xpath://a[@class="shortcuts-widget-item"][1]'
ERRORMESSAGE1ST = 'selector:div.error-message'
RELEASE_VERSION = 'xpath://div[@class="footer-container"]'
FORGOT_PASSWORD = 'xpath://*[@class="forgot-password-btn"]'
FORGOT_PASSWORD_USERNAME = 'xpath://div[@class="reset-password-container__body"]//input'
FORGOT_PASSWORD_CONFIRM = 'xpath://div[@class="reset-password-container__body"]//button[2]'
FORGOT_PASSWORD_CANCEL = 'xpath://div[@class="reset-password-container__body"]//button[1]'
FORGOT_PASSWORD_GOBACK = 'xpath://button[contains(@class, "go-back-btn")]'
POPUP_VIDEO = 'xpath://div[@class="whats-new-modal"]'
POPUP_GOT_IT_VIDEO = 'xpath://button[@id="got-it-btn"]'
# Verify your email
VRE_MODEL1 = 'xpath://div[contains(@class, "confirm-modal-verify-account")]'
VRE_MODEL1_LATER = 'xpath://div[contains(@class, "confirm-modal-verify-account")]//button[contains(@class, "--black-text")]'
VRE_MODEL1_SEND = 'xpath://div[contains(@class, "confirm-modal-verify-account")]//button[@class="outline-btn"]'
VRE_MODEL2 = 'xpath://div[contains(@class, "send-email-modal")]'
VRE_MODEL2_CLOSE = 'xpath://div[contains(@class, "send-email-modal")]//img[@alt="Close icon"]/..'
VRE_MODEL2_SEND = 'xpath://div[contains(@class, "send-email-modal")]//button[contains(@class, "send-btn")]'
VRE_MODEL2_EMAIL = 'xpath://div[contains(@class, "send-email-modal")]//button[contains(@class, "send-btn")]'
# Menu
TOP_MENU_ITEMS = 'xpath://*[contains(@class, "sidebar-tab")]'
BOTTOM_MENU_WHATSNEW = 'xpath://*[@class="whats-new-icon"]'
BOTTOM_MENU_NOTIFICATIONS = 'xpath://*[@id="notification"]'
BOTTOM_MENU_AVATAR = 'xpath://*[@class="avatar-btn"]'
AVATAR_USERNAME = 'selector:div.user-info'
# Avatar Menu
AVATAR_LANG = 'xpath://*[@class="language"]'
AVATAR_LANG_SELECTIONS = 'xpath://div[contains(@class,"change-language-btn")]//button[@role="menuitem"]'
AVATAR_SIGNOUT = 'xpath://img[@alt="Sign out icon"]/..'
# Facility
FACILITY_CURRENT = 'xpath://div[@class="custom-select-facilities"]//div[@class="ant-select-selector"]'
FACILITY_INPUT = 'xpath://div[contains(@class, "custom-select-input")]//input'
FACILITY_SELECTIONS = 'xpath://div[contains(@class,"rc-virtual")]//div[@role="option"]'
FACILITY_SELECTIONS_STUDIES = 'xpath://div[contains(@class,"ant-select-item ant-select-item-option")]'
FACILITY_SELECTIONS_DEVICES = 'xpath://div[@class="custom-select-facilities"]//div[@role="option"]'
# Info views
STUDY_INFO_TITLE = 'xpath:.//div[@class="drawer-header"]'
STUDY_INFO_HEADER = 'xpath://div[@class="drawer-body"]'
STUDY_INFO_DATA_RAW = 'xpath:.//div[@class="drawer-item"]'
STUDY_INFO_GOTOSTUDYMANAGE = 'xpath://div[@class="link-text-container"]//button'
PATIENT_INFO_TITLE = 'selector:span.drawer-title'
PATIENT_INFO_HEADER = 'xpath:.//div[@class="drawer-header"]'
PATIENT_INFO_SUBHEADER = 'xpath:..//div[@class="drawer-item"]/span[1]'
PATIENT_INFO_SUBCONTENT = 'xpath:..//div[@class="drawer-item"]/span[2]'
DEVICE_INFO_TITLE = 'selector:span.drawer-title'
DEVICE_INFO_HEADER = 'xpath://div[@class="drawer-header"]'
DEVICE_INFO_SUBHEADER = 'xpath:..//div[@class="drawer-item"]//span[1]'
DEVICE_INFO_SUBCONTENT = 'xpath:..//div[@class="drawer-item"]//span[2]'
DEVICE_INFO_CLOSE = 'xpath://div[@class="drawer-title-container"]//span[@class="ant-btn-icon"]'
# text search
SEARCH_SEARCHBAR1ST = 'xpath://div[@class="tab-pane active"]//input[@name="searchValue"]'
SEARCH_SEARCHBAR2ST = 'xpath://div[@class="tab-pane active"]//input[starts-with(@id, "react-select")]'
SEARCH_CLEARTEXT = 'xpath://div[@class="tab-pane active"]//button[contains(@class, "custom-search-input__clear-btn")]'
FOOTER = 'class:login-container__footer'
FOOTER_DIRECT = 'xpath://div[@class="text-right"]'

# Edit status
STUDY_REPORT_PDF = 'xpath://iframe[@id="pdf-viewer"]'
STUDY_INBOX_REPORT_STATUS = 'xpath://div[@class="inbox-detail"]//div[@class="status-report"]//div[@class="ant-select-selector"]'
STUDY_INBOX_REPORT_STATUS_OPTION = 'xpath://div[@class="inbox-detail"]//div[@class="status-report"]//div[@class="ant-select-item-option-content"]'

username_1 = 'xpath://input[@id="username"]'
password_1 = 'xpath://input[@id="password"]'
signin_1 = 'xpath://button[@type="submit"]'
signin_diagnostics = 'xpath://*[@id="root"]/div/div/div/div/div/div[2]/div/div[2]/a[1]/div/h2'
click_icon = 'xpath://*[@id="scroll-wrapper"]/div/div[2]/div[4]/div/div/img'
click_signout = 'xpath://img[@alt ="Sign out icon"]'
click_studies = 'xpath://img[@alt ="Studies menu icon"]'
click_filter_patient_name = 'xpath://span[@title ="by Patient name"]'
click_filter_study_ID = 'xpath://*[@id="root"]/div[1]/section/div/div[2]/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div/div/div[2]/div'
click_textbox_search = 'xpath://input[@placeholder ="Search..."]'
click_button_openstudy = 'xpath://button[@id="view-study-btn"]'
verify_studyID = 'xpath://div[@class="item-content"]'
click_menu_patient = 'xpath://a[@href ="/patients"]'


