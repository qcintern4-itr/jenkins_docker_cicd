*** Settings ***
Documentation   Test Suite - Clinic Portal - Completed studies page
Metadata    sid     BF-PHY-CP-STUDIES-COMPLETED
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_admin_portal/lib/ConfigHandler.py             ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Clinic.py       ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Admin.py        ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py         ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/StudyDetails.py
Library     project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/Fleet.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags      BF-PHY-CP-STUDIES-COMPLETED     web
Test Timeout    1h

*** Test Cases ***
BF-PHY-CP-STUDIES-COMPLETED-VIEW-01: View a list of completed studies
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view a list of Completed studies
    ...
    ...     Precondition:
    ...     - The user is on the Completed tab of the STUDIES page
    ...
    ...     Test Steps:
    ...     1. Observe the screen
    ...
    ...     Epected Results:
    ...     1. The Completed tab includes completed studies that have already been uploaded to the server
    ...     4. The tab includes the following information
    ...     - Study ID:  Study ID contains a hyperlink
    ...     - Error tag:
    ...      + Available when the End of Use report or Interim report has been marked “artifact report” and sent by the
    ...     CC Users to the Clinic. The tag shall be displayed next to the Study ID
    ...      + When the clinic user hovers over the “*error*” tag a tooltip shall appear with the label
    ...     “*This study has report marked as artifact.*”
    ...     - ETA Report Date: display the estimated time of arrival of the report when the study status is done (data erased)
    ...     3 business days after that point
    ...     - Facility name: Only available when facility filter is All facilities
    ...     - Stop time:
    ...     - Patient Return Visit (Date): In case it is a Holter (first study) or follow-on study, this should be
    ...     the return date of the study itself
    ...     - Duration
    ...     - Patient Name: there shall be places where the patient name contains a hyperlink. When the hyperlink is
    ...     clicked, patient information shall be displayed to the user
    ...     - Patient ID: ID of a patient that the clinic has assigned to when they started a new study
    ...     - Device ID
    ...     - Facility name: Only available when facility filter is All facilities
    ...     - Study type: If the study is a Holter or a Follow-on study and is part of the “*Holter & Follow-on study*”,
    ...     then there shall be a tag “FO” attached next to the study type
    ...     - Biodirect tag: There shall be a green label with “Biodirect” title on studies that are running with the
    ...     biodirect service next to the Study ID
    ...     - Action: the user shall be able to access the STUDY MANAGEMENT page of the study by hovering over the
    ...     row of the study list
    ...
    ...     **Others**
    ...     Author: Thang Tran
    ...     Update Date: 10/25/2023
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-VIEW-01       auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    Select Facility    All facilities
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    ${expected_completed}     Create List    Study ID     ETA report date     Stop time     Patient return visit    Duration   Initial duration   Patient name    Patient ID      Device ID       Study type      Facility      Biodirect study
    ${actual_completed}   Evaluate    [k for k, v in ${studies}[0].items()]
    Run Keyword And Continue On Failure    Length Should Be    ${studies}       10
    Run Keyword And Continue On Failure    Lists Should Be Equal        ${actual_completed}     ${expected_completed}
    # The report's table is divided into pages
    ${current_size_pp}  Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_size_pp}[Rows]        10 per page
    ${size_options}     Get Studies Size Per Page Options
    ${expected_options}     Create List    10 per page      30 per page      50 per page
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${size_options}     ${expected_options}
    # Verify device info in case facility filter is not “All facilities”
    Select Facility   ${FACILITIES}[1][name]
    ${studies}        Get Completed Studies
    ${studies_info}    Evaluate       [key for key, value in ${studies}[0].items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${studies_info}        Facility      The header 'Facility' is found from ${studies_info}
    Select Facility   All facilities
    ${studies}        Get Completed Studies
    Manage Completed Study On      row=1
    ${date_erased}             Get Time Eta By Time Erased
    Run Keyword And Continue On Failure    Should Be Equal      ${date_erased}[-1]      ${studies}[0][ETA report date]

BF-PHY-CP-STUDIES-COMPLETED-SORT-STUDY-01: Sort the Completed study by Study ID
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on the Completed tab of the STUDIES page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Study ID
    ...     2. Click the [Sort] button next to the Study ID again
    ...
    ...     Expected Results:
    ...     1. The completed study list shall sort in descending order
    ...     2. The completed study list shall sort in ascending order

    [Tags]      BF-PHY-CP-STUDIES-COMPLETED-SORT-STUDY-01       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    Select Facility    All facilities
    # sort descending
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    ${study_id}        Evaluate    [item['Study ID'].replace(' | ', '').strip() for item in ${studies}]
    ${descending_study_id}      Evaluate    sorted(${study_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${study_id}        ${descending_study_id}
    # sort ascending
    Check Sort Reports Completed
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    ${study_id}        Evaluate    [item['Study ID'].replace(' | ', '').strip() for item in ${studies}]
    ${ascending_study_id}      Evaluate    sorted(${study_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${study_id}        ${ascending_study_id}

BF-PHY-CP-STUDIES-COMPLETED-PAGINATION-01: Check pagination tool works properly in Completed tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The studies’s table is divided into pages
    ...
    ...     Precondition: The user is on Completed tab of the Studies page
    ...
    ...     Test Steps:
    ...     1. Observe the pagination tool displays at the bottom of the table
    ...     2. Select value "30" from the dropdown box
    ...     3. Select value "50" from the dropdown box
    ...     4. Click [>]/[<] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   There shall be a dropdown box with values (10 - 30 - 50) to be selected
    ...     -   The default value of the dropdown box is 10
# Break to new case
#    ...     -   If the device list is less than 10 then the pagination tool shall be hidden
    ...     2. In step 2:
    ...     -   The list shall displays a maximum of 30 items per page
    ...     3. In step 3:
    ...     -   The list shall displays a maximum of 50 items per page
    ...     4. In step 4:
    ...     -   The user shall be able to navigate between loaded pages

    [Tags]      BF-PHY-CP-STUDIES-COMPLETED-PAGINATION-01       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${size_per_options}     Get Studies Size Per Page Options
    ${expected_options}     Create List    10 per page    30 per page    50 per page
    Run Keyword And Continue On Failure    Should Not Be Empty      ${size_per_options}     No option displayed
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${size_per_options}     ${expected_options}
    ${studies}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No Completed Studies found
    ${current_pagination}       Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
    Run Keyword And Continue On Failure    Length Should Be   ${studies}                        10
    Pagination Studies    next_or_previous=next
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       2
    Pagination Studies    next_or_previous=previous
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
    Custom Studies Size Per Page    by_size=30 per page
    ${current_pagination}     Get Studies Current Pagination
    ${studies}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No Completed Studies found
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
#    Run Keyword And Continue On Failure    Length Should Be   ${studies}                        30
    Custom Studies Size Per Page    by_size=50 per page
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1

BF-PHY-CP-STUDIES-COMPLETED-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Observe the header of STUDIES page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the STUDIES page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-FILTER-FACILITY-01       auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    Select Facility    facility=Facility_QA_01
    Manage Completed Study On    row=1
    ${facility}    Get Facility Information
    ${expected_facility}    Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${facility}    ${expected_facility}       
    Select Facility    facility=Facility_QA_02
    Manage Completed Study On    row=1
    ${facility}    Get Facility Information
    ${expected_facility}    Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${facility}    ${expected_facility}  
    Select Facility    facility=All facilities
    Manage Completed Study On    row=1
    ${facility}    Get Facility Information
    Run Keyword And Continue On Failure    Should Not Be Empty    ${facility}  


BF-PHY-CP-STUDIES-COMPLETED-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click on the drop-down list on the header of the STUDIES page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the STUDIES page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-FILTER-FACILITY-02      auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    Select Facility     ${FACILITIES}[0][name]
    ${studies}          Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No completed studies found - with facility '${FACILITIES}[0][name]'
    Select Facility     ${FACILITIES}[1][name]
    ${studies}          Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No completed studies found - with facility '${FACILITIES}[1][name]'
    Select Facility     All facilities
    ${studies}          Get Completed Studies
    Should Not Be Empty    ${studies}      No completed studies found - with facility 'All facilities'

BF-PHY-CP-STUDIES-COMPLETED-SEARCH-01: View all search attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the STUDIES page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Device ID
    ...     2. The default search option should be Patient Name

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-SEARCH-01       auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${search_options}       Get Filter Options
    ${expected_options}     Create List    Patient name     Study ID      Patient ID      Device ID
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${search_options}[Search by]        ${expected_options}
    ${current_attribute}     Get Current Search Attribute
    Run Keyword And Continue On Failure    Should Be Equal    ${current_attribute}          Patient name
    ${current_filter}       Get Current Filter
    Run Keyword And Continue On Failure    Should Contain     ${current_filter}[Study state]    Completed
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search by]      Search...

BF-PHY-CP-STUDIES-COMPLETED-SEARCH-02: Search by Patient Name attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient Name option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

     [Tags]  BF-PHY-CP-STUDIES-COMPLETED-SEARCH-02      auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed    search_by=Patient name    text_search=Study Run Auto
    ${studies-01}    Get Completed Studies 
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies-01}
    ${result}    Verify Fields Of Studies    ${studies-01}    name=Study Run Auto
    Run Keyword And Continue On Failure    Should Be True    ${result}
    Filter Studies    study_state=Active
    Filter Studies    study_state=Completed
    ${studies-02}    Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Equal    ${studies-02}    ${studies-01}
    Filter Studies    study_state=Deleted
    Filter Studies    study_state=Completed
    ${studies-03}    Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Equal    ${studies-03}    ${studies-01}
    Clear Studies Text Search


BF-PHY-CP-STUDIES-COMPLETED-SEARCH-03: Search by Study ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Study ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-SEARCH-03       auto
    [Template]    Filter Completed - Studies
    Study ID

BF-PHY-CP-STUDIES-COMPLETED-SEARCH-04: Search by Patient ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Patient ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-SEARCH-04       auto
    [Template]    Filter Completed - Studies
    Patient ID

BF-PHY-CP-STUDIES-COMPLETED-SEARCH-05: Search by Device ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Device ID name attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Completed tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Device ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The user will also be able to clear the entered text in the Search by clicking on the remove icon (X)
    ...     2. When the user completes a search on the page, the search value and the return output shall be applied
    ...     and reflected on all the tabs of the page
    ...     3. When the user switches the tabs on the page or to different pages the search value and its result should
    ...     remain until it is cleared out

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-SEARCH-05       auto
    [Template]    Filter Completed - Studies
    Device ID

BF-PHY-CP-STUDIES-COMPLETED-SEARCH-06: Search a study aborted by Call center supervisor
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-SEARCH-06      auto       R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[aborted_study_id]
    ${completed_studies}       Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${completed_studies}
    Select Aborted Study
    ${completed_studies}       Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${completed_studies}
    Run Keyword And Continue On Failure    Should Be Equal      ${completed_studies}[0][Study ID]       ${STUDY_ID_COMPLETED}[aborted_study_id]

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-01: View details information for MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER studies
    [Documentation]    Author: Trinh Nguyen
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
    ...     Update Date: 9/13/2023 - Trinh Nguyen
    ...     Update Date: 3/7/2024 - Nhan Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-01        auto      CP-2.20.0
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${studies}      Get Completed Studies
    ${study_id}     Set Variable        ${studies}[0][Study ID]
    Manage Completed Study On    study_id=${study_id}   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    # Get study details data
    ${study_overview}        Get Study Details Overview
    ${study_details}         Get Study Details
    # Expected attributes
    ${expected_top_title}        Create List     Study ID        Patient     Physician       Facility        # do not check Biodirect
    ${expected_study_info}       Create List     Status   Study type   Study duration    Start time    Initial duration   End time   Device ID   Patient return visit   Device status    Clinician initials   Low cell signal   Reference code
    ${expected_refer_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_inter_physician}  Create List     Name    Day phone      After hours phone    Email      Fax number
    ${expected_diagnosis}        Create List     Primary diagnosis code     Secondary diagnosis code     Patient medication
    ${expected_study_history}    Create List     Draft      Starting        Started     Paused      Resumed     Completed       Uploading       Uploaded        Erasing     Erased      Aborted
    # Actual attributes
    ${top_title}       Evaluate    [k for k, v in ${study_overview}.items()]
    ${study_info}      Evaluate    [k for k, v in ${study_details}[Study Information].items()]
    ${refer_phy}       Evaluate    [k for k, v in ${study_details}[Referring physician].items()]
    ${inter_phy}       Evaluate    [k for k, v in ${study_details}[Interpreting physician].items()]
    ${diagnosis}       Evaluate    [k for k, v in ${study_details}[Diagnosis].items()]
    ${study_history}   Evaluate    [v for v, v in ${study_details}[Study history].items()]
    # Verify attributes
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${top_title}     ${expected_top_title}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${study_info}    ${expected_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${refer_phy}     ${expected_refer_physician}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${inter_phy}     ${expected_inter_physician}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_diagnosis}        ${diagnosis}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_study_history}    ${study_history}
    # PHYSICIAN AMENDMENTS NOTES     STUDY HISTORY    DEVICE NOTIFICATION HISTORY
    ${all_titles}        Evaluate    [k for k, v in ${study_details}.items()]
    ${expected_title2st}     Create List    Physician amendments notes     Study history    Device notification history
    Run Keyword And Continue On Failure     List Should Contain Sub List    ${all_titles}       ${expected_title2st}
    # Verify title study info
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${studies}[0][Study ID]                   ${study_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Patient name]               ${study_overview}[Patient]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Facility]                   ${study_overview}[Facility]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Study type]                 ${study_details}[Study Information][Study type]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Duration]                   ${study_details}[Study Information][Study duration]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Device ID]                  ${study_details}[Study Information][Device ID]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Patient return visit]       ${study_details}[Study Information][Patient return visit]
    ${end_time}     Evaluate    '${study_details}[Study Information][End time]'.replace(',', ' |')  # Reformat endtime at study details
    ${stop_time}    Evaluate    '${studies}[0][Stop time]'.replace('UTC','').strip()
    Run Keyword And Continue On Failure    Should Contain         ${stop_time}         ${end_time}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-02: View details information for For studies running 'Holter & Follow-on' study
    [Documentation]    Author: Trinh Nguyen
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
    # Break to new case
#    ...     2. For aborted studies, there shall be a message displayed on the top of the page:
#    ...     “This study has been aborted and will not be counted toward your billing.”
    ...
    ...     **Others**
    ...     Update Date: 9/13/2023 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-02    auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${compl_studies}        Get All Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${compl_studies}      No studies found with text search `Study Holter & Follow-on`
    # Navigate to study management
    ${study_id}     Evaluate    [item['Study ID'] for item in ${compl_studies} if item.get('Study type').endswith('Follow on') and item.get('Study type').startswith('HOLTER')]
    ${random_study_id}    Evaluate      random.choice(${study_id})    random
    Filter Studies    search_by=Study ID        text_search=${random_study_id}
    Manage Completed Study On    row=1
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
    Run Keyword And Continue On Failure    List Should Contain Value   ${expected_follow_on}         ${study_details_tracking}[Follow-on study tracking][Study type]
    ${actual_study_info_attributes}        Evaluate    [k for k, v in ${study_details}[Study Information].items()]
    ${expect_study_info_attributes}        Create List    Status   Study type   Study duration    Start time    Initial duration   End time   Device ID   Patient return visit   Device status    Clinician initials   Low cell signal   Reference code
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_study_info_attributes}     ${expect_study_info_attributes}
    ${actual_study_info_attributes_tracking}        Evaluate    [k for k, v in ${study_details_tracking}[Follow-on study tracking].items()]
    ${status_tracking}      Get Status Attribute Tracking
    Run Keyword If    any('Not started' in item for item in ${status_tracking})
    ...  Run Keyword And Continue On Failure    Should Be True    ${actual_study_info_attributes_tracking}      Not started
    # Patient: Study Holter & Follow-on

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-05-CP-2.16.6: Can view the new primary and secondary diagnosis code
    [Documentation]    Author: Trinh Nguyen
    ...     Description: The user can view the new primary and secondary diagnosis code in study details of a study
    ...
    ...     Precondition:
    ...     - The user is on the Active studies screen
    ...     - The user has selected the new primary and secondary diagnosis code in step 4 of create new study process
    ...
    ...     Test Steps:
    ...     1. Click the View button on the specific study card
    ...     2. Observe the Diagnosis section on Study details screen
    ...
    ...     Expected Results:
    ...     1. The new primary and secondary diagnosis code shall be displayed

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-05-CP-2.16.6      manual       CP-2.16.6
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-06-CP-2.16.6: Can edit to the new primary and secondary diagnosis code
    [Documentation]    Author: Trinh Nguyen
    ...     Description: The user can view the new primary and secondary diagnosis code in study details of a study
    ...
    ...     Precondition:
    ...     - The user is on the Study details screen
    ...     - The user hasnot selected the new primary and secondary diagnosis code in step 4 of create new study process
    ...
    ...     Test Steps:
    ...     1. Click the Edit button on Diagnosis section
    ...     2. Enter the keyword related to the new primary diagnosis code then select
    ...     3. Enter the keyword related to the new sencondary diagnosis code then select
    ...     4. Click the Save button
    ...
    ...     Expected Results:
    ...     1. The new primary and secondary diagnosis code shall be displayed on Diagnosis section

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-06-CP-2.16.6      auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    ${diagnosis}      Create Dictionary    primary_diagnosis_code=I45.6 - Pre-excitation syndrome     secondary_diagnosis_code=I48.21 - Permanent atrial fibrillation    is_change=${True}
    Edit Study Details       diagnosis=${diagnosis}
    ${diagnosis_data}    Get Diagnosis Code Text
    ${diagnosis_dict}    Get From List    ${diagnosis_data}    0
    ${primary_diagnosis_code}    Get From Dictionary    ${diagnosis_dict}    primary
    ${secondary_diagnosis_code}    Get From Dictionary    ${diagnosis_dict}    second
    Run Keyword And Continue On Failure    Should Be Equal      ${primary_diagnosis_code}    I45.6 - Pre-excitation syndrome
    Run Keyword And Continue On Failure    Should Be Equal      ${secondary_diagnosis_code}    I48.21 - Permanent atrial fibrillation
    Rollback Diagnosis


BF-PHY-CP-STUDIES-COMPLETED-DETAILS-PATIENT-01: View the detailed information of the patient
    [Documentation]  Author: Trinh Nguyen
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
#    Break to new case
#    ...     - For aborted studies, there shall be a message displayed on the top of the page:
#    ...     “This study has been aborted and will not be counted toward your billing.”

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-PATIENT-01      auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${studies}      Get Completed Studies
    ${study_id}     Set Variable        ${studies}[0][Study ID]
    View Completed Patient Information On    study_id=${study_id}
    ${patient_info_view}     Get Patient Info View
    Manage Completed Study On    study_id=${study_id}   # MCT/MCT PEEK/CARDIAC EVENT/HOLTER/EXT HOLTER
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    # Verify current study details tab
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    # Get study details overview and verify headers and contents
    ${study_overview}       Get Study Details Overview
    ${expected_top_title}       Create List    Study ID     Patient     Physician       Facility
    ${current_top_title}        Evaluate    [k for k, v in ${study_overview}.items() if k != 'Biodirect']
    Run Keyword And Continue On Failure    Lists Should Be Equal          ${expected_top_title}           ${current_top_title}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${studies}[0][Study ID]         ${study_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Patient name]     ${study_overview}[Patient]
    Run Keyword And Continue On Failure    Should Be Equal                ${studies}[0][Facility]         ${study_overview}[Facility]
    ${patient_details}      Get Study Patient Details
    # Expected attributes
    ${expected_ptinfo_attributes}           Create List    Name     Gender   ID     DOB     Height    Weight    Ethnicity     Pacemaker     ICD
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
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Patient contact]         ${patient_details}[Patient contact]      # Facing bug: Address ${patient_info_view} and ${patient_details} are not equals
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Insurance]               ${patient_details}[Insurance]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_info_view}[Medical history]         ${patient_details}[Medical history]

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-01: View list of reports sent by the Call center of a study
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-01       auto     R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Reports
    ${summary_reports}      Get Study Details Summary Reports
    ${actual_header}       Evaluate    [k for k, v in ${summary_reports}[0].items()]
    ${expected_header}     Create List    Report ID    Date of service   Last modified   Report Type   Status
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_header}      ${expected_header}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-02: Search Interim/EOU report by Report ID
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
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-02       auto        R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Reports
    ${summary_reports}      Get Study Details Summary Reports
    ${report_ids}       Evaluate    [item['Report ID'] for item in ${summary_reports} if item.get('Report Type') == 'Interim']
    ${report_id}        Evaluate    random.choice(${report_ids})       random
    Filter Study Details Reports    text_search=${report_id}
    ${summary_reports}      Get Study Details Summary Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${report_id}      ${summary_reports}[0][Report ID]

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-03: Search Notification/Event report by Report ID
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
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-03       auto     R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Reports
    Navigate To Study Details Subtab        Notification reports
    ${notification_reports}      Get Study Details Notification Reports
    ${actual_header}       Evaluate    [k for k, v in ${notification_reports}[0].items()]
    ${expected_header}     Create List    Report ID    Date of service   Last modified   Status
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_header}      ${expected_header}
    ${report_ids}       Evaluate    [item['Report ID'] for item in ${notification_reports}]
    ${report_id}        Evaluate    random.choice(${report_ids})       random
    Filter Study Details Reports    text_search=${report_id}
    ${notification_reports}      Get Study Details Notification Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${report_id}      ${notification_reports}[0][Report ID]

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-04: Check a tooltip shall displayed when user hovers over the error tag
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-04       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-05: Can sort report by Report ID/Last Modified/Report Type/Status
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
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-05       auto     R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Reports
    Navigate To Study Details Subtab        Notification reports
    # sort descending by report id
    Sort Study Details Reports       Report ID       descending
    ${reports}      Get Study Details Notification Reports
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${reports}]
    ${descending_report_id}      Evaluate    sorted(${reports_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${reports_id}        ${descending_report_id}
    # sort ascending by report id
    Refresh Page
    Navigate To Study Details Tab    Reports
    Navigate To Study Details Subtab        Notification reports
    Sort Study Details Reports       Report ID       ascending
    ${reports}      Get Study Details Notification Reports
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${reports}]
    ${ascending_report_id}      Evaluate    sorted(${reports_id}, key=int)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${reports_id}        ${ascending_report_id}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-06: Check the pagination tool is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description: Check the pagination tool is working properly on Notification report
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-06       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Reports
    Navigate To Study Details Subtab        Notification reports
    ${size_per_options}     Get Studies Size Per Page Options
    ${expected_options}     Create List    10 per page    30 per page    50 per page
    Run Keyword And Continue On Failure    Should Not Be Empty      ${size_per_options}     No option displayed
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${size_per_options}     ${expected_options}
    ${notification_reports}      Get Study Details Notification Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_reports}      No Completed Studies found
    ${current_pagination}       Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
    Run Keyword And Continue On Failure    Length Should Be   ${notification_reports}           10
    Pagination Studies    next_or_previous=next     is_wait=${False}
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       2
    Pagination Studies    next_or_previous=previous     is_wait=${False}
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
    Custom Studies Size Per Page    by_size=30 per page
    ${current_pagination}     Get Studies Current Pagination
    ${notification_reports}      Get Study Details Notification Reports On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_reports}      No Completed Studies found
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
#    Run Keyword And Continue On Failure    Length Should Be   ${studies}                        30
    Custom Studies Size Per Page    by_size=50 per page
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-07: Check user can go to the Report View page by clicking the Edit report button
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-07       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-08: View Interim/EOU report details in study management page
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-08       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-09: View Notification/Event report details in study management page
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-09       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-10: Can mark the reports as reviewed/unreviewed
    [Documentation]     Author: Trinh Nguyen
    ...     Description: Can mark the reports as reviewed/unreviewed on Notification reports page
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-10       auto     R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Reports
    Navigate To Study Details Subtab        Notification reports
    ${notification_reports}             Get Study Details Notification Reports
    ${report_ids}       Evaluate    [item['Report ID'] for item in ${notification_reports}]
    ${report_id}        Evaluate    random.choice(${report_ids})    random
    Filter Study Details Reports    text_search=${report_id}
    View The Reports On    row=1
    Edit Inbox Detail Report Status         status=Reviewed
    Back Study Detail Reports
    ${notification_reports}             Get Study Details Notification Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${notification_reports}[0][Status]     Reviewed

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-11: Can navigate to the report screen of the study management page by clicking the close button
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-11       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-12: MCT study/EOU old report format-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-12       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-13: MCT study/EOU new report format-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-13       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-14: MCT Peek study/EOU old report format-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-14       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-15: MCT Peek study/EOU new report format-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-15       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-16: Holter/Ext.Holter study/EOU old report format-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-16       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-17: Holter/Ext.Holter study/EOU new report format-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-17       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-18: Cardiac Event study/EOU old report format-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-18       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-19: EOU-Download report
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-19       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-20: Interim-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-20       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-21: Interim-Download report
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-21       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-22: Notification-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-22       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-23: Notification-Download report
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-23       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-24: Event-Add Interpretation and Signature
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-24       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-25: Event-Download report
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
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-25       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-26: Event-View ECG strip
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-26       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-27: Cannot view Event/Notification report in case the financial hold of facility is 80 or 90 days
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-27       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-28: Cannot view Interim/EOU report in case the financial hold of facility is 80 or 90 days
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
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-28       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-29: The report tab shall not be displayed for aborted studies
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
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-REPORT-29       auto     R1
    Navigate To Studies Page
    # check list summary reports
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[aborted_study_id]
    Select Aborted Study
    ${studies_completed}        Get All Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies_completed}
    Manage Completed Study On    row=1
    ${msg}        Get Message Aborted Study Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        This study has been aborted and will not be counted toward your billing.

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-01: View components displayed on Events list
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all of valid and closed events of a study
    ...
    ...     Precondition:
    ...     - The user is on the Events tab of the STUDY MANAGEMENT page of an active/completed study
    ...     - The event list on this page must be Valid and Closed
    ...
    ...     Test Steps:
    ...     1. Observe the screen
    ...     Expected Results:
    ...     1. The following components appear on the screen:
    ...     - Study ID (located in the header of the page)
    ...     - Patient Name (located in the header of the page)
    ...     - Physician Name (Interpreting Physician - located in the header of the page)
    ...     - Facility Name (located in the header of the page)
    ...     2. The Events tab is highlighted when it’s selected by the user*.*
    ...     3. There should be an Events tab where all of the events of the study will be stored
    ...     4. The events list of a specific study can be filtered with the filter row, which shall be, located right
    ...     below the tab. The filters will include such as:
    ...     - Trigger Time (Date picker)
    ...     - Event Type]
    ...     - By default, the events list of a specific study should be filtered by the total study duration date, and
    ...     the filter is set to All Type
    ...     - Refresh/Reload button -  to reload the amount of the events and the event card itself in the Events tab
    ...     5. All events of a specific study will display the following information in rows:
    ...     - Event ID:
    ...     + The ID of the event
    ...     + Display format: 5 digits
    ...     - Event Type: can be one of the following values: Manual, Tachy, Brady, Pause, AFib, Auto, and Sinus
    ...     - Trigger Time:
    ...     + The time when the event is triggered
    ...     + Display format: MM/DD/YYYY HH:MM: SS
    ...     Symptoms: can be one or a combination of the following values: Baseline, Resume Study, Evaluation Strip,
    ...     Chest Pain or Pressure, Shortness of Breath, Palpitations, Dizziness, Other and Not Specified.
    ...     - Technician Comment: inputs by technicians about the event
    ...     - Strip images: the user can view the strip images of the event, each image presents 10-second data,
    ...     the user also can navigate between strip images
    ...     - There should be a View ECG button at each event in the list. When the user clicks on the View ECG button
    ...     they will be redirected to the ECG Viewer page where the user can view the ECG strip of an event with
    ...     appropriate ECG viewing tools
    ...     6. On the Event tab screen, there shall be a disclaimer message hovering: “The following event(s) may or
    ...     may not have been finalized and their classification may change upon final review”
    ...     7. The user should also have the option to search for other events in the Events tab. The search bar and
    ...     the search field should be located in the same row with an event filter
    ...     - The search field should have a string saying: “Search by Event ID”
    ...     - The user can search for different events by its ID as well as use the event filter to filter the search
    ...     8. The user shall also be able to sort the list manually by clicking on the Sort button to sort the events
    ...     by date-newest to oldest and vis-a-vis
    ...     9. By default, the list loads a maximum of 10 events. The user can scroll down to load more events
    # Break to new case
#    ...     10. For aborted studies, this Events tab shall not be displayed

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-01-CP2.21.0: Display patient manual events, regardless of symptom, validitity, open or closed
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-01-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-02-CP2.21.0: Display auto events with status valid and closed
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-02-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-03-CP2.21.0: Not display manual events (Evaluation trips, baseline, resumed) unless status valid and closed
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-03-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-04-CP2.21.0: Check if an event is annotated with a section of ECG strip marked that strip shall be shown as annotated
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-04-CP2.21.0       manual      R1     CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-02: Filter event list by range date of study duration
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-02       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Events
    Filter Study Details Events     from_date=02/10/2024        to_date=02/10/2024
    ${events}           Get Study Details Events
    ${trigger_time}     Evaluate        [item['Trigger time'].split(',')[0] for item in ${events}]
    ${expected_status}      Check Filter By Range Date    check_dates=${trigger_time}
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-03: Sort event list by event id order
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-03       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Events
    Sort Study Details Events       Oldest
    ${events}       Get Study Details Events
    ${events_id}        Evaluate    [item['Event ID'] for item in ${events}]
    ${expected_events_id}       Evaluate    sorted(${events_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Should Be Equal    ${events_id}      ${expected_events_id}
    Sort Study Details Events       Newest
    ${events}       Get Study Details Events
    ${events_id}        Evaluate    [item['Event ID'] for item in ${events}]
    ${expected_events_id}       Evaluate    sorted(${events_id}, key=int)
    Run Keyword And Continue On Failure    Should Be Equal    ${events_id}      ${expected_events_id}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-04: Filter event list by event type
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-04       auto      R1
    [Template]      Filter Event Type
    Brady
    Tachy
    AFib
    Pause
    Manual

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-05: Reload the event list by "Manual reload" button
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-05       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-06: Search for an event by Event ID
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-06       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Events
    ${events}        Get Study Details Events
    ${event_ids}        Evaluate    [item['Event ID'] for item in ${events}]
    ${event_id}         Evaluate    random.choice(${event_ids})     random
    Filter Study Details Events     text_search=${event_id}
    ${events}        Get Study Details Events
    Run Keyword And Continue On Failure    Should Be Equal    ${event_id}       ${events}[0][Event ID]

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-07: View ECG details of an event
    [Documentation]  Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-07       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Events
    View Study Details Events Ecg On    row=1
    ${ecg_details}          Get Study Details Ecg Viewer
    Run Keyword And Continue On Failure    Should Be Equal    ${ecg_details}    The following event(s) may or may not have been finalized and their classification may change upon final review

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-08: For aborted studies, this Events tab shall not be displayed
    [Documentation]  Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-EVENT-08       auto      R1
    Navigate To Studies Page
    # check list summary reports
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[aborted_study_id]
    Select Aborted Study
    Manage Completed Study On    row=1
    ${tab}      Get Study Details Tab
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${tab}      Events

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-01:View details of the ECG Viewer tab
    [Documentation]     Author: Trinh Nguyen
    ...     Description: The user can details of the ECG Viewer tab
    ...
    ...     Precondition:
    ...     - The user is on the ECG Viewer tab of the STUDY MANAGEMENT page of an COMPLETED/completed study
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-02: Check there is message displayed in case study running on Biodirect service has not been started by the patient
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-03: Check there is message displayed in case the event data of the selected date has not been uploaded to the system yet
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-04: The user can view the HR chart of a specific date by selecting the date from the drop-down selection
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-05: Check there is a message displayed in case the event data of the selected date has not been uploaded to the system yet
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-06: Check the Refresh button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-06     auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    ECG viewer
    ${expected_status}     Check Study Details Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Refresh]
    #Check the Show event indicators checkbox is working properly
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Indicator]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-07: Check the Show event indicators checkbox is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-09: Check case there shall be highlighted blank spaces between the heartbeat lines in case there is no heart rate data at any time period in the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-10: Check there shall be a vertical line indicating the time and the heart rate at that time when the user hovers over the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-11: Check the label shall displayed the time and NA for HR at that time in case the user hovers over the period of time on the HR chart that does not have data
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-11     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-12: Check details of the ECG chart when the user clicks on the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-12     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-13: Check the user cannot click on the HR chart of the time periods that do not have any data
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-14: Check details of the Event information bar under the HR chart when user clicks on the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-14     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-15: Check behavior when the user clicks on the HR chart and drags
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-15     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-16: Check the Reset zoom button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-16     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-17: Check case the user selects the vertical line and then zooms in the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-17     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-18: Check the user can only zoom in and zoom out one time
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-18     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-19: Check case the user clicks on an event in the event list while zooming in
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-19     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-20: Check details of the ECG chart
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-20     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-21: Check case the user clicks on an event in the event list while zooming in
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-21     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-22: Check Speed filter on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-22     auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    ECG viewer
    ${expected_status}     Check Study Details Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    ${event_ecg}             Get Study Details Ecg Viewer Filter
    ${event_ecg_speed}          Evaluate    [k for k in ${event_ecg}[Speed]]
    ${event_ecg_gain}           Evaluate    [k for k in ${event_ecg}[Gain]]
    ${event_type}               Evaluate    [k for k in ${event_ecg}[Event Type]]
    ${expected_ecg_speed}       Create List    2.5 mm/s   10 mm/s   25 mm/s   50 mm/s   75 mm/s   100 mm/s   200 mm/s   500 mm/s
    ${expected_ecg_gain}        Create List    1 mm/mV   2 mm/mV   5 mm/mV   10 mm/mV   20 mm/mV   50 mm/mV   100 mm/mV   200 mm/mV
    ${expected_event_type}      Create List    All event type   Brady   Tachy   AFib    Pause   Auto    Sinus   Manual
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_ecg_speed}      ${expected_ecg_speed}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_ecg_gain}      ${expected_ecg_gain}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_type}      ${expected_event_type}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-23: Check Gain filter on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-23     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-24: Check High Pass filter tool on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-24     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-25: Check Low Pass filter tool on ECG chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-25     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-26: Check Show/Hide Channels button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-26     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-27: Check the Beat marker tool is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-27     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-28: Check the View all strip button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-28     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-29: Check user can Add beat marker
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-29     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-30: Check user can Remove beat marker
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-30     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-31: Check Horizontal Caliper button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-31     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-32: Check Vertical Caliper button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-32     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-33: Check Beat Calipers button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-33     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-34: Check Text Annotation button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-34     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-35: Check Mark 10 Sec button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-35     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-36: Check Mark 20 Sec button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-36     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-37: Check Mark a Pattern button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-37     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-38: Check Hide Beat Markers button is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-38     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-39: Check details of the Event section
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-39     auto
    Navigate To Studies Page
    # check list summary reports
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    ECG viewer
    ${events}           Get Study Details Ecg Viewer Events
    ${header_events}    Evaluate    [k for k, v in ${events}[0].items()]
    ${expected_header_events}       Create List    Event ID   Trigger hour   Event type     Symptoms    Technician comment
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_header_events}       ${header_events}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-40: Check result when user clicks on the row of an event
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-40     auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    ECG viewer
    View Study Details Event Ecg Viewer On    row=1
    ${event_filter}     Get Event Filter Ecg Viewer
    ${events}           Get Study Details Ecg Viewer Events
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event ID]       ${event_filter}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Trigger hour]       ${event_filter}[1]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Event type]       ${event_filter}[2]
    Run Keyword And Continue On Failure    Should Be Equal    ${events}[0][Symptoms]       ${event_filter}[3]

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-41: Check the event type filter is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/20/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-41     auto
    Navigate To Studies Page
    # check list summary reports
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    ECG viewer
    Filter Study Details Ecg Viewer     day=18
    Filter Event Type On ECG Viewer With Event Type "Brady"
    Filter Event Type On ECG Viewer With Event Type "Tachy"
    Filter Event Type On ECG Viewer With Event Type "AFib"
    Filter Event Type On ECG Viewer With Event Type "Pause"
    Filter Event Type On ECG Viewer With Event Type "Auto"
    Filter Event Type On ECG Viewer With Event Type "Sinus"
    Filter Event Type On ECG Viewer With Event Type "Manual"

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-42: Check the user can access the ECG Viewer Guideline
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-42     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-43: Check the Do not show this again checkbox is working properly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-43     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-44: Check the Pagination tool below the Event lists is working prorerly
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-44     auto
    Navigate To Studies Page
    # check list summary reports
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    ECG viewer
    Filter Study Details Ecg Viewer    day=18
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Studies        next_or_previous=next     is_wait=${False}
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Studies    next_or_previous=previous     is_wait=${False}
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Studies Size Per Page       30 per page
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Studies Size Per Page       50 per page
    ${current_pagination}     Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-45: The ECG Viewer tab shall not be dislayed for aborted studies
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/21/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-ECG-VIEWER-45     auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[aborted_study_id]
    Select Aborted Study
    Manage Completed Study On    row=1
    ${tab}      Get Study Details Tab
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${tab}      ECG viewer

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-01: Create an manual Instant report
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user can create an Instant report
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Some study data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that does NOT overlap with any existing reports
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. A new record is created for the report.
    ...     2. A snackbar informs the user "Your request is being processed. The report will be ready within an hour."
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-01       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-02: Auto-Generate Instant Report When Study Concludes and All Data Is Uploaded
    [Documentation]  Author: Nhan Nguyen
    ...     Description: erify that an automatic Instant Report is generated when the study concludes and all data is uploaded
    ...
    ...     Precondition:
    ...     1. A study is in progress and data is actively being uploaded.
    ...     2. The system supports automatic report generation upon study completion.
    ...     3. Observe that a new report is created automatically.
    ...
    ...     Test Steps:
    ...     1. Ensure that all data from the device is uploaded (100% completion)
    ...     2. Navigate to the Instant Report tab under Study Details
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. A new Instant Report is created automatically when the study concludes and all data is uploaded.
    ...     2. The report appears in the Instant Report List with Generated By: Auto
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-02       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-03: Create an Instant Report With Overlapping Time Frame (No New Data Uploaded) and The previous report is generated
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user create an Instant Report for a time frame that overlaps an existing report, but no new data has been uploaded and The previous report is generated
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Existing report(s) already generated for the overlapping date range.
    ...     4. No new data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. Display an alert on the calendar: "A report already exists for the selected time period."
    ...     2. Provide a link to navigate to the previously generated report.
    ...     3. No new report is generated.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-03       manual    R2      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-04: Create an Instant Report With Overlapping Time Frame (No New Data Uploaded) and The previous report is generating
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user create an Instant Report for a time frame that overlaps an existing report, but no new data has been uploaded and The previous report is generating
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Existing report(s) generating for the overlapping date range.
    ...     4. No new data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. Display an alert on the calendar: "A report for the selected time period is currently being generated and will be ready within an hour."
    ...     2. No new report is generated.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-04       manual    R2      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-05: Create an Instant Report With Overlapping Time Frame (New Data Uploaded)
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user creates an Instant Report for a time frame that overlaps an existing report, and new data has been uploaded since the previous report.
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. Existing report(s) already generated for the overlapping date range.
    ...     4. NNew data has been uploaded since the last report.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. A new record is created for the report.
    ...     2. A snackbar informs the user "Your request is being processed. The report will be ready within an hour."
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-05       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-06: Create an Instant Report With Overlapping Time Frame (No New Data Uploaded) and The previous report is generated + Artifact
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user create an Instant Report for a time frame that overlaps an existing report, but no new data has been uploaded and The previous report is generated+ Artifact
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. The calendar is enabled when study start date > today.
    ...     3. There is an existing Case Report artifact for the selected time frame.
    ...     4. No new data has been uploaded.
    ...
    ...     Test Steps:
    ...     1. On the Instant reports tab, click "Generate Report."
    ...     2. Select a time frame from the calendar that overlaps an existing report
    ...         The calendar is enabled: study start date > today
    ...     3. Click "Create Instant Report"
    ...
    ...     Expected Results:
    ...     1. Display an alert on the calendar: "A report already exists for the selected time period."
    ...     2. No new report is generated.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-06       manual    R2      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-07: View the List of Instant Reports
    [Documentation]  Author: Nhan Nguyen
    ...     Description: View the list of Instant Reports that have been generated + generating for a study, including reports created manually or automatically
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. There is at least one report in the list with the status "Generated" or "Generating"
    ...
    ...     Test Steps:
    ...     1. User is On the Instant reports tab
    ...
    ...     Expected Results:
    ...     1. The list of Instant Reports is displayed, showing reports generated either:
    ...         - Manually by the clinic user
    ...         - Automatically after all study data is uploaded upon study completion
    ...     2. Reports are sorted by "Generated Time," from the latest to the oldest.
    ...     3. Each report in the list displays the following details:
    ...         - Report ID: Auto-generated in the format 'XXXXX' (starts at 00001 and increments by 1)
    ...         - Date of Service: Start and end dates the report covers
    ...         - Analysis Time: Total duration of data analyzed and included in the report
    ...         - Generated Time: Date and time the report was successfully generated
    ...         - Generated By: 'Clinic' if manually generated; 'Auto' if automatically generated
    ...         - Status:
    ...                "Generating" if the report is still processing (includes status icon and tooltip explanation)
    ...                "Generated" if the report has been successfully created
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-07       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-08: View a Generated Instant Report when EOU report not ready
    [Documentation]  Author: Nhan Nguyen
    ...     Description: View the details of a Generated Instant Report by clicking on it in the Instant Reports list.
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. There is at least one report in the list with the status "Generated"
    ...
    ...     Test Steps:
    ...     1. User is On the Instant reports tab
    ...     2. Click on the icon view of the Generated report
    ...
    ...     Expected Results:
    ...     1. The system opens the detail of selected report.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-08       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-09: Verify Pop-up Notification When Accessing an Auto-Generated Instant Report While the EOU Report is Ready
    [Documentation]  Author: Nhan Nguyen
    ...     Description: Verify that when the user accesses an generated Instant Report while the End-of-Use (EOU) Report is ready, 
    ...     a pop-up notification is displayed, providing options to navigate to the EOU Report or continue viewing the Instant Report.
    ...
    ...     Precondition:
    ...     1.The user is on the Study Details > Instant Report tab or Inbox > Instant Report
    ...     2.An generated Instant Report is available.
    ...     3.The EOU Report is ready for the study.
    ...
    ...     Test Steps:
    ...     1. User is On user is on the Study Details > Instant Report tab or Inbox > Instant Report
    ...     2. Click to open the Instant Report
    ...     2. Observe the pop-up notification that appears
    ...
    ...     Expected Results:
    ...     1.  A pop-up notification appears with the message that the End-of-Use Report is available and recommended for review.
    ...     2.  The pop-up contains two options
    ...             - View EOU Report
    ...             - View Instant Report
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-09       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-10: Verify Navigation to EOU Report from the Pop-up
    [Documentation]  Author: Nhan Nguyen
    ...     Description: Verify that selecting View EOU Report from the pop-up navigates the user to the correct EOU Report
    ...
    ...     Precondition:
    ...     1.The pop-up notification is displayed when accessing an generated Instant Report.
    ...     2.The EOU Report is ready
    ...
    ...     Test Steps:
    ...     1. Click View EOU Report on the pop-up
    ...     2. Verify that the system navigates to the EOU Report
    ...
    ...     Expected Results:
    ...     1.  The user is correctly navigated to the EOU Report
    ...     2.  The EOU Report Details page is displayed
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-10       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-11: Verify Navigation to Instant Report from the Pop-up
    [Documentation]  Author: Nhan Nguyen
    ...     Description: Verify that selecting View Instant Report from the pop-up closes the modal and allows the user to 
    ...     continue viewing the Instant Report with an alert banner
    ...
    ...     Precondition:
    ...     1.The pop-up notification is displayed when accessing an generated Instant Report.
    ...     2.The EOU Report is ready
    ...
    ...     Test Steps:
    ...     1. Click View Instant Report on the pop-up
    ...     2. Observe the Instant Report Details page
    ...     3. Check that an alert banner appears at the top, reminding the user that the EOU Report is available and recommended for review
    ...
    ...     Expected Results:
    ...     1.  The pop-up closes when selecting View Instant Report
    ...     2.  The user remains on the Instant Report Details page
    ...     3.  An alert banner is displayed at the top, informing about the available EOU Report
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-11       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-12: Verify Alert Banner and Navigation Link to EOU Report After Selecting View Instant Report
    [Documentation]  Author: Nhan Nguyen
    ...     Description: Verify that after selecting View Instant Report, the system displays an alert banner at the top of the report details page,
    ...     reminding the user about the End-of-Use (EOU) Report with a link to navigate to it.
    ...
    ...     Precondition:
    ...     1.The pop-up notification is displayed when accessing an generated Instant Report.
    ...     2.The EOU Report is ready
    ...     3.User accesses the Instant Report
    ...     4.User selects View Instant Report on the pop-up

    ...
    ...     Test Steps:
    ...     1. Check that an alert banner appears at the top, reminding the user that the EOU Report is available and recommended for review
    ...     2. Verify that the banner contains a link to navigate to the EOU Report
    ...     3. Click on the View verified report
    ...
    ...     Expected Results:
    ...     1.  An alert banner is displayed at the top, informing about the available EOU Report
    ...     2.  A navigation link is available within the banner.
    ...     3.  Navigates to the EOU Report Details
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-12       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-13: Check the pagniation tool is working
    [Documentation]  Author: Nhan Nguyen
    ...     Description: Navigate through the Instant Reports list using pagination when there are more than 10 reports.
    ...
    ...     Precondition:
    ...     1. User is on Instant reports tab.
    ...     2. There are more than 10 Instant Reports available for the selected study.
    ...
    ...     Test Steps:
    ...     1. User is On the Instant reports tab
    ...     2. Click ">" to navigate to the next page of reports
    ...     3. Click "<" to return to the previous page
    ...
    ...     Expected Results:
    ...     1. The system displays the first 10 reports on page 1 by default.
    ...     2. Click ">", The system displays the next set of 10 reports.
    ...     3. Click "<", The system displays the prior set of 10 reports.
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-13       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-14: Instant-Download report
    [Documentation]  Author: Nhan Nguyen
    ...     Description: User can download Instant report
    ...
    ...     Precondition:
    ...     1. The user is on the Instant Report Details
    ...
    ...     Test Steps:
    ...     1. Click the Download button.
    ...     2. Observe the system behavior.
    ...
    ...     Expected Results:
    ...     1. The system downloads the Instant Report as a PDF file
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-14       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-15: Verify Instant Report Tab is Not Displayed for Aborted Studies
    [Documentation]  Author: Nhan Nguyen
    ...     Description: The user is on the Study Details page of an Aborted Study
    ...
    ...     Precondition:
    ...     1. The user is on the Instant Report Details
    ...
    ...     Test Steps:
    ...     1. Observe the Study Details page.
    ...     2. Check if the Instant Report tab is present.
    ...
    ...     Expected Results:
    ...     1. The Instant Report tab is NOT displayed on the Study Details page for Aborted Studies
    ...
    ...     **Others
    ...     - Updated: 07/25/2024-Nhannguyen
    ...     - Last updated: 03/25/2025-TamHo
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-INSTANT-15       manual    R1      CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-01: Return Status tab not available for Test facility
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

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-01       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-02: For Active facility - Edit Return status
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click "Device returned" toggle
    ...     2. Select or deselect the received items, the save the changes
    ...
    ...     Expected Results:
    ...     1. All checkboxes in Recieved items are selected
    ...     2. All updates are saved and the device is marked as returned and removed from Waiting for return tab
    ...
    ...     **Others**
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-02       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Return status
    Open Study Details Device Returned    turn_on=${True}
    ${status_actual}     Check Return Status Received Items Available
    Run Keyword And Continue On Failure    Should Be True    ${status_actual}[Device]
    Run Keyword And Continue On Failure    Should Be True    ${status_actual}[Accessories]
    Run Keyword And Continue On Failure    Should Be True    ${status_actual}[Box]
    Run Keyword And Continue On Failure    Should Be True    ${status_actual}[Cable]
    Run Keyword And Continue On Failure    Should Be True    ${status_actual}[Charger]
    Run Keyword And Continue On Failure    Should Be True    ${status_actual}[Quick Guide]
    ${header_details}       Get Study Details Overview
    ${study_id}             Set Variable        ${header_details}[Study ID]
    Navigate To Fleet
    Navigate To Fleet Tab    Waiting for Return
    ${waiting_for_return}   Get Fleet Waiting For Return Items
    ${study_ids}            Evaluate    [item['Study ID'] for item in ${waiting_for_return}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${study_ids}        ${study_id}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-03: For Active facility - Edit Notes
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-03       auto      R1
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Return status
    Edit Study Details Return Status    edit_notes=Check edit notes return status
    Refresh Page
    Navigate To Study Details Tab    Return status
    ${expected_notes}       Get Current Return Status Note
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_notes}         Check edit notes return status

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-04: For Active facility - Create a return shipping label
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-04      manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-05: For Active facility - Check "Device returned" toggle disabled
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     The toggle is disabled in the following cases:
    ...     - If the device is included in a newer study
    ...     - If the device is RMA and received by Biotricity Productions

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-RETURN-05       manual     R1     CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-CP-STUDIES-COMPLETED-DETAILS-BIODIRECT-STATUS-01:Display Shipping Label Details for Sending Device Status
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-BIODIRECT-STATUS-01       manual     R1     CP-2.25.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-CP-STUDIES-COMPLETED-DETAILS-BIODIRECT-STATUS-02:Display Shipping Label Details for Returning Device Status
    [Documentation]     Author: Tam Ho
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-BIODIRECT-STATUS-02       manual     R1     CP-2.25.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-CP-STUDIES-COMPLETED-DETAILS-BIODIRECT-STATUS-03: Display message "No shipping label created yet" when Study Biodirect has not shipment label
    [Documentation]  Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     1. Study Biodirect has not shipment label (Outbound & Inbound)
    ...
    ...     Test Steps:
    ...     
    ...
    ...     Expected Results:
    ...     1. Display message "No shipping label created yet"
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-DETAILS-BIODIRECT-STATUS-03      manual    CP-2.25.2    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-01: Edit Patient return visit
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-01     auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    # Verify page header
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${date}     Get Completed Study Details Return Visit
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
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${studies}      Get Study Details
    ${expected_patient_return_visit}      Evaluate     {k: v for k, v in ${studies}[Study Information].items()}
    Run Keyword And Continue On Failure    Should Contain         ${noti_patient_return}[Date]         ${expected_patient_return_visit}[Patient return visit]

BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-02: Change Referring physician
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-02      auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${referring_physician}      Create Dictionary    referring_physician=${REFERRING_PHYSICIAN}     is_change=${False}
    Edit Study Details       referring_physician=${referring_physician}
    ${current_referring_physician}       Get Current Referring Physician
    Edit Study Details Referring Physician       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${studies}      Get Study Details
    ${expected_referring_physician_infor}      Evaluate     {k: v for k, v in ${studies}[Referring physician].items()}
    Run Keyword And Continue On Failure    Should Contain         ${current_referring_physician}[Referring physician]         ${expected_referring_physician_infor}[Name]

BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-03: Physician cannot change Interpreting physician
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-03     auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${title_study_detail_info}    Get Current Session Edit Study Detail
    ${expected_study_detail_info}       Create List    Study information    Referring physician     Interpreting physician    Diagnosis     Physician Amendments Notes
    Run Keyword And Continue On Failure    Should Not Be Empty                   ${title_study_detail_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal         ${title_study_detail_info}         ${expected_study_detail_info}

BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-04: Edit Diagnosis info and Patient medication
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-04      auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${diagnosis}      Create Dictionary    primary_diagnosis_code=I47.2 - Ventricular tachycardia     secondary_diagnosis_code=I48.3 - Typical atrial flutter      patient_medication=medication test      is_change=${False}
    Edit Study Details       diagnosis=${diagnosis}
    ${current_diagnosis}       Get Current Diagnosis
    Edit Study Details Diagnosis       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${studies}      Get Study Details
    ${expected_diagnosis}      Evaluate     {k: v for k, v in ${studies}[Diagnosis].items()}
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Primary diagnosis code]         ${expected_diagnosis}[Primary diagnosis code]
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Secondary diagnosis code]         ${expected_diagnosis}[Secondary diagnosis code]
    Run Keyword And Continue On Failure    Should Contain         ${current_diagnosis}[Patient medication]         ${expected_diagnosis}[Patient medication]

BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-05: Physician can edit Physician admendments notes
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-STUDY-INFO-05      auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    # Verify current study details tab
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Study details
    ${physician_amendments_notes}      Create Dictionary    physician_amendments_notes=Change notes     is_change=${False}
    Edit Study Details       physician_amendments_notes=${physician_amendments_notes}
    ${current_physician_amendments_notes}       Get Current Physician Amendments Notes
    Edit Study Details Referring Physician       is_change=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${studies}      Get Study Details
    Run Keyword And Continue On Failure    Should Contain         ${current_physician_amendments_notes}[Physician amendments notes]         ${studies}[Physician amendments notes]

BF-PHY-CP-STUDIES-COMPLETED-01: Can delete a Biocore/Biotres study
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-01          auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${studies}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    ${study_id}     Set Variable        ${studies}[0][Study ID]
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
    [Teardown]    Run Keyword    Restore Deleted Studies On    row=1

BF-PHY-CP-STUDIES-COMPLETED-02: Can delete multiple Biocore/Biotres studies
    [Documentation]     Author: Nhan Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-02     auto
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${completed}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${completed}
    ${complete_study_id}      Delete Multiple Completed Studies         row=1, 2
    Filter Studies    study_state=Completed       search_by=Study ID      text_search=${complete_study_id}[0][Study ID]
    ${completed}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${completed}
    Filter Studies    study_state=Completed       search_by=Study ID      text_search=${complete_study_id}[1][Study ID]
    ${completed}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${completed}
    Refresh Page
    Filter Studies    study_state=Deleted       search_by=Study ID      text_search=${complete_study_id}[0][Study ID]
    ${deleted}      Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${deleted}
    Run Keyword And Continue On Failure    Should Be Equal    ${deleted}[0][Study ID]    ${complete_study_id}[0][Study ID]
    Restore Deleted Studies On    row=1
    Filter Studies    study_state=Deleted       search_by=Study ID      text_search=${complete_study_id}[1][Study ID]
    ${deleted}      Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${deleted}
    Run Keyword And Continue On Failure    Should Be Equal    ${deleted}[0][Study ID]    ${complete_study_id}[1][Study ID]
    Restore Deleted Studies On    row=1

BF-PHY-CP-STUDIES-COMPLETED-03: Cannot delete a Bioflux study using Biodirect service
    [Documentation]     Author: Nhan Nguyen
    ...     Description: 07044
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Studies Page
#    Filter Studies    study_state=Completed
#    ${completed}      Get Completed Studies
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${completed}
#    Filter Studies    study_state=Completed       search_by=Study ID      text_search=07044
#    Delete Completed Study On     row=1
#    ${message}      Get Toast Error Message
#    ${completed}      Get Completed Studies
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${completed}
#    Run Keyword And Continue On Failure    Should Be Equal        ${message}            Cannot delete study 7044 belonged to Bioflux Direct

BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-01: Edit Patient info
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-01     auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_patient_info}     Create Dictionary      patient_id=PT1    first_name=Patient     middle_name=Test    last_name=01    dob=11/11/1999
    ...     height=5ft, 7in    weight=79lb      ethnicity=caucasian      pacemaker=${True}      icd=${True}     gender=Male     is_save=${False}
    Edit Patient Details        patient_info=${new_patient_info}
    ${current_patient_info_data}       Get Current Patient Info
    Edit Patient Information        is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
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
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}

BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-02: Edit Patient contact
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-02       auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_patient_contact}     Create Dictionary      country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada
    ...     primary_phone_number=084-657-4638     secondary_phone_number=084-657-4637       is_save=${False}
    Edit Patient Details     patient_contact=${new_patient_contact}
    ${current_patient_contact_data}       Get Current Patient Contact
    Edit Patient Contact        is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${patient_contact}      Get Study Patient Details
    ${patient_contact_infor}      Evaluate     {k: v for k, v in ${patient_contact}[Patient contact].items()}
    Run Keyword And Continue On Failure    Should Contain         ${patient_contact_infor}[Address]                             ${current_patient_contact_data}[Address]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Zip code]                     ${patient_contact_infor}[Zip code]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Primary phone number]         ${patient_contact_infor}[Phone number]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Email]                        ${patient_contact_infor}[Email]
    Run Keyword And Continue On Failure    Should Be Equal        ${current_patient_contact_data}[Secondary phone number]       ${patient_contact_infor}[2nd phone number]

BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-03: Edit Patient's secondary contact
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-03     auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    Navigate To Study Details Tab    Patient details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_secondary_contact}     Create Dictionary      name=Jonh     phone_number=049-586-7594      relationship=brother     email=jonh@yopmail.com      is_save=${False}
    Edit Patient Details     secondary_contact=${new_secondary_contact}
    ${current_secondary_contact_data}       Get Current Secondary Contact
    Edit Secondary Contact          is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${secondary_contact}      Get Study Patient Details
    ${secondary_contact_infor}      Evaluate     {k: v for k, v in ${secondary_contact}[Secondary contact].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Name]     ${current_secondary_contact_data}[Name]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Phone number]     ${current_secondary_contact_data}[Phone Number]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Relationship]     ${current_secondary_contact_data}[Relationship]
    Run Keyword And Continue On Failure     Should Be Equal           ${secondary_contact_infor}[Email]     ${current_secondary_contact_data}[Email]

BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-04: Edit Patient's insurance
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-04     auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_insurance}     Create Dictionary      insurance_type=Other     provider=Provider     pre_authorization=No     is_save=${False}
    Edit Patient Details     insurance=${new_insurance}
    ${current_insurance}       Get Current Insurance
    Edit Insurance      is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${patient_details}      Get Study Patient Details
    ${expected_insurance_data}      Evaluate     {k: v for k, v in ${patient_details}[Insurance].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Insurance type]                  ${expected_insurance_data}[Insurance type]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Provider]                        ${expected_insurance_data}[Provider]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_insurance}[Pre-authorization required]      ${expected_insurance_data}[Pre-authorization required]

BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-05: Edit Patient's medical history
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-EDIT-PATIENT-INFO-05     auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Manage Completed Study On    row=1
    ${page_header}      Get Study Details Overview
    ${study_id}         Set Variable    ${page_header}[Study ID]
    Navigate To Study Details Tab    Patient Details
    ${tab}      Get Current Study Details Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${tab}      Patient details
    ${new_medical_history}     Create Dictionary      symptoms=TIA, Chest pain        symptoms_times_happen=Less than 6       heart_monitor_before=No     is_save=${False}
    Edit Patient Details        medication_history=${new_medical_history}
    ${current_medical_history}       Get Current Medical History
    Edit Medical History    is_save=${True}
    Navigate To Studies Page
    Filter Studies  study_state=Completed    search_by=Study ID      text_search=${study_id}
    Manage Completed Study On    row=1
    ${patient_details}      Get Study Patient Details
    ${expected_medical_history_data}      Evaluate     {k: v for k, v in ${patient_details}[Medical history].items()}
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Symptoms the patient experienced]          ${expected_medical_history_data}[Symptoms the patient experienced]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Symptom frequency]                         ${expected_medical_history_data}[Symptom frequency]
    Run Keyword And Continue On Failure     Should Be Equal           ${current_medical_history}[Used heart monitor]                        ${expected_medical_history_data}[Used heart monitor]

BF-PHY-CP-STUDIES-COMPLETED-QUICK-ACCESS-01: Quick access to study info and can go to study management page here
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-QUICK-ACCESS-01         auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    ${completed_studies}       Get Completed Studies
    ${studies_id}              Evaluate    [item['Study ID'] for item in ${completed_studies}]
    ${study_id}                Evaluate    random.choice(${studies_id})      random
    Filter Studies      search_by=Study ID      text_search=${study_id}
    View Completed Study Information On    row=1
    ${page_header_study}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_study}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          Study ${study_id}
    Go To Study Management
    ${page_header_detail}           Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header_detail}         STUDY
    ${page_header_overview}         Get Study Details Overview
    ${expected_study}               Set Variable        ${page_header_overview}[Study ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_study}         ${study_id}

BF-PHY-CP-STUDIES-COMPLETED-QUICK-ACCESS-02: Quick access to patient info
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-QUICK-ACCESS-02     auto
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    ${completed_studies}       Get Completed Studies
    ${studies_id}              Evaluate    [item['Study ID'] for item in ${completed_studies}]
    ${study_id}                Evaluate    random.choice(${studies_id})      random
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${completed_studies}       Get Completed Studies
    View Completed Patient Information On    row=1
    ${page_header_patient}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_patient}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          ${completed_studies}[0][Patient name]
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
    Run Keyword And Continue On Failure    Should Be Equal    ${completed_studies}[0][Patient name]          ${patient_info_view}[Patient information][Name]

BF-PHY-CP-STUDIES-COMPLETED-QUICK-ACCESS-03: Quick access to device info
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. General info: Model - it can be
    ...     - Bioflux
    ...     - Biocore: if the Auto-events detection for the device, there shall be a message displayed next to the device model – (Auto-events detection enabled).
    ...     - Biocore Pro
    ...     - Time zone
    ...     - Firmware version
    ...     - Operator
    ...     - Network mode
    ...     - Device lifetime - the total time of the device in use since the first study and it is counted by day and month
    ...     if its lifetime is less than 1 year- ex: 1 month 3 days or month and year if its lifetime is equal to or greater
    ...     than 1 year - ex: 1 year 3 months
    ...     2. Last Synced Status
    ...     - RSSI
    ...     - Lead on
    ...     - Battery level
    ...     - SD card free space
    ...     - Charging state
    ...     - Last connect
    ...
    ...     **Others
    ...     Update date: 5/27/2024 - Trinh Nguyen
    ...     Update date: 02/19/2024 - Trinh Nguyen
    ...     Auto create: 03/08/2024 - Thang Tran
    ...
    [Tags]  BF-PHY-CP-STUDIES-COMPLETED-QUICK-ACCESS-03     auto      CP-2.23.0
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    ${completed_studies}       Get Completed Studies
    ${studies_id}              Evaluate    [item['Study ID'] for item in ${completed_studies}]
    ${study_id}                Evaluate    random.choice(${studies_id})      random
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${completed_studies}       Get Completed Studies
    View Completed Device Information On    row=1
    ${page_header_device}      Get Page Header Quick Access
    ${current_page_header}          Set Variable        ${page_header_device}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_page_header}          Device ${completed_studies}[0][Device ID]
    ${device_info_view}     Get Device Info View
    ${expect_general_info}  Create List    Facility     Model   Firmware version   Timezone    Operator    Network mode    Device lifetime
    ${expect_last_sync}     Create List    RSSI     Lead on     Battery level   SD card free space      Charging state     Last connect
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_info_view}[General information]           ${expect_general_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_info_view}[Last synced status]     ${expect_last_sync}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}          Start Browser
    Import Library           project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    Import Library           project_bioflux_clinic_portal/lib/web/Fleet.py          ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}              Get Config Param       NEW_USER > clinic_physician
    ${FACILITIES}            Get Config Param       FACILITY
    ${DEVICES}               Get Config Param       DEVICE
    ${AWS_AUTH}              Get Config Param       AWS_AUTH
    ${STUDY_ID}              Get Config Param       STUDY_ID
    ${ADMIN_USER}            Get Config Param       USER > admin_01
    ${PHYSICIAN}            Get Config Param       PHYSICIAN
    ${STUDY_ID_COMPLETED}    Set Variable        ${STUDY_ID}[study_id_completed]
    ${REFERRING_PHYSICIAN}    Set Variable        ${PHYSICIAN}[referring_physician]
    Set Suite Variable       ${REFERRING_PHYSICIAN}
    Set Suite Variable       ${ADMIN_USER}
    Set Global Variable      ${STUDY_ID_COMPLETED}
    Set Suite Variable       ${PHY_USER}
    Set Suite Variable       ${DEVICES}
    Set Suite Variable       ${FACILITIES}
    ${TOKEN}                 Sign In Bioflux       username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${AWS_RPS}               Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
    Set Suite Variable       ${AWS_TOKEN}          ${AWS_RPS}[AuthenticationResult][AccessToken]
    ${VERSION}               Get Release Version
    Set Suite Variable       ${TOKEN}
    Set Suite Metadata       version     ${VERSION}
    Set Suite Metadata       browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Completed - Studies
    [Arguments]    ${search_by}
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=${search_by}
    ${studies}          Get Completed Studies
    ${text_search}      Set Variable     ${studies}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No completed studies found - text search without text string
    Filter Studies    study_state=Completed     search_by=${search_by}      text_search=${text_search}
    ${studies}          Get All Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No completed studies found - with text search ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'study id'    Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be Equal As Integers     ${studies}[0][Study ID]          ${text_search}
    ...  AND    Run Keyword And Continue On Failure    Length Should Be    ${studies}      1
    Run Keyword If    '${search_by}'.lower() == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}'.lower() in f['Patient Name'].lower() for f in ${studies})      Invalid results are showing - with text search ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'patient id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}' in f['Patient ID'] for f in ${studies})      Invalid results are showing - with text search ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'device id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}' in f['Device ID'] for f in ${studies})       Invalid results are showing - with text search ${text_search}
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

Filter event type
    [Arguments]       ${event_type}=${EMPTY}
    Navigate To Studies Page
    # check list summary reports
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    Navigate To Study Details Tab    Events
    Filter Study Details Events     by_type=${event_type}
    ${events}       Get Study Details Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No reports found
    Run Keyword And Continue On Failure    Should Be True    all('${event_type}'.lower() == r['Event type'].lower() for r in ${events})

Filter event type on ECG viewer with event type "${event_type}"
    Filter Study Details Ecg Viewer     by_type=${event_type}
    ${events}       Get Study Details Ecg Viewer Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events}     No reports found
    Run Keyword And Continue On Failure    Should Be True    all('${event_type}'.lower() == r['Event type'].lower() for r in ${events})

Rollback Diagnosis
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_report]
    Manage Completed Study On    row=1
    ${diagnosis}      Create Dictionary    primary_diagnosis_code=I47.2 - Ventricular tachycardia     secondary_diagnosis_code=I48.3 - Typical atrial flutter    is_change=${True}
    Edit Study Details       diagnosis=${diagnosis}
