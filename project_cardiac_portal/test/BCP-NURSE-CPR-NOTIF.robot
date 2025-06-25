*** Settings ***
Documentation   Cardiac Care Plan Report Notification page test suite
Metadata    sid     BCP-NURSE-CPR-NOTIF
Metadata    owner   Khang Nguyen
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_cardiac_portal/lib/web/Common.py
#Library     project_cardiac_portal/lib/web/CarePlanReportsNotification.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-NURSE-CPR-NOTIF     web
Test Timeout    1h

*** Test Cases ***
BCP-NURSE-CPR-NOTIF-01: View Notification reports of a specific patient on Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to Care plan reports page by clicking Care plan reports tab on the main navigation
    ...   - Select on Notification tab to view the reports list
    ...   - Search a report by Patient name or Care plan ID
    ...   - Filter report Status by Sent/Unsent
    ...   - Filter the Review by Reviewed/Unreviewed
    ...   - Click on a specific report row to view details
    ...   Expected Results:
    ...   - The searching results shall be displayed
    ...   - User shall be able to view the Notification reports list of all patients on this page
    ...   - By clicking on a specific Notification report, user be able to view the report in details.
    [Tags]    BCP-NURSE-CPR-NOTIF-01      manual
    Manual Should Be Passed    ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-02: Mark A Report As Reviewed Or Unreviewed on Care plan reports from the main navigation
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - Go to Reports - Notification list from the main navigation
    ...  - Click on a specific report on the list
    ...  - On the report details, tick on the Reviewed check box
    ...  - Untick the Reviewed check box
    ...  - Observe the report log
    ...  Expected results:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-NURSE-CPR-NOTIF-02    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-03: Mark A Report As Reviewed Or Unreviewed on Care plan reports from the main navigation - outside the report details
    [Documentation]    Author: Hoang Le
    ...
    ...  Test steps:
    ...  - Go to Reports - Notification list from the main navigation
    ...  - Tick/untick the Reviewed check box from a specific report row
    ...  - Check the report log
    ...  Expected results:
    ...  - The report will be marked as reviewed or unreviewed successfully based on the user action
    ...  - User's actions will be logged on this section.
    [Tags]    BCP-NURSE-CPR-NOTIF-03      manual        [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-04: Filter successfully the Notification report list on Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Go to the Notification reports tab
    ...   - Input data on the search field of which Patient or Care plan that user wants to view
    ...   - Click the Filter button on the right side of the page
    ...   - Select the Status as Sent/Unsent
    ...   - Select the Review as Reviewed/Unreviewed
    ...   - Click Apply button
    ...   - Observe the reports list
    ...   Expected results:
    ...   - The results of the filter shall list all the notification reports that match with selected filter
    ...   - The Apply button is always enabled
    ...   - In case clicking outside the filter dropdown will close the filter dropdown and remain the previous filter
    ...   - The Clear button shall be enabled if user ticks on both Status and Review sections.
    [Tags]    BCP-NURSE-CPR-NOTIF-04     manual     [BCP-2.15]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-05: View Report log of a specific Notification report from Care plan reports page
    [Documentation]    Author: Hoang Le
    ...
    ...   Test steps:
    ...   - Go to the Care plan reports page
    ...   - Click the Notification reports tab
    ...   - Select a specific report from the list
    ...    - On the top right of the report details, click the Report log icon
    ...   Expected Result:
    ...   - User shall be able to view the action of themselve and also the other users if anyone takes any action on the report.
    [Tags]     BCP-NURSE-CPR-NOTIF-05    manual
    Manual Should Be Passed     ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-06: Download a Notification report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Notification reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Download button
    ...   Expected Results:
    ...   - The report shall be downloaded successfully.
    [Tags]    BCP-NURSE-CPR-NOTIF-06    manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-07: Add Clinician comments
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Notification reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Add comment icon
    ...   - Input comments then click Add comments button
    ...   - Click Save button to save the comments.
    ...   Expected results:
    ...   - The Clinician's comments shall be added to the report successfully.
    [Tags]    BCP-NURSE-CPR-NOTIF-07    manual
    Manual Should Be Passed     ${TEST NAME}    ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-08: Save the changes made on the report
    [Documentation]    Author: Hoang Le
    ...
    ...   Test Steps:
    ...   - Access to the Notification reports list
    ...   - Pick the one which user wants to view from the list
    ...   - At the bottom of the left, select the Save changes button
    ...   Expected Results:
    ...   - The changes was made will be saved successfully
    ...   - If user leaves the report without saving the change, a pop-up will be displayed to confirm if they want to save it or not.
    [Tags]    BCP-NURSE-CPR-NOTIF-08   manual
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-NURSE-CPR-NOTIF-09: Column visibility - Hide/show column(s) on page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: user is on the Notification report page
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to hide/show any column(s) on page by setting on Column visibility button.
    [Tags]    BCP-NURSE-CPR-NOTIF-09        manual      [BCP-2.17]
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
