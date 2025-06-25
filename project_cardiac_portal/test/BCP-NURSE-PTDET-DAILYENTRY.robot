*** Settings ***
Documentation   Cardiac Patient Details page > Daily Entry test suite
Metadata    sid     BCP-NURSE-PTDET-DAILYENTRY
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-DAILYENTRY      web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-DAILYENTRY-01: Daily Entry
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Check the daily information on a specific day
    ...  Expected Output:
    ...  - The daily entry will be record as the patient input on mobile app
    [Tags]    BCP-NURSE-PTDET-DAILYENTRY-01     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BCP-NURSE-PTDET-DAILYENTRY-02: Daily Entry - self-enroll patients
    [Documentation]    Author: Chi Tran
    ...
    ...  Test Steps:
    ...  - Check the daily information if program that is added from self-enroll patients
    ...  Expected Output:
    ...  - The daily entry will span from the date when the user completes self-enrollment to the current day
    [Tags]    BCP-NURSE-PTDET-DAILYENTRY-02     manual      [BCP-2.20.0]
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
