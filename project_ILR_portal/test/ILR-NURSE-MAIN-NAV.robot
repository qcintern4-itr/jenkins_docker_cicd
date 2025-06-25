*** Settings ***
Documentation   ILR main navigation bars test suite
Metadata    sid   ILR-NURSE-MAIN-NAV
Metadata    owner   Bao Van
Library     DateTime
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      ILR-NURSE-MAIN-NAV      web
Test Timeout

*** Test Cases ***
ILR-NURSE-MAIN-NAV-01: Check the Patients screen UI
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1.Login ILR portal > Select menu Patients
    ...  2.At the Patients detail > Check UI screen
    ...  Expected Output:
    ...  - Expect: Displayed according to figma link, right corner displays dropdown list "Facility", default "All Facilities", Notification icon, user avatar
    [Tags]    ILR-NURSE-MAIN-NAV-01      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

ILR-NURSE-MAIN-NAV-02: Check UI and validate the Unassigned tab
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1.Login ILR portal > Select menu Patients
    ...  2.At the Patients detail screen > At the Unassigned tab > Check UI
    ...  3.Perform Physician assignment for the patient on the Unassigned tab
    ...  4.Perform assign care team for patient on Unassigned tab

    ...  Expected Output:
    ...  2. Expect: Displays the Search textbox, there are 2 search options: Patient Name and Patient ID. Default search by patient name
    ...             Displays the fields Patient name, Patient ID, Last send, Next send, Care team, Physican, Device, Provider. Default Care team and Physician have not been assigned
    ...  3.Assigned successfully, the above patient is still on the Unassigned tab
    ...  4.Assign successfully, the above patient switches to the Active tab
    [Tags]    ILR-NURSE-MAIN-NAV-02      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

ILR-NURSE-MAIN-NAV-03: Check UI and validate Active tab
    [Documentation]    Author: Bao Van
    ...
    ...  Test Steps:
    ...  1.Login ILR portal > Select menu Patients
    ...  2.At the Patients detail screen > At the Active tab > Check UI

    ...  Expected Output:
    ...  2. Expect: Displays the Search textbox, there are 2 search options: Patient Name and Patient ID. Default search by patient name
    [Tags]    ILR-NURSE-MAIN-NAV-03      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

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
