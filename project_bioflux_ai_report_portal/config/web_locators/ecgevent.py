# Element
ECG_EVENT_SUBTAB = 'xpath://div[@class="templates-btn-container"]//button[contains(@class,"items-center")]'
ECG_EVENT_SUBTAB_ACTIVE = 'xpath://div[@class="left-column-tab"]//div[contains(@class,"active")]//button[contains(@class,"active")]'
# Rhythm events
ECG_EVENT_RHYTHM_LEFT_MENU = 'xpath:(//div[@class="templates-btn-container"])[3]//button[contains(@class,"items-center")]'
ECG_EVENT_RHYTHM_OPTION = 'xpath://button[contains(@class,"active")]//button[@class="options-btn"]'
ECG_EVENT_RHYTHM_MARK_ALL = 'xpath://div[contains(@class,"active")]//div[@class="left-column"]//div[text()="Mark all as artifact"]'
ECG_EVENT_RHYTHM_DELETE_ALL = 'xpath://div[contains(@class,"active")]//div[@class="left-column"]//div[text()="Delete all events"]'
ECG_EVENT_RHYTHM_RESET_ALL = 'xpath://div[contains(@class,"active")]//div[@class="left-column"]//div[text()="Reset all changes"]'
# Thumbnail header
ECG_EVENT_CHANGE_EVENT_TYPE = 'xpath://div[contains(@class,"active")]//img[@alt="Change Event icon"]/../..'
ECG_EVENT_CHANGE_EVENT_TYPE_DROPDOWN = 'xpath://div[@class="content"]//div[contains(@class,"control")]'
ECG_EVENT_CHANGE_EVENT_TYPE_OPTION = 'xpath://div[@class="content"]//div[contains(@class,"menu")]//div[contains(@class,"option")]'
ECG_EVENT_DELETE_EVENT = 'xpath://button[@id="btnDeleteRhythmEvents"]'
ECG_EVENT_MARK_ARTIFACT = 'xpath://button[@id="btnChangeArtifactRhythmEvents"]'
ECG_EVENT_CHANGE_EVENT_DURATION = 'xpath://button[@id="btnChangeEventDurationRhythmEvents"]'
ECG_EVENT_MARK_REVIEWED = 'xpath://button[@id="btnMarkReviewRhythmEvents"]'
ECG_EVENT_RESET_CHANGE = 'xpath://button[@id="btnResetRhythmEvents"]'
ECG_EVENT_FILTER_EVENT = 'xpath://button[@id="filterEventBtn"]'
ECG_EVENT_THUMBNAIL_EVENTS = 'xpath://div[contains(@class,"active")]//div[@class="strips-img-container"]//button//div[@class="bottom-left-corner"]'
ECG_EVENT_THUMBNAIL_EVENTS_SELECTED = 'xpath://div[@class="strips-img-container"]//button[contains(@class,"active")]//div[@class="bottom-left-corner"]'
ECG_EVENT_CHANGE_EVENT_DONE = 'xpath://div[@class="footer-btn"]//button[text()="Done"]'
ECG_EVENT_CHANGE_EVENT_TYPE_SAVE = 'xpath://div[@class="footer-btn"]//button[text()="Save"]'
ECG_EVENT_CHANGE_EVENT_CANCEL = 'xpath:(//div[@class="footer-btn"]//button)[1]'
ECG_EVENT_NUMBER_OF_BEATS = 'xpath://div[contains(@class,"active")]//button//div[@class="top-left-corner"]'
ECG_EVENT_NUMBER_OF_BEATS_SELECTED = 'xpath://div[contains(@class,"active")]//button[contains(@class,"active")]//div[@class="top-left-corner"]'

ECG_EVENT_EACH_EVENT = 'xpath://div[@id="stripEventsRhythmEvents"]//button[contains(@class,"single-strip")]'
ECG_EVENT_JUM_TO_START_TIME = 'xpath:(//div[@class="ant-modal-body"]//img[@alt="Jump to"]/..)[1]'
ECG_EVENT_JUM_TO_END_TIME = 'xpath:(//div[@class="ant-modal-body"]//img[@alt="Jump to"]/..)[2]'
ECG_EVENT_PICK_ON_END_TIME = 'xpath:(//div[@class="ant-modal-body"]//img[@alt="Pick on ECG viewer"]/..)[2]'
ECG_EVENT_ADD = 'xpath://div[@class="footer-btn"]//button[text()="Add"]'
# Beat events
ECG_EVENT_BEAT_EVENTS_MENU = 'xpath:(//div[@class="ant-collapse-content-box"])[1]//button[contains(@class,"items-center")]'
# ECG events
UNSAVED_SYMBOL = "xpath://img[@class='unapplied-changes-indicator' and @alt='Unapplied changes icon']"

ECG_EVENT_USE_ADD_ALL_AFIB_CHECKBOX = 'xpath://div[contains(@class, "custom-checkbox-container")]//label[@for="custom-checkbox-input-isUse100Afib-event"]'

ECG_EVENT_BOOKAMARKS = 'xpath://button[@id="ecg-bookmark"]'
ECG_EVENT_DELETE_BOOKMARK = 'xpath://button[@id="btnDeleteBookmark"]'