FC_SEARCHBOX = 'xpath://div[@class="facilities-page"]//input[@name="Facility name"]'
FC_CREATENEWFACILITY = 'xpath://div[@class="facilities-page"]//a[contains(@class, "new-normal-btn")]'
FC_HEADER = 'xpath://div[@class="facilities-page"]//thead//th'
FC_CONTENT = 'xpath://div[@class="facilities-page"]//tbody/tr[@class]/td'
FC_CONTENT_ROOT = 'xpath://div[@class="facilities-page"]//tbody/tr[@class]'
FC_EDITICONS = 'xpath://div[@class="facilities-page"]//tbody/tr[@class]/td//a[contains(@class, "row-action-facility-button")]'
# Edit facility
ED_TABS_HEADER = 'xpath://div[contains(@class, "edit-page-facility")]//li[contains(@class, "custom-tab-nav")]'
ED_SAVE = 'xpath://div[contains(@class, "edit-page-facility")]//button[contains(@class, "edit-page-save-btn")]'
ED_INFOFIELDS = 'xpath://button[contains(@class, "toggle-infomation-btn")]'
# **Facility Information
FI_FACLITYNAME = 'name:facilityName'
FI_SHORTNAME = 'name:shortName'
FI_COUNTRY = 'xpath:((//div[contains(@class, "fix-facility-content")]/div)[1]//div[contains(@class, "select-input__control")])[1]'
FI_COUNTRY_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
FI_ADDRESS = 'xpath:(//div[contains(@class, "async-select-custom")])[1]/div//input'
FI_ADDRESS_OPTIONS = 'xpath:(//div[contains(@class, "async-select-custom")])[1]//div[contains(@class, "menu")]//div[contains(@class, "option") and contains(@class, "option")]'
FI_CITY = 'xpath:(//div[contains(@class, "async-select-custom")])[2]/div//input'
FI_CITY_OPTIONS = 'xpath:(//div[contains(@class, "async-select-custom")])[1]//div[contains(@class, "menu")]//div[contains(@class, "option") and contains(@class, "option")]'
FI_STATEBOX = 'xpath:(//div[contains(@class, "input-form")])[1]//input[@name="state"]'
FI_STATEDROPDOWN = 'xpath:((//div[contains(@class, "input-form")])[1]//div[contains(@class, "select-input__control")])[2]'
FI_STATE_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
FI_ZIPCODE = 'xpath:(//div[contains(@class, "input-form")])[1]//input[@name="zipCode"]'
FI_PHONENUMBER = 'xpath:(//div[contains(@class, "input-form")])[1]//input[contains(@name, "phoneNumber")]'
FI_FAX = 'xpath:(//div[contains(@class, "input-form")])[1]//div[contains(@class, "custom-multi-email")]//input'
FI_ADDCLINICSUPPORT = 'xpath://div[@class="clinician-contact-container"]//button[contains(@class, "add-clinician-contact-button")]'
FI_EDITCLINICSUPPORT = 'xpath://div[@class="clinician-contact-container"]//button[contains(@class, "tertiary-btn")]'
FI_FACILITYNOTE = 'name:facilityNote'
FI_DATA_HEADERS = 'xpath:(//div[contains(@class, "input-form")])[1]//div[contains(@class, "title") and not(contains(@class, "card"))]'
# > Clinic Support Contact
FI_CNS_ROOT = 'class:clinician-contact-card'
FI_CND_DATA_TITLE = 'xpath:.//div[@class="card-title"]'
FI_CNS_DATA_HEADER = 'xpath:.//span[@class="card-infomation__row-title"]'
FI_CND_DATA_CONTENT = 'xpath:.//span[@class="card-infomation__row-value"]'
# Add Clinic Support Contact
ACS_CLINICNAME = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//input[@name="name"]'
ACS_PHONENUMBER = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//input[@name="phone"]'
ACS_EMAIL = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//input[@name="email"]'
ACS_DESCRIPTION = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//textarea[@name="description"]'
ACS_ADDBUTTON = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//button[contains(@class, "save-btn")]'
# Edit Clinic Support Contact
ECS_NAME = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//input[@name="name"]'
ECS_PHONENUMBER = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//input[@name="phone"]'
ECS_EMAIL = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//input[@name="email"]'
ECS_DESCRIPTION = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//textarea[@name="description"]'
ECS_SAVEBUTTON = 'xpath://div[contains(@class, "add-edit-clinician-modal")]//button[contains(@class, "save-btn")]'
# **Facility Setting
FS_SERVICETYPE = 'xpath:((//div[contains(@class, "input-form")])[2]//div[contains(@class, "custom-select-input")])[1]/div'
FS_SERVICETYPE_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
FS_FACILITYSTATUS = 'xpath:((//div[contains(@class, "input-form")])[2]//div[contains(@class, "custom-select-input")])[2]/div'
FS_FACILITYSTATUS_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
FS_EVAL_STARTDATE = 'xpath://div[contains(@class, "ant-picker-input")]/input[@placeholder="Start date"]'
FS_EVAL_ENDDATE = 'xpath://div[contains(@class, "ant-picker-input")]//input[@placeholder="End date"]'
FS_NOTIFICATIONEMAIL = 'xpath:(//div[contains(@class, "input-form")])[2]//div[contains(@class, "custom-multi-email")]//input'
FS_EMAILS = 'xpath:(//div[contains(@class, "input-form")])[2]//div[contains(@class, "custom-multi-email")]/div[@data-tag]'
FS_FACILITYGROUP = 'xpath:((//div[contains(@class, "input-form")])[2]//div[contains(@class, "custom-select-input")])[3]/div'
FS_FACILITYGROUP_OPTIONS = 'xpath://div[contains(@class, "menu")]//div[contains(@class, "option") and contains(@id, "option")]'
FS_REPORTSFAXING = 'xpath:(//div[contains(@class, "input-form")])[2]//div[contains(@class, "custom-input-checkbox")]'
FS_REPORTSFAXING_CHECKBOX = 'xpath:(//div[contains(@class, "input-form")])[2]//div[contains(@class, "custom-input-checkbox")]/input'
FS_OTHERCONFIGS = 'xpath:(//div[contains(@class, "input-form")])[2]//label[contains(@for, "custom-toggle-input")]'
FS_DATA_HEADERS = 'xpath:(//div[contains(@class, "input-form")])[2]//div[contains(@class, "title")]'
FS_OTHERCONFIGHEADER = 'xpath:(//div[contains(@class, "input-form")])[2]//div[contains(@class, "other-congig")]'
# **Account payable
AP_ACCOUNTNAME = 'xpath:(//div[contains(@class, "input-form")])[3]//input[@name="name"]'
AP_EMAIL = 'xpath:(//div[contains(@class, "input-form")])[3]//input[@name="email"]'
AP_COUNTRY = 'xpath:((//div[contains(@class, "input-form")])[3]//div[contains(@class, "select-input__control")])[1]'
AP_COUNTRY_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
AP_ADDRESS = 'xpath:((//div[contains(@class, "input-form")])[3]//div[contains(@class, "async-select-custom")])[1]//input'
AP_ADDRESS_OPTIONS = 'xpath://div[contains(@class, "menu")]//div[contains(@class, "option") and contains(@class, "option")]'
AP_CITY = 'xpath:((//div[contains(@class, "input-form")])[3]//div[contains(@class, "async-select-custom")])[2]//input'
AP_CITY_OPTIONS = 'xpath://div[contains(@class, "menu")]//div[contains(@class, "option") and contains(@class, "option")]'
AP_STATEBOX = 'xpath:(//div[contains(@class, "input-form")])[3]//input[@name="state"]'
AP_STATE = 'xpath:((//div[contains(@class, "input-form")])[3]//div[contains(@class, "select-input__control")])[2]'
AP_STATE_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
AP_ZIPCODE = 'xpath:(//div[contains(@class, "input-form")])[3]//input[@name="zipCode"]'
AP_PHONENUMBER = 'xpath:(//div[contains(@class, "input-form")])[3]//input[contains(@name, "phoneNumber")]'
AP_FAX = 'xpath:(//div[contains(@class, "input-form")])[3]//input[@name="faxNumber"]'
AP_DAYSFINANCIALHOLD = 'xpath:(//div[contains(@class, "input-form")])[3]//div[contains(@class, "custom-radio-input")]//label'
AP_DATA_HEADERS = 'xpath:(//div[contains(@class, "input-form")])[3]//div[contains(@class, "title") and not(contains(@class, "card")) and not(@class="clinician-contact-title")]'
# Edit Device settings
DV_STUDYDURATION = 'name:studyDuration'
DV_PREEVENTTIME = 'xpath:((//div[contains(@class, "input-form")])[4]//div[contains(@class, "custom-select-input")])[1]//div[contains(@class, "select-input__control")]'
DV_PREEVENTTIME_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-portal")]//div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
DV_POSTEVENTTIME = 'xpath:((//div[contains(@class, "input-form")])[4]//div[contains(@class, "custom-select-input")])[2]'
DV_POSTEVENTTIME_OPTIONS = 'xpath://div[contains(@class, "select-input__menu-list")]//div[contains(@class, "select-input__option") and @id]'
DV_BRADYTHRS = 'name:bradyThrs'
DV_TACHYTHRS = 'name:tachyThrs'
DV_PAUSELVDURATION = 'name:pauseLvDuration'
DV_AFIBDETECTION = 'xpath://input[@name="afibDetection"]/../label'
DV_PAUSEDETECTION = 'xpath://input[@name="pauseDetection"]/../label'
DV_DIAGNOSTICLEAD = 'xpath://input[@name="diagnosticLead"]/../label'
DV_DATA_HEADERS = 'xpath:(//div[contains(@class, "input-form")])[4]//div[contains(@class, "title") and not(contains(@class, "card")) and not(contains(@class,"col"))]'
# Edit Assign devices
AD_ADDDEVICEBUTTON = 'xpath://div[contains(@class, "edit-assign-device")]//div[@class="device-btn"]/button'
AD_DEVICEID = 'xpath://div[contains(@class, "assign-device-modal")]//div[contains(@class, "react-select__value-container")]//input'
AD_DEVICEID_OPTIONS = 'xpath://div[contains(@class, "react-select__menu-list")]//div[contains(@class, "react-select__option") and @id]'
AD_BUTTON = 'xpath://div[contains(@class, "assign-device-modal")]//button[contains(@class, "add-btn")]'
AD_UNASSIGNBUTTON = 'xpath://button[contains(@class, "unassign-btn")]'
AD_DEVICECHECKBOXES = 'xpath://div[contains(@class, "edit-assign-device")]//tbody/tr[@class]//input[@type="checkbox"]'
AD_ALLDEVICECHECKBOX = 'xpath://div[contains(@class, "edit-assign-device")]//thead//th[@class="selection-cell-header"]/input[@type="checkbox"]'
AD_DATA_HEADER = 'xpath://div[contains(@class, "edit-assign-device")]//thead//th[not(@data-row-selection)]'
AD_DATA_CONTENT = 'xpath://div[contains(@class, "edit-assign-device")]//tbody//tr[@class]/td[not(@class="selection-cell")]'
AD_DATA_CONTENTROOT = 'xpath;//div[contains(@class, "edit-assign-device")]//tbody//tr[@class]'
AD_TOTALDEVICES = 'xpath://div[@class="total-devices"]//p'

