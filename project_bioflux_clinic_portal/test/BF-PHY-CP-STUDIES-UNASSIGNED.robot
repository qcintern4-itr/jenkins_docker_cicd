*** Settings ***
Documentation   Test Suite - Clinic Portal - Active studies page
Metadata    sid     BF-PHY-CP-STUDIES-UNASSIGNED
Metadata    owner   Tam Ho
Library     Collections
Library     DateTime
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Clinic.py       ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py         ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/StudyDetails.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-PHY-CP-STUDIES-UNASSIGNED        web
Test Timeout        1h

*** Test Cases ***
BF-PHY-CP-STUDIES-UNASSIGNED-VIEW-01: View a list of Unassigned studies
    [Documentation]  Author: Tam Ho
    ...
    ...     Description: The user can view a list of Unassigned studies
    ...
    ...     Precondition:
    ...     - The user is on the Unassigned tab of the STUDIES page
    ...
    ...     Test Steps:
    ...     1. Observe  a list of studies in the Unassigned tab
    ...
    ...     Expected Results:
    ...     1. The list shall display all study cards
    ...     2. The list is sorted by Study ID in descending order
    ...     3. By default, the list loads a maximum of 10 studies. The user can scroll down to load more studies
    ...     4. For the physician’s login, the user shall only be able to view studies of which he/she is the interpreting physician

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-VIEW-01      auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active study found
    ${study_ids}        Evaluate    [item['Study'] for item in ${studies}]
    ${expected_study_ids}        Evaluate    sorted(${study_ids}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Length Should Be    ${studies}       10
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${study_ids}        ${expected_study_ids}
    Filter Studies    study_state=Active        search_by=Study ID      text_search=${studies}[0][Study]
    ${studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active study found with text search ${studies}[0][Study]
    ${studies}           Get Active Studies
    ${items}            Check Active Study Items Available
    ${expect_header}    Create List    Device    Study    Patient     Facility   Patient ID   Start time  Study type   Study duration    Initial duration    Patient return visit
    ...  Last strip update      Reference code      Biodirect       Progress
    ${actual_headers}   Evaluate    [k for k, v in ${studies}[0].items()]
    ${items}            Check Active Study Items Available
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_headers}       ${expect_header}
    Run Keyword And Continue On Failure    Should Be True    ${items}[0][Copy button]
    Run Keyword And Continue On Failure    Should Not Be True    ${items}[0][Get ECG button]
    Run Keyword And Continue On Failure    Should Be True    ${items}[0][View study button]
    Run Keyword And Continue On Failure    Should Not Be True    ${items}[0][Stop button]
    Run Keyword And Continue On Failure    Should Be True    ${items}[0][Progress bar]


BF-PHY-CP-STUDIES-UNASSIGNED-ABORT-01: Can abort study (single type)
    [Documentation]  Author: Thanh Tieu
    ...
    ...     Description: User can abort a study in Unassigned tab.
    ...
    ...     Precondition:
    ...     - The user is on the Unassigned tab of the STUDIES page
    ...     - Selected study is not in running status
    ...
    ...     Test Steps:
    ...     1. Observe  a list of studies in the Unassigned tab
    ...     2. Click on "Abort" button of a study
    ...
    ...     Expected Results:
    ...     Study is aborted permanently and move the study to the Deleted tab

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-ABORT-01     auto      CP-2.25.1     R1

    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@gmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}   is_next=${False}
    ${values_page_1}        Get New Study Values Page 1
    Create New Study Page 1     is_next=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@gmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}
    Create New Study Page 3     facility=${FACILITIES}[0][name]      use_biodirect=True     referring_physician=Physician Qa Team 01       study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials    study_type=MCT - 93228-93229        is_next=${False}
    ${values_page_3}        Get New Study Values Page 3
    Create New Study Page 3    is_next=${True}
    Create New Study Page 4    primary_diagnosis_other=Other     primary_diagnosis_code_other_input=Other Pri Test      secondary_diagnosis_other=Other    secondary_diagnosis_code_other_input=Other second Test    patient_medication=medication
    ...  physician_notes=Phy Notes      insurance_type=Other    insurance_provider=Provider    pre_authorization=No     symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6     before_heart_monitor=No     is_initiate=${False}
    ${values_page_4}        Get New Study Values Page 4
    Create New Study Page 4    is_initiate=${True}
    Navigate To Studies Page
    ${studies}        Get Active Studies
    ${study_id}       Set Variable    ${studies}[0][Study]
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${studies}        Get Active Studies
    Abort Study
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${studies}        Get Active Studies


BF-PHY-CP-STUDIES-UNASSIGNED-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Tam Ho
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unassigned tab of the STUDIES page
    ...     2. Observe the header of STUDIES page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the STUDIES page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-FILTER-FACILITY-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Studies Page
#    Filter Studies    study_state=Active
#    ${current_facility}      Get Current Facility
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${current_facility}       No reports found
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_facility}       All facilities
#    ${studies}      Get Active Studies
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No reports found

BF-PHY-CP-STUDIES-UNASSIGNED-FILTER-FACILITY-02: Filter by a specific facility in case the user associates with multiple facilities
    [Documentation]     Author: Tam Ho
    ...
    ...     Description: Filter by a specific facility in case the user associates with multiple facilities
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Unassigned tab of the STUDIES page
    ...     2. Click on the drop-down list on the header of the STUDIES page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the STUDIES page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly
    ...     3.The filtered and selected facility shall be applied to other tabs

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-FILTER-FACILITY-02     auto    R1
    Navigate To Studies Page
    Filter Studies    study_state=Active
    Select Facility Studies     Facility_Qa_01
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}     No devices found - with facility ${FACILITIES}[0][name]
    ${current_filter_study}       Get Current Facility
    # The filtered and selected facility shall be applied to other pages
    Check the facility on another page  Inbox       ${current_filter_study}
    Check the facility on another page  Devices     ${current_filter_study}
    Check the facility on another page  Fleet       ${current_filter_study}
    Check the facility on another page  Support     ${current_filter_study}
    Check the facility on another page  Studies     ${current_filter_study}
    Filter Studies    study_state=Active
    Select Facility Studies     Facility_Qa_02
    ${studies}          Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No active studies found - with facility 'Facility_Qa_02'
    ${current_filter_study}       Get Current Facility
    Check the facility on another page  Inbox       ${current_filter_study}
    Check the facility on another page  Devices     ${current_filter_study}
    Check the facility on another page  Fleet       ${current_filter_study}
    Check the facility on another page  Support     ${current_filter_study}
    Check the facility on another page  Studies     ${current_filter_study}
    Filter Studies    study_state=Active
    Select Facility Studies     All facilities
    ${studies}          Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No active studies found - with facility 'All facilities'

BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-01: View all search attributes on the STUDIES page
    [Documentation]  Author: Tam Ho
    ...     Description: The user can view all search attributes on the STUDIES page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unassigned tab of the STUDIES page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Device ID
    ...     2. The default search option should be Patient Name

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-01      auto    R1
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${search_options}       Get Filter Options
    ${expected_options}     Create List    Patient name     Study ID      Patient ID      Device ID
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${search_options}[Search by]        ${expected_options}
    ${current_attribute}     Get Current Search Attribute
    Run Keyword And Continue On Failure    Should Be Equal    ${current_attribute}          Patient name
    ${current_filter}       Get Current Filter
    Run Keyword And Continue On Failure    Should Contain     ${current_filter}[Study state]    Active
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search by]      Search...

BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-02: Search by Patient Name attributes on the STUDIES page
    [Documentation]  Author: Tam Ho
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unassigned tab of the STUDIES page
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

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-02      manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Template]    Filter Active - Studies
#    Patient name        # Facing bug: https://itrvn.atlassian.net/browse/BF-3368

BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-03: Search by Study ID attributes on the STUDIES page
    [Documentation]  Author: Tam Ho
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unassigned tab of the STUDIES page
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

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-03      auto    R1
    [Template]    Filter Active - Studies
    Study ID

BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-04: Search by Patient ID attributes on the STUDIES page
    [Documentation]  Author: Tam Ho
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Unassigned tab of the STUDIES page
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

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-SEARCH-04      auto    R1
    [Template]    Filter Active - Studies
    Patient ID


BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-01: View study details of MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER study
    [Documentation]    Author: Tam Ho
    ...     Description: The user can view the detailed information of the study
    ...
    ...     Precondition:
    ...     - There is a study that match the criteria mentioned above
    ...     - The user is in the Study Details tab of the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...     1. Observe the information On the screen
    ...
    ...     Expected Results:
    ...     1. The Study Details tab is highlighted when it’s selected by the user and the screen
    ...     displays the following information:
    ...     - Study ID (located in the header of the page)
    ...     + Biodirect tag: There shall be a green label
    ...     with the “Biodirect” title on studies that are running with the biodirect service next to the Study ID.
    ...     - Patient Name - (located in the header of the page)
    ...     - Physician Name (Interpreting Physician - located in the header of the page)
    ...     - Facility Name: located in the header of the page
    ...     - Study Information
    ...     + Status
    ...     + Start Time
    ...     + End Time
    ...     + Study Type
    ...     + Study Duration
    ...     + Initial duration
    ...     + Device status
    ...     + Patient Return Visit (Date)
    ...     + Device ID
    ...     + Low Cell Signal
    ...     + RMA
    ...     + Reference code: only displayed if the device is ‘Biocore/Biotres’ and the service is not ‘Biodirect’
    ...     - Physician Information
    ...     + Referring physician:
    ...     . Physician name
    ...     . Day phone number
    ...     . After hours phone number
    ...     . Fax number
    ...     . Email address
    ...     + Interpreting physician
    ...     . Physician name
    ...     . Day phone number
    ...     . After hours phone number
    ...     . Fax number
    ...     . Email address
    ...     - Diagnosis
    ...     + Primary Diagnosis Code
    ...     + Secondary Diagnosis Code
    ...     + Patient medication
    ...     - Physician Amendments Notes
    ...     - Study History (Timezone of the study)
    ...     + These are the study events that are grouped by day: Draft, Starting, Started, Paused, Resumed, Completed,
    ...     Uploading, Uploaded, Erasing, Erased, Aborted. For the studies that run on the firmware version starting
    ...     4.0.010e and the newer ones, their events have the battery information:
    ...     . Started
    ...     . Paused
    ...     . Resumed
    ...     . Completed
    ...     . Uploaded
    ...     . Erased
    ...     - Device Notifications History (Timezone of the study)
    ...     + These are the device notifications that are grouped by day. The devices are run on the firmware version
    ...     starting 4.0.010e and the newer ones, their notifications have battery information:
    ...     . Battery low
    ...     . Battery critical
    ...     . Charger Connected
    ...     . Charger Disconnected
    ...     . Power On
    ...     . Power Off
    ...
    ...     **Others**
    ...     Update Date: 8/22/2023 - Tam Ho
    ...     Update Date: 3/7/2024 - Tam Ho

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-01       auto    R1    CP-2.20.0
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}      Get Active Studies
    View Active Study Details On      row=1   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    # Verify Study (study page ) >< Overview info (Study details)
    ${study_overview}        Get Study Details Overview
    ${study_details}             Get Study Details
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${studies}[0][Study]         ${study_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Patient]       ${study_overview}[Patient]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Facility]      ${study_overview}[Facility]
#    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Biodirect]     ${study_overview}[Biodirect]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Device]     ${study_details}[Study Information][Device ID]
    # Verify title
    ${expected_top_title}        Create List     Study ID        Patient     Physician       Facility        Biodirect
    ${expected_study_info}       Create List     Status   Study type   Study duration    Start time    Initial duration   End time   Device ID   Patient return visit   Device status    Clinician initials   Low cell signal   Reference code
    ${expected_refer_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_inter_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_diagnosis}        Create List     Primary diagnosis code     Secondary diagnosis code     Patient medication
    # verify
    ${top_title}       Evaluate    [k for k, v in ${study_overview}.items()]
    ${study_info}      Evaluate    [k for k, v in ${study_details}[Study Information].items()]
    ${refer_phy}       Evaluate    [k for k, v in ${study_details}[Referring physician].items()]
    ${inter_phy}       Evaluate    [k for k, v in ${study_details}[Interpreting physician].items()]
    ${diagnosis}       Evaluate    [k for k, v in ${study_details}[Diagnosis].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${top_title}     ${expected_top_title}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${study_info}    ${expected_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${refer_phy}     ${expected_refer_physician}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${inter_phy}     ${expected_inter_physician}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_diagnosis}     ${diagnosis}
    # PHYSICIAN AMENDMENTS NOTES     STUDY HISTORY    DEVICE NOTIFICATION HISTORY
    ${all_titles}        Evaluate    [k for k, v in ${study_details}.items()]
    ${expected_title2st}     Create List    Physician amendments notes     Study history    Device notification history
    Run Keyword And Continue On Failure     List Should Contain Sub List    ${all_titles}       ${expected_title2st}

BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-02: View study details of 'Holter & Follow-on' study
    [Documentation]    Author: Tam Ho
    ...     Description: The user can view the detailed information of the study
    ...
    ...     Precondition:
    ...     - There is a study that match the criteria mentioned above
    ...     - The user is in the Study Details tab of the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...     1. Observe the information On the screen
    ...
    ...     Expected Results:
    ...     1. The Study Details tab is highlighted when it’s selected by the user and the screen
    ...     displays the following information:
    ...     - Study Information
    ...     + Study type
    ...     . If the study is a Holter or a Follow-on study and is part of the “Holter & Follow-on study”,
    ...     then there shall be a tag “*FO*” attached next to the study type
    ...     + Patient Return Visit (Date): This should display the Patient return visit date of the follow on study for
    ...     both Holter study and follow on study
    ...     - Follow-on study tracking:
    ...     + Holter study:
    ...     . Study ID: Shall only be available and displayed when the study started. The Study ID shall be a hyperlink
    ...     to the quick access study information sidebar of the Follow-on Study if the user is on the Study details
    ...     tab of the Holter study
    ...     . Study duration: Shall only be available and displayed when the study has not started
    ...     . Study Type - study type of the “Follow-on” study
    ...
    ...     **Others**
    ...     Update Date: 8/22/2023 - Tam Ho

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-02       auto
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${compl_studies}        Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${compl_studies}      No studies found with text search `Study Holter & Follow-on`
    # Navigate to study management
#    ${study_id}     Evaluate    [item['Study'] for item in ${compl_studies} if item.get('Study type').endswith('Follow on')]
#    ${random_study_id}    Evaluate  random.choice(${study_id})    random
    Filter Studies    search_by=Study ID        text_search=${STUDY_ID_HOLTER}
    View Active Study Details On      row=1   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page}     Get Page Header Detail
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${page}       STUDY
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}        Study details
    ${study_details}        Get Study Details
    ${study_details_tracking}       Get Study Details Tracking
    ${expected_follow_on}   Create List    MCT    MCT PEEK    CARDIAC EVENT   HOLTER      EXTENDED HOLTER
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_details}      No details of study found
    Run Keyword And Continue On Failure    Should Be Equal        ${study_details}[Study Information][Study type]       HOLTER | Follow on
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_details}[Study Information][Patient return visit]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_details_tracking}[Follow-on study tracking]
    Run Keyword And Continue On Failure    List Should Contain Value  ${expected_follow_on}        ${study_details_tracking}[Follow-on study tracking][Study type]
    ${actual_study_info_attributes}        Evaluate    [k for k, v in ${study_details}[Study Information].items()]
    ${expect_study_info_attributes}        Create List    Status   Study type   Study duration    Start time    Initial duration   End time   Device ID   Patient return visit   Device status    Clinician initials   Low cell signal   Reference code
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_study_info_attributes}     ${expect_study_info_attributes}
    # Patient: Study Holter & Follow-on

BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-ABORT-01: Can abort a Draft study (single type) running Biocore device
    [Documentation]  Author: Thanh Tieu
    ...
    ...     Description:
    ...    - User can abort a Draft study (single type) running Biocore device
    ...
    ...     Precondition:
    ...    - The user is on the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...    1. Click on "Abort" button of a study
    ...
    ...     Expected Results:
    ...    1. Study is aborted permanently and move the study to the Deleted tab
    ...    2. Disable all function button in STUDY MANAGEMENT page
    ...    3. Hide tabs: REPORTS, EVENTS, ECG VIEWER

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-ABORT-01     manual      CP-2.25.1     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-PATIENT-01: View patient details of a study
    [Documentation]  Author: Tam Ho
    ...     Description: The user can view the detailed information of the patient
    ...
    ...     Precondition:
    ...     - The user is on the STUDY MANAGEMENT page
    ...
    ...     Test Steps:
    ...     1. Click the Patient Details tab
    ...     2. Observe the information on the screen
    ...
    ...     Expected Results:
    ...     1. The Patient Details tab is highlighted when it’s selected by the user and the screen displays the
    ...     following information:
    ...     - Header
    ...     + Study ID
    ...     + Patient Name
    ...     + Physician Name (Interpreting Physician)
    ...     + Facility Name
    ...     - Patient Information
    ...     + Name
    ...     + Gender
    ...     + Patient ID
    ...     + DOB
    ...     + Pacemaker (Yes/No)
    ...     - Patient Contact
    ...     + Address, city, state
    ...     + Zipcode
    ...     + Primary phone number
    ...     + Secondary phone number (optional)
    ...     + Email (optional)
    ...     - Secondary contact (optional)
    ...     + Name
    ...     + Phone number (text field)
    ...     + Relationship
    ...     + Email
    ...     - Insurance
    ...     + Insurance type
    ...     + The provider (optional)
    ...     + Pre-authorization required: two options: [Yes] or [No]
    ...     - Medical history: a medical history of the patient in the last 12 months
    ...     + Symptoms
    ...     + Symptom Frequency:
    ...     + Had a heart monitor before? - two options: [Yes] or [No]

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-DETAILS-PATIENT-01     auto    R1
    #    For aborted studies  # TBD
    Navigate To Studies Page
    Filter Studies    study_state=Active
    ${studies}      Get Active Studies
    ${study_id}     Set Variable        ${studies}[0][Study]
    Filter Studies    study_state=Active     search_by=Study ID      text_search=${study_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No studies found - with text search ${study_id}
    View Active Study Object On    _object=patient    study=${study_id}  device=${studies}[0][Device]     patient=${studies}[0][Patient]
    ${patient_info_view}     Get Patient Info View
    View Active Study Details On    study=${study_id}   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    # Get study details overview and verify headers and contents
    ${study_overview}       Get Study Details Overview
    ${patient_details}      Get Study Patient Details
    ${expected_top_title}       Create List    Study ID     Patient     Physician       Facility
    ${current_top_title}        Evaluate    [k for k, v in ${study_overview}.items() if k != 'Biodirect']
    Run Keyword And Continue On Failure    Lists Should Be Equal          ${expected_top_title}        ${current_top_title}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${studies}[0][Study]         ${study_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Patient]       ${study_overview}[Patient]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Facility]      ${study_overview}[Facility]
    # Expected attributes
    ${expected_ptinfo_attributes}           Create List    Name     Gender   ID     DOB     Height    Weight    Ethnicity    Pacemaker   ICD
    ${expected_ptcontact_attributes}        Create List    Address      Zip code      Phone number     2nd phone number     Email
    ${expected_secondcontact_attributes}    Create List    Name     Phone number    Relationship    Email
    ${expected_insurance_attributes}        Create List    Insurance type    Provider     Pre-authorization required
    ${expected_medicalhistory_attributes}   Create List    Symptoms the patient experienced     Symptom frequency       Used heart monitor
    # Actual attributes
    ${patient_info}           Evaluate    [k for k, v in ${patient_details}[Patient information].items()]
    ${patient_contact}        Evaluate    [k for k, v in ${patient_details}[Patient contact].items()]
    ${second_contact}         Evaluate    [k for k, v in ${patient_details}[Secondary contact].items()]
    ${insurance}              Evaluate    [k for k, v in ${patient_details}[Insurance].items()]
    ${medical_history}        Evaluate    [k for k, v in ${patient_details}[Medical history].items()]
    # Verify atrributes
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptinfo_attributes}               ${patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptcontact_attributes}            ${patient_contact}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_secondcontact_attributes}        ${second_contact}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_insurance_attributes}            ${insurance}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_medicalhistory_attributes}       ${medical_history}
    # Verify patient info
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Patient information]     ${patient_details}[Patient information]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Patient contact]         ${patient_details}[Patient contact]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Insurance]               ${patient_details}[Insurance]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Medical history]         ${patient_details}[Medical history]

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-01: Cannot change type when study status is Not started/Draft/Starting
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify that the "Study Type" dropdown is disabled in the Edit Study Details page when study status is Not Started, Draft, or Starting.
    ...
    ...     Precondition:
    ...     - A study status = Not Started, Draft, or Starting.
    ...     - The study is listed under the "Unassigned" tab.
    ...     - User is on the Study Details page and logged in as a valid user.
    ...
    ...     Test Steps:
    ...     1. Navigate to the Unassigned tab.
    ...     2. Select a study with status = Not Started/Draft/Starting.
    ...     3. On the Study Details page, click on the "Edit Study Details" button.
    ...     4. Observe the behavior of the Study Type dropdown
    ...
    ...     Expected Results:
    ...    - The "Study Type" dropdown is visible but disabled (grayed out, not clickable).
    ...
    ...      **Others**
    ...     Update Date: 04/25/2023 - Thanh Tieu

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-01      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-02: Edit Patient return visit
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify that user can edit and save the "Patient Return Visit" field on the Study Details page.
    ...
    ...     Precondition:
    ...    - User is logged in with permission to edit Study details.
    ...    - User is on the "Study Details" tab of a specific study.
    ...
    ...     Test Steps:
    ...    1. Click on the "Edit Study Details" button.
    ...    2. Locate the "Patient Return Visit" field.
    ...    3. Modify the value
    ...    4. Click "Save".
    ...
    ...     Expected Results:
    ...    - The new value is saved successfully.
    ...    

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-02      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${date}     Get Study Details Return Visit
    ${convert_to_date}      Evaluate    [date.split('/')[1] for date in ${date}]
    ${study_information}      Create Dictionary    patient_return_visit=${convert_to_date}[0]     is_save=${False}     is_change=${False}
    Edit Study Details       study_information=${study_information}
    ${noti_patient_return}       Get Noti Patient Return Visit
    Run Keyword And Continue On Failure    Should Be Equal    ${noti_patient_return}[Notification]        The End of Use report may not be available at this time. The patient return visit date is within 3 business days of the end of the study.
    Edit Study Details Study Information       patient_return_visit=${convert_to_date}[1]      is_save=${False}     is_change=${False}
    ${noti_patient_return}       Get Noti Patient Return Visit
    Run Keyword And Continue On Failure    Should Be Equal    ${noti_patient_return}[Notification]        The End of Use report may not be available at this time. The patient return visit date is within 3 business days of the end of the study.
    Edit Study Details Study Information       patient_return_visit=${convert_to_date}[2]      is_save=${False}     is_change=${False}
    ${noti_patient_return}       Get Noti Patient Return Visit
#    ${noti_patient_return}       Get Noti Patient Return Visit
    Edit Study Details Study Information       is_save=${True}     is_change=${True}
#    Run Keyword And Continue On Failure    Should Be Empty    ${noti_patient_return}[Notification]
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${studies}      Get Study Details
    ${expected_patient_return_visit}      Evaluate     {k: v for k, v in ${studies}[Study Information].items()}
    Run Keyword And Continue On Failure    Should Contain         ${noti_patient_return}[Date]         ${expected_patient_return_visit}[Patient return visit]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-03: Change Referring physician
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify that user can edit the "Referring Physician" field and the selection is saved properly.
    ...
    ...     Precondition:
    ...    - User is viewing the Study Details tab of a study.
    ...
    ...     Test Steps:
    ...    1. Click on the "Edit Study Details" button.
    ...    2. Click the dropdown or input box for "Referring Physician".
    ...    3. Select or enter a valid physician.
    ...    4. Click "Save".
    ...
    ...     Expected Results:
    ...    - The selected physician is saved and displayed in the view mode.

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-03      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${referring_physician}      Create Dictionary    referring_physician=${STUDY_ID_REFERRING}     is_change=${False}
    Edit Study Details       referring_physician=${referring_physician}
    ${current_referring_physician}       Get Current Referring Physician
    Edit Study Details Referring Physician       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${studies}      Get Study Details
    ${expected_referring_physician_infor}      Evaluate     {k: v for k, v in ${studies}[Referring physician].items()}
    Run Keyword And Continue On Failure    Should Contain         ${current_referring_physician}[Referring physician]         ${expected_referring_physician_infor}[Name]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-04: Edit Diagnosis info and Patient medication
    [Documentation]     Author: Thanh Tieu
    ...     Description:Verify that user can update the "Diagnosis Info and Patient Medication" section and data is retained.
    ...
    ...     Precondition:
    ...    - User is on the Study Details tab.
    ...
    ...     Test Steps:
    ...    1. Click "Edit Study Details".
    ...    2. Scroll to "Diagnosis Info and Patient Medication".
    ...    3. Add/edit the information
    ...    4. Click "Save"
    ...
    ...     Expected Results:
    ...    - Modified data is saved correctly.
    ...
    ...      **Others**
    ...     Update Date: 04/21/2023 - Thanh Tieu

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-04      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${diagnosis}      Create Dictionary    primary_diagnosis_code=I47.2 - Ventricular tachycardia     secondary_diagnosis_code=I48.3 - Typical atrial flutter      patient_medication=medication test      is_change=${False}
    Edit Study Details       diagnosis=${diagnosis}
    ${current_diagnosis}       Get Current Diagnosis
    Edit Study Details Diagnosis       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${studies}      Get Study Details
    ${expected_diagnosis}      Evaluate     {k: v for k, v in ${studies}[Diagnosis].items()}
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Primary diagnosis code]         ${expected_diagnosis}[Primary diagnosis code]
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Secondary diagnosis code]         ${expected_diagnosis}[Secondary diagnosis code]
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Patient medication]         ${expected_diagnosis}[Patient medication]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-05: Physician can edit Physician amendments notes
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify that user can edit and save "Physician Amendment Notes" for a study.
    ...
    ...     Precondition:
    ...    - User is on the Study Details tab.
    ...
    ...     Test Steps:
    ...    1. Click "Edit Study Details".
    ...    2. Locate the "Physician Amendment Notes" field.
    ...    3. Add/edit the information
    ...    4. Click "Save"
    ...
    ...     Expected Results:
    ...    - Notes are saved and visible after returning to Study Details tab.
    ...
    ...      **Others**
    ...     Update Date: 04/21/2023 - Thanh Tieu

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-05      auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${physician_amendments_notes}      Create Dictionary    physician_amendments_notes=Change notes     is_change=${False}
    Edit Study Details       physician_amendments_notes=${physician_amendments_notes}
    ${current_physician_amendments_notes}       Get Current Physician Amendments Notes
    Edit Study Details Referring Physician       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${expected_studies}      Get Study Details
    Run Keyword And Continue On Failure    Should Contain         ${current_physician_amendments_notes}[Physician amendments notes]         ${expected_studies}[Physician amendments notes]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-06: Referring physician can be edited for all study statuses except Aborted
    [Documentation]     Author: Thanh Tieu
    ...     Description:
    ...     Ensure that Referring physician can be edited for all study statuses except Aborted
    ...
    ...     Precondition:
    ...     1. Studies exist in Draft, Active, or Complete statuses
    ...
    ...     Test Steps:
    ...     1. Edit Referring physician
    ...
    ...     Expected Results:
    ...     1. The system allows the physician information to be edited
    ...     2. The changes are saved successfully

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-06      manual   R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-07: New Interpreting physician cannot be created during editing
    [Documentation]     Author: Thanh Tieu
    ...     Description:
    ...     Ensure that the user cannot create a new Interpreting physician when editing physician details for a study
    ...
    ...     Precondition:
    ...     1. Studies exist in Draft, Active, or Complete statuses
    ...
    ...     Test Steps:
    ...     1. Edit Interpreting physician
    ...
    ...     Expected Results:
    ...     1. The system does not allow the user to create a new Interpreting physician
    ...     2. Only existing clinic physicians are displayed in the dropdown

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-STUDY-INFO-07      manual   R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-01: Edit Patient info
    [Documentation]     Author: Thanh Tieu
    ...     Description:Verify that the user can edit and save the Patient Information section including Name, Gender, Patient ID, DOB, Height, Weight, Ethnicity and Implantable device status.
    ...
    ...     Precondition:
    ...    1. User is on the "Patient Details" tab of a specific study.
    ...    2. Patient Details tab is highlighted as active.
    ...
    ...     Test Steps:
    ...    1. Click the “Edit” button of Patient information area in the Patient Details page.
    ...    2. Update one or more of the fields: Name, Gender, Patient ID, DOB, Pacemaker.
    ...    3. Click "Save"
    ...
    ...     Expected Results:
    ...    - The updated information is saved and displayed correctly.
    ...    - Page displays the new data after saving.

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-01     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_patient_info}     Create Dictionary      patient_id=PT1    first_name=Patient     middle_name=Test    last_name=01    dob=11/11/1999
    ...     height=5ft, 7in    weight=79lb      ethnicity=caucasian      pacemaker=${True}      icd=${True}     gender=Male     is_save=${False}
    Edit Patient Details        patient_info=${new_patient_info}
    ${current_patient_info_data}       Get Current Patient Info
    Edit Patient Information        is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_info}      Get Study Patient Details
    ${expected_patient_info}      Evaluate     {k: v for k, v in ${patient_info}[Patient information].items()}
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Name]                    ${expected_patient_info}[Name]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Gender]                  ${expected_patient_info}[Gender]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Patient ID]              ${expected_patient_info}[ID]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[DOB]                     ${expected_patient_info}[DOB]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Height]                  ${expected_patient_info}[Height]
    Run Keyword And Continue On Failure    Should Contain         ${expected_patient_info}[Weight]                      ${current_patient_info_data}[Weight]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Ethnicity]               ${expected_patient_info}[Ethnicity]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[Pacemaker]               ${expected_patient_info}[Pacemaker]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_info_data}[ICD]                     ${expected_patient_info}[ICD]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-02: Edit Patient contact
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify that user can update patient contact details including address, zipcode, phone numbers, and email.
    ...
    ...     Precondition:
    ...    1. User is on the “Patient Details” tab.
    ...
    ...     Test Steps:
    ...    1. Click the “Edit” button of Patient contact area in the Patient Details page.
    ...    2. Modify fields: Country, Address, City, State, Zipcode, Primary phone, Secondary phone, Email.
    ...    3. Click "Save"
    ...
    ...     Expected Results:
    ...    1. New contact info is saved and correctly shown in the Patient Details view.
    ...    2. Optional fields like secondary phone and email are handled gracefully if left empty.
    ...

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-02       auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_patient_contact}     Create Dictionary      country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada
    ...     primary_phone_number=084-657-4638     secondary_phone_number=084-657-4637       is_save=${False}
    Edit Patient Details     patient_contact=${new_patient_contact}
    ${current_patient_contact_data}       Get Current Patient Contact
    Edit Patient Contact        is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_contact}      Get Study Patient Details
    ${patient_contact_infor}      Evaluate     {k: v for k, v in ${patient_contact}[Patient contact].items()}
    Run Keyword And Continue On Failure    Should Contain         ${patient_contact_infor}[Address]                             ${current_patient_contact_data}[Address]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Zip code]                     ${patient_contact_infor}[Zip code]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Primary phone number]         ${patient_contact_infor}[Phone number]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Email]                        ${patient_contact_infor}[Email]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Secondary phone number]       ${patient_contact_infor}[2nd phone number]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-03: Edit Patient's secondary contact
    [Documentation]     Author: Thanh Tieu
    ...     Description: Ensure that the user can input or edit secondary contact information, including name, phone, relationship, and email.
    ...
    ...     Precondition:
    ...    1. User is on the “Patient Details” tab.
    ...
    ...     Test Steps:
    ...    1. Click the “Edit” button of Secondary contact area in the Patient Details page.
    ...    2. Modify fields: Name, Relationship, Phone number, Email.
    ...    3. Click "Save"
    ...
    ...     Expected Results:
    ...    1. Secondary contact info is saved and visible.
    ...    2. Section is hidden if all fields are empty.
    ...

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-03     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_secondary_contact}     Create Dictionary      name=Jonh     phone_number=049-586-7594      relationship=brother     email=jonh@yopmail.com      is_save=${False}
    Edit Patient Details     secondary_contact=${new_secondary_contact}
    ${current_secondary_contact_data}       Get Current Secondary Contact
    Edit Secondary Contact          is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${secondary_contact}      Get Study Patient Details
    ${secondary_contact_infor}      Evaluate     {k: v for k, v in ${secondary_contact}[Secondary contact].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Name]     ${current_secondary_contact_data}[Name]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Phone number]     ${current_secondary_contact_data}[Phone Number]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Relationship]     ${current_secondary_contact_data}[Relationship]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Email]     ${current_secondary_contact_data}[Email]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-04: Edit Patient's insurance
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify the ability to edit insurance type, provider, and pre-authorization required option.
    ...
    ...     Precondition:
    ...    - Study is open in Patient Details tab.
    ...
    ...     Test Steps:
    ...    1. Click the “Edit” button of Patient's Insurance area in the Patient Details page.
    ...    2. Choose insurance type from dropdown.
    ...    3. Input provider name (if applicable).
    ...    4. Select [Yes]/[No] for “Pre-authorization required”.
    ...    5. Click "Save"
    ...
    ...     Expected Results:
    ...    1. All values are updated and displayed correctly after saving.
    ...    2. Optional fields like provider can be empty without errors.
    ...

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-04     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_insurance}     Create Dictionary      insurance_type=Other     provider=Provider     pre_authorization=No     is_save=${False}
    Edit Patient Details     insurance=${new_insurance}
    ${current_insurance}       Get Current Insurance
    Edit Insurance      is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_details}      Get Study Patient Details
    ${expected_insurance_data}      Evaluate     {k: v for k, v in ${patient_details}[Insurance].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Insurance type]                  ${expected_insurance_data}[Insurance type]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Provider]                        ${expected_insurance_data}[Provider]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Pre-authorization required]      ${expected_insurance_data}[Pre-authorization required]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-05: Edit Patient's medical history
    [Documentation]     Author: Thanh Tieu
    ...     Description: Check if the user can update the patient’s medical history, including symptoms, symptom frequency, and monitor history.
    ...
    ...     Precondition:
    ...     Patient Details tab is selected.
    ...
    ...     Test Steps:
    ...    1. Click the “Edit” button of Patient's medical history area in the Patient Details page.
    ...    2. Update:
    ...    - Symptoms (text area)
    ...    - Symptom Frequency (dropdown/input)
    ...    - “Had a heart monitor before?” – [Yes]/[No]
    ...    3. Click “Save”
    ...
    ...     Expected Results:
    ...    1. Data is successfully saved and shown correctly.
    ...    2. Past selections are preserved if user cancels edit.
    ...

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-EDIT-PATIENT-INFO-05     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    View Active Study Details On    row=1
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_medical_history}     Create Dictionary      symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6       heart_monitor_before=No     is_save=${False}
    Edit Patient Details        medication_history=${new_medical_history}
    ${current_medical_history}       Get Current Medical History
    Edit Medical History    is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    View Active Study Details On    row=1
    ${patient_details}      Get Study Patient Details
    ${expected_medical_history_data}      Evaluate     {k: v for k, v in ${patient_details}[Medical history].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Symptoms the patient experienced]          ${expected_medical_history_data}[Symptoms the patient experienced]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Symptom frequency]                         ${expected_medical_history_data}[Symptom frequency]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Used heart monitor]                        ${expected_medical_history_data}[Used heart monitor]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-QUICK-ACCESS-01: Quick access to study info and can go to study management page here
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify that the user can view the Study Info modal by clicking on Study ID, and navigate to Study Management (study detail page) from either of two buttons inside the modal.
    ...
    ...     Precondition:
    ...    - User is on the Unassigned tab.
    ...    - Study rows display the Study ID.
    ...
    ...     Test Steps:
    ...    1. Locate a study row and click on its Study ID.
    ...    2. A modal appears showing Study Info (Study Type, Status, Assigned device info, etc.).
    ...    3. Inside the modal:
    ...        a. Click the icon button near the Study ID.
    ...        b. Click the "View full study details" button at the bottom of the modal (if present).
    ...    4. Observe the result after each click.
    ...
    ...     Expected Results:
    ...    - Clicking on Study ID correctly opens the Study Info modal.
    ...    - Both icon and bottom buttons successfully redirect user to the Study Management page for that study.
    ...    - Study Management page is loaded with the Study Details tab active by default.
    ...

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-QUICK-ACCESS-01     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    ${study}        Set Variable    ${studies}[0][Study]
    View Active Study Object On    _object=study    study=${study}
    ${page_header_study}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_study}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          Study ${study}
    Go To Study Management
    ${page_header_detail}           Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header_detail}         STUDY
    ${page_header_overview}         Get Study Details Overview
    ${expected_study}               Set Variable        ${page_header_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_study}         ${study}
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-STUDIES-UNASSIGNED-QUICK-ACCESS-02: Quick access to patient info
    [Documentation]     Author: Thanh Tieu
    ...     Description: Verify that the user can open the Patient Info modal by clicking on the patient name from the study header on Unassigned tab.
    ...
    ...     Precondition:
    ...    - User in on Unassigned tab.
    ...    - Each study row includes a header section displaying patient name.
    ...
    ...     Test Steps:
    ...    1. Identify a study row on the Unassigned tab.
    ...    2. Click on the patient name displayed in the header.
    ...    3. Observe the modal that appears.
    ...
    ...     Expected Results:
    ...    - A modal opens displaying Patient Information, including: Name, Gender, DOB, Patient ID, Pacemaker status, Contact info, etc.
    ...    - The modal can be closed by clicking outside or using the close button.
    ...    - No error or delay occurs upon click.
    ...

    [Tags]  BF-PHY-CP-STUDIES-UNASSIGNED-QUICK-ACCESS-02     auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    ${patient}        Set Variable    ${studies}[0][Patient]
    View Active Study Object On    _object=patient    patient=${patient}
    ${page_header_patient}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_patient}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          ${patient}
    ${patient_info_view}        Get Patient Info View
    ${expected_ptinfo_attributes}           Create List    Name     Gender   ID     DOB     Height    Weight    Ethnicity     Pacemaker     ICD
    ${expected_ptcontact_attributes}        Create List    Address      Zip code      Phone number     2nd phone number     Email
    ${expected_insurance_attributes}        Create List    Insurance type    Provider     Pre-authorization required
    ${expected_medicalhistory_attributes}   Create List    Symptoms the patient experienced     Symptom frequency       Used heart monitor
    # Verify atrributes
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptinfo_attributes}               ${patient_info_view}[Patient information]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_ptcontact_attributes}            ${patient_info_view}[Patient contact]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_insurance_attributes}            ${patient_info_view}[Insurance]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_medicalhistory_attributes}       ${patient_info_view}[Medical history]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient}          ${patient_info_view}[Patient information][Name]
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}
    
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}     Start Browser
    Import Library      project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}         Get Config Param       NEW_USER > clinic_physician
    ${FACILITIES}       Get Config Param       FACILITY
    ${DEVICES}          Get Config Param       DEVICE
    ${AWS_AUTH}         Get Config Param       AWS_AUTH
    ${STUDY_ID_ACTIVE}         Get Config Param       STUDY_ID
    ${STUDY_ID_PHYSICIAN}         Get Config Param       PHYSICIAN
    ${STUDY_ID_HOLTER}   Set Variable        ${STUDY_ID_ACTIVE}[study_id_active][study_id_holter]
    ${STUDY_ID_REFERRING}   Set Variable        ${STUDY_ID_PHYSICIAN}[referring_physician]
    Set Suite Variable  ${PHY_USER}
    Set Suite Variable  ${DEVICES}
    Set Suite Variable    ${FACILITIES}
    Set Suite Variable    ${STUDY_ID_HOLTER}
    Set Suite Variable    ${STUDY_ID_REFERRING}
    ${TOKEN}            Sign In Bioflux       username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${AWS_RPS}          Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
    Set Suite Variable  ${AWS_TOKEN}          ${AWS_RPS}[AuthenticationResult][AccessToken]
    ${VERSION}          Get Release Version
    Set Suite Variable  ${TOKEN}
    Set Suite Metadata  version     ${VERSION}
    Set Suite Metadata  browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Active - Studies
    [Arguments]    ${search_by}
    Navigate To Studies Page
    Filter Studies    study_state=Active        search_by=${search_by}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No active studies found - text search without text string
    ${text_search}      Set Variable If
    ...  '${search_by.lower()}' == 'study id'              ${studies}[0][Study]
    ...  '${search_by.lower()}' == 'device id'             ${studies}[0][Device]
    ...  '${search_by.lower()}' == 'patient id'            ${studies}[0][Patient ID]
    ...  '${search_by.lower()}' == 'patient name'          ${studies}[0][Patient]
    Filter Studies    study_state=Active        search_by=${search_by}      text_search=${text_search}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No active studies found - with text search ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'study id'    Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be Equal As Integers     ${studies}[0][Study]          ${text_search}
    ...  AND    Run Keyword And Continue On Failure    Length Should Be    ${studies}      1
    Run Keyword If    '${search_by}'.lower() == 'device id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}' == f['Device'] for f in ${studies})      Invalid results are showing - with text search ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'patient id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}' == f['Patient ID'] for f in ${studies})      Invalid results are showing - with text search ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}'.lower() == f['Patient'].lower() for f in ${studies})     Invalid results are showing - with text search ${text_search}
    Clear Studies Text Search
    ${text_search}     Get Studies Current Filter Values
    Run Keyword And Continue On Failure    Should Be Empty       ${text_search}[Text Search]

Api Study - Create
    Api Create Study On    token=${AWS_TOKEN}    facility=${FACILITIES}[0][id]   device_id=${DEVICES}[bioflux_device][0][id]   study_type=CARDIAC EVENT   device_type=Bioflux
    ${filter}          Create Dictionary     status=Ongoing        deviceId=${DEVICES}[bioflux_device][0][id]
    ${filter}          Create Dictionary     filter=${filter}
    ${studies}         Api Clinic Studies    ${AWS_TOKEN}      ${filter}
    ${study_id}        Set Variable     ${studies}[body][data][clinicStudies][0][id]
    ${friendly_id}     Set Variable     ${studies}[body][data][clinicStudies][0][friendlyId]
    Set Global Variable    ${study_id}
    Set Global Variable    ${friendly_id}
    RETURN    ${study_id}     ${friendly_id}

Check the facility on another page
    [Arguments]    ${page}      ${expected_filter}
    Navigate To Other Page    page=${page}
    ${current_filter_studies}       Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter_studies}       ${expected_filter}

Create a study with not running biodirect
    Navigate To Studies Page
    Open New Study
    ${current_page}     Get Current New Study Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page}       Patient information       # PAGE 1
    ${second_contact}   Create Dictionary    name=Jonh     relationship=brother     phone_number=049-586-7594     email=jonh@yopmail.com
    ${date}     Get Current Date    result_format=%m/%d/%Y    increment=+15 day
    Create New Study Page 1     patient_id=PT103     first_name=Patient     middle_name=Test      last_name=01     dob=11/11/2000      height=4ft, 3in     weight=50lb     ethnicity=Asian      pacemaker=${True}     icd=${True}   is_next=${False}
    ${values_page_1}        Get New Study Values Page 1
    Create New Study Page 1     is_next=${True}
    Create New Study Page 2     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada       primary_phone_number=084-657-4637        email=patient@yopmail.com
    ...  secondary_phone_number=0293757473      secondary_contact=${second_contact}     is_next=${False}
    ${values_page_2}        Get New Study Values Page 2
    Create New Study Page 2     is_next=${True}
    Create New Study Page 3     facility=${FACILITIES}[1][name]      device_type=Bioflux   device_id=${DEVICES}[bioflux_device][2][id]     referring_physician=Physician Qa Team 01    study_type=MCT – 93228-93229        study_duration=3      patient_return_visit=${date}
    ...  clinician_initials=Initials        is_next=${False}
    ${values_page_3}        Get New Study Values Page 3
    Create New Study Page 3    is_next=${True}
    Create New Study Page 4    primary_diagnosis_other=Other     primary_diagnosis_code_other_input=Other Pri Test      secondary_diagnosis_other=Other    secondary_diagnosis_code_other_input=Other second Test    patient_medication=medication
    ...  physician_notes=Phy Notes      insurance_type=Other    insurance_provider=Provider    pre_authorization=No     symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6     before_heart_monitor=No     is_initiate=${False}
    ${values_page_4}        Get New Study Values Page 4
    Create New Study Page 4    is_initiate=${True}
    Create New Study Page 5
    Set Global Variable     ${values_page_1}
    Set Global Variable     ${values_page_2}
    Set Global Variable     ${values_page_3}
    Set Global Variable     ${values_page_4}
