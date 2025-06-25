*** Settings ***
Documentation   Test Suite - Call Center Technician Portal - Filter data
Metadata    sid     BFCC-TECH-FILTER
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_bioflux_callcenter_portal/lib/web/Common.py
#Library     project_bioflux_callcenter_portal/lib/web/Devices.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-TECH-FILTER     web
Test Timeout    1h

*** Test Cases ***
BFCC-TECH-FILTER-01: View portal in the case the user belongs to a call center group that has not been assigned a facility group
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

    [Tags]      BFCC-TECH-FILTER-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-FILTER-02: View portal in the case the user belongs to a call center group that has been assigned a facility group
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

    [Tags]      BFCC-TECH-FILTER-02        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-FILTER-03: View options of facility dropdown list
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

    [Tags]      BFCC-TECH-FILTER-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-FILTER-04: Search for a facility on the dropdown list
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

    [Tags]      BFCC-TECH-FILTER-04        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-FILTER-05: Filter data by a specific facility
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

    [Tags]      BFCC-TECH-FILTER-05        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-FILTER-06: Behavior in the case a facility is removed from a facility group
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

    [Tags]      BFCC-TECH-FILTER-06        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-FILTER-07: Behavior in the case a facility group is removed from a call center group
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

    [Tags]      BFCC-TECH-FILTER-07        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-FILTER-08-CP2.16.9: Can filter studies by device model
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

    [Tags]      BFCC-TECH-FILTER-08-CP2.16.9        manual   CP-2.16.9
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
