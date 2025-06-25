OVERVIEW_REPORTS = 'xpath://div[contains(@class, "ant-tabs-tab-btn")]//span[@class="tab-text"]'
REPORT_DATA_SAMPLE = 'xpath://div[@class="inbox-list"]//div[@class="inbox-item"]'
REPORT_PATIENTNAME = 'xpath:.//span[contains(@class, "patient-name")]'
REPORT_STUDYID = 'xpath:.//button[contains(@class, "study-id")]'
REPORT_TYPE = 'xpath:.//div[contains(@class, "--report-type")]'
REPORT_PRIORITY = 'xpath:.//div[contains(@class, "--priority")]'
REPORT_BIODIRECT = 'xpath:.//div[contains(@class, "--biodirect")]'
REPORT_TECHNICIAN_COMMENTS = 'xpath:.//div[contains(@class, "technician-comments__content")]'
REPORT_FACILITY = 'xpath:.//div[contains(@class, "facility-container")]'
REPORT_PATIENTID = 'xpath:.//div[@class="info-item patient-id"]//span'
REPORT_PHYSICIAN = 'xpath://div[@class="info-item"]//div[text()="Physician:"]/following-sibling::div'
REPORT_TIME = 'xpath:.//div[@class="info-item"]//div[text()="Date of service:"]/following-sibling::div'  # date_of_service or event_time
REPORT_TIME_NOTIFICATION = 'xpath://div[@class="info-item"]//div[(text()="Date of service:" or text()="Event Time:")]/following-sibling::div'
REPORT_STUDYTYPE = 'xpath:.//div[@class="info-item"]//div[text()="Study type:"]/following-sibling::div'
REPORT_COMMENTS = 'xpath:.//div[contains(@id, "technician-comments")]'
REPORT_UPDATED = 'xpath:.//div[contains(@class, "time")]/div'
CURRENT_REPORT_TYPE = 'xpath://div[contains(@class, "active")]//div[@class="tab-container"]'
ARTIFACT_REVIEW = 'xpath:.//div[@class="icon-container"]'
ARTIFACT_REVIEW_DETAIL = 'xpath://div[@class="flex items-center"]//div[@class="artifact-box"]'
REPORT_SORT_TIME = 'xpath://div[@class="time justify-end"]'
ARTIFACT_ICON = 'xpath://div[@class="icon-container"]/img'
# Filter
FACILITIES_CURRENT_PAGE = 'xpath://*[@class="flex items-center"]//following::div[2]'
SORT_REPORTS = 'xpath://div[@class="ant-tooltip-inner"]'
CURRENT_PAGE = 'xpath://div[contains(@class, "active")]//div[contains(@class, "inbox-list__header")]//span[1]'
CURRENTFACILITY = 'xpath://*[@title="All facilities"]'
FACILITY_SELECTIONS = 'xpath://div[@role="option"]//div[@class="ant-select-item-option-content"]'
SORT_ICON = 'xpath://div[contains(@class,"ant-tabs-tabpane-active")]//div[@class="right-container"]//button[@id="sort-btn"]'
PRIORITY_CURRENT = 'xpath://div[contains(@class,"ant-tabs-tabpane-active")]//div[@class="child-right"]//span[2]'
PRIORITY_OPTIONS = 'xpath://div[contains(@class, "child-right")]//div[contains(@class,"ant-select-item-option-content")]'
SEARCH_INPUT_NONPHYSICIAN = 'xpath://div[contains(@class,"ant-tabs-tabpane-active")]//div[contains(@class,"option-search")]//span[2]'
SEARCH_PHYSICIAN = 'xpath://*[@class="page-number-text"]//following::input[2]'
SEARCH_INPUT_PHYSICIAN = 'xpath://div[contains(@class,"active")]//div[@class="search-select"]//div[@class="ant-select-selector"]'
SEARCH_INPUT_INSTANT_PHYSICIAN = 'xpath://div[contains(@class,"active")]//div[@class="search-select"]//div[@class="ant-select-selector"]'
SEARCH_PHYSICIAN_DROPDOWN = 'xpath://div[@class="search-select"]//div[@class="ant-select-item-option-content"]'  # only for physician
SEARCH_INPUT = 'xpath:(//div[contains(@class,"ant-tabs-tabpane-active")]//div[contains(@class,"ant-space-compact")]//input)[1]'
SEARCH_INPUT_CLEARTEXT = 'xpath://div[contains(@class,"active")]//span[@class="ant-input-clear-icon"]'
SEARCH_INPUT_CLEARTEXT_PHYSICIAN = 'xpath://div[contains(@class,"active")]//span[@class="ant-select-clear"]//img[@alt="Clear icon"]'
SEARCHBY_ICON = 'xpath://div[contains(@class,"ant-tabs-tabpane-active")]//input[@type="text"]'
SEARCHBY_ELEMENT = 'xpath://div[contains(@class,"ant-tabs-tabpane-active")]//div[contains(@class,"option-search")]'
SEARCHBY_OPTIONS = 'xpath://div[@class="option-search"]//div[contains(@class, "ant-select-item ant-select-item-option")]'
SEARCHBY_STATUS = 'xpath:(//div[contains(@class,"ant-tabs-tabpane-active")]//div[contains(@class,"child-right")])[2]//div[@class="ant-select-selector"]'
SEARCHBY_STATUS_OPTION = 'xpath://div[@class="custom-checkbox-list"]//label'

# Report detail
REPORT_DETAIL_HEADER = 'xpath://*[@class="title-block__title"]'
REPORT_DETAIL_CONTENT = 'xpath://*[@class="title-block__content"]'
REPORT_DETAIL_REVIEWED_KEY = 'xpath://button[contains(@class,"review-button")]//span[2]'
REPORT_DETAIL_REVIEWED_CHECKBOX = 'xpath://div[@class="flex items-center"]//button[contains(@class,"review-button")]'
REPORT_DETAIL_SAVE = 'xpath://div[@class="floating-buttons"]//button[@id="save-btn"]'
REPORT_DETAIL_ADDINTERPRETATION = 'xpath://div[@class="floating-buttons"]//button[@id="add-interpretation-btn"]'
REPORT_DETAIL_DOWNLOAD = 'xpath://div[@class="floating-buttons"]//button[@id="download-btn"]'
REPORT_DETAIL_SIGNATURE = 'xpath://div[@class="floating-buttons"]//button[@id="add-signature-btn"]'
REPORT_DETAIL_COMMENTDIALOG = 'xpath://div[@class="ant-modal-content"]//div[contains(@class, "ant-modal")]'
REPORT_DETAIL_COMMENTINPUT = 'xpath://div[@class="ant-modal-body"]//textarea'
REPORT_DETAIL_ADDCOMMENT = 'xpath://button[@id="submit-btn"]'
REPORT_DETAIL_CLOSECOMMENT = 'xpath://button[@id="cancel-btn"]'
REPORT_DETAIL_DELETEICON = 'xpath://img[@alt="Delete icon"]'      # Instant reports
REPORT_DETAIL_DELETE_CONFIRM = 'xpath://div[contains(@class, "delete-instant-report-modal")]//button[starts-with(@class, "outline-btn")]'      # Instant reports
REPORT_DETAIL_OPENSTUYDY = 'xpath://img[@alt="Open study icon"]'     # Instant reports
REPORT_DETAIL_STUDYID = 'xpath:(//button[@id="hyperlink-btn"])[1]'     # Instant reports
REPORT_DETAIL_PATIENT = 'xpath:(//button[@id="hyperlink-btn"])[2]'     # Instant reports
REPORT_DETAIL_ARTIFACT_KEY = 'xpath://div[@class="artifact-box"]//span'     # Instant reports
REPORT_DETAIL_ARTIFACT_CONTENT = 'xpath:(//div[@class="ant-tooltip-inner"])[1]'     # Instant reports
REPORT_DETAIL_ARTIFACT_DATA = 'xpath://div[@class="no-data-container"]'     # Instant reports

REPORT_DATA_DETAIL = 'xpath://div[@class="inbox-detail"]//div[@class="title-block"]'
REPORT_PATIENTNAME_DETAIL = 'xpath:.//*[contains(@class, "patient-name")]'
PDF_VIEWER_ELEMENT = 'xpath://*[@id="pdf-viewer"]'
CANCEL_REPORT_DETAIL_ELEMENT = 'xpath://div[@class="flex items-center"]//button[contains(@class,"ant-btn-icon-only")]'
GO_NEXT_PAGE = 'xpath://div[contains(@class,"active")]//button[@id="navigation-right-btn"]'
INBOX_REPORT_TYPE = 'xpath://div[contains(@class, "active")]//div[@class="tab-container"]//span[@class="tab-text"]'
GO_PREVIOUS_PAGE = 'xpath://div[contains(@class,"active")]//button[@id="navigation-left-btn"]'

# All reports
All_REPORT_DATA_SAMPLE = 'xpath://div[@id="inbox-list-body"]//div[@class="inbox-item" or @class="inbox-item --new"]'
LOST_PGN_NEXT = 'xpath://div[contains(@class,"active")]//img[@alt="Next icon"]/../..'
LOST_BYROW = 'xpath://div[@role="tabpanel" and contains(@class,"active")]//div[not(@class="hidden")]//div[@class="ant-select-selector"]'
LOST_PGN_PREVIOUS = 'xpath://div[@role="tabpanel" and contains(@class,"active")]//div[not(@class="hidden")]//*[@title="Previous Page"]'
LOST_PGN_PAGENUM = 'xpath://div[@role="tabpanel" and contains(@class,"active")]//div[not(@class="hidden")]//*[contains(@class,"ant-pagination-item")]'
INBOX_TOAST_SUCCESSMSG = 'xpath://img[@alt="Success message icon"]/..'
NO_RESULTS_MESSAGE = 'xpath://div[@class="no-data__text"]//div'

# Report status
STUDY_REPORT_STATUS = 'xpath://div[contains(@class, "active")]//div[@class="icon-container"]//div[@class="ant-select-selector"]'
STUDY_REPORT_STATUS_OPTION = 'xpath://div[contains(@class, "active")]//div[@class="icon-container"]//div[@class="ant-select-item-option-content"]'
