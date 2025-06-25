*** Settings ***
Documentation   Test Suite - Clinic Portal - Recent Inbox page
Metadata    sid     BF-PHY-INBOX-RECENT
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library      project_bioflux_clinic_portal/lib/web/Common.py
Library      project_bioflux_clinic_portal/lib/web/Inbox.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-PHY-INBOX-RECENT     web
Test Timeout    1h

*** Test Cases ***
BF-PHY-INBOX-RECENT-VIEW-01: View the Recent reports screen
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the Recent reports screen in the Inbox list
    ...
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Observe the Recent report screen
    ...
    ...     Expected Results:
    ...     1. On the side navigation menu, the Recent reports tab shall have a label indicating the number
    ...     of unread reports
    ...     2. There is a drop-down facility list on the header of the INBOX page
    ...     3. There is a description of the number of reports displayed on the page and the total of all reports
    ...     that are sent to the clinic: “Showing <from which report to which report> of <total of sent reports>”
    ...     4. Sort dropdown
    ...     5. Priority filter
    ...     6. Search bar
    ...     7. Search option

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-01     auto    R1
    Navigate To Inbox
    Navigate To Report Type    Recent reports
    ${checked_items}        Create List     facility    sort     search bar    search by    priority    inbox items
    ${actual_result}        Check Report Items Are Available        ${checked_items}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[facility]            ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[sort]                ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[search bar]          ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[priority]            ${True}
    ${expected_search_by}       Create List    Patient name     Study ID      Patient ID
    ${expected_priority}        Create List    All priority    Low     Medium    High    Urgent    Emergent
    ${search_by}                Get Inbox Filter Options
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_search_by}       ${search_by}[Search By]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_priority}        ${search_by}[Priority]

BF-PHY-INBOX-RECENT-VIEW-02: Quick access Patient ID
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-03: Quick access Study ID
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-03       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-04: EOU - Check case the recently sent EOU report has been marked as an Artifact report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. An “Artifact report”, then an “error” tag shall be placed at the top right corner of the report card
    ...     2. When the clinic user hovers over the “error” tag a tooltip shall appear with the label “Report is marked as artifact”
    ...     3. the comment section shall display the following message:” This report could not be generated due to all data being artifact.
    ...     Please ensure you are checking ECG connection when starting a study”.
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-04       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-05: Interim - Check case the recently sent Interim report has been marked as an Artifact report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. An “Artifact report”, then an “error” tag shall be placed at the top right corner of the report card
    ...     2. When the clinic user hovers over the “error” tag a tooltip shall appear with the label “Report is marked as artifact”
    ...     3. the comment section shall display the following message:” This report could not be generated due to all data being artifact.
    ...     Please ensure you are checking ECG connection when starting a study”.
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-06: Check case there is a green lable with the Biodirect label title on studies if running the Biodirect service
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-06       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-07: Check case there is no report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. The list will display this message: “There is no data to display”
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-07       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-08: Check case a study is deleted by a clinic user
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Their reports should be removed from this list. However, in case they are not, clicking on a report will
    ...     display an error message: “This report is no longer available”
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-08       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-09: Check case a study is aborted by a Call Center user
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     1. Their reports should be removed from this list. However, in case they are not, clicking on a report will
    ...     display an error message: “This report is no longer available”
    ...
    ...     **Others**
    ...     Update date: 02/22/2024 - Trinh Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-09       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Observe the header of INBOX page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the INBOX page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-FACILITY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-FACILITY-02: Filter by facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click on the drop-down list on the header of the INBOX page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the INBOX page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-FACILITY-02       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-PAGINATION-01: Navigate to the next page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the next page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click the Next button
    ...
    ...     Expected Results:
    ...     1. the user should be navigated to the next page

    [Tags]  BF-PHY-INBOX-RECENT-PAGINATION-01       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-PAGINATION-02: Navigate to the previous page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the previous page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click the Prev button
    ...
    ...     Expected Results:
    ...     1. The  user should be navigated to the previous page

    [Tags]  BF-PHY-INBOX-RECENT-PAGINATION-02       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-SORT-01: Sort the report lists on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...  Description: The user can sort the report lists on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Observe the sort button
    ...     3. Click the Sort button
    ...     4. Click on the Sort button a second time.
    ...
    ...     Expected Results:
    ...     1. Newest to Oldest (default value)
    ...     2. The report list should sort into Oldest to Newest
    ...     3. The report list should sort into Newest to Oldest

    [Tags]  BF-PHY-INBOX-RECENT-SORT-01       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-PRIORITY-01: Filter the report lists by priority on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can filter the report lists by priority on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click the Priority filter button
    ...     3. Select a specific filter option
    ...
    ...     Expected Results:
    ...     1. A dropdown where the user can select one of the following options to filter the report lists displayed:
    ...     - All priority (default value)
    ...     - Emergent
    ...     - Urgent
    ...     - High
    ...     - Medium
    ...     - Low
    ...     2. The selected filter option shall be remained and be applied across the report tabs on the INBOX page
    ...     3. All the data associated with that priority shall be reflected accordingly
#    Break to new case
#    ...     4. If there is no report, a message will be displayed: “There is no data to display”

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-PRIORITY-01       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-SEARCH-01: View all search attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Physician (only available for clinic technicians and clinic electrophysiologists)
    ...     2. The default search option should be Patient Name

    [Tags]  BF-PHY-INBOX-RECENT-SEARCH-01       auto
    Navigate To Inbox
    Navigate To Report Type    Recent reports
    ${default_filter}       Get Inbox Current Filter
    ${expected_options}     Create List    Patient name     Study ID      Patient ID
    ${search_options}       Get Inbox Filter Options
    ${search_options}       Set Variable    ${search_options}[Search By]
    # Verify search options
    Run Keyword And Continue On Failure    Lists Should Be Equal      ${expected_options}     ${search_options}
    # Default search_by
    Run Keyword And Continue On Failure    Should Be Equal    ${default_filter}[Search By]      Patient name

BF-PHY-INBOX-RECENT-SEARCH-03: Search by Study ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Study ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Study ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
#    Break to new case
#    ...     4. A message will be displayed: “No result found”
    ...     4. All entered text will be deleted

    [Tags]  BF-PHY-INBOX-RECENT-SEARCH-03       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-SEARCH-04: Search by Patient ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Patient ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
#    Break to new case
#    ...     4. A message will be displayed: “No result found”
    ...     4. All entered text will be deleted

    [Tags]  BF-PHY-INBOX-RECENT-SEARCH-04       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-SEARCH-05: Search by Patient Name with existing Patient on system
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...
    ...     Expected Results:
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient name
    ...
    ...     **Others
    ...    - Update date: 05/07/2025 - Nhan Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-SEARCH-05    auto
    [Template]    Search Reports
    Recent reports    Patient name

BF-PHY-INBOX-RECENT-SEARCH-06: Search by Patient Name-Check message displayed in case of searching with no result found
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...
    ...     Expected Results:
    ...     The report list shall be filtered and displayed accordingly with the entered Patient name
    ...
    ...    **Others
    ...    - Update date: 05/07/2025-Nhan Nguyen

    [Tags]  BF-PHY-INBOX-RECENT-SEARCH-06     auto
    [Template]    Search Reports With Non-Existent
    Recent reports    Patient name    No name
    Recent reports    Study ID    123
    Recent reports    Patient ID    Nonexistent

BF-PHY-INBOX-RECENT-VIEW-DETAILS-01: View details of Recent report in the list
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can view information of each report in the list
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click a specific report
    ...
    ...     Expected Results:
    ...     The report view screen has the following components:
    ...     - Study ID
    ...     - Patient’s first name and last name
    ...     - Physician: Interpreting physician’s first name and last name
    ...     - Report Date:
    ...      + For EOU/Interim/Notification reports, the report date shall display the Date of service.
    ...      + For event reports, the Event time shall display the date-time that the event is triggered
    ...     - PDF Viewer: PDF Viewer: display the PDF file of the report. In case the report is marked as artifact,
    ...     the PDF shall not be available and a message saying “This report could not be generated due to all data
    ...     being artifact. Please ensure you are checking ECG connection when starting a study”
    ...     - Toolbar:
    ...      + Add interpretation button
    ...      + Add signature button (only for physicians)
    ...      + Save button
    ...      + Download button
    ...     The toolbar shall be hidden in the case the report has been marked as artifact
    ...     - Open study button
    ...     - Delete report button
    ...     - Back button
    ...     - A checkbox for the user to mark/unmark the report as reviewed
    ...     - An artifact tag
    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-02: View EOU report details
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-03: View Interim report details
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-03       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-04: View Notification report details
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-04       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-05: View Event report details
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-06: MCT study/EOU old report format-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-06       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-07: MCT study/EOU new report format-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-07       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-08: MCT Peek study/EOU old report format-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-08       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-09: MCT Peek study/EOU new report format-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-09       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-10: Holter/Ext.Holter study/EOU old report format-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-10       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-11: Holter/Ext.Holter study/EOU new report format-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-11       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-12: Cardiac Event study/EOU old report format-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-12       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-13: EOU-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-13       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-14: Interim-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-14       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-15: Interim-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-15       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-16: Notification-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-16       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-17: Notification-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-17       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-18: Event-Add Interpretation and Signature
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-18       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-VIEW-DETAILS-19: Event-Download report
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-VIEW-DETAILS-19       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-REVIEWED-01: Mark a report sent by the Call center as reviewed
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can mark a report sent by the Call center as reviewed
    ...
    ...     Precondition:
    ...     - The Clinic user is on the report view screen
    ...     - The report is in Not reviewed status
    ...     - Only available for reports sent by the Call center
    ...
    ...     Test Steps:
    ...     1. Click the Reviewed checkbox button
    ...
    ...     Expected Results:
    ...     1. The status will be saved on changes
    ...     2. There is an error message will be displayed when the portal failed to save the "Reviewed" status
    ...     3. The Review status is saved for both physicians and technicians. It means when a report is marked as
    ...     reviewed by either the physician or technicians, the review status will be updated on both roles’ portals

    [Tags]  BF-PHY-INBOX-RECENT-REVIEWED-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-REVIEWED-02: Mark a report sent by the Call center as not reviewed
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-REVIEWED-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-DOWNLOAD-01: Download PDF file
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can download the PDF file on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Recent reports tab of the INBOX page
    ...     2. Click on a specific report
    ...     3. Click the Download button
    ...
    ...     Expected Results:
    ...     1. The PDF report shall be downloaded to the user’s device
    ...     2. The filename of the downloaded pdf file should follow this rule
    ...     - Instant reports:
    ...     “Instant-FacilityName-PatientID-StudyID-ReportID-StudyStartDate(YYYYMMDD)-StudyStartTime(HHMM)”
    ...     - Notification reports:
    ...      + Event reports:
    ...     “Event-FacilityName-PatientID-StudyID-ReportID-TriggerDate(YYYYMMDD)-TriggerDate(HHMM)”
    ...      + Notification reports:
    ...     “Notification-FacilityName-PatientID-StudyID-StudyStartDate(YYYYMMDD)-StudyStartTime(HHMM)”
    ...     - Interim reports: “Interim-FacilityName-PatientID-StudyID-StudyStartDate(YYYYMMDD)-StudyStartTime(HHMM)”
    ...     - End of use reports: “Summary-FacilityName-PatientID-StudyID-StudyStartDate(YYYYMMDD)-StudyStartTime(HHMM)”

    [Tags]  BF-PHY-INBOX-RECENT-DOWNLOAD-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-COMMENT-01: Input physician interpretation to PDF reports in case report has not physician interpretation before
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The user can Input physician interpretation to PDF reports
    ...
    ...     Precondition:
    ...     - The user is on report reading view screen
    ...
    ...     Test Steps:
    ...     1. Observe the Physician Interpretation section to confirm it is empty
    ...     2. Enter the content in the textbox
    ...     3. Click the Save Changes button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - The Physician Interpretation section is empty
    ...     2. At step 3:
    ...     -  The contents of the textbox will be added to Physician Interpretation section of the PDF report
    ...
    ...     **Others
    ...     Update date: 2/11/2025 - Tam Ho
    [Tags]  BF-PHY-INBOX-RECENT-COMMENT-01       manual    R1    CP-2.28.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-COMMENT-02: Input physician interpretation to PDF reports in case report already has physician interpretation
    [Documentation]   Author: Trinh Nguyen
    ...
    ...     Description: The user can Input physician interpretation to PDF reports
    ...
    ...     Precondition:
    ...     - The user is on report reading view screen
    ...
    ...     Test Steps:
    ...     1. Observe the Physician Interpretation section to confirm it already contains an interpretation
    ...     2. Enter the contents on the textbox
    ...     3. Click the Save Changes button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - The Findings section contains existing content
    ...     2. At step 3:
    ...     - The updated content is saved and displayed in the Findings section of the PDF report
    ...
    ...     **Others
    ...     Update date: 2/11/2025 - Tam Ho
    [Tags]  BF-PHY-INBOX-RECENT-COMMENT-02       manual    R1    CP-2.28.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-SIGN-01: Add a signature to a PDF report
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can Add a signature to a PDF report
    ...
    ...     Precondition:
    ...     - The user is on the report view screen
    ...
    ...     Test Steps:
    ...     1. Enter the contents on the textbox
    ...     2. Click the Sign & Save button
    ...     3. Draw a signature on the drawing area
    ...     4. Click the Sign & Save button on Physician signature modal
    ...
    ...     Expected Results:
    ...     1. In step 2:
    ...     - Display Physician signature modal
    ...     2. In step 4:
    ...     - The signature in the drawing area will be added above the Physician's Signature
    ...     and Date section of the PDF report
    ...     - The modified PDF report will be saved, and the changes can be seen by any user who can see the report
    ...
    ...     **Others
    ...     Update date: 2/11/2025 - Tam Ho
    [Tags]  BF-PHY-INBOX-RECENT-SIGN-01       manual    R1    CP-2.28.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-01: Check default report status is New, Downloaded, Reviewed, Interpreted
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-01       manual      CP-2.22.0   R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-02: Filter by Report status is New
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-02       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-03: Filter by Report status is Downloaded
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-03       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-04: Filter by Report status is Reviewed
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-04       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-05: Filter by Report status is Interpreted
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-05       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-06: Filter by Report status is Interpreted
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-06       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-07: Filter by Report status is Signed
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-07       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-08: Filter by Report status is Completed
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-08       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-09: Filter by Report status will be applied for other tabs (except All reports)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-09       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STATUS-10: Filter by multiple Report statuses
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STATUS-10       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STUDIES-01: Check default study filter status is Your studies
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STUDIES-01       manual      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STUDIES-02: Filter reports by All studies
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STUDIES-02      manual      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-RECENT-FILTER-STUDIES-03: Switch studies filter between Your studies and All studies
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-INBOX-RECENT-FILTER-STUDIES-03      manual      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Inbox.py     ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}           Get Config Param       NEW_USER > clinic_physician
    Set Suite Variable    ${PHY_USER}
    Sign In Bioflux       username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${VERSION}            Get Release Version
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Search Reports
    [Arguments]    ${report_type}=${EMPTY}    ${search_by}=${EMPTY}
    Navigate To Inbox
    Navigate To Report Type    ${report_type}
    ${all_reports}    Get Reports On Inbox
    ${search_text}=    Set Variable If
    ...    '${search_by.lower()}' == 'patient name'    ${all_reports}[0][Patient Name]
    ...    '${search_by.lower()}' == 'study id'        ${all_reports}[0][Study ID]
    ...    '${search_by.lower()}' == 'patient id'      ${all_reports}[0][Patient ID]
    ...    ELSE    Fail    Unsupported search field: ${search_by}
    Filter Inbox    search_by=${search_by}    text_search=${search_text}
    ${reports}    Get Reports On Inbox
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}    No reports found with ${search_by} = `${search_text}`
    Run Keyword If    '${search_by.lower()}' == 'patient name'    Validate Patient Name Match   ${reports}    ${search_text}
    ...    ELSE IF    '${search_by.lower()}' == 'study id'        Validate Study ID Match    ${reports}    ${search_text}
    ...    ELSE IF    '${search_by.lower()}' == 'patient id'      Validate Patient ID Match       ${reports}    ${search_text}

Validate Patient Name Match
    [Arguments]    ${reports}    ${search_text}
    FOR    ${report}    IN    @{reports}
        ${report_name}    Set Variable    ${report}[Patient Name]
        ${report_words}    Evaluate    '${report_name}'.lower().split()
        ${search_words}    Evaluate    '${search_text}'.lower().split()
        ${match_result}    Evaluate    any(word in ${search_words} for word in ${report_words})
        Run Keyword And Continue On Failure    Should Be True    ${match_result}
    END

Validate Study ID Match
    [Arguments]    ${reports}    ${search_text}
    Run Keyword And Continue On Failure    Should Be True    all('${search_text}' in r['Study ID'] for r in ${reports})

Validate Patient ID Match
    [Arguments]    ${reports}    ${search_text}
    Run Keyword And Continue On Failure    Should Be True    all('${search_text}' in r['Patient ID'] for r in ${reports})

Search Reports With Non-Existent
    [Arguments]    ${report_type}=${EMPTY}    ${search_by}=${EMPTY}    ${text_search}=${EMPTY}
    Navigate To Inbox
    Navigate To Report Type    ${report_type}
    Filter Inbox   search_by=${search_by}   text_search=${text_search}
    ${reports}    ${message}    Get Reports On Inbox
    Run Keyword And Continue On Failure    Should Be Equal    ${message}    No result found