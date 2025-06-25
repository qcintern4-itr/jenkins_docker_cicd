*** Settings ***
Documentation   Test Suite - Clinic Portal - Deleted studies page
Metadata    sid     BF-TECH-CP-STUDIES-DELETED
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-TECH-CP-STUDIES-DELETED      web
Test Timeout    1h

# Facing bug: https://itrvn.atlassian.net/browse/BF-3368
*** Test Cases ***
BF-TECH-CP-STUDIES-DELETED-VIEW-01: View a list of deleted studies
    [Documentation]  Author: Trinh Nguyen
    ...
    ...     Description: The user can view a list of deleted studies
    ...
    ...     Precondition:
    ...     - The user is on the STUDIES page
    ...
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
    ...     2. Observe the information
    ...
    ...     Epected Results:
    ...     1. The list of deleted studies includes the following information:
    ...     - Study ID
    ...     - Facility Name: Only available when facility filter is All facilities
    ...     - Stop time
    ...     - Patient Return Visit
# Break to new case
#    ...     + In case it is a Holter (first study) or follow-on study, this should be the return date of the study itself
    ...     - Duration
    ...     - Patient Name: there shall be places where the patient name contains a hyperlink. When the hyperlink is
    ...     clicked, patient information shall be displayed to the user
    ...     - Patient ID: ID of a patient that the clinic has assigned to when they started a new study
    ...     - Device ID
    ...     - Study Type
    ...     2. There shall be a Restore button on each study on the list
    ...     3. The deleted study list is sorted by either Study ID. By default, the study list is sorted by Study ID
    ...     in descending order
    ...     4. The report's table is divided into pages. The following pagination tool and filter shall be located at
    ...     the bottom of the table:
    ...     - There shall be a dropdown box with values (10 - 30 - 50) to be selected
    ...     - The default value of the dropdown box is 10
# Break to new case
#    ...     - By default, only the first page is loaded with 10 reports shown to the user
#    ...     - If the report list is less than 10 then the pagination tool shall be hidden
#    ...     - The user shall be able to navigate between loaded pages by pressing the [Next] button to load more reports

    [Tags]  BF-TECH-CP-STUDIES-DELETED-VIEW-01       auto
    Navigate To Studies Page
    Select Facility    All facilities
    Filter Studies    study_state=Deleted
    ${studies}        Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}     No deleted studies found
    # The list of deleted studies includes the following information
    ${actual_headers}        Evaluate      [k for k, v in ${studies}[0].items()]
    ${expected_headers}      Create List   Study ID     Stop time      Patient return visit     Duration   Initial duration   Patient name     Patient ID      Device ID       Study type      Facility
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_headers}       ${expected_headers}
    # The study list is sorted by Study ID in descending order
    ${study_ids}        Evaluate    [item['Study ID'] for item in ${studies}]
    ${expected_study_ids}        Evaluate    sorted(${study_ids}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Length Should Be    ${studies}       10
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${study_ids}        ${expected_study_ids}
    # The report's table is divided into pages
    ${current_size_pp}  Get Studies Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_size_pp}[Rows]        10 per page
    ${size_options}     Get Studies Size Per Page Options
    ${expected_options}     Create List    10 per page      30 per page      50 per page
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${size_options}     ${expected_options}

BF-TECH-CP-STUDIES-DELETED-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
    ...     2. Observe the header of STUDIES page
    ...
    ...     Epected Results:
    ...     1. The facility name is displayed on the header of the STUDIES page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-TECH-CP-STUDIES-DELETED-FILTER-FACILITY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-DELETED-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
    ...     2. Click on the drop-down list on the header of the STUDIES page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the STUDIES page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-TECH-CP-STUDIES-DELETED-FILTER-FACILITY-02       auto
    Navigate To Studies Page
    Filter Studies    study_state=Deleted
    Select Facility     Facility_Qa_01
    ${studies}          Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No deleted studies found - with facility 'Facility_Qa_01'
    Select Facility     Facility_Qa_02
    ${studies}          Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No deleted studies found - with facility 'Facility_Qa_02'
    Select Facility     All facilities
    ${studies}          Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No deleted studies found - with facility 'All facilities'

BF-TECH-CP-STUDIES-DELETED-SEARCH-01: View all search attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can view all search attributes on the STUDIES page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
    ...     2. Click the search option icon
    ...
    ...     Expected Results:
    ...     1. The search attributes shall be displayed:
    ...     - Patient Name
    ...     - Study ID
    ...     - Patient ID
    ...     - Physician (only available for clinic technicians and clinic electrophysiologists)
    ...     2. The default search option should be Patient Name

    [Tags]  BF-TECH-CP-STUDIES-DELETED-SEARCH-01        auto
    Navigate To Studies Page
    Filter Studies    study_state=Deleted
    ${search_options}       Get Filter Options
    ${expected_options}     Create List    Patient name     Study ID      Patient ID      Device ID
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${search_options}[Search by]        ${expected_options}
    ${current_attribute}     Get Current Search Attribute
    Run Keyword And Continue On Failure    Should Be Equal    ${current_attribute}          Patient name
    ${current_filter}       Get Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Study state]    Deleted
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search by]      Search...

BF-TECH-CP-STUDIES-DELETED-SEARCH-02: Search by Patient Name attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Patient attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
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

     [Tags]  BF-TECH-CP-STUDIES-DELETED-SEARCH-02       manual
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Template]    Filter Deleted - Studies
#    Patient Name

BF-TECH-CP-STUDIES-DELETED-SEARCH-03: Search by Study ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
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

    [Tags]  BF-TECH-CP-STUDIES-DELETED-SEARCH-03        auto
    [Template]    Filter Deleted - Studies
    Study ID

BF-TECH-CP-STUDIES-DELETED-SEARCH-04: Search by Patient ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Study ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
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

    [Tags]  BF-TECH-CP-STUDIES-DELETED-SEARCH-04        auto
    [Template]    Filter Deleted - Studies
    Patient ID

BF-TECH-CP-STUDIES-DELETED-SEARCH-05: Search by Device ID attributes on the STUDIES page
    [Documentation]  Author: Trinh Nguyen
    ...     Description: The user can search by Device ID attributes on the Inbox page
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the Deleted tab of the STUDIES page
    ...     2. Click the search option icon
    ...     3. Select the Device ID option
    ...     4. Enter the search input in the search field
    ...     5. Click the Clear button
    ...
    ...     Expected Results:
    ...     1. The Clear button is displayed
    ...     2. The report list shall be filtered and displayed accordingly with the entered Device ID
    ...     3. The search input in the search field shall be remained and be searched across each tab in the INBOX page
    ...     4. All entered text will be deleted

    [Tags]  BF-TECH-CP-STUDIES-DELETED-SEARCH-05        auto
    [Template]    Filter Deleted - Studies
    Device ID

BF-TECH-CP-STUDIES-DELETED-RESTORE-01: Restore deleted studies
    [Documentation]  Author: Trinh Nguyen
    ...     Description:  The user can restore deleted studies
    ...
    ...     Precondition:
    ...     - The user is on the Deleted tab of the STUDIES page
    ...
    ...     Test Steps:
    ...     1. Click the Restore button on each study on the list
    ...
    ...     Expected Results:
    ...     1. The user can select a study to restore
    ...     2. After restoring, the selected studies shall be moved to the Completed tab

    [Tags]  BF-TECH-CP-STUDIES-DELETED-RESTORE-01       auto
    Navigate To Studies Page
    Filter Studies      study_state=Deleted
    ${del_studies}      Get Deleted Studies
    ${study_id}         Set Variable    ${del_studies}[0][Study ID]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${del_studies}        No deleted study found - with text search without text string
    Restore Deleted Studies On    study_id=${study_id}
    ${message}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}       Study ${study_id} is restored
    # Verify restore successfully
    Filter Studies      search_by=Study ID      text_search=${study_id}
    ${del_studies}      Get Deleted Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${del_studies}    Restore false - on study id ${study_id}
    # Navigate to completed study
    Filter Studies       study_state=Completed
    ${compl_studies}     Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${compl_studies}      No completed study found - with text search ${study_id}
    Run Keyword And Continue On Failure    Length Should Be       ${compl_studies}      1
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${study_id}   ${compl_studies}[0][Study ID]
    Delete Study        ${study_id}

BF-TECH-CP-STUDIES-DELETED-QUICK-ACCESS-01: Quick access to patient info
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
    [Tags]  BF-TECH-CP-STUDIES-DELETED-QUICK-ACCESS-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-CP-STUDIES-DELETED-QUICK-ACCESS-02: Quick access to device info
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
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
    [Tags]  BF-TECH-CP-STUDIES-DELETED-QUICK-ACCESS-02     manual      CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Studies.py   ${BROWSER_NODE}  ${ENV}
    ${TECH_USER}          Get Config Param       NEW_USER > clinic_technician
    Set Suite Variable    ${TECH_USER}
    Sign In Bioflux       username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${VERSION}            Get Release Version
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Filter Deleted - Studies        # Incase of relative check device ID -> Can not handle data before test
    [Arguments]    ${search_by}
    Navigate To Studies Page
    Filter Studies    study_state=Deleted     search_by=${search_by}
    ${studies}          Get Deleted Studies
    ${text_search}      Set Variable     ${studies}[0][${search_by}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No deleted studies found - text search without text string
    Filter Studies    study_state=Deleted     search_by=${search_by}      text_search=${text_search}
    ${studies}          Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No deleted studies found - with text search ${text_search}
    Run Keyword If    '${search_by}'.lower() == 'study id'    Run Keywords
    ...  Run Keyword And Continue On Failure    Should Be Equal As Integers     ${studies}[0][Study ID]          ${text_search}
    ...  AND    Run Keyword And Continue On Failure    Length Should Be    ${studies}      1
    Run Keyword If    '${search_by}'.lower() == 'patient name'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}'.lower() in f['Patient Name'].lower() for f in ${studies})        Invalid results are showing - with ${search_by} text search `${text_search}`
    Run Keyword If    '${search_by}'.lower() == 'patient id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}'.lower() in f['Patient ID'].lower() for f in ${studies})      Invalid results are showing - with ${search_by} text search `${text_search}`
    Run Keyword If    '${search_by}'.lower() == 'device id'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${text_search}'.lower() in f['Device ID'] for f in ${studies})       Invalid results are showing - with ${search_by} text search `${text_search}`
    Clear Studies Text Search
    ${text_search}     Get Studies Current Filter Values
    Run Keyword And Continue On Failure    Should Be Empty       ${text_search}[Text Search]

Delete Study
    [Arguments]    ${study_id}
    Navigate To Studies Page
    Filter Studies    study_state=Completed     search_by=Study ID     text_search=${study_id}
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}      No study found - with text search ${study_id}
    Run Keyword And Continue On Failure    Length Should Be    ${studies}       1
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${study_id}       ${studies}[0][Study ID]
    Delete Completed Study On    study_id=${study_id}
    ${message}      Get Toast Success Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}        Deleted study successfully
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${studies}      Delete false - on study id ${study_id}
    Filter Studies      study_state=Deleted
    ${del_studies}      Get Deleted Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${del_studies}    No deleted study found - with text search ${study_id}
    Run Keyword And Continue On Failure    Length Should Be       ${del_studies}        1
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${study_id}       ${del_studies}[0][Study ID]
