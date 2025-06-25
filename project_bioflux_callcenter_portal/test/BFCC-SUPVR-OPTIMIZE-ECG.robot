*** Settings ***
Documentation   Test Suite - Call Center QA Portal - Optimize ECG
Metadata    sid     BFCC-SUPVR-OPTIMIZE-ECG
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
#Library       project_bioflux_callcenter_portal/lib/web/Common.py
#Library       project_bioflux_callcenter_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-SUPVR-OPTIMIZE-ECG     web
Test Timeout    1h

*** Test Cases ***
BFCC-SUPVR-OPTIMIZE-ECG-01: Check event params display properly
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Create an auto event
    ...     2. Wait for deviceEventParams send (hourly report Ex.10h, 11h... regardless start study time or update Study Setting)
    ...     3. Check Event Params section
    ...
    ...     Epected Results:
    ...     Display Event Params section

    [Tags]  BFCC-SUPVR-OPTIMIZE-ECG-01      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-OPTIMIZE-ECG-02: Check View full event button display properly
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Create an auto event with duration > post event time
    ...     2. Wait for deviceEventParams send (hourly report Ex.10h, 11h... regardless start study time or update Study Setting)
    ...     3. Wait for hasFullData send (good condition is device still online (start study time + 1h), also can check ECG Viewer tab-Clinic to know that the event is on the sent hasFullData)
    ...     4. Click "View Full Event" button
    ...     5. Click "Basic View" button
    ...
    ...     Epected Results:
    ...     1. Step 3-View Full Event button is displayed
    ...     2. Step 4-Navigate the user is on View Full mode, "Basic View" button is displayed
    ...     3. Step 5-Navigate the user is on Basic view mode, "View Full Event" button is displayed

    [Tags]  BFCC-SUPVR-OPTIMIZE-ECG-02      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-OPTIMIZE-ECG-03: Check text "Event data not available" display and hide properly
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Create an auto event
    ...     2. Wait for hasFullData send
    ...     3. Close event and check the text "Event data not available"
    ...
    ...
    ...     Epected Results:
    ...     1. Step 1-Display text "Event data not available"
    ...     2. Step 3-Hide text "Event data not available"

    [Tags]  BFCC-SUPVR-OPTIMIZE-ECG-03      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-OPTIMIZE-ECG-05: Check message "Full event data not available" displayed
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Create an auto event with duration > post event time
    ...     2. Wait for deviceEventParams sent (hourly report Ex.10h, 11h... regardless start study time or update Study Setting)
    ...     3. View Event Params section before hasFullData sent
    ...
    ...     Epected Results:
    ...     1. Display message "Full event data for this event is currently not available. Please note, any changes you made may be different when the full data becomes available"

    [Tags]  BFCC-SUPVR-OPTIMIZE-ECG-05      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-OPTIMIZE-ECG-05-1: Check message "Full event data not available" hidden
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Create an auto event with duration > post event time
    ...     2. Wait for deviceEventParams sent (hourly report Ex.10h, 11h... regardless start study time or update Study Setting)
    ...     3. View Event Params section when hasFullData sent
    ...
    ...     Epected Results:
    ...     1. Hide message "Full event data for this event is currently not available. Please note, any changes you made may be different when the full data becomes available"

    [Tags]  BFCC-SUPVR-OPTIMIZE-ECG-05-1      manual   CP-2.16.7
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
