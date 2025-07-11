TABS = 'class:tab-header'
# Prescription
PRESCRIPTION_BYPRESCRIPTION = 'xpath://div[contains(@aria-labelledby, "Prescription")]//div[@class="ant-select-selector"]'
PRESCRIPTION_BYPRESCRIPTION_OPTIONS = 'xpath://div[contains(@aria-labelledby, "Prescription")]//div[@class="ant-select-item-option-content"]'
PRESCRIPTION_SEARCHBY = 'xpath://div[contains(@aria-labelledby, "Prescription")]//*[contains(@class, "search-filter-btn")]'
PRESCRIPTION_SEARCHBY_OPTIONS = 'xpath://div[contains(@class, "ant-dropdown") and not(contains(@class, "ant-dropdown-hidden"))]//li[@data-menu-id]'
PRESCRIPTION_TEXTSEARCH = 'xpath://div[contains(@aria-labelledby, "Prescription")]//input[@placeholder]'
PRESCRIPTION_HEADER = 'xpath://div[contains(@aria-labelledby, "Prescription")]//th[@class="ant-table-cell"]'
PRESCRIPTION_CONTENT = 'xpath://div[contains(@aria-labelledby, "Prescription")]//tbody/tr[@data-row-key]/td[not(contains(@class, "px"))]'
PRESCRIPTION_CONTENT_PATIENTNAME = 'xpath://div[contains(@aria-labelledby, "Prescription")]//tbody/tr[@data-row-key]/td//button[contains(@class, "text-color-blue") and contains(@class, "overflow-text-btn")]'
PRESCRIPTION_BASICON = 'xpath://div[contains(@aria-labelledby, "Prescription")]//tbody/tr[@data-row-key]/td[contains(@class, "px")]//button'
# Active
ACTIVE_STUDY_DATA_ROOT = 'xpath://div[@class="study-card"]'
ACTIVE_SEARCHBY = 'xpath://div[contains(@aria-labelledby, "Active")]//*[contains(@class, "search-filter-btn")]'
ACTIVE_SEARCHBY_OPTIONS = 'xpath://div[contains(@class, "ant-dropdown") and not(contains(@class, "ant-dropdown-hidden"))]//li[@data-menu-id]'
ACTIVE_TEXTSEARCH = 'xpath://div[contains(@aria-labelledby, "Active")]//input[@placeholder]'
ACTIVE_DATA_ROOT = 'class:study-card'
ACTIVE_DATA_HEADER_1 = 'xpath:.//span[@class="title"]'
ACTIVE_DATA_CONTENT_1 = 'xpath:.//span[@class="title"]/../*[2]'
ACTIVE_DATA_CONTENT_PATIENTNAME = 'xpath://div[contains(@id, "panel-Active")]//div[contains(@class, "title-block")]/div[@class="fr"]/button'
ACTIVE_DATA_CONTENT_CAREPLAN = 'xpath://div[contains(@id, "panel-Active")]//div[contains(@class, "title-block") and contains(@class, "study-first")]//button[@class="study-card-content-btn"]'
ACTIVE_DATA_HEADER_2 = 'xpath:.//*[@class="info-col"][1]/div'
ACTIVE_DATA_CONTENT_2 = 'xpath:.//*[@class="info-col"][2]/div[not(@class)]'
ACTIVE_DATA_HEADER_4 = 'xpath:'
ACTIVE_DATA_CONTENT_4 = 'xpath:'
ACTIVE_BYBATIENT = 'xpath://div[contains(@aria-labelledby, "tab-Active")]//div[@class="ant-select-selector"]'
ACTIVE_BYBATIENT_OPTIONS = 'xpath://div[contains(@aria-labelledby, "tab-Active")]//div[@class="ant-select-item-option-content"]'
ACTIVE_FACILITYNAME = 'xpath:.//div[@class="facility-name"]'
ACTIVE_STUDYSTATUS = 'xpath:.//div[contains(@class, "study-card-status")]'
ACTIVE_STUDYPROGRESS = 'xpath:.//div[@class="study-duration"]//div[@class="remaining-time"]'
# Completed
COMPLETED_SEARCHBY = 'xpath://div[contains(@aria-labelledby, "Completed")]//*[contains(@class, "search-filter-btn")]'
COMPLETED_SEARCHBY_OPTIONS = 'xpath://div[contains(@class, "ant-dropdown") and not(contains(@class, "ant-dropdown-hidden"))]//li[@data-menu-id]'
COMPLETED_TEXTSEARCH = 'xpath://div[contains(@aria-labelledby, "Completed")]//input[@placeholder]'
COMPLETED_BYPATIENT = 'xpath://div[contains(@aria-labelledby, "tab-Completed")]//div[@class="select-ct-wrapper"]'
COMPLETED_BYPATIENT_OPTIONS = 'xpath://div[contains(@aria-labelledby, "tab-Completed")]//div[@class="ant-select-item-option-content"]'
COMPLETED_HEADER = 'xpath://div[contains(@aria-labelledby, "Completed")]//th[@class="ant-table-cell"]'
COMPLETED_CONTENT = 'xpath://div[contains(@aria-labelledby, "Completed")]//tbody/tr[@data-row-key]/td[not(contains(@class, "px"))]'
COMPLETED_CONTENT_PATIENTNAME = 'xpath://div[contains(@aria-labelledby, "Completed")]//tbody/tr[@data-row-key]/td[3]/div[contains(@class, "text-color-blue")]'
COMPLETED_CONTENT_STUDYID = 'xpath://div[contains(@aria-labelledby, "Completed")]//tbody/tr[@data-row-key]/td[1]/div[contains(@class, "text-color-blue")]'
