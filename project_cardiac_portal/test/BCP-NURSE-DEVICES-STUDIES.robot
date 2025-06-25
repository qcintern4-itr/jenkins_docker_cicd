*** Settings ***
Documentation   Cardiac Heart Monitor Study page test suite
Metadata    sid     BCP-NURSE-DEVICES-STUDIES
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/DevicesStudies.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py
#Library     project_cardiac_portal/lib/web/Appointment.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-DEVICES-STUDIES       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-DEVICES-STUDIES-01: Filter Study-Prescription list by "My prescriptions"
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
    [Tags]   BCP-NURSE-DEVICES-STUDIES-01       manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Study-Prescription
#    My prescriptions    Patient Name
#    My prescriptions    Care Plan ID

BCP-NURSE-DEVICES-STUDIES-02: Filter Study-Prescription list by "All prescriptions"
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
    [Tags]   BCP-NURSE-DEVICES-STUDIES-02       manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Study-Prescription
#    All prescriptions   Patient Name
#    All prescriptions   Care Plan ID

BCP-NURSE-DEVICES-STUDIES-03: Filter Study-Active list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Heart studies page
    ...   - Select Study-Active tab
    ...   - Search On-going study by Patient name/ Care plan ID/ Study ID/ Device ID
    ...   Expected Result:
    ...   - User shall be able to view an On-going study card that they want to view.
    [Tags]   BCP-NURSE-DEVICES-STUDIES-03       manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Study-Active
#    Patient name
#    Care plan ID
#    Study ID

BCP-NURSE-DEVICES-STUDIES-04: Filter Study-Completed list
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Heart studies page
    ...   - Select Study-Completed tab
    ...   - Search completed studies by Patient name/ Care plan ID/ Study ID
    ...   Expected Result:
    ...   - User shall be able to view the completed study that they want to view.
    [Tags]   BCP-NURSE-DEVICES-STUDIES-04      manual    inactive
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Template]    Filter Study-Completed   # Data: TBD
#    Patient name
#    Care plan ID
#    Study ID

BCP-NURSE-DEVICES-STUDIES-05: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Study Prescription
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Heart monitor - Study prescription tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed
    ...   At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-NURSE-DEVICES-STUDIES-05       manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Devices Heart Studies
#    Filter Heart Studies Prescription    by_prescription=All prescriptions       search_by=Patient name       text_search=${PATIENT_STUDY_1}
#    ${pre_study}        Get Heart Studies Prescription
#    View Heart Studies Prescription Study Appointment Summary On    row=1
#    ${patient_appt}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][0]       ${pre_study}[0][Patient Name]
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][1]       Care plan ID: ${pre_study}[0][Care Plan ID]
#    Go To Patient Details
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}    ${PATIENT_STUDY_1}

BCP-NURSE-DEVICES-STUDIES-06: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Active Study
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Heart monitor - Active study tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed
    ...   At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-NURSE-DEVICES-STUDIES-06       manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Devices Heart Studies
#    Filter Heart Studies Active    search_by=Patient name       text_search=${PATIENTS}[17]
#    ${act_study}        Get Heart Studies Active
#    ${patient_name}         Set Variable    ${act_study}[0][Patient name]
#    View Heart Studies Active Study Appointment Summary On    patient_name=${patient_name}      care_plan_id=${act_study}[0][Care plan ID]
#    ${patient_appt}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][0]       ${act_study}[0][Patient name]
#    Run Keyword And Continue On Failure    Should Be Equal      ${patient_appt}[Top info][1]       Care plan ID: ${act_study}[0][Care plan ID]
#    Go To Patient Details
#    ${header}       Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${header}    ${PATIENTS}[17]


BCP-NURSE-DEVICES-STUDIES-07: Go To The Patient Details Page By Clicking Patient Name Hyperlink From Completed Study
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Heart monitor - Completed study tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   At step 2, the Care plan info side tab will be displayed
    ...   At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-NURSE-DEVICES-STUDIES-07     manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-08: Check UI update Prescribe new study
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select menu Patients
    ...  2. At the patient details screen > Select the Prescribe study button
    ...  3. At the Study type dropdownlist > Click to select
    ...  4. When done, select the option Follow-on study > Check UI

    ...  Expected result:
    ...  3. Dropdown list filter system, with additional Follow-on Study option
    ...  4. Display textbox "Primary study duration (days)"
    ...                                   Dropdown list: Follow-on study type
    ...                                   Dropdown list: Follow-on study duration (days)
    ...                                   Dropdown list: Primary diagnosis code
    ...                                   Dropdown list: Second diagnosis code (optional)
    ...                                   Text box: Physican amendments notes (optional)
    [Tags]    BCP-NURSE-DEVICES-STUDIES-08        manual      BCCA-2.23.0   R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-09: Perform Add new study with Study type = Follow-on Study
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select menu Patients
    ...  2. At the patient details screen > Select the Prescribe study button
    ...  3. At the dropdownlist Study type > Click Study type = Follow-on Study
    ...  4. Enter all data correctly and validate
    ...  5. Click View prescription
    ...  6. Click the "Cancel prescription" button
    ...  7. Click "Start study"

    ...  Expected result:
    ...  4. Add successfully
    ...  5. Displays the Prescription details screen with Study information according to settings
    ...  6. Click "No" > the screen stays the same. Click "Yes" > Cancel successfully study above
    ...  7. Navigate through the diagnostics page with full patient information
    [Tags]    BCP-NURSE-DEVICES-STUDIES-09        manual      BCCA-2.23.0   R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-10: Perform set monitor pain log for New patient
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select menu Patients > Click button Add new patient
    ...  2. Enter correct data to validate
    ...  3. Perform setup program
    ...  4. At the menu Monitored information > Enable button Pain

    ...  Expected result:
    ...  4. Default Disability level > 60% , Consecutive days (1 - 7 days) = 5
    [Tags]    BCP-NURSE-DEVICES-STUDIES-10        manual      BCCA-2.23.0   R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-11: Check UI icon ! In Disability index
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. At setup Pain > Hover, click on the icon!

    ...  Expected result:
    ...  1. Display icons and colors like design figma according to levels: 0-20%, 21-40%, 41-60%, 61-80%, 81-100%"
    [Tags]    BCP-NURSE-DEVICES-STUDIES-11        manual      BCCA-2.23.0   R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-12: Create task Disability level alert
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select patient menu
    ...  2. Select monitored data tab > Enable button toggle Pain
    ...  3. Login Apps > Answer pre-set questions so that the total number of questions is < 60%
    ...  4. Login Portal > Check data the next day
    ...  5. Login Apps > Answer pre-set questions so that the total number of questions > 60%
    ...  6. Login Portal > Check data the next day

    ...  Expected result:
    ...  3. Default Disability level > 60%, setup Consecutive days = 1
    ...  5. Do not display task Disability level alert
    ...  7. Display task Disability level alert with % data according to the answer in apps
    [Tags]    BCP-NURSE-DEVICES-STUDIES-12        manual      BCCA-2.23.0   R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-13: Create a task Disability level alert with Consecutive days = 2
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select patient menu
    ...  2. Select monitored data tab > Enable button toggle Pain
    ...  3. Login Apps > Day 1: Answer pre-set questions so that total questions > 60%
    ...  4. Login Apps > Day 2: Answer the pre-set questions so that the total number of questions is < 60%
    ...  5. Login Portal > Check data the next day
    ...  6. Login Apps > Day 1: Answer pre-set questions so that total questions > 60%
    ...  7. Login Apps > Day 2: Answer pre-set questions so that total questions > 60%
    ...  8. Login Portal > Check data the next day

    ...  Expected result:
    ...  3. Default Disability level > 60%, setup Consecutive days = 2
    ...  7. Do not display task Disability level alert
    ...  10. Display task Disability level alert with % data according to the answer in apps
    [Tags]    BCP-NURSE-DEVICES-STUDIES-13        manual      BCCA-2.23.0   R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-14: Create a task Disability level alert with Consecutive days = 3
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login portal > Select patient menu
    ...  2. Select monitored data tab > Enable button toggle Pain
    ...  3. Login Apps > Day 1: Answer pre-set questions so that total questions > 40%
    ...  4. Login Apps > Day 2: Answer pre-set questions so that total questions > 40%
    ...  5. Login Apps > Day 3: Answer the pre-set questions so that the total number of questions is < 40%
    ...  6. Login Portal > Check data the next day
    ...  7. Login Apps > Day 1: Answer pre-set questions so that total questions > 40%
    ...  8. Login Apps > Day 2: Answer pre-set questions so that total questions > 40%
    ...  9. Login Apps > Day 3: Answer pre-set questions so that total questions > 40%
    ...  10 Login Portal > Check data the next day
    ...  Expected result:
    ...  2. Default Disability level > 40%, setup Consecutive days = 3
    ...  6. Do not display task Disability level alert
    ...  10. Display task Disability level alert with % data according to the answer in apps
    [Tags]    BCP-NURSE-DEVICES-STUDIES-14        manual      BCCA-2.23.0   R3
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-15: Check UI chart pain view day
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Login App > Create Pain log data
    ...  2. Answer questions to reach 20%
    ...  3. Login portal > Select the patient who just added pain log
    ...  4. Check UI chart pain view day

    ...  Expected result:
    ...  4. Displays Disability index 20% and green icon
    [Tags]    BCP-NURSE-DEVICES-STUDIES-15        manual      BCCA-2.23.0   R3
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-DEVICES-STUDIES-16: Answer questions to reach 20% on Monday
     [Documentation]    Author: Bao Van
    ...  Pre-condition:
    ...
    ...  Test steps:
    ...  1. Answering questions reached 40% on Tuesday
    ...  2. Completed 60% question answering on Wednesday
    ...  3. Answer questions to reach 80% on Thursday
    ...  4. Get 100% answer on Friday
    ...  5. Login portal > Select the patient who just added pain log
    ...  6. Check UI chart pain view Week

    ...  Expected result:
    ...  6. Display Disability index in turn:
    ...               Monday: 20% green vertical chart
    ...               Tuesday: 40% yellow vertical chart
    ...               Wednesday: 60% orange vertical chart
    ...               Thursday: 80% red vertical chart
    ...               Friday: 100% dark red vertical chart
    [Tags]    BCP-NURSE-DEVICES-STUDIES-16        manual      BCCA-2.23.0   R1
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
    [Arguments]    ${search_by}
    Navigate To Devices Heart Studies
    Filter Heart Studies Active    search_by=${search_by}     text_search=${EMPTY}
    ${act_studies}      Get Heart Studies Active
    Run Keyword And Continue On Failure    Should Not Be Empty    ${act_studies}      No Active studies found - Text search without text string
    ${text}     Set Variable If    '${search_by}' == 'Device ID'        ${act_studies}[0][Device]
    ${text}     Set Variable If    '${search_by}' != 'Device ID'        ${act_studies}[0][${search_by}]
    Filter Heart Studies Active     search_by=${search_by}      text_search=${text}
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
    [Arguments]     ${search_by}
    Navigate To Devices Heart Studies
    Filter Heart Studies Completed    search_by=${search_by}
    ${com_studies}      Get Heart Studies Completed
    ${text}     Set Variable    ${com_studies}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${com_studies}        No Completed studies found - Text search without text string
    Filter Heart Monitor Completed     search_by=${search_by}     text_search=${text}
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
    ${pre_study}      Get Patient Details Heart Monitor Current Study
    # Prescribe study
    Run Keyword If    '${pre_study}' != None and 'Cancel this study prescription' not in '${pre_study}'
    ...  Prescribe New Study   use_biodirect=True    device=${device_type}    study_type=${study_type}    study_duration=3    primary_diagnosis_code=I49.5 - Sick sinus syndrome      secondary_diagnosis_code=I49.8 - Other specified cardiac arrhythmias      notes=Physician amendments notes (optional) Test
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
