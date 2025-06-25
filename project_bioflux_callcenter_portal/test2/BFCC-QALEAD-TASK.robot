*** Settings ***
Documentation   Test Suite - Call Center QA Leader Portal - Task page
Metadata    sid     BFCC-QALEAD-TASK
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Reports.py
Library     project_bioflux_callcenter_portal/lib/web/StudyManagement.py
Library     project_bioflux_callcenter_portal/lib/web/EventDetails.py
Library     project_bioflux_callcenter_portal/lib/web/Studies.py
Library     project_bioflux_callcenter_portal/lib/web/Task.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-QALEAD-TASK     web
Test Timeout    10m

*** Test Cases ***
BFCC-QALEAD-TASK-UNASSIGNED-01: View Notification reports subtab in Unassign tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The Call Center Supervisor and Call Center QA Leader can view and assign reports to Call Center QA users
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-01      auto
    [Setup]    Create Event Report Unassign
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${task_notification_report}     Get Unassigned Task
    ${task_study_id}        Evaluate    [item['Study ID'] for item in ${task_notification_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${task_notification_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${task_study_id}        ${study_id}

BFCC-QALEAD-TASK-UNASSIGNED-02: Assign a Notification reports to an assignee
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-02     auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${study_id_assigned}        Assign Unassigned Task On   assignee=QA Auto Leader    row=1
    ${study_id_assigned}    Set Variable        ${study_id_assigned}[0][Study ID]
    ${unassigned_notification_report}     Get Unassigned Task
    ${task_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_notification_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${task_study_id}    ${study_id_assigned}
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Notification reports      by_assignee=Assigned to you
    ${report_notification}      Get Ready Notification Reports
    ${notification_study_id}      Evaluate    [item.get('Study ID', None) for item in ${report_notification}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${notification_study_id}      ${study_id_assigned}
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id_assigned}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item['Assignee'] for item in ${study_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${assignees}       You
    Edit Report On    row=1
    Navigate To Event Tab      Event Report
    ${verify_active_action}         Check Active Event Report Available
    Run Keyword And Continue On Failure    Should Be True    ${verify_active_action}[Assigned]
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    ${study_id}        Evaluate    [item['Study ID'] for item in ${assigned_notification_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${study_id}     ${study_id_assigned}

BFCC-QALEAD-TASK-UNASSIGNED-03: Assign multiple Notification reports to an assignee
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-03     auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${study_id_assigned}     Assign Unassigned Task On   assignee=QA Auto Leader    row=1,2
    ${study_id_assigned}     Evaluate    [item['Study ID'] for item in ${study_id_assigned}]
    ${unassigned_notification_report}     Get Unassigned Task
    ${unassigned_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_notification_report}]
    # Check if all values in study_id_unassigned are not in study_id_assgined
    ${expected_unassigned_vs_assign}      Evaluate    all(value not in ${unassigned_study_id} for value in ${study_id_assigned})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_assign}
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    ${study_id}        Evaluate    [item['Study ID'] for item in ${assigned_notification_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${study_id}     ${study_id_assigned}

BFCC-QALEAD-TASK-UNASSIGNED-04: Check case the Call center QA Leader cannot assign tasks to the supervisor on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Task
#    Filter Task         task_type=Unassigned        by_report=Notification reports
#    ${unassigned_notification_report}     Get Unassigned Task
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_notification_report}
##    ${members}      Get Qa Team Members
#    Assign Unassigned Task On   assignee=QA Auto Leader    row=1      is_assignee=${False}
#    ${member_assign_task}       Get Team Members Assign Tasks
#    ${members_name}        Evaluate    [item['Name'] for item in ${member_assign_task}]
#    Run Keyword And Continue On Failure    List Should Not Contain Value    ${members_name}     Super QA 1

BFCC-QALEAD-TASK-UNASSIGNED-05: Check case the leader wants to assign the same study that another supervisor/leader is assigning on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-06: Quick access to Study information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-06      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    View Unassigned Task Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-QALEAD-TASK-UNASSIGNED-07: Quick access to Patient information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-07      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${unassigned_notification_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_notification_report}
    View Unassigned Task Patient Details On       row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-QALEAD-TASK-UNASSIGNED-08: Manually sort the report list by Study ID on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-08      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${unassigned_notification_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_notification_report}
    # sort descending
    Sort Unassigned Task     Study Id       desc
    ${notification_reports}     Get Unassigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${notification_reports}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Refresh Page
    Filter Task         task_type=Unassigned        by_report=Notification reports
    Sort Unassigned Task     Study Id       asc
    ${notification_reports}     Get Unassigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${notification_reports}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-QALEAD-TASK-UNASSIGNED-09: Manually sort the report list by Study Type on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-10: Manually sort the report list by Priority on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-11: Check pagination tool works properly on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-11      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-QALEAD-TASK-UNASSIGNED-12: View Interim reports sub-tab in Unassign tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The Call Center Supervisor and Call Center QA Leader can view and assign reports to Call Center QA users
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-12  CP-2.16.4       auto
    [Setup]    Create Interim Report Unassigned
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports       by_report_type=All reports
    ${task_interim_report}     Get Unassigned Task
    ${task_study_id}        Evaluate    [item['Study ID'] for item in ${task_interim_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${task_interim_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${task_study_id}        ${study_id}

BFCC-QALEAD-TASK-UNASSIGNED-13: Assign a reports to an assignee on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-13      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${study_id_assigned}        Assign Unassigned Task On   assignee=QA Auto Leader    row=1
    ${study_id_assigned}    Set Variable        ${study_id_assigned}[0][Study ID]
    ${unassigned_interim_report}     Get Unassigned Task
    ${task_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_interim_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${task_study_id}    ${study_id_assigned}
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=All
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_report}
    Filter Reports    search_by=Study ID     text_search=${study_id_assigned}
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_report}[0][Study ID]      ${study_id_assigned}
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_report}[0][Assignee]      You
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=Assigned to you
    ${interim_report}     Get Ready Interim Reports
    ${interim_study_id}        Evaluate    [item['Study ID'] for item in ${interim_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${interim_study_id}      ${study_id_assigned}
    Navigate to report screen with study id is "${study_id_assigned}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item['Assignee'] for item in ${study_report} if item.get('Type') == 'Interim']
    Run Keyword And Continue On Failure    List Should Contain Value    ${assignees}       You
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_notification_report}     Get Assigned Task
    ${study_id}        Evaluate    [item['Study ID'] for item in ${assigned_notification_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${study_id}     ${study_id_assigned}

BFCC-QALEAD-TASK-UNASSIGNED-14: Assign multiple reports to an assignee on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-14      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${study_id_assigned}     Assign Unassigned Task On   assignee=QA Auto Leader    row=1,2
    ${study_id_assigned}     Evaluate    [item['Study ID'] for item in ${study_id_assigned}]
    ${unassigned_interim_report}     Get Unassigned Task
    ${unassigned_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_interim_report}]
    # Check if all values in study_id_unassigned are not in study_id_assgined
    ${expected_unassigned_vs_assign}      Evaluate    all(value not in ${unassigned_study_id} for value in ${study_id_assigned})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_assign}
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_interim_report}     Get Assigned Task
    ${study_id}        Evaluate    [item['Study ID'] for item in ${assigned_interim_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${study_id}     ${study_id_assigned}

BFCC-QALEAD-TASK-UNASSIGNED-15: Check case the Call center QA Leader cannot assign tasks to the supervisor on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Task
#    Filter Task         task_type=Unassigned        by_report=Interim reports
#    ${unassigned_interim_report}     Get Unassigned Task
#    ${task_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_interim_report}]
##    ${members}      Get Qa Team Members
#    Assign Unassigned Task On   assignee=QA Auto Leader    row=1      is_assignee=${False}
#    ${member_assign_task}       Get Team Members Assign Tasks
#    ${members_name}        Evaluate    [item['Name'] for item in ${member_assign_task}]
#    Run Keyword And Continue On Failure    List Should Not Contain Value    ${members_name}     Super QA 1

BFCC-QALEAD-TASK-UNASSIGNED-16: Check case the leader wants to assign the same study that another supervisor/leader is assigning on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-17: Quick access to Study information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-17      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${unassigned_interim_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    View Unassigned Task Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-QALEAD-TASK-UNASSIGNED-18: Quick access to Patient information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-18      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${unassigned_interim_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    View Unassigned Task Patient Details On       row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-QALEAD-TASK-UNASSIGNED-19: Manually sort the report list by Study ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-19      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${unassigned_interim_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    # sort descending
    Sort Unassigned Task     Study Id       desc
    ${interim_report}     Get Unassigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_report}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Refresh Page
    Filter Task         task_type=Unassigned        by_report=Interim reports
    Sort Unassigned Task     Study Id       asc
    ${interim_report}     Get Unassigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_report}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-QALEAD-TASK-UNASSIGNED-20: Manually sort the report list by Report ID Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-20      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${unassigned_interim_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    # sort descending
    Sort Unassigned Task     Report Id       desc
    ${interim_report}     Get Unassigned Task
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${interim_report}]
    ${descending_reports_id}      Evaluate    sorted(${reports_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${reports_id}        ${descending_reports_id}
    # sort ascending
    Refresh Page
    Filter Task         task_type=Unassigned        by_report=Interim reports
    Sort Unassigned Task     Report Id       asc
    ${interim_report}     Get Unassigned Task
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${interim_report}]
    ${ascending_reports_id}      Evaluate    sorted(${reports_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${reports_id}        ${ascending_reports_id}

BFCC-QALEAD-TASK-UNASSIGNED-21: Manually sort the report list by Study Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-21      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-22: Manually sort the report list by Upload Time on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-22      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-23: View a list of Interim reports with “Report type: Artifact reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-23  CP-2.16.4       auto
    [Setup]    Unassign Multiple "Interim reports" Reports
    Create Interim Report Unassigned
    Mark Artifact Ready Interim Report    is_mark=${True}
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports       by_report_type=Artifact reports
    ${unassigned_interim_report}     Get Unassigned Task
    ${artifact_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_interim_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${artifact_study_id}     ${study_id}
    # check list Normal
    Refresh Page
    Filter Task        task_type=Unassigned        by_report=Interim reports     by_report_type=Normal reports
    ${unassigned_interim_report}     Get Unassigned Task
    ${normal_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_interim_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    # Check if all values in artifact_study_id are not in normal_study_id
    ${expected_report}      Evaluate    all(value not in ${artifact_study_id} for value in ${normal_study_id})
    Run Keyword And Continue On Failure    Should Be True    ${expected_report}
    # check list all
    Refresh Page
    Filter Task        task_type=Unassigned        by_report=Interim reports    by_report_type=All reports
    ${unassigned_interim_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    ${all_report}        Evaluate    [item['Study ID'] for item in ${unassigned_interim_report}]
    ${all_report}        Evaluate    sorted(${all_report}, key=int, reverse=True)
    ${combined_report}     Run Keyword And Continue On Failure     Combine Lists    ${artifact_study_id}     ${normal_study_id}
    ${combined_report}        Evaluate    sorted(${combined_report}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${all_report}       ${combined_report}

BFCC-QALEAD-TASK-UNASSIGNED-24-CP2.16.4: View a list of Interim reports with “Report type: Normal reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-24-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-25-CP2.16.4: View a list of Interim reports with “Report type: All reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-25-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-26: Check pagination tool works properly on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-26      auto
    Navigate To Task
    Filter Task        task_type=Unassigned        by_report=Interim reports    by_report_type=All reports
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-QALEAD-TASK-UNASSIGNED-27: View EOU reports subtab in Unassign tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The Call Center Supervisor and Call Center QA Leader can view and assign reports to Call Center QA users
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-27  CP-2.16.4       auto
    [Setup]    Create End Of Use Reports Unassigned With Study Id "${STUDY_ID_ASSIGN}[study_id_9]"
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports       by_report_type=All reports
    ${task_eou_report}     Get Unassigned Task
    ${unassigned_study_id}        Evaluate    [item['Study ID'] for item in ${task_eou_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${task_eou_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${unassigned_study_id}        ${study_id}

BFCC-QALEAD-TASK-UNASSIGNED-28: Assign a reports to an assignee on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-28     auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${study_id_assigned}    Assign Unassigned Task On   assignee=QA Auto Leader    row=1
    ${study_id_assigned}    Set Variable        ${study_id_assigned}[0][Study ID]
    ${unassigned_eou_report}     Get Unassigned Task
    ${unassigned_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${unassigned_study_id}    ${study_id_assigned}
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=All
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    Filter Reports    search_by=Study ID     text_search=${study_id_assigned}
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_report}[0][Study ID]      ${study_id_assigned}
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_report}[0][Assignee]      You
    Filter Reports    report_state=Ready        report_type=End of Use reports         by_assignee=Assigned to you
    ${eou_report}     Get Ready Eou Reports
    ${eou_study_id}        Evaluate    [item['Study ID'] for item in ${eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}      ${study_id_assigned}
    Navigate to report screen with study id is "${study_id_assigned}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item['Assignee'] for item in ${study_report} if item.get('Type') == 'End Of Use']
    Run Keyword And Continue On Failure    List Should Contain Value    ${assignees}       You
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${assigned_eou_report}     Get Assigned Task
    ${study_id}        Evaluate    [item['Study ID'] for item in ${assigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${study_id}     ${study_id_assigned}

BFCC-QALEAD-TASK-UNASSIGNED-29: Assign multiple reports to an assignee on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-29      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${study_id_assigned}     Assign Unassigned Task On   assignee=QA Auto Leader    row=1,2
    ${study_id_assigned}     Evaluate    [item['Study ID'] for item in ${study_id_assigned}]
    ${unassigned_eou_report}     Get Unassigned Task
    ${unassigned_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_eou_report}]
    # Check if all values in study_id_assigned are not in unassigned_study_id
    ${expected_report}      Evaluate    all(value not in ${unassigned_study_id} for value in ${study_id_assigned})
    Run Keyword And Continue On Failure    Should Be True    ${expected_report}
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${assigned_eou_report}     Get Assigned Task
    ${study_id}        Evaluate    [item['Study ID'] for item in ${assigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${study_id}     ${study_id_assigned}

BFCC-QALEAD-TASK-UNASSIGNED-30: Check case the Call center QA Leader cannot assign tasks to the supervisor on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-30      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-31: Check case the leader wants to assign the same study that another supervisor/leader is assigning on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-31      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-32: Quick access to Study information on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-32      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${unassigned_eou_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    View Unassigned Task Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-QALEAD-TASK-UNASSIGNED-33: Quick access to Patient information on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-33      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${unassigned_eou_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    View Unassigned Task Patient Details On       row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-QALEAD-TASK-UNASSIGNED-34: Manually sort the report list by Study ID on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-34      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${unassigned_eou_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    # sort descending
    Sort Unassigned Task     Study Id       desc
    ${eou_report}     Get Unassigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Refresh Page
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    Sort Unassigned Task     Study Id       asc
    ${eou_report}     Get Unassigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-QALEAD-TASK-UNASSIGNED-35: Manually sort the report list by Study Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-35      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-36: Manually sort the report list by Upload Time on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-36      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-37: View a list of EOU reports with “Report type: Artifact reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-37       auto
    [Setup]     Unassign Multiple "End of Use reports" Reports
    Create End Of Use Reports Unassigned With Study Id "${STUDY_ID_ASSIGN}[study_id_9]"
    Mark Artifact Ready Interim Report    is_mark=${True}
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports       by_report_type=Artifact reports
    ${unassigned_eou_report}     Get Unassigned Task
    ${artifact_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_eou_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${artifact_study_id}     ${study_id}
    # check list Normal
    Refresh Page
    Filter Task        task_type=Unassigned        by_report=End of Use reports     by_report_type=Normal reports
    ${unassigned_eou_report}     Get Unassigned Task
    ${normal_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_eou_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    # Check if all values in artifact_study_id are not in normal_study_id
    ${expected_report}      Evaluate    all(value not in ${artifact_study_id} for value in ${normal_study_id})
    Run Keyword And Continue On Failure    Should Be True    ${expected_report}
    # check list all
    Refresh Page
    Filter Task        task_type=Unassigned        by_report=End of Use reports    by_report_type=All reports
    ${unassigned_eou_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    ${all_report}        Evaluate    [item['Study ID'] for item in ${unassigned_eou_report}]
    ${all_report}        Evaluate    sorted(${all_report}, key=int, reverse=True)
    ${combined_report}     Run Keyword And Continue On Failure     Combine Lists    ${artifact_study_id}     ${normal_study_id}
    ${combined_report}        Evaluate    sorted(${combined_report}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${all_report}       ${combined_report}

BFCC-QALEAD-TASK-UNASSIGNED-38-CP2.16.4: View a list of EOU reports with “Report type: Normal reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-38-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-39-CP2.16.4: View a list of EOU reports with “Report type: All reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-39-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-UNASSIGNED-40: Check pagination tool works properly on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-UNASSIGNED-40      auto
    Navigate To Task
    Filter Task        task_type=Unassigned        by_report=End of Use reports    by_report_type=All reports
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-QALEAD-TASK-ASSIGNED-01: View Notification reports subtab in Assigned tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The Call Center Supervisor and Call Center QA Leader can view and assign reports to Call Center QA users
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-01      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    Assign Unassigned Task On   assignee=QA Auto Leader    row=1,2
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    ${assignee}     Evaluate    [item['Assignee'] for item in ${assigned_notification_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${assignee}     ''

BFCC-QALEAD-TASK-ASSIGNED-02: Unassign one assignee on the Notification report sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-02      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${study_id_assigned}        Unassign Assigned Task On       row=1
    ${study_id_assigned}        Set Variable    ${study_id_assigned}[0][Study ID]
    ${assigned_notification_report}     Get Assigned Task
    ${assigned_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_notification_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${assigned_study_id}    ${study_id_assigned}
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Notification reports      by_assignee=Assigned to you
    ${report_notification}      Get Ready Notification Reports
    ${notification_study_id}      Evaluate    [item.get('Study ID', None) for item in ${report_notification}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${notification_study_id}      ${study_id_assigned}
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id_assigned}"
    # Need to coding again
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item['Assignee'] for item in ${study_report}]
    Run Keyword And Continue On Failure    Length Should Be    ${assignees}     1
    Edit Report On    row=1
    Navigate To Event Tab      Event Report
    ${verify_active_action}         Check Active Event Report Available
    Run Keyword And Continue On Failure    Should Not Be True    ${verify_active_action}[Assigned]

BFCC-QALEAD-TASK-ASSIGNED-03: Unassign multiple assignees on the Notification report sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-03      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    Assign Unassigned Task On   assignee=QA Auto Leader    row=1,2
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    ${study_id_assigned}        Unassign Assigned Task On       row=1, 2
    ${study_id_assigned}        Evaluate    [item['Study ID'] for item in ${study_id_assigned}]
    ${assigned_notification_report}     Get Assigned Task
     # Check if all values in study_id_unassigned are not in study_id_assgined
    ${expected_unassigned_vs_assign}      Evaluate    all(value not in ${study_id_assigned} for value in ${assigned_notification_report})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_assign}
    # Check if all values in study_id_unassigned are in study_id_all
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${unassigned_notification_report}     Get Unassigned Task
    ${unassigned_notification_report}        Evaluate    [item['Study ID'] for item in ${unassigned_notification_report}]
    ${expected_unassigned_vs_all}      Evaluate    all(value in ${unassigned_notification_report} for value in ${study_id_assigned})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_all}

BFCC-QALEAD-TASK-ASSIGNED-04: Check case the Call center QA Leader cannot unassign tasks to the supervisor on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-05: Check case the leader wants to unassign the same study that another supervisor/leader is unassigning on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-06: Change the assignee by selecting another QA user from the assignee dropdown list on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-06    auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Notification reports
    ${unassigned_study_id}     Assign Unassigned Task On   assignee=QA Auto Leader    row=1
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    ${assigned_study_id}        Change Assignee Assigned Task On     assignee=CCQA QA01   row=1
    ${assigned_study_id}        Set Variable    ${assigned_study_id}[0][Study ID]
    ${assigned_notification_report}     Get Assigned Task
    ${assigned_name}        Evaluate    [item['Assignee'].split('|')[-1].strip() for item in ${assigned_notification_report} if item['Study ID'] == '${assigned_study_id}']
    Run Keyword And Continue On Failure    Should Be Equal    ${assigned_name}[0]      CCQA QA01
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${assigned_study_id}"
    ${reports}       Get Study Reports
    ${reports_assignee}       Evaluate    [item['Assignee'] for item in ${reports}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${reports_assignee}        CCQA QA01
    Filter Study Reports        text_search=${reports}[0][Report ID]
    Edit Report On    row=1
    Navigate To Event Tab    Event Report
    ${assigned_check}       Check Active Event Report Available
    Run Keyword And Continue On Failure    Should Be True    ${assigned_check}[Assigned]

BFCC-QALEAD-TASK-ASSIGNED-07: Quick access to Study information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-07      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    View Assigned Task Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-QALEAD-TASK-ASSIGNED-08: Quick access to Patient information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-08      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    View Assigned Task Patient Details On       row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-QALEAD-TASK-ASSIGNED-09: Manually sort the report list by Study ID on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-09      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    # sort descending
    Sort Assigned Task  Study Id       desc
    ${notification_reports}    Get Assigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${notification_reports}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Filter Task         task_type=Assigned        by_report=Notification reports
    Sort Assigned Task     Study Id       asc
    ${notification_reports}     Get Assigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${notification_reports}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-QALEAD-TASK-ASSIGNED-10: Manually sort the report list by Study Type on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-11: Manually sort the report list by Priority on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-12: Check pagination tool works properly on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-12      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Notification reports
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Assigned Task
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Assigned Task
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50
    [Teardown]    Unassign Multiple "Notification reports" Reports

BFCC-QALEAD-TASK-ASSIGNED-13: View Interim reports sub-tab in Assigned tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The Call Center Supervisor and Call Center QA Leader can view and assign reports to Call Center QA users
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-13       auto
    [Setup]    Create Interim Report Unassigned
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports       by_report_type=All reports
    ${task_interim_report}     Get Unassigned Task
    ${task_study_id}        Evaluate    [item['Study ID'] for item in ${task_interim_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${task_interim_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${task_study_id}        ${study_id}
    Assign Unassigned Task On   assignee=QA Auto Leader    row=1
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    ${assignee}     Evaluate    [item['Assignee'] for item in ${assigned_notification_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${assignee}     ''

BFCC-QALEAD-TASK-ASSIGNED-14: Unassign a reports to an unassigned on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-14      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${expected_study_id}     Unassign Assigned Task On      row=1
    ${expected_study_id}     Set Variable    ${expected_study_id}[0][Study ID]
    ${assigned_interim_report}     Get Assigned Task
    ${assigned_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_interim_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${assigned_study_id}     ${expected_study_id}
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${unassigned_interim_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    ${studies_id}          Evaluate       [item['Study ID'] for item in ${unassigned_interim_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${studies_id}       ${expected_study_id}
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=Unassigned
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_report}
    ${interim_report_id}          Evaluate        [item['Study ID'] for item in ${interim_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${interim_report_id}       ${expected_study_id}
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=Assigned to you
    ${interim_report}     Get Ready Eou Reports
    ${interim_report_id}          Evaluate        [item['Study ID'] for item in ${interim_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${interim_report_id}       ${expected_study_id}
    Navigate To Report Screen With Study Id Is "${expected_study_id}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item for item in ${study_report} if item.get('Type') == 'Interim']
    Run Keyword And Continue On Failure    Should Be Empty    ${assignees}[0][Assignee]
    Edit Report On    row=1
    ${verify_active_action}         Check Active Assignee Available
    Run Keyword And Continue On Failure    Should Not Be True    ${verify_active_action}[Assigned]

BFCC-QALEAD-TASK-ASSIGNED-15: Unassign multiple reports to an unassignee on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-15     auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    Assign Unassigned Task On   assignee=QA Auto Leader    row=1, 2
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${expected_study_id}     Unassign Assigned Task On      row=1,2
    ${expected_study_id}     Evaluate    [item['Study ID'] for item in ${expected_study_id}]
    ${assigned_interim_report}     Get Assigned Task
    ${assigned_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_interim_report}]
    # Check if all values in artifact_study_id are not in normal_study_id
    ${expected_report}      Evaluate    all(value not in ${assigned_study_id} for value in ${expected_study_id})
    Run Keyword And Continue On Failure    Should Be True    ${expected_report}
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${unassigned_eou_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    ${studies_id}          Evaluate       [item['Study ID'] for item in ${unassigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${studies_id}       ${expected_study_id}

BFCC-QALEAD-TASK-ASSIGNED-16: Check case the Call center QA Leader cannot assign tasks to the supervisor on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-17: Check case the leader wants to assign the same study that another supervisor/leader is assigning on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-18: Change the assignee by selecting another QA user from the assignee dropdown list on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-18      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports
    ${unassigned_study_id}     Assign Unassigned Task On   assignee=QA Auto Leader    row=1
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    ${assigned_study_id}        Change Assignee Assigned Task On     assignee=CCQA QA01   row=1
    ${assigned_study_id}        Set Variable    ${assigned_study_id}[0][Study ID]
    ${assigned_notification_report}     Get Assigned Task
    ${assigned_name}        Evaluate    [item['Assignee'].split('|')[-1].strip() for item in ${assigned_notification_report} if item['Study ID'] == '${assigned_study_id}']
    Run Keyword And Continue On Failure    Should Be Equal    ${assigned_name}[0]      CCQA QA01
    Navigate To Report Screen With Study Id Is "${assigned_study_id}"
    ${reports}       Get Study Reports
    ${reports_assginee}       Evaluate    [item['Assignee'] for item in ${reports}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${reports_assginee}        CCQA QA01
    ${report_id}            Evaluate    [item['Report ID'] for item in ${reports} if item.get('Type') == 'Interim']
    Filter Study Reports        text_search=${report_id}[0]
    Edit Report On    row=1
    Navigate To Event Tab    PDF Report
    ${assigned_check}       Check Active Assignee Available
    Run Keyword And Continue On Failure    Should Be True    ${assigned_check}[Assigned]

BFCC-QALEAD-TASK-ASSIGNED-19: Quick access to Study information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-19      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_interim_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_interim_report}
    View Assigned Task Study Information On  row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-QALEAD-TASK-ASSIGNED-20: Quick access to Patient information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-20      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_interim_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_interim_report}
    View Assigned Task Patient Details On      row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-QALEAD-TASK-ASSIGNED-21: Manually sort the report list by Study ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-21     auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_interim_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_interim_report}
    # sort descending
    Sort Assigned Task    Study Id       desc
    ${interim_report}     Get Assigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_report}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Refresh Page
    Filter Task         task_type=Assigned        by_report=Interim reports
    Sort Assigned Task     Study Id       asc
    ${interim_report}     Get Assigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_report}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-QALEAD-TASK-ASSIGNED-22: Manually sort the report list by Report ID Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-22      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=Interim reports
    ${assigned_interim_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_interim_report}
    # sort descending
    Sort Assigned Task     Report Id       desc
    ${interim_report}     Get Assigned Task
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${interim_report}]
    ${descending_reports_id}      Evaluate    sorted(${reports_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${reports_id}        ${descending_reports_id}
    # sort ascending
    Refresh Page
    Filter Task         task_type=Assigned        by_report=Interim reports
    Sort Assigned Task     Report Id       asc
    ${interim_report}     Get Assigned Task
    ${reports_id}       Evaluate    [item['Report ID'] for item in ${interim_report}]
    ${ascending_reports_id}      Evaluate    sorted(${reports_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${reports_id}        ${ascending_reports_id}

BFCC-QALEAD-TASK-ASSIGNED-23: Manually sort the report list by Study Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-23      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-24: Manually sort the report list by Upload Time on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-24      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-25: View a list of Interim reports with “Report type: Artifact reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-25       auto
    [Setup]    Unassign Multiple "Interim reports" Reports
    Create Interim Report Unassigned
    Mark Artifact Ready Interim Report    is_mark=${True}
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=Interim reports       by_report_type=Artifact reports
    ${unassigned_interim_report}     Get Unassigned Task
    ${artifact_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_interim_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_interim_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${artifact_study_id}     ${study_id}
    Assign To Me Ready Interim Reports By    assignee=QA Auto Leader      study_id=${study_id}
    # check artifact
    Filter Task        task_type=Assigned        by_report=Interim reports     by_report_type=Artifact reports
    ${assigned_interim_report}     Get Assigned Task
    ${artifact_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_interim_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${artifact_study_id}        ${study_id}
    # check list Normal
    Filter Task        task_type=Assigned        by_report=Interim reports     by_report_type=Normal reports
    ${assigned_interim_report}     Get Assigned Task
    ${normal_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_interim_report}]
    # Check if all values in artifact_study_id are not in normal_study_id
    ${expected_report}      Evaluate    all(value not in ${artifact_study_id} for value in ${normal_study_id})
    Run Keyword And Continue On Failure    Should Be True    ${expected_report}
    # check list all
    Filter Task        task_type=Assigned        by_report=Interim reports    by_report_type=All reports
    ${assigned_interim_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_interim_report}
    ${all_report}        Evaluate    [item['Study ID'] for item in ${assigned_interim_report}]
    ${all_report}        Evaluate    sorted(${all_report}, key=int, reverse=True)
    ${combined_report}     Run Keyword And Continue On Failure     Combine Lists    ${artifact_study_id}     ${normal_study_id}
    ${combined_report}        Evaluate    sorted(${combined_report}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${all_report}       ${combined_report}

BFCC-QALEAD-TASK-ASSIGNED-26-CP2.16.4: View a list of Interim reports with “Report type: Normal reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-26-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-27-CP2.16.4: View a list of Interim reports with “Report type: All reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-27-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-28: Check pagination tool works properly on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-28      auto
    Navigate To Task
    Filter Task        task_type=Assigned        by_report=Interim reports    by_report_type=All reports
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}
    [Teardown]    Unassign Multiple "Interim reports" Reports

BFCC-QALEAD-TASK-ASSIGNED-29: View EOU reports subtab in Assign tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The Call Center Supervisor and Call Center QA Leader can view and assign reports to Call Center QA users
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-29    CP-2.16.4        auto
#    [Setup]    Create End Of Use Reports Unassigned With Study Id "${STUDY_ID_ASSIGN}[study_id_9]"
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports       by_report_type=All reports
    ${task_eou_report}     Get Unassigned Task On Page
    ${unassigned_study_id}        Evaluate    [item['Study ID'] for item in ${task_eou_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${task_eou_report}
    Assign To Me Ready Interim Reports By     assignee=QA Auto Leader     row=1
    Filter Task         task_type=Assigned        by_report=End of Use reports       by_report_type=All reports
    ${task_eou_report}     Get Assigned Task
    ${assigned_study_id}        Evaluate    [item['Study ID'] for item in ${task_eou_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${task_eou_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${assigned_study_id}        ${unassigned_study_id}[0]

BFCC-QALEAD-TASK-ASSIGNED-30: Unassign a reports to an unassignee on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-30      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${expected_study_id}     Unassign Assigned Task On      row=1
    ${expected_study_id}     Set Variable    ${expected_study_id}[0][Study ID]
    ${assigned_eou_report}     Get Assigned Task
    ${assigned_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${assigned_study_id}     ${expected_study_id}
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${unassigned_eou_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    ${studies_id}          Evaluate       [item['Study ID'] for item in ${unassigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${studies_id}       ${expected_study_id}
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=Unassigned
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    ${eou_report_id}          Evaluate        [item['Study ID'] for item in ${eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_report_id}       ${expected_study_id}
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=Assigned to you
    ${eou_report}     Get Ready Eou Reports
    ${eou_report_id}          Evaluate        [item['Study ID'] for item in ${eou_report}]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${eou_report_id}       ${expected_study_id}
    Navigate To Report Screen With Study Id Is "${expected_study_id}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item for item in ${study_report} if item.get('Type') == 'End Of Use']
    Run Keyword And Continue On Failure    Should Be Empty    ${assignees}[0][Assignee]
    Edit Report On    row=1
    ${verify_active_action}         Check Active Assignee Available
    Run Keyword And Continue On Failure    Should Not Be True    ${verify_active_action}[Assigned]

BFCC-QALEAD-TASK-ASSIGNED-31: Unassign multiple reports to an unassignee on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-31        auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${unassigned_study_id}     Assign Unassigned Task On   assignee=QA Auto Leader    row=1, 2
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${expected_study_id}     Unassign Assigned Task On      row=1,2
    ${expected_study_id}     Evaluate    [item['Study ID'] for item in ${expected_study_id}]
    ${assigned_eou_report}     Get Assigned Task
    ${assigned_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_eou_report}]
    # Check if all values in artifact_study_id are not in normal_study_id
    ${expected_report}      Evaluate    all(value not in ${assigned_study_id} for value in ${expected_study_id})
    Run Keyword And Continue On Failure    Should Be True    ${expected_report}
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${unassigned_eou_report}     Get Unassigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    ${studies_id}          Evaluate       [item['Study ID'] for item in ${unassigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${studies_id}       ${expected_study_id}

BFCC-QALEAD-TASK-ASSIGNED-32: Check case the Call center QA Leader cannot assign tasks to the supervisor on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-32      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-33: Check case the leader wants to assign the same study that another supervisor/leader is assigning on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-33      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-34: Change the assignee by selecting another QA user from the assignee dropdown list on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-34      auto
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports
    ${unassigned_study_id}     Assign Unassigned Task On   assignee=QA Auto Leader    row=1
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${assigned_notification_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_notification_report}
    ${assigned_study_id}        Change Assignee Assigned Task On     assignee=CCQA QA01   row=1
    ${assigned_study_id}        Set Variable    ${assigned_study_id}[0][Study ID]
    ${assigned_notification_report}     Get Assigned Task
    ${assigned_name}        Evaluate    [item['Assignee'].split('|')[-1].strip() for item in ${assigned_notification_report} if item['Study ID'] == '${assigned_study_id}']
    Run Keyword And Continue On Failure    Should Be Equal    ${assigned_name}[0]      CCQA QA01
    Navigate To Report Screen With Study Id Is "${assigned_study_id}"
    ${reports}       Get Study Reports
    ${reports}       Evaluate    [item['Assignee'] for item in ${reports}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${reports}        CCQA QA01
    Edit Report On    row=1
    ${assigned_check}       Check Active Assignee Available
    Run Keyword And Continue On Failure    Should Be True    ${assigned_check}[Assigned]

BFCC-QALEAD-TASK-ASSIGNED-35: Quick access to Study information on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-35      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${assigned_eou_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_eou_report}
    View Assigned Task Study Information On  row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-QALEAD-TASK-ASSIGNED-36: Quick access to Patient information on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-36      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${assigned_eou_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_eou_report}
    View Assigned Task Patient Details On      row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-QALEAD-TASK-ASSIGNED-37: Manually sort the report list by Study ID on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-37      auto
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=End of Use reports
    ${assigned_eou_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_eou_report}
    # sort descending
    Sort Assigned Task    Study Id       desc
    ${eou_report}     Get Assigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Refresh Page
    Filter Task         task_type=Assigned        by_report=End of Use reports
    Sort Assigned Task     Study Id       asc
    ${eou_report}     Get Assigned Task
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-QALEAD-TASK-ASSIGNED-38: Manually sort the report list by Study Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-38      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-39: Manually sort the report list by Upload Time on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-39      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-40: View a list of EOU reports with “Report type: Artifact reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-40  CP-2.16.4       auto
    [Setup]    Unassign Multiple "End of Use reports" Reports
    Create End Of Use Reports Unassigned With Study Id "${STUDY_ID_ASSIGN}[study_id_9]"
    Mark Artifact Ready Interim Report    is_mark=${True}
    Navigate To Task
    Filter Task         task_type=Unassigned        by_report=End of Use reports       by_report_type=Artifact reports
    ${unassigned_eou_report}     Get Unassigned Task
    ${artifact_study_id}        Evaluate    [item['Study ID'] for item in ${unassigned_eou_report}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${unassigned_eou_report}
    Run Keyword And Continue On Failure    List Should Contain Value    ${artifact_study_id}     ${study_id}
    Assign To Me Ready Interim Reports By    assignee=QA Auto Leader      study_id=${study_id}
    # check artifact
    Filter Task        task_type=Assigned        by_report=End of Use reports     by_report_type=Artifact reports
    ${assigned_eou_report}     Get Assigned Task
    ${artifact_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${artifact_study_id}        ${study_id}
    # check list Normal
    Filter Task        task_type=Assigned        by_report=End of Use reports     by_report_type=Normal reports
    ${assigned_eou_report}     Get Assigned Task
    ${normal_study_id}        Evaluate    [item['Study ID'] for item in ${assigned_eou_report}]
    # Check if all values in artifact_study_id are not in normal_study_id
    ${expected_report}      Evaluate    all(value not in ${artifact_study_id} for value in ${normal_study_id})
    Run Keyword And Continue On Failure    Should Be True    ${expected_report}
    # check list all
    Filter Task        task_type=Assigned        by_report=End of Use reports    by_report_type=All reports
    ${assigned_eou_report}     Get Assigned Task
    Run Keyword And Continue On Failure    Should Not Be Empty    ${assigned_eou_report}
    ${all_report}        Evaluate    [item['Study ID'] for item in ${assigned_eou_report}]
    ${all_report}        Evaluate    sorted(${all_report}, key=int, reverse=True)
    ${combined_report}     Run Keyword And Continue On Failure     Combine Lists    ${artifact_study_id}     ${normal_study_id}
    ${combined_report}        Evaluate    sorted(${combined_report}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${all_report}       ${combined_report}

BFCC-QALEAD-TASK-ASSIGNED-41-CP2.16.4: View a list of EOU reports with “Report type: Normal reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-41-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-42-CP2.16.4: View a list of EOU reports with “Report type: All reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-42-CP2.16.4  CP-2.16.4       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QALEAD-TASK-ASSIGNED-43: Check pagination tool works properly on EOU reports sub-tab
    [Documentation]     Author: Trinh Nguyen
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
    ...     **Others**
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QALEAD-TASK-ASSIGNED-43      auto
    Navigate To Task
    Filter Task        task_type=Assigned        by_report=End of Use reports    by_report_type=All reports
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}
    [Teardown]    Unassign Multiple "End of Use reports" Reports

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Reports.py           ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/StudyManagement.py   ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Studies.py           ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Task.py              ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${STUDY_ID}          Get Config Param    STUDY_ID
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_qaleader]
    ${STUDY_ID_ASSIGN}   Set Variable        ${STUDY_ID}[study_id_completed]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Global Variable  ${STUDY_ID_ASSIGN}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Create event report unassign
    Navigate To Studies
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Ready
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Navigate to report screen has the notification reports with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports

Unassign Multiple "${task_name_report}" Reports
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=${task_name_report}
    ${assigned_report}     Get Assigned Task
    Run Keyword If    len(${assigned_report}) != 0   Unassign Assigned Task On    row=all

Create interim report unassigned
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    Create Interim Report
    Refresh Page
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    ${report_id}         Evaluate        "${interim_report['REPORT ID'].split('\n')[0]}"
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}

Navigate to report screen with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports

Create end of use reports unassigned
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    ${completed_studies}        Get Completed Studies
    ${studies_id}         Evaluate      [item['Study ID'] for item in ${completed_studies} if '(0 open)' in [' '.join(item['Total Events'].split(' ')[1:])] and (item.get('Study Type') == 'MCT' or item.get('Study Type') == 'CARDIAC EVENT') and item.get('Report Status') != 'Sent']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        study_id=${study_id}
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
    Set Global Variable     ${study_id}

Create end of use reports unassigned with study id "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On       row=1
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
    Set Global Variable     ${study_id}
