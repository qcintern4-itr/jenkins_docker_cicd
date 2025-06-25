*** Settings ***
Documentation   Test Suite - Call Center QA Leader Portal - Active studies page
Metadata    sid     BFCC-QALEAD-STUDIES-ACTIVE
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library       project_bioflux_callcenter_portal/lib/web/Common.py
Library       project_bioflux_callcenter_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-QALEAD-STUDIES-ACTIVE    web
Test Timeout    1h

*** Test Cases ***
BFCC-QALEAD-STUDIES-ACTIVE-FILTER-FACILITY-01:View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Observe the header of STUDIES page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the STUDIES page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-FILTER-FACILITY-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-STUDIES-ACTIVE-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click on the drop-down list on the header of the STUDIES page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the STUDIES page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-FILTER-FACILITY-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-01: View all search attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the STUDIES page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Device ID
    ...     2. The default search option should be Patient Name

    [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-01     auto
    Navigate To Studies
    Navigate To Studies Type    Active
    ${search_options}       Get Studies Filter Options
    ${search_by_options}    Create List    Patient Name     Study ID    Patient ID      Device ID
    Run Keyword And Continue On Failure    Should Be Equal           ${search_options}[Search by]       ${search_by_options}
    ${current_values}       Get Studies Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Search By]      Study ID

BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-02: Search by Patient Name attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
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

     [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-03: Search by Study ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
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

    [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-04: Search by Patient ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
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

    [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-05: Search by Device ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Device ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Call Center Portal
    ...
    ...     Test Steps:
    ...     1. Click the Active tab of the STUDIES page
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

    [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-SEARCH-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-STUDIES-ACTIVE-QUICK-ACCESS-01-CP-2.23.0: Quick access to device info
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

    [Tags]  BFCC-QALEAD-STUDIES-ACTIVE-QUICK-ACCESS-01-CP-2.23.0       manual   CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Studies.py      ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_qaleader]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
