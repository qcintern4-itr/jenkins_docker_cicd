PATIENT_HEADER = 'xpath://div[@class="report-details-wrapper"]//div[@class="vertical-text-title"]/span'
PATIENT_CONTENT = 'xpath://div[@class="report-details-wrapper"]//*[contains(@class, "vertical-text-content")]/span'
REVIEWED_STATE = 'xpath://div[@class="report-details-wrapper"]//input[@class="ant-checkbox-input"]'
REVIEWED = 'xpath://div[@class="report-details-wrapper"]//span[contains(@class, "ant-checkbox") and not(contains(@class, "-inner"))]'
# Comment
ADDCOMMENT = 'xpath://span[contains(@class, "anticon-message")]/..'
ADDCOMMENT_BOX = 'xpath://div[@class="add-modal-wrapper"]//textarea[@placeholder="Comments..."]'
ADDCOMMENT_CONFIRM = 'xpath://div[@class="add-modal-wrapper"]//div[@class="modal-footer-buttons"]//button[contains(@class, "primary")]'
ADDCOMMENT_BACK = 'xpath://div[contains(@class, "header-navigation-left")]//div[@aria-label="Back"]'
# Interpretation
ADDINTERPRE = 'xpath://span[contains(@class, "anticon-message")]/..'
ADDINTERPRE_BOX = 'xpath://div[@class="ant-modal-content"]//textarea[@placeholder="Interpretation..."]'
ADDINTERPRE_OPTIONS = 'xpath://div[@class="ant-modal-content"]//div[@class="radio-item"]/label'
ADDINTERPRE_CONFIRM = 'xpath://div[@class="ant-modal-content"]//button[contains(@class, "ant-btn-primary")]'
ADDINTERPRE_CLOSE = 'xpath://div[@class="ant-modal-content"]//span[@aria-label="close"]/..'
# Save change
SAVECHANGES = 'xpath://span[@aria-label="save" and contains(@class, "anticon-save")]'
SAVECHANES_CONFIRMMSG = 'xpath://div[@class="ant-modal-content"]//div[@class="cl-body-content"]'
SAVECHANGES_SAVE = 'xpath://div[@class="ant-modal-content"]//button[contains(@class, "btn-primary")]'
SAVECHANGES_DISCARD = 'xpath://div[@class="ant-modal-content"]//button[1]'
# Leave site dialog
LEAVE_CONFIRMMSG = 'xpath://div[@class="ant-modal-content"]//div[@class="cl-body-content"]'
LEAVEDIALOG = 'xpath://div[@class="ant-modal-content"]//div[@class="confirmation-layout-wrapper"]'
LEAVE = 'xpath://div[@class="confirmation-layout-footer"]//span[text()="Leave"]/..'
# Report log
LOGREPORT_BUTTON = 'xpath://div[@class="report-details-wrapper"]//span[contains(@class, "anticon-history")]/..'
LOGREPORT_DATETIME = 'xpath://div[contains(@class, "report-log-display-data")]//div[contains(@class, "left-item")]/span'
LOGREPORT_CONTENT = 'xpath://div[contains(@class, "report-log-display-data")]//div[contains(@class, "right-item")]/span'
LOGREPORT_CLOSE = 'xpath://div[contains(@class, "ant-drawer-right") and contains(@class, "drawer-open")]//div[@class="ant-drawer-body"]//span[@aria-label="close"]/..'