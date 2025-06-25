*** Settings ***
Documentation   Cardiac Heart Monitor Study page test suite
Metadata    sid     BCP-PHY-DEVICES-STUDIES
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/DevicesStudies.py
#Library     project_cardiac_portal/lib/web/Appointment.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-DEVICES-STUDIES     web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-DEVICES-STUDIES-01: Filter Study-Prescription list by "My prescriptions"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Heart studies page
    ...   - Select Study-Prescription tab
    ...   - Filter the Prescription list by "My prescriptions"
    ...   - Search prescription by Patient name or Care plan ID
    ...   - Click an Open study tooltips on a specific patient's row which user wants to view study card
    ...   Expected Result:
    ...   - A new browser tab shall be opened and a study card will be displayed on it.
    [Tags]    BCP-PHY-DEVICES-STUDIES-01    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Study-Prescription
#    My prescriptions    Patient Name
#    My prescriptions    Care Plan ID

BCP-PHY-DEVICES-STUDIES-02: Filter Study-Prescription list by "All prescriptions"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Heart studies page
    ...   - Select Study-Prescription tab
    ...   - Filter the Prescription list by "All prescriptions"
    ...   - Search prescription by Patient name or Care plan ID
    ...   - Click an Open study tooltips on a specific patient's row which user wants to view study card
    ...   Expected Result:
    ...   - A new browser tab shall be opened and a study card will be displayed on it.
    [Tags]    BCP-PHY-DEVICES-STUDIES-02    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Study-Prescription
#    All prescriptions   Patient Name
#    All prescriptions   Care Plan ID

BCP-PHY-DEVICES-STUDIES-03: Filter Study-Active list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Heart studies page
    ...   - Select Study-Active tab
    ...   - Filter on-going study by My patients/ All patients
    ...   - Search on-going study by Patient name/ Care plan ID/ Study ID/ Device ID
    ...   Expected Result:
    ...   - User shall be able to view an on-going study card that they want to view.
    [Tags]    BCP-PHY-DEVICES-STUDIES-03    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Study-Active
#    My patients     Patient name
#    My patients     Care plan ID
#    All patients    Study ID
##    All patients    Device ID

BCP-PHY-DEVICES-STUDIES-04: Filter Study-Completed list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Heart studies page
    ...   - Select Study-Completed tab
    ...   - Filter completed study by My patients/ All patients
    ...   - Search completed studies by Patient name/ Care plan ID/ Study ID
    ...   Expected Result:
    ...   - User shall be able to view the completed study that they want to view.
    [Tags]    BCP-PHY-DEVICES-STUDIES-04      manual
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Template]    Filter Study-Completed       # Data: TBD
#    My patients     Patient name
#    My patients     Care plan ID
#    All patients    Study ID

BCP-PHY-DEVICES-STUDIES-05: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Study Prescription
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Heart monitor - Study prescription tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed
    ...   At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-PHY-DEVICES-STUDIES-05    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Devices Heart Studies
#    Filter Heart Studies Prescription    by_prescription=All prescriptions      search_by=Patient name
#    ${pre_patients}     Get Heart Studies Prescription
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${pre_patients}       No prescription studies found - text search without text string
#    ${text}             Set Variable    ${pre_patients}[0][Patient Name]
#    View Heart Studies Prescription Study Appointment Summary On    row=1
#    ${patient_appt}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][0]       ${pre_patients}[0][Patient Name]
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][1]       Care plan ID: ${pre_patients}[0][Care Plan ID]
#    Go To Patient Details
#    ${header}   Get Page Header
#    Run Keyword And Continue On Failure    Should Contain       ${header}       ${text}

BCP-PHY-DEVICES-STUDIES-06: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Active Study
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Heart monitor - Active study tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed
    ...   At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-PHY-DEVICES-STUDIES-06    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Devices Heart Studies
#    Filter Heart Studies Active    by_patient=All patients      search_by=Patient name
#    ${act_studies}      Get Heart Studies Active
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${act_studies}        No active studies found - text seach without text string
#    ${text}        Set Variable    ${act_studies}[0][Patient name]
#    View Heart Studies Active Study Appointment Summary On      study_id=${act_studies}[0][Study ID]      care_plan_id=${act_studies}[0][Care plan ID]     patient_name=${text}
#    ${patient_appt}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][0]       ${act_studies}[0][Patient name]
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][1]       Care plan ID: ${act_studies}[0][Care plan ID]
#    Go To Patient Details
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}      ${text}

BCP-PHY-DEVICES-STUDIES-07: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Completed Study
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Heart monitor - Completed study tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed
    ...   At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-PHY-DEVICES-STUDIES-07     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Can not handle data test
#    Navigate To Devices Heart Studies
#    Filter Heart Studies Completed      by_patient=All patients     search_by=Patient name
#    ${com_patients}     Get Heart Studies Completed
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${com_patients}       No completed studies found - text search without text string
#    ${text}             Set Variable    ${com_patients}[0][Patient name]
#    View Heart Studies Completed Study Appointment Summary On      study_id=${com_patients}[0][Study ID]     care_plan_id=${com_patients}[0][Care plan ID]      patient_name=${text}
#    ${patient_appt}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][0]       ${com_patients}[0][Patient name]
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][1]       Care plan ID: ${com_patients}[0][Care plan ID]
#    Go To Patient Details
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}      ${text}

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

Filter Study-Prescription
    [Arguments]    ${prescription}    ${search_by}
    Navigate To Devices Heart Studies
    Filter Heart Studies Prescription    by_prescription=${prescription}       search_by=${search_by}
    ${pre_studies}      Get Heart Studies Prescription
    Run Keyword And Continue On Failure    Should Not Be Empty    ${pre_studies}      No Prescription studies found - Text search without text string
    ${text}     Set Variable    ${pre_studies}[0][${search_by}]
    Filter Heart Studies Prescription    by_prescription=${prescription}       search_by=${search_by}      text_search=${text}
    ${pre_studies}      Get Heart Studies Prescription
    Run Keyword And Continue On Failure    Should Not Be Empty    ${pre_studies}      No Prescription studies found - Text search ${text}
    Run Keyword If    '${search_by}' == 'Care Plan ID'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == study['${search_by}'] for study in ${pre_studies})
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in study['${search_by}'].lower() for study in ${pre_studies})

Filter Study-Active
    [Arguments]     ${by_patient}    ${search_by}
    Navigate To Devices Heart Studies
    Filter Heart Studies Active     by_patient=${by_patient}     search_by=${search_by}     text_search=${EMPTY}
    ${act_studies}      Get Heart Studies Active
    Run Keyword And Continue On Failure    Should Not Be Empty    ${act_studies}      No Active studies found - Text search without text string
    ${text}     Set Variable If    '${search_by}' == 'Device ID'        ${act_studies}[0][Device]
    ${text}     Set Variable If    '${search_by}' != 'Device ID'        ${act_studies}[0][${search_by}]
    Filter Heart Studies Active     by_patient=${by_patient}     search_by=${search_by}      text_search=${text}
    ${act_studies}      Get Heart Studies Active
    Run Keyword And Continue On Failure    Should Not Be Empty    ${act_studies}      No Active studies found - Text search ${text}
    Run Keyword If    '${search_by}' == 'Study ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Length Should Be       ${act_studies}    1
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}      ${act_studies}[0][${search_by}]
    Run Keyword If    '${search_by}' == 'Device ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Length Should Be       ${act_studies}    1
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}      ${act_studies}[0][Device]
    Run Keyword If    '${search_by}' == 'Patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in study['Patient name'].lower() for study in ${act_studies})
    Run Keyword If    '${search_by}' == 'Care plan ID'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == study['Care plan ID'] for study in ${act_studies})

Filter Study-Completed
    [Arguments]     ${by_patient}     ${search_by}
    Navigate To Devices Heart Studies
    Filter Heart Studies Completed      by_patient=${by_patient}     search_by=${search_by}
    ${com_studies}      Get Heart Studies Completed
    ${text}     Set Variable    ${com_studies}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${com_studies}        No Completed studies found - Text search without text string
    Filter Heart Studies Completed      by_patient=${by_patient}     search_by=${search_by}     text_search=${text}
    ${com_studies}      Get Heart Studies Completed
    Run Keyword And Continue On Failure    Should Not Be Empty    ${com_studies}        No Completed studies found - Text search ${text}
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in study['Patient Name'].lower() for study in ${com_studies})
    Run Keyword If    '${search_by}' == 'Care Plan ID'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == study['Care Plan ID'] for study in ${com_studies})
    Run Keyword If    '${search_by}' == 'Study ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == study['Study ID'] for study in ${com_studies})
    ...  AND    Run Keyword And Continue On Failure    Length Should Be    ${com_studies}      1

Prescibe Study
    [Arguments]     ${patient}     ${device_type}       ${study_type}
    # Patient active
    Navigate To Patients Active
    Filter Active Patients    by_patient=All patients    search_by=Patient name      text_search=${patient}
    View Active Patient Details On    patient_name=${patient}
    Navigate To Patient Details Tab   tab=Heart monitor
    # Prescribe study
    Prescribe New Study   use_biodirect=True    device=${device_type}    study_type=${study_type}    study_duration=3    primary_diagnosis_code=I49.5 - Sick sinus syndrome      secondary_diagnosis_code=I49.8 - Other specified cardiac arrhythmias
    ...  notes=Physician amendments notes (optional) Test
    [Return]    ${patient}

Cancel Prescription - Study
    [Arguments]    ${patient}
    Navigate To Devices Heart Studies
    Filter Heart Studies Prescription    by_prescription=All prescriptions      search_by=Patient name      text_search=${patient}
    # HM Study in patient details
    View Heart Studies Prescription Study Details On    patient_name=${patient}
    ${pre_study}      Get Patient Details Heart Monitor Current Study
    Run Keyword If    'Cancel this study prescription' in '${pre_study}'    Run Keywords
    ...  Cancel Study Prescription
    ...  AND Back From Patient Details
