*** Settings ***
Documentation   Cardiac Patient Inactive page test suite
Metadata    sid     BCP-NURSE-PTINACT
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientsInactive.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/Appointment.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-PTINACT       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTINACT-01: Filter Inactive patients by "My patients"
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Inactive patients page
    ...   - Filter the patients list by "My patients"
    ...   - Search patients by Patient name or Care plan ID
    ...   - Select on a specific patient row which user wants to view the details
    ...   Expected Result:
    ...   - A patient's details page shall be displayed.
    [Tags]   BCP-NURSE-PTINACT-01   manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    [Template]    Filter Patients - Inactive
#    My patients     Patient Name
#    My patients     Care Plan ID

BCP-NURSE-PTINACT-02: Filter Inactive patients by "All patients"
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Inactive patients page
    ...   - Filter the patients list by "All patients"
    ...   - Search patients by Patient name or Care plan ID
    ...   - Select on a specific patient row which user wants to view the details
    ...   Expected Result:
    ...   - A patient's details page shall be displayed.
    [Tags]   BCP-NURSE-PTINACT-02      manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    [Template]    Filter Patients - Inactive
#    All patients     Patient Name
#    All patients     Care Plan ID

BCP-NURSE-PTINACT-03: Go To The Patient Details Page By Clicking Patient Name Hyperlink
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Inactive patients tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   - At step 2, the Care plan info side tab will be displayed
    ...   - At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-NURSE-PTINACT-03   manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients Inactive
#    Filter Inactive Patients    by_patient=All patients     search_by=Patient name
#    ${inact_patients}       Get Inactive Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${inact_patients}     No inactive patient found - text search without string
#    ${patient_name}         Set Variable    ${inact_patients}[0][Patient Name]
#    Filter Inactive Patients    by_patient=All patients     search_by=Patient name      text_search=${patient_name}
#    ${inact_patients}     Get Inactive Patients
#    View Inactive Patient Appointment Summary On    row=1
#    ${appt_summary}     Get Appointment Summary     is_close=False
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${appt_summary}                       Care plan info side tab is null
#    Run Keyword And Continue On Failure    Should Contain         ${appt_summary}[Top info]             ${patient_name}
#    Run Keyword And Continue On Failure    Should Contain         ${appt_summary}[Top info]             Care plan ID: ${inact_patients}[0][Care Plan ID]
#    # Page header on patient details
#    Go To Patient Details
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}      ${patient_name}

BCP-NURSE-PTINACT-04: Reactivate An Inactive Care Plan
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Inactive patients page
    ...   2.Select a care plan which one want to reactivate
    ...   3.On the Patient details page, click Reactivate care plan button
    ...   4.Select Reactivate/Cancel on the confirmation modal
    ...   Expected Result:
    ...   - At step 2, user shall be navigated to the Patient details page in which one they chose
    ...   - At step 3, a Reactivate care plan confirmation modal is displayed "You will reactivate this care plan. Are you sure you want to proceed?"
    ...   - At step 4, select Reactivate - the care plan will be reactivated successfully
    ...   - When the care plan is reactivated successfully:
    ...   - On the clinic portal:
    ...   + A snack bar will be displayed: “Reactivate care plan successfully!”
    ...   + Patient information will be displayed on the Active patient list (for both the physician and nurse portal that the patient belongs to)
    ...   + Patient information will be dismissed from the Inactive patient list (for both the physician and nurse portal that the patient belongs to)
    ...   + The system will restore the behavior that can be performed on an active patient
    ...   - On the mobile app:
    ...   + The patient will receive an email to the registered email (and a text message to the phone number) with the content described in the Figma UI
    ...   + The patient will be navigated to the Home page (Daily information screen)
    ...   + The care plan status will be active and no longer displays in the Previous care plan.
    [Tags]   BCP-NURSE-PTINACT-04    manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-PTINACT-05: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Inactive patient page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-NURSE-PTINACT-05        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

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

Filter Patients - Inactive
    [Arguments]    ${by_patient}    ${search_by}
    Navigate To Patients Inactive
    Filter Inactive Patients    by_patient=${by_patient}    search_by=${search_by}
    ${inact_patients}     Get Inactive Patients
    ${text}     Set Variable    ${inact_patients}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${inact_patients}      Not inactive patient found - ${search_by} without text string
    Filter Inactive Patients    by_patient=${by_patient}    search_by=${search_by}      text_search=${text}
    ${inact_patients}     Get Inactive Patients
    Run Keyword And Continue On Failure    Should Not Be Empty    ${inact_patients}      Not inactive patient found - ${search_by} ${text}
    Run Keyword If    '${search_by}' == 'Patient Name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in p['${search_by}'].lower() for p in ${inact_patients})
    Run Keyword If    '${search_by}' == 'Care Plan ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == p['${search_by}'] for p in ${inact_patients})
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}       ${inact_patients}[0][${search_by}]
    # Navigate to Patient details and verify
    View Inactive Patient Details On    row=1
    ${patient_details}      Get Patient Details Common
    Run Keyword And Continue On Failure    Should Not Be Empty    ${patient_details}
    Run Keyword And Continue On Failure    Should Be True    ['${inact_patients}[0][Patient Name]' in ${patient_details}[0].keys()]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0]      Care plan ID: ${inact_patients}[0][Care Plan ID]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0][Registered clinic]    ${inact_patients}[0][Clinic]

Inactive Care - Plan
    [Arguments]    ${patient_name}
    Navigate To Patients Active
    Filter Active Patients    by_patient=All patients       search_by=Patient name      text_search=${patient_name}
    ${active_patients}      Get Active Patients
    ${text}     Set Variable    ${active_patients}[0][Patient Name]
    View Active Patient Details On    row=1
    Run Keyword If      '${patient_name}' == '${text}'
    ...  Stop Health Care Program

Reactive Care - Plan
    [Arguments]    ${patient_name}
    Navigate To Patients Inactive
    Filter Inactive Patients    by_patient=All patients       search_by=Patient name      text_search=${patient_name}
    ${inac_patients}        Get Inactive Patients
    ${text}     Set Variable    ${inac_patients}[0][Patient Name]
    Run Keyword If      '${patient_name}' == '${text}'     Run Keywords
    ...  View Inactive Patient Details On    row=1
    ...  AND    Reactivate Care Plan
