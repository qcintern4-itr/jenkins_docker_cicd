*** Settings ***
Documentation   Cardiac Patients - Baseline info test suite
Metadata    sid     BCP-PHY-PTDET-BASELINE
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTDET-BASELINE      web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTDET-BASELINE-01: Check Baseline Info
    [Documentation]    Author: Khang Nguyen
    ...  Pre-condition:
    ...  - Nurse innputs baseline info for a patient
    ...  Test Steps:
    ...  - Navigate to Patient details of patient at Pre-condition
    ...  - Verify baseline info
    ...  Exected Output:
    ...  - The baseline info shall be saved and displayed correctly via physician
    [Tags]    BCP-PHY-PTDET-BASELINE-01     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser
