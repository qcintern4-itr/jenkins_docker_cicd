*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-ECG-EVENT-3RD-DEG-HB
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB  web
Test Timeout    10m

*** Test Cases ***
BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-01: Verify the information on list of rhythm events on page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Check the list of rhythm events displayed correct
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events -> Observe the screen
    ...
    ...     Expected Results:
    ...     2. - Verify the list of rhythm events displayed: 3rd Deg HB, Tachy, Brady, Pause (only consists of 2 beats),
    ...     Max HR, Min HR, VT, SVT, 2nd Deg HB, 3rd Deg HB
    ...        - Verify the Number of events shall display on each section above: If the number is larger than 100, it will display ‘99+’
    ...
    ...     **Others**
    ...     Create date: 04/04/2024 - Thang Tran
    ...     Auto Create: 05/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-01       auto
    Navigate Airp Tab     tab=ECG Events
    ${rhythm_menu}     Get List Rhythm Menu Ecg Events
    ${actual_rhythm_menu}                 Evaluate    [k for k, v in ${rhythm_menu}.items()]
    ${expected_rhythm_menu}   Create List    AFib    Tachy   Brady   Pause   Max HR   Min HR   VT   SVT   2nd Deg HB   3rd Deg HB
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${number_event}                 Evaluate    '${rhythm_menu}[3rd Deg HB]'
    ${total_number}         Get Total Number Events
    ${number_of_events_hover}         Get Number Events On Tab Menu
    ${status}     Check Number Event Strips    total_number_event=${total_number}     number_on_section=${number_event}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_rhythm_menu}     ${actual_rhythm_menu}
    Run Keyword And Continue On Failure    Should Be True        ${status}
    Run Keyword And Continue On Failure    Should Be Equal       ${total_number}     ${number_of_events_hover}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-01.1: Verify all components on the 3rd Deg HB event tab are displayed correctly in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-01.1       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-02: Check Reviewed status in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-02       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-03: Verify the menu option shall not displayed in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. ‘Mark all as reviewed’, ‘Mark all as reviewed’, ‘Delete all event’ are not displayed
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-03       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-04: Verify that if the number of 3rd Deg HB events exceeds 100, it displays as '99+'
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-04       AIRP-1.10.0    manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-05: Verify that when the user hovers over '99+', the correct number of events is displayed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-05       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-06: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/27/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-06       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=AFib     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-06.1: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-06.1       AIRP-1.10.0    auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=VT     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-07: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-07       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=SVT     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-09: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-09       AIRP-1.10.0       auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=2nd Deg HB     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-10: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after deleting 3rd Deg HB events using delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-10       AIRP-1.10.0     auto      R3
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_deleted_event=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-11: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after deleting 3rd Deg HB events using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 05/18/2025 - Hang Le
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-11       AIRP-1.10.0             auto      R3
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    Navigate Airp Tab        tab=ECG Events
    Navigate To Ecg Events Subtab   3rd Deg HB
    Filter Thumbnail Option    by_hotkey=D
    Verify Unsaved Symbol Is Displayed
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-12: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as artifact using Mark as artifact button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-12       AIRP-1.10.0    manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-13: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as artifact using A hokey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 06/01/2025 - Hang Le
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-13       AIRP-1.10.0             auto      R3
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    Navigate Airp Tab        tab=ECG Events
    Navigate To Ecg Events Subtab   3rd Deg HB
    Filter Thumbnail Option    by_hotkey=A
    Verify Unsaved Symbol Is Displayed
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-14: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event duration using Change event duration button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-14       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-15: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event duration using C hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-15       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-16: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-16       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-17: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/17/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-17       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-18: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after unmarking 3rd Deg HB events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/17/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-18       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-19: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after unmarking 3rd Deg HB events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/17/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-19       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-20: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after capturing 3rd Deg HB event using Capture button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-20       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-21: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after updating Technician comment on panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-21       AIRP-1.10.0      auto      R3
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On   row=2
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Filter Capture      comment=Test        is_submit=${True}
    Filter Header       is_save=${True}
    Filter Panel        view_detail=${True}     technician_comment=Test update the technician comment    is_done=${True}
    ${event_selected_update}     Get Events Selected
    ${status_event_update}         Evaluate    [value == '3rd Deg HB' for value in ${event_selected_update}]
    Run Keyword And Continue On Failure    Should Contain    ${status_event_update}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_rhythm=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-22: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after removing 3rd Deg HB strip on Panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-22       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-23: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after marking all 3rd Deg HB event as artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-23       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Option Select All    mark_all_artifact=${True}
      ${events_selected}      Get Events Selected
      ${event_status}         Evaluate    all([value == 'Artifact' for value in ${events_selected}])
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Option Select All    reset_all_change=${False}
      ${mark_all_artifact}      Check Select All Option Available
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}        ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${mark_all_artifact}[Mark all as artifact]      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-24: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after deleting all 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-24       AIRP-1.10.0        auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Option Select All    delete_all_events=${True}
      ${events_selected}      Get Events Selected
      ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-24.1: Verify that the unsaved symbol shall displayed on the 3rd Deg HB tab after deleting 3rd Deg HB event by button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Verify that the unsaved symbol shall displayed on the 2nd Deg HB tab after deleting 2nd Deg HB event by button
    ...
    ...     Precondition:
    ...     1. Having a 3rd Deg HB event
    ...     2. The user is on the 3rd Deg HB sub-tab
    ...
    ...     Test Steps:
    ...    1. Click on an 3rd Deg HB event
    ...    2. Click the delete button
    ...    3. Observe the 3rd Deg HB sub-tab
    ...     Expected Results:
    ...     1.The unsaved symbol shall be displayed on the 3rd Deg HB sub-tab
    ...
    ...     **Others**
    ...     Update date: 4/20/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-24.1       AIRP-1.14.0    auto       R1
    Navigate Airp Tab         tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_deleted_event=${True}
    Verify Unsaved Symbol Is Displayed
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-28: Can navigate between events in the list by using keyboard (Arrow left/right/up/down)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-28   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-29: Verify the button thumbnail header on "3rd Deg HB" page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the all button is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Observe the result
    ...
    ...     Expected Results:
    ...     4. The button is working properly and enabled
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-VIEW-29     auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${status_button}            Check Button Thumbnail Header Available
    Run Keyword And Continue On Failure     Should Be True    ${status_button}[Change event type]
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Delete event]
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Mark as artifact]
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Change event duration]
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Mark as reviewed]
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Filter event]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-01: Verify the first event will be selected by default
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/25/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-01       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-02: Verify the the thumbnail is displayed correctly in the first view
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Channels:
    ...     - CH1
    ...     - CH2
    ...     - CH3
    ...     - AI (set as default). The user can only select one of two options: AI or CH1,2,3
    ...     2. Size:
    ...     - Small (set as default)
    ...     - Medium
    ...     - Large
    ...     3. Gain: the value from 1 -> 200 mm/mV, default value is 7.5 mm/mV
    ...     4. HP:
    ...     - No
    ...     - 0.05 Hz
    ...     - 0.5 Hz
    ...     - 1 Hz (set as default)
    ...     - 2 Hz
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-02       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-02.1: Verify that all functionalities are working properly
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the all button is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Observe the result
    ...     5. Click on the "Size/Gain/HP" dropdown list -> Observe the result
    ...
    ...     Expected Results:
    ...     4. - By default, the first event will be selected.
    ...        - The channels displayed: CH1, CH2, CH3, AI(set as default), Size(Small(set as default)), Gain(default value is 7.5 mm/mV), HP(1Hz(set as default))
    ...        - The button is working properly and enabled
    ...     5. - on Size: Size: Small (set as default), Medium, Large
    ...        - on Gain: 1 mm/mV, 2 mm/mV, 5 mm/mV, 7.5 mm/mV, 10 mm/mV, 20 mm/mV, 50 mm/mV, 100 mm/mV, 200 mm/mV
    ...        - on HP: No, 0.05 Hz, 0.5 Hz, 1 Hz, 2 Hz
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-02.1     auto
    Navigate Airp Tab     tab=ECG Events
      ${rhythm_menu}     Get List Rhythm Menu Ecg Events
      ${number_event}                 Evaluate    '${rhythm_menu}[3rd Deg HB]'
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_channel_config}        Get Thumbnail Overview
      ${expected_channel_config}      Create List    CH1   CH2   CH3   AI
      ${expected_size_config}         Create List    Small   Medium   Large
      ${expected_gain_config}         Create List    1 mm/mV   2 mm/mV   5 mm/mV   7.5 mm/mV   10 mm/mV   20 mm/mV    50 mm/mV   100 mm/mV    200 mm/mV
      ${expected_highpass_config}     Create List    No   0.05 Hz    0.5 Hz    1 Hz    2 Hz
      ${actual_size_config}           Get Size Config
      ${actual_gain_config}           Get Gain Config
      ${actual_highpass_config}       Get Highpass Config
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_gain_config}          ${actual_gain_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_highpass_config}          ${actual_highpass_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_channel_config}       ${actual_channel_config}[Thumbnail]
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_size_config}          ${actual_size_config}
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_channel_config}[Size][0]       Small
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_channel_config}[Gain][0]       7.5
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_channel_config}[HP][0]        1
    #4 ,5 not create

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-03: Verify the channel on thumbnail is displayed correctly after selecting only CH1 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/25/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-03       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header    channel=CH1
    ${events_thumbnail}     Get Thumbnail Ecg Events
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH1' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be Equal     ${all_value}     ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-04: Verify the channel on thumbnail is displayed correctly after selecting only CH2 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/25/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-04       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header    channel=CH2
    ${events_thumbnail}     Get Thumbnail Ecg Events
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH2' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be Equal     ${all_value}     ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-05: Verify the channel on thumbnail is displayed correctly after selecting only CH3 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/25/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-05       AIRP-1.10.0       auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header    channel=CH3
    ${events_thumbnail}     Get Thumbnail Ecg Events
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH3' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be Equal     ${all_value}     ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-06: Verify the channel on thumbnail is displayed correctly after selecting only AI channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-07: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH2 channels
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 6/18/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-07       AIRP-1.10.0             auto      R1
    Navigate Airp Tab    tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header       channel=CH1, CH2
    ${list_channel}       Create List    CH1  CH2
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    2

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-08: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH3 channels
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 6/18/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-08       AIRP-1.10.0             auto      R1
    Navigate Airp Tab    tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header       channel=CH1, CH3
    ${list_channel}       Create List    CH1  CH3
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    2

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-09: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH3 channels
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 6/18/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-09       AIRP-1.10.0             auto      R1
    Navigate Airp Tab    tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header       channel=CH2, CH3
    ${list_channel}       Create List    CH2  CH3
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    2

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-10: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH2 & CH3 channels
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 6/18/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-10       AIRP-1.10.0             auto      R1
    Navigate Airp Tab    tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header       channel=CH1, CH2, CH3
    ${list_channel}       Create List    CH1  CH2  CH3
    ${channel_active}    Get Channels On Thumbnail
    ${number_channel}     Get Number Channel
    Run Keyword And Continue On Failure    Should Be Equal    ${list_channel}    ${channel_active}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${number_channel}    3

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-11: Verify the size on thumbnail is displayed correctly after selecting Small size
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The number event displayed correct follow the size is small, medium lager
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     5. Select "Small/Medium/Large" on the "Size" dropdown list -> Observe the result
    ...
    ...     Expected Results:
    ...     5. - Verify the number event thumbnail displayed: small > medium > large
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-11      auto
    Navigate Airp Tab     tab=ECG Events
    ${rhythm_menu}     Get List Rhythm Menu Ecg Events
    ${number_event}                 Evaluate    '${rhythm_menu}[3rd Deg HB]'
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${number_small_size}          Filter Header    size=Small
    ${number_medium_size}         Filter Header    size=Medium
    ${number_large_size}          Filter Header    size=Large
    ${number_status}              Verify Number Size Heatmap    number_small=${number_small_size}   number_medium=${number_medium_size}     number_large=${number_large_size}
    Run Keyword And Continue On Failure    Should Be Equal     ${number_status}     ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-12: Verify the size on thumbnail is displayed correctly after selecting Medium size
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-13: Verify the size on thumbnail is displayed correctly after selecting Large size
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-14: Verify the gain on thumbnail is displayed correctly after selecting 1 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-15: Verify the gain on thumbnail is displayed correctly after selecting 2 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-16: Verify the gain on thumbnail is displayed correctly after selecting 5 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-18: Verify the gain on thumbnail is displayed correctly after selecting 7.5 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-19: Verify the gain on thumbnail is displayed correctly after selecting 10 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-20: Verify the gain on thumbnail is displayed correctly after selecting 20 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-21: Verify the gain on thumbnail is displayed correctly after selecting 50 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-22: Verify the gain on thumbnail is displayed correctly after selecting 100 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-23: Verify the gain on thumbnail is displayed correctly after selecting 200 mm/mV gain
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-24: Verify the HP on thumbnail is displayed correctly after selecting No HP
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-25: Verify the HP on thumbnail is displayed correctly after selecting 0.05 Hz HP
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-25       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-26: Verify the HP on thumbnail is displayed correctly after selecting 0.5 Hz HP
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-27: Verify the HP on thumbnail is displayed correctly after selecting 1 Hz HP
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-27       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-28: Verify the HP on thumbnail is displayed correctly after selecting 2 Hz HP
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FUNCTIONALITY-28       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-01: Can next page by using Next/Previous button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool by button is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Next" button
    ...     5. Click on the "Previous"
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     3. Verify the page displayed default is 1
    ...     4. Verify the page displayed is 2
    ...     5. Verify the page displayed is 1
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-01      auto
    Navigate Airp Tab     tab=ECG Events
    ${rhythm_menu}     Get List Rhythm Menu Ecg Events
    ${number_event}                 Evaluate    '${rhythm_menu}[3rd Deg HB]'
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=next
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=previous
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-02: Can next page by using the hotkey ‘Z’ or ‘X’
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool by hotkey is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Using hotkey "Z" (is Next button)
    ...     5. Using hotkey "X" (is Previous button)
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     3. Verify the page displayed default is 1
    ...     4. Verify the page displayed is 2
    ...     6. Verify the page displayed is 1
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-02      auto
    Navigate Airp Tab     tab=ECG Events
    ${rhythm_menu}     Get List Rhythm Menu Ecg Events
    ${number_event}                 Evaluate    '${rhythm_menu}[3rd Deg HB]'
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=next
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=previous
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-03: Can manually input a number within the limit displayed on the page number
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool can manually input a number within the limit displayed on the page number
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Input number in page input
    ...
    ...     Expected Results:
    ...     4. - Input the page number is 0 -> verify message displayed
    ...        - Input the number is larger than the ‘all page’ number -> verify message displayed
    ...        - Check the user fill in only integers
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-03      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${current_pagination_default}     Get Current Airp Pagination
      ${status_page_less_than}     Edit Page Number      page_number=0
      ${current_total_page}     Get Current Total Page Airp Pagination
      ${current_total_page}     Evaluate    ${current_total_page} + 1
      ${status_page_lager_than}     Edit Page Number      page_number=${current_total_page}
      ${status_page}     Edit Page Number      page_number=1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${status_page_less_than}        ${False}
    Run Keyword And Continue On Failure    Should Be Equal    ${status_page_lager_than}       ${False}
    Run Keyword And Continue On Failure    Should Be Equal    ${status_page}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-04: Check case user input the number is larger than the all page number
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-05: Check case the system shall block the entry of values other than integers
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PAGINATION-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-01: Verify that all information on the 3rd Deg HB thumbnail is displayed completely
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Observe the result
    ...
    ...     Expected Results:
    ...     4. Verify the information for each event tumbnail is: Start time, Day number, Channel, Duration, HR (Min/Avg/Max)(excluding ‘Min/max HR’ and ‘Pause’ events.),
    ...        and Number of beats(it displays for VT and SVT events.)
#    ...     If the value is below 60 seconds, it will include a decimal point, for example, '9.9s'. If the value is above 60 seconds,
#    ...     there will be no decimal point. Values are rounded: if it's 0.5 or higher, round up to the next whole number;
#    ...     if it's below 0.5, round down to the nearest whole number
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-01      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On   row=1
      ${each_event_infor}     Get Thumbnail Ecg Events
      ${panel_infor}          Get Panel Information Event
      ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure    Should Be Equal     ${each_event_infor}[0][Start Time]       ${panel_start_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${each_event_infor}[0][Duration]         ${panel_infor}[Duration]
    Run Keyword And Continue On Failure    Should Be Equal    ${each_event_infor}[0][Channel]          ${panel_infor}[Channel]
    Run Keyword And Continue On Failure    Should Be Equal    ${each_event_infor}[0][Heart rate]       ${panel_infor}[Heart rate]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-01: Verify that the user can view all components on the Filter modal after clicking the filter button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Hide reviewed events - toggle the display of 'reviewed events' on or off in the event list
    ...     2. Captured strips
    ...     3. Reset button
    ...     4. Apply button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-01       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-02: Verify the filter hide reviewed events
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The event mark as reviewed will be displayed when toggle off and hide if toggle on
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the events thumbnail -> Click on the "Mark as reviewed" button -> Click on the "Save" button
    ...     5. Filter by "Hide reviewed events" -> Click on the "Apply" button -> Observe the result
    ...     6. Select on the "Reset" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. filter "Hide reviewed events" toggle off -> Check displayed all event
    ...        filter "Hide reviewed events" toggle on -> Check hide all events that mark as reviewed
    ...     6. Verify the "Hide reviewed events" is toggle off, check events thumbnail back to original
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Update date: 04/17/2024 - Thang Tran, 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-02      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${current_events}       Get Total Number Events
      ${actual_events}       Evaluate    ${current_events} - 1
    View Each Event Thumbnail On   row=2
    Filter Header     mark_reviewed=${True}       is_save=${True}
    Filter Each Event    hide_reviewed_event=checked      is_submit=${True}
      ${expected_events}       Get Total Number Events
    Filter Each Event     is_reset=${True}
      ${expected_events_total}       Get Total Number Events
    View Each Event Thumbnail On   row=2
    Filter Header     mark_reviewed=${True}       is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_events}        ${expected_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${current_events}      ${expected_events_total}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-03: Verify the filter hide reviewed events when unsave mark reviewed
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The event mark as reviewed will be displayed when toggle off and hide if toggle on
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the events thumbnail -> Click on the "Mark as reviewed" button
    ...     5. Filter by "Hide reviewed events" -> Click on the "Apply" button -> Observe the result
    ...     6. Select on the "Reset" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. filter "Hide reviewed events" toggle off -> Check displayed all event
    ...        filter "Hide reviewed events" toggle on -> Check hide all events that mark as reviewed
    ...     6. Verify the "Hide reviewed events" is toggle off, check events thumbnail back to original
    ...
    ...     **Others**
    ...     Create date: 04/17/2024 - Thang Tran
    ...     Auto Create: 04/17/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Setup]    SUITE SETUP
#    Navigate To Aireport
#    Navigate Airp Tab     tab=ECG Events
#    Navigate To Ecg Events Subtab    3rd Deg HB
#      ${current_events}       Get Total Number Events
#    View Each Event Thumbnail On   row=3
#    Filter Header     mark_reviewed=${True}
#      ${events_mark_reviewed}    Get Events Mark Reviewed On Page
#      ${actual_events}       Evaluate    ${current_events} - ${events_mark_reviewed}
#    Filter Each Event    hide_reviewed_event=checked      is_submit=${True}
#      ${expected_events}       Get Total Number Events
#    Filter Each Event     is_reset=${True}
#    View Each Event Thumbnail On   row=3
#    Filter Header     is_reset_rhythm=${True}
#    Run Keyword And Continue On Failure    Should Be Equal        ${actual_events}        ${expected_events}
#      Stop Processing
#    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-04: Verify that reviewed 3rd Deg HB events are hidden after enabling 'Hide Reviewed Events' and clicking Apply
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Once options above are selected, the applied options number will be displayed
    ...     2. The data will be displayed according to the filter
    ...     3. A tooltip should appear when hovering over the Filter button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-05: Verify that reviewed 3rd Deg HB events are displayed after turning off 'Hide Reviewed Events' and clicking Apply
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The data will be displayed according to the filter
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-06: Verify that reviewed 3rd Deg HB events are displayed after clicking Reset button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The data will be displayed according to the filter
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-07: Verify that captured strips of 3rd Deg HB events appear after checking 'Captured Strips' and clicking Apply
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Once options above are selected, the applied options number will be displayed
    ...     2. The data will be displayed according to the filter
    ...     3. A tooltip should appear when hovering over the Filter button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-07       AIRP-1.10.0       auto      R1
    [Setup]    Capture Afib Event
    ${current_events}       Get Total Number Events
    Filter Each Event    captured_strips=checked      is_submit=${True}
    ${expected_events}       Get Thumbnail Ecg Events
    ${actual_numer_of_events}       Get Total Number Events
    Filter Each Event    hide_reviewed_event=checked    is_submit=${True}
    ${expected_numer_of_events}       Get Total Number Events
    Filter Each Event     is_reset=${True}
    ${expected_events_total}       Get Total Number Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${expected_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${expected_events_total}      ${current_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_numer_of_events}      ${expected_numer_of_events}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-08: Verify that all 3rd Deg HB events are displayed after unchecking 'Captured Strips' and clicking Apply
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The data will be displayed according to the filter
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-09: Verify that all 3rd Deg HB events are displayed after clicking Reset button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The data will be displayed according to the filter
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-10: Verify that all 3rd Deg HB events display correctly with 'Hide Reviewed Events' enabled and 'Captured Strips' checked
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Once options above are selected, the applied options number will be displayed
    ...     2. The data will be displayed according to the filter
    ...     3. A tooltip should appear when hovering over the Filter button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-10       AIRP-1.10.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-11: Verify that all 3rd Deg HB events are fully displayed after turning off 'Hide Reviewed Events' and unchecking 'Captured Strips'
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The data will be displayed according to the filter
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-FILTER-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-10: Verify that all components are fully displayed on the information panel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     The user can select a minutely HR value in the HR chart to view its ECG data (1 minute data). The panel of selected information will include:
    ...     1. The header of the panel information
    ...     2. Event tab
    ...     3. Minute infor tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-11: Verify that the header of the panel information is displayed correctly in an event is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. a minutely HR value in an event is selected, the header will be the time of the selected event (MM/DD/YYYY, HH:mm:ss)
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-12: Verify that the header of the panel information is displayed correctly is not in an any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. a minutely HR is not in an any event, the header will be the time of the minute (MM/DD/YYYY, HH:mm:ss)
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-13: Verify that the event tab is only visible when the minute contains 3rd Deg HB events
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Each tab will display 1 event
    ...     2. Event start time (MM/DD/YYYY, HH:mm:ss)
    ...     3. Duration
    ...     4. Channel
    ...     5. Heart rate: Min/Avg/Max HR
    ...     6. Captured strips (MM/DD/YYYY, HH:mm:ss)
    ...     7. Jump to’ button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-14: Verify that the information panel can contain multiple beat/rhythm events tabs
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Verify if there is a bug where the user cannot navigate to the last tab of the event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-15: Verify that the event tabs on the information panel are ordered by time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-16: Verify that the Artifact tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Artifact tab appears on the information panel tab after successfully adding a Artifact event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-17: Verify that the VE Couplet tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Couplet tab appears on the information panel tab after successfully adding a VE Couplet event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-18: Verify that the VE Run tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Run tab appears on the information panel tab after successfully adding a VE Run event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-20: Verify that the VE Bigeminy tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Bigeminy tab appears on the information panel tab after successfully adding a VE Bigeminy event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-21: Verify that the VE Trigeminy tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Trigeminy tab appears on the information panel tab after successfully adding a VE Trigeminy event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-22: Verify that the VE Quadrigeminy tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Quadrigeminy tab appears on the information panel tab after successfully adding a VE Quadrigeminy event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-23: Verify that the SVE Couplet tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Couplet tab appears on the information panel tab after successfully adding a SVE Couplet event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-24: Verify that the SVE Run tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Run tab appears on the information panel tab after successfully adding a SVE Run event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-26: Verify that the SVE Bigeminy tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Bigeminy tab appears on the information panel tab after successfully adding a SVE Bigeminy event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-27: Verify that the SVE Trigeminy tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Trigeminy tab appears on the information panel tab after successfully adding a SVE Trigeminy event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-27       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-28: Verify that the SVE Quadrigeminy tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Quadrigeminy tab appears on the information panel tab after successfully adding a SVE Quadrigeminy event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-28       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-29: Verify that the AFib tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-29       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-30: Verify that the Tachy tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Tachy tab appears on the information panel tab after successfully adding a Tachy event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-30       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-31: Verify that the Brady tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Brady tab appears on the information panel tab after successfully adding a Brady event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-31       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-32: Verify that the Pause tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Pause tab appears on the information panel tab after successfully adding a Pause event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-32       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-33: Verify that the VT tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VT tab appears on the information panel tab after successfully adding a VT event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-33       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-34: Verify that the SVT tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVT tab appears on the information panel tab after successfully adding a SVT event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-34       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-35: Verify that the 2nd Deg HB tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The 2nd Deg HB tab appears on the information panel tab after successfully adding a 3rd Deg HB event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-35       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-36: Verify that the 3rd Deg HB tab is displayed next to the 3rd Deg HB tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Deg HB tab shall display as '3rd Deg HB 1', '3rd Deg HB 2', ...
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-36       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-37: Verify that the VE Couplet tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Couplet tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
#    ...     Auto create: 09/25/2024 - Thang Tran
#    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-37       AIRP-1.10.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-38: Verify that the VE Run tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Run tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-38       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-39: Verify that the VE Bigeminy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Bigeminy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-39       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-40: Verify that the VE Trigeminy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Trigeminy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-40       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-41: Verify that the VE Quadrigeminy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VE Trigeminy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-41       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-42: Verify that the SVE Couplet tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Couplet tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-43: Verify that the SVE Run tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Run tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-44: Verify that the SVE Bigeminy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Bigeminy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-45: Verify that the SVE Trigeminy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Trigeminy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-45       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-47: Verify that the SVE Quadrigeminy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Trigeminy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-48: Verify that the AFib tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The AFib tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-49: Verify that the Tachy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Tachy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-50: Verify that the Brady tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Brady tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-51: Verify that the Pause tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Pause tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-52: Verify that the VT tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VT tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-53: Verify that the SVT tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVT tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-54: Verify that the 2nd Deg HB tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The 2nd Deg HB tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-55: Verify that the 3rd Deg HB tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The 3rd Deg HB tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-56: Verify that the AFib tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The AFib tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-57: Verify that the Tachy tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Tachy tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-58: Verify that the Brady tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Brady tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-59: Verify that the Pause tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Pause tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-60: Verify that the VT tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The VT tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-61: Verify that the SVT tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVT tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-62: Verify that the 2nd Deg HB tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The 2nd Deg HB tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-63: Verify that the 3rd Deg HB tab is removed immediately after deleting it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The 3rd Deg HB tab will be removed
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-64: Verify that the 3rd Deg HB start time updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/25/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-65: Verify that the 3rd Deg HB duration updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-66: Verify that the heart rate updates after adding a new N/S/V/Q beat in the 3rd Deg HB event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-67: Verify that the heart rate updates after deleting beats in the 3rd Deg HB event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-68: Verify that the heart rate displays as NA after updating Q beats in the 3rd Deg HB event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-69: Verify that the user can navigate to the position of this event on the ECG viewer using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-70: Verify that multiple 3rd Deg HB strips are displayed on the information panel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-71: Can view details of 3rd Deg HB event strip by clicking the view button in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-71     AIRP-1.10.0    auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${panel_info}       Get Panel Information Event
    ${actual_panel_info}    Evaluate    [k for k, v in ${panel_info}.items()]
    Filter Capture      comment=Test        is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}      Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        is_cancel=${True}
    Filter Header       is_reset_rhythm=${True}
    ${panel_info_2}       Get Panel Information Event
    ${expected_panel_info}    Evaluate    [k for k, v in ${panel_info_2}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_info}[Start time]     ${datetime}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_panel_info}     ${actual_panel_info}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-72: Can update tecnician comment on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-72     AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On   row=2
    Filter Capture      comment=Test        is_submit=${True}
    Filter Panel        view_detail=${True}     technician_comment=Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if
    ${capture_details}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Panel        view_detail=${True}
    ${expected_technician_comment}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Header    is_save=${True}
    Filter Panel        view_detail=${True}
    ${expected_capture_details}      Get Capture Detail Info
    Filter Panel        remove_strip=${True}
    Filter Header    is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details}[Technician comment]       ${capture_details}[Technician comment]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_technician_comment}[Technician comment]       ${capture_details}[Technician comment]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-73: Verify that the user cannot update the technician comment if it exceeds 520 characters in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-73     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-74: Can remove the capture strip on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-74     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-75: Can view details of 3rd Deg HB event strip by clicking the view button in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-75     AIRP-1.10.0   auto      R1
    [Setup]    Capture Afib Event
    ${panel_info}       Get Panel Information Event
    Filter Panel        view_detail=${True}
    ${capture_details}      Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_info}[Start time]     ${datetime}[0]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-76: Can update tecnician comment on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-76     AIRP-1.10.0       auto      R1
    [Setup]    Capture Afib Event
    Filter Panel        view_detail=${True}     technician_comment=Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if
    ${capture_details}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Header    is_save=${True}
    View Each Event Thumbnail On   row=2
    Filter Panel        view_detail=${True}
    ${expected_capture_details}      Get Capture Detail Info
    Filter Panel        is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details}[Technician comment]       ${capture_details}[Technician comment]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-77: Verify that the user cannot update the technician comment if it exceeds 520 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-77     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-78: Can remove the capture strip on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-78     AIRP-1.10.0     auto      R1
    [Setup]    Capture Afib Event
    ${panel_info}       Get Panel Information Event
    ${actual_panel_info}      Evaluate     [k for k, v in ${panel_info}.items()]
    Filter Panel        view_detail=${True}     remove_strip=${True}
    ${status}       Get Events Selected
    ${expected_status}      Evaluate    [value == '3rd Deg HB' for value in ${status}]
    Filter Header    is_save=${True}
    ${panel_info}       Get Panel Information Event
    ${expected_panel_info}      Evaluate     [k for k, v in ${panel_info}.items()]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${expected_panel_info}        ${actual_panel_info}
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-79: Can close the strip details table by using X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-79    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-80: Can close the strip details table by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-80    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-81: Can close the strip details table by using Done button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-EVENT-81    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-01: Verify that the Minute info tab is only visible when the minute is not in an any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-01    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-02: Verify that the heart rate updates after adding a new N/S/V/Q beat in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-02    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-03: Verify that the heart rate displays as NA after updating Q beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-04: Verify that the heart rate updates after deleting beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-05: Verify that multiple strips can be displayed for one minute on the panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-06: Can view details of strips by clicking the view button in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-06     AIRP-1.10.0      auto        R1
    [Setup]    Create Capture Afib Event Unsave Status On Panel Tab "Minute info"
    ${minute_info}     Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${minute_info}.items()]
    Filter Panel    view_detail=${True}     title_name=Update capture name      technician_comment=Update technician comment
    ${actual_capture_details}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Panel    view_detail=${True}
    ${expected_capture_details}      Get Capture Detail Info
    Filter Panel    is_cancel=${True}
    Filter Header    is_save=${True}
    Filter Panel    view_detail=${True}
    ${expected_capture_details_saved}      Get Capture Detail Info
    Filter Panel    remove_strip=${True}
    Filter Header    is_save=${True}
    ${expected_minute_info}     Get Panel Information Event
    ${expected_items_panel}      Evaluate    [k for k, v in ${expected_minute_info}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details}[Technician comment]      ${actual_capture_details}[Technician comment]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details_saved}[Technician comment]      ${expected_capture_details}[Technician comment]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details}[Title]      ${actual_capture_details}[Title]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details_saved}[Title]      ${expected_capture_details}[Title]
    Run Keyword And Continue On Failure    Should Not Be Equal        ${expected_items_panel}     ${actual_items_panel}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-07: Can update title on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-07     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-08: Can update tecnician comment on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-08     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-09: Verify that the user cannot update the technician comment if it exceeds 100 characters in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-09     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-10: Verify that the user cannot update the technician comment if it exceeds 520 characters in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-10     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-11: Can remove the capture strip on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-11     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-12: Can view details of 3rd Deg HB event strip by clicking the view button in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-12     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-13: Can update title on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-13     AIRP-1.10.0    auto        R1
    [Setup]    Create Capture Afib Event Unsave Status On Panel Tab "Minute info"
    Filter Header    is_save=${True}
    ${minute_info}     Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${minute_info}.items()]
    Filter Panel    view_detail=${True}     title_name=Update capture name      technician_comment=Update technician comment
    ${actual_capture_details}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Header    is_save=${True}
    Filter Panel    view_detail=${True}
    ${expected_capture_details_saved}      Get Capture Detail Info
    Filter Panel    remove_strip=${True}
    Filter Header    is_save=${True}
    ${expected_minute_info}     Get Panel Information Event
    ${expected_items_panel}      Evaluate    [k for k, v in ${expected_minute_info}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details_saved}[Technician comment]      ${actual_capture_details}[Technician comment]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details_saved}[Title]      ${actual_capture_details}[Title]
    Run Keyword And Continue On Failure    Should Not Be Equal        ${expected_items_panel}     ${actual_items_panel}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-14: Can update tecnician comment on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-14     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-15: Verify that the user cannot update the technician comment if it exceeds 100 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-15     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-16: Verify that the user cannot update the technician comment if it exceeds 520 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-16     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-17: Can remove the capture strip on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-17     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-18: Can close the strip details table by using X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-18    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-19: Can close the strip details table by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-19    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-20: Can close the strip details table by using Done button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-PANEL-MINUTE-20    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-01: Verify the data shall be shown corresponding in HR chart once the user selects the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-01       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-01.1: Verify the HR chart is working properly
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: - Check min, max zoom and button reset change working properly
    ...                  - Check date displayed the number of events, the ‘Next’, or ‘Previous’ button to navigate to another date.
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button -> Click the zoom in, zoom out tool -> Observe the result
    ...     4. Click on the "Next"(or "Previous") button -> Observe the result
    ...
    ...     Expected Results:
    ...     3. - Check the zoom tool: Min: 100 %, max: 2000%
    ...        - Check the "Reset zoom" button will be displayed when the user zooms in on the Hr chart (not displayed for 100%)
    ...     4. - The number of events will be displayed on each day.
    ...        - By default, the day with the first event will be shown.
    ...        - The user will use the ‘Next’, or ‘Previous’ button to navigate to another date.
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/12/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-01.1      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On   row=1
      ${default_value_zoom}     Get Zoom Tool Hr Chart
    Filter Zoom Tool    min_or_max_percent=2000%
      ${expected_value_zoom}     Get Zoom Tool Hr Chart
    Filter Zoom Tool    is_reset_zoom=${True}
      ${current_value_zoom}     Get Zoom Tool Hr Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${default_value_zoom}       100%
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_value_zoom}       2000%
    Run Keyword And Continue On Failure    Should Be Equal    ${current_value_zoom}       100%

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-02: Verify there shall be a list of dates within the study period
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: - number of events will be displayed on each day
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Navigate to HR chart
    ...     4. Click on the "Next"(or "Previous") button -> Observe the result
    ...
    ...     Expected Results:
    ...     4. - The number of events will be displayed on each day.
    ...        - By default, the day with the first event will be shown.
    ...        - The user will use the ‘Next’, or ‘Previous’ button to navigate to another date.
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...     Auto Create: 04/12/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-02      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${panel_info}       Get Panel Information Event
    ${date_format}      Format Datetime To Mmdd    ${panel_info}[Start time]
    ${start_date}       Get Current Datetime Start Date
    Pagination Datetime       next_or_previous=next
    ${panel_info_next}       Get Panel Information Event
    ${start_date_next}       Get Current Datetime Start Date
    Pagination Datetime       next_or_previous=previous
    ${start_date_previous}       Get Current Datetime Start Date
    Run Keyword And Continue On Failure    Should Be Equal    ${start_date}[Date]     ${date_format}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${start_date}[Date]      ${start_date_next}[Date]
    Run Keyword And Continue On Failure    Should Be Equal    ${start_date}[Date]      ${start_date_previous}[Date]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-03: Verify the number of events will be displayed on each day
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-03       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-04: Verify "No data" will be displayed on each day if there is no data recorded
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-04       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-05: Verify the day with the first event will be shown by default
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-05       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-06: Verify that the user can navigate to another date using the Next button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-06       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-07: Verify that the user can navigate back to the previous day using the Previous button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-07       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${panel_info}       Get Panel Information Event
    ${date_format}      Format Datetime To Mmdd    ${panel_info}[Start time]
    ${start_date}       Get Current Datetime Start Date
    Pagination Datetime       next_or_previous=next
    ${panel_info_next}       Get Panel Information Event
    ${start_date_next}       Get Current Datetime Start Date
    Pagination Datetime       next_or_previous=previous
    ${start_date_previous}       Get Current Datetime Start Date
    Run Keyword And Continue On Failure    Should Be Equal    ${start_date}[Date]     ${date_format}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${start_date}[Date]      ${start_date_next}[Date]
    Run Keyword And Continue On Failure    Should Be Equal    ${start_date}[Date]      ${start_date_previous}[Date]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-08: Verify that the selected 3rd Deg HB event on the HR chart is highlighted in the event list above
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-08       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-09: Check the UI of the 3rd Deg HB event on the HR chart when a new event is added in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-09       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-10: Check the UI of the 3rd Deg HB event on the HR chart when the event duration is being changed in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-10       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-11: Verify the HR chart will not be displayed corresponding to the list event card above if adding new event in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-11       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-12: Verify user can zoom in HR chart by drags an area in the chart
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-12       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-13: Verify user can zoom in HR chart by clicking the (+) button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Min: 100 %, max: 2000%
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-13       AIRP-1.10.0    auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${default_value_zoom}     Get Zoom Tool Hr Chart
    Filter Zoom Tool    min_percent=100%
    ${expected_min_percent}     Get Zoom Tool Hr Chart
    Filter Zoom Tool    min_or_max_percent=2000%
    ${expected_value_zoom}     Get Zoom Tool Hr Chart
    Filter Zoom Tool    is_reset_zoom=${True}
    ${current_value_zoom}     Get Zoom Tool Hr Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${default_value_zoom}       100%
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_value_zoom}       2000%
    Run Keyword And Continue On Failure    Should Be Equal    ${current_value_zoom}       100%
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_min_percent}       100%

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-14: Verify user can zoom out HR chart by clicking the (-) button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-14       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-15: Verify the user can reset zoom HR chart by using Reset zoom button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-15       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-16: Verify that the HR chart highlights only AFib and Artifact events
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-16       AIRP-1.6.7       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-17: Verify the tool tip shall be displayed when the user hovers over the HR chart
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Timestamp – hh:mm
    ...     2. Average heart rate
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-17       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-18: Verify in HR chart, areas that do not have study data (due to study paused) will be marked in HR chart
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-18       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-19: Verify the tool tip 'NA' shall be displayed when the user hovers over the HR chart if the HR cannot be calculated
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-HR-CHART-19       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-01: Verify the data shall be shown corresponding in ECG viewer once the user selects the event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-01       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-02: Can go to next/previous minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-02       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Header    panel_tab=Minute info
    ${minute_infor}     Get Panel Information Event
    ${time_value}       Evaluate    "${minute_infor}[Time]".split()[1]
    ${expected_time}    Get Time The Next Minute    current_time=${time_value}
    Pagination Minute    next_or_previous=next
    Filter Header    panel_tab=Minute info
    ${minute_infor}     Get Panel Information Event
    ${actual_time_next}       Evaluate    "${minute_infor}[Time]".split()[1]
    Pagination Minute    next_or_previous=previous
    Filter Header    panel_tab=Minute info
    ${minute_infor}     Get Panel Information Event
    ${actual_time_previous}       Evaluate    "${minute_infor}[Time]".split()[1]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_time}      ${actual_time_next}
    Run Keyword And Continue On Failure    Should Be Equal    ${time_value}     ${actual_time_previous}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-03: Check the toolbar on ECG viewer is working properly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-03     AIRP-1.10.0    auto        R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
#    Filter Header      panel_tab=Minute info
    ${expected_status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Capture]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Zool Tool]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-04: Check the toolbar on ECG viewer with tab panel artifact is working properly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click on Artifact tab on Panel info, then observe the tool bar on ECG Viewer
    ...     2. Click on Minute info tab on Panel info, then observe the tool bar on ECG Viewer
    ...
    ...     Expected Results:
    ...     1. The "Artifact" tab should not contain the Capture button
    ...     2. The "Artifact" tab shall contain the Capture button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-04     AIRP-1.10.0     auto        R1
    [Setup]    Create New Artifact Event
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Header      panel_tab=Artifact
    ${expected_status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_status}[Capture]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Zool Tool]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-05: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 2.5 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-05       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-04.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-04.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-05.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 25 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-05.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-06: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-06       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-07: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 75 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-07       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-08: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-08       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-09: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-09       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-10: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 500 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-10       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-11: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 1 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-11       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-12: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 2 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-12       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-13: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 5 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-13       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-14: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 7.5 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-14       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-15: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-15       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-16: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 20 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-16       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-17: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-17       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-18: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-18       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-19: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-19       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-20: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to No
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-20       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-21: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.05 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-21       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-22: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.5 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-22       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-23: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 1 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-23      AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-24: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 2 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-24       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-25: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to No
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-25       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-26: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 15 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-26       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-27: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 30 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-27       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-28: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 40 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-28       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-29: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 50 Hz (Notch)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-29       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-30: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 60 Hz (Notch)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-30       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-31: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 100 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-31       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-32: Verify that the the ECG Viewer displays correctly after hiding only the CH1 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-32       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-33: Verify that the the ECG Viewer displays correctly after hiding only the CH2 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-33       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-34: Verify that the the ECG Viewer displays correctly after hiding only the CH3 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-34       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-35: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH2 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-35       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-36: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH3 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-36       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-37: Verify that the the ECG Viewer displays correctly after hiding the CH2 & CH3 channel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-37       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-38: Can mark a strip that does not belong to any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...     Auto create: 09/10/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-38       AIRP-1.10.0    auto       R3
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=-50         y_offset_start_time=30
    ${minute_info}     Get Panel Information Event
    ${panel_details}     Evaluate    [k for k, v in ${minute_info}.items()]
    Mark A Strip Airp    technician_comment=test capture        title=Thang Capture      is_save=${True}
    Filter Header      is_save=${True}
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=-50        y_offset_start_time=30
    ${minute_info}     Get Panel Information Event
    ${actual_panel_details}     Evaluate    [k for k, v in ${minute_info}.items()]
    ${expected_panel_details}       Create List    Time     Channel     Heart rate      Captured strips
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_panel_details}         ${actual_panel_details}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${expected_panel_details}         ${panel_details}
    Filter Panel    view_detail=${True}     remove_strip=${True}
    Filter Header      is_save=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-39: Can mark multiple strips that does not belong to any event at the same time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Update date: 09/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-39     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-40: Cannot mark a strip that does not belong to any event without entering title
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/10/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-40       AIRP-1.10.0    auto       R3
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=-50         y_offset_start_time=30
    Filter Header       panel_tab=Minute info
    Mark A Strip Airp    technician_comment=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a title

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-41: Cannot mark a strip that does not belong to any event without entering technician comment
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...     Auto create: 09/10/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-41       AIRP-1.10.0       auto       R3
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=-50         y_offset_start_time=30
    Filter Header       panel_tab=Minute info
    Mark A Strip Airp    title=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a comment

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-42: Verify the system shall automatically recapture the strip in case updating N/S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-43: Verify that the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-44: Verify that the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-45: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
#    ...     1.  nếu user capture cùng Starttime, Stoptime, và Type thì nó sẽ lấy cái mới đè lên cái cũ, Panel info sẽ update về cái mới nhất (xét 3 cái trên được r, ko xét đến channel)
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...     Auto create: 09/10/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-45       AIRP-1.10.0      auto        R3
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Header    panel_tab=Minute info
    Mark A Strip Airp    title=test title      technician_comment=test comment   is_save=${True}
    Filter Header    is_save=${True}
    View Each Event Thumbnail On    row=1
    Filter Header    panel_tab=Minute info
    ${panel_infor}      Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${panel_infor}.items()]
    ${expected_items_pannel}        Create List    Time     Channel     Heart rate     Captured strips
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_items_pannel}        ${actual_items_panel}
    Mark A Strip Airp    title=test title overwrite      technician_comment=test comment overwrite   is_save=${True}
    Filter Header    is_save=${True}
    ${actual_panel_infor}      Get Panel Information Event
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_infor}[Captured strips]       ${actual_panel_infor}[Captured strips]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-46: Verify that the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyenn
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-46       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-47: Verify that the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-48: Verify that the View button on the panel information is disabled during the capture saving process
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/8/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-48.1: Verify that the user cannot capture data in areas where no data is available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/8/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-CAPTURE-48.1       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49: Verify the toolbar on ECG viewer is working properly on minute info tab
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The toolbar change speed, gain, high and low pass filter, show and hide channels, select preview channel,
    ...                  capture, add and remove beat, zoom in and out, and view all strips.
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button -> Click on the "Minute info" tab panel -> Observe the result
    ...     4. Click on the "Beat Marker Tool"
    ...
    ...     Expected Results:
    ...     3. Verify The toolbar displayed: SPEED, GAIN, HP, LP, CH1, CH2, CH3, Capture, Beat Marker Tool, Zoom Tool, View All Strip
    ...     4. Verify add beat marker: N, S, V, Q and Delete
    ...
    ...     **Others**
    ...     Create date: 04/08/2024 - Thang Tran
    ...     Auto Create: 04/12/2024 - Thang Tran
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Header      panel_tab=Minute info
      ${expected_status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Capture]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Zool Tool]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49.1: Verify beat mark tool on the toolbar on ECG on minute info tab
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button -> Click on the "Minute info" tab panel
    ...     4. Click on the "Beat Marker Tool" -> Observe the result
    ...
    ...     Expected Results:
    ...     4. Verify add beat marker: N, S, V, Q and Delete
    ...
    ...     **Others**
    ...     Create date: 04/08/2024 - Thang Tran
    ...     Auto Create: 04/12/2024 - Thang Tran
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49.1      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Header      panel_tab=Minute info
    Filter Toolbar Ecg Viewer    beat_mark=${True}
    ${expected_status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_status}[Capture]
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_status}[Zool Tool]
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_status}[View All Strip]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker N]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker S]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker V]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker Q]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Delete]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49.2: Verify the zoom in and zoom out on ECG viewer toolbar on minute info tab
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the zoom in and zoom out on ECG viewer toolbar
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button -> Click on the "Minute info" tab panel
    ...     4. Click on the "Zoom Tool" -> Click on chart -> Observe the result
    ...
    ...     Expected Results:
    ...     4. Verify the zoom in, zoom out
    ...
    ...     **Others**
    ...     Create date: 04/08/2024 - Thang Tran
    ...     Auto Create: 04/12/2024 - Thang Tran
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49.2      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Header      panel_tab=Minute info
    Filter Toolbar Ecg Viewer    zoom_tool=${True}
    ${status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Capture]
    Run Keyword And Continue On Failure    Should Be True    ${status}[Zool Tool]
    Run Keyword And Continue On Failure    Should Be True    ${status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Be True    ${status}[View All Strip]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49.3: Verify that the user can add an N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-49.3       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-50: Verify that the user can add an N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-51: Verify that the user can add an N beat in the ECG Viewer using add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-52: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-53: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-54: Verify that the user can change V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-55: Verify that the user can delete an N beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-56: Verify that the user can delete an N beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-57: Verify that the user can delete an N beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-58: Verify that the user can delete an N beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-59: Verify that the user can add an S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-60: Verify that the user can add an S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-61: Verify that the user can add an S beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-62: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-63: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-64: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-65: Verify that the user can delete an S beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-66: Verify that the user can delete an S beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-67: Verify that the user can delete an S beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-68: Verify that the user can delete an S beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-69: Verify that the user can add an V beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-70: Verify that the user can add an V beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-71: Verify that the user can add an V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-71       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-72: Verify that the user can change N/S/Q beat to V in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-72       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-73: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-73       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-74: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-74       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-75: Verify that the user can delete an V beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-75       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-76: Verify that the user can delete an V beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-76       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-77: Verify that the user can delete an V beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-77       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-78: Verify that the user can delete an V beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-78       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-79: Verify that the user can add an Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-79       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-80: Verify that the user can add an Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-80       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-81: Verify that the user can add an Q beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-81       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-82: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-82       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-83: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-83       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-84: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-84       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-85: Verify that the user can delete an Q beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-85       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-86: Verify that the user can delete an Q beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-86       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-87: Verify that the user can delete an Q beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-87       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-88: Verify that the user can delete an Q beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-88       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-89: Verify that the Zoom in toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-89       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-90: Verify that the Zoom out toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-90       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-91: Verify that the user can exit "View All Strips" mode by clicking the "Exit view all strip mode" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-91       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-92: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-92       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-93: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-93       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-94: Verify that the Vertical Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-94       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-95: Verify that the Beat Calipers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-95       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-96: Verify that the Text Annotation option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-96       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-97: Verify that the Mark a Pattern option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-97       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-99: Verify that the Hide Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-99       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-100: Verify that the Show Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ECG-100       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-01: Verify that the user can view all information ont he Change event type to modal by clicking Change event type modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The modal features a dropdown menu contains:
    ...     - 3rd Deg HB
    ...     - VT
    ...     - SVT
    ...     - 1st Deg HB
    ...     - 3rd Deg HB
    ...     - 3rd Deg HB
    ...     2. There shall be “Save” and “Cancel” buttons for the user to save or cancel
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/12/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-01       AIRP-1.10.0       auto     R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_change_event_type=${True}
    ${actual_events_type}     Get List Events Type
    ${expected_events_type}       Create List    AFib   VT   SVT   3rd Deg HB   3rd Deg HB
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_events_type}      ${actual_events_type}
    Filter Thumbnail Option    is_cancel=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-02: Verify that the user can change an 3rd Deg HB event to a AFib event
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Can change of the event to another event type
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Change event type" button
    ...     5. Click on the dropdown list
    ...     6. Select an other event type -> Click on the "Save" button
    ...     7. Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the dropdown list displayed: Afib, VT, SVT, 3rd Deg HB, 3rd Deg HB
    ...     7. Verify change the event successfully
    ...
    ...     **Others**
    ...     Create date: 04/08/2024 - Thang Tran
    ...     Auto Create: 04/15/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-02      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-02.1: Verify that the user can change an 3rd Deg HB event to a VT event
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Can change of the event to another event type
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Change event type" button
    ...     5. Click on the dropdown list
    ...     6. Select an other event type -> Click on the "Save" button
    ...     7. Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the dropdown list displayed: Afib, VT, SVT, 3rd Deg HB, 3rd Deg HB
    ...     7. Verify change the event successfully
    ...
    ...     **Others**
    ...     Create date: 04/08/2024 - Thang Tran
    ...     Auto Create: 04/15/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-02.1      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-03: Verify the change multiple the event to another event type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Can the change multiple the event to another event type
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button -> select more the events
    ...     4. Click on the "Change event type" button
    ...     5. Click on the dropdown list
    ...     6. Select an other event type -> Click on the "Save" button
    ...     7. Observe the result
    ...
    ...     Expected Results:
    ...     7. Verify change the event successfully
    ...
    ...     **Others**
    ...     Create date: 04/08/2024 - Thang Tran
    ...     Auto Create: 04/15/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-03      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    VT
      ${current_number}         Get Total Number Events
      ${expected_number}        Evaluate    ${current_number} + 2
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_3rd_deg_hb_events}     Get Total Number Events
    View Each Event Thumbnail On    row=2
    View Multiple Each Event Thumbnail On    row=2, 3
      ${actual_3rd_deg_hb_events}     Evaluate    ${actual_3rd_deg_hb_events} - 2
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=VT     is_save=${True}
      ${event_change}       Get Events Selected
      ${event_status}         Evaluate    all([value == 'VT' for value in ${event_change}])
    Filter Header    is_save=${True}
      ${expected_3rd_deg_hb_events}     Get Total Number Events
    Navigate To Ecg Events Subtab    VT
      ${actual_number}         Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal     ${event_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}      ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_3rd_deg_hb_events}      ${actual_3rd_deg_hb_events}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-05: Verify that the user can change an 3rd Deg HB event to a SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-05       AIRP-1.10.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-06: Verify that the user can change an 2nd Deg HB event to a 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-06       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-08: Verify that the Cancel button is working on 'Change event type to' modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-TYPE-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-01: Verify the user can delete an 3rd Deg HB event by using delete button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Delete 1 event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select a event
    ...     5. Click on the "Delete event" button -> Click "Reset Change" button -> Click "Save" button -> Observe the result
    ...     6. Select a event -> Click on the "Delete event" button -> Click "Save" button -> Observe the result
    ...     7. Select a event -> Click "Delete event" by hotkey D -> Click "Reset Change" button -> Click "Save" button -> Observe the result
    ...     8. Select a event -> Click "Delete event" by hotkey D -> Click "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5,7. - Verify when the state of event card will be ‘unsaved’ and the user can not change duration of this event.
    ...     6,8. - Verify deleted the event sucessfull
    ...
    ...     **Others**
    ...     Create date: 04/08/2024 - Thang Tran
    ...     Auto Create: 04/15/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-01      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Verify Delete A Event By Button
    Verify Delete A Event By Hotkey

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-02: Verify the user can delete multiple events by using delete button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Can delete more than 1 event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select multiple event
    ...     5. Click on the "Delete event" button -> Click "Reset Change" button -> Click "Save" button -> Observe the result
    ...     6. Select multiple event -> Click on the "Delete event" button -> Click "Save" button -> Observe the result
    ...     7. Select multiple event -> Click "Delete event" by hotkey D -> Click "Reset Change" button -> Click "Save" button -> Observe the result
    ...     8. Select multiple event -> Click "Delete event" by hotkey D -> Click "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5,7. - Verify when the state of event card will be ‘unsaved’ and the user can not change duration of this event.
    ...     6,8. - Verify deleted multiple successfully
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/15/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-02      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Verify Delete Multiple Events By Button
    Verify Delete Multiple Events By Hotkey

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-03: Verify that user can delete an 3rd Deg HB event using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 04/15/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-04: Verify that user can delete multiple 3rd Deg HB events using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 04/15/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-05: Verify that the 3rd Deg HB event is deleted if the user deletes all beats in the event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-06: In 3rd Deg HB event, if the user deletes all beats except one, the system should delete the event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    #hien tai dang bug 1358
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-07: Verify that the 3rd Deg HB event is deleted if a new Tachy event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    #hien tai dang bug 1364
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-07       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "Tachy"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-07.1: Verify that the 3rd Deg HB event is deleted if a new AFib event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    #hien tai dang bug 1364
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-07.1       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "AFib"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-08: Verify that the 3rd Deg HB event is deleted if a new Brady event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    #hien tai dang bug 1364
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-08       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "Brady"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-09: Verify that the 3rd Deg HB event is deleted if a new Pause event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    #hien tai dang bug 1364
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-09       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "Pause"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-10: Verify that the 3rd Deg HB event is deleted if a new VT event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-10       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "VT"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-11: Verify that the 3rd Deg HB event is deleted if a new SVT event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-11       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "SVT"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-12: Verify that the 3rd Deg HB event is deleted if a new 2nd Deg HB event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    #hien tai dang bug 1364
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-12       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "2nd Deg HB"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-13: Verify that the 3rd Deg HB event is deleted if a new 3rd Deg HB event is added that overrides the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    #hien tai dang bug 1364
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-13       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=ECG Events
    Add Event Type "3rd Deg HB" To Event Type "3rd Deg HB"
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}     ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_3rd_deg_hb}     ${actual_number_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-14: Verify that all events will be deleted when using the 'Delete all event' function
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: the all the events has deleted
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Hover to 3rd Deg HB tab
    ...     4. Select option "Delete all events"
    ...     5. Select on the "Save" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify option: ‘Delete all events’ function: all the events will be deleted.
    ...     6. Number event on 3rd Deg HB = 0
    ...
    ...     **Others**
    ...     Create date: 04/04/2024 - Thang Tran
    ...     Update date: 08/17/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DELETE-14       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Option Select All    delete_all_events=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Option Select All    delete_all_events=${True}
    Filter Header    is_save=${True}
    ${expected_number_events}    Get Number Events On Tab Menu
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_events}    ${0}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-01: Verify that user can mark 3rd Deg HB event as artifact by using Mark as artifact button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark an event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the each event
    ...     5. Click on the "Mark as artifact" by button -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "3rd Deg HB"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...     Auto Create: 04/24/2024 - Thang Tran
    ...     Update date: 8/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-01      auto
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 1
    View Each Event Thumbnail On   row=1
      ${panel_infor}     Get Panel Information Event
      ${start_time}      Format Datetime To Mmdd    ${panel_infor}[Start time]
    Filter Thumbnail Option       is_mark_as_artifact=${True}
      ${status}         Get Events Selected
      ${expected_status}    Evaluate    [value == 'Artifact' for value in ${status}]
    Filter Header    is_save=${True}
      ${expected_number_event}        Get Total Number Events
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${expected_artifact_event}        Get All Thumbnail Artifact
      ${expected_number_artifact}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time}')
      ${actual_number_artifact}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time}') + 1
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event}        ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact}        ${expected_number_artifact}
    Run Keyword And Continue On Failure    Should Contain        ${expected_status}       ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-02: Verify that user can mark 3rd Deg HB event as artifact by using A hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark an event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the event strip
    ...     5. Click on the "Mark as artifact" by hotkey "A" -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "3rd Deg HB"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...     Auto Create: 04/24/2024 - Thang Tran
    ...     Update date: 8/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-02      auto
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 1
    View Each Event Thumbnail On   row=1
      ${panel_infor}     Get Panel Information Event
      ${start_time}      Format Datetime To Mmdd    ${panel_infor}[Start time]
    Filter Thumbnail Option    by_hotkey=A
      ${status}         Get Events Selected
      ${expected_status}    Evaluate    [value == 'Artifact' for value in ${status}]
    Filter Header    is_save=${True}
      ${expected_number_event}        Get Total Number Events
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${expected_artifact_event}        Get All Thumbnail Artifact
      ${expected_number_artifact}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time}')
      ${actual_number_artifact}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time}') + 1
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_number_event}        ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact}        ${expected_number_artifact}
    Run Keyword And Continue On Failure    Should Contain        ${expected_status}       ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-03: Verify the can mark multiple event as artifact by button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as artifact" by button -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "3rd Deg HB"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...     Auto Create: 04/24/2024 - Thang Tran
    ...     Update date: 8/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-03      auto
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 2
    View Each Event Thumbnail On   row=1
      ${panel_infor_1}     Get Panel Information Event
      ${start_time_1}      Format Datetime To Mmdd    ${panel_infor_1}[Start time]
    Filter Thumbnail Option       is_mark_as_artifact=${True}
      ${status_artifact_1}         Get Events Selected
      ${expected_status_1}    Evaluate    all([value == 'Artifact' for value in ${status_artifact_1}])
    Pagination Datetime       next_or_previous=next
      Edit Artifact Event   is_hr_chart=${True}         x_offset_start_time=-400      y_offset_start_time=20
    View Each Event Thumbnail On   row=5
      ${panel_infor_2}     Get Panel Information Event
      ${start_time_2}      Format Datetime To Mmdd    ${panel_infor_2}[Start time]
    Filter Thumbnail Option       is_mark_as_artifact=${True}
      ${status_artifact_2}         Get Events Selected
      ${expected_status_2}    Evaluate    all([value == 'Artifact' for value in ${status_artifact_2}])
    Filter Header    is_save=${True}
      ${expected_number_event}        Get Total Number Events
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${expected_artifact_event}        Get All Thumbnail Artifact
      ${expected_number_artifact_1}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time_1}')
      ${expected_number_artifact_2}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time_2}')
      ${actual_number_artifact_total}     Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time_1}') + 2
      ${actual_number_artifact_1}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time_1}') + 1
      ${actual_number_artifact_2}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time_2}') + 1
      Run Keyword If    '${start_time_1}' == '${start_time_2}'
      ...   Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact_total}        ${expected_number_artifact_1}
      Run Keyword If    '${start_time_1}' != '${start_time_2}'      Run Keywords
      ...   Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact_1}        ${expected_number_artifact_1}
      ...   AND   Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact_2}        ${expected_number_artifact_2}
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_number_event}        ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_status_1}        ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_status_2}        ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-04: Verify the can mark multiple event as artifact by hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as artifact" by hotkey "A" -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "3rd Deg HB"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...     Auto Create: 04/24/2024 - Thang Tran
    ...     Update date: 8/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-04      auto
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 2
    View Each Event Thumbnail On   row=1
      ${panel_infor_1}     Get Panel Information Event
      ${start_time_1}      Format Datetime To Mmdd    ${panel_infor_1}[Start time]
    Filter Thumbnail Option       by_hotkey=A
      ${status_artifact_1}         Get Events Selected
      ${expected_status_1}    Evaluate    all([value == 'Artifact' for value in ${status_artifact_1}])
    Pagination Datetime       next_or_previous=next
      Edit Artifact Event   is_hr_chart=${True}         x_offset_start_time=550      y_offset_start_time=20
    View Each Event Thumbnail On   row=5
      ${panel_infor_2}     Get Panel Information Event
      ${start_time_2}      Format Datetime To Mmdd    ${panel_infor_2}[Start time]
    Filter Thumbnail Option       by_hotkey=A
      ${status_artifact_2}         Get Events Selected
      ${expected_status_2}    Evaluate    all([value == 'Artifact' for value in ${status_artifact_2}])
    Filter Header    is_save=${True}
      ${expected_number_event}        Get Total Number Events
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${expected_artifact_event}        Get All Thumbnail Artifact
      ${expected_number_artifact_1}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time_1}')
      ${expected_number_artifact_2}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time_2}')
      ${actual_number_artifact_total}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time_1}') + 2
      ${actual_number_artifact_1}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time_1}') + 1
      ${actual_number_artifact_2}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time_2}') + 1
      Run Keyword If    '${start_time_1}' == '${start_time_2}'
      ...   Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact_total}        ${expected_number_artifact_1}
      Run Keyword If    '${start_time_1}' != '${start_time_2}'      Run Keywords
      ...   Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact_1}        ${expected_number_artifact_1}
      ...   AND  Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact_2}        ${expected_number_artifact_2}
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_number_event}        ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be True        ${expected_status_1}
    Run Keyword And Continue On Failure    Should Be True        ${expected_status_2}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-05: Verify that user can mark 3rd Deg HB event as 'Reviewed' by using 'Mark as reviewed' button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark an event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the event strip
    ...     5. Click on the "Mark as reviewed" by button -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "3rd Deg HB"
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-06: Verify that user can mark 3rd Deg HB event as 'Reviewed' by using R hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark an event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the event strip
    ...     5. Click on the "Mark as reviewed" by hotkey "R" -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "3rd Deg HB"
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...     Auto Create: 04/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-07: Verify the can mark multiple event as reviewed by button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as reviewed" by button -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "3rd Deg HB"
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-08: Verify the can mark multiple event as reviewed by hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as reviewed" by hotkey "R" -> Observe the result
    ...     6. Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "3rd Deg HB"
    ...
    ...     **Others**
    ...     Create date: 04/10/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-09: Verify that all events are marked as artifact when using the 'Mark all as artifact' function
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: the all the event has been marked all the artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Hover to 3rd Deg HB tab
    ...     4. Select option "Mark all as artifact"
    ...     5. Select on the "Save" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify option: ‘Mark all as artifact’ function: all the events will be marked as artifact.
    ...     6. Number event on 3rd Deg HB = 0
    ...
    ...     **Others**
    ...     Create date: 04/04/2024 - Thang Tran
    ...     Update date: 08/17/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-MARK-09       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-01:Verify user can view all information on the Change Event Duration pop-up using the Change Event Duration button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Start time: date and time
    ...     2. End time: date and time
    ...     3. Jump to button
    ...     4. ‘Pick on ECG event’ button
    ...     5. ‘Cancel’ button
    ...     6. ‘Done’ button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-01       AIRP-1.12.0       auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${panel_info}       Get Panel Information Event
    Filter Thumbnail Option    change_event_duration=${True}
    ${event_duration}     Check Event Airp Available
    Filter Thumbnail Option    is_done=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-02:Verify user can view all information on the Change Event Duration pop-up using C hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Start time: date and time
    ...     2. End time: date and time
    ...     3. Jump to button
    ...     4. ‘Pick on ECG event’ button
    ...     5. ‘Cancel’ button
    ...     6. ‘Done’ button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-02       AIRP-1.12.0      auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${panel_info}       Get Panel Information Event
    Filter Thumbnail Option    by_hotkey=C
    ${event_duration}     Check Event Airp Available
    Filter Thumbnail Option    is_done=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-06: Verify that user can navigate to the Start time of the event on ECG viewer by using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-06       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-07: Verify that user can navigate to the End time of the event on ECG viewer by using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-07       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-08: Verify that user can select the desired Start time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-08       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-09: Verify that user can select the desired End time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-09       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-10: Verify that the user can exit select Start Time mode by pressing the 'Esc' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-10       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-11: Verify that the user can exit select End Time mode by pressing the 'Esc' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-11       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-12: Verify that user can close the pop-up and exit the Change event duration function by clicking Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-12       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-13: Verify there shall be an error message if the end time is less than the start time
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the change event duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Change Event Duration" button
    ...     5. Select "End Time" is less than the "Start Time" on ECG Viewer -> Click on the "Done" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     6. Displayed the message error and does not change the event duration
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/15/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-13      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option     change_event_duration=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=200      y_offset_start_time=100      x_offset_end_time=-300      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
      ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-15: Verify there shall be an error message if 3rd Deg HB event less than 2 beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-15       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-16: Verify there shall be an error message if 3rd Deg HB event to an artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-16       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-17: Verify there shall be an error message if the 3rd Deg HB event as a duration that is not related to the current duration
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: cannot change the event duration when the start time and end time are not within the old range
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Change Event Duration" button
    ...     5. Select the start time and end time are not within the old range on ECG Viewer -> Click on the "Done" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     6. - Displayed the message error: Updating the duration is not possible. Please utilize the 'Add new event' function for this purpose.
    ...        - Does not change the event duration.
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/16/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-17      auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate Chart Scroller     x_offset=-350     y_offset=10
    Filter Thumbnail Option     change_event_duration=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=100      x_offset_end_time=200      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
      ${msg}        Get Message On Aireport
      ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Updating the duration is not possible. Please utilize the 'Add new event' function for this purpose.

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-EDIT-05: Verify that can change the event duration if the new event inside an existing the current event
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can change the event duration if the new event inside an existing the curren event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Change Event Duration" button
    ...     5. Select the start time and end time in the current event on the ECG Viewer -> Click on the "Done" button
    ...     6. Observe the result
    ...     7. Click "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     6,7. Can change the event duration
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Update date: 08/30/2024 - Thang Tran
    ...     Auto Create: 04/16/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-EDIT-05      auto
    Change Duration Event On Row "2"
    Filter Thumbnail Option     change_event_duration=${True}     jum_to_start_time=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-450      y_offset_start_time=100      x_offset_end_time=50      y_offset_end_time=10
    ${expected_datetime}                 Get Start And End Time
    Edit Artifact Event      is_done=${True}
    ${3rd_deg_hb_changed}       Get Events Selected
    ${expected_3rd_deg_hb_change}   Evaluate    [value == '3rd Deg HB' for value in ${3rd_deg_hb_changed}]
    Filter Header     is_save=${True}
    View Each Event Thumbnail On    row=2
    ${infor_events}        Get Thumbnail Ecg Events Selected
    ${panel_infor}         Get Panel Information Event
    ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure    Should Contain     ${expected_3rd_deg_hb_change}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Start Time]     ${panel_start_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Duration]     ${panel_infor}[Duration]
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Channel]     ${panel_infor}[Channel]
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Heart rate]     ${panel_infor}[Heart rate]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-18: Verify there shall be an error message if the 3rd Deg HB event inside an existing AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-18       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-19: Verify there shall be an error message if the 3rd Deg HB event inside an existing Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-19       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-20: Verify there shall be an error message if the 3rd Deg HB event inside an existing Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-20       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-21: Verify there shall be an error message if the 3rd Deg HB event inside an existing Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-21       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-22 : Verify that changing 3rd Deg HB event duration to inside a VT does not modify or remove VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a 3rd Deg HB event is modified to intersect a VT event (by adjusting start or end time), both events remain unchanged and coexist in the timeline
    ...
    ...     Precondition:
    ...    - A completed study containing:
    ...        • One existing VT event
    ...        • One existing 3rd Deg HB event
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event tab
    ...    2. Go to the “3rd Deg HB” sub-tab
    ...    3. Click on an existing 3rd Deg HB event
    ...    4. Use “Change Duration” button to adjust start or end time to intersect with the VT event
    ...    5. Click “Save”
    ...
    ...     Expected Results:
    ...    1. The 3rd Deg HB event duration is updated as per user change
    ...    2. The existing VT event remains unchanged
    ...    3. Both events appear correctly on the timeline without conflict
    ...
    ...     **Others**
    ...     Update date: 6/20/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-22        AIRP-1.16.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-23: Verify there shall be an error message if the 3rd Deg HB event inside an existing SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-23       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-24: Verify there shall be an error message if the 3rd Deg HB event inside an existing 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-24       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-25: Check case the 3rd Deg HB event inside an existing 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-25       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-26: Verify there shall be an error message if the 3rd Deg HB event inside an existing VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-26       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-27: Verify there shall be an error message if the 3rd Deg HB event inside an existing VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-27       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-28: Verify there shall be an error message if the 3rd Deg HB event inside an existing VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-28       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-29: Verify there shall be an error message if the 3rd Deg HB event inside an existing VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-29       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-30: Verify there shall be an error message if the 3rd Deg HB event inside an existing SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-30       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-31: Verify there shall be an error message if the 3rd Deg HB event inside an existing SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-31       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-32: Verify there shall be an error message if the 3rd Deg HB event inside an existing SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-32       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-33: Verify there shall be an error message if the 3rd Deg HB event inside an existing SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-33       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-34: Verify that can change the event duration if the End Time has a duration that is related to the current duration
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can change when select Start Time has not a duration that is related to the current duration
    ...     and End Time has a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Change Event Duration" button
    ...     5. Select Start Time has not a duration that is related to the current duration on the ECG Viewer
    ...     6. Select End Time has a duration that is related to the current duration on the ECG Viewer
    ...     7. Click on the "Done" button -> Observe the result
    ...     8. Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     7,8. Verify the change event duration successfull
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/16/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-34      auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On    row=2
    Filter Thumbnail Option     change_event_duration=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-460      y_offset_start_time=100      x_offset_end_time=-20      y_offset_end_time=10
      ${expected_datetime}                 Get Start And End Time
    Edit Artifact Event      is_done=${True}
      ${3rd_deg_hb_changed}       Get Events Selected
      ${expected_3rd_deg_hb_changed}        Evaluate    [value == '3rd Deg HB' for value in ${3rd_deg_hb_changed}]
    Filter Header     is_save=${True}
    View Each Event Thumbnail On    row=2
      ${infor_events}        Get Thumbnail Ecg Events Selected
      ${panel_infor}         Get Panel Information Event
      ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure     Should Contain     ${expected_3rd_deg_hb_changed}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Start Time]     ${panel_start_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Duration]     ${panel_infor}[Duration]
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Channel]     ${panel_infor}[Channel]
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Heart rate]     ${panel_infor}[Heart rate]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-34.1: Verify that can change the event duration if the Start Time has a duration that is related to the current duration
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can change when select Start Time has a duration that is related to the current duration
    ...     and End Time has not a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Change Event Duration" button
    ...     5. Select Start Time has a duration that is related to the current duration on the ECG Viewer
    ...     6. Select End Time has not a duration that is related to the current duration on the ECG Viewer
    ...     7. Click on the "Done" button -> Observe the result
    ...     8. Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     7,8. Verify the change event duration successfull
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/16/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-34.1      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On    row=2
    Filter Thumbnail Option     change_event_duration=${True}         jum_to_start_time=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-450      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
      ${expected_datetime}                 Get Start And End Time
    Edit Artifact Event      is_done=${True}
      ${afig_changed}       Get Events Selected
      ${event_status}         Evaluate    [value == '3rd Deg HB' for value in ${afig_changed}]
    Filter Header     is_save=${True}
    View Each Event Thumbnail On    row=2
      ${infor_events}        Get Thumbnail Ecg Events Selected
      ${panel_infor}         Get Panel Information Event
      ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure    Should Contain     ${event_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Start Time]     ${panel_start_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Duration]     ${panel_infor}[Duration]
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Channel]     ${panel_infor}[Channel]
    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Heart rate]     ${panel_infor}[Heart rate]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-35: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-35       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-35.1: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-35.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-36: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-36       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-37: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-37       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-38: Verify that changing 3rd Deg HB event duration to intersect VT does not modify or remove VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a 3rd Deg HB event is modified to intersect a VT event (by adjusting start or end time), both events remain unchanged and coexist in the timeline
    ...
    ...     Precondition:
    ...    - A completed study containing:
    ...        • One existing VT event
    ...        • One existing 3rd Deg HB event
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event tab
    ...    2. Go to the “3rd Deg HB” sub-tab
    ...    3. Click on an existing 3rd Deg HB event
    ...    4. Use “Change Duration” button to adjust start or end time to intersect with the VT event
    ...    5. Click “Save”
    ...
    ...     Expected Results:
    ...    1. The 3rd Deg HB event duration is updated as per user change
    ...    2. The existing VT event remains unchanged
    ...    3. Both events appear correctly on the timeline without conflict
    ...
    ...     **Others**
    ...     Update date: 6/20/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-38       AIRP-1.16.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-39: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-39       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-40: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-40       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-41: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-41       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-42: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-42       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-43: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-43       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-44: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-44       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-45: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-45       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-46: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-46       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-47: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-47       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-48: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-48       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-49: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-49       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-50: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-50       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-51: Verify that the 3rd Deg HB event duration is the sum of both events' durations if it intersects with the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-51       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-53: Verify case change 3rd Deg HB duration overrides Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-53       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-54: Verify case change 3rd Deg HB duration overrides VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-54       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-55: Verify case change 3rd Deg HB duration overrides VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-55       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-56: Verify case change 3rd Deg HB duration overrides VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-56       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-57: Verify case change 3rd Deg HB duration overrides VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-57       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-58: Verify case change 3rd Deg HB duration overrides VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-58       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-59: Verify case change 3rd Deg HB duration overrides SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-59       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-60: Verify case change 3rd Deg HB duration overrides SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-60       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-61: Verify case change 3rd Deg HB duration overrides SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-61       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-62: Verify case change 3rd Deg HB duration overrides SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-62       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-63: Verify case change 3rd Deg HB duration overrides SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-63       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-64: Verify case change 3rd Deg HB duration overrides AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-64       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-65: Verify case change 3rd Deg HB duration overrides Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-65       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-66: Verify case change 3rd Deg HB duration overrides Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-66       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-67: Verify case change 3rd Deg HB duration overrides Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-67       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-68: Verify that changing 3rd Deg HB event duration to override VT does not modify or remove VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a 3rd Deg HB event is modified to override a VT event (by adjusting start or end time), both events remain unchanged and coexist in the timeline
    ...
    ...     Precondition:
    ...    - A completed study containing:
    ...        • One existing VT event
    ...        • One existing 3rd Deg HB event
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event tab
    ...    2. Go to the “3rd Deg HB” sub-tab
    ...    3. Click on an existing 3rd Deg HB event
    ...    4. Use “Change Duration” button to adjust start or end time to override with the VT event
    ...    5. Click “Save”
    ...
    ...     Expected Results:
    ...    1. The 3rd Deg HB event duration is updated as per user change
    ...    2. The existing VT event remains unchanged
    ...    3. Both events appear correctly on the timeline without conflict
    ...
    ...     **Others**
    ...     Update date: 6/20/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-68       AIRP-1.16.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-69: Verify case change 3rd Deg HB duration overrides SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-69       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-70: Verify case change 3rd Deg HB duration overrides 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-70       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-71: Verify case change 3rd Deg HB duration overrides 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-71       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-72: Verify that the 3rd Deg HB event is displayed correctly after changing its duration to span multiple days
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-72       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-73: Verify that if the start time is in the ‘No data’ area, start time will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-73       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-74: Verify that if the end time is in the ‘No data’ area, end time will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-74       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-75: Check case 3rd Deg HB event interests with the artifact event has only 1 beat left and duration is less than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. If the edited event intersects with an artifact event,
    ...     - If the artifact event has only 1 beat left and artifact event’s duration is less than 10 seconds, the artifact
    ...     event will be marked as ‘deleted’, the state of this event card will be changed to ‘unsaved’ status
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-75       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-76: Check case 3rd Deg HB event interests with the artifact event has only 1 beat left and duration is larger than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. If the artifact event has only 1 beat left and artifact event’s duration is larger than 10 seconds,
    ...     - The state of this event card will be changed to ‘unsaved’ status.
    ...     - The artifact event will have a new duration with the remaining time after being taken over by the edited event
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-DURATION-76       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-01: Verify the user can view all information on Add new event modal by clicking Add new event button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Event type – there shall be a list of event type for the user to select:
    ...     - 3rd Deg HB
    ...     - Tachy
    ...     - Brady
    ...     - Pause
    ...     - VT
    ...     - SVT
    ...     - 3rd Deg HB
    ...     - 3rd Deg HB
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-01       AIRP-1.12.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-02: Verify the user can view all information on Add new event modal by using W hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Event type – there shall be a list of event type for the user to select:
    ...     - 3rd Deg HB
    ...     - Tachy
    ...     - Brady
    ...     - Pause
    ...     - VT
    ...     - SVT
    ...     - 3rd Deg HB
    ...     - 3rd Deg HB
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-02       AIRP-1.12.0       auto     R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    by_hotkey=W
    ${actual_events_type}     Get List Events Type
    ${expected_events_type}       Create List    AFib   Tachy   Brady   Pause    VT     SVT     2nd Deg HB     3rd Deg HB
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_events_type}      ${actual_events_type}
    ${event_duration}     Check Event Airp Available
    Filter Thumbnail Option    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-03: Verify that the button on "Add New Event" working properly
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The button is enable and displayed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button -> Observe the result
    ...     5. Select the event type
#    ...     6. Select the "Start Time" and "End Time" on ECG view -> Observe the result
    ...
    ...     Expected Results:
    ...     4,6. Verify that the button on add new event working properly
    ...     5. The dropdown list displayed: 3rd Deg HB, Tachy, Brady, Pause, VT, SVT, 3rd Deg HB, 3rd Deg HB
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/16/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen, 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-03     auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    ${event_duration}     Check Event Airp Available
    Filter Thumbnail Option    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-03.1: Verify user can navigate the user to the start time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-03.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-04: Verify the Jump to button shall be disabled if there is no data in the Start time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-04       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-05: Verify user can navigate the user to the end time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-05       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-06: Verify the Jump to button shall be disabled if there is no data in the end time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-06       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-07: Verify the user can close the pop-up and exit the 'Add new' function by clicking the Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-07       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-08: Verify there shall be an error message if only the start time is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-08       AIRP-1.12.0       auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    by_hotkey=W
    Edit Artifact Event    is_start_time=${True}        x_offset_start_time=-450        y_offset_start_time=20      is_add_ecg=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel_ecg=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-09: Verify there shall be an error message if only the end time is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto Create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-09       AIRP-1.12.0        auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    pick_on_end_time=${True}
    Edit Artifact Event    is_end_time=${True}        x_offset_end_time=300        y_offset_end_time=20      is_add_ecg=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel_ecg=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-10: Verify there shall be an error message if the end time is less than the start time
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the change event duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select "End Time" is less than the "Start Time" on ECG Viewer -> Click on the "Done" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     6. Displayed the message error and does not change the event duration
    ...
    ...     **Others**
    ...     Create date: 04/16/2024 - Thang Tran
    ...     Auto Create: 04/16/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-10      auto
    [Setup]    Change Duration Event On Row "1"
    View Each Event Thumbnail On    row=1
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=200      y_offset_start_time=100      x_offset_end_time=-300      y_offset_end_time=10       is_add_ecg=${True}
      ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel_ecg=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-11: Verify there shall be an error message if duration less than 5 seconds
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: cannot add new event if the new event is in the curren event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the time between the start time and the end time is less than 5 seconds on the ECG Viewer -> Click on the "Done" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     6. Check message displayed and can not add new event
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/17/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-11      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-100      y_offset_start_time=10      x_offset_end_time=100      y_offset_end_time=10
    Edit Artifact Event          is_add_ecg=${True}
      ${msg}        Get Message On Aireport
      ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}          It is not possible to create/update an 3rd Deg HB event less than 5 seconds.

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-12: Verify there shall be an error message if less than 2 beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-12       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-14: Verify that cannot add new event if the new event is in the curren event
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: cannot add new event if the new event is in the curren event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the start time and end time in the current event on the ECG Viewer -> Click on the "Done" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     6. Check message displayed and can not add new event
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/22/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen

    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-14      auto
    Change Duration Event On Row "1"
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=100      x_offset_end_time=200      y_offset_end_time=10     is_add_ecg=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel_ecg=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value


BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-19.1: Verify that if the newly created event is independent, it will be stored in the new event list
    [Documentation]     Author: Trinh Nguyen
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 8/27/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-19.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-20: Verify that add new event with event type 3rd Deg HB
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has not a duration that is related to the current duration
    ...     and End Time has a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the "3rd Deg HB" event
    ...     6. Select Start Time has not a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. The new event will overide on the current event -> verify number event on tab "3rd Deg HB"
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/17/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-20      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=2
    Create A New Event With The Newly Selected Start Time And The Event Type "3rd Deg HB"
      ${new_event}          Get New Events
    Edit Artifact Event      is_close=${True}
      ${3rd_deg_hb_changed}       Get Events Selected
      ${event_status}         Evaluate    [value == 'Deleted' for value in ${3rd_deg_hb_changed}]
    Filter Header     is_save=${True}
      ${expected_number_event}        Get Total Number Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${new_event}
    Run Keyword And Continue On Failure    Should Contain    ${event_status}      ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event}     ${expected_number_event}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-20.1: Verify that add new event with the other event type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has not a duration that is related to the current duration
    ...     and End Time has a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...     - Does not existing the event on tab "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB" that event created from tab 3rd Deg HB
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the other event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     6. Select Start Time has not a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. The new event will add new to tab "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB" -> verify the event
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/17/2024 - Thang Tran
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-20.1      AIRP-1.12.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-21: Check case the new 3rd Deg HB event intersects with the current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-21       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-22: Check case the new 3rd Deg HB event intersects with the current Artifact event has only 1 beat left and duration is less than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-22       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-23: Check case the new 3rd Deg HB event intersects with the current Artifact event has only 1 beat left and duration is larger than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-23       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-24: Check case the new 3rd Deg HB event intersects with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-24       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-25: Check case the new 3rd Deg HB event intersects with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-25       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-26: Check case the new 3rd Deg HB event intersects with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-26       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-27: Check case the new 3rd Deg HB event intersects with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-27       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-28: Check case the new 3rd Deg HB event intersects with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-28       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-29: Check case the new 3rd Deg HB event intersects with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-29       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-30: Check case the new 3rd Deg HB event intersects with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-30       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-31: Check case the new 3rd Deg HB event intersects with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-31       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-32: Check case the new 3rd Deg HB event intersects with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-32       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-33: Check case the new 3rd Deg HB event intersects with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-33       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-34: Check case the new 3rd Deg HB event intersects with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-34       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-35: Check case the new 3rd Deg HB event intersects with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-35       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-36: Check case the new 3rd Deg HB event intersects with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-36       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-37: Check case the new 3rd Deg HB event intersects with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-37       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-38: Verify that adding a 3rd Deg HB event intersecting with existing VT event does not remove or modify any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a 3rd Deg HB Deg HBse event is manually added and intersects with a VT event, the system allows both to coexist
    ...    - No merging, deletion, or truncation occurs
    ...
    ...     Precondition:
    ...    - A completed study with at least one VT event already saved
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event tab
    ...    2. Go to the “3rd Deg HB” sub-tab
    ...    3. Click “Add New” and select a segment that intersects with the existing VT event
    ...    4. Save the 3rd Deg HB event
    ...
    ...     Expected Results:
    ...    1. The newly added 3rd Deg HB event is saved as selected
    ...    2. The existing VT event remains unchanged
    ...    3. Both events are displayed in the ECG Event tab and on the timeline
    ...
    ...     **Others**
    ...     Update date: 6/20/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-38       AIRP-1.16.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-39: Check case the new 3rd Deg HB event intersects with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-39       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-40: Check case the new 3rd Deg HB event intersects with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-40       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-41: Check case the new 3rd Deg HB event intersects with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-41       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-13: Check case the new 3rd Deg HB event inside an existing an artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-13       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-14.1: Check case the new 3rd Deg HB event inside an existing AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-14.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-15: Check case the new 3rd Deg HB event inside an existing Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-15       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-16: Check case the new 3rd Deg HB event inside an existing Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-16       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-17: Check case the new 3rd Deg HB event inside an existing SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-17       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-18:Check case the new 3rd Deg HB event inside an existing 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-18       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-19: Check case the new 3rd Deg HB event inside an existing 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-19       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-42: Check case the new 3rd Deg HB event inside an existing current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-42       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-43: Verify that adding a 3rd Deg HB event inside an existing VT event does not remove or modify any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a 3rd Deg HB event is manually added and inside an existing VT event, the system allows both to coexist
    ...    - No merging, deletion, or truncation occurs
    ...
    ...     Precondition:
    ...    - A completed study with at least one VT event already saved
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event tab
    ...    2. Go to the “3rd Deg HB” sub-tab
    ...    3. Click “Add New” and select a segment that inside an existing VT event
    ...    4. Save the 3rd Deg HB event
    ...
    ...     Expected Results:
    ...    1. The newly added 3rd Deg HB event is saved as selected
    ...    2. The existing VT event remains unchanged
    ...    3. Both events are displayed in the ECG Event tab and on the timeline
    ...
    ...     **Others**
    ...     Update date: 6/20/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-43       AIRP-1.16.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-44: Check case the new 3rd Deg HB event inside an existing current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-44       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-45: Check case the new 3rd Deg HB event inside an existing current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-45       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-46: Check case the new 3rd Deg HB event inside an existing current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-46       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-47: Check case the new 3rd Deg HB event inside an existing current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-47       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-48: Check case the new 3rd Deg HB event inside an existing current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-48       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-49: Check case the new 3rd Deg HB event inside an existing current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-49       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-50: Check case the new 3rd Deg HB event inside an existing current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-50       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-51: Check case the new 3rd Deg HB event inside an existing current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-51       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-52: Check case the new 3rd Deg HB event inside an existing current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-52       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-53: Check case the new 3rd Deg HB event inside an existing current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-53       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-54: Check case the new 3rd Deg HB event is overrides current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-54       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-55: Check case the new 3rd Deg HB event is overrides current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-55       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-56: Check case the new 3rd Deg HB event is overrides current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-56       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-57: Check case the new 3rd Deg HB event is overrides current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-57       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-58: Check case the new 3rd Deg HB event is overrides current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-58       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-59: Check case the new 3rd Deg HB event is overrides current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-59       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-60: Check case the new 3rd Deg HB event is overrides current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-60       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-61: Check case the new 3rd Deg HB event is overrides current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-61       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-62: Check case the new 3rd Deg HB event is overrides current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-62       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-63: Check case the new 3rd Deg HB event is overrides current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-63       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-64: Check case the new 3rd Deg HB event is overrides current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-64       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-65: Check case the new 3rd Deg HB event is overrides current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-65       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-66: Check case the new 3rd Deg HB event is overrides current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-66       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-67: Check case the new 3rd Deg HB event is overrides current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-67       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-68: Check case the new 3rd Deg HB event is overrides current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-68       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-69: Verify that adding a 3rd Deg HB event overrides with existing VT event does not remove or modify any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a 3rd Deg HB event is manually added and overrides with a VT event, the system allows both to coexist
    ...    - No merging, deletion, or truncation occurs
    ...
    ...     Precondition:
    ...    - A completed study with at least one VT event already saved
    ...
    ...     Test Steps:
    ...    1. Navigate to the ECG Event tab
    ...    2. Go to the “3rd Deg HB” sub-tab
    ...    3. Click “Add New” and select a segment that overrides with the existing VT event
    ...    4. Save the 3rd Deg HB event
    ...
    ...     Expected Results:
    ...    1. The newly added 3rd Deg HB event is saved as selected
    ...    2. The existing VT event remains unchanged
    ...    3. Both events are displayed in the ECG Event tab and on the timeline
    ...
    ...     **Others**
    ...     Update date: 6/20/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-69       AIRP-1.16.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-70: Check case the new 3rd Deg HB event is overrides current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-70       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-71: Check case the new 3rd Deg HB event is overrides current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-71       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-72: Check case the new 3rd Deg HB event is overrides current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-72       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-73: Check case the new 3rd Deg HB event can overwrite no data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-73       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-74: Check case the start time is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-74       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-75: Check case the end time is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-75       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-76: Verify that the user can add a new 3rd Deg HB event that spans multiple days
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-76       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-77: Verify the user can view all information on the New events modal by clicking the New event list button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Number of events in unsaved status
    ...     2. Event thumbnails
    ...     3. Delete button
    ...     4. View button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-77       AIRP-1.12.0     auto     R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Edit Artifact Event      is_add_ecg=${True}      is_close=${True}
    ${status}       Get Events Selected
    ${expected_status}      Evaluate    [value == 'Deleted' for value in ${status}]
    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
    Navigate To Event Draft Status
    ${event_draft}      Get Thumbnail New Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_draft}
    View New Events On    row=1
    Delete New Events On    row=1
    Edit Artifact Event     is_close=${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-78: Verify the number of event in unsaved status is displayed correctly on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-78       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-79: Verify the user can delete an event by using delete button on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-79       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-80: Verify the user can navigate to the position of the selected event on the HR chart and ECG viewer by using View button on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-80       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-81:Verify that when marking the checkbox 'Use 100% available time', the start time is set to the beginning of the study.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/12/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-81       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${study_information}    Get Study Information
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${start_date}    Get Time Event    start_date=${True}
    ${start_time}    Get Time Event    start_time=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[Start Date]    ${start_date}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[Start Time]    ${start_time}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-82:Verify that when marking the checkbox 'Use 100% available time', the stop time is set to the end of the study
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-82       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${study_information}    Get Study Information
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${end_date}    Get Time Event    end_date=${True}
    ${end_time}    Get Time Event    end_time=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Date]    ${end_date}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Time]    ${end_time}
BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-83:Verify that the checkbox 'Use 100% available time' appears in the 'Add New Event' modal when the event type is set to AFib.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/12/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-83       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib
    ${expected}    Verify Use Add All Afib In Ecg Event
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${expected}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-84:Verify that the checkbox 'Use 100% available time' can be marked when adding a new event with the event type AFib.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-84       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${verify_checkbox}    Get Time Event    is_checkbox_checked=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${verify_checkbox}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-85:Verify that using the 'Jump to' button for the start time will set it to the beginning of the day when the checkbox 'Use 100% available time' is marked
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-85       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-86:Verify that using the 'Jump to' button for the stop time will set it to the end of the day when the checkbox 'Use 100% available time' is marked
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-86       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Tachy type.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Tachy
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}
    
BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.1:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Brady type.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.1       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Brady
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.2:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Pause type.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.2       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Pause
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.3:Verify that the 'Use 100% available time' checkbox is hidden when selecting the VT type.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.3       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=VT
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.4:Verify that the 'Use 100% available time' checkbox is hidden when selecting the SVT type.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.4       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=SVT
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.5:Verify that the 'Use 100% available time' checkbox is hidden when selecting the 2nd Deg HB type.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.5       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=2nd Deg HB
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.6:Verify that the 'Use 100% available time' checkbox is hidden when selecting the 3rd Deg HB type.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-87.6       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=3rd Deg HB
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-88:Verify that when adding a new AFib event with the duration as 100% available time, all AFib events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-88       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    AFib
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}


BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-89:Verify that when adding a new AFib event with the duration as 100% available time, all Tachy events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-89       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    Tachy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-90:Verify that when adding a new AFib event with the duration as 100% available time, all Brady events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/13/205 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-90      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    Brady
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-91:Verify that when adding a new AFib event with the duration as 100% available time, all SVT events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-91       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVT
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-92:Verify that when adding a new AFib event with the duration as 100% available time, all 2nd Deg HB events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-92       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    2nd Deg HB
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-93:Verify that when adding a new AFib event with the duration as 100% available time, all 3rd Deg HB events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-93       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-94:Verify that when adding a new AFib event with the duration as 100% available time, all SVE couplet events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-94       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Couplet
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-95:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Run events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-95       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Run
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-96:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Bigeminy events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-96       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Bigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-97:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Trigeminy events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-97       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Trigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-98:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Quadrigeminy events within that duration will be deleted.
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...     Auto create: 05/15/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-98      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-99:Verify that when adding a new AFib event with the duration as 100% available time, all beats S will be deleted
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 10/02/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-99       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-01: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH1 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-01       AIRP-1.10.0      auto     R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Capture      duration=10s      channel=CH1       comment=Technician comment      is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}        Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        remove_strip=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${datetime}[1]        10s

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-02: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH1 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-03: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH1 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-04: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH2 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-04       AIRP-1.10.0      auto     R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Capture      duration=10s      channel=CH2      comment=Technician comment      is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}        Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        remove_strip=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${datetime}[1]        10s

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-05: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH2 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-06: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH2 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-07: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH3 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-07       AIRP-1.10.0       auto     R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Capture      duration=10s      channel=CH3       comment=Technician comment      is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}        Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        remove_strip=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${datetime}[1]        10s

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-08: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH3 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-09: Verify that the user can mark a strip belonging to an 3rd Deg HB event with CH3 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-10: Verify that the user can mark multiple strips that belong to 3rd Deg HB event at the same time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-11: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/12/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-11       AIRP-1.10.0      auto        R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Capture   comment=test technician comment     is_submit=${True}
    Filter Header    is_save=${True}
    View Each Event Thumbnail On    row=1
    ${panel_infor}      Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${panel_infor}.items()]
    ${expected_items_pannel}        Create List    Start time     Duration     Channel     Heart rate     Captured strips
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_items_pannel}        ${actual_items_panel}
    Filter Capture   comment=test technician comment update     is_submit=${True}
    Filter Header    is_save=${True}
    ${actual_panel_infor}      Get Panel Information Event
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_infor}[Captured strips]       ${actual_panel_infor}[Captured strips]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-12: Verify the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-13: Verify the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-14: Verify the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-15: Verify the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-16: Verify that the user cannot mark a strip belonging to an 3rd Deg HB event without entering Technician comment
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...     Auto create: 09/12/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-16       AIRP-1.10.0         auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Capture     is_submit=${True}
    ${msg}     Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a comment

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-17: Verify the system shall automatically recapture the strip in case updating N/S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-18: Check case the capture duration 20s is disabled on pop-up
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-19: Check case the capture duration 30s is disabled on pop-up
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-20: Verify that the technician comment field allows a maximum of 520 characters
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-CAPTURE-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-01: Verify that the Reset button shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-01       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-07: Verify that the Reset button shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-07       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-08: Verify that the Reset button shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-08       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-09: Verify that the Reset button shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event to 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-09       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-10: Verify that the Reset button shall displayed on the 3rd Deg HB tab after deleting 3rd Deg HB events using delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-10       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-11: Verify that the Reset button shall displayed on the 3rd Deg HB tab after deleting 3rd Deg HB events using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-11       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-12: Verify that the Reset button shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as artifact using Mark as artifact button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-12       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-13: Verify that the Reset button shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as artifact using A hokey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-13       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-14: Verify that the Reset button shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event duration using Change event duration button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-14       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-15: Verify that the Reset button shall displayed on the 3rd Deg HB tab after changing 3rd Deg HB event duration using C hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-15       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-16: Verify that the Reset button shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-16       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-17: Verify that the Reset button shall displayed on the 3rd Deg HB tab after marking 3rd Deg HB events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-17       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-18: Verify that the Reset button shall displayed on the 3rd Deg HB tab after unmarking 3rd Deg HB events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-18       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-19: Verify that the Reset button shall displayed on the 3rd Deg HB tab after unmarking 3rd Deg HB events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-19       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-20: Verify that the Reset button shall displayed on the 3rd Deg HB tab after capturing 3rd Deg HB event using Capture button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-20       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-21: Verify that the Reset button shall displayed on the 3rd Deg HB tab after updating Technician comment on panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-21       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-22: Verify that the Reset button shall displayed on the 3rd Deg HB tab after removing 3rd Deg HB strip on Panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-22       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-23: Verify that the Reset button shall displayed on the 3rd Deg HB tab after marking all 3rd Deg HB event as artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-23       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-24: Verify that the Reset button shall displayed on the 3rd Deg HB tab after deleting all 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-24       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-25: Verify that the changes will be reset by clicking on the Reset button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 09/11/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-25       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-26: Verify the user can reset all changes when using the 'Reset all changes' function
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: select "Reset all changes" then the All event 3rd Deg HB not change and back to original
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Hover to 3rd Deg HB tab
    ...     4. Select option "Mark all as artifact" or "Delete all events"
    ...     5. Select option "Reset all changes"
    ...     6. Select on the "Save" button
    ...     7. Observe the result
    ...
    ...     Expected Results:
    ...     5,7. - Verify option: All the value event back to original, not changes events
    ...          - Number event on 3rd Deg HB back to original
    ...
    ...     **Others**
    ...     Create date: 04/04/2024 - Thang Tran
    ...     Auto Create: 04/17/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-26       AIRP-1.14.0             auto      R2
    Navigate Airp Tab     tab=ECG Events
      ${rhythm_menu}     Get List Rhythm Menu Ecg Events
      ${number_event}                 Evaluate    '${rhythm_menu}[3rd Deg HB]'
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Option Select All    delete_all_events=${True}
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Option Select All    reset_all_change=${True}
    Filter Header    is_save=${True}
      ${total_number}         Get Total Number Events
      ${status}     Check Number Event Strips    total_number_event=${total_number}     number_on_section=${number_event}
    Run Keyword And Continue On Failure    Should Be Equal        ${status}    ${True}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-27: Verify that the 'Reset All Changes' function works correctly if the user has used the 'Delete all events' function before
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
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-27       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-28: Verify that the 'Reset All Changes' function works correctly if the user has used the 'Mark all as artifact' function before
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
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-RESET-28       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-01: Verify that the user can add a new independent event when the current event is not of the same type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     6. Select Start Time has a duration that is not related to the current duration on the ECG Viewer
    ...     7. Select End Time has not a duration that is not related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. The new event will add new to tab "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB" -> verify the event
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Update date: 08/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-01     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-02: Verify that the user can add new event if the Start Time has a duration that is related to the current duration with the same event type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has a duration that is related to the current duration
    ...     and End Time has not a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the event type "3rd Deg HB"
    ...     6. Select Start Time has a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has not a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. If the select current event type -> the new event will overide on the current event -> verify number event on tab "3rd Deg HB"
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/22/2024 - Thang Tran
    ...     Update date: 08/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-02     auto
    Change Duration Event On Row "3"
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=3
      ${actual_start_time}         Get Thumbnail Ecg Events Selected
    Create A New Event With The Newly Selected End Time And The Event Type "3rd Deg HB"
      ${new_event}          Get New Events
    Edit Artifact Event      is_close=${True}
      ${3rd_deg_hb_changed}       Get Events Selected
      ${event_status}         Evaluate    [value == 'Deleted' for value in ${3rd_deg_hb_changed}]
    Filter Header     is_save=${True}
      ${expected_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=3
      ${expected_start_time}         Get Thumbnail Ecg Events Selected
      ${panel_infor}          Get Panel Information Event
      ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${new_event}
    Run Keyword And Continue On Failure    Should Contain     ${event_status}     ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event}     ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_start_time}[0][Start Time]     ${expected_start_time}[0][Start Time]
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_start_time}     ${expected_start_time}[0][Start Time]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-03: Verify that can add new event if the Start Time has a duration that is related to the current duration with the other event type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has a duration that is related to the current duration
    ...     and End Time has not a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     6. Select Start Time has a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has not a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9.If the select an other event type -> the new event will add new to tab "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB" -> verify the event
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/22/2024 - Thang Tran
    ...     Update date: 08/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-03      auto
    Change Duration Event On Row "3"
    Navigate To Ecg Events Subtab    Tachy
      ${number_events}        Get Total Number Events
      ${actual_number_events_tachy}        Evaluate    ${number_events} + 1
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=3
    Create A New Event With The Newly Selected End Time And The Event Type "Tachy"
    Edit Artifact Event      is_close=${True}
    Filter Header     is_save=${True}
    Navigate To Ecg Events Subtab    Tachy
      ${expected_number_events_tachy}        Get Total Number Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${expected_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=3
    Filter Thumbnail Option       is_deleted_event=${True}
    Filter Header     is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event}     ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_events_tachy}     ${expected_number_events_tachy}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-04: Verify that the user can add a new event of the same type with a start/end time that is close to the current event
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: the new event cannot be added to the other event type when the new event already exists on the event.
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - Exists the new event added from the event on tab 3rd Deg HB
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the event that already exists as another event with the event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     5. Click on the "Add New Event" button
    ...     6. Select an other event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     7. Select the start time and end time that the same event time exists in the event on the tab "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. "The current event will be marked as ‘deleted’ and the new event will be stored in the new event list " -> Trinh update
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/22/2024 - Thang Tran
    ...     Update date: 08/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-04      auto
    Create A New Event With The Newly Selected Start Time And The Event Type "VT" On Row "5"
    Navigate To Ecg Events Subtab    VT
      ${actual_number_event_vt}        Get Total Number Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_number_event_3rd_deg_hb}        Get Total Number Events
    View Each Event Thumbnail On    row=5
    Create A New Event With The Newly Selected Start Time And The Event Type "VT"
    Edit Artifact Event      is_close=${True}
    Filter Header     is_save=${True}
    Navigate To Ecg Events Subtab    VT
      ${expected_number_events_vt}        Get Total Number Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${expected_number_event_3rd_deg_hb}        Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event_vt}     ${expected_number_events_vt}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event_3rd_deg_hb}     ${expected_number_event_3rd_deg_hb}
#Trinh: Tr se confirm voi BA ve case nay
#Trinh: bug 1381

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-05: Verify that can add a new event if the selected start time and end time of the event overrides the current event
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     6. Selected start time and end time of the event overrides the current event
    ...     8. Click on the "Done" button
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. - The new event will add new to tab "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB" -> verify the event
    ...        - Check event on the "3rd Deg HB" tab has been deleted
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 04/22/2024 - Thang Tran
    ...     Update date: 08/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-05      auto
    Change Duration Event On Row "3"
    Navigate To Ecg Events Subtab    Tachy
      ${number_events}        Get Total Number Events
      ${actual_number_events_tachy}        Evaluate    ${number_events} + 1
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=3
    Create A New Event With The Event Overrides The Current Event And The Event Type "Tachy"
    Edit Artifact Event      is_close=${True}
    Filter Header     is_save=${True}
    Navigate To Ecg Events Subtab    Tachy
      ${expected_number_events_tachy}        Get Total Number Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${expected_number_event}        Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event}     ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_events_tachy}     ${expected_number_events_tachy}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-06: Verify that the new event cannot be added to the other event type when the new event already exists on the event.
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: the new event cannot be added to the other event type when the new event already exists on the event.
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - Exists the new event added from the event on tab 3rd Deg HB
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Select the event that already exists as another event with the event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     5. Click on the "Add New Event" button
    ...     6. Select an other event type "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     7. Select the start time and end time that the same event time exists in the event on the tab "Tachy/Brady/Pause/VT/SVT/3rd Deg HB/3rd Deg HB"
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. Verify the new event cannot be added to the event that already exists
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 05/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-06      auto
    [Setup]    Create A New Event With The Newly Selected Start Time And The Event Type "VT" On Row "5"
    Navigate To Ecg Events Subtab    VT
      ${actual_number_event_vt}        Get Total Number Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${actual_number_event_3rd_deg_hb}        Get Total Number Events
    View Each Event Thumbnail On    row=5
    Create A New Event With The Newly Selected Start Time And The Event Type "VT"
    Edit Artifact Event      is_close=${True}
    Filter Header     is_save=${True}
    Navigate To Ecg Events Subtab    VT
      ${expected_number_events_vt}        Get Total Number Events
    Navigate To Ecg Events Subtab    3rd Deg HB
      ${expected_number_event_3rd_deg_hb}        Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event_vt}     ${expected_number_events_vt}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event_3rd_deg_hb}     ${expected_number_event_3rd_deg_hb}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-07: Verify that the cannot add new event if the Start Time has a duration that is related to the current duration with the same event type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has a duration that is related to the current duration
    ...     and End Time has not a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the event type "3rd Deg HB"
    ...     6. Select Start Time has a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has not a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. If the select current event type -> the new event will overide on the current event -> verify number event on tab "3rd Deg HB"
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 05/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-07     auto
    Change Duration Event On Row "3"
    View Each Event Thumbnail On    row=3
    ${actual_start_time}         Get Thumbnail Ecg Events Selected
    Create A New Event With The Newly Selected End Time And The Event Type "3rd Deg HB"
    ${new_event}          Get New Events
    Edit Artifact Event      is_close=${True}
    ${3rd_deg_hb_changed}       Get Events Selected
    Filter Header     is_save=${True}
    ${expected_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=3
    ${expected_start_time}         Get Thumbnail Ecg Events Selected
    ${panel_infor}          Get Panel Information Event
    ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${new_event}
    Run Keyword And Continue On Failure    List Should Contain Value    ${3rd_deg_hb_changed}     Deleted
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event}     ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_start_time}[0][Start Time]     ${expected_start_time}[0][Start Time]
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_start_time}     ${expected_start_time}[0][Start Time]

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-08: Verify that can add new event if the Start Time has a duration that is related to the current duration with the other event type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has a duration that is related to the current duration
    ...     and End Time has not a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "3rd Deg HB" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the event type "Tachy/Brady/Pause/VT/SVT/2nd Deg HB/3rd Deg HB"
    ...     6. Select Start Time has a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has not a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observe the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observe the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9.If the select an other event type -> the new event will add new to tab "Tachy/Brady/Pause/VT/SVT/2nd Deg HB/3rd Deg HB" -> verify the event
    ...
    ...     **Others**
    ...     Create date: 04/09/2024 - Thang Tran
    ...     Auto Create: 05/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-ADD-OTHER-08      auto
    Change Duration Event On Row "3"
    Navigate To Ecg Events Subtab    Tachy
    ${number_events}        Get Total Number Events
    ${actual_number_events_tachy}        Evaluate    ${number_events} + 1
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${actual_number_events}        Get Total Number Events
    View Each Event Thumbnail On    row=3
    Create A New Event With The Newly Selected End Time And The Event Type "Tachy"
    Edit Artifact Event      is_close=${True}
    Filter Header     is_save=${True}
    Navigate To Ecg Events Subtab    Tachy
    ${expected_number_events_tachy}        Get Total Number Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${expected_number_event}        Get Total Number Events
    View Each Event Thumbnail On    row=3
    Filter Thumbnail Option       is_deleted_event=${True}
    Filter Header     is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_events}     ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_events_tachy}     ${expected_number_events_tachy}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-02: Verify signal beat marks on the thumbnail display correctly in the first view
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-02       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-03: Verify beat types on the thumbnail match the beat types on the corresponding ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-03       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-04: Verify the number of beats on the thumbnail matches the number of beats on the corresponding ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-04       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-05: Verify that the color of each beat on the thumbnail type displays correctly
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-05       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-06: Verify N beats on thumbnail is deleted when deleting N beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-06       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-07: Verify S beats on thumbnail is deleted when deleting S beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-07       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-08: Verify V beats on thumbnail is deleted when deleting V beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-08       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-09: Verify Q beats on thumbnail is deleted when deleting Q beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-09       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-10: Verify N beats on thumbnail is updated to S beats when changing N beats to S beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-10       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-11: Verify N beats on thumbnail is updated to V beats when changing N beats to V beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-11       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-12: Verify N beats on thumbnail is updated to Q beats when changing N beats to Q beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-12       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-13: Verify S beats on thumbnail is updated to N beats when changing S beats to N beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-13       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-14: Verify S beats on thumbnail is updated to V beats when changing S beats to V beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-14       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-15: Verify S beats on thumbnail is updated to Q beats when changing S beats to Q beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-15       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-16: Verify V beats on thumbnail is updated to N beats when changing V beats to N beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-16       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-17: Verify V beats on thumbnail is updated to S beats when changing V beats to S beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-17       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-18: Verify V beats on thumbnail is updated to Q beats when changing V beats to Q beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-18       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-19: Verify Q beats on thumbnail is updated to N beats when changing Q beats to N beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-19       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-20: Verify Q beats on thumbnail is updated to V beats when changing Q beats to V beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-20       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-21: Verify Q beats on thumbnail is updated to S beats when changing Q beats to S beats on ECG Viewer
    [Documentation]     Author: Hang Le
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 05/06/2025 - Hang Le

    [Tags]      BFCC-AIRP-ECG-EVENT-3RD-DEG-HB-THUMBNAIL-21       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_airp]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[study_id_completed]
    Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

##SUITE SETUP
#    ${BROWSER_NODE}      Start Browser
#    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
#    Import Library       project_bioflux_callcenter_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
#    Import Library       project_bioflux_callcenter_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
#    ${NEW_USERS}         Get Config Param    NEW_USERS
#    ${CURRENT_USER}      Set Variable        ${NEW_USERS}[callcenter_ai]
#    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
#    ${TOKEN}             Sign In Callcenter  ${username}      ${password}
#    Set Suite Variable   ${TOKEN}
#    Set Suite Metadata   version   ${RELEASE_VERSION}
#    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Stop Processing
    Quit Browser

Navigate to aireport
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success

Change strips to beats by hotkey "${keyword}"
    ${number_beats}   Get Information Cell On Chart
    ${results}     Change Strip To Beats On Page     beat_change_by_hotkey=${keyword}
    Run Keyword And Continue On Failure    Should Be Equal    ${results}        ${keyword}
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - 1
    Filter Header    is_save=${True}
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Change strips to beats by button "${beat_name}"
    ${number_beats}   Get Information Cell On Chart
    ${results}     Change Strip To Beats On Page     beat_change=beat${beat_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${results}        ${beat_name}
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - 1
    Filter Header    is_save=${True}
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Verify delete a event by button
    ${current_numbers}         Get Total Number Events
    Filter Thumbnail Option    is_deleted_event=${True}
    ${event_selected}              Get Events Selected
    ${expected_status}      Check Button Thumbnail Header Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_rhythm=${True}
    Filter Thumbnail Option    is_deleted_event=${True}
    ${event_selected}              Get Events Selected
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_selected}     Deleted
    Filter Header    is_save=${True}
    ${actual_current_numbers}       Evaluate    ${current_numbers} - 1
    ${expected_current_numbers}         Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_current_numbers}   ${actual_current_numbers}

Verify delete a event by hotkey
    ${current_numbers}         Get Total Number Events
    Filter Thumbnail Option    by_hotkey=D
    ${event_selected}              Get Events Selected
    ${expected_status}      Check Button Thumbnail Header Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_rhythm=${True}
    Filter Thumbnail Option    by_hotkey=D
    ${event_selected}              Get Events Selected
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_selected}     Deleted
    Filter Header    is_save=${True}
    ${actual_current_numbers}       Evaluate    ${current_numbers} - 1
    ${expected_current_numbers}         Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_current_numbers}   ${actual_current_numbers}

Verify delete multiple events by button
    ${current_numbers}         Get Total Number Events
    View Each Event Thumbnail On    row=2
    View Multiple Each Event Thumbnail On    row=3
    Filter Thumbnail Option    is_deleted_event=${True}
    ${event_selected}              Get Events Selected
    ${expected_status}      Check Button Thumbnail Header Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_rhythm=${True}
    Filter Thumbnail Option    is_deleted_event=${True}
    ${event_selected}              Get Events Selected
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_selected}     Deleted
    Filter Header    is_save=${True}
    ${actual_current_numbers}       Evaluate    ${current_numbers} - 2
    ${expected_current_numbers}         Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_current_numbers}   ${actual_current_numbers}

Verify delete multiple events by hotkey
    ${current_numbers}         Get Total Number Events
    View Each Event Thumbnail On    row=2
    View Multiple Each Event Thumbnail On    row=3
    Filter Thumbnail Option    by_hotkey=D
    ${event_selected}              Get Events Selected
    ${expected_status}      Check Button Thumbnail Header Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_rhythm=${True}
    Filter Thumbnail Option    by_hotkey=D
    ${event_selected}              Get Events Selected
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_selected}     Deleted
    Filter Header    is_save=${True}
    ${actual_current_numbers}       Evaluate    ${current_numbers} - 2
    ${expected_current_numbers}         Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_current_numbers}   ${actual_current_numbers}

Check reset change on beat "${beat_name}"
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    ${results}     Change Strip To Beats On Page     beat_change=beat${beat_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${results}        ${beat_name}
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}

Check beats change by action with hotkey "${hotkey_name}" for beat "${beat_name}"
    ${cell_random}     Get Elements Cell On Chart
    Select Cell On Chart    element_or_locator=${cell_random}
    ${number_beats}   Get Information Cell On Chart
    ${beats}              Get All Strips Beats
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Edit Page Number      page_number=1
    Change Strip To Beats On Page     beat_change_by_hotkey=${hotkey_name}
    ${beats}              Get All Strips Beats
    ${actual_beats_name_change}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${actual_beats_name_change}        ${beat_name}
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        Change all to ${beat_name} beat
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       Change all to ${beat_name} beat
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Hotkey]       ${hotkey_name}
    Filter Header    is_save=${True}
    ${msg}              Get Message Notification
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[Beat Message]      Select a cell on the heatmap chart below to view its beats.
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[ECG Message]       There is no ECG data to display.

Create a new event with the newly selected start time and the event type "${event_type}"
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=${event_type}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=100      y_offset_end_time=10
    ${expected_datetime}                 Get Start And End Time
    Filter Thumbnail Option      is_add=${True}
    View New Events On    row=1
    ${actual_thumbnail_new_event}        Get Thumbnail New Events
    Set Global Variable    ${expected_datetime}
    Set Global Variable    ${actual_thumbnail_new_event}

Create a new event with the newly selected start time and the event type "${event_type}" on row "${row_number}"
#    Navigate To Aireport
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On    row=${row_number}
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=${event_type}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=100      y_offset_end_time=10
    Filter Thumbnail Option      is_add=${True}
    Edit Artifact Event      is_close=${True}
    Filter Header     is_save=${True}

Create a new event with the newly selected end time and the event type "${event_type}"
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=${event_type}
    Edit Artifact Event      is_start_time=${True}     x_offset_start_time=-100      y_offset_start_time=100
    Edit Artifact Event      is_end_time=${True}  x_offset_end_time=400      y_offset_end_time=10
    ${expected_datetime}                 Get Start And End Time
    Filter Thumbnail Option  is_add=${True}
    View New Events On    row=1
    ${actual_thumbnail_new_event}        Get Thumbnail New Events
    Set Global Variable    ${expected_datetime}
    Set Global Variable    ${actual_thumbnail_new_event}

Create a new event with the event overrides the current event and the event type "${event_type}"
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=${event_type}
    Edit Artifact Event      is_start_time=${True}     x_offset_start_time=-430      y_offset_start_time=100
    Edit Artifact Event      is_end_time=${True}  x_offset_end_time=400      y_offset_end_time=10
    ${expected_datetime}                 Get Start And End Time
    Filter Thumbnail Option  is_add=${True}
    View New Events On    row=1
    ${actual_thumbnail_new_event}        Get Thumbnail New Events
    Set Global Variable    ${expected_datetime}
    Set Global Variable    ${actual_thumbnail_new_event}

Change duration event on row "${row_number}"
#    Navigate To Aireport
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On    row=${row_number}
    Filter Thumbnail Option     change_event_duration=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Filter Thumbnail Option      is_done=${True}
    Filter Header     is_save=${True}
    ${actual_number_event}        Get Total Number Events
    Set Global Variable    ${actual_number_event}

#Get toltal numer event on subtab "${subtab}"
#    Navigate To Ecg Events Subtab    ${subtab}
#    ${expected_number_event}        Get Total Number Events
#    Set Global Variable    ${expected_number_event}
Capture afib event
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On   row=2
    Filter Capture      comment=Test        is_submit=${True}
    Filter Header    is_save=${True}

Create capture afib event unsave status on panel tab "${tab_name}"
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    View Each Event Thumbnail On      row=1
    Filter Header    panel_tab=${tab_name}
    Mark A Strip Airp    technician_comment=test capture ob tab minute info        title=Thang Capture      is_save=${True}

Create new artifact event
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-450      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Filter Thumbnail Option      is_done=${True}
    Filter Header     is_save=${True}
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-450      y_offset_start_time=10      x_offset_end_time=100      y_offset_end_time=10
    Edit Artifact Event      is_submit=${True}           is_close=${True}
    Filter Header    is_save=${True}

Change event type "${event_original}" to event type "${event_change}"
    Navigate To Ecg Events Subtab    ${event_change}
    ${current_number}         Get Total Number Events
    ${expected_number}        Evaluate    ${current_number} + 1
    Navigate To Ecg Events Subtab    ${event_original}
    ${actual_3rd_deg_hb}     Get Total Number Events
    ${actual_3rd_deg_hb_events}     Evaluate    ${actual_3rd_deg_hb} - 1
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=${event_change}     is_save=${True}
    ${events}       Get Events Selected
    ${event_status}         Evaluate    [value == '${event_change}' for value in ${events}]
    Filter Header    is_save=${True}
    ${expected_3rd_deg_hb_events}     Get Total Number Events
    Navigate To Ecg Events Subtab    ${event_change}
    ${actual_number}         Get Total Number Events
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number}      ${actual_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_3rd_deg_hb_events}      ${actual_3rd_deg_hb_events}

Add event type "${event_original}" to event type "${event_change}"
    Navigate To Ecg Events Subtab    ${event_change}
    ${current_number}         Get Total Number Events
    ${expected_number}        Evaluate    ${current_number} + 1
    Navigate To Ecg Events Subtab    ${event_original}
    Filter Thumbnail Option     change_event_duration=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Filter Thumbnail Option      is_done=${True}
    Filter Header     is_save=${True}
    ${current_number_3rd_deg_hb}         Get Total Number Events
    ${expected_number_3rd_deg_hb}        Evaluate    ${current_number_3rd_deg_hb} - 1
    View Each Event Thumbnail On    row=1
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=${event_change}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-450      y_offset_start_time=100      x_offset_end_time=420      y_offset_end_time=10     is_add_ecg=${True}
    Edit Artifact Event      is_close=${True}
    ${event_selected}       Get Events Selected
    ${expected_status}      Evaluate    [value == 'Deleted' for value in ${event_selected}]
    Filter Header    is_save=${True}
    ${actual_number_3rd_deg_hb}         Get Total Number Events
    Navigate To Ecg Events Subtab    ${event_change}
    ${actual_number}         Get Total Number Events
    Set Global Variable    ${expected_number_3rd_deg_hb}
    Set Global Variable    ${actual_number_3rd_deg_hb}
    Set Global Variable    ${expected_status}
    Set Global Variable    ${expected_number}
    Set Global Variable    ${actual_number}

Verify Unsaved Symbol Is Displayed
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}