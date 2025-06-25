*** Settings ***
Documentation   Test Suite - Call Center QA Portal - Study Management page
Metadata    sid     BFCC-QA-STUDY-MGMT
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library       project_bioflux_callcenter_portal/lib/web/Common.py
Library       project_bioflux_callcenter_portal/lib/web/Studies.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-QA-STUDY-MGMT     web
Test Timeout    1h

*** Test Cases ***
BFCC-QA-STUDY-MGMT-01-CP2.16.7: Hide "Generate event data" button on More options
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]  BFCC-QA-STUDY-MGMT-01-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-01-CP2.16.7: Can view Strip image of events that have Open status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-01-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-02-CP2.16.7: Can view Strip image of events that have closed by the user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-02-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-03-CP2.16.7: Cannot view Strip image of events that have closed as invalid by the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     Display message "Strip image is not available"

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-03-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-04-CP2.16.7: Can view Strip image of events in Event Card that have closed as invalid by the system before and the user changes to Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     Strip image is available, the user reload the event list to view strip

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-04-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-05-CP2.16.7: Can view Strip image of events in Strip Selection of EOU/Interim/Notification report that have closed as invalid by the system before and the user changes to Valid
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     In Strip Selection of EOU/Interim/Notification report, strip image shall display if event is check as "Include in report"

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-05-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-06-CP2.16.7: Only can view Event details if the study is archived
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     The "View" button will be displayed instead of "Edit" button

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-06-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-07-CP2.16.7: Search for events closed as invalid by the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     - All info displayed properly, strip image is not available

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-07-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-08-CP2.16.7: Search for events closed by the user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     - All info displayed properly, strip image is available

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-08-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-09-CP2.16.7: Filter by Closed status and check results for events closed as invalid by system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     - All info displayed properly, strip image is not available

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-09-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EVENTS-VIEW-10-CP2.16.7: Filter by Invalid status and check results for events closed as invalid by system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     - All info displayed properly, strip image is not available

    [Tags]  BFCC-QA-STUDY-MGMT-EVENTS-VIEW-10-CP2.16.7      manual   CP-2.16.7
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-NOTES-01: Taking a note in a study note section while on the Study details tab of the Study management page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-NOTES-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-NOTES-02: Taking a note on the study note section while in slide-over pop-up
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-NOTES-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-NOTES-03: Taking a note on the study note section while on the Notification Criteria tab of the Event Edit page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-NOTES-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-NOTES-04: Cannot take a note if the study has been aborted
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-NOTES-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-NOTES-05: Cannot take a note if the input more than 400 characters
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-NOTES-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-LOG-01: View the study log in case the clinic is running a single study (MCT, MCT Peek, Cardiac Event, Holter, Extended Holter)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-LOG-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-LOG-02: View the study log in case the Biolfux Support user started a new Bioflux Direct order while running on the existing device that the patient still has on hand
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-LOG-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-LOG-03: View the study log in case there is a notification as part of a flagged study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-LOG-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-LOG-04: View the study log in case the system changes the diagnosis lead automatically
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-LOG-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-LOG-05: View the study log in case the study is aborted
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-LOG-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-LOG-01: Log information of a study while on the study details tab of the study management page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-LOG-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-LOG-02: Log information of a study while on the notification criteria tab of the event edit page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-LOG-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-EDIT-LOG-03: Cannot log information of a study in case the study has been aborted
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-EDIT-LOG-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-DETAIL-01: View study details of the ‘+normal+' STUDY MANAGEMENT page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-DETAIL-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-DETAIL-02: View study details of the ‘+Holter & Follow-on+' STUDY MANAGEMENT page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-DETAIL-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-CHANGE-DURATION-01: Can change duration of the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-CHANGE-DURATION-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-FILTER-01: Can filter by Trigger time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-FILTER-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-FILTER-02: Can filter by Event data availability
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-FILTER-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-FILTER-03: Can reset filter
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-FILTER-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-FILTER-04: Can combine Advance filter with other filter options (status. validity, and type) while filtering for the event data
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-FILTER-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-UPDATE-SETTING-01: Update study setting for active studies while is in Online mode
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-UPDATE-SETTING-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-UPDATE-SETTING-02: Update study setting for active studies while is in Offline mode
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-UPDATE-SETTING-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-UPDATE-RMA-01: Update RMA information of a study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-UPDATE-RMA-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-UPDATE-LCS-01: Update Low Cell Signal information of a study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-UPDATE-LCS-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-VIEW-REPORT-01: View Summary reports of a study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-REPORT-01     auto
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    ${summary_reports}      Get Study Details Summary Reports
    ${actual_header}       Evaluate    [k for k, v in ${summary_reports}[0].items()]
    ${expected_header}     Create List    Report ID    Date Of Service    Time Monitored    Report Status    Type    Last Modified    Generated By    Assignee    New Report Status
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_header}      ${expected_header}

BFCC-QA-STUDY-MGMT-VIEW-REPORT-02: View Notification reports of a study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-VIEW-REPORT-02     auto
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    Navigate Study Management Notification Report Tab
    ${notification_reports}      Get Study Details Notification Reports
    ${actual_header}       Evaluate    [k for k, v in ${notification_reports}[0].items()]
    ${expected_header}     Create List    Report ID    Date Of Service    Report Status    Last Modified    Assignee
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_header}      ${expected_header}

BFCC-QA-STUDY-MGMT-SEARCH-REPORT-01: Search Interim/EOU report by Report ID
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-SEARCH-REPORT-01     auto
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    ${summary_reports}      Get Study Details Summary Reports
    ${report_ids}       Evaluate    [item['Report ID'] for item in ${summary_reports}]
    ${report_id}        Evaluate    random.choice(${report_ids})       random
    Filter Study Details Reports    text_search=${report_id}
    ${summary_reports}      Get Study Details Summary Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${report_id}      ${summary_reports}[0][Report ID]

BFCC-QA-STUDY-MGMT-SEARCH-REPORT-02: Search Notification report by Report ID
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-SEARCH-REPORT-02     auto
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    Navigate Study Management Notification Report Tab
    ${notification_reports}      Get Study Details Notification Reports
    ${report_ids}       Evaluate   [item['Report ID'] for item in ${notification_reports}]
    ${report_id}        Evaluate    random.choice(${report_ids})       random
    Filter Study Details Reports    text_search=${report_id}
    ${notification_reports}      Get Study Details Notification Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${report_id}      ${notification_reports}[0][Report ID]

BFCC-QA-STUDY-MGMT-REPORTS-01: Verify Reports Tab Visibility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Reports Tab Visibility
    ...
    ...    Precondition: The user is logged into the system.
    ...
    ...    Test Steps:
    ...    1. Navigate to the STUDY MANAGEMENT page.
    ...    2. Check if the Reports tab is visible.
    ...
    ...    Expected Results:
    ...    The Reports tab should be visible.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen
    ...                 19/04/2025 - Tam Ho (Auto)

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-01     CP-2.29.0    auto
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    
BFCC-QA-STUDY-MGMT-REPORTS-02: Verify Reports Tab is Hidden for Aborted Studies
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Reports Tab is Hidden for Aborted Studies
    ...
    ...    Precondition: A study is marked as "Aborted."
    ...
    ...    Test Steps:
    ...    1. Navigate to the STUDY MANAGEMENT page.
    ...    2. Verify the visibility of the Reports tab.
    ...
    ...    Expected Results:
    ...    The Reports tab should be hidden.
    ...    
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen
    ...                 19/04/2025 - Tam Ho (Auto)

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-02     auto    CP-2.29.0
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id_abort]
    Include Aborted Study
    Manage Completed Studies On  row=1
    ${abort_message}    Verify Abort Message
    Run Keyword And Continue On Failure    Should Be Equal        ${abort_message}    This study has been aborted and will not be counted toward your billing.

BFCC-QA-STUDY-MGMT-REPORTS-03: Reports Tab-Verify Report Filters
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Report Filters
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1. Click on the report category dropdown and observe
    ...
    ...    Expected Results:
    ...    The dropdown should have 2 categories (Summary reports, Notification reports), and Summary Reports should be the default selection
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen
    ...                 19/04/2025 - Tam Ho (Auto)

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-03    CP-2.29.0    auto
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    ${default_report}    Verify Default Report
    Run Keyword And Continue On Failure    Should Be Equal    ${default_report}      Summary reports
    ${summary_report}  ${notification_report} =  Verify Report Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${summary_report}      Summary reports
    Run Keyword And Continue On Failure    Should Be Equal    ${notification_report}      Notification reports

BFCC-QA-STUDY-MGMT-REPORTS-04: Verify Report Fields in Summary Reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Report Fields in Summary Reports
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify that the following fields are displayed:
    ...    - Report ID
    ...    - Date of Service
    ...    - Time Monitored
    ...    - Generated by
    ...    - Status
    ...    - Last Modified
    ...    - Type
    ...    - Assignee
    ...    - New report status
    ...    - Action (Edit report)
    ...
    ...    Expected Results:
    ...    All required fields should be displayed.
    ...    Reports will be ordered in descending by Report ID by default. "EOU" types will always be listed first
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen
    ...                 10/05/2025 - Tam Ho

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-04     auto    CP-2.29.0
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    ${summary_reports}      Get Study Details Summary Reports
    ${report_ids}       Evaluate    [item['Report ID'] for item in ${summary_reports}]
    Run Keyword And Continue On Failure    Should Be Equal    ${report_ids}[0]    EoU
    ${reports_id_rest}     Evaluate    [item['Report ID'] for item in ${summary_reports}][1:]
    ${descending_report_id}  Evaluate    sorted(${reports_id_rest}, key=int, reverse=True)
    Run Keyword And Continue On Failure     Should Be Equal    ${reports_id_rest}    ${descending_report_id}

BFCC-QA-STUDY-MGMT-REPORTS-05: Summary Reports-Verify Report ID for EOU Reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Report ID for EOU Reports
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Identify EOU reports in the list.
    ...    3. Check if their Report ID is displayed as “EOU”.
    ...
    ...    Expected Results:
    ...    EOU reports should have the Report ID "EOU".
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen
    ...                 19/04/2025 - Tam Ho

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-05     auto    CP-2.29.0
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    ${summary_reports}      Get Study Details Summary Reports
    ${report_ids}       Evaluate    [item['Report ID'] for item in ${summary_reports}]
    ${types}=          Evaluate    [item['Type'] for item in ${summary_reports}]
    Run Keyword And Continue On Failure    Should Be Equal    ${types}[0]    End Of Use
    Run Keyword And Continue On Failure    Should Be Equal    ${report_ids}[0]    EoU

BFCC-QA-STUDY-MGMT-REPORTS-06: Summary Reports-Verify Artifact Report Displays Error Tag For Interim, EOU Reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Artifact Report Displays Error Tag For Interim, EOU Reports
    ...
    ...    Precondition: Interim, EOU report marked as "Artifact"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Check if 'error' tag is displayed next to Report ID
    ...    3. Hover over the 'error' tag.
    ...
    ...    Expected Results:
    ...    Tooltip with 'Report is marked as artifact' should appear.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-06     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-07: Summary Reports-Verify Generated By Field
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Generated By Field
    ...
    ...    Precondition: Interim, EOU reports created
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Check Generated by field for different reports (Fullname for call center user, 'Automatically' if system-generated).
    ...
    ...    Expected Results:
    ...    Correct value should be displayed based on creator.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-07     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-08: Summary Reports-Verify Report Status Field
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status Field
    ...
    ...    Precondition: Interim, EOU reports created
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify Report Status field shows one of (Generated, Not Generated, Dismissed, Sent, Ready).
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen
    ...                 10/05/2025 - Tam Ho

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-08     auto    CP-2.29.0
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    ${summary_reports}      Get Study Details Summary Reports
    ${report_statuses}       Evaluate    [item['Report Status'] for item in ${summary_reports}]
    ${valid_statuses}    Create List    Generated    Not Generated    Dismissed    Sent    Ready
    Should Be True    all(status in ${valid_statuses} for status in ${report_statuses})

BFCC-QA-STUDY-MGMT-REPORTS-09: Summary Reports-Verify Report Status "Not Generated" displayed properly for Interim reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Not Generated" displayed properly
    ...
    ...    Precondition:
    ...    - Interim report: A new manual or auto report have New Report Status "Running"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify Report Status field show "Not Generated"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-09     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-10: Summary Reports-Verify Report Status "Not Generated" displayed properly for EOU reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Not Generated" displayed properly
    ...
    ...    Precondition:
    ...    - EOU report has New Report Status "Running" or "Ready"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify Report Status field show "Not Generated"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-10    manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-11: Summary Reports-Verify Report Status "Generated" displayed properly for Interim reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Generated" displayed properly
    ...
    ...    Precondition:
    ...    - Interim report has New Report Status "Ready"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify Report Status field show "Generated"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-11     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-12: Summary Reports-Verify Report Status "Generated" displayed properly for EOU reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Generated" displayed properly
    ...
    ...    Precondition:
    ...    - EOU report has New Report Status "Ready" and the user copied report from AIRP page to Call Center portal
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify Report Status field show "Generated"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-12    manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-13: Summary Reports-Verify Report Status "Ready" displayed properly for Interim reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Ready" displayed properly
    ...
    ...    Precondition:
    ...    - Interim report has Report Status "Generated"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Go to Edit Report details page and mark as "Ready"
    ...    3. Verify Report Status field show "Ready"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-13     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-14: Summary Reports-Verify Report Status "Ready" displayed properly for EOU reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Ready" displayed properly
    ...
    ...    Precondition:
    ...    - EOU report has Report Status "Generated"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Go to Edit Report details page and mark as "Ready"
    ...    3. Verify Report Status field show "Ready"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-14     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-15: Summary Reports-Verify Report Status "Sent" displayed properly for Interim reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Sent" displayed properly
    ...
    ...    Precondition:
    ...    - Interim report has Report Status "Ready"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Go to Edit Report details page and perform Send report
    ...    3. Verify Report Status field show "Sent"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-15     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-16: Summary Reports-Verify Report Status "Sent" displayed properly for EOU reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Status "Ready" displayed properly
    ...
    ...    Precondition:
    ...    - EOU report has Report Status "Ready"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Go to Edit Report details page and perform Send report
    ...    3. Verify Report Status field show "Sent"
    ...
    ...    Expected Results:
    ...    Status should be correctly displayed.
    ...
    ...    **Others**
    ...    Update date: 03/03/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-16     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-17: Summary Reports-Verify Last Modified time displayed properly for EOU reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Last Modified time displayed properly for EOU reports
    ...
    ...    Precondition:
    ...    - EOU report has Report Status "Not Generated"
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Go to AIRP Portal and Copy EOU report to Call Center
    ...    3. Verify Last Modified
    ...
    ...    Expected Results:
    ...    The time shall be updated
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-17     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-18: Summary Reports-Verify Last Modified time displayed properly for Interim reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Last Modified time displayed properly for Interim reports
    ...
    ...    Precondition:
    ...    - An Interim report is created
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Go to AIRP Portal and generate Interim report
    ...    3. Verify Last Modified
    ...
    ...    Expected Results:
    ...    The time shall be updated
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-18     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-19: Summary Reports-Verify Assignee displayed for EOU/Interim reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Assignee displayed for EOU/Interim reports
    ...
    ...    Precondition:
    ...    - Leader or Supervisor assigned EOU and Interim report for an QA user
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify Assignee
    ...
    ...    Expected Results:
    ...    The assignee field shall display the name of QA users that have been assigned the reports.
    ...    The Assignee field shall display “You” in the case the reports have been assigned to the QA himself or herself
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-19     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-20: Summary Reports-Verify New report status displayed for EOU reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify New report status is Ready displayed for EOU reports
    ...
    ...    Precondition:
    ...
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify New report status of an EOU report
    ...
    ...    Expected Results:
    ...    - Status is Ready when report has been processed by AI already and View button shall be clickable
    ...    - Status is Running when report are being processed by AI
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-20     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-21: Summary Reports-Verify New report status displayed for Interim reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify New report status is Ready displayed for Interim reports
    ...
    ...    Precondition:
    ...
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Verify New report status of an Interim report
    ...
    ...    Expected Results:
    ...    - Status is Ready when report has been processed by AI already and View button shall be clickable
    ...    - Status is Running when report are being processed by AI
    ...    - Status is N/A when the report has been created before CP-2.29.0
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-21     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-22: Summary Reports-Verify Pagination working properly
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Pagination working properly
    ...
    ...    Precondition:
    ...    There are more than 10 reports in Summary report filter (Refer study 21071-super3/3#Monitoring3#)
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Click ">" or "Page#2" button
    ...    3. Click "<" or "Page#1" button
    ...
    ...    Expected Results:
    ...    Step 2: Navigate the user to page#2 of the list
    ...    Step 3: Navigate the user to page#1 of the list
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-22     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-23: Summary Reports-Can sort the report list by Report ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Pagination working properly
    ...
    ...    Precondition:
    ...    There are more than 10 reports in Summary report filter
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Click "Sort" button on Report ID
    ...    3. Continue to click "Sort" button on Report ID
    ...    4. Continue to click "Sort" button on Report ID
    ...
    ...    Expected Results:
    ...    Step 2: The list shall display in descending order by Report ID (EOU report first)
    ...    Step 3: The list shall display in ascending order by Report ID
    ...    Step 4: The list shall display in descending order by Report ID
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen
    ...                 06/14/2025 - Tam Ho

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-23     auto    CP-2.29.0
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    # sort descending by report id
    Sort Study Details Reports       Report ID       Report ID sort desc
    ${summary_reports}      Get Study Details Summary Reports
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${summary_reports}]
    Run Keyword And Continue On Failure    Should Be Equal    ${reports_id}[0]    EoU
    ${reports_id_rest}     Evaluate    [item['Report ID'] for item in ${summary_reports}][1:]
    ${descending_report_id}      Evaluate    sorted(${reports_id_rest}, key=int, reverse=True)
    Run Keyword And Continue On Failure     Should Be Equal    ${reports_id_rest}    ${descending_report_id}
    # sort ascending by report id
    Refresh Page
    Navigate Study Management Report Tab
    Sort Study Details Reports       Report ID       Report ID sort asc
    ${summary_reports}      Get Study Details Summary Reports
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${summary_reports}]
    ${reports_id_rest}     Evaluate    [item['Report ID'] for item in ${summary_reports}][:-1]
    ${ascending_report_id}      Evaluate    sorted(${reports_id_rest}, key=int)
    Run Keyword And Continue On Failure     Should Be Equal    ${reports_id_rest}    ${ascending_report_id}

BFCC-QA-STUDY-MGMT-REPORTS-24: Summary Reports-Can sort the report list by Last Modified
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Pagination working properly
    ...
    ...    Precondition:
    ...    There are more than 10 reports in Summary report filter
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Click "Sort" button on Last Modified
    ...    3. Continue to click "Sort" button on Last Modified
    ...    4. Continue to click "Sort" button on Last Modified
    ...
    ...    Expected Results:
    ...    Step 2: The list shall display in descending order by Last Modified
    ...    Step 3: The list shall display in ascending order by Last Modified
    ...    Step 4: The list shall display in descending order by Last Modified
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-24     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-25: Summary Reports-Can sort the report list by Report Status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Pagination working properly
    ...
    ...    Precondition:
    ...    There are more than 10 reports in Summary report filter
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Click "Sort" button on Report Status
    ...    3. Continue to click "Sort" button on Report Status
    ...    4. Continue to click "Sort" button on Report Status
    ...
    ...    Expected Results:
    ...    Step 2: The list shall display in descending order by Report Status
    ...    Step 3: The list shall display in ascending order by Report Status
    ...    Step 4: The list shall display in descending order by Report Status
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-25     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-26: Summary Reports-Can sort the report list by Type
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Pagination working properly
    ...
    ...    Precondition:
    ...    There are more than 10 reports in Summary report filter
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Click "Sort" button on Type
    ...    3. Continue to click "Sort" button on Type
    ...    4. Continue to click "Sort" button on Type
    ...
    ...    Expected Results:
    ...    Step 2: The list shall display in descending order by Type
    ...    Step 3: The list shall display in ascending order by Type
    ...    Step 4: The list shall display in descending order by Type
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-26     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-27: Summary Reports-Can sort the report list by Assignee
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Pagination working properly
    ...
    ...    Precondition:
    ...    There are more than 10 reports in Summary report filter
    ...
    ...    Test Steps:
    ...    1. Select Summary Reports.
    ...    2. Click "Sort" button on Assignee
    ...    3. Continue to click "Sort" button on Assignee
    ...    4. Continue to click "Sort" button on Assignee
    ...
    ...    Expected Results:
    ...    Step 2: The list shall display in descending order by Assignee
    ...    Step 3: The list shall display in ascending order by Assignee
    ...    Step 4: The list shall display in descending order by Assignee
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-27     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-28: Summary Reports-Verify Edit navigation by clicking on a row
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Verify that user can edit any report records on the table.
    ...
    ...    Precondition: The user is on Reports tab
    ...    Study has at least 1 Summary report
    ...    
    ...    Test Steps:
    ...    1.Select Summary Reports.
    ...    2.Click on edit button of Summary report
    ...
    ...
    ...    Expected Results: Navigate to the report edit page.
    ...
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-28     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-QA-STUDY-MGMT-REPORTS-29: Verify Report Fields in Notification Reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...    Description: Verify Report Fields in Notification Reports
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1. Select Notification Reports.
    ...    2. Verify that the following fields are displayed:
    ...    - Report ID
    ...    - Date of Service
    ...    - Status
    ...    - Last Modified
    ...    - Assignee
    ...    - Action (Edit report)
    ...
    ...    Expected Results:
    ...    All required fields should be displayed.
    ...
    ...    **Others**
    ...    Update date: 03/25/2025 - Nhan Nguyen
    ...                 05/17/2025 - Tam Ho (Auto)

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-29    CP-2.29.0     auto
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    Navigate Study Management Notification Report Tab
    ${notification_reports}      Get Study Details Notification Reports
    ${actual_header}       Evaluate    [k for k, v in ${notification_reports}[0].items()]
    ${expected_header}     Create List    Report ID    Date Of Service    Report Status    Last Modified    Assignee
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_header}      ${expected_header}

BFCC-QA-STUDY-MGMT-REPORTS-30: Notification Reports-Verify the display of Report ID
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Make sure the Report ID field is displayed.
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Verify that Report ID display correct number.
    ...
    ...    Expected Results:
    ...    Report ID displays correctly according to actual data.
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-30     manual    CP-2.29.0    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-31: Notification Reports-Verify Report Status display
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Check the display of statuses in the Report Status column.
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Verify Report Status field shows one of (Generated, Not Generated, Dismissed, Sent, Ready).
    ...
    ...    Expected Results:
    ...    Report Statuses displays correctly according to actual data.
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu
    ...                 05/17/2025 - Tam Ho (Auto)

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-31     auto    CP-2.29.0    R2
    Navigate To Studies
    Filter Studies    study_type=Completed    search_by=Study ID    text_search=${STUDY_ID_COMPLETED}[study_id]
    Manage Completed Studies On  row=1
    Navigate Study Management Report Tab
    Navigate Study Management Notification Report Tab
    ${notification_reports}      Get Study Details Notification Reports
    ${report_statuses}       Evaluate    [item['Report Status'] for item in ${notification_reports}]
    ${valid_statuses}    Create List    Generated    Not Generated    Dismissed    Sent    Ready
    Should Be True    all(status in ${valid_statuses} for status in ${report_statuses})

BFCC-QA-STUDY-MGMT-REPORTS-32: Notification Reports-Verify Date of Service field display for Notification reports
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Check the Date of Service format for Notification reports.
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Verify that field display correct format
    ...
    ...    Expected Results: Display in "From date - To date" format (eg: 02/01/2020 - 02/01/2020).
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-32     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-33: Notification Reports-Verify Date of Service field display for Event reports
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Check the Date of Service format for Event reports.
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Verify that field display correct format
    ...
    ...    Expected Results: Display the ‘event date’ and the ‘event time’. (Ex: 03/10/21, 03:33:22)
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-33     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-34: Notification Reports-Verify Last Modified field is displayed
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Check if the Last Modified field is displayed.
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Obverse display of Last Modified field.
    ...
    ...    Expected Results: The last modified date and time are displayed in the correct format (e.g. 04/09/2025 23:46:06 EDT).
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-34     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-35: Notification Reports-Verify Assignee display when assigned to other QA
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Check to display the assigned QA person name in the Assignee field.
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Obverse display of Assignee field.
    ...
    ...    Expected Results: QA person name is displayed correctly.
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-35     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-36: Notification Reports-Verify Assignee display when assigned to current user
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Check when the report is assigned to the logged in user.
    ...
    ...    Precondition: The user is on Reports tab
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Obverse display of Assignee field.
    ...
    ...    Expected Results: The Assignee field displays "You".
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-36     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-37: Notification Reports-Verify Edit navigation by clicking on a row
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Verify that user can edit any report records on the table.
    ...
    ...    Precondition: The user is on Reports tab
    ...    Study has at least 1 Notification or Event report
    ...
    ...    Test Steps:
    ...    1.Select Notification Reports.
    ...    2.Click on edit button of the reports
    ...
    ...    Expected Results: Navigate to the report edit page.
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-37     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-38: Notification Reports-Verify sorting by Report ID
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Ensure that clicking on the Report ID column header toggles the sorting of reports in ascending and descending numeric order.
    ...
    ...    Precondition: User is on the "Reports" tab and "Notification Reports" is selected.
    ...
    ...    Test Steps:
    ...    1.Navigate to the "Reports" tab.
    ...    2.In the report type dropdown, select Notification Reports.
    ...    3.Click on the "Report ID" column header once.
    ...    4.Observe the order of the Report IDs.
    ...    5.Click the "Report ID" column header again.
    ...    6.Observe the updated order.
    ...
    ...    Expected Results:
    ...    - Step 3: Report IDs are sorted in ascending order (e.g., 00001 → 00002 → 00009).
    ...    - Step 5: Report IDs are sorted in descending order (e.g., 00009 → 00002 → 00001).
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-38     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-39: Notification Reports-Verify sorting by Report Status
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Confirm that clicking the Report Status column header correctly sorts the reports by their status values in alphabetical order (A-Z and Z-A).
    ...
    ...    Precondition: User is on the "Reports" tab and "Notification Reports" is selected.
    ...
    ...    Test Steps:
    ...    1.Navigate to the "Reports" tab.
    ...    2.In the report type dropdown, select Notification Reports.
    ...    3.Click on the "Report Status" column header once.
    ...    4.Observe the order of the Report Statuses.
    ...    5.Click the "Report Status" column header again.
    ...    6.Observe the updated order.
    ...
    ...    Expected Results:
    ...    - Step 3: Statuses are sorted alphabetically ascending (e.g., Dismissed → Generated → Not Generated → Ready → Sent).
    ...    - Step 5: Statuses are sorted descending (e.g., Sent → Ready → Not Generated → Generated → Dismissed).
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-39     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-40: Notification Reports-Verify sorting by Last Modified
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Validate that clicking the Last Modified column toggles sorting by date and time of the report's last update, from earliest to latest and vice versa.
    ...
    ...    Precondition: User is on the "Reports" tab and "Notification Reports" is selected.
    ...
    ...    Test Steps:
    ...    1.Go to the "Reports" tab.
    ...    2.Choose Notification Reports in the dropdown.
    ...    3.Click on the "Last Modified" column header.
    ...    4.Note the order of timestamps.
    ...    5.Click the column header again.
    ...    6.Note the updated order.
    ...
    ...    Expected Results:
    ...    - Step 3: Reports are sorted from earliest to latest modification time.
    ...    - Step 5: Reports are sorted from latest to earliest modification time.
    ...    
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-40     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-REPORTS-41: Notification Reports-Verify sorting by Assignee
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Ensure that sorting by Assignee works alphabetically, and special cases like "You" are handled correctly.
    ...
    ...    Precondition: User is on the "Reports" tab and "Notification Reports" is selected.
    ...
    ...    Test Steps:
    ...    1.Open the "Reports" tab.
    ...    2.Select Notification Reports from the dropdown.
    ...    3.Click on the "Assignee" column header once.
    ...    4.Check the alphabetical order of assignee names.
    ...    5.Click the column header again.
    ...    6.Check the reversed order.
    ...
    ...    Expected Results:
    ...    - Step 3: Assignee names are sorted alphabetically A → Z, with "You" treated as per system logic (e.g., shown first or replaced with actual name for sorting).
    ...    - Step 5: Assignee names are sorted Z → A.
    ...
    ...    **Others**
    ...    Update date: 04/16/2025 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-REPORTS-41     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-UPDATE-FACILITY-NOTES-01: Making a note in a Facility Note section by clicking on the facility name in the study management page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-UPDATE-FACILITY-NOTES-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-UPDATE-FACILITY-NOTES-02: Making a note in a Facility Note section by clicking on the facility name in the Event Edit page
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-UPDATE-FACILITY-NOTES-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-GET-ECG-01: Can get a sample of ECG strip from a device
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-GET-ECG-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-RESEND-REFCODE-01: Resend the reference code in case the patient locates in the US
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-RESEND-REFCODE-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-RESEND-REFCODE-02: Resend the reference code in case the patient locates in the US and has the mail filled out
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-RESEND-REFCODE-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-RESEND-REFCODE-03: Resend the reference code in case the patient locates outside the US
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 01/22/2024 - Trinh Nguyen

    [Tags]  BFCC-QA-STUDY-MGMT-RESEND-REFCODE-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-DIAGNOSIS-01: View Diagnosis info
    [Documentation]     Author: Nhan Nguyen
    ...
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

    [Tags]  BFCC-QA-STUDY-MGMT-DIAGNOSIS-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-DIAGNOSIS-02: Diagnosis info - View default Afib Detected is turned on and disabled for patient has Afib diagnosis code
    [Documentation]     Author: Nhan Nguyen
    ...
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

    [Tags]  BFCC-QA-STUDY-MGMT-DIAGNOSIS-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-DIAGNOSIS-03: Diagnosis info - Turn on/Turn off Afib Detected setting
    [Documentation]     Author: Nhan Nguyen
    ...
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

    [Tags]  BFCC-QA-STUDY-MGMT-DIAGNOSIS-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-QA-STUDY-MGMT-ECG-VIEWER-01: View ECG viewer tab in active/completed studies
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure that "ECG Viewer" tab is visible in Study Management page for active or completed studies
    ...
    ...     Precondition: User is on STUDY MANAGEMENT page of an active/completed study
    ...
    ...     Test Steps:
    ...    1. Navigate to STUDY MANAGEMENT and select an eligible study
    ...    2. Observe that ECG tab is visible
    ...
    ...
    ...     Expected Results:
    ...    -  "ECG Viewer" tab is displayed next to "Events" tab
    ...     
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-02: HR Chart-Verify HR chart is displayed with default date and time range
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure that HR chart loads correctly by default
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Navigate to STUDY MANAGEMENT and select an eligible study
    ...    2. Click on “ECG Viewer” tab
    ...
    ...     Expected Results:
    ...    - HR chart is displayed with first day with available data selected, 2.5 minutes before and after the first minute with data is plotted
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-03: HR Chart-Verify date selection in HR chart
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure user can navigate to past/current dates only
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Click on date dropdown in HR chart → Attempt to select a future date
    ...
    ...     Expected Results:
    ...    - Only past and current dates can be selected, future dates are disabled
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-03    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-04: HR Chart-Verify Next/Previous date navigation
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure Next/Previous buttons allow navigating between available dates
    ...
    ...     Precondition:
    ...    1. User is on the ECG Viewer tab of the Study Management page
    ...    2. Study has more than one day of data
    ...
    ...     Test Steps:
    ...    1. Click "Next" / "Previous" date button
    ...
    ...     Expected Results:
    ...    - HR chart updates to corresponding date with data
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-05: HR Chart-Disable navigation buttons when study has only one day of data
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that both "Next" and "Previous" buttons are disabled if the study only contains data for one day
    ...
    ...     Precondition: Study is active or completed and has data only for one date
    ...
    ...     Test Steps:
    ...    1. Observe the "Next" and "Previous" buttons
    ...
    ...     Expected Results:
    ...    - Both buttons are disabled and cannot be clicked
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-05    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-06: HR Chart-Disable “Previous” on first study day
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the "Previous" button is disabled when viewing the first date in the study period
    ...
    ...     Precondition:
    ...    1. Study has more than one day of data
    ...    2. User is on ECG Viewer tab
    ...    3. Currently viewing the first date with available data
    ...
    ...     Test Steps:
    ...    1. Select the first date from the list
    ...    2. Observe the "Previous" button
    ...
    ...     Expected Results:
    ...    - "Previous" button is disabled and cannot be clicked
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-06    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-07: HR Chart-Disable “Next” on last study day
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the "Next" button is disabled when viewing the last date in the study period
    ...
    ...     Precondition:
    ...    1. Study has more than one day of data
    ...    2. User is on ECG Viewer tab
    ...    3. Currently viewing the last date with available data
    ...
    ...     Test Steps:
    ...    1. Select the last date from the list
    ...    2. Observe the "Next" button
    ...
    ...     Expected Results:
    ...    - "Next" button is disabled and cannot be clicked
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-07    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-08: HR Chart-Verify “Refresh” button functionality
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure Refresh reloads events and HR chart
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Click “Refresh” button
    ...
    ...     Expected Results:
    ...    - HR chart and Event list are reloaded
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-09: HR Chart-Verify “Show events indicator” checkbox default state
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure checkbox is selected by default and red lines are visible
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Observe “Show events indicator” checkbox
    ...
    ...     Expected Results:
    ...    - Checkbox is selected; red event indicators are visible in HR chart
    ...

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-10: HR Chart-Verify toggle of “Show events indicator” checkbox
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure toggling checkbox hides/shows event markers in HR chart
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Uncheck “Show events indicator” → Check again
    ...
    ...     Expected Results:
    ...    - Red lines disappear → Red lines reappear on HR chart
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-11: HR Chart-Verify zoom in/out on HR chart
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure user can zoom into chart and use Reset Zoom
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Click and drag area on HR chart → Click Reset Zoom
    ...
    ...     Expected Results:
    ...    - Chart zooms into selected range → Reset Zoom restores full view
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-12: HR Chart-HR chart zoom < 1 hour range is centered in 1-hour window
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when the user zooms into a time range less than 1 hour, the HR chart displays the selected range centered within a 1-hour window
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Drag to select a range on the HR chart that is less than 1 hour in duration
    ...    2. Observe the zoomed-in chart
    ...
    ...     Expected Results:
    ...    - HR chart displays a 1-hour window centered around the selected time range
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-12    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-13: HR Chart-HR chart zoom ≥ 1 hour shows full range
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when the user zooms into a time range equal to or greater than 1 hour, the HR chart displays the entire selected range without centering
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Drag to select a range on the HR chart that is equal to or greater than 1 hour in duration
    ...    2. Observe the zoomed-in chart
    ...
    ...     Expected Results:
    ...    - HR chart displays the full selected time range with no additional padding
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-13    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-14: HR Chart-Reset Zoom returns chart to default view
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when the Reset Zoom button is clicked, the HR chart returns to the default zoom level
    ...
    ...     Precondition: User is on the ECG Viewer tab of the Study Management page
    ...
    ...     Test Steps:
    ...    1. Click the “Reset Zoom” button
    ...    2. Observe the chart view
    ...
    ...     Expected Results:
    ...    - The HR chart resets to its default state (showing 2.5 minutes before and after the first minute with data)
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-14    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-15: HR Chart-Verify highlighted event areas in HR chart
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure events area is highlighted with color
    ...
    ...     Precondition: ECG Viewer tab is open with events available
    ...
    ...     Test Steps:
    ...    1. Observe chart regions with events
    ...
    ...     Expected Results:
    ...    1. Areas with events are highlighted
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-15    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-16: HR Chart-Verify no data area on HR chart
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure missing study data appears as 'no data' zones
    ...
    ...     Precondition: ECG Viewer tab is open for study with paused sections
    ...
    ...     Test Steps:
    ...    1. Observe chart regions without study data
    ...
    ...     Expected Results:
    ...    1. No data zones are clearly marked in HR chart
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-16    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-17: HR Chart-Verify hover tooltip in HR chart with Available data
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when hovering over a data point with available HR data, the tooltip displays correct timestamp and HR.
    ...
    ...     Precondition: User is on ECG Viewer tab, HR chart is loaded, and the point hovered has valid data.
    ...
    ...     Test Steps:
    ...    1. Navigate to ECG Viewer tab
    ...    2. Hover over a point on the HR chart with available data.
    ...
    ...     Expected Results: Tooltip displays "Timestamp (hh:mm) - Average heart rate (numeric value)"
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-17    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-18: HR Chart-Verify hover tooltip in HR chart with No data
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when hovering over a point with no available data, the tooltip shows 'No data'.
    ...
    ...     Precondition: User is on ECG Viewer tab, HR chart is loaded, and the hovered point has no data due to study pause or data gap.
    ...
    ...     Test Steps:
    ...    1. Navigate to ECG Viewer tab
    ...    2. Hover over a point on the HR chart where there is no data.
    ...
    ...     Expected Results: Tooltip displays "Timestamp (hh:mm) - Message (No data)"
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-18    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-19: HR Chart-Verify hover tooltip in HR chart with HR cannot be calculated data
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when hovering over a point where HR cannot be calculated, the tooltip displays 'NA'.
    ...
    ...     Precondition: User is on ECG Viewer tab, HR chart is loaded, and hovered point contains ECG noise or missing beat detection making HR uncalculable.
    ...
    ...     Test Steps:
    ...    1. Navigate to ECG Viewer tab
    ...    2. Hover over a point on the HR chart where HR = NA.
    ...
    ...     Expected Results: Tooltip displays "Timestamp (hh:mm) - Message (NA)"
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-19    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-QA-STUDY-MGMT-ECG-VIEWER-20: Event Information–Standard trigger time display
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when the selected time in HR chart is in the middle of the day, the displayed trigger time is about ±2.5 minutes and does not intersect the day.
    ...
    ...     Precondition: The user is in the ECG Viewer tab, which has HR data for the current day.
    ...
    ...     Test Steps:
    ...     1. Select any time in the HR chart that falls within the middle of the day (e.g. 10:00)
    ...     2. Observe the Trigger time section in Event Information
    ...
    ...     Expected Results:
    ...     1. Trigger time displays: 09:57:30 – 10:02:30
    ...     2. HR value: display correct min and max HR in this range
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-20    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-21: Event Information–Trigger time spans across to next day
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Check that when the time selected in the HR chart is near the end of the day (before 00:00), the system correctly processes the trigger time to the next day.
    ...
    ...     Precondition: The user in ECG Viewer tab, has continuous data between two days.
    ...
    ...     Test Steps:
    ...     1. Select the time in HR chart as 23:58:00
    ...     2. Observe the Trigger time section in Event Information
    ...
    ...     Expected Results:
    ...     1. Trigger time hiển thị: 23:55:30 – 00:00:30 (kéo qua ngày tiếp theo)
    ...     2. HR value: display correct min and max HR in this range
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-21    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-22: Event Information–Trigger time spans across to previous day
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Check when the time selected in HR chart is 00:01:00, trigger time must include data from the previous day.
    ...
    ...     Precondition: The user in ECG Viewer tab, has continuous data between two days.
    ...
    ...     Test Steps:
    ...     1. Select the time in HR chart as 00:01:00
    ...     2. Observe the Trigger time section in Event Information
    ...
    ...     Expected Results:
    ...     1. Trigger time displayed: 23:58:30 (previous day) – 00:03:30 (current day)
    ...     2. HR value: display correct min and max HR in this range
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-22    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-23: ECG Viewer-ECG Viewer shows 5-minute data preview
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure that ECG Viewer shows 5 minutes of data centered around selected trigger time
    ...
    ...     Precondition: 
    ...     1. The user in ECG Viewer tab
    ...     2. User has selected an event or time on HR chart
    ...
    ...     Test Steps:
    ...     1. Click on a point in HR chart or an event in Event list
    ...
    ...     Expected Results: ECG chart is shown with 2.5 mins before and after selected time; preview strip shows 5 minutes; speed = 25mm/s; gain = 10mm/mV
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-23    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-24: ECG Viewer-Use ECG Viewer Tools
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify all annotation tools (calipers, text, pattern, markers) work and cannot be saved
    ...
    ...     Precondition: The user in ECG Viewer tab
    ...
    ...     Test Steps:
    ...     1. Use tools: Horizontal/Vertical/Beat Calipers, Annotations, Mark 10/20 Sec, Mark Pattern, Add/Remove Beat Markers
    ...
    ...     Expected Results: Tools can be used and annotations shown, but not saved upon reload
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-24    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-25: ECG Viewer-Adjust ECG Settings
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify user can interact with chart settings: speed, gain, filters, grid, channel visibility, zoom
    ...
    ...     Precondition: The user in ECG Viewer tab
    ...
    ...     Test Steps:
    ...     1. Change speed, gain, enable filters, show/hide channels, toggle fine grid, zoom in/out
    ...
    ...     Expected Results: ECG chart updates in real time according to selected settings
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-25    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-26: ECG Viewer-Preview Channel Navigation
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify user can change preview channels and use them for navigation
    ...
    ...     Precondition: The user in ECG Viewer tab
    ...
    ...     Test Steps:
    ...     1. Click “Select Preview Channel” and navigate preview
    ...
    ...     Expected Results: ECG data updates according to selected preview channel
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-26    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-27: ECG Viewer-Beat Marker Interaction
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify beat markers can be shown/hidden and added/removed
    ...
    ...     Precondition: 
    ...     1. The user in ECG Viewer tab
    ...     2. ECG chart has beat markers
    ...
    ...     Test Steps:
    ...     1. Use “Hide Beat Markers”, add/remove beat marker
    ...
    ...     Expected Results: Markers respond as expected to user actions
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-27    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-28: Event section-Display All Manual Events
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that all patient manual events are listed regardless of symptoms and status
    ...
    ...     Precondition: 
    ...     1. The user in ECG Viewer tab
    ...     2. There has at least 1 event for the current day.
    ...
    ...     Test Steps:
    ...     1. View event list
    ...
    ...     Expected Results: All patient manual events are displayed (regardless of symptoms, opened/closed)
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-28    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-29: Event section-Filter Auto Manual Events
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify only valid and closed auto-generated manual events are listed
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. Some auto events are invalid or open
    ...
    ...     Test Steps:
    ...     1. View event list
    ...
    ...     Expected Results: Only valid and closed auto-generated manual events are displayed
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-29    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-30: Event section-Filter Auto Events
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that valid and closed auto events are shown
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. Some auto events are valid & closed
    ...
    ...     Test Steps:
    ...     1. View event list
    ...
    ...     Expected Results: Only valid & closed auto events are shown
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-30    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-31: Event section-Display Event Information
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that each event item displays required info
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. There has at least 1 event for the current day.
    ...
    ...     Test Steps:
    ...     1. View any event in the list
    ...
    ...     Expected Results: Each event displays: ID, Trigger time, Event type, Symptoms, Technician comment (max 2 rows)
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-31    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-32: Event section-Comment Truncation
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify technician comment is limited to 2 rows
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. Selected/Viewing event has a comment longer than 2 rows exists
    ...
    ...     Test Steps:
    ...     1. View comment in event list
    ...
    ...     Expected Results: Comment shows first 2 rows only, followed by “...***”
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-32    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-33: Event section-Tooltip on Long Comment
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify tooltip shows full comment when hovered
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. Selected/Viewing event has a comment longer than 2 rows exists
    ...
    ...     Test Steps:
    ...     1. Hover over the truncated comment
    ...
    ...     Expected Results: Full comment appears in a tooltip
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-33    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-34: Event section-Hover over the Event will shows "Open event" Button
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify “Open event” button is shown on hover
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. Event list displayed
    ...
    ...     Test Steps:
    ...     1. Hover over an event
    ...
    ...     Expected Results: “Open Event” button appears
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-34    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-35: Event section-Navigate to Event Details
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that clicking the "Open Event" button navigates to the Event Details page
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. Event list displayed
    ...
    ...     Test Steps:
    ...     1. Hover → Click “Event details” button
    ...
    ...     Expected Results: User is taken to “Event details” page
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-35    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-36: Event section-Highlight Selected Event in HR Chart
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify HR chart highlights event after clicking
    ...
    ...     Precondition:
    ...     1. The user in ECG Viewer tab
    ...     2. ECG Viewer and HR chart are visible
    ...
    ...     Test Steps:
    ...     1. Click on an event in the list
    ...
    ...     Expected Results: 
    ...     1. Event indicator in HR chart becomes bold
    ...     2. Event info panel is updated
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-36    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-QA-STUDY-MGMT-ECG-VIEWER-37: Event filter-Display Event Filter Dropdown
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify event filter dropdown is visible and default value is “All event type ({number of event})”
    ...
    ...     Precondition: The user in ECG Viewer tab
    ...
    ...     Test Steps:
    ...     1. Observe the event list header
    ...
    ...     Expected Results: Filter dropdown is displayed with default value = "All event type ({number of event})"
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-37    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-38: Event filter-Select Filter Option: "Brady"
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that selecting “Brady” filters the events
    ...
    ...     Precondition: ECG Viewer is open with events of different types
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select "Brady"
    ...
    ...     Expected Results: Event list only shows Brady events
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-38    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-39: Event filter-Select Filter Option: "Tachy"
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that selecting “Tachy” filters the events
    ...
    ...     Precondition: ECG Viewer is open with events of different types
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select "Tachy"
    ...
    ...     Expected Results: Event list only shows Tachy events
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-39    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-40: Event filter-Select Filter Option: "AFib"
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that selecting “AFib” filters the events
    ...
    ...     Precondition: ECG Viewer is open with events of different types
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select "AFib"
    ...
    ...     Expected Results: Event list only shows AFib events
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-40    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-41: Event filter-Select Filter Option: "Pause"
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that selecting “Pause” filters the events
    ...
    ...     Precondition: ECG Viewer is open with events of different types
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select "Pause"
    ...
    ...     Expected Results: Event list only shows Pause events
    ...
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-41    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-42: Event filter-Select Filter Option: "Auto"
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that selecting “Auto” filters the events
    ...
    ...     Precondition: ECG Viewer is open with events of different types
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select "Auto"
    ...
    ...     Expected Results: Event list only shows Auto events
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-42    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-QA-STUDY-MGMT-ECG-VIEWER-43: Event filter-Select Filter Option: "Sinus"
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that selecting “Sinus” filters the events
    ...
    ...     Precondition: ECG Viewer is open with events of different types
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select "Sinus"
    ...
    ...     Expected Results: Event list only shows Sinus events
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-43    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-44: Event filter-Select Filter Option: "Manual"
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that selecting “Manual” filters the events
    ...
    ...     Precondition: ECG Viewer is open with events of different types
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select "Manual"
    ...
    ...     Expected Results: Event list only shows Manual events
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-44    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-45: Event filter-No Event Available after Filter
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify behavior when no events match the selected filter
    ...
    ...     Precondition: ECG Viewer open but selected filter has no matching events
    ...
    ...     Test Steps:
    ...     1.Click filter dropdown
    ...     2.Select a filter type with no matching events
    ...
    ...     Expected Results: Event list is empty or displays message like "No events found"
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-45    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-STUDY-MGMT-ECG-VIEWER-46: Verify ECG Viewer tab is hidden for aborted studies
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Ensure tab is not shown if study is aborted
    ...
    ...     Precondition: User is on aborted study page
    ...
    ...     Test Steps:
    ...     1. Observe tab list
    ...
    ...     Expected Results: ECG Viewer tab is not displayed
    ...
    ...    **Others**
    ...     Update date: 04/22/2024 - Thanh Tieu

    [Tags]  BFCC-QA-STUDY-MGMT-ECG-VIEWER-46    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}          Start Browser
    Import Library           project_bioflux_callcenter_portal/lib/web/Common.py        ${BROWSER_NODE}     ${ENV}
    Import Library           project_bioflux_callcenter_portal/lib/web/Studies.py       ${BROWSER_NODE}     ${ENV}
    ${USERS}                 Get Config Param    NEW_USERS
    ${CURRENT_USER}          Set Variable        ${USERS}[callcenter_qa]
    ${STUDY_ID}              Get Config Param       STUDY_ID
    ${STUDY_ID_COMPLETED}    Set Variable        ${STUDY_ID}[study_id_completed]
    Set Global Variable      ${STUDY_ID_COMPLETED}
    ${RELEASE_VERSION}       Navigate To Callcenter Sign In Page
    ${TOKEN}                 Sign In Callcenter    username=${CURRENT_USER}[username]     password=${CURRENT_USER}[password]
    Set Suite Variable       ${TOKEN}
    Set Suite Metadata       version   ${RELEASE_VERSION}
    Set Suite Metadata       browser   ${BROWSER.capitalize()}


SUITE TEARDOWN
    Quit Browser
