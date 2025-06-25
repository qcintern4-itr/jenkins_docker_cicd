*** Settings ***
Documentation   Cardiac Patients - Initial intake info test suite
Metadata    sid     BCP-PHY-PTDET-INITIAL
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTDET-INITIAL       web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTDET-INITIAL-01: Input Initial Intake Info
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Select on Add general cardiac history button
    ...  - Fill out all the required fields with valid value
    ...  - Click on Add button
    ...  - Select on Add patient's allergies button
    ...  - Input data to the field and click Save button
    ...  Exected Output:
    ...  - Patient's allergies will be saved and displayed
    [Tags]    BCP-PHY-PTDET-INITIAL-01       manual
    Manual Should Be Passed     ${TEST NAME}     ${TEST DOCUMENTATION}

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
