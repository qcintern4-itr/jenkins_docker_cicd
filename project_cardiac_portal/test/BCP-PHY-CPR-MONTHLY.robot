*** Settings ***
Documentation   Cardiac Care Plan Reports Monthly page test suite
Metadata    sid     BCP-PHY-CPR-MONTHLY
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/CarePlanReportsMonthly.py
#Library     project_cardiac_portal/lib/web/ReportDetails.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-PHY-CPR-MONTHLY     web
Test Timeout    1h

*** Test Cases ***
BCP-PHY-CPR-MONTHLY-01: View Monthly reports of a specific patient on Care plan reports page
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
    [Tags]    BCP-PHY-CPR-MONTHLY-01      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}
#    [Template]    Filter Monthly - Care Plan Report
#    All patients      All statuses      Patient name

BCP-PHY-CPR-MONTHLY-02: Mark A Report As Reviewed Or Unreviewed on Care plan reports from the main navigation
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
    [Tags]    BCP-PHY-CPR-MONTHLY-02    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-CPR-MONTHLY-03: Mark A Report As Reviewed Or Unreviewed on Care plan reports from the main navigation - outside the report details
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - Go to Reports - Monthly list from the main navigation
    ...  - Tick/untick the Reviewed check box from a specific report row
    ...  - Check the report log
    ...  Expected results:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-PHY-CPR-MONTHLY-03      manual        [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}
    # Auto script: Using existing patient + care plan monthly report (input ${patient_name} to test): TBD
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly      by_patient=All patients       status=All statuses     search_by=Patient name      text_search=${EMPTY}
#    View Care Plan Report Monthly Details On    row=1
#    Toggle Review Report    True
#    ${logs}     Get Report Log
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${logs}       No monthly report log found
#    Run Keyword And Continue On Failure    Should Be Equal    ${logs}[0].values()        ${CURR_USER} marked the report as reviewed.
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly     by_patient=All patients       status=All statuses     search_by=Patient name      text_search=${EMPTY}
#    Toggle Review Report    False
#    ${logs}     Get Report Log
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${logs}       No monthly report log found
#    Run Keyword And Continue On Failure    Should Be Equal    ${logs}[0].values()        ${CURR_USER} marked the report as unreviewed.

BCP-PHY-CPR-MONTHLY-04: Filter successfully the Monthly report list on Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Monthly reports tab
    ...   - Input data on the search field of which Patient or Care plan that user wants to view
    ...   - Click the Filter button on the right side of the page
    ...   - Select the Review as Reviewed/Unreviewed
    ...   - Click Apply button
    ...   - Observe the reports list
    ...   Expected results:
    ...   - The results of the filter shall list all the Monthly reports that match with selected filter
    ...   - The Apply button is always enabled
    ...   - In case clicking outside the filter dropdown will close the filter dropdown and remain the previous filter
    ...   - The Clear button shall be enabled if user ticks on the Review section.
    [Tags]    BCP-PHY-CPR-MONTHLY-04     manual     [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-CPR-MONTHLY-05: View Report log of a specific Monthly report from Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   - Go to the Care plan reports page
    ...   - Click the Monthly reports tab
    ...   - Select a specific report from the list
    ...    - On the top right of the report details, click the Report log icon
    ...   Expected Result:
    ...   - User shall be able to view the action of themselve and also the other users if anyone takes any action on the report.
    [Tags]     BCP-PHY-CPR-MONTHLY-05    manual
    Manual Should Be Passed     ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-CPR-MONTHLY-06: Download a Monthly report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Download button
    ...   Expected Results:
    ...   - The report shall be downloaded successfully.
    [Tags]    BCP-PHY-CPR-MONTHLY-06    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-CPR-MONTHLY-07: Add Physician interpretation
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Add comment icon
    ...   - Input data then click Add interpretation button
    ...   - Click Save button to save the data.
    ...   Expected results:
    ...   - The Physician interpretation shall be added to the report successfully.
    [Tags]    BCP-PHY-CPR-MONTHLY-07    manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}
    # Auto script: Using existing patient + care plan monthly report (input ${patient_name} to test): TBD
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly    by_patient=All patients     status=All statuses     search_by=Patient name      text_search=patient_162 test
#    View Care Plan Report Monthly Details On    row=1
#    Add Interpretation    interpretation=Test Add Interpretation     option=Modify care plan
#    ${interpre}     Get Interpretation
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${interpre}
#    Run Keyword And Continue On Failure    Should Be Equal        ${interpre}[Interpretation]        Test Add Interpretation
#    Run Keyword And Continue On Failure    Should Be Equal        ${interpre}[Selected option]       Modify care plan

BCP-PHY-CPR-MONTHLY-08: Save the changes made on the report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Save changes button
    ...   Expected Results:
    ...   - The changes was made will be saved successfully
    ...   - If user leaves the report without saving the change, a pop-up will be displayed to confirm if they want to save it or not.
    [Tags]    BCP-PHY-CPR-MONTHLY-08   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-PHY-CPR-MONTHLY-09: Add signature
    [Documentation]    Author: Hoang Le
    ...   Test steps:
    ...   - Access to the Monthly reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select Add signature button
    ...   - Sign the user signature on this field
    ...   - Tick/untick on the Remember signature check box
    ...   - Select Add signature button
    ...   Expected results:
    ...   - The Physician signature shall be added to the report
    ...   - The Physician signature shall be added and remembered for the following time if user clicks on it.
      [Tags]  BCP-PHY-CPR-MONTHLY-09    manual
      Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

      # https://itrvn.atlassian.net/browse/BCP-682
     # Auto script: Using existing patient + care plan monthly report (input ${patient_name} to test): TBD
#    Navigate To Care Plan Reports Monthly
#    Filter Care Plan Reports Monthly    by_patient=All patients     status=All statuses     search_by=Patient name      text_search=patient_162 test
#    View Care Plan Report Monthly Details On    row=1
#    Add Interpretation    interpretation=Test Add Interpretation     option=Modify care plan
#    ${interpre}     Get Interpretation
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${interpre}
#    Run Keyword And Continue On Failure    Should Be Equal        ${interpre}[Interpretation]        Test Add Interpretation
#    Run Keyword And Continue On Failure    Should Be Equal        ${interpre}[Selected option]       Modify care plan
#    # Leave report details without save changes
#    ${msg}     Back From Report Details
#    Run Keyword And Continue On Failure    Should Be Equal        ${msg}        You haven’t saved the interpretation. Are you sure you want to leave this page?
#    Filter Care Plan Reports Monthly    by_patient=All patients     status=All statuses     search_by=Patient name      text_search=patient_162 test
#    View Care Plan Report Monthly Details On    row=1
#    ${interpre}     Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty          ${interpre}[Interpretation]
#    Run Keyword And Continue On Failure    Should Be Empty          ${interpre}[Selected option]        Continue with the current care plan  # Default selected
#    # Add interpre and save changes
#    Add Interpretation    interpretation=Test Add Interpretation     option=Modify care plan
#    Save Changes
#    # back and navigate back and verify
#    ${msg}     Back From Report Details
#    Run Keyword And Continue On Failure    Should Be Empty    ${msg}
#    Filter Care Plan Reports Monthly    by_patient=All patients     status=All statuses     search_by=Patient name      text_search=patient_162 test
#    View Care Plan Report Monthly Details On    row=1
#    ${interpre}     Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Equal        ${interpre}[Interpretation]        Test Add Interpretation
#    Run Keyword And Continue On Failure    Should Be Equal        ${interpre}[Selected option]       Modify care plan

BCP-PHY-CPR-MONTHLY-10: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Monthly report page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-PHY-CPR-MONTHLY-10        manual      [BCP-2.17]
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

Filter Monthly - Care Plan Report
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
