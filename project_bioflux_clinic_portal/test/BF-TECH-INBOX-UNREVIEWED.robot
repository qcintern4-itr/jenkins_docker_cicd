*** Settings ***
Documentation   Test Suite - Clinic Portal - Unreviewed reports-Inbox page
Metadata    sid     BF-TECH-INBOX-UNREVIEWED
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library       project_bioflux_clinic_portal/lib/web/Common.py
Library       project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-TECH-INBOX-UNREVIEWED       web
Test Timeout    1h

*** Test Cases ***
BF-TECH-INBOX-UNREVIEWED-VIEW-01: View the Unreviewed reports screen
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: The user can view the Unreviewed reports screen in the Inbox list
    ...
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Observe the Unreviewed report screen
    ...
    ...     Expected Results:
    ...     2. There is a drop-down facility list on the header of the INBOX page
    ...     3. There is a description of the number of reports displayed on the page and the total of all reports
    ...     that are sent to the clinic: “Showing <from which report to which report> of <total of sent reports>”
    ...     4. Sort dropdown
    ...     5. Search bar
    ...     6. Search option
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-01       manual       R1       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-02: Quick access Patient ID
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
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-02       manual       R1       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-03: Quick access Study ID
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
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-03       manual       R1       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-04: Check case there is a green lable with the Biodirect label title on studies if running the Biodirect service
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
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-04       manual       R1       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-05: Check case there is no report
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
    ...     1. The list will display this message: “There is no data to display”
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-05       manual       R3       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-06: Check case a study is aborted by a Call Center user
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
    ...     1. Their reports should be removed from this list. However, in case they are not, clicking on a report will
    ...     display an error message: “This report is no longer available”
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-06       manual       R2       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-07: Check report is auto-generated and displayed if available and not artifact
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
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-07       manual       R1       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-08: Check report not displayed if available and artifact
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
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-08       manual       R1       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-09: Check report not displayed if not available
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
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-09       manual       R1       CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Observe the header of INBOX page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the INBOX page
    ...     2. All the data associated with that facility shall be displayed
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-FILTER-FACILITY-01       manual     R2      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-FILTER-FACILITY-02: Filter by facility in case the user associates with multiple facilities
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click on the drop-down list on the header of the INBOX page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the INBOX page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-FILTER-FACILITY-02       manual     R2      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-PAGINATION-01: Navigate to the next page
    [Documentation]      Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate to the next page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click the Next button
    ...
    ...     Expected Results:
    ...     1. the user should be navigated to the next page
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-PAGINATION-01       manual     R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-PAGINATION-02: Navigate to the previous page
    [Documentation]      Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate to the previous page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click the Prev button
    ...
    ...     Expected Results:
    ...     1. The  user should be navigated to the previous page
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-PAGINATION-02       manual     R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-SORT-01: Sort the report lists on the Inbox page
    [Documentation]  Author: Nhan Nguyen
    ...  Description: The user can sort the report lists on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Observe the sort button
    ...     3. Click the Sort button
    ...     4. Click on the Sort button a second time.
    ...
    ...     Expected Results:
    ...     1. Newest to Oldest (default value)
    ...     2. The report list should sort into Oldest to Newest
    ...     3. The report list should sort into Newest to Oldest
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-SORT-01       manual     R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-SEARCH-01: View all search attributes on the Inbox page
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can view all search attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Physician (only available for Filter option is All studies)
    ...     2. The default search option should be Patient Name
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-SEARCH-01      manual     R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-SEARCH-02: Search by Patient Name attributes on the Inbox page
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient name
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-SEARCH-02       manual     R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-SEARCH-03: Search by Study ID attributes on the Inbox page
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Study ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Study ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-SEARCH-03       manual     R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-SEARCH-04: Search by Patient ID attributes on the Inbox page
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Patient ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-SEARCH-04       manual     R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-DETAILS-01: View details of Unreviewed report in the list
    [Documentation]     Author: Nhan Nguyen
    ...     Description: The user can view information of each report in the list
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click a specific report
    ...
    ...     Expected Results:
    ...     1. The report view screen has the following components
    ...     - Study ID
    ...     - Patient’s first name and last name
    ...     - Physician: Interpreting physician’s first name and last name
    ...     - Date of Service: the timeframe of the report (MM/DD/YYYY - MM/DD/YYYY)
    ...     - PDF Viewer: display the PDF file of the report
    ...     - Toolbar:
    ...      + Add interpretation button
    ...      + Save button
    ...      + Download button
    ...     - Open study button
    ...     - Back button
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-DETAILS-01      manual      R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-VIEW-DETAILS-02: View details of Unreviewed report-Open Study Management
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-VIEW-DETAILS-02      manual      R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-DOWNLOAD-01: Download PDF file
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can download the PDF file on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unreviewed reports tab of the INBOX page
    ...     2. Click on a specific report
    ...     3. Click the Download button
    ...
    ...     Expected Results:
    ...     1. The PDF report shall be downloaded to the user’s device
    ...     2. The filename of the downloaded pdf file should follow this rule
    ...     - Unreviewed reports:
    ...     “Unreviewed-FacilityName-PatientID-StudyID-ReportID-StudyStartDate(YYYYMMDD)-StudyStartTime(HHMM)”
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-DOWNLOAD-01       manual    R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-COMMENT-01: Input physician interpretation to PDF reports in case report has not physician interpretation before
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description: The user can Input physician interpretation to PDF reports
    ...
    ...     Precondition:
    ...     - The user is on report reading view screen
    ...
    ...     Test Steps:
    ...     1. Click the Add interpretation button
    ...     2. Enter the contents on the textbox
    ...     3. Click the Add comment button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - A popup shall be displayed
    ...     2. At step 3:
    ...     -  The contents of the textbox will be added to Physician Interpretation section of the PDF report
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-COMMENT-01       manual    R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-UNREVIEWED-COMMENT-02: Edit physician interpretation to PDF reports in case report already has physician interpretation
    [Documentation]   Author: Nhan Nguyen
    ...
    ...     Description: The user can edit physician interpretation to PDF reports
    ...
    ...     Precondition:
    ...     - The user is on report reading view screen
    ...
    ...     Test Steps:
    ...     1. Click the Add interpretation button
    ...     2. Enter the contents on the textbox
    ...     3. Click the Add comment button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     - A popup shall be displayed, the contents of the interpretation shall be displayed in the textbox
    ...     2. At step 3:
    ...     - The contents shall be updated
    ...
    ...     Others:
    ...     Last updated: 07/25/2024-Nhan Nguyen

    [Tags]  BF-TECH-INBOX-UNREVIEWED-COMMENT-02       manual    R1      CP-2.24.0    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}          Start Browser
    Import Library           project_bioflux_clinic_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/Inbox.py     ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/Studies.py     ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}              Get Config Param       NEW_USER > clinic_physician
    ${STUDY_ID}              Get Config Param    STUDY_ID
    ${STUDY_ID_COMPLETED}    Set Variable        ${STUDY_ID}[study_id_completed]
    Set Global Variable      ${STUDY_ID_COMPLETED}
    Set Suite Variable       ${PHY_USER}
    Sign In Bioflux          username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${VERSION}               Get Release Version
    Set Suite Metadata       version     ${VERSION}
    Set Suite Metadata       browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Unreviewed Reports
    [Arguments]     ${search_by}
    Navigate To Inbox
    Navigate To Report Type    Unreviewed reports
    Filter Inbox    report_type=Unreviewed reports        search_by=${search_by}
    ${reports}       Get Reports On Page 2
    ${text}          Set Variable If
    ...  '${search_by.lower()}' == 'patient name'       ${reports}[0][Patient Name]
    ...  '${search_by.lower()}' == 'study id'           ${reports}[0][Study ID]
    ...  '${search_by.lower()}' == 'patient id'         ${reports}[0][Patient ID]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found - text search without text string
    Filter Inbox    report_type=Unreviewed reports       search_by=${search_by}      text_search=${text}
    ${reports}       Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found - with text search ${search_by} '${text}'
    Run Keyword If     '${search_by.lower()}' == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in r['Patient Name'].lower() for r in ${reports})    Invalid results are showing - with ${search_by} text search `${text}`
    Run Keyword If     '${search_by.lower()}' == 'study id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' in r['Study ID'] for r in ${reports})       Invalid results are showing - with ${search_by} text search `${text}`
    Run Keyword If     '${search_by.lower()}' == 'patient id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == r['Patient ID'] for r in ${reports})     Invalid results are showing - with ${search_by} text search `${text}`
    Check on the across each tab        All reports          ${text}         ${search_by}
    Check on the across each tab        Recent reports       ${text}         ${search_by}
    Check on the across each tab        End of Use reports   ${text}         ${search_by}
    Check on the across each tab        Interim reports      ${text}         ${search_by}
    Check on the across each tab        Notification reports    ${text}         ${search_by}
    Check on the across each tab        Unreviewed reports         ${text}         ${search_by}
    Navigate To Other Page      Studies
    Navigate To Other Page      Inbox
    ${value_current_search}     Get Inbox Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current_search}[Text Search]       ${text}
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current_search}[Search By]         ${search_by}
    Clear Inbox Text Search
    ${text_search}     Get Inbox Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${text_search}[Text Search]      ${None}

Clear Comment Text
    [Arguments]    ${report_type}=${EMPTY}   ${priority}=${EMPTY}   ${search_by}=${EMPTY}    ${text_search}=${EMPTY}
    Filter Inbox     report_type=${report_type}     priority=${priority}       search_by=${search_by}      text_search=${text_search}
    Select Report    row=1
    Open Add Interpretation Dialog
    Clear Interpretation
    ${success_msg}   Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
    Filter Inbox     report_type=${report_type}     priority=${priority}       search_by=${search_by}      text_search=${text_search}
    Select Report    row=1
    Open Add Interpretation Dialog
    ${comment}      Get Interpretation     is_close=True
    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Comment is not cleared

Check on the across each tab
    [Arguments]    ${tab}=${EMPTY}      ${text}=${EMPTY}         ${search_by}=${EMPTY}
    Navigate To Report Type    ${tab}
    ${value_current_search}     Get Inbox Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current_search}[Text Search]       ${text}
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current_search}[Search By]        ${search_by}

Deleted study with study id "${study_id}"
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${study_id}
    Delete Completed Study On    row=1
    ${studies}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${studies}
    Refresh Page
    Filter Studies    study_state=Deleted       search_by=Study ID      text_search=${study_id}
    ${deleted}      Get Deleted Studies
    ${deleted_id}     Set Variable        ${deleted}[0][Study ID]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${deleted}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_id}       ${deleted_id}

Restore deleted study with study id "${study_id}"
    Navigate To Studies Page
    Refresh Page
    Filter Studies    study_state=Deleted       search_by=Study ID      text_search=${study_id}
    ${studies}        Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    Restore Deleted Studies On    row=1
    ${deleted}      Get Deleted Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${deleted}
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${study_id}
    ${studies}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
