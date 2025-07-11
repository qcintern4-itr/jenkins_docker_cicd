TABS = 'xpath://ul[starts-with(@class, "top-nav-tabs")]//li'
FACILITY_INPUT = 'xpath://div[contains(@class, "select-facilities-select-input")]//input'
FACILITY_OPTIONS = 'xpath://div[starts-with(@id, "react-select")]'
CURRENTCATEGORY = 'xpath://div[starts-with(@class, "search-input-row")]//button[contains(@class, "dropdown-toggle")]'
CATEGORY_OPTIONS = 'xpath://div[@role="menu" and contains(@class, "show")]//button[@role="menuitem"]'
TEXTSEARCH = 'name:searchValue'
TEXTSEARCH_CLEAR = 'xpath://button[starts-with(@class, "custom-search-input__clear-btn")]'
# Open
OPEN_DATA_HEADER = 'xpath://div[contains(@class, "active")]//thead//th[not(@style)]'
OPEN_DATA_CONTENT = 'xpath://div[contains(@class,"active")]//tbody//td[not(position() > last() -1)]'
OPEN_DATA_CONTENT_ROW = 'xpath://div[contains(@class, "active")]//tbody//tr'
OPEN_DATA_CONTENT_VIEWREQUEST = 'xpath://div[contains(@class, "active")]//tbody//td[last()]//button'
# Resolved
RES_DATA_HEADER = 'xpath://div[contains(@class, "active")]//thead//th[not(@style)]'
RES_DATA_CONTENT = 'xpath://div[contains(@class, "active")]//tbody//td[not(position() > last() -1)]'
RES_DATA_CONTENT_ROW = 'xpath://div[contains(@class, "active")]//tbody//tr'
RES_DATA_CONTENT_VIEWREQUEST = 'xpath://div[contains(@class, "active")]//tbody//td[last()]//button'
# Support request details
SQUEST_RESOLVE = 'xpath://span[text()="Resolve"]/../..'
SQUEST_RESOLVE_CONFIRM = 'xpath://div[contains(@class, "show") and @role="dialog"]//button[starts-with(@class, "outline")]'
SQUEST_RESOLVE_CANCEL = 'xpath://div[contains(@class, "show") and @role="dialog"]//button[starts-with(@class, "text-btn")]'
SQUEST_MESSAGE_INPUT = 'xpath://textarea[@placeholder="Enter your message"]'
SQUEST_MESSAGE_SEND = 'xpath://div[@id="comment-input"]//button[starts-with(@class, "filled-btn")]'
SQUEST_REQUESTID = 'xpath://div[@class="header-support-detail-page"]//span[@class="content-request"]'
SQUEST_REQUESTTYPE = 'xpath:(//div[@class="title-block__content"])[2]'
SQUEST_FACILITY = 'xpath://div[@class="header-support-detail-page"]//button[@class="text-btn"]'
SQUEST_COMMENTFIELD = 'xpath://div[@id="body-left"]'
SQUEST_PATICIPANTS = 'xpath://div[@id="body-right"]//div[@class="user"]//div[@class="name"]'
SQUEST_BACKICON = 'xpath://img[@alt="Back icon"]'
SQUEST_STUDYLIST_HEADER = 'xpath://div[@class="studies-comment-table"]//th'
SQUEST_STUDYLIST_CONTENT = 'xpath://div[@class="studies-comment-table"]//tbody//td'
SQUEST_MESSAGE_SECTION = 'xpath:(//div[@class="description"])[position() > 1]'

SQUEST_AVATAR = 'xpath://div[@id="body-left"]//div[@class="comment-content"][position()>1 and position()<last()]//div[@class="avatar-wrapper"]'
SQUEST_NAME = 'xpath://div[@id="body-left"]//div[@class="comment-content"][position()>1 and position()<last()]//div[@class="name"]'
SQUEST_DATETIME = 'xpath://div[@id="body-left"]//div[@class="comment-content"][position()>1 and position()<last()]//div[@class="time"]'
SQUEST_DESCRIPTION = 'xpath://div[@id="body-left"]//div[@class="comment-content"][position()>1 and position()<last()]//div[@class="description"]'

SQUEST_INTERNAL_NOTES_ROW = 'xpath://div[@id="body-right"]//div[@class="internal__item"]'
SQUEST_INTERNAL_NAME = 'xpath://div[@id="body-right"]//div[@class="internal__item"]//div[@class="internal__name"]'
SQUEST_INTERNAL_ROLE = 'xpath://div[@id="body-right"]//div[@class="internal__item"]//div[@class="internal__name"]/span'
SQUEST_INTERNAL_DATETIME = 'xpath://div[@id="body-right"]//div[@class="internal__item"]//div[@class="internal__time"]'
SQUEST_INTERNAL_CONTENT = 'xpath://div[@id="body-right"]//div[@class="internal__item"]//div[@class="internal__content"]'

# Comment
SREQUEST_STUDY_ID = 'xpath://div[@id="body-left"]//div[@class="comment-content"][position() = 1]//div[@class="study-item"]'
SREQUEST_MESSAGE = 'xpath://div[@id="body-left"]//div[@class="comment-content"][position() = 1]//div[@class="description"]'
SREQUEST_MESSAGE_COMMUNICATION = 'xpath://div[@id="body-left"]//div[@class="comment-content"][position()>1 and position()<last()]'
#
PGN_NEXT = 'xpath://div[contains(@class,"active")]//div[@class="flex justify-center"]//span[text()=">"]'
SQUEST_INTERNAL_NOTE_INPUT = 'xpath://div[@id="body-right"]//div[@class="custom-text-input"]//textarea'
SQUEST_INTERNAL_NOTE_ADD = 'xpath://div[@id="body-right"]//button[@id="send-comment-btn"]'
SQUEST_INTERNAL_NAME = 'xpath://div[@class="internal__name"]'
SQUEST_INTERNAL_DATETIME = 'xpath://div[@class="internal__time"]'
SQUEST_INTERNAL_CONTENT = 'xpath://div[@class="internal__content"]'
SUPPORT_PGN_MESSAGE = 'xpath://div[@class="toast-message"]'
SQUEST_INTERNAL_ITEMS = 'xpath://div[@class="internal__item"]'
