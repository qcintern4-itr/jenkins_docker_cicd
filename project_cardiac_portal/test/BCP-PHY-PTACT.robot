*** Settings ***
Documentation   Cardiac Patient Active page test suite
Metadata    sid     BCP-PHY-PTACT
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/PatientsActive.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/Appointment.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-PTACT       web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-PTACT-01: Filter Active patients by "My patients"
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Active patients page
    ...   - Filter the patients list by "My patients"
    ...   - Search patients by Patient name or Care plan ID
    ...   - Select on a specific patient row which user wants to view the details
    ...   Expected Result:
    ...   - A patient's details page shall be displayed.
    [Tags]   BCP-PHY-PTACT-01    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Patients - Active
#    My patients      Care plan ID
#    My patients      Patient name

BCP-PHY-PTACT-02: Filter Active patients by "All patients"
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Active patients page
    ...   - Filter the patients list by "All patients"
    ...   - Search patients by Patient name or Care plan ID
    ...   - Select on a specific patient row which user wants to view the details
    ...   Expected Result:
    ...   - A patient's details page shall be displayed.
    [Tags]   BCP-PHY-PTACT-02    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Patients - Active
#    All patients      Care plan ID
#    All patients      Patient name

BCP-PHY-PTACT-03: Go to the Patient Details Page By Clicking Patient Name Hyperlink
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Active patients tab
    ...   2.Click any patient name hyperlink on the list
    ...   3.On the side tab bar, click Go to patient details button
    ...   Expected Result:
    ...   - At step 2, the Care plan info side tab will be displayed
    ...   - At step 3, user will be navigated to the Patient details page which they selected before.
    [Tags]   BCP-PHY-PTACT-03    manual    inactive
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Patients Active
#    Filter Active Patients    by_patient=All patients
#    ${act_patients}     Get Active Patients
#    ${patient_name}     Set Variable    ${act_patients}[0][Patient name]
#    # Appointment summary
#    View Active Patient Appointment Summary On    row=1
#    ${appt_summary}     Get Appointment Summary    is_close=False
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${appt_summary}     Care plan info side tab is null
#    Run Keyword And Continue On Failure    Should Contain   ${appt_summary}[Top info]     ${patient_name}
#    Run Keyword And Continue On Failure    Should Contain   ${appt_summary}[Top info]     Care plan ID: ${act_patients}[0][Care plan ID]
#    Run Keyword And Continue On Failure    Should Contain   ${appt_summary}[Registered clinic]     ${act_patients}[0][Clinic]
#    # Patient details
#    Go To Patient Details
#    ${page_header}      Get Page Header
#    Run Keyword And Continue On Failure    Should Contain    ${page_header}      ${patient_name}

BCP-PHY-PTACT-04: Stop An Active Care Plan
    [Documentation]     Author: Hoang Le
    ...
    ...   Test Steps:
    ...   1.Go to Inactive patients page
    ...   2.Select a care plan which one want to reactivate
    ...   3.On the Patient details page, click Reactivate care plan button
    ...   4.Select Reactivate/Cancel on the confirmation modal
    ...   Expected Result:
    ...   - In the mobile app, the patient will be navigated to the Reference code screen and their care plan will display in the Previous care plan
    ...   - In case the care plan is stopped before the end of calendar month, the monthly report of that calendar month will not be sent
    ...   - In tab Time tracking, there is an icon to notify that the calendar month is not enough 30 days because the care plan was stopped.
    [Tags]   BCP-PHY-PTACT-04     manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-PHY-PTACT-05: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Active patient page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-PHY-PTACT-05        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-06: Flag program on the Active page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Active patient page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to flag the program as (high/medium/low).
    [Tags]    BCP-PHY-PTACT-06        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-07: Flag program on the patient details
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the patient details page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to flag the program as (high/medium/low).
    [Tags]    BCP-PHY-PTACT-07        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-08: Update the flag on the Active page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Active patient page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to edit the flag of the program as (high/medium/low).
    [Tags]    BCP-PHY-PTACT-08        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-09: Update the flag on patient details
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the patient details page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to edit the flag of the program as (high/medium/low).
    [Tags]    BCP-PHY-PTACT-09        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-10: Add notes NOT included on the report for the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user does not tick the Included on the Monthly report check box from the Notes side bar
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to add Notes successfully for a program
    [Tags]    BCP-PHY-PTACT-10        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-11: Add notes included on the report for the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user ticks the Included on the Monthly report check box from the Notes side bar
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to add Notes successfully for a program
    ...  The Notes shall be displayed on the Monthly report.
    [Tags]    BCP-PHY-PTACT-11        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-12: Edit Notes of the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: there is a Note added to the program
    ...  Test steps:
    ...  Expected result:
    ...  The Notes shall be updated as the user inputs.
    [Tags]    BCP-PHY-PTACT-12        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-PTACT-13: Delete Notes of the program
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: there is a Note added to the program
    ...  Test steps:
    ...  Expected result:
    ...  The Notes shall be deleted from the program.
    [Tags]    BCP-PHY-PTACT-13        manual      [BCP-2.17]
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

Filter Patients - Active
    [Arguments]    ${by_patient}    ${search_by}
    Navigate To Patients Active
    Filter Active Patients    by_patient=${by_patient}       search_by=${search_by}
    ${act_patients}     Get Active Patients
    ${text}     Set Variable    ${act_patients}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${act_patients}     No active patient found - ${search_by} without text string
    Filter Active Patients    by_patient=${by_patient}       search_by=${search_by}     text_search=${text}
    ${act_patients}     Get Active Patients
    Run Keyword And Continue On Failure    Should Not Be Empty    ${act_patients}     No active patient found - ${search_by} ${text}
    Run Keyword If    '${search_by}' == 'Patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in patient['${search_by}'].lower() for patient in ${act_patients})
    Run Keyword If    '${search_by}' == 'Care plan ID'      Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == patient['${search_by}'] for patient in ${act_patients})
    ...  AND    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${text}       ${act_patients}[0][${search_by}]
    # Navigate to patient details and verify
    View Active Patient Details On    row=1
    ${head}     Get Page Header
    Run Keyword And Continue On Failure    Should Contain    ${head}    ${act_patients}[0][Patient name]
    ${patient_details}      Get Patient Details Common
    Run Keyword And Continue On Failure    Should Not Be Empty    ${patient_details}
    Run Keyword And Continue On Failure    Should Be True    ['${act_patients}[0][Patient name]' in ${patient_details}[0].keys()]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0]      Care plan ID: ${act_patients}[0][Care plan ID]
    Run Keyword And Continue On Failure    Should Contain    ${patient_details}[0][Registered clinic]    ${act_patients}[0][Clinic]
