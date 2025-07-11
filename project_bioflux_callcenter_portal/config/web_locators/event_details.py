NAV_HEADER = 'xpath://div[@class="title-block-container"]//div[@class="title-block__title"]'
NAV_CONTENT = 'xpath:(//div[@class="title-block-container"]//div[contains(@class, "items-center")])'
NAV_BOOKMARK = 'xpath://img[@alt="Bookmark icon"]'
NAV_BACK = 'xpath://img[@alt="Back icon"]/..'
NAV_TABS = 'xpath://ul[starts-with(@class, "top-nav-tabs")]//li/a'
CLEAR_ICON = 'xpath://img[@alt="Clear icon"]/..'
# Event details
EDET_EVENTTYPE = 'xpath:(//button[contains(@class, "dropdown-toggle")])[1]'
EDET_EVENTTYPE_OPTIONS = 'xpath://div[contains(@class, "show") and @role="menu"]//button'
EDET_EVENTVALIDITY = 'xpath:(//button[contains(@class, "dropdown-toggle")])[2]'
EDET_EVENTVALIDITY_OPTIONS = 'xpath://div[contains(@class, "show") and @role="menu"]//button'
EDET_INCLUDEREPORT = 'xpath://input[@name="isIncludedToReport"]'
EDET_EVENTCALL = 'xpath:(//button[contains(@class, "dropdown-toggle")])[3]'
EDET_EVENTCALL_OPTIONS = 'xpath://div[contains(@class, "show") and @role="menu"]//button'
EDET_CONTENT_ROOT = 'xpath://div[contains(@class,"active")]//div[@class="custom-body"]//div[contains(@class, "detail-card")]'
EDET_SAVE = 'id:save-btn'
EDET_CLOSE = 'xpath://div[contains(@class,"active")]//button[@id="save-btn"]/..//button[2]'
EDET_COMMENTFIELD = 'name:comments'
EDET_COMMENTEVENTTAG = 'class:event-list-tags'
# Notification criteria
NOTIF_CONTENT = 'class:notification-criteria-tab'
NOTIF_CONTENT_ROOT = 'xpath://div[contains(@class, "active")]//div[@class="header-container"]'
# Event details
EDET_EVENT_TAG = 'xpath://div[contains(@class,"active")]//div[@class="event-list-tags"]'
EDET_EVENT_TAG_OPTION = 'xpath://div[contains(@class,"active")]//div[@class="event-list-tags"]//div[contains(@class,"event-tags-select-input__option")]'
EDET_EVENT_SAVE_BUTTON = 'xpath://div[contains(@class,"active")]//button[@id="save-btn"]'
EDET_EVENT_INPUT = 'xpath://div[contains(@class,"active")]//div[@class="event-list-tags"]//div[contains(@class,"event-tags-select-input__value-container")]'
EDET_EVENT_CLEAR = 'xpath://div[contains(@class,"active")]//div[@class="event-list-tags"]//div[contains(@class,"event-tags-select-input__multi-value__remove")]'
EDET_TECHNICIAN_COMMENTS_INPUT = 'xpath://div[contains(@class,"active")]//textarea[@name="comments"]'
EDET_COUNT_USER = 'xpath://div[@class="top-container"]//div[@class="conflict-user-icon"]'
EDET_ICON_GENARATE = 'xpath://button[@id="bt-generate"]'
EDET_EVENT_PARAMETERS = 'xpath://div[@id="event-duration-tooltip"]//input'
EDET_EVENT_REPORT_PDF = 'xpath://iframe[@id="pdf-viewer"]'
EDET_EVENT_REPORT_DETAIL = 'xpath:(//ul[starts-with(@class, "top-nav-tabs")]//li/a)[3]'
EDET_EVENT_MIN_HR_INPUT = 'xpath://div[@class="relative"]//input[@name="minHr"]'
EDET_EVENT_MAX_HR_INPUT = 'xpath://div[@class="relative"]//input[@name="maxHr"]'
EDET_EVENT_EVENT_DURATION_INPUT = 'xpath://div[@class="relative"]//input[@name="eventDuration"]'

# event report
EVENT_REPORT_STATUS = 'xpath://*[@id="report-status-btn"]'
EVENT_REPORT_ASSIGN = 'xpath://button[@id="assign-this-report-to-me"]'
EVENT_REPORT_ASSIGNED = 'xpath://div[@id="assignee-info-box"]'
EVENT_REPORT_DISMISS = 'xpath://button[@class="item-more" and text()="Dismiss report"]'
EVENT_REPORT_UPLOAD = 'xpath://button[@id="bt-upload"]'
EVENT_REPORT_PRIORITY = 'xpath://*[@id="report-status-btn"]/..//div[contains(@class,"custom-select-input")]'
EVENT_REPORT_PRIORITY_OPTION = 'xpath://div[@class="event-report-tab"]//div[contains(@class,"menu")]//div[contains(@class,"option")]'
EVENT_REPORT_SEND_BUTTON = 'xpath://button[@id="unassign-send-dissmiss-report-btn"]'
EVENT_REPORT_CANCEL_BUTTON = 'xpath://button[@id="cancel-send-dissmiss-report-btn"]'
EVENT_REPORT_RECALL = 'xpath://button[@id="recall-report-btn"]'
EVENT_REPORT_LOADING = 'xpath://div[@class="pdf-loading-container"]//div[@class="pdf-loading__text"]'
EVENT_REPORT_SENT_MESSAGE = 'xpath://div[@class="report-sent-notificatin-container"]'
EVENT_REPORT_DOWNLOAD = 'xpath://button[@id="bt-download"]'
EVENT_REPORT_EMAIL = 'xpath://button[@id="bt-email"]'
EVENT_ICON_MORE = 'id:ic-more'

# MSG
EDET_MESSAGE = 'xpath://div[@id="toast-container"]//div[@class="toast-message"]'
EDET_MESSAGE_CHARACTER = 'xpath://div[@id="toast-container"]//div[@class="toast toast-error"]'
EDET_MESSAGE_LOCKING = 'xpath://div[@class="top-container"]//div[contains(@class,"info-warning")]//span[@class="text"]'
EDET_MESSAGE_EVENT_REPORT = 'xpath:(//div[@class="modal-content"]//following::div)[1]'
EDET_MESSAGE_DISMISSED_REPORT = 'xpath://div[@class="dismissed-report-notification"]'

# Interim report
INTERIM_PRIORITY = 'xpath://div[@class="button-row"]//div[contains(@class,"custom-select-input")]//div[contains(@class,"control")]'
INTERIM_PRIORITY_OPTION = 'xpath://div[@class="button-row"]//div[contains(@class,"menu")]//div[contains(@class,"option")]'
INTERIM_REPORT_STATUS = 'xpath://div[@id="report-status-btn"]//button'
INTERIM_DISMISS = 'xpath://div[@id="dismiss-reenable-btn"]//button'
INTERIM_CANCEL = 'xpath://button[@id="cancel-send-dissmiss-report-btn"]'
INTERIM_SUBMIT = 'xpath://button[@id="unassign-send-dissmiss-report-btn"]'
INTERIM_ASSIGN = 'xpath://button[@id="assign-this-report-to-me"]'
INTERIM_ASSIGNED = 'xpath://div[@id="assignee-info-box"]'
INTERIM_CHECK_MARKASARTIFACT = 'xpath://div[@class="tooltip-inner"]'
INTERIM_REPORT_MARKASARTIFACT = 'id:bt-artifact'
INTERIM_SAVE_REPORT = 'id:saveReportBtn'


