*** Settings ***
Documentation   Test Suite - Call Center Supervisor Portal - Filter data
Metadata    sid     BFCC-SUPVR-FILTER
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py   ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Devices.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-SUPVR-FILTER     web
Test Timeout    1h

*** Test Cases ***
BFCC-SUPVR-FILTER-01: View portal in the case the user belongs to a call center group that has not been assigned a facility group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has not been assigned to any facility group
    ...
    ...     Test Steps:
    ...     1. Login to CC portal with user that mentioned in the pre-condition
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The facility filter and the search bar shall be hidden
    ...     2. A message stating: “There is no data to display” shall be displayed on the STUDIES, REPORTS, DEVICES, SUPPORT and TASK pages
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-FILTER-02: View portal in the case the user belongs to a call center group that has been assigned a facility group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user has been assigned to a facility group
    ...
    ...     Test Steps:
    ...     1. Login to CC portal with user that mentioned in the pre-condition
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. There shall be a facility dropdown list on the STUDIES, REPORTS, DEVICES, SUPPORT and TASK pages.
    ...     2. The default value is All facilities
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-02       auto
    [Template]  Filter - on Page
    devices
    studies
    reports
    support
    task

BFCC-SUPVR-FILTER-03: View options of facility dropdown list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Expected Results:
    ...     1. The list of facilities is sorted by alphabet order
    ...     2. The “All facilities” option is always on the top of the list
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-03        auto
    Navigate To Callcenter Menu    devices
    ${filter_options}       Get Filter Facilities Options
    ${actual_facilities}           Set Variable    ${filter_options}[Facilities]
    ${expected_facilities}  Evaluate    sorted(${actual_facilities})   # asc sorted
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_facilities}     ${expected_facilities}

BFCC-SUPVR-FILTER-04: Search for a facility on the dropdown list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-04        auto
    Navigate To Devices
    ${filters}     Get Filter Facilities Options
    ${current_filter}    Get Current Filter Values
    # Verify default facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]        All facilities  # default
    Filter Devices    facility=${filters}[Facilities][1]
    ${current_filter}    Get Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]        ${filters}[Facilities][1]
    Navigate To Callcenter Menu    Support
    ${current_filter}    Get Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]        ${filters}[Facilities][1]
    Navigate To Callcenter Menu    Studies
    ${current_filter}    Get Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]        ${filters}[Facilities][1]
    Navigate To Callcenter Menu    Reports
    ${current_filter}    Get Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]        ${filters}[Facilities][1]
    Navigate To Callcenter Menu    Task
    ${current_filter}    Get Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]        ${filters}[Facilities][1]
    Navigate To Callcenter Menu    Devices
    Filter Devices    facility=All facilities

BFCC-SUPVR-FILTER-05: Filter data by a specific facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Expected Results:
    ...     1. The page shall filter the data on the portal according to the selected facility
    ...     2. The selected facility shall be applied to other pages (Reports, Studies, Devices, Support, Task)
    ...     3. On Task page, all figures in the Overview tab will change accordingly to the facility that he or she filter
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-05        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-FILTER-06: Behavior in the case a facility is removed from a facility group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Expected Results:
    ...     A pop-up dialog with the following message shall be displayed: “ The facility list has just been updated.
    ...     Please reload the page to ensure proper workflow” with the [Reload] and [Cancel] option
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-06        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-FILTER-07: Behavior in the case a facility group is removed from a call center group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Expected Results:
    ...     A pop-up dialog with the following message shall be displayed: “ The facility list has just been updated.
    ...     Please reload the page to ensure proper workflow” with the [Reload] and [Cancel] option
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-07        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-FILTER-08: Can filter studies by device model
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 20/11/2023 - Trinh Nguyen
    ...

    [Tags]      BFCC-SUPVR-FILTER-08     auto       CP2.16.9
    Navigate To Devices
    ${current_filter}    Get Devices Current Filter Values
    # Verify default facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Model]        All models  # default
    ${filters_model}     Get Devices Filter Options
    ${actual_models}   Set Variable        ${filters_model}[Models]
    ${expected_models}     Create List         All models      Bioflux     Biocore    Biocore Pro
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_models}       ${actual_models}
    Run Keyword And Continue On Failure    Should Be Equal    ${filters_model}[Models][0]      All models

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Devices.py      ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_supervisor]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter - on Page
    [Arguments]    ${page}
    Navigate To Callcenter Menu    ${page}
    ${current_filter}    Get Current Filter Values
    ${filters}     Get Filter Facilities Options
    # Verify default facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]        All facilities  # default
    ${expected_facilities}   Set Variable        ${filters}[Facilities]
    ${actual_facilites}     Create List         All facilities      Facility_QA_01      Facility_QA_02
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${expected_facilities}      ${actual_facilites}
    Run Keyword And Continue On Failure    Should Be Equal    ${filters}[Facilities][0]      All facilities         # top of the list
    # Verify facilities sorted by alphabet
