*** Settings ***
Documentation   Cardiac Patients - Patient demographic info test suite
Metadata    sid     BCP-NURSE-PTDET-DEMO
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
Force Tags      BCP-NURSE-PTDET-DEMO     web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-PTDET-DEMO-01: Assign A Nurse - To Me
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on the Assign a nurse button from the bottom of the patient's demographic side tab
    ...  - Select on Assign to me button from the side tab
    ...  Expected Output:
    ...  - A nurse who did the action will be assigned as a nurse for the care plan
    [Tags]    BCP-NURSE-PTDET-DEMO-01       manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Assign nurse
#    Filter Registered Patients    search_by=Patient name        text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Assign Nurse    nurse=me
#    # Verify on Assigned patient
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients     search_by=patient name      text_search=${patient_name}
#    ${assigned_patient}     Get Assigned Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_patient}       Not patient found
#    Run Keyword And Continue On Failure    Should Be True    ['${CURR_USER}[name]' in patient['Nurse'] for patient in ${assigned_patient}]

BCP-NURSE-PTDET-DEMO-02: Assign A Nurse - From Clinic
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on the Assign a nurse button from the bottom of the patient's demographic side tab
    ...  - Enter a nurse name and select them
    ...  - Select on Assign button
    ...  Expected Output:
    ...  - A nurse who is chose by the user will be assigned as a nurse for the care plan
    [Tags]    BCP-NURSE-PTDET-DEMO-02       manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Assign nurse
#    Filter Registered Patients    search_by=Patient name        text_search=${patient_name}
#    View Registered Patient Details On    row=1
#    Assign Nurse    nurse=${NURSE_ACT}[name]
#    # Verify on Assigned patient
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients     search_by=patient name      text_search=${patient_name}
#    ${assigned_patient}     Get Assigned Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_patient}       Not patient found
#    Run Keyword And Continue On Failure    Should Be True    ['${NURSE_ACT}[name]' in patient['Nurse'] for patient in ${assigned_patient}]

BCP-NURSE-PTDET-DEMO-03: Assign A Physician
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on the Assign a physician button from the bottom of the patient's demographic side tab
    ...  - Enter a physician name and select them
    ...  - Click on Assign button
    ...  Expected Output:
    ...  - A physician who is chose by the user will be assigned as a physician for the care plan
    [Tags]    BCP-NURSE-PTDET-DEMO-03       manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Assign nurse
#    Filter Registered Patients    search_by=Patient name    text_search=${patient_name}
#    View Registered Patient Appointment Summary On    row=1
#    Go To Patient Details
#    Assign Nurse    nurse=me
#    # Assign physician
#    Assign Physician    physician=${PHY_ACT}[name]
#    ${text}     Get Patient Details Common
#    # Assigned tab
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${patient_name}
#    ${assigned_patient}     Get Assigned Patients
#    Run Keyword And Continue On Failure    Should Be True    ['${CURR_USER}[name]' in patient['Nurse'] for patient in ${assigned_patient}]
#    view_assigned_patient_appointment_summary_on    row=1
#    ${sum_info}     Get Appointment Summary
#    Run Keyword And Continue On Failure    Should Be Equal    ${text}[0][Caregivers]      ${sum_info}[Caregivers]

BCP-NURSE-PTDET-DEMO-04: Re-assign A Nurse
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Edit button from the Caregivers section at the bottom of the patient's demographic side tab
    ...  - Enter a nurse name and select them
    ...  - Click on Change button
    ...  Expected Output:
    ...  - A nurse who is re-placed by the user will be re-assigned as a nurse for the care plan
    ...  - All patient's care plan information will be moved to the new caregiver portal
    [Tags]    BCP-NURSE-PTDET-DEMO-04   manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=Patient name      text_search=${PATIENTS}[5]
#    ${assigned_patient}     Get Assigned Patients
#    Run Keyword And Continue On Failure    Should Be True    all('${CURR_USER}[name] (You)'.lower() in patient['Nurse'].lower() for patient in ${assigned_patient})
#    View Assigned Patient Appointment Summary On    row=1
#    ${sum_info}     Get Appointment Summary
#    View Assigned Patient Details On    row=1
#    ${text}     Get Patient Details Common
#    ${sum_caregivers}     Evaluate    '${sum_info}[Caregivers]'.split(',')[0]
#    ${common_caregivers}      Evaluate    '${text}[0][Caregivers]'.split(',')[0]
#    Run Keyword And Continue On Failure    Should Be Equal    ${common_caregivers}      ${sum_caregivers}
#    # Re-assign nurse
#    Edit Caregivers    nurse=${NURSE_ACT}[name]
#    ${text}     Get Patient Details Common
#    ${common_caregivers}      Evaluate    '${text}[0][Caregivers]'.split(',')[0]
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    ${assigned_patient}     Get Assigned Patients       row=1
#    Run Keyword And Continue On Failure    Should Contain     ${assigned_patient}[Nurse]    ${NURSE_ACT}[name]
#    View Assigned Patient Appointment Summary On    row=1
#    ${appt_info}     Get Appointment Summary
#    Run Keyword And Continue On Failure    Should Be Equal    ${common_caregivers}      ${sum_caregivers}

BCP-NURSE-PTDET-DEMO-05: Re-assign A Physician
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Click on Edit button from the Caregivers section at the bottom of the patient's demographic side tab
    ...  - Enter a physician name and select them
    ...  - Click on Change button
    ...  Expected Output:
    ...  - A physician who is re-placed by the user will be assigned as a physician for the care plan
    ...  - All patient's care plan information will be moved to the new caregiver portal
    [Tags]    BCP-NURSE-PTDET-DEMO-05   manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    View Assigned Patient Details On    row=1
#    ${common_info}      Get Patient Details Common
#    # Assigned tab
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    ${assigned_patient}     Get Assigned Patients
#    # Only show Nures
#    Run Keyword And Continue On Failure     Should Be True    ['${CURR_USER}[name]' in patient['Nurse'] for patient in ${assigned_patient}]
#    View Assigned Patient Appointment Summary On    row=1
#    ${appt_info}     Get Appointment Summary
#    View Assigned Patient Details On    row=1
#    ${sum_caregivers}     Evaluate    '${appt_info}[Caregivers]'.split(',')[0]
#    ${common_caregivers}      Evaluate    '${common_info}[0][Caregivers]'.split(',')[0]
#    Run Keyword And Continue On Failure    Should Be Equal    ${common_caregivers}      ${sum_caregivers}
#    # Re-assgned
#    Edit Caregivers    physician=${PHY_ACT}[name]
#    ${common_info}      Get Patient Details Common
#    Navigate To Patients New
#    Filter Assigned Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[5]
#    View Assigned Patient Appointment Summary On    row=1
#    ${appt_info}     Get Appointment Summary
#    ${sum_caregivers}     Evaluate    '${appt_info}[Caregivers]'.split(',')[0]
#    ${common_caregivers}      Evaluate    '${common_info}[0][Caregivers]'.split(',')[0]
#    Run Keyword And Continue On Failure     Should Be Equal    ${sum_caregivers}      ${common_caregivers}

BCP-NURSE-PTDET-DEMO-06: Start Healthcare Program
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to a specific patient's details page
    ...  - Select on Start healthcare program button
    ...  Expected Output:
    ...  - The care plan shall be removed from the New tab
    ...  - The care plan shall be moved to the Active tab
    [Tags]    BCP-NURSE-PTDET-DEMO-06       manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
    # Assign nurse
#    Filter Registered Patients      search_by=patient name      text_search=${patient_name}
#    ${reg_patients}     Get Registered Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reg_patients}
#    View Registered Patient Details On    row=1
#    Assign Nurse    nurse=${CURR_USER}[name]
#    # Assign physician
#    Assign Physician    physician=${PHY_ACT}[name]
#    Start Health Care Program
#    ${message}     Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal     ${message}    Care plan is started sucessfully!
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patient
#    ${active_patients}     Get Active Patients
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${active_patients}     Not patient found - without patient name
#    Run Keyword And Continue On Failure    Should Be True    ['${patient_name}' in patient['Patient name'] for patient in ${active_patients}]

BCP-NURSE-PTDET-DEMO-07: Stop A Healthcare Program
    [Documentation]    Author: Khang Nguyen
    ...
    ...  Test Steps:
    ...  - Go to a specific patient's details page
    ...  - Click on Stop healthcare program button at the bottom of the page
    ...  - Select one of the reason on the modal
    ...  - Select Stop health care program button
    ...  Expected Output:
    ...  - The care plan will be stopped successfully
    [Tags]    BCP-NURSE-PTDET-DEMO-07   manual    inactive
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patients       search_by=Patient name       text_search=${PATIENTS}[19]
#    ${active_patients}     Get Active Patients
#    View Active Patient Details On    row=1
#    Stop Health Care Program      reason=Moved
#    ${message}      Get Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${message}    Health care program is stopped successfully!
#    Navigate To Patients Inactive
#    Filter Inactive Patients    by_patient=All patients      search_by=patient name      text_search=${PATIENTS}[19]
#    ${inact_patients}     Get Inactive Patients     row=1
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${inact_patients}
#    Run Keyword And Continue On Failure    Should Be Equal    ${inact_patients}[Patient Name]     ${PATIENTS}[19]
#    Run Keyword And Continue On Failure    Should Be Equal     ${inact_patients}[Reason For Completion]     Moved

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

Reactivate The Care Plan
    [Arguments]    ${inac_patient}
    Navigate To Patients Inactive
    Filter Inactive Patients        by_patient=All patients        search_by=Patient name      text_search=${inac_patient}
    ${patients}     Get Inactive Patients
    Run Keyword If      ${patients} != None and all('${inac_patient}'.lower() in p['Patient Name'].lower() for p in ${patients})       Run Keywords
    ...  View Inactive Patient Details On    row=1
    ...  AND    Reactivate Care Plan

Edit The Caregivers
    [Arguments]     ${assigned_nurse}    ${assigned_phy}    ${patient_name}
    Navigate To Patients New
    Filter Assigned Patients    by_patient=All patients     search_by=Patient name      text_search=${patient_name}
    View Assigned Patient Details On    row=1
    ${details}      Get Patient Details Common
    ${caregiver}    Set Variable    ${details}[0][Caregivers]
    Run Keyword If    '${assigned_nurse}' not in '${caregiver}'     Run Keyword
    ...  Edit Caregivers    nurse=${assigned_nurse}
    ${details}      Get Patient Details Common
    ${caregiver}    Set Variable    ${details}[0][Caregivers]
    Run Keyword If    '${assigned_phy}' not in '${caregiver}'     Run Keyword
    ...  Edit Caregivers    physician=${assigned_phy}
    Refresh Page
    ${details}      Get Patient Details Common
    ${caregiver}    Set Variable    ${details}[0][Caregivers]
    Run Keyword And Continue On Failure    Should Contain     ${caregiver}       ${assigned_nurse}
    Run Keyword And Continue On Failure    Should Contain     ${caregiver}       ${assigned_phy}
