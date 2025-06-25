*** Settings ***
Documentation   Test Suite - Clinic Portal - Instant Inbox page
Metadata    sid     BF-PHY-INBOX-INSTANT
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
Force Tags      BF-PHY-INBOX-INSTANT        web
Test Timeout    1h

*** Test Cases ***
BF-PHY-INBOX-INSTANT-VIEW-01: View the Instant reports screen
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the Instant reports screen in the Inbox list
    ...
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Observe the Instant report screen
    ...
    ...     Expected Results:
    ...     1. On the side navigation menu, the Instant reports tab shall have a label indicating the number
    ...     of unread reports
    ...     2. There is a drop-down facility list on the header of the INBOX page
    ...     3. There is a description of the number of reports displayed on the page and the total of all reports
    ...     that are sent to the clinic: “Showing <from which report to which report> of <total of sent reports>”
    ...     4. Sort dropdown
    ...     5. Search bar
    ...     6. Search option
    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-01        auto    R1
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    ${checked_items}        Create List     facility    sort     search bar    search by    inbox items
    ${actual_result}        Check Report Items Are Available        ${checked_items}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[facility]            ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[sort]                ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[search bar]          ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[inbox items]         ${True}
    ${expected_search_by}       Create List    Patient name     Study ID      Patient ID
    ${search_by}                Get Inbox Filter Options
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_search_by}       ${search_by}[Search By]
    # Step 1, 3 TBD

BF-PHY-INBOX-INSTANT-VIEW-02: Quick access Patient ID
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

    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-02       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=Instant reports
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

BF-PHY-INBOX-INSTANT-VIEW-03: Quick access Study ID
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

    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-03       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=Instant reports
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

BF-PHY-INBOX-INSTANT-VIEW-04: Check case there is a green lable with the Biodirect label title on studies if running the Biodirect service
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

    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-04       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-INSTANT-VIEW-05: Check case there is no report
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

    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-INSTANT-VIEW-06: Check case a study is deleted by a clinic user
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

    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-06       auto       R1
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    ${eou_report}       Get Reports On Page 2
    ${study_ids}         Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${study_id}         Evaluate  random.choice(${study_ids})    random
    Deleted Study With Study Id "${study_id}"
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    Filter Inbox    search_by=Study ID      text_search=${study_id}
    ${eou_report}       Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Be Empty    ${eou_report}
    [Teardown]    Run Keyword    Restore Deleted Study With Study Id "${study_id}"

BF-PHY-INBOX-INSTANT-VIEW-07: Check case a study is aborted by a Call Center user
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

    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-07      auto       R1
    Navigate To Inbox
    Navigate To Report Type    End of Use reports
    Filter Inbox    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[aborted_study_id]
    ${eou_report}       Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Be Empty    ${eou_report}

BF-PHY-INBOX-INSTANT-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Observe the header of INBOX page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the INBOX page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-PHY-INBOX-INSTANT-FILTER-FACILITY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Report Type    Instant reports
#    ${current_facility}      Get Current Facility
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${current_facility}       No reports found
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_facility}       All facilities
#    ${reports}      Get Reports On Page 2
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found

BF-PHY-INBOX-INSTANT-FILTER-FACILITY-02: Filter by facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Click on the drop-down list on the header of the INBOX page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the INBOX page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-PHY-INBOX-INSTANT-FILTER-FACILITY-02     auto    R1
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    Select Facility    Facility_QA_01
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found - on facility Facility_QA_01
    Navigate To Report Type    Instant reports
    Select Facility    Facility_QA_02
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found - on facility Facility_QA_02
    Navigate To Report Type    Instant reports
    Select Facility    All facilities
    ${reports}      Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found

BF-PHY-INBOX-INSTANT-PAGINATION-01: Navigate to the next page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the next page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Click the Next button
    ...
    ...     Expected Results:
    ...     1. the user should be navigated to the next page

    [Tags]  BF-PHY-INBOX-INSTANT-PAGINATION-01      auto    R1
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    ${be_reports_page1}        Get Reports On Page 2
    Go Next Page
    ${be_reports_page2}        Get Reports On Page 2
    Go Previous Page
    ${af_reports_page1}        Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Be Equal    ${be_reports_page1}       ${af_reports_page1}
    Go Next Page
    ${af_reports_page2}        Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Be Equal    ${be_reports_page2}       ${af_reports_page2}

BF-PHY-INBOX-INSTANT-PAGINATION-02: Navigate to the previous page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the previous page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Click the Prev button
    ...
    ...     Expected Results:
    ...     1. The  user should be navigated to the previous page

    [Tags]  BF-PHY-INBOX-INSTANT-PAGINATION-02      auto    R1
    Navigate To Inbox
    Navigate To Report Type     Instant reports
    ${be_reports1}       Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${be_reports1}
    Go Next Page
    ${be_reports2}       Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${be_reports2}
    Go Previous Page
    ${af_reports1}       Get Reports On Page 2
    Run Keyword And Continue On Failure    Should Not Be Empty    ${af_reports1}
    Go Next Page
    ${af_reports2}       Get Reports On Page 2
    Run Keyword And Continue On Failure     Should Not Be Empty     ${af_reports2}
    Run Keyword And Continue On Failure     Should Not Be Equal     ${be_reports1}       ${be_reports2}
    Run Keyword And Continue On Failure     Should Not Be Equal     ${af_reports1}       ${af_reports2}
    Run Keyword And Continue On Failure     Should Be Equal         ${be_reports1}       ${af_reports1}
    Run Keyword And Continue On Failure     Should Be Equal         ${be_reports2}       ${af_reports2}

BF-PHY-INBOX-INSTANT-SORT-01: Sort the report lists on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...  Description: The user can sort the report lists on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Observe the sort button
    ...     3. Click the Sort button
    ...     4. Click on the Sort button a second time.
    ...
    ...     Expected Results:
    ...     1. Newest to Oldest (default value)
    ...     2. The report list should sort into Oldest to Newest
    ...     3. The report list should sort into Newest to Oldest

    [Tags]  BF-PHY-INBOX-INSTANT-SORT-01       auto
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    # Check ascending defauld
    ${sort_reports}      Sort Ascending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}
    # The report list should sort into Oldest to Newest
    ${sort_reports}      Sort Descending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}
    # The report list should sort into Newest to Oldest
    ${sort_reports}      Sort Ascending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}

BF-PHY-INBOX-INSTANT-SEARCH-01: View all search attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Physician (only available for clinic technicians and clinic electrophysiologists)
    ...     2. The default search option should be Patient Name

    [Tags]  BF-PHY-INBOX-INSTANT-SEARCH-01      auto
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    ${default_filter}       Get Inbox Current Filter
    ${expected_options}     Create List    Patient name     Study ID      Patient ID
    ${search_options}       Get Inbox Filter Options
    ${search_options}       Set Variable    ${search_options}[Search By]
    # Verify search options
    Run Keyword And Continue On Failure    Lists Should Be Equal      ${expected_options}     ${search_options}
    # Default search_by
    Run Keyword And Continue On Failure    Should Be Equal    ${default_filter}[Search By]      Patient name

BF-PHY-INBOX-INSTANT-SEARCH-02: Search by Patient Name attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
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

    [Tags]  BF-PHY-INBOX-INSTANT-SEARCH-02             manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Template]    Filter Instant Reports
#    Patient name   # facing bug

BF-PHY-INBOX-INSTANT-SEARCH-03: Search by Study ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
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

    [Tags]  BF-PHY-INBOX-INSTANT-SEARCH-03      auto    R1
    [Template]    Filter Instant Reports
    Study ID

BF-PHY-INBOX-INSTANT-SEARCH-04: Search by Patient ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
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

    [Tags]  BF-PHY-INBOX-INSTANT-SEARCH-04      auto    R1
    [Template]    Filter Instant Reports
    Patient ID

BF-PHY-INBOX-INSTANT-VIEW-DETAILS-01: View details of Instant report in the list
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can view information of each report in the list
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
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
    ...      + Add signature button (only for physicians)
    ...      + Save button
    ...      + Download button
    ...     - Open study button
    ...     - Delete report button
    ...     - Back button
#    Break to new case
#    ...     2. If it’s failed to view the report, a snackbar will be displayed:
#    ...        "Something went wrong, please try again!"
    [Tags]  BF-PHY-INBOX-INSTANT-VIEW-DETAILS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Navigate To Report Type    Instant reports
#    ${reports}      Get Reports On Page 2
#    ${expect_info}          Create List    Study ID     Patient     Physician    Date of service
#    Select Report    row=1
#    ${report_details}       Get Report Detail
#    # Labels
#    Run Keyword And Continue On Failure    List Should Contain Sub List    ${report_details}        ${expect_info}
#    # Contents
#    Run Keyword And Continue On Failure    Should Be Equal    ${reports}[0][Patient Name]       ${report_details}[Patient]
#    Run Keyword And Continue On Failure    Should Contain     ${reports}[0][Study ID]           ${report_details}[Study ID]
#    Run Keyword And Continue On Failure    Should Be Equal    ${reports}[0][Physician]          ${report_details}[Physician]
#    Run Keyword And Continue On Failure    Should Be Equal    ${reports}[0][Time]               ${report_details}[Date of service]
#    # Attributes
#    ${are_items_displayed}      Check Instant Report Items Are Available    PDF Viewer, Add interpretation button, Add signature button, Save button, Download button, Open study button, Delete report button, Back button
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[PDF Viewer]                       ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[Add interpretation button]        ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[Add signature button]             ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[Save button]                      ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[Download button]                  ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[Open study button]                ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[Delete report button]             ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${are_items_displayed}[Back button]                      ${True}

BF-PHY-INBOX-INSTANT-DOWNLOAD-01: Download PDF file
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can download the PDF file on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Instant reports tab of the INBOX page
    ...     2. Click on a specific report
    ...     3. Click the Download button
    ...
    ...     Expected Results:
    ...     1. The PDF report shall be downloaded to the user’s device
    ...     2. The filename of the downloaded pdf file should follow this rule
    ...     - Instant reports:
    ...     “Instant-FacilityName-PatientID-StudyID-ReportID-StudyStartDate(YYYYMMDD)-StudyStartTime(HHMM)”
    ...
    [Tags]  BF-PHY-INBOX-INSTANT-DOWNLOAD-01       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-INSTANT-COMMENT-01: Input physician interpretation to PDF reports in case report has not physician interpretation before
    [Documentation]   Author: Trinh Nguyen
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
    [Tags]  BF-PHY-INBOX-INSTANT-COMMENT-01       manual    inactive    
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    # verify comment at input field. PDF: TDB
#    Navigate To Inbox
#    Filter Inbox     report_type=Instant reports
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Comment is not empty
#    Add Interpretation    comments=Test Add Interpretation      is_save=True
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=Instant reports
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}     No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}     Test Add Interpretation
#    # Clear Text
#    [Teardown]    Clear Comment Text    Instant reports

BF-PHY-INBOX-INSTANT-COMMENT-02: Input physician interpretation to PDF reports in case report already has physician interpretation
    [Documentation]   Author: Trinh Nguyen
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
    ...     - A popup shall be displayed, the contents of the interpretation shall be displayed in the textbox
    ...     2. At step 3:
    ...     - The contents shall be updated
    [Tags]  BF-PHY-INBOX-INSTANT-COMMENT-02       manual    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Filter Inbox     report_type=Instant reports
#    ${reports}      Get Reports On Page 2
#    ${text}         Evaluate    '${reports}[0][Study ID]'.split()[0].strip()
#    Filter Inbox     report_type=Instant reports      search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Comment is not empty
#    Add Interpretation    comments=Test Add Interpretation      is_save=True
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=Instant reports       search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}        No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}        Test Add Interpretation
#    Filter Inbox     report_type=Instant reports      search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    Add Interpretation    comments=Test Edited Interpretation     is_save=True
#    Filter Inbox     report_type=Instant reports       search_by=Study ID      text_search=${text}
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}        No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}        Test Edited Interpretation
#    # Clear comment
#    [Teardown]    Clear Comment Text    Instant reports   Study ID    ${text}

BF-PHY-INBOX-INSTANT-SIGN-01: Add a signature to a PDF report
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can Add a signature to a PDF report
    ...
    ...     Precondition:
    ...     - The user is on the report view screen
    ...
    ...     Test Steps:
    ...     1. Draw a signature on the drawing area
    ...     2. Enter the contents on the textbox
    ...     3. Click the Add Signature button
    ...     4. Click the Save button
    ...
    ...     Expected Results:
    ...     1. In step 3:
    ...     - The signature in the drawing area will be added above the Physician's Signature
    ...     and Date section of the PDF report
    ...     2. In step 4:
    ...     - The modified PDF report will be saved, and the changes can be seen by any user who can see the report

    [Tags]  BF-PHY-INBOX-INSTANT-SIGN-01       manual    R1    inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-PHY-INBOX-INSTANT-FILTER-STUDIES-01: Check default study filter status is Your studies
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

    [Tags]  BF-PHY-INBOX-INSTANT-FILTER-STUDIES-01       manual      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-PHY-INBOX-INSTANT-FILTER-STUDIES-02: Filter reports by All studies
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

    [Tags]  BF-PHY-INBOX-INSTANT-FILTER-STUDIES-02      manual      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-PHY-INBOX-INSTANT-FILTER-STUDIES-03: Switch studies filter between Your studies and All studies
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

    [Tags]  BF-PHY-INBOX-INSTANT-FILTER-STUDIES-03      manual      CP-2.21.0
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

Filter Instant Reports
    [Arguments]     ${search_by}
    Navigate To Inbox
    Navigate To Report Type    Instant reports
    Filter Inbox    report_type=Instant reports        search_by=${search_by}
    ${reports}       Get Reports On Page 2
    ${text}          Set Variable If
    ...  '${search_by.lower()}' == 'patient name'       ${reports}[0][Patient Name]
    ...  '${search_by.lower()}' == 'study id'           ${reports}[0][Study ID]
    ...  '${search_by.lower()}' == 'patient id'         ${reports}[0][Patient ID]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found - text search without text string
    Filter Inbox    report_type=Instant reports       search_by=${search_by}      text_search=${text}
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
    Check on the across each tab        Instant reports         ${text}         ${search_by}
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
