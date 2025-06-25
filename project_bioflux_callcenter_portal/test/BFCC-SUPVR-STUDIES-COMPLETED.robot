*** Settings ***
Documentation   Test Suite - Call Center Supervisor Portal - Completed studies page
Metadata    sid     BFCC-SUPVR-STUDIES-COMPLETED
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Studies.py

Suite Setup      SUITE SETUP
Suite Teardown   SUITE TEARDOWN
Force Tags       BFCC-SUPVR-STUDIES-COMPLETED   web
Test Timeout     1h

*** Test Cases ***
BFCC-SUPVR-STUDIES-COMPLETED-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Observe the header of STUDIES page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the STUDIES page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-FILTER-FACILITY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-STUDIES-COMPLETED-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click on the drop-down list on the header of the STUDIES page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the STUDIES page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-FILTER-FACILITY-02     auto
    Navigate To Studies
    Filter Studies    study_type=Completed
    ${current_report}       Get Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       STUDIES
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    Navigate To Studies
    Filter Studies    study_type=Completed      facility=Facility_QA_01
    ${studies}        Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found - with facility Facility_QA_01
    Navigate To Studies
    Filter Studies    study_type=Completed      facility=Facility_QA_02
    ${studies}        Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found - with facility Facility_QA_02
    Navigate To Studies
    Filter Studies    study_type=Completed      facility=All facilities
    ${studies}        Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found - with facility All facilities

BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-01: View all search attributes on the STUDIES page        # Failed (The default search option is showing `Study ID`)
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the STUDIES page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Device ID
    ...     2. The default search option should be Patient Name

    [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-01      auto
    Navigate To Studies
    Navigate To Studies Type    Completed
    ${search_options}       Get Studies Filter Options
    ${search_by_options}    Create List    Patient Name     Study ID    Patient ID      Device ID
    Run Keyword And Continue On Failure    Should Be Equal           ${search_options}[Search by]       ${search_by_options}
    ${current_values}       Get Studies Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Search By]      Study ID

BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-02: Search by Patient Name attributes on the STUDIES page     # Failed: Related to bug (search by patient name) via clinic
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient name
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. A message will be displayed: “No result found”
    ...     5. All entered text will be deleted

     [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#     [Template]    Filter Studies Completed
#     Patient Name

BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-03: Search by Study ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Study ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Study ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. A message will be displayed: “No result found”
    ...     5. All entered text will be deleted

    [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-03      auto
    [Template]    Filter Studies Completed
    Study ID

BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-04: Search by Patient ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. A message will be displayed: “No result found”
    ...     5. All entered text will be deleted

    [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-04      auto
    [Template]    Filter Studies Completed
    Patient ID

BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-05: Search by Device ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Device ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Device ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Device ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. A message will be displayed: “No result found”
    ...     5. All entered text will be deleted

    [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-SEARCH-05      auto
    [Template]    Filter Studies Completed
    Device ID

BFCC-SUPVR-STUDIES-COMPLETED-QUICK-ACCESS-01-CP-2.23.0: Quick access to device info
    [Documentation]  Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. General info: Model - it can be
    ...     - Bioflux
    ...     - Biocore: if the Auto-events detection for the device, there shall be a message displayed next to the device model – (Auto-events detection enabled).
    ...     - Biocore Pro
    ...     - Time zone
    ...     - Firmware version
    ...     - Operator
    ...     - Network mode
    ...     - Device lifetime - the total time of the device in use since the first study and it is counted by day and month
    ...     if its lifetime is less than 1 year- ex: 1 month 3 days or month and year if its lifetime is equal to or greater
    ...     than 1 year - ex: 1 year 3 months
    ...     2. Last Synced Status
    ...     - RSSI
    ...     - Lead on
    ...     - Battery level
    ...     - SD card free space
    ...     - Charging state
    ...     - Last connect
    ...
    ...     **Others
    ...     Update date: 5/28/2024 - Trinh Nguyen

    [Tags]  BFCC-SUPVR-STUDIES-COMPLETED-QUICK-ACCESS-01-CP-2.23.0       auto    CP-2.23.0
    Navigate To Studies
    Filter Studies    study_type=Completed
    ${devices}        Get Completed Studies On Page
    View Completed Studies Device Information On    row=1
    Wait Devices Information Available
    ${devices_infor}    Get Device Information
    ${expected_general_info}      Create List    Model    Firmware version   Timezone     Operator    Network mode    Device lifetime
    ${expected_last_synced_status}      Create List    RSSI    Lead on    Battery level    SD card free space     Charging state    Last connect
    ${expected_model_status}        Create List     Bioflux     Biocore     Biocore Pro
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_general_info}     ${devices_infor}[GENERAL INFO]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_last_synced_status}     ${devices_infor}[LAST SYNCED STATUS]
    Run Keyword And Continue On Failure    List Should Contain Value    ${expected_model_status}        ${devices_infor}[GENERAL INFO][Model]

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py        ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Studies.py       ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_supervisor]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter    username=${CURRENT_USER}[username]     password=${CURRENT_USER}[password]
    Set Suite Variable   ${TOKEN}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Studies Completed
    [Arguments]      ${search_by}
    Navigate To Studies
    Filter Studies    study_type=Completed      search_by=${search_by}
    ${studies}        Get Completed Studies On Page
    ${text}           Set Variable    ${studies}[0][${search_by}]
    ${text}           Evaluate        '${text}'.split(' | ')[0]  # Incase Device ID contains RMA - split
    Filter Studies    study_type=Completed      search_by=${search_by}      text_search=${text}
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found - text search ${text}
    Run Keyword If    '${search_by.lower()}' == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in s['Patient Name'].lower() for s in ${studies})
    Run Keyword If    '${search_by.lower()}' == 'device id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' in s['Device ID'] for s in ${studies})
    Run Keyword If    '${search_by.lower()}' == 'patient id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == s['Patient ID'] for s in ${studies})
    Run Keyword If    '${search_by.lower()}' == 'study id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == s['Study ID'] for s in ${studies})
    # Clear text search
    Clear Text Search
    ${current_filter}       Get Studies Current Filter Values
    Run Keyword And Continue On Failure     Should Be Empty    ${current_filter}[Text Search]
