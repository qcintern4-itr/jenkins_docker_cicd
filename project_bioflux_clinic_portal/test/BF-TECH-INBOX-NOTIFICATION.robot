*** Settings ***
Documentation   Test Suite - Clinic Portal - Notification Inbox page
Metadata    sid     BF-TECH-INBOX-NOTIFICATION
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-TECH-INBOX-NOTIFICATION      web
Test Timeout    1h

*** Test Cases ***
BF-TECH-INBOX-NOTIFICATION-VIEW-01: View the Notification reports screen
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the Notification reports screen in the Inbox list
    ...
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Observe the Notification report screen
    ...
    ...     Expected Results:
    ...     1. On the side navigation menu, the Notification reports tab shall have a label indicating the number
    ...     of unread reports
    ...     2. There is a drop-down facility list on the header of the INBOX page
    ...     3. There is a description of the number of reports displayed on the page and the total of all reports
    ...     that are sent to the clinic: “Showing <from which report to which report> of <total of sent reports>”
    ...     4. Sort dropdown
    ...     5. Priority filter
    ...     6. Search bar
    ...     7. Search option

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-01      auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    ${checked_items}        Create List     facility    sort     search bar    search by    priority    inbox items
    ${actual_result}        Check Report Items Are Available        ${checked_items}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[facility]            ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[sort]                ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[search bar]          ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[priority]            ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[inbox items]         ${True}
    ${expected_search_by}       Create List    Patient name     Study ID      Patient ID    Physician
    ${expected_priority}        Create List    All priority    Low     Medium    High    Urgent    Emergent
    ${search_by}                Get Inbox Filter Options
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_search_by}       ${search_by}[Search By]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_priority}        ${search_by}[Priority]
    # Step 1, 3 TBD

BF-TECH-INBOX-NOTIFICATION-VIEW-02: Quick access Patient ID
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-02       auto       R1
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    View Patient Info    row=1
    ${patient_information}        Get Patient Info View
    # Expected attributes
    ${expected_ptinfo_attributes}           Create List    Name     Gender   ID     DOB     Height    Weight    Ethnicity    Pacemaker   ICD
    ${expected_ptcontact_attributes}        Create List    Address      Zip code      Phone number     2nd phone number     Email
    ${expected_secondcontact_attributes}    Create List    Name     Phone Number    Relationship    Email
    ${expected_insurance_attributes}        Create List    Insurance type    Provider     Pre-authorization required
    ${expected_medicalhistory_attributes}   Create List    Symptoms the patient experienced     Symptom frequency       Used heart monitor
    # Actual attributes
    ${patient_info}           Evaluate    [k for k, v in ${patient_information}[Patient information].items()]
    ${patient_contact}        Evaluate    [k for k, v in ${patient_information}[Patient contact].items()]
#    ${second_contact}         Evaluate    [k for k, v in ${patient_information}[Secondary contact].items()]
    ${insurance}              Evaluate    [k for k, v in ${patient_information}[Insurance].items()]
    ${medical_history}        Evaluate    [k for k, v in ${patient_information}[Medical history].items()]
    # Verify atrributes
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptinfo_attributes}               ${patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptcontact_attributes}            ${patient_contact}
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_secondcontact_attributes}        ${second_contact}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_insurance_attributes}            ${insurance}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_medicalhistory_attributes}       ${medical_history}

BF-TECH-INBOX-NOTIFICATION-VIEW-03: Quick access Study ID
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-03       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=Notification reports
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    View Study Info     row=1
    ${study_information}        Get Study Info View
    # expected title
    ${expected_study_info}       Create List     Status   Start time   End time   Study type   Study duration   Initial duration   Patient return visit   Device ID   Clinician initials
    ${expected_refer_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_inter_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_diagnosis}        Create List     Primary diagnosis code     Secondary diagnosis code     Patient medication
    # actual title
    ${study_info}      Evaluate    [k for k, v in ${study_information}[Study information].items()]
    ${refer_phy}       Evaluate    [k for k, v in ${study_information}[Referring physician].items()]
    ${inter_phy}       Evaluate    [k for k, v in ${study_information}[Interpreting physician].items()]
    ${diagnosis}       Evaluate    [k for k, v in ${study_information}[Diagnosis].items()]
    # Verify
    Run Keyword And Continue On Failure    Lists Should Be Equal            ${study_info}    ${expected_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal            ${refer_phy}     ${expected_refer_physician}
    Run Keyword And Continue On Failure    Lists Should Be Equal            ${inter_phy}     ${expected_inter_physician}
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${expected_diagnosis}     ${diagnosis}

BF-TECH-INBOX-NOTIFICATION-VIEW-04: Check case there is a green lable with the Biodirect label title on studies if running the Biodirect service
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-04       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-05: Check case there is no report
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-06: Check case a study is deleted by a clinic user
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-06       auto       R1
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    ${eou_report}       Get Reports On Page 2
    ${study_ids}         Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${study_id}         Evaluate  random.choice(${study_ids})    random
    Deleted Study With Study Id "${study_id}"
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox    search_by=Study ID      text_search=${study_id}
    ${eou_report}       Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Be Empty    ${eou_report}
    [Teardown]    Run Keyword    Restore Deleted Study With Study Id "${study_id}"

BF-TECH-INBOX-NOTIFICATION-VIEW-07: Check case a study is aborted by a Call Center user
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-07       auto       R1
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[aborted_study_id]
    ${eou_report}       Get All Reports On Page
    Run Keyword And Continue On Failure    Should Be Empty    ${eou_report}

BF-TECH-INBOX-NOTIFICATION-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Observe the header of INBOX page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the INBOX page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-TECH-INBOX-NOTIFICATION-FILTER-FACILITY-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Navigate To Report Type    Notification reports
#    ${current_facility}      Get Current Facility
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${current_facility}       No reports found
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_facility}       All facilities
#    ${reports}      Get Reports On Page
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found

BF-TECH-INBOX-NOTIFICATION-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click on the drop-down list on the header of the INBOX page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the INBOX page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly
    [Tags]  BF-TECH-INBOX-NOTIFICATION-FILTER-FACILITY-02       auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox        status_report=All
    Select Facility    Facility_QA_01
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found - on facility Facility_QA_01
    Navigate To Report Type    End of Use reports
    Select Facility    Facility_QA_02
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found - on facility Facility_QA_02
    Navigate To Report Type    End of Use reports
    Select Facility    All facilities
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found

BF-TECH-INBOX-NOTIFICATION-PAGINATION-01: Navigate to the next page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the next page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click the Next button
    ...
    ...     Expected Results:
    ...     1. the user should be navigated to the next page
    [Tags]  BF-TECH-INBOX-NOTIFICATION-PAGINATION-01        auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox        status_report=All
    ${be_reports_page1}        Get Reports On Page 2
    Go Next Page
    ${be_reports_page2}        Get Reports On Page 2
    Go Previous Page
    ${af_reports_page1}        Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Be Equal    ${be_reports_page1}       ${af_reports_page1}
    Go Next Page
    ${af_reports_page2}        Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Be Equal    ${be_reports_page2}       ${af_reports_page2}

BF-TECH-INBOX-NOTIFICATION-PAGINATION-02: Navigate to the previous page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the previous page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click the Prev button
    ...
    ...     Expected Results:
    ...     1. The  user should be navigated to the previous page

    [Tags]  BF-TECH-INBOX-NOTIFICATION-PAGINATION-02        auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox        status_report=All
    ${be_reports1}       Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${be_reports1}
    Go Next Page
    ${be_reports2}       Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${be_reports2}
    Go Previous Page
    ${af_reports1}       Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${af_reports1}
    Go Next Page
    ${af_reports2}       Get Reports On Page
    Run Keyword And Continue On Failure     Should Not Be Empty     ${af_reports2}
    Run Keyword And Continue On Failure     Should Not Be Equal     ${be_reports1}       ${be_reports2}
    Run Keyword And Continue On Failure     Should Not Be Equal     ${af_reports1}       ${af_reports2}
    Run Keyword And Continue On Failure     Should Be Equal         ${be_reports1}       ${af_reports1}
    Run Keyword And Continue On Failure     Should Be Equal         ${be_reports2}       ${af_reports2}

BF-TECH-INBOX-NOTIFICATION-SORT-01: Sort the report lists on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...  Description: The user can sort the report lists on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Observe the sort button
    ...     3. Click the Sort button
    ...     4. Click on the Sort button a second time.
    ...
    ...     Expected Results:
    ...     1. Newest to Oldest (default value)
    ...     2. The report list should sort into Oldest to Newest
    ...     3. The report list should sort into Newest to Oldest

    [Tags]  BF-TECH-INBOX-NOTIFICATION-SORT-01     auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    # Check ascending defauld
    ${sort_reports}      Sort Ascending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}
    # The report list should sort into Oldest to Newest
    ${sort_reports}      Sort Descending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}
    # The report list should sort into Newest to Oldest
    ${sort_reports}      Sort Ascending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}

BF-TECH-INBOX-NOTIFICATION-FILTER-PRIORITY-01: Filter the report lists by priority on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can filter the report lists by priority on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
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
    [Tags]  BF-TECH-INBOX-NOTIFICATION-FILTER-PRIORITY-01       auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox    status_report=All
    Filter Priority All Reports With Priority "Emergent"
    Filter Priority All Reports With Priority "Urgent"
    Filter Priority All Reports With Priority "High"
    Filter Priority All Reports With Priority "Medium"
    Filter Priority All Reports With Priority "Low"
    Filter Inbox    priority=All priority

BF-TECH-INBOX-NOTIFICATION-SEARCH-01: View all search attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Physician (only available for clinic technicians and clinic electrophysiologists)
    ...     2. The default search option should be Patient Name

    [Tags]  BF-TECH-INBOX-NOTIFICATION-SEARCH-01        auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    ${default_filter}       Get Inbox Current Filter
    ${expected_options}     Create List    Patient name     Study ID      Patient ID      Physician
    ${search_options}       Get Inbox Filter Options
    ${search_options}       Set Variable    ${search_options}[Search By]
    # Verify search options
    Run Keyword And Continue On Failure    Lists Should Be Equal      ${expected_options}     ${search_options}
    # Default search_by
    Run Keyword And Continue On Failure    Should Be Equal    ${default_filter}[Search By]      Patient name

BF-TECH-INBOX-NOTIFICATION-SEARCH-02: Search by Patient Name attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
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
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Patient name
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted

     [Tags]  BF-TECH-INBOX-NOTIFICATION-SEARCH-02       manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#     [Template]    Filter Notification Reports  # Facing bug
#     All priority     Patient name

BF-TECH-INBOX-NOTIFICATION-SEARCH-03: Search by Study ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-SEARCH-03        auto
    [Template]    Filter Notification Reports
    All priority     Study ID

BF-TECH-INBOX-NOTIFICATION-SEARCH-04: Search by Patient ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-SEARCH-04        auto
    [Template]    Filter Notification Reports
    All priority     Patient ID

BF-TECH-INBOX-NOTIFICATION-SEARCH-05: Search by Physician attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Physician name attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Physician option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Physician
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted

    [Tags]  BF-TECH-INBOX-NOTIFICATION-SEARCH-05        auto
    [Template]    Filter Notification Reports
    All priority     Physician

BF-TECH-INBOX-NOTIFICATION-SEARCH-06: Search by Patient Name with existing Patient on system
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
    ...    - Update date: 04/15/2025-Nhan Nguyen (auto)

    [Tags]  BF-TECH-INBOX-NOTIFICATION-SEARCH-06     auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox   search_by=Patient name   text_search=Patient API Test
    ${reports}    Get Notification Reports On Inbox
    Run Keyword And Continue On Failure    Should Be Equal    ${reports}[0][Patient Name]    Patient API Test

BF-TECH-INBOX-NOTIFICATION-SEARCH-07: Search by Patient Name-Check message displayed in case of searching with no result found
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
    ...    - Update date: 04/15/2025-Nhan Nguyen (auto)

    [Tags]  BF-TECH-INBOX-NOTIFICATION-SEARCH-07     auto
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox   search_by=Patient name   text_search=No name
    ${reports}    ${message}    Get Notification Reports On Inbox
    Run Keyword And Continue On Failure    Should Be Equal    ${message}    No result found

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-01: View details of Notification report in the list
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can view information of each report in the list
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click a specific report
    ...
    ...     Expected Results:
    ...     The report view screen has the following components:
    ...     - Study ID
    ...     - Patient’s first name and last name
    ...     - Physician: Interpreting physician’s first name and last name
    ...     - Report Date:
    ...      + For Notification reports, the report date shall display the Date of service.
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Filter Inbox    report_type=Notification reports
#    ${reports}      Get Reports On Page
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No EOU reports found
#    Select Report    row=1
#    ${report_details}       Get Report Detail
#    ${actual_header}        Evaluate        [k for k, v in ${report_details}.items()]
#    ${expect_header}        Create List     Study ID    Patient     Physician     Event time
#    Run Keyword And Continue On Failure     List Should Contain Sub List    ${actual_header}        ${expect_header}
#    ${items}       Check Report Detail Items Are Available      pdf viewer, back button, reviewed checkbox, download button, add interpretation button, add signature button, save button
#    Run Keyword And Continue On Failure     Should Be True     ${items}[pdf viewer]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[back button]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[reviewed checkbox]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[download button]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[add interpretation button]
#    Run Keyword And Continue On Failure     Should Not Be True     ${items}[add signature button]       # This button is not showed for technician
#    Run Keyword And Continue On Failure     Should Be True     ${items}[save button]

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-06: View Notification report details
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-06       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-07: View Event report details
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-07       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-18: Notification-Add Interpretation
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-18       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-19: Notification-Download report
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-19       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-20: Event-Add Interpretation
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-20       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-21: Event-Download report
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-21       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-22: View report details in case the Financial hold of the facility is "80 days" or "90 days"
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 02/23/2024 - Trinh Nguyen

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-22       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-23: Quick access Study ID from report details page
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 02/23/2024 - Trinh Nguyen

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-23       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-24: Quick access Patient ID from report details page
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 02/23/2024 - Trinh Nguyen

    [Tags]  BF-TECH-INBOX-NOTIFICATION-VIEW-DETAILS-24       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=Notification reports
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Select Report    row=1
    View Patient Info From Detail
    ${patient_information}        Get Patient Info View
    # Expected attributes
    ${expected_ptinfo_attributes}           Create List    Name     Gender   ID     DOB     Height    Weight    Ethnicity    Pacemaker   ICD
    ${expected_ptcontact_attributes}        Create List    Address      Zip code      Phone number     2nd phone number     Email
    ${expected_secondcontact_attributes}    Create List    Name     Phone Number    Relationship    Email
    ${expected_insurance_attributes}        Create List    Insurance type    Provider     Pre-authorization required
    ${expected_medicalhistory_attributes}   Create List    Symptoms the patient experienced     Symptom frequency       Used heart monitor
    # Actual attributes
    ${patient_info}           Evaluate    [k for k, v in ${patient_information}[Patient information].items()]
    ${patient_contact}        Evaluate    [k for k, v in ${patient_information}[Patient contact].items()]
#    ${second_contact}         Evaluate    [k for k, v in ${patient_information}[Secondary contact].items()]
    ${insurance}              Evaluate    [k for k, v in ${patient_information}[Insurance].items()]
    ${medical_history}        Evaluate    [k for k, v in ${patient_information}[Medical history].items()]
    # Verify atrributes
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptinfo_attributes}               ${patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptcontact_attributes}            ${patient_contact}
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_secondcontact_attributes}        ${second_contact}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_insurance_attributes}            ${insurance}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_medicalhistory_attributes}       ${medical_history}

BF-TECH-INBOX-NOTIFICATION-REVIEWED-01: Mark a report sent by the Call center as reviewed
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
    [Tags]  BF-TECH-INBOX-NOTIFICATION-REVIEWED-01      auto
    Navigate To Inbox
    Filter Inbox    report_type=Notification reports     priority=All priority
    ${reports}      Get Reports On Page
    ${study_ids}     Evaluate    [item['Study ID'] for item in ${reports} if item['Artifact'] == ${False}]
    ${random_study_id}     Evaluate    random.choice(${study_ids})    random
    Filter Inbox    search_by=Study ID      text_search=${random_study_id}
    ${reports}      Get Reports On Page
    Edit Report Status    status=Reviewed
    ${report_status}        Get Current Report Status
    Select Report       row=1
    ${report_detail_status}       Get Current Inbox Report Status
    Run Keyword And Continue On Failure    Should Be Equal    ${report_status}      ${report_detail_status}
    Edit Inbox Detail Report Status    status=New
    ${report_detail_status_original}       Get Current Inbox Report Status
    Back From Report Detail
    ${report_status_original}        Get Current Report Status
    Run Keyword And Continue On Failure    Should Be Equal     ${report_detail_status_original}     ${report_status_original}

BF-TECH-INBOX-NOTIFICATION-REVIEWED-02: Mark a report sent by the Call center as not reviewed
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

    [Tags]  BF-TECH-INBOX-NOTIFICATION-REVIEWED-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-DOWNLOAD-01: Download PDF file
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can download the PDF file on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Notification reports tab of the INBOX page
    ...     2. Click on a specific report
    ...     3. Click the Download button
    ...
    ...     Expected Results:
    ...     1. The PDF report shall be downloaded to the user’s device
    ...     2. The filename of the downloaded pdf file should follow this rule
    ...     - Notification reports:
    ...      + Event reports:
    ...     “Event-FacilityName-PatientID-StudyID-ReportID-TriggerDate(YYYYMMDD)-TriggerDate(HHMM)”
    ...      + Notification reports:
    ...     “Notification-FacilityName-PatientID-StudyID-StudyStartDate(YYYYMMDD)-StudyStartTime(HHMM)”

    [Tags]  BF-TECH-INBOX-NOTIFICATION-DOWNLOAD-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-INBOX-NOTIFICATION-COMMENT-01: Input physician interpretation to PDF reports in case report has not physician interpretation before
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
    [Tags]  BF-TECH-INBOX-NOTIFICATION-COMMENT-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
##    # verify comment at input field. PDF: TDB
#    Navigate To Inbox
#    Filter Inbox     report_type=Notification reports     priority=Urgent
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Comment is not empty
#    Add Interpretation    comments=Test Add Interpretation      is_save=True
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=Notification reports    priority=Urgent
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation     is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}     No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}     Test Add Interpretation
#    [Teardown]    Clear Comment Text       Notification reports        Urgent      ${EMPTY}        ${EMPTY}

BF-TECH-INBOX-NOTIFICATION-COMMENT-02: Input physician interpretation to PDF reports in case report already has physician interpretation
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
    [Tags]  BF-TECH-INBOX-NOTIFICATION-COMMENT-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Filter Inbox     report_type=Notification reports    priority=High
#    ${reports}      Get Reports On Page
#    ${text}         Evaluate    '${reports}[0][Study ID]'.split()[0].strip()
#    Filter Inbox     report_type=Notification reports    priority=High      search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Comment is not empty
#    Add Interpretation    comments=Test Add Interpretation      is_save=True
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=Notification reports     priority=High       search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}        No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}        Test Add Interpretation
#    Filter Inbox     report_type=Notification reports     priority=High      search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    Add Interpretation    comments=Test Edited Interpretation     is_save=True
#    Filter Inbox     report_type=Notification reports     priority=High       search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}        No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}        Test Edited Interpretation
#    [Teardown]    Clear Comment Text      Notification reports        High      Study ID        ${text}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}          Start Browser
    Import Library           project_bioflux_clinic_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/Inbox.py     ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/Studies.py     ${BROWSER_NODE}  ${ENV}
    ${TECH_USER}             Get Config Param       NEW_USER > clinic_technician
    ${STUDY_ID}              Get Config Param    STUDY_ID
    ${STUDY_ID_COMPLETED}    Set Variable        ${STUDY_ID}[study_id_completed]
    Set Global Variable      ${STUDY_ID_COMPLETED}
    Set Suite Variable       ${TECH_USER}
    Sign In Bioflux          username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${VERSION}               Get Release Version
    Set Suite Metadata       version     ${VERSION}
    Set Suite Metadata       browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Notification Reports
    [Arguments]       ${priority}=${EMPTY}     ${search_by}=${EMPTY}
    Navigate To Inbox
    Navigate To Report Type    Notification reports
    Filter Inbox    status_report=All
    Filter Inbox    report_type=Notification reports      priority=${priority}        search_by=${search_by}
    ${reports}       Get Reports On Page 2
    ${text}          Set Variable If
    ...  '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient name'       ${reports}[0][Patient Name]
    ...  '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'study id'           ${reports}[0][Study ID]
    ...  '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient id'         ${reports}[0][Patient ID]
    ...  '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'physician'          ${reports}[0][Physician]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found - text search without text string
    Filter Inbox    report_type=Notification reports     priority=${priority}        search_by=${search_by}      text_search=${text}
    ${reports}       Get All Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found - with text search ${search_by}: ${text}
    Run Keyword If    '${priority}' != '${EMPTY}' and '${priority.lower()}' != 'all priority'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${priority}' == r['Priority'] for r in ${reports})     Invalid results are showing - with textsearch ${text}
    Run Keyword If    '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in r['Patient Name'].lower() for r in ${reports})     Invalid results are showing - with textsearch ${text}
    Run Keyword If    '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'physician'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in r['Physician'].lower() for r in ${reports})      Invalid results are showing - with textsearch ${text}
    Run Keyword If    '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'study id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' in r['Study ID'] for r in ${reports})       Invalid results are showing - with textsearch ${text}
    Run Keyword If    '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' == r['Patient ID'] for r in ${reports})     Invalid results are showing - with textsearch ${text}
    Check on the across each tab        All reports          ${text}         ${search_by}
    Check on the across each tab        Recent reports       ${text}         ${search_by}
    Check on the across each tab        End of Use reports   ${text}         ${search_by}
    Check on the across each tab        Interim reports      ${text}         ${search_by}
    Check on the across each tab        Notification reports    ${text}         ${search_by}
    Check on the across each tab        Instant reports         ${text}         ${search_by}
    Navigate To Other Page      Studies
    Navigate To Other Page      Inbox
    ${value_current_search}     Get Inbox Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current_search}[Text Search]       ${text}
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current_search}[Search By]         ${search_by}
    Clear Inbox Text Search
    ${text_search}     Get Inbox Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${text_search}[Text Search]      ${None}

Unreview report  # Unreview from report details and then navigate back to list of report
    [Arguments]     ${on_report}    ${review_status}
    Run Keyword If    '${review_status}' == ${True}     Run Keywords
    ...  Select Report    ${on_report}
    ...  AND    Mark As Review Report    ${False}
    ...  AND    Back From Report Detail

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
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current_search}[Search By]         ${search_by}

Filter Priority All Reports With Priority "${priority}"
    Filter Inbox    priority=${priority}
    ${reports}       Get All Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Run Keyword If    '${priority}' != '${EMPTY}' and '${priority.lower()}' != 'all priority'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${priority}' == r['Priority'] for r in ${reports})
    Navigate To Other Page      Studies
    Navigate To Other Page      Inbox
    ${value_current}     Get Inbox Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${value_current}[Priority]       ${priority}

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
