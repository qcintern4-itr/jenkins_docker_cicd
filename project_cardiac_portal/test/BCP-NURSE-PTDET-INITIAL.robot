*** Settings ***
Documentation   Cardiac Patients - Initial intake info test suite
Metadata    sid     BCP-NURSE-PTDET-INITIAL
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientsNew.py
#Library     project_cardiac_portal/lib/web/Templates.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/Appointment.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py
#Library     project_cardiac_portal/lib/web/PatientsInactive.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTDET-INITIAL     web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-INITIAL-01: Input Initial Intake Info
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
    [Tags]    BCP-NURSE-PTDET-INITIAL-01     manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Add Patient Allergies    answers=Patient's Allergies Test
#    ${text}     Get Initial Intake Info Allergies
#    Run Keyword And Continue On Failure    Should Not Be Empty     ${text}      No Patient's Allergies found
#    Run Keyword And Continue On Failure    Should Be Equal      ${text}[Allergies]      Patient's Allergies Test
#    # Verify again
#    Navigate To Patients New
#    Filter Registered Patients    search_by=Patient name     text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Navigate To Patient Details Tab     Initial intake info
#    ${text}     Get Initial Intake Info Allergies
#    Run Keyword And Continue On Failure    Should Not Be Empty     ${text}      No Patient's Allergies found
#    Run Keyword And Continue On Failure    Should Be Equal      ${text}[Allergies]     Patient's Allergies Test

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
