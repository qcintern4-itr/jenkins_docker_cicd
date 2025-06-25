*** Settings ***
Documentation   Cardiac Care Plan Reports Monthly page test suite
Metadata    sid     BCP-NURSE-CPR-MONTHLY
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/CarePlanReportsMonthly.py
#Library     project_cardiac_portal/lib/web/ReportDetails.py
#Library     project_cardiac_portal/lib/web/PatientDetails.py
#Library     project_cardiac_portal/lib/web/Appointment.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-CPR-MONTHLY       web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-CPR-MONTHLY-01: View Monthly reports of a specific patient on the Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Care plan reports page by clicking Care plan reports tab on the main navigation
    ...   - Select on Monthly tab to view the reports list
    ...   - Search a report by Patient name or Care plan ID
    ...   - Filter the Review by Reviewed/Unreviewed
    ...   - Click on a specific report row to view details
    ...   Expected Results:
    ...   - The searching results shall be displayed
    ...   - User shall be able to view the Monthly reports list of all patients on this page
    ...   - By clicking on a specific Monthly report, user be able to view the report in details.
    [Tags]    BCP-NURSE-CPR-MONTHLY-01      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Monthly - Care Plan Report
#    All patients      All statuses      Patient name

BCP-NURSE-CPR-MONTHLY-02: Mark A Report As Reviewed Or Unreviewed on Care plan reports from the main navigation
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - Go to Reports - Monthly list from the main navigation
    ...  - Click on a specific report on the list
    ...  - On the report details, tick on the Reviewed check box
    ...  - Untick the Reviewed check box
    ...  - Observe the report log
    ...  Expected results:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-NURSE-CPR-MONTHLY-02    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-MONTHLY-03: Mark A Report As Reviewed Or Unreviewed on Care plan reports from the main navigation - outside the report details
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - Go to Reports - Monthly list from the main navigation
    ...  - Tick/untick the Reviewed check box from a specific report row
    ...  - Check the report log
    ...  Expected results:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-NURSE-CPR-MONTHLY-03      manual      [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly      by_patient=All patients       status=All statuses     search_by=Patient name      text_search=${EMPTY}
#    View Care Plan Report Monthly Details On    row=1
#    Toggle Review Report    True
#    ${logs}     Get Report Log
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${logs}       No monthly report log found
#    Run Keyword And Continue On Failure    Should Contain    ${logs}[0].values()        ${CURR_USER}[name] marked the report as reviewed.
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly     by_patient=All patients       status=All statuses     search_by=Patient name      text_search=${EMPTY}
#    View Care Plan Report Monthly Details On    row=1
#    Toggle Review Report    False
#    ${logs}     Get Report Log
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${logs}       No monthly report log found
#    Run Keyword And Continue On Failure    Should Contain    ${logs}[0].values()        ${CURR_USER}[name] marked the report as unreviewed.

BCP-NURSE-CPR-MONTHLY-04: Filter successfully the Monthly report list on Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Monthly reports tab
    ...   - Input data on the search field of which Patient or Care plan that user wants to view
    ...   - Click the Filter button on the right side of the page
    ...   - Select the Plan type as CCM/RPM
    ...   - Select the Review as Reviewed/Unreviewed
    ...   - Click Apply button
    ...   - Observe the reports list
    ...   Expected results:
    ...   - The results of the filter shall list all the Monthly reports that match with selected filter
    ...   - The Apply button is always enabled
    ...   - In case clicking outside the filter dropdown will close the filter dropdown and remain the previous filter
    ...   - The Clear button shall be enabled if user ticks on the Review section.
    ...   **Others**

    [Tags]    BCP-NURSE-CPR-MONTHLY-04     manual       [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-MONTHLY-05: View Report log of a specific Monthly report from Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   - Go to the Care plan reports page
    ...   - Click the Monthly reports tab
    ...   - Select a specific report from the list
    ...    - On the top right of the report details, click the Report log icon
    ...   Expected Result:
    ...   - User shall be able to view the action of themselve and also the other users if anyone takes any action on the report.
    [Tags]     BCP-NURSE-CPR-MONTHLY-05    manual
    Manual Should Be Passed     ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-MONTHLY-06: Download a Monthly report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Download button
    ...   Expected Results:
    ...   - The report shall be downloaded successfully.
    [Tags]    BCP-NURSE-CPR-MONTHLY-06    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-MONTHLY-07: Add Clinician comments
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Add comment icon
    ...   - Input comments then click Add comments button
    ...   - Click Save button to save the comments.
    ...   Expected results:
    ...   - The Clinician's comments shall be added to the report successfully.
    [Tags]    BCP-NURSE-CPR-MONTHLY-07    manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly      by_patient=All patients       status=All statuses     search_by=Patient name      text_search=${EMPTY}
#    View Care Plan Report Monthly Details On    row=1
#    Add Comments    comments=Add Clinician comments test
#    ${comment}      Get Comments
#    Run Keyword And Continue On Failure    Should Contain    ${comment}     Add Clinician comments test

BCP-NURSE-CPR-MONTHLY-08: Save the changes made on the report
    [Documentation]    Author: Bao Van
    ...
    ...   Test Steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Save changes button
    ...   Expected Results:
    ...   - The changes was made will be saved successfully
    ...   - If user leaves the report without saving the change, a pop-up will be displayed to confirm if they want to save it or not.
    [Tags]    BCP-NURSE-CPR-MONTHLY-08   manual        BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly     by_patient=All patients       status=All statuses     search_by=Patient name     text_search=${EMPTY}
#    View Care Plan Report Monthly Details On    row=1
#    # add comments, not save and leave
#    Add Comments    comments=Comment Test
#    ${conmsg}     Back From Report Details
#    Run Keyword And Continue On Failure    Should Be Equal    ${conmsg}    You haven’t saved the comment. Are you sure you want to leave this page?
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly    by_patient=All patients       status=All statuses     search_by=Patient name      text_search=${EMPTY}
#    View Care Plan Report Monthly Details On    row=1
#    ${cmt}      Get Comments
#    Run Keyword And Continue On Failure    Should Be Empty    ${cmt}
#    # add comments, save and leave
#    Add Comments    comments=Comment Test
#    Save Changes
#    Back From Report Details
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly    by_patient=All patients       status=All statuses     search_by=Patient name      text_search=${EMPTY}
#    View Care Plan Report Monthly Details On    row=1
#    ${cmt}      Get Comments
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${cmt}
#    Run Keyword And Continue On Failure    Should Contain    ${cmt}     Comment Test

BCP-NURSE-CPR-MONTHLY-09: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Monthly report page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-NURSE-CPR-MONTHLY-09        manual      [BCP-2.17]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-MONTHLY-10: Check the icon when there are data changes on the Monthly report page
    [Documentation]    Author: Bao Van
    ...  Pre-condition: user is on the Monthly report page
    ...  Test steps:
    ...  1. Login App > Add/Edit information related to health in May
    ...  2. Login Portal > Select Monthly report > Select the patient's May report whose information has just been updated
    ...  3. Hover points the mouse to the icon
    ...  4. At the report above > Perform re-generate

    ...  Expected result:
    ...  2. The monthly report displays the "!" icon.
    ...  3. Display text: " New data found for this month. Regenerate report to include it"
    ...  4. Successfully re-gen monthly report with new data. Lost icon "!" in addition to monthly reports
    [Tags]    BCP-NURSE-CPR-MONTHLY-10        manual      BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-MONTHLY-11: Check UI changes monthly report:
    [Documentation]    Author: Bao Van
    ...  Pre-condition: user is on the Monthly report page
    ...  Test steps:
    ...  1. Select report menu > Select monthly report
    ...  2. At any patient > Check UI monthly report
    ...  3. Check data monthly report

    ...  Expected result:
    ...  2. Changed name from "Task list" -> Patients Alert
    ...  3. In the Task list, only display indicators related to Health: heart rate, body tempure,... in Flag or Complete state. Hide all other reports
    [Tags]    BCP-NURSE-CPR-MONTHLY-11        manual      BCCA-2.26
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-MONTHLY-12: Check UI update Monthly report format of a facility
    [Documentation]    Author: Bao Van
    ...  Pre-condition: user is on the Monthly report page
    ...  Test steps:
    ...  1. Login Portal > Select Settings menu > Select Monthly report format tab
    ...  2. Check UI update Monthly report format of a facility
    ...  3. If save fails

    ...  Expected result:
    ...  2. Expect: A snack-bar shall be displayed: “Settings is updated successfully!”. The user shall receive the push notification and banner in real time when there is a new message from their conversation.
    ...             The user shall receive the Email and SMS for that day, with the number of new messages counted from that time.
    ...  3. A snack-bar shall be displayed: “Settings is failed to update!”
    [Tags]    BCP-NURSE-CPR-MONTHLY-12        manual      BCCA-2.28.0   R1
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library      project_cardiac_portal/lib/web/Common.py                    ${BROWSER_NODE}     ${ENV}
    Import Library      project_cardiac_portal/lib/web/ReportDetails.py             ${BROWSER_NODE}     ${ENV}
    Import Library      project_cardiac_portal/lib/web/CarePlanReportsMonthly.py    ${BROWSER_NODE}     ${ENV}
    Import Library      project_cardiac_portal/lib/web/Appointment.py               ${BROWSER_NODE}     ${ENV}
    Import Library      project_cardiac_portal/lib/web/PatientDetails.py            ${BROWSER_NODE}     ${ENV}
    ${USER}      Get Config Param    USER > nurse
    Set Suite Variable      ${CURR_USER}       ${USER}[0]
    Set Suite Variable      ${NURSE_ACT}       ${USER}[1]
    ${TOKEN}        Sign In Cardiac     username=${CURR_USER}[username]   password=${CURR_USER}[password]
    ${VERSION}      Get Release Version
    Set Suite Variable     ${TOKEN}
    Set Suite Metadata     version    ${VERSION}
    Set Suite Metadata     browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser

Filter Monthly - Care Plan Report       # Create Monthly Care plan Reports: TDB
    [Arguments]    ${by_patient}     ${by_status}     ${search_by}
    Navigate To Care Plan Reports Monthly
    Filter Care Plan Reports Monthly    by_patient=${by_patient}     status=${by_status}     search_by=${search_by}    text_search=${EMPTY}
    ${reports}      Get Care Plan Reports Monthly
    ${text}         Set Variable    ${reports}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No care plan report monthly found - ${search_by} without text string
    Filter Care Plan Reports Monthly    by_patient=${by_patient}     status=${by_status}     search_by=${search_by}    text_search=${text}
    ${reports}      Get Care Plan Reports Monthly
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No care plan report monthly found - ${search_by} ${text}
    Run Keyword If    '${by_status}' == 'Unreviewed'
    ...  Run Keyword And Continue On Failure    Should Be True     all('--' in r['Status'] for r in ${reports})
    Run Keyword If    '${by_status}' == 'Reviewed'
    ...  Run Keyword And Continue On Failure    Should Be True     all('${by_status}' in r['Status'] for r in ${reports})
    Run Keyword If    '${search_by}' == 'Patient name'
    ...  Run Keyword And Continue On Failure    Should Be True     all('${text}'.lower() in r['${search_by}'].lower() for r in ${reports})
    Run Keyword If    '${search_by}' == 'Care plan ID'
    ...  Run Keyword And Continue On Failure    Should Be True     all('${text}' == r['${search_by}'] for r in ${reports})
    View Care Plan Report Monthly Details On    row=1
    ${page_header}      Get Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      Report details
