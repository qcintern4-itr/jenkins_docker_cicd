*** Settings ***
Documentation   Test Suite - Clinic Portal - All Inbox page
Metadata     sid     BF-PHY-INBOX-ALL
Metadata     owner   Nhan Nguyen
Library      Collections
Library      corelib/AssertionExtension.py
Library      corelib/WebHandler.py       ${BROWSER}      ${HEADLESS}
Library      project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library      project_bioflux_clinic_portal/lib/web/Common.py
Library      project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-PHY-INBOX-ALL        web
Test Timeout    1h

*** Test Cases ***
BF-PHY-INBOX-ALL-VIEW-01: View all reports list
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view the all reports in the Inbox list
    ...
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Observe the All report screen
    ...
    ...     Expected Results:
    ...     1. On the side navigation menu, the All reports tab shall have a label indicating the number
    ...     of unread reports
    ...     2. There is a drop-down facility list on the header of the INBOX page
    ...     3. There is a description of the number of reports displayed on the page and the total of all reports
    ...     that are sent to the clinic: “Showing <from which report to which report> of <total of sent reports>”
    ...     4. Sort dropdown
    ...     5. Priority filter
    ...     6. Search bar
    ...     7. Search option

    [Tags]  BF-PHY-INBOX-ALL-VIEW-01        auto    R1
    Navigate To Inbox
    Navigate To Report Type    All reports
    ${checked_items}        Create List     facility    sort     search bar    search by    priority    inbox items
    ${actual_result}        Check Report Items Are Available        ${checked_items}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[facility]            ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[sort]                ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[search by]           ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[search bar]          ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[priority]            ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_result}[inbox items]         ${True}
    ${expected_search_by}       Create List    All facilities     Facility_QA_01      Facility_QA_02
    ${expected_priority}        Create List    All priority     Low     Medium      High        Urgent      Emergent
    ${search_by}                Get Inbox Filter Options
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_search_by}       ${search_by}[Facility]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_priority}        ${search_by}[Priority]
    # Step 1, 3 TBD

BF-PHY-INBOX-ALL-VIEW-02: Quick access Patient ID
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-02       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=All reports
    ${reports}      Get Reports On Page
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

BF-PHY-INBOX-ALL-VIEW-03: Quick access Study ID
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-03       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=All reports
    ${reports}      Get Reports On Page
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

BF-PHY-INBOX-ALL-VIEW-04: EOU - Check case the recently sent EOU report has been marked as an Artifact report
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-04       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=All reports
    ${reports}      Get All Reports On Page
    ${study_ids}     Evaluate    [item['Study ID'] for item in ${reports} if item['Artifact'] == ${True} and item['Report Type'] == 'End of Use']
    ${random_study_id}     Evaluate    random.choice(${study_ids})    random
    Filter Inbox    search_by=Study ID      text_search=${random_study_id}
    Select Report    report_type=End of Use
    ${report_details}       Get Report Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${report_details}[Artifact]       Report is marked as artifact
    Run Keyword And Continue On Failure    Should Be Equal    ${report_details}[Message]       This report could not be generated due to all data being artifact. Please ensure you are checking ECG connection when starting a study

BF-PHY-INBOX-ALL-VIEW-05: Interim - Check case the recently sent Interim report has been marked as an Artifact report
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-05       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=All reports
    ${reports}      Get All Reports On Page
    ${study_ids}     Evaluate    [item['Study ID'] for item in ${reports} if item['Artifact'] == ${True} and item['Report Type'] == 'Interim']
    ${random_study_id}     Evaluate    random.choice(${study_ids})    random
    Filter Inbox    search_by=Study ID      text_search=${random_study_id}
    Select Report   report_type=Interim
    ${report_details}       Get Report Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${report_details}[Artifact]       Report is marked as artifact
    Run Keyword And Continue On Failure    Should Be Equal    ${report_details}[Message]       This report could not be generated due to all data being artifact. Please ensure you are checking ECG connection when starting a study

BF-PHY-INBOX-ALL-VIEW-06: Check case there is a green lable with the Biodirect label title on studies if running the Biodirect service
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-06       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-07: Check case there is no report
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-07       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-08: Check case a study is deleted by a clinic user
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-08       auto       R1
    Navigate To Inbox
    Navigate To Report Type    All reports
    ${eou_report}       Get Reports On Page
    ${study_ids}         Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${study_id}         Evaluate  random.choice(${study_ids})    random
    Deleted Study With Study Id "${study_id}"
    Navigate To Inbox
    Navigate To Report Type    All reports
    Filter Inbox    search_by=Study ID      text_search=${study_id}
    ${eou_report}       Get Reports On Page
    Run Keyword And Continue On Failure    Should Be Empty    ${eou_report}
    [Teardown]    Run Keyword    Restore Deleted Study With Study Id "${study_id}"

BF-PHY-INBOX-ALL-VIEW-09: Check case a study is aborted by a Call Center user
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-09       auto       R1
    Navigate To Inbox
    Navigate To Report Type    All reports
    Filter Inbox    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[aborted_study_id]
    ${eou_report}       Get All Reports On Page
    Run Keyword And Continue On Failure    Should Be Empty    ${eou_report}

BF-PHY-INBOX-ALL-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Observe the header of INBOX page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the INBOX page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-PHY-INBOX-ALL-FILTER-FACILITY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Report Type    All reports
#    ${current_facility}      Get Current Facility
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${current_facility}       No reports found
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_facility}       All facilities
#    ${reports}      Get Reports On Page
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found



BF-PHY-INBOX-ALL-FILTER-FACILITY-02: Filter by facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Click on the drop-down list on the header of the INBOX page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the INBOX page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-PHY-INBOX-ALL-FILTER-FACILITY-02     auto    R1
    Navigate To Inbox
    Navigate To Report Type    All reports
    Select Facility    ${FACILITIES}[0][name]
    ${reports}      Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found - on facility `${FACILITIES}[0][name]`
    Navigate To Report Type    All reports
    Select Facility    ${FACILITIES}[1][name]
    ${reports}      Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found - on facility `${FACILITIES}[1][name]`
    Navigate To Report Type    All reports
    Select Facility    All facilities
    ${reports}      Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}        No reports found

BF-PHY-INBOX-ALL-PAGINATION-01: Navigate to the next page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the next page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Click the Next button
    ...
    ...     Expected Results:
    ...     1. the user should be navigated to the next page

    [Tags]  BF-PHY-INBOX-ALL-PAGINATION-01      auto    R1
    Navigate To Inbox
    Navigate To Report Type    All reports
    ${be_reports1}       Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${be_reports1}
    Go Next Page
    ${be_reports2}       Get Reports On Page
    Run Keyword And Continue On Failure     Should Not Be Equal         ${be_reports1}       ${be_reports2}

BF-PHY-INBOX-ALL-PAGINATION-02: Navigate to the previous page
    [Documentation]      Author: Trinh Nguyen
    ...
    ...     Description: The user can navigate to the previous page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Click the Prev button
    ...
    ...     Expected Results:
    ...     1. The  user should be navigated to the previous page

    [Tags]  BF-PHY-INBOX-ALL-PAGINATION-02      auto    R1
    Navigate To Inbox
    Navigate To Report Type    All reports
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

BF-PHY-INBOX-ALL-SORT-01: Sort the report lists on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...  Description: The user can sort the report lists on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Observe the sort button
    ...     3. Click the Sort button
    ...     4. Click on the Sort button a second time.
    ...
    ...     Expected Results:
    ...     1. Newest to Oldest (default value)
    ...     2. The report list should sort into Oldest to Newest
    ...     3. The report list should sort into Newest to Oldest

    [Tags]  BF-PHY-INBOX-ALL-SORT-01      auto
    Navigate To Inbox
    Navigate To Report Type    All reports
    # Check ascending defauld
    ${sort_reports}      Sort Ascending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}
    # The report list should sort into Oldest to Newest
    ${sort_reports}      Sort Descending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}
    # The report list should sort into Newest to Oldest
    ${sort_reports}      Sort Ascending Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${sort_reports}

BF-PHY-INBOX-ALL-FILTER-PRIORITY-01: Filter the report lists by priority on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can filter the report lists by priority on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-PRIORITY-01     auto    R1
    [Template]    Filter Priority All Reports
    Emergent
    Urgent
    High
    Medium
    Low

BF-PHY-INBOX-ALL-SEARCH-01: View all search attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Physician (only available for clinic technicians and clinic electrophysiologists)
    ...     2. The default search option should be Patient Name

    [Tags]  BF-PHY-INBOX-ALL-SEARCH-01      auto
    Navigate To Inbox
    Navigate To Report Type    All reports
    ${default_filter}       Get Inbox Current Filter
    # Default search_by
    Run Keyword And Continue On Failure    Should Be Equal    ${default_filter}[Search By]      Patient name
    ${search_options}       Get Inbox Filter Options
    ${expected_options}     Create List    Patient name     Study ID      Patient ID
    ${search_options}       Set Variable    ${search_options}[Search By]
    # Verify search options
    Run Keyword And Continue On Failure    Lists Should Be Equal      ${expected_options}     ${search_options}

BF-PHY-INBOX-ALL-SEARCH-03: Search by Study ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
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

    [Tags]  BF-PHY-INBOX-ALL-SEARCH-03      auto    R1
    [Template]    Search Reports
    All reports     Study ID

BF-PHY-INBOX-ALL-SEARCH-04: Search by Patient ID attributes on the Inbox page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
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

    [Tags]  BF-PHY-INBOX-ALL-SEARCH-04      auto    R1
    [Template]    Search Reports
    All reports      Patient ID

BF-PHY-INBOX-ALL-SEARCH-05: Search by Patient Name with existing Patient on system
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...
    ...     Expected Results:
    ...     The report list shall be filtered and displayed accordingly with the entered Patient name
    ...
    ...    **Others
    ...    - Update date: 04/22/2025 - Nhan Nguyen (auto)

    [Tags]  BF-PHY-INBOX-ALL-SEARCH-05      auto
    [Template]    Search Reports    
    All reports     Patient name

BF-PHY-INBOX-ALL-SEARCH-06: Search by Patient Name-Check message displayed in case of searching with no result found
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

    [Tags]  BF-PHY-INBOX-ALL-SEARCH-06     auto
    [Template]    Search Reports With Non-Existent
    All reports    Patient name    No name
    All reports    Study ID    123
    All reports    Patient ID    Nonexistent

BF-PHY-INBOX-ALL-VIEW-DETAILS-01: View information of each report in the list
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can view information of each report in the list
    ...     Precondition:
    ...     - The user is on the INBOX page in the Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the All reports tab of the INBOX page
    ...
    ...     Expected Results:
    ...     1. On the side navigation menu, the All reports tab shall have a label indicating the number
    ...     of unread reports
    ...     2. Each report in the list displays the following information.
    ...     - Patient Name: Patient’s first name and last name.
    ...     - Patient ID
    ...     - Facility Name: Only available when facility filter is All facilities.
    ...     - Interpreting Physician: Physician’s first name and last name.
    ...     - Date of Service: the timeframe of the report (only available if the report is an EOU,
    ...     Interim report, or Notification report)
    ...     - Event Time: the date-time when the event is triggered. (only available if the report is an event report)
    ...     - Study Type: MCT, MCT Peek, Holter, Cardiac, Extended Holter
    ...     - Study ID
    ...      + If the recently sent EOU or Interim report has been marked as an “Artifact report”, then an “error”
    ...     tag shall be placed at the top right corner of the report card.
    ...      + When the clinic user hovers over the “error” tag a tooltip shall appear with the label “Report is
    ...     marked as artifact”
    ...     - Report Type: Interim, End of Use, Event, or Notification
    ...     - Priority: can be Urgent, Emergent, High, Medium, or Low.
    ...     - Biodirect tag: There shall be a green label with the “Biodirect” title on studies that are running
    ...     with the biodirect service.
    ...     - Technician Comments: In case the report is marked as artifact, the comment section shall display
    ...     the following message:” This report could not be generated due to all data being artifact. Please ensure
    ...     you are checking ECG connection when starting a study”.
    ...     - Report status: the status can be reviewed or not reviewed.
    ...     - Date time when the report was sent from Call Center.
#    Break to new case
#    ...     3. If there is no End of Use report, the list will display this message: “There is no data to display”

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-01        auto
    Navigate To Inbox
    Navigate To Report Type    All reports
    ${report_options}        Get Inbox Filter Options
    Run Keyword And Continue On Failure     Should Not Be Empty    ${report_options}       No options found
    ${report_labels}         Evaluate       [label.split(' | ')[0] for label in ${report_options}[Report Types]]  # Replace the number of unread reports
    ${current_reports}       Get Current Report Type
    ${num_of_unread_rp}      Evaluate    '${current_reports}'.split(' | ')[1]
    ${expect_labels}         Create List    Recent reports    All reports    End of Use reports     Interim reports     Notification reports    Instant reports
    Run Keyword And Continue On Failure     Lists Should Be Equal    ${report_labels}       ${expect_labels}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${num_of_unread_rp}       ${num_of_unread_rp}
    # Each report in the list displays the following information.
    ${reports}              Get Reports On Page
    ${reports_headers}      Evaluate    [key for key, value in ${reports}[0].items()]
    ${expect_headers}       Create List    Patient Name     Study ID        Patient ID      Physician       Time     Study Type     Comments    Updated    Is New   Facility    Priority
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${reports_headers}       ${expect_headers}
    ${expected_study_type}           Create List      MCT     MCT PEEK    HOLTER      CARDIAC EVENT     EXTENDED HOLTER
    ${actual_study_type}     Get Data On Reports Page       study_type=${True}
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${expected_study_type}     ${actual_study_type}
    # Report Type: Interim, End of Use, Event, or Notification
    ${expected_report_type}           Create List      Interim     End of Use    Event      Notification
    ${actual_report_type}     Get Data On Reports Page       report_type=${True}
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${expected_report_type}     ${actual_report_type}
    # Priority: can be Urgent, Emergent, High, Medium, or Low.
    ${expected_priority}           Create List      Urgent    Emergent    High    Medium    Low
    ${actual_priority}        Get Data On Reports Page       priority=${True}
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${expected_priority}     ${actual_priority}

BF-PHY-INBOX-ALL-VIEW-DETAILS-02: View EOU report details
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-02       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=All reports
    ${reports}      Get All Reports On Page
    ${study_ids}     Evaluate    [item['Study ID'] for item in ${reports} if item['Artifact'] == ${False} and item['Report Type'] == 'End of Use']
    ${random_study_id}     Evaluate    random.choice(${study_ids})    random
    Filter Inbox    search_by=Study ID      text_search=${random_study_id}
    Select Report    report_type=End of Use
    ${report_details}       Get Report Detail
    ${actual_header}        Evaluate        [k for k, v in ${report_details}.items()]
    ${expect_header}        Create List     Study ID    Patient     Physician     Date of service
    Run Keyword And Continue On Failure     List Should Contain Sub List    ${actual_header}        ${expect_header}
    ${items}       Check Report Detail Items Are Available      pdf viewer, back button, reviewed checkbox, download button, add interpretation button, add signature button
    Run Keyword And Continue On Failure     Should Be True     ${items}[pdf viewer]
    Run Keyword And Continue On Failure     Should Be True     ${items}[back button]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[reviewed checkbox]
    Run Keyword And Continue On Failure     Should Be True     ${items}[download button]
    Run Keyword And Continue On Failure     Should Be True     ${items}[add interpretation button]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[save button]
    Run Keyword And Continue On Failure     Should Be True     ${items}[add signature button]

BF-PHY-INBOX-ALL-VIEW-DETAILS-03: View Interim report details
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-03       auto       R1
    Navigate To Inbox
    Filter Inbox    report_type=All reports
    ${reports}      Get All Reports On Page
    ${study_ids}     Evaluate    [item['Study ID'] for item in ${reports} if item['Artifact'] == ${False} and item['Report Type'] == 'Interim']
    ${random_study_id}     Evaluate    random.choice(${study_ids})    random
    Filter Inbox    search_by=Study ID      text_search=${random_study_id}
    Select Report   report_type=Interim
    ${report_details}       Get Report Detail
    ${actual_header}        Evaluate        [k for k, v in ${report_details}.items()]
    ${expect_header}        Create List     Study ID    Patient     Physician     Date of service
    Run Keyword And Continue On Failure     List Should Contain Sub List    ${actual_header}        ${expect_header}
    ${items}       Check Report Detail Items Are Available      pdf viewer, back button, download button, add interpretation button, add signature button
    Run Keyword And Continue On Failure     Should Be True     ${items}[pdf viewer]
    Run Keyword And Continue On Failure     Should Be True     ${items}[back button]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[reviewed checkbox]
    Run Keyword And Continue On Failure     Should Be True     ${items}[download button]
    Run Keyword And Continue On Failure     Should Be True     ${items}[add interpretation button]
#    Run Keyword And Continue On Failure     Should Be True     ${items}[save button]
    Run Keyword And Continue On Failure     Should Be True     ${items}[add signature button]

BF-PHY-INBOX-ALL-VIEW-DETAILS-04: View Notification report details
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-04       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-05: View Event report details
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-06: MCT study/EOU old report format-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-06       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-07: MCT study/EOU new report format-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-07       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-08: MCT Peek study/EOU old report format-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-08       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-09: MCT Peek study/EOU new report format-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-09       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-10: Holter/Ext.Holter study/EOU old report format-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-10       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-11: Holter/Ext.Holter study/EOU new report format-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-11       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-12: Cardiac Event study/EOU old report format-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-12       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-13: EOU-Download report
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-13       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-14: Interim-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-14        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Filter Inbox     report_type=Interim reports        search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Test Add Interpretation
#    Add Interpretation    comments=Test Add Interpretation      is_save=${False}
#    Add Signature       is_save=${True}
##    ${success_msg}   Get Toast Success Message
##    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=All reports     search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}     No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}     Test Add Interpretation
#    [Teardown]    Clear Comment Text    report_type=All reports        search_by=Study ID      text_search=08849

BF-PHY-INBOX-ALL-VIEW-DETAILS-15: Interim-Download report
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-15       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-16: Notification-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-16       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Filter Inbox     report_type=Notification reports        search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Test Add Interpretation
#    Add Interpretation    comments=Test Add Interpretation      is_save=${False}
#    Add Signature       is_save=${True}
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=All reports     search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}     No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}     Test Add Interpretation
#    [Teardown]    Clear Comment Text    report_type=All reports        search_by=Study ID      text_search=08849

BF-PHY-INBOX-ALL-VIEW-DETAILS-17: Notification-Download report
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-17       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-VIEW-DETAILS-18: Event-Add Interpretation and Signature
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-18       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Filter Inbox     report_type=All reports        search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Test Add Interpretation
#    Add Interpretation    comments=Test Add Interpretation      is_save=${False}
#    Add Signature       is_save=${True}
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=All reports     search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}     No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}     Test Add Interpretation
#    [Teardown]    Clear Comment Text    report_type=All reports        search_by=Study ID      text_search=08849

BF-PHY-INBOX-ALL-VIEW-DETAILS-19: Event-Download report
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

    [Tags]  BF-PHY-INBOX-ALL-VIEW-DETAILS-19       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-REVIEWED-01: Mark as reviewed by report
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
    ...
    ...     Expected Results:
    ...
    [Tags]  BF-PHY-INBOX-ALL-REVIEWED-01        auto    R1
    Navigate To Inbox
    Filter Inbox    report_type=All reports
    ${reports}      Get Reports On Page
    ${study_id}         Set Variable    ${reports}[0][Study ID]
    Filter Inbox    report_type=All reports     search_by=Study ID      text_search=${study_id}
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

BF-PHY-INBOX-ALL-REVIEWED-02: Mark a report sent by the Call center as not reviewed
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

    [Tags]  BF-PHY-INBOX-ALL-REVIEWED-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-COMMENT-01: Input physician interpretation to PDF reports in case report has not physician interpretation before
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
    [Tags]  BF-PHY-INBOX-ALL-COMMENT-01       manual    R1    CP-2.28.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    # verify comment at input field. PDF file: TDB
#    Navigate To Inbox
#    Filter Inbox     report_type=All reports        search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
    # Verify comment filed is empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Be Empty    ${comment}     Test Add Interpretation
#    Add Interpretation    comments=Test Add Interpretation      is_save=${True}
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=All reports     search_by=Study ID      text_search=08849
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=True
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}     No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}     Test Add Interpretation
#    [Teardown]    Clear Comment Text    report_type=All reports        search_by=Study ID      text_search=08849

BF-PHY-INBOX-ALL-COMMENT-02: Input physician interpretation to PDF reports in case report already has physician interpretation
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
    [Tags]  BF-PHY-INBOX-ALL-COMMENT-02      manual    R1    CP-2.28.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Inbox
#    Filter Inbox     report_type=All reports      search_by=Study ID      text_search=09068
#    Select Report    row=1
#    Open Add Interpretation Dialog
    # Verify comment filed is not empty
#    ${comment}      Get Interpretation
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}
#    Add Interpretation    comments=Test Add Interpretation      is_save=${True}
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
#    Filter Inbox     report_type=All reports      search_by=Study ID      text_search=09068
#    Select Report    row=1
#    Open Add Interpretation Dialog
#    ${comment}      Get Interpretation      is_close=${True}
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${comment}        No comment found
#    Run Keyword And Continue On Failure    Should Be Equal        ${comment}        Test Add Interpretation

BF-PHY-INBOX-ALL-SIGN-01: Add a signature to a PDF report
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
    [Tags]  BF-PHY-INBOX-ALL-SIGN-01       manual    R1    CP-2.28.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-01: Check default report status is All statuses
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-01       manual      CP-2.22.0   R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-02: Filter by Report status is New
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-02       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-03: Filter by Report status is Downloaded
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-03       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-04: Filter by Report status is Reviewed
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-04       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-05: Filter by Report status is Interpreted
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-05       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-06: Filter by Report status is Interpreted
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-06       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-07: Filter by Report status is Signed
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-07       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-08: Filter by Report status is Completed
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-08       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-09: Filter by Report status is only applied on this tab
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-09       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STATUS-10: Filter by multiple Report statuses
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STATUS-10       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-UPDATE-STATUS-01: Check default report status is New when having an EOU report is sent to
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

    [Tags]  BF-PHY-INBOX-ALL-UPDATE-STATUS-01       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-UPDATE-STATUS-02: Check default report status is New when having an Interim report is sent to
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

    [Tags]  BF-PHY-INBOX-ALL-UPDATE-STATUS-02       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-UPDATE-STATUS-03: Check default report status is New when having an Event report is sent to
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

    [Tags]  BF-PHY-INBOX-ALL-UPDATE-STATUS-03       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-UPDATE-STATUS-04: Check default report status is New when having a Notification report is sent to
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

    [Tags]  BF-PHY-INBOX-ALL-UPDATE-STATUS-04       manual      CP-2.22.0   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STUDIES-01: Check default study filter status is Your studies
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STUDIES-01       manual      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STUDIES-02: Filter reports by All studies
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STUDIES-02      manual      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-INBOX-ALL-FILTER-STUDIES-03: Switch studies filter between Your studies and All studies
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

    [Tags]  BF-PHY-INBOX-ALL-FILTER-STUDIES-03      manual      CP-2.21.0
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
    ${FACILITIES}            Get Config Param       FACILITY
    Set Global Variable      ${STUDY_ID_COMPLETED}
    Set Suite Variable       ${PHY_USER}
    Set Suite Variable       ${FACILITIES}
    Sign In Bioflux          username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${VERSION}               Get Release Version
    Set Suite Metadata       version     ${VERSION}
    Set Suite Metadata       browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter All Reports
    [Arguments]       ${priority}=${EMPTY}     ${search_by}=${EMPTY}
    Navigate To Inbox
    Navigate To Report Type    All reports
    Filter Inbox    report_type=All reports      priority=${priority}        search_by=${search_by}
    ${reports}       Get Reports On Page
    ${text}          Set Variable If
    ...  '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient name'       ${reports}[0][Patient Name]
    ...  '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'study id'           ${reports}[0][Study ID]
    ...  '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient id'         ${reports}[0][Patient ID]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found - text search without text string
    Filter Inbox    report_type=All reports      priority=${priority}       search_by=${search_by}      text_search=${text}
    ${reports}       Get Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found - with text search ${search_by}: ${text}
    Run Keyword If    '${priority}' != '${EMPTY}' and '${priority.lower()}' != 'all priority'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${priority}' == r['Priority'] for r in ${reports})       Invalid results are showing - with priority `${priority}`
    Run Keyword If    '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}'.lower() in r['Patient Name'].lower() for r in ${reports})       Invalid results are showing - with ${search_by} text search `${text}`
    Run Keyword If    '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'study id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text}' in r['Study ID'] for r in ${reports})       Invalid results are showing - with ${search_by} text search `${text}`
    Run Keyword If    '${search_by}' != '${EMPTY}' and '${search_by.lower()}' == 'patient id'
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

Unreview report  # Unreview from report details and then navigate back to list of report
    [Arguments]     ${on_report}    ${review_status}
    Run Keyword If    '${review_status}' == ${True}     Run Keywords
    ...  Select Report    ${on_report}
    ...  AND    Mark As Review Report    ${False}
    ...  AND    Back From Report Detail

Clear Comment Text
    [Arguments]    ${report_type}=${EMPTY}   ${search_by}=${EMPTY}    ${text_search}=${EMPTY}
    Filter Inbox     report_type=${report_type}       search_by=${search_by}      text_search=${text_search}
    Select Report    row=1
    Open Add Interpretation Dialog
    Clear Interpretation
#    ${success_msg}   Get Toast Success Message
#    Run Keyword And Continue On Failure    Should Be Equal    ${success_msg}        PDF report is uploaded
    Filter Inbox     report_type=${report_type}      search_by=${search_by}      text_search=${text_search}
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

Filter Priority All Reports
    [Arguments]       ${priority}=${EMPTY}
    Navigate To Inbox
    Navigate To Report Type    All reports
    Filter Inbox    report_type=All reports      priority=${priority}
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
