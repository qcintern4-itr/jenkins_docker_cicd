*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-BEAT-AFIB
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
Force Tags      BFCC-AIRP-BEAT-AFIB   web
Test Timeout    15m

*** Test Cases ***
BFCC-AIRP-BEAT-AFIB-VIEW-01: Verify all components on the AFib event tab are displayed correctly in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-01       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-02: Check Reviewed status in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-02       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-03: Verify the menu option shall not displayed in case "There is no data to display"
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-03       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-04: Verify that if the number of AFib events exceeds 100, it displays as '99+'
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-04       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${total_number}         Get Total Number Afib Events Beats Hr
    Edit Page Number    page_number=1
    ${number_event_on_tab}     Get Number Of Afib Events On Menu
    ${number_of_events_hover}         Get Number Events On Tab Menu
    ${status}     Check Number Event Strips    total_number_event=${total_number}     number_on_section=${number_event_on_tab}
    Run Keyword And Continue On Failure    Should Be Equal       ${total_number}     ${number_of_events_hover}
    Run Keyword And Continue On Failure    Should Be True        ${status}

BFCC-AIRP-BEAT-AFIB-VIEW-05: Verify that when the user hovers over '99+', the correct number of events is displayed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-05       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-06: Verify that the unsaved symbol shall displayed on the AFib tab after changing AFib event to VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-06       AIRP-1.10.0      auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=VT     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-07: Verify that the unsaved symbol shall displayed on the AFib tab after changing AFib event to SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-07       AIRP-1.10.0         auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=SVT     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-08: Verify that the unsaved symbol shall displayed on the AFib tab after changing AFib event to 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-08       AIRP-1.10.0         auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=2nd Deg HB     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-09: Verify that the unsaved symbol shall displayed on the AFib tab after changing AFib event to 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-09       AIRP-1.10.0        auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=3rd Deg HB     is_save=${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-10: Verify that the unsaved symbol shall displayed on the AFib tab after deleting AFib events using delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-10       AIRP-1.10.0       auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Header    is_deleted=${True}
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    [value == 'Deleted' for value in ${event_type_change}]
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}


BFCC-AIRP-BEAT-AFIB-VIEW-11: Verify that the unsaved symbol shall displayed on the AFib tab after deleting AFib events using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-11       AIRP-1.10.0       auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Thumbnail Option     by_hotkey=D
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    [value == 'Deleted' for value in ${event_type_change}]
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-12: Verify that the unsaved symbol shall displayed on the AFib tab after marking AFib events as artifact using Mark as artifact button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-12       AIRP-1.10.0         auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Header    is_mark_artifact=${True}
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    [value == 'Artifact' for value in ${event_type_change}]
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-13: Verify that the unsaved symbol shall displayed on the AFib tab after marking AFib events as artifact using A hokey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-13       AIRP-1.10.0             auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Thumbnail Option     by_hotkey=A
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    [value == 'Artifact' for value in ${event_type_change}]
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}
    

BFCC-AIRP-BEAT-AFIB-VIEW-14: Verify that the unsaved symbol shall displayed on the AFib tab after changing AFib event duration using Change event duration button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-14       AIRP-1.10.0      manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    View Each Event Thumbnail On      row=1
#    Change Event Duration Airp
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
#    Filter Thumbnail Option      is_done=${True}
#    ${event_type_change}     Get Events Selected
#    ${event_status}         Evaluate    [value == 'AFib' for value in ${event_type_change}]
#    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
#    Filter Header    is_reset_change=${True}
#    Filter Thumbnail Option     by_hotkey=C
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
#    Filter Thumbnail Option      is_done=${True}
#    ${event_type_change}     Get Events Selected
#    ${event_status}         Evaluate    [value == 'AFib' for value in ${event_type_change}]
#    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
#    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-15: Verify that the unsaved symbol shall displayed on the AFib tab after changing AFib event duration using C hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-15       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-16: Verify that the unsaved symbol shall displayed on the AFib tab after marking AFib events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-16       AIRP-1.10.0       auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Header    mark_reviewed=${True}
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    [value == 'AFib' for value in ${event_type_change}]
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-17: Verify that the unsaved symbol shall displayed on the AFib tab after marking AFib events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-17       AIRP-1.10.0             auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Thumbnail Option     by_hotkey=R
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    [value == 'AFib' for value in ${event_type_change}]
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-18: Verify that the unsaved symbol shall displayed on the AFib tab after unmarking AFib events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-18       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-19: Verify that the unsaved symbol shall displayed on the AFib tab after unmarking AFib events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-19       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-20: Verify that the unsaved symbol shall displayed on the AFib tab after capturing AFib event using Capture button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-20       AIRP-1.10.0        auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Filter Capture      comment=Test new        is_submit=${True}
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    [value == 'AFib' for value in ${event_type_change}]
    Run Keyword And Continue On Failure    Should Contain    ${event_status}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}

BFCC-AIRP-BEAT-AFIB-VIEW-21: Verify that the unsaved symbol shall displayed on the AFib tab after updating Technician comment on panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 04/02/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-21       AIRP-1.10.0             auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Filter Capture      comment=Test        is_submit=${True}
    Filter Header       is_save=${True}
    Filter Panel        view_detail=${True}     technician_comment=Test update the technician comment    is_done=${True}
    ${event_selected_update}     Get Events Selected
    ${status_event_update}         Evaluate    [value == 'AFib' for value in ${event_selected_update}]
    Run Keyword And Continue On Failure    Should Contain    ${status_event_update}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_change=${True}


BFCC-AIRP-BEAT-AFIB-VIEW-22: Verify that the unsaved symbol shall displayed on the AFib tab after removing AFib strip on Panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-22       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-23: Verify that the unsaved symbol shall displayed on the AFib tab after marking all AFib event as artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-23       AIRP-1.10.0      auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Option Select All        mark_all_artifact=${True}
    ${event_type_change}     Get Events Selected
    ${event_status}         Evaluate    all([value == 'Artifact' for value in ${event_type_change}])
    Navigate To Afib Events Tab
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Option Select All    reset_all_change=${False}
    ${mark_all_artifact}      Check Select All Option Available
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}        ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${mark_all_artifact}[Mark all as artifact]        ${True}

BFCC-AIRP-BEAT-AFIB-VIEW-24: Verify that the unsaved symbol shall displayed on the AFib tab after deleting all AFib event as artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-24       AIRP-1.10.0        auto    R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Option Select All    delete_all_events=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Navigate To Afib Events Tab
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-BEAT-AFIB-VIEW-28: Can navigate between events in the list by using keyboard (Arrow left/right/up/down)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-28   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-01: Verify the first event will be selected by default
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-01       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-02: Verify the the thumbnail is displayed correctly in the first view
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-02       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-03: Verify the channel on thumbnail is displayed correctly after selecting only CH1 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-03       AIRP-1.10.0     auto      R2
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Header    channel=CH1
    ${events_thumbnail}     Get Thumbnail Ecg Events
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH1' for value in ${actual_channel}])
    Run Keyword And Continue On Failure     Should Be Equal     ${all_value}     ${True}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-04: Verify the channel on thumbnail is displayed correctly after selecting only CH2 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-04       AIRP-1.10.0        auto      R2
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Header    channel=CH2
    ${events_thumbnail}     Get Thumbnail Ecg Events
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH2' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be Equal     ${all_value}     ${True}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-05: Verify the channel on thumbnail is displayed correctly after selecting only CH3 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-05       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Header    channel=CH3
    ${events_thumbnail}     Get Thumbnail Ecg Events
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH3' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be Equal     ${all_value}     ${True}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-06: Verify the channel on thumbnail is displayed correctly after selecting only AI channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-07: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH2 channels
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-07       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-08: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH3 channels
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-09: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH3 channels
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-10: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH2 & CH3 channels
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-11: Verify the size on thumbnail is displayed correctly after selecting Small size
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-11       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${number_small_size}          Filter Header    size=Small
    ${number_medium_size}         Filter Header    size=Medium
    ${number_large_size}          Filter Header    size=Large
    ${number_status}              Verify Number Size Heatmap    number_small=${number_small_size}   number_medium=${number_medium_size}     number_large=${number_large_size}
    Run Keyword And Continue On Failure    Should Be Equal     ${number_status}     ${True}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-12: Verify the size on thumbnail is displayed correctly after selecting Medium size
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-13: Verify the size on thumbnail is displayed correctly after selecting Large size
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-14: Verify the gain on thumbnail is displayed correctly after selecting 1 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-15: Verify the gain on thumbnail is displayed correctly after selecting 2 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-16: Verify the gain on thumbnail is displayed correctly after selecting 5 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-18: Verify the gain on thumbnail is displayed correctly after selecting 7.5 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-19: Verify the gain on thumbnail is displayed correctly after selecting 10 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-20: Verify the gain on thumbnail is displayed correctly after selecting 20 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-21: Verify the gain on thumbnail is displayed correctly after selecting 50 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-22: Verify the gain on thumbnail is displayed correctly after selecting 100 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-23: Verify the gain on thumbnail is displayed correctly after selecting 200 mm/mV gain
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-24: Verify the HP on thumbnail is displayed correctly after selecting No HP
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-25: Verify the HP on thumbnail is displayed correctly after selecting 0.05 Hz HP
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-25       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-26: Verify the HP on thumbnail is displayed correctly after selecting 0.5 Hz HP
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-27: Verify the HP on thumbnail is displayed correctly after selecting 1 Hz HP
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-27       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-28: Verify the HP on thumbnail is displayed correctly after selecting 2 Hz HP
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-FUNCTIONALITY-28       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PAGINATION-01: Can next page by using Next/Previous button
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PAGINATION-01       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=next
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=previous
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-BEAT-AFIB-PAGINATION-02: Can next page by using the hotkey ‘Z’ or ‘X’
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PAGINATION-02       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=next
    ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=previous
    ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-BEAT-AFIB-PAGINATION-03: Can manually input a number within the limit displayed on the page number
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PAGINATION-03       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
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

BFCC-AIRP-BEAT-AFIB-PAGINATION-04: Check case user input the number is larger than the all page number
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PAGINATION-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PAGINATION-05: Check case the system shall block the entry of values other than integers
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PAGINATION-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-01: Verify that all information on the AFib thumbnail is displayed completely
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Start time of the event
    ...     2. Day number
    ...     3. ECG sample - it will display the ECG in [“start time – 1s” to “start time + 4s”]
    ...     4. Duration (rounded the event duration to the first decimal place)
#    ...     If the value is below 60 seconds, it will include a decimal point, for example, '9.9s'. If the value is above 60 seconds,
#    ...     there will be no decimal point. Values are rounded: if it's 0.5 or higher, round up to the next whole number;
#    ...     if it's below 0.5, round down to the nearest whole number
    ...     5. Channel
    ...     6. Min/Avg/Max HR – it displays for all rhythm events excluding ‘Min/max HR’ and ‘Pause’ events.
    ...     7. Number of beats – it displays for VT and SVT events
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-01       AIRP-1.10.0     auto     R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On   row=1
    Filter Header    panel_tab=AFib
    ${each_event_infor}     Get Thumbnail Ecg Events
    ${panel_infor}          Get Panel Information Event
    ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure    Should Be Equal     ${each_event_infor}[0][Start Time]       ${panel_start_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${each_event_infor}[0][Duration]         ${panel_infor}[Duration]
    Run Keyword And Continue On Failure    Should Be Equal    ${each_event_infor}[0][Channel]          ${panel_infor}[Channel]
    Run Keyword And Continue On Failure    Should Be Equal    ${each_event_infor}[0][Heart rate]       ${panel_infor}[Heart rate]

BFCC-AIRP-BEAT-AFIB-FILTER-01: Verify that the user can view all components on the Filter modal after clicking the filter button
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-01       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FILTER-02: Verify that reviewed AFib events are hidden after enabling 'Hide Reviewed Events' and clicking Apply
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-02       AIRP-1.10.0      auto     R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${current_events}       Get Total Number Afib Events Beats Hr
    Edit Page Number    page_number=1
    ${actual_events}       Evaluate    ${current_events} - 1
    View Each Event Thumbnail On   row=2
    Filter Header     mark_reviewed=${True}       is_save=${True}
    Filter Each Event    hide_reviewed_event=checked      is_submit=${True}
    ${expected_events}       Get Total Number Afib Events Beats Hr
    Edit Page Number    page_number=1
    Filter Each Event     is_reset=${True}
    ${expected_events_total}       Get Total Number Afib Events Beats Hr
    Edit Page Number    page_number=1
    View Each Event Thumbnail On   row=2
    Filter Header     mark_reviewed=${True}       is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_events}        ${expected_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${current_events}      ${expected_events_total}

BFCC-AIRP-BEAT-AFIB-FILTER-03: Verify that reviewed AFib events are displayed after turning off 'Hide Reviewed Events' and clicking Apply
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FILTER-04: Verify that reviewed AFib events are displayed after clicking Reset button
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FILTER-05: Verify that captured strips of AFib events appear after checking 'Captured Strips' and clicking Apply
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-05       AIRP-1.10.0             auto      R1
    [Setup]    Capture Afib Event
    ${current_events}       Get Total Number Afib Events Beats Hr
    Edit Page Number    page_number=1
    Filter Each Event    captured_strips=checked      is_submit=${True}
    ${expected_events}       Get Thumbnail Ecg Events
    ${actual_numer_of_events}       Get Total Number Afib Events Beats Hr
    Edit Page Number    page_number=1
    Filter Each Event    hide_reviewed_event=checked    is_submit=${True}
    ${expected_numer_of_events}       Get Total Number Afib Events Beats Hr
    Filter Each Event     is_reset=${True}
    ${expected_events_total}       Get Total Number Afib Events Beats Hr
    Edit Page Number    page_number=1
    Run Keyword And Continue On Failure    Should Not Be Empty    ${expected_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${expected_events_total}      ${current_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_numer_of_events}      ${expected_numer_of_events}

BFCC-AIRP-BEAT-AFIB-FILTER-06: Verify that all AFib events are displayed after unchecking 'Captured Strips' and clicking Apply
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FILTER-07: Verify that all AFib events are displayed after clicking Reset button
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-07       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FILTER-08: Verify that all AFib events display correctly with 'Hide Reviewed Events' enabled and 'Captured Strips' checked
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-08       AIRP-1.10.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-FILTER-09: Verify that all AFib events are fully displayed after turning off 'Hide Reviewed Events' and unchecking 'Captured Strips'
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-FILTER-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-10: Verify that all components are fully displayed on the information panel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-11: Verify that the header of the panel information is displayed correctly in an event is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. When a minutely HR value in an event is selected, the header will be the time of the selected event (MM/DD/YYYY, HH:mm:ss)
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-12: Verify that the header of the panel information is displayed correctly is not in an any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. When a minutely HR is not in an any event, the header will be the time of the minute (MM/DD/YYYY, HH:mm:ss)
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-13: Verify that the event tab is only visible when the minute contains AFib events
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-14: Verify that the information panel can contain multiple beat/rhythm events tabs
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-15: Verify that the event tabs on the information panel are ordered by time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-16: Verify that the Artifact tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    Navigate To Add New Event
#    Filter Thumbnail Option     select_event_type=Artifact
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-420      y_offset_start_time=10      x_offset_end_time=300      y_offset_end_time=100
#    Edit Artifact Event      is_submit=${True}           is_close=${True}
#    Filter Header    is_save=${True}
#    View Each Event Thumbnail On    row=1
#    ${expected_panel_info_tab}       Get List Panel Tab
#    Run Keyword And Continue On Failure    List Should Contain Value    ${expected_panel_info_tab}      Artifact

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-17: Verify that the VE Couplet tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-18: Verify that the VE Run tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-20: Verify that the VE Bigeminy tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-21: Verify that the VE Trigeminy tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-22: Verify that the VE Quadrigeminy tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-23: Verify that the SVE Couplet tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-24: Verify that the SVE Run tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-26: Verify that the SVE Bigeminy tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-27: Verify that the SVE Trigeminy tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-27       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-28: Verify that the SVE Quadrigeminy tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-28       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-29: Verify that the AFib tab is displayed next to the AFib tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. AFib tab shall display as 'AFib 1', 'AFib 2', ...
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-29       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-30: Verify that the Tachy tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-30       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-31: Verify that the Brady tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-31       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-32: Verify that the Pause tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-32       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-33: Verify that the VT tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-33       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-34: Verify that the SVT tab is displayed next to the AFib tab immediately after adding a new event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-34       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-35: Verify that the 2nd Deg HB tab is displayed next to the AFib tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The 2nd Deg HB tab appears on the information panel tab after successfully adding a 2nd Deg HB event
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-35       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-36: Verify that the 3rd Deg HB tab is displayed next to the AFib tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The 3rd Deg HB tab appears on the information panel tab after successfully adding a 3rd Deg HB event
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-36       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-37: Verify that the VE Couplet tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
#    ...     Auto create: 08/22/2024 - Thang Tran
#    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-37       AIRP-1.10.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    Navigate To Add New Event
#    Filter Thumbnail Option     select_event_type=Artifact
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-420      y_offset_start_time=10      x_offset_end_time=300      y_offset_end_time=100
#    Edit Artifact Event      is_submit=${True}           is_close=${True}
#    Filter Header    is_save=${True}
#    View Each Event Thumbnail On    row=1
#    ${expected_panel_info_tab}       Get List Panel Tab
#    Run Keyword And Continue On Failure    List Should Contain Value    ${expected_panel_info_tab}      Artifact

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-38: Verify that the VE Run tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-38       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-39: Verify that the VE Bigeminy tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-39       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-40: Verify that the VE Trigeminy tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-40       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-41: Verify that the VE Quadrigeminy tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-41       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-42: Verify that the SVE Couplet tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-43: Verify that the SVE Run tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-44: Verify that the SVE Bigeminy tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-45: Verify that the SVE Trigeminy tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-45       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-47: Verify that the SVE Quadrigeminy tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-48: Verify that the AFib tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-49: Verify that the Tachy tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-50: Verify that the Brady tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-51: Verify that the Pause tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-52: Verify that the VT tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-53: Verify that the SVT tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-54: Verify that the 2nd Deg HB tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-55: Verify that the 3rd Deg HB tab is removed immediately after marking it as an artifact
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-56: Verify that the AFib tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-57: Verify that the Tachy tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-58: Verify that the Brady tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-59: Verify that the Pause tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-60: Verify that the VT tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-61: Verify that the SVT tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-62: Verify that the 2nd Deg HB tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-63: Verify that the 3rd Deg HB tab is removed immediately after deleting it
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-64: Verify that the AFib start time updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-64       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    Change Event Duration Airp
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-450      y_offset_start_time=10      x_offset_end_time=400      y_offset_end_time=100
#    ${actual_date_time}        Get Start And End Time
#    Edit Artifact Event     is_done=${True}
#    ${event_change}         Get Events Selected
#    Run Keyword And Continue On Failure    List Should Contain Value    ${event_change}         AFib
#    ${panel_info}       Get Panel Information Event
#    ${expected_date_time}        Evaluate        "${panel_info}[Start time]".split(', ')
#    Filter Header    is_save=${True}
#    Run Keyword And Continue On Failure    Should Be Equal      ${expected_date_time}[0]        ${actual_date_time}[Start Time Date]
#    Run Keyword And Continue On Failure    Should Be Equal      ${expected_date_time}[1]        ${actual_date_time}[Start Time Time]


BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-65: Verify that the AFib duration updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-66: Verify that the heart rate updates after adding a new N/S/V/Q beat in the AFib event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-67: Verify that the heart rate updates after deleting beats in the AFib event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-68: Verify that the heart rate displays as NA after updating Q beats in the AFib event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-69: Verify that the user can navigate to the position of this event on the ECG viewer using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-70: Verify that multiple AFib strips are displayed on the information panel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-71: Can view details of AFib event strip by clicking the view button in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-71     AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${panel_info}       Get Panel Information Event
    ${actual_panel_info}    Evaluate    [k for k, v in ${panel_info}.items()]
    Filter Capture      comment=Test        is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}      Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        is_cancel=${True}
    Filter Header       is_reset_change=${True}
    ${panel_info_2}       Get Panel Information Event
    ${expected_panel_info}    Evaluate    [k for k, v in ${panel_info_2}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_info}[Start time]     ${datetime}[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_panel_info}     ${actual_panel_info}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-72: Can update tecnician comment on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-72     AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
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

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-73: Verify that the user cannot update the technician comment if it exceeds 520 characters in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-73     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-74: Can remove the capture strip on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-74     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-75: Can view details of AFib event strip by clicking the view button in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-75     AIRP-1.10.0       auto      R1
    [Setup]    Capture Afib Event
    ${panel_info}       Get Panel Information Event
    Filter Panel        view_detail=${True}
    ${capture_details}      Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_info}[Start time]     ${datetime}[0]

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-76: Can update tecnician comment on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-76     AIRP-1.10.0       auto      R1
    [Setup]    Capture Afib Event
    Filter Panel        view_detail=${True}     technician_comment=Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if it exceeds 520 characters in saved status, Test update the technician comment if
    ${capture_details}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Header    is_save=${True}
    Filter Panel        view_detail=${True}
    ${expected_capture_details}      Get Capture Detail Info
    Filter Panel        is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details}[Technician comment]       ${capture_details}[Technician comment]

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-77: Verify that the user cannot update the technician comment if it exceeds 520 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-77     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-78: Can remove the capture strip on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-78     AIRP-1.10.0     auto      R1
    [Setup]    Capture Afib Event
    ${panel_info}       Get Panel Information Event
    ${actual_panel_info}      Evaluate     [k for k, v in ${panel_info}.items()]
    Filter Panel        view_detail=${True}     remove_strip=${True}
    Filter Header    is_save=${True}
    ${panel_info}       Get Panel Information Event
    ${expected_panel_info}      Evaluate     [k for k, v in ${panel_info}.items()]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${expected_panel_info}        ${actual_panel_info}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-79: Can close the strip details table by using X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-79    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-80: Can close the strip details table by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-80    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-81: Can close the strip details table by using Done button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-EVENT-81    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-01: Verify that the Minute info tab is only visible when the minute is not in an any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-01    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-02: Verify that the heart rate updates after adding a new N/S/V/Q beat in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-02    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-03: Verify that the heart rate displays as NA after updating Q beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-04: Verify that the heart rate updates after deleting beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-05: Verify that multiple strips can be displayed for one minute on the panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-06: Can view details of strips by clicking the view button in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-06     AIRP-1.10.0      auto        R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On   row=2
    Filter Capture      comment=Test        is_submit=${True}
    ${panel_info}     Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${panel_info}.items()]
    Filter Panel    view_detail=${True}
    ${actual_capture_details}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Panel    view_detail=${True}
    ${expected_capture_details}      Get Capture Detail Info
    Filter Panel    is_cancel=${True}
    Filter Header    is_reset_change=${True}
    ${expected_minute_info}     Get Panel Information Event
    ${expected_items_panel}      Evaluate    [k for k, v in ${expected_minute_info}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details}[Technician comment]      ${actual_capture_details}[Technician comment]
    Run Keyword And Continue On Failure    Should Not Be Equal        ${expected_items_panel}     ${actual_items_panel}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-07: Can update title on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-07     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-08: Can update tecnician comment on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-08     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-09: Verify that the user cannot update the technician comment if it exceeds 100 characters in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-09     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-10: Verify that the user cannot update the technician comment if it exceeds 520 characters in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 09/09/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-10     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-11: Can remove the capture strip on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-11     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-12: Can view details of AFib event strip by clicking the view button in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-12     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-13: Can update title on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-13     AIRP-1.10.0      auto        R1
    [Setup]    Create Capture Afib Event Unsave Status On Panel Tab "Minute info"
    Filter Header    is_save=${True}
    ${minute_info}     Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${minute_info}.items()]
#    Jump To Not Captured Strip
    Edit Strip Technician Comment    title=Update capture name      comment=Update technician comment
    Filter Panel    view_detail=${True}
#    Filter Panel    view_detail=${True}     title_name=Update capture name      technician_comment=Update technician comment
    ${actual_capture_details}      Get Capture Detail Info
    Filter Panel    is_done=${True}
    Filter Header    is_save=${True}
    Filter Panel    view_detail=${True}
    ${expected_capture_details_saved}      Get Capture Detail Info
    Filter Panel    remove_strip=${True}
    Filter Header    is_save=${True}
#    ${expected_minute_info}     Get Panel Information Event
#    ${expected_items_panel}      Evaluate    [k for k, v in ${expected_minute_info}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details_saved}[Technician comment]      ${actual_capture_details}[Technician comment]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_details_saved}[Title]      ${actual_capture_details}[Title]
#    Run Keyword And Continue On Failure    Should Not Be Equal        ${expected_items_panel}     ${actual_items_panel}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-14: Can update tecnician comment on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-14     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-15: Verify that the user cannot update the technician comment if it exceeds 100 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-15     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-16: Verify that the user cannot update the technician comment if it exceeds 520 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-16     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-17: Can remove the capture strip on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-17     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-18: Can close the strip details table by using X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-18    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-19: Can close the strip details table by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-19    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-20: Can close the strip details table by using Done button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-PANEL-MINUTE-20    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-01: Verify the data shall be shown corresponding in HR chart once the user selects the AFib event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-01       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-02: Verify there shall be a list of dates within the study period
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.There shall be a list of dates within the study period, starting from the study's start date and ending with its end date
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-02       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-03: Verify the number of events will be displayed on each day
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-03       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-04: Verify "No data" will be displayed on each day if there is no data recorded
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-04       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-05: Verify the day with the first event will be shown by default
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-05       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-06: Verify that the user can navigate to another date using the Next button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-06       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On   row=1
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

BFCC-AIRP-BEAT-AFIB-HR-CHART-07: Verify that the user can navigate back to the previous day using the Previous button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-07       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-08: Verify that the selected AFib event on the HR chart is highlighted in the event list above
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-08       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-09: Check the UI of the AFib event on the HR chart when a new event is added in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-09       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-10: Check the UI of the AFib event on the HR chart when the event duration is being changed in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-10       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-11: Verify the HR chart will not be displayed corresponding to the list event card above if adding new event in unsaved status
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-11       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-12: Verify user can zoom in HR chart by drags an area in the chart
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-12       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-13: Verify user can zoom in HR chart by clicking the (+) button
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-13       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
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

BFCC-AIRP-BEAT-AFIB-HR-CHART-14: Verify user can zoom out HR chart by clicking the (-) button
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-14       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-15: Verify the user can reset zoom HR chart by using Reset zoom button
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-15       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-16: Verify that the HR chart highlights only AFib and Artifact events
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-16       AIRP-1.6.7       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-17: Verify the tool tip shall be displayed when the user hovers over the HR chart
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-17       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-18: Verify in HR chart, areas that do not have study data (due to study paused) will be marked in HR chart
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-18       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-HR-CHART-19: Verify the tool tip 'NA' shall be displayed when the user hovers over the HR chart if the HR cannot be calculated
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-HR-CHART-19       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-01: Verify the data shall be shown corresponding in ECG viewer once the user selects the event
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-01       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-02: Can go to next/previous minute
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-02       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
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

BFCC-AIRP-BEAT-AFIB-ECG-03: Check the toolbar on ECG viewer with tab panel AFib is working properly
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/27/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-03     AIRP-1.10.0       auto        R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
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

BFCC-AIRP-BEAT-AFIB-ECG-04: Check the toolbar on ECG viewer with tab panel artifact is working properly
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-04     AIRP-1.10.0      manual        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    [Setup]    Create New Artifact Event
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    View Each Event Thumbnail On    row=1
#    Filter Header      panel_tab=Artifact
#    ${expected_status}     Check Toolbar Ecg Viewer Available
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Speed]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Gain]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[High Pass]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Low Pass]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH1]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH2]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Show/Hide CH3]
#    Run Keyword And Continue On Failure    Should Not Be True    ${expected_status}[Capture]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]
#    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Zool Tool]


BFCC-AIRP-BEAT-AFIB-ECG-05: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 2.5 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-05       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-04.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-04.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-05.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 25 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-05.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-06: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-06       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-07: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 75 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-07       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-08: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-08       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-09: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-09       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-10: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 500 mm/s
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-10       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-11: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 1 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-11       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-12: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 2 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-12       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-13: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 5 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-13       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-14: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 7.5 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-14       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-15: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-15       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-16: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 20 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-16       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-17: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-17       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-18: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-18       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-19: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/mV
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-19       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-20: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to No
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-20       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-21: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.05 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-21       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-22: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.5 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-22       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-23: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 1 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-23      AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-24: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 2 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-24       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-25: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to No
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-25       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-26: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 15 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-26       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-27: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 30 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-27       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-28: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 40 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-28       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-29: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 50 Hz (Notch)
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-29       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-30: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 60 Hz (Notch)
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-30       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-31: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 100 Hz
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-31       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-32: Verify that the the ECG Viewer displays correctly after hiding only the CH1 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-32       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-33: Verify that the the ECG Viewer displays correctly after hiding only the CH2 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-33       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-34: Verify that the the ECG Viewer displays correctly after hiding only the CH3 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-34       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-35: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH2 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-35       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-36: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH3 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-36       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-37: Verify that the the ECG Viewer displays correctly after hiding the CH2 & CH3 channel
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
    ...     Update date: 8/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-37       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-38: Can mark a strip that does not belong to any event
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
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-38       AIRP-1.10.0      auto
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Header    panel_tab=Minute info
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Mark A Strip Airp    technician_comment=test capture        title=Thang Capture      is_save=${True}
    Filter Header      is_save=${True}
    ${minute_info}     Get Panel Information Event
    ${panel_details}     Evaluate    [k for k, v in ${minute_info}.items()]
    ${expected_panel_details}       Create List    Time     Channel     Heart rate      Captured strips
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_panel_details}         ${panel_details}
    Filter Panel    view_detail=${True}     remove_strip=${True}
    Filter Header      is_save=${True}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-39: Can mark multiple strips that does not belong to any event at the same time
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Update date: 08/19/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-39     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-40: Cannot mark a strip that does not belong to any event without entering title
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
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-40       AIRP-1.10.0      auto       R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=300         y_offset_start_time=30
    Filter Header       panel_tab=Minute info
    Mark A Strip Airp    technician_comment=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a title

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-41: Cannot mark a strip that does not belong to any event without entering technician comment
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
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-41       AIRP-1.10.0    auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=300         y_offset_start_time=30
    Filter Header       panel_tab=Minute info
    Mark A Strip Airp    title=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a comment

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-42: Verify the system shall automatically recapture the strip in case updating N/S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-43: Verify that the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-44: Verify that the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-45: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
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
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-45       AIRP-1.10.0     auto        R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
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

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-46: Verify that the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyenn
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-46       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-47: Verify that the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-48: Verify that the View button on the panel information is disabled during the capture saving process
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-48.1: Verify that the user cannot capture data in areas where no data is available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-CAPTURE-48.1       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-49: Verify that the user can add an N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-50: Verify that the user can add an N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-51: Verify that the user can add an N beat in the ECG Viewer using add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-52: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-53: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-54: Verify that the user can change V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-55: Verify that the user can delete an N beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-56: Verify that the user can delete an N beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-57: Verify that the user can delete an N beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-58: Verify that the user can delete an N beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-59: Verify that the user can add an S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-60: Verify that the user can add an S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-61: Verify that the user can add an S beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-62: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-63: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-64: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-65: Verify that the user can delete an S beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-66: Verify that the user can delete an S beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-67: Verify that the user can delete an S beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-68: Verify that the user can delete an S beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-69: Verify that the user can add an V beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-70: Verify that the user can add an V beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-71: Verify that the user can add an V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-71       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-72: Verify that the user can change N/S/Q beat to V in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-72       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-73: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-73       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-74: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-74       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-75: Verify that the user can delete an V beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-75       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-76: Verify that the user can delete an V beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-76       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-77: Verify that the user can delete an V beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-77       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-78: Verify that the user can delete an V beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-78       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-79: Verify that the user can add an Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-79       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-80: Verify that the user can add an Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-80       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-81: Verify that the user can add an Q beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-81       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-82: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-82       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-83: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-83       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-84: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-84       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-85: Verify that the user can delete an Q beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-85       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-86: Verify that the user can delete an Q beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-86       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-87: Verify that the user can delete an Q beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-87       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-88: Verify that the user can delete an Q beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-88       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-89: Verify that the Zoom in toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-89       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-90: Verify that the Zoom out toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-90       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-91: Verify that the user can exit "View All Strips" mode by clicking the "Exit view all strip mode" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-91       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-92: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-92       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-93: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-93       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-94: Verify that the Vertical Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-94       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-95: Verify that the Beat Calipers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-95       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-96: Verify that the Text Annotation option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-96       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-97: Verify that the Mark a Pattern option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-97       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-99: Verify that the Hide Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-99       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ECG-100: Verify that the Show Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ECG-100       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-TYPE-01: Verify that the user can view all information on the Change event type to modal by clicking Change event type modal
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
    ...     - Afib
    ...     - VT
    ...     - SVT
    ...     - 2nd Deg HB
    ...     - 3rd Deg HB
    ...     2. There shall be “Save” and “Cancel” buttons for the user to save or cancel
    ...
    ...     **Others**
    ...     Update date: 8/23/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-TYPE-01       AIRP-1.10.0       auto     R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    is_change_event_type=${True}
    ${actual_events_type}     Get List Events Type
    ${expected_events_type}       Create List    AFib   VT   SVT   2nd Deg HB   3rd Deg HB
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_events_type}      ${actual_events_type}
    Filter Thumbnail Option    is_cancel=${True}

BFCC-AIRP-BEAT-AFIB-TYPE-01.1: Verify that the user can change an AFib event to a VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-TYPE-01.1       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-TYPE-02: Verify that the user can change an AFib event to a SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-TYPE-02       AIRP-1.10.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-TYPE-03: Verify that the user can change an AFib event to a 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-TYPE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-TYPE-04: Verify that the user can change an AFib event to a 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-TYPE-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-TYPE-05: Verify that the Cancel button is working on 'Change event type to' modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/19/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-TYPE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-01: Verify that user can delete AFib event using delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-01       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-02: Verify that user can delete AFib event using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-03: Verify that the AFib event is deleted if the user deletes all beats in the event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-03       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-04: In AFib event, if the user deletes all beats except one, the system should delete the event
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-04       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-05: Verify that the AFib event is deleted if a new Tachy event is added that overrides the AFib event
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-05       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Setup]    Change Afib Event Duration
#    Navigate To Add New Event
#    Filter Thumbnail Option    select_event_type=Tachy
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
#    Edit Artifact Event      is_done=${True}
#    Filter Header    is_save=${True}

BFCC-AIRP-BEAT-AFIB-DELETE-06: Verify that the AFib event is deleted if a new Brady event is added that overrides the AFib event
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-07: Verify that the AFib event is deleted if a new Pause event is added that overrides the AFib event
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-07       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-08: Verify that the AFib event is deleted if a new VT event is added that overrides the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-09: Verify that the AFib event is deleted if a new SVT event is added that overrides the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-10: Verify that the AFib event is deleted if a new 2nd Deg HB event is added that overrides the AFib event
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-11: Verify that the AFib event is deleted if a new 3rd Deg HB event is added that overrides the AFib event
    [Documentation]     Author: Trinh Nguyen
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
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DELETE-12: Verify that all events will be deleted when using the 'Delete all event' function
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 05/09/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DELETE-12       AIRP-1.14.0             RP1      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Option Select All    delete_all_events=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Navigate To Afib Events Tab
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
    Navigate To Afib Events Tab
    Filter Option Select All    delete_all_events=${True}
    Filter Header    is_save=${True}
    ${expected_number_events}    Get Number Events On Tab Menu
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_events}    ${0}


BFCC-AIRP-BEAT-AFIB-MARK-01: Verify that user can mark AFib event as artifact by using Mark as artifact button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-MARK-01       AIRP-1.10.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-MARK-02: Verify that user can mark AFib event as artifact by using A hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-MARK-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-MARK-03: Verify that user can mark AFib event as 'Reviewed' by using 'Mark as reviewed' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-MARK-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-MARK-04: Verify that user can mark AFib event as 'Reviewed' by using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-MARK-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-MARK-05: Verify that all events are marked as artifact when using the 'Mark all as artifact' function
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 05/09/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-MARK-05       AIRP-1.14.0             RP1      R3
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Option Select All    mark_all_artifact=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Artifact' for value in ${events_selected}])
    Navigate To Afib Events Tab
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
    Navigate To Afib Events Tab
    Filter Option Select All    mark_all_artifact=${True}
    Filter Header    is_save=${True}
    ${expected_number_events}    Get Number Events On Tab Menu
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_events}    ${0}

BFCC-AIRP-BEAT-AFIB-DURATION-01: Verify user can view all information on the Change Event Duration pop-up using the Change Event Duration button
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
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-01       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-02: Verify user can view all information on the Change Event Duration pop-up using C hotkey
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
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-02       AIRP-1.12.0        auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    ${panel_info}       Get Panel Information Event
    Filter Thumbnail Option    by_hotkey=C
    ${event_duration}     Check Event Airp Available
    Filter Thumbnail Option    is_done=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-BEAT-AFIB-DURATION-06: Verify that user can navigate to the Start time of the event on ECG viewer by using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-06       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-07: Verify that user can navigate to the End time of the event on ECG viewer by using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-07       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-08: Verify that user can select the desired Start time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-08       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-09: Verify that user can select the desired End time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-09       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-10: Verify that the user can exit select Start Time mode by pressing the 'Esc' on keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-10       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-11: Verify that the user can exit select End Time mode by pressing the 'Esc' on keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-11       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-12: Verify that user can close the pop-up and exity the Change event duration function by clicking Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-12       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-13: Verify there shall be an error message if the end time is less than the start time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-13       AIRP-1.12.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=200      y_offset_start_time=100      x_offset_end_time=-300      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-DURATION-14: Verify there shall be an error message if AFib event less than 5 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-14       AIRP-1.12.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-100      y_offset_start_time=10      x_offset_end_time=100      y_offset_end_time=10
    ${datetime}             Get Start And End Time
    Edit Artifact Event      is_done=${True}
    ${msg}        Get Message On Aireport
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}          It is not possible to create/update an AFib event less than 5 seconds.

BFCC-AIRP-BEAT-AFIB-DURATION-15: Verify there shall be an error message if AFib event less than 2 beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-15       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-16: Verify there shall be an error message if AFib event to an artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-16       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-17: Verify there shall be an error message if the AFib event as a duration that is not related to the current duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-17       AIRP-1.12.0    auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate Chart Scroller     x_offset=-400     y_offset=10
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=100      x_offset_end_time=200      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    ${msg}        Get Message On Aireport
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Updating the duration is not possible. Please utilize the 'Add new event' function for this purpose.

BFCC-AIRP-BEAT-AFIB-DURATION-18: Check case the AFib event is in AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-18       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-19: Verify there shall be an error message if the AFib event is in Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-19       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-20: Verify there shall be an error message if the AFib event is in Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-20       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-21: Verify there shall be an error message if the AFib event is in Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-21       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-22: Verify there shall be an error message if the AFib event is in VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-22       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-23: Verify there shall be an error message if the AFib event is in SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-23       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-24: Verify there shall be an error message if the AFib event is in 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-24       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-25: Verify there shall be an error message if the AFib event is in 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-25       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-26: Verify there shall be an error message if the AFib event is in VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-26       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-27: Verify there shall be an error message if the AFib event is in VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-27       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-28: Verify there shall be an error message if the AFib event is in VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-28       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-29: Verify there shall be an error message if the AFib event is in VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-29       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-30: Verify there shall be an error message if the AFib event is in SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-30       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-31: Verify there shall be an error message if the AFib event is in SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-31       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-32: Verify there shall be an error message if the AFib event is in SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-32       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-33: Verify there shall be an error message if the AFib event is in SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-33       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-34: Can change AFib event duration if the AFib event is independent and has a duration that is related to the current duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. If the edited event is independent and has a duration that is related to the current duration, the state
    ...     of this event card will be changed to ‘unsaved’ status
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-34       AIRP-1.12.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    View Each Event Thumbnail On    row=2
#    Change Event Duration Airp
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-460      y_offset_start_time=100      x_offset_end_time=-20      y_offset_end_time=10
#    ${expected_datetime}                 Get Start And End Time
#    Edit Artifact Event      is_done=${True}
#    ${afib_changed}       Get Events Selected
#    ${expected_afib_changed}        Evaluate    [value == 'AFib' for value in ${afib_changed}]
#    Filter Header     is_save=${True}
#    View Each Event Thumbnail On    row=2
#    ${infor_events}        Get Thumbnail Ecg Events Selected
#    ${panel_infor}         Get Panel Information Event
#    ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
#    Run Keyword And Continue On Failure    Should Contain    ${expected_afib_changed}      ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Start Time]     ${panel_start_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Duration]     ${panel_infor}[Duration]
#    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Channel]     ${panel_infor}[Channel]
#    Run Keyword And Continue On Failure    Should Be Equal    ${infor_events}[0][Heart rate]     ${panel_infor}[Heart rate]

BFCC-AIRP-BEAT-AFIB-DURATION-35: Verify that the AFib event duration is the sum of both events' durations if it intersects with the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-35       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-36: Verify that the AFib event duration is the sum of both events' durations if it intersects with the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-36       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-37: Verify that the AFib event duration is the sum of both events' durations if it intersects with the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-37       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-38: Verify that the AFib event duration is the sum of both events' durations if it intersects with the VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-38       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-39: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-39       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-40: Verify that the AFib event duration is the sum of both events' durations if it intersects with the 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-40       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-41: Verify that the AFib event duration is the sum of both events' durations if it intersects with the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-41       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-42: Verify that the AFib event duration is the sum of both events' durations if it intersects with the VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-42       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-43: Verify that the AFib event duration is the sum of both events' durations if it intersects with the VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-43       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-44: Verify that the AFib event duration is the sum of both events' durations if it intersects with the VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-44       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-45: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-45       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-46: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-46       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-47: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-47       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-48: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-48       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-49: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-49       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-50: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-50       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-51: Verify that the AFib event duration is the sum of both events' durations if it intersects with the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-51       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-52: Verify case change AFib duration overrides Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-52       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-54: Verify case change AFib duration overrides VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-54       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-55: Verify case change AFib duration overrides VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-55       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-56: Verify case change AFib duration overrides VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-56       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-57: Verify case change AFib duration overrides VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-57       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-58: Verify case change AFib duration overrides VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-58       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-59: Verify case change AFib duration overrides SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-59       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-60: Verify case change AFib duration overrides SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-60       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-61: Verify case change AFib duration overrides SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-61       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-62: Verify case change AFib duration overrides SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-62       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-63: Verify case change AFib duration overrides SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-63       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-64: Verify case change AFib duration overrides AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-64       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-65: Verify case change AFib duration overrides Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-65       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-66: Verify case change AFib duration overrides Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-66       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-67: Verify case change AFib duration overrides Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-67       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-68: Verify case change AFib duration overrides VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-68       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-69: Verify case change AFib duration overrides SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-69       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-70: Verify case change AFib duration overrides 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-70       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-71: Verify case change AFib duration overrides 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-71       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-72: Verify that the AFib event is displayed correctly after changing its duration to span multiple days
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All events will be overwritten except for events related to V beats, VT, Pause, and artifacts
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-72       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-73: Verify that if the start time is in the ‘No data’ area, start time will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-73       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-74: Verify that if the end time is in the ‘No data’ area, end time will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-74       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-75: Check case AFib event interests with the artifact event has only 1 beat left and duration is less than 10s
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
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-75       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-DURATION-76: Check case AFib event interests with the artifact event has only 1 beat left and duration is larger than 10s
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
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-DURATION-76       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-01: Verify the user can view all information on Add new event modal by clicking Add new event button
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
    ...     - AFib
    ...     - Artifact
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-01       AIRP-1.12.0      auto     R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    ${actual_events_type}     Get List Events Type
    ${expected_events_type}       Create List    AFib   Artifact
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_events_type}      ${actual_events_type}
    ${event_duration}     Check Event Airp Available
    Filter Thumbnail Option    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-BEAT-AFIB-ADD-02: Verify the user can view all information on Add new event modal by using W hotkey
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
    ...     - AFib
    ...     - Artifact
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-02       AIRP-1.12.0         auto     R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    by_hotkey=W
    ${actual_events_type}     Get List Events Type
    ${expected_events_type}       Create List    AFib   Artifact
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_events_type}      ${actual_events_type}
    ${event_duration}     Check Event Airp Available
    Filter Thumbnail Option    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Not Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-BEAT-AFIB-ADD-03: Verify user can navigate the user to the start time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-04: Verify the Jump to button shall be disabled if there is no data in the Start time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-04       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-05: Verify user can navigate the user to the end time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-05       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-06: Verify the Jump to button shall be disabled if there is no data in the end time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-06       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-07: Verify the user can close the pop-up and exit the 'Add new' function by clicking the Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...     Auto create: 08/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-07       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-08: Verify there shall be an error message if only the start time is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-08       AIRP-1.12.0    auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    by_hotkey=W
    Edit Artifact Event    is_start_time=${True}        x_offset_start_time=-450        y_offset_start_time=20      is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-09: Verify there shall be an error message if only the end time is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-09       AIRP-1.12.0     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Filter Thumbnail Option    pick_on_end_time=${True}
    Edit Artifact Event    is_end_time=${True}        x_offset_end_time=300        y_offset_end_time=20      is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-10: Verify there shall be an error message if the end time is less than the start time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-10       AIRP-1.12.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=200      y_offset_start_time=100      x_offset_end_time=-300      y_offset_end_time=10     is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-11: Verify there shall be an error message if duration less than 5 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-11       AIRP-1.12.0    auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-100      y_offset_start_time=10      x_offset_end_time=100      y_offset_end_time=10      is_submit=${True}
    ${msg}        Get Message On Aireport
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}          It is not possible to create/update an AFib event less than 5 seconds.

BFCC-AIRP-BEAT-AFIB-ADD-12: Verify there shall be an error message if less than 2 beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-12       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-20: Verify that if the newly created event is independent, it will be stored in the new event list
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-20       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-21: Check case the new AFib event intersects with the current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-21       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-22: Check case the new AFib event intersects with the current Artifact event has only 1 beat left and duration is less than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-22       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-23: Check case the new AFib event intersects with the current Artifact event has only 1 beat left and duration is larger than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-23       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-24: Check case the new AFib event intersects with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-24       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-25: Check case the new AFib event intersects with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-25       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-26: Check case the new AFib event intersects with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-26       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-27: Check case the new AFib event intersects with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-27       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-28: Check case the new AFib event intersects with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-28       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-29: Check case the new AFib event intersects with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-29       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-30: Check case the new AFib event intersects with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-30       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-31: Check case the new AFib event intersects with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-31       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-32: Check case the new AFib event intersects with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-32       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-33: Check case the new AFib event intersects with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-33       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-34: Check case the new AFib event intersects with the current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-34       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-35: Check case the new AFib event intersects with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-35       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-36: Check case the new AFib event intersects with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-36       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-37: Check case the new AFib event intersects with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-37       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-38: Check case the new AFib event intersects with the current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-38       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-39: Check case the new AFib event intersects with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-39       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-40: Check case the new AFib event intersects with the current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-40       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-41: Check case the new AFib event intersects with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-41       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-13: Check case the new AFib event to an artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-13       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-14: Check case the new the AFib event inside an existing  AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-14       AIRP-1.12.0     auto      R1
    [Setup]    Change Afib Event Duration
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=20      x_offset_end_time=300      y_offset_end_time=20      is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-15: Check case the new the AFib event inside a Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-15       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-16: Check case the new the AFib event inside a Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-16       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-16.1: Check case the new the AFib event inside a Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-16.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-17: Check case the new the AFib event inside a VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-17       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-17.1: Check case the new the AFib event inside an existing SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-17.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-18: Check case the new the AFib event inside an existing 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-18       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-19: Check case the new AFib event inside an existing 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-19       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-44: Check case the new AFib event inside an existing current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-44       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-45: Check case the new AFib event inside an existing current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-45       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-46: Check case the new AFib event inside an existing current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-46       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-47: Check case the new AFib event inside an existing current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-47       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-48: Check case the new AFib event inside an existing current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-48       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-49: Check case the new AFib event inside an existing current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-49       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-50: Check case the new AFib event inside an existing current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-50       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-51: Check case the new AFib event inside an existing current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-51       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-52: Check case the new AFib event inside an existing current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-52       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-53: Check case the new AFib event inside an existing current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-53       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-54: Check case the new AFib event is overrides current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-54       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-55: Check case the new AFib event is overrides current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-55       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-56: Check case the new AFib event is overrides current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-56       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-57: Check case the new AFib event is overrides current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-57       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-58: Check case the new AFib event is overrides current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-58       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-59: Check case the new AFib event is overrides current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-59       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-60: Check case the new AFib event is overrides current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-60       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-61: Check case the new AFib event is overrides current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-61       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-62: Check case the new AFib event is overrides current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-62       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-63: Check case the new AFib event is overrides current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-63       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-64: Check case the new AFib event is overrides current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-64       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-65: Check case the new AFib event is overrides current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-65       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-66: Check case the new AFib event is overrides current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-66       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-67: Check case the new AFib event is overrides current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-67       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-68: Check case the new AFib event is overrides current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-68       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-69: Check case the new AFib event is overrides current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-69       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-70: Check case the new AFib event is overrides current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-70       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-71: Check case the new AFib event is overrides current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-71       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-72: Check case the new AFib event is overrides current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-72       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-73: Check case the new AFib event can overwrite no data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-73       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-74: Check case the start time inside an No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-74       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-75: Check case the end time is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-75       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-76: Verify that the user can add a new AFib event that spans multiple days
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-76       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-77: Verify the user can view all information on the New events modal by clicking the New event list button
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
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-77       AIRP-1.10.0      manual     R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    Navigate To Add New Event
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
#    Edit Artifact Event      is_submit=${True}      is_close=${True}
#    ${status}       Get Events Selected
#    ${expected_status}      Evaluate    [value == 'Deleted' for value in ${status}]
#    Run Keyword And Continue On Failure    Should Contain    ${expected_status}     ${True}
#    Navigate To Event Draft Status
#    ${event_draft}      Get Thumbnail New Events
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_draft}
#    View New Events On    row=1
#    Delete New Events On    row=1
#    Edit Artifact Event     is_close=${True}

BFCC-AIRP-BEAT-AFIB-ADD-78: Verify the number of event in unsaved status is displayed correctly on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-78       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-79: Verify the user can delete an event by using delete button on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-79       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-80: Verify the user can navigate to the position of the selected event on the HR chart and ECG viewer by using View button on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-80       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-81:Verify that when marking the checkbox 'Use 100% available time', the start time is set to the beginning of the study.
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
    ...     Update date: 09/30/2024 - Hoang Nguyen
    ...     Auto create: 09/30/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-81       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${study_information}    Get Study Information
    Navigate To Add New Event    use_add_all_afib=${True}
    ${start_date}    Get Time Event    start_date=${True}
    ${start_time}    Get Time Event    start_time=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[Start Date]    ${start_date}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[Start Time]    ${start_time}


BFCC-AIRP-BEAT-AFIB-ADD-82:Verify that when marking the checkbox 'Use 100% available time', the stop time is set to the end of the study
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
    ...     Update date: 09/30/2024 - Hoang Nguyen
    ...     Auto create: 05/12/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-82       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    ${study_information}    Get Study Information
    Navigate To Add New Event    use_add_all_afib=${True}
    ${end_date}    Get Time Event    end_date=${True}
    ${end_time}    Get Time Event    end_time=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Date]    ${end_date}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Time]    ${end_time}

BFCC-AIRP-BEAT-AFIB-ADD-83:Verify that the checkbox 'Use 100% available time' appears in the 'Add New Event' modal when the event type is set to AFib.
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
    ...     Auto create: 05/12/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-83       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${expected}

BFCC-AIRP-BEAT-AFIB-ADD-84:Verify that the checkbox 'Use 100% available time' can be marked when adding a new event with the event type AFib.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-84       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event    use_add_all_afib=${True}
    ${verify_checkbox}    Get Time Event    is_checkbox_checked=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${verify_checkbox}

BFCC-AIRP-BEAT-AFIB-ADD-85:Verify that using the 'Jump to' button for the start time will set it to the beginning of the day when the checkbox 'Use 100% available time' is marked
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-85       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-86:Verify that using the 'Jump to' button for the stop time will set it to the end of the day when the checkbox 'Use 100% available time' is marked
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-86       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-87:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Artifact type.
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
    ...     Auto create: 05/13/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-87       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}
    

BFCC-AIRP-BEAT-AFIB-ADD-88:Verify that when adding a new AFib event with the duration as 100% available time, all AFib events within that duration will be deleted.
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
    ...     Auto create: 05/13/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-88       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event    use_add_all_afib=${True}
    Edit Artifact Event    is_submit=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-BEAT-AFIB-ADD-89:Verify that when adding a new AFib event with the duration as 100% available time, all Tachy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-89       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-90:Verify that when adding a new AFib event with the duration as 100% available time, all Brady events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-90       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-91:Verify that when adding a new AFib event with the duration as 100% available time, all SVT events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-91       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-92:Verify that when adding a new AFib event with the duration as 100% available time, all 2nd Deg HB events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-92       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-93:Verify that when adding a new AFib event with the duration as 100% available time, all 3rd Deg HB events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-93       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-94:Verify that when adding a new AFib event with the duration as 100% available time, all SVE couplet events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-94       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-95:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Run events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-95       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-96:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Bigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-96       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-97:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Trigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-97       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-98:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Quadrigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-98       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-99:Verify that when adding a new AFib event with the duration as 100% available time, all beats S will be deleted
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-99       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-01: Verify the user can view all information on Add new event modal by clicking Add new event button
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
    ...     - AFib
    ...     - Artifact
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-01       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-02: Verify the user can view all information on Add new event modal by using W hotkey
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
    ...     - AFib
    ...     - Artifact
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-02       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-03: Check the Jump to button on Add new event modal is working properly
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
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2024 - Thang Tran
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-03       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-03.1: Verify user can navigate the user to the start time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-03.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-04: Verify the Jump to button shall be disabled if there is no data in the Start time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-04       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-05: Verify user can navigate the user to the end time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-05       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-06: Verify the Jump to button shall be disabled if there is no data in the end time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-06       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-07: Verify the user can close the pop-up and exit the 'Add new' function by clicking the Cancel button
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
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-07       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-08: Verify there shall be an error message if only the start time is selected
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
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-08       AIRP-1.12.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    by_hotkey=W
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event    is_start_time=${True}        x_offset_start_time=-450        y_offset_start_time=20      is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-09: Verify there shall be an error message if only the end time is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-09       AIRP-1.12.0    auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact       pick_on_end_time=${True}
    Edit Artifact Event    is_end_time=${True}        x_offset_end_time=300        y_offset_end_time=20      is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-10: Cannot add new artfiact event without selecting start time and end time
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
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-10       AIRP-1.12.0    auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event   is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-11: Verify there shall be an error message if the end time is less than the start time
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
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-11       AIRP-1.12.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=200      y_offset_start_time=100      x_offset_end_time=-300      y_offset_end_time=10     is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-12: Verify there shall be an error message if there is a 'no data' are in the artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-12       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-13: Verify there shall be an error message if less than 2 beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     #bug 1370
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-13       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-16: Cannot add new artifact event if the new event is in the curren event
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
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-16       AIRP-1.12.0       auto     R1
    Change Afib Event Duration
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=100      x_offset_end_time=300      y_offset_end_time=10     is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Filter Header    is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-17: Verify there shall be an error message if add new Artifact event in a current artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-17       AIRP-1.12.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-18: Verify there shall be an error message if an Artifact event is an AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-18       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-19: Verify there shall be an error message if an Artifact event is an VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-19       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-20: Verify there shall be an error message if an Artifact event is an VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-20       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-21: Verify there shall be an error message if an Artifact event is an VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-21       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-22: Verify there shall be an error message if an Artifact event is an VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-22       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-23: Verify there shall be an error message if an Artifact event is an VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-23       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-24: Verify there shall be an error message if an Artifact event is an SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-24       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-25: Verify there shall be an error message if an Artifact event is an SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-25       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-26: Verify there shall be an error message if an Artifact event is an SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-26       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-27: Verify there shall be an error message if an Artifact event is an SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-27       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-28: Verify there shall be an error message if an Artifact event is an SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-28       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-29: Verify there shall be an error message if an Artifact event is an Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-29       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-30: Verify there shall be an error message if an Artifact event is an Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-30       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-31: Verify there shall be an error message if an Artifact event is an Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-31       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-32: Verify there shall be an error message if an Artifact event is an VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-32       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-33: Verify there shall be an error message if an Artifact event is an SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-33       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-34: Verify there shall be an error message if an Artifact event is an 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-34       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-35: Verify there shall be an error message if an Artifact event is an 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-35       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-36: Verify there shall be an error message if new artifact has no beat and a duration of less than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     #bug 1373
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-36       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-37: Verify there shall be an error message if new artifact event contains only one beat and has duration of less than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     #bug 1370
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-37       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-38: Verify that if the newly created event is independent, it will be stored in the new event list
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
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-38       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-39: Verify that the user can add an Artifact event with only one beat if the duration is at least 10 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-39       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-40: Verify that the user can add an Artifact event with no beat if the duration is at least 10 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-40       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-41: Can add new artifact event intersects with the current event
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
    ...     Update date: 03/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-41       AIRP-1.12.0      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#    [Setup]    Change Afib Event Duration
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    ${actual_list_tab_panel}       Get List Panel Tab
#    Navigate To Add New Event
#    Filter Thumbnail Option    select_event_type=Artifact
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-465      y_offset_start_time=100      x_offset_end_time=200      y_offset_end_time=10     is_submit=${True}
#    Edit Artifact Event      is_close=${True}
#    Filter Header    is_save=${True}
#    ${expected_list_tab_panel}       Get List Panel Tab
#    Run Keyword And Continue On Failure    Should Not Be Equal      ${expected_list_tab_panel}      ${actual_list_tab_panel}
#    # Suggest removing this tc from automation

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-42: Check case the new Artifact event intersects with the current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-42       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-43: Check case the new Artifact event intersects with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-43       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-44: Check case the new Artifact event intersects with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-44       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-45: Check case the new Artifact event intersects with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-45       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-46: Check case the new Artifact event intersects with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-46       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-47: Check case the new Artifact event intersects with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-47       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-48: Check case the new Artifact event intersects with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-48       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-49: Check case the new Artifact event intersects with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-49       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-50: Check case the new Artifact event intersects with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-50       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-51: Check case the new Artifact event intersects with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-52: Check case the new Artifact event intersects with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-52       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-53: Check case the new Artifact event intersects with the current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-53       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-54: Check case the new Artifact event intersects with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-54       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-55: Check case the new Artifact event intersects with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-55       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-56: Check case the new Artifact event intersects with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-56       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-57: Check case the new Artifact event intersects with the current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-57       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-58: Check case the new Artifact event intersects with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-58       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-59: Check case the new Artifact event intersects with the current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-59       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-60: Check case the new Artifact event intersects with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-60       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-61: Can add new artifact event overrides the current event
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
    ...     Update date: 03/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-61       AIRP-1.12.0     manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    [Setup]    Change Afib Event Duration
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    ${number_events}      Get Total Number Afib Events Beats Hr
#    ${actual_number_event}      Evaluate     ${number_events} - 1
#    Edit Page Number    page_number=1
#    Navigate To Add New Event
#    Filter Thumbnail Option    select_event_type=Artifact
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-465      y_offset_start_time=100      x_offset_end_time=450      y_offset_end_time=10     is_submit=${True}
#    Edit Artifact Event      is_close=${True}
#    ${event_selected}       Get Events Selected
#    ${expected_selected}        Evaluate    [value == 'Deleted' for value in ${event_selected}]
#    Filter Header    is_save=${True}
#    ${expected_number_event}      Get Total Number Afib Events Beats Hr
#    Edit Page Number    page_number=1
#    Run Keyword And Continue On Failure    Should Contain    ${expected_selected}       ${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_event}      ${actual_number_event}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-62: Check case the new Artifact event overrides with the current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-62       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-63: Check case the new Artifact event overrides with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-63       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-64: Check case the new Artifact event overrides with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-64       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-65: Check case the new Artifact event overrides with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-65       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-66: Check case the new Artifact event overrides with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-66       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-67: Check case the new Artifact event overrides with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-67       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-68: Check case the new Artifact event overrides with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-68       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-69: Check case the new Artifact event overrides with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-69       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-70: Check case the new Artifact event overrides with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-70       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-71: Check case the new Artifact event overrides with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-71       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-72: Check case the new Artifact event overrides with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-72       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-73: Check case the new Artifact event overrides with the current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-73       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-74: Check case the new Artifact event overrides with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-74       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-75: Check case the new Artifact event overrides with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-75       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-76: Check case the new Artifact event overrides with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-76       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-77: Check case the new Artifact event overrides with the current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-77       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-78: Check case the new Artifact event overrides with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-78       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-79: Check case the new Artifact event overrides with the current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-79       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-80: Check case the new Artifact event overrides with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-80       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-81: If a new artifact event is spread out across several days, it will not be divided into smaller events on each day in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     #bug 1374
    ...     **Others**
    ...     Update date: 03/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-81       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-88: If a new artifact event is spread out across several days, it will not be divided into smaller events on each day in saved status
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
    ...     Update date: 03/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-88       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-82: Check case the start time is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-82       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-83: Check case the end time is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-83       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-84: Verify the user can view all information on the New events modal by clicking the New event list button
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
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-84       AIRP-1.12.0       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    Navigate To Add New Event
#    Filter Thumbnail Option     select_event_type=Artifact
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-465      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
#    Edit Artifact Event      is_submit=${True}      is_close=${True}
#    Navigate To Event Draft Status
#    ${event_draft}      Get Thumbnail New Events
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_draft}
#    View New Events On    row=1
#    Delete New Events On    row=1
#    Edit Artifact Event     is_close=${True}


BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-85: Verify the number of event in unsaved status is displayed correctly on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-85       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-86: Verify the user can delete an event by using delete button on New events modal
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
    ...     Update date: 03/13/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-86       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-87: Verify the user can navigate to the position of the selected event on the HR chart and ECG viewer by using View button on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/22/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-ADD-ARTIFACT-87       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-01: Verify that the user can mark a strip belonging to an AFib event with CH1 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-01       AIRP-1.10.0     auto     R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Capture      duration=10s      channel=CH1       comment=Technician comment      is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}        Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        remove_strip=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${datetime}[1]        10s

BFCC-AIRP-BEAT-AFIB-CAPTURE-02: Verify that the user can mark a strip belonging to an AFib event with CH1 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-02       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate Airp Tab     tab=Beats
#    Navigate To Afib Events Tab
#    Filter Capture      duration=20s      channel=CH1       comment=Technician comment      is_submit=${True}
#    Filter Panel        view_detail=${True}
#    ${capture_details}        Get Capture Detail Info
#    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
#    Filter Panel        remove_strip=${True}
#    Run Keyword And Continue On Failure    Should Be Equal    ${datetime}[1]        20s

BFCC-AIRP-BEAT-AFIB-CAPTURE-03: Verify that the user can mark a strip belonging to an AFib event with CH1 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-03       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-04: Verify that the user can mark a strip belonging to an AFib event with CH2 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-04       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Capture      duration=10s      channel=CH2       comment=Technician comment      is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}        Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        remove_strip=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${datetime}[1]        10s

BFCC-AIRP-BEAT-AFIB-CAPTURE-05: Verify that the user can mark a strip belonging to an AFib event with CH2 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-06: Verify that the user can mark a strip belonging to an AFib event with CH2 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-07: Verify that the user can mark a strip belonging to an AFib event with CH3 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-07       AIRP-1.10.0        auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Capture      duration=10s      channel=CH3       comment=Technician comment      is_submit=${True}
    Filter Panel        view_detail=${True}
    ${capture_details}        Get Capture Detail Info
    ${datetime}             Evaluate     [item for item in ${capture_details}[DateTime]]
    Filter Panel        remove_strip=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${datetime}[1]        10s

BFCC-AIRP-BEAT-AFIB-CAPTURE-08: Verify that the user can mark a strip belonging to an AFib event with CH3 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-09: Verify that the user can mark a strip belonging to an AFib event with CH3 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-10: Verify that the user can mark multiple strips that belong to AFib event at the same time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-11: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Auto create: 08/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-11       AIRP-1.10.0     auto        R1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Header    panel_tab=AFib
    Filter Capture   comment=test technician comment     is_submit=${True}
    Filter Header    is_save=${True}
    View Each Event Thumbnail On    row=1
    Filter Header    panel_tab=AFib
    ${panel_infor}      Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${panel_infor}.items()]
    ${expected_items_pannel}        Create List    Start time     Duration     Channel     Heart rate     Captured strips
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_items_pannel}        ${actual_items_panel}
    Filter Capture   comment=test technician comment update     is_submit=${True}
    Filter Header    is_save=${True}
    ${actual_panel_infor}      Get Panel Information Event
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_infor}[Captured strips]       ${actual_panel_infor}[Captured strips]

BFCC-AIRP-BEAT-AFIB-CAPTURE-12: Verify the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-13: Verify the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-14: Verify the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-15: Verify the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-16: Verify that the user cannot mark a strip belonging to an AFib event without entering Technician comment
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-17: Verify the system shall automatically recapture the strip in case updating N/S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-18: Check case the capture duration 20s is disabled on pop-up
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-19: Check case the capture duration 30s is disabled on pop-up
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-CAPTURE-20: Verify that the technician comment field allows a maximum of 520 characters
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-CAPTURE-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-01: Verify that the Reset button shall displayed on the AFib tab after changing AFib event to VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-01       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-07: Verify that the Reset button shall displayed on the AFib tab after changing AFib event to SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-07       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-08: Verify that the Reset button shall displayed on the AFib tab after changing AFib event to 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-08       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-09: Verify that the Reset button shall displayed on the AFib tab after changing AFib event to 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-09       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-10: Verify that the Reset button shall displayed on the AFib tab after deleting AFib events using delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-10       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-11: Verify that the Reset button shall displayed on the AFib tab after deleting AFib events using D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-11       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-12: Verify that the Reset button shall displayed on the AFib tab after marking AFib events as artifact using Mark as artifact button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-12       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-13: Verify that the Reset button shall displayed on the AFib tab after marking AFib events as artifact using A hokey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-13       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-14: Verify that the Reset button shall displayed on the AFib tab after changing AFib event duration using Change event duration button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-14       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-15: Verify that the Reset button shall displayed on the AFib tab after changing AFib event duration using C hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-15       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-16: Verify that the Reset button shall displayed on the AFib tab after marking AFib events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-16       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-17: Verify that the Reset button shall displayed on the AFib tab after marking AFib events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-17       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-18: Verify that the Reset button shall displayed on the AFib tab after unmarking AFib events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-18       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-19: Verify that the Reset button shall displayed on the AFib tab after unmarking AFib events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-19       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-20: Verify that the Reset button shall displayed on the AFib tab after capturing AFib event using Capture button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-20       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-21: Verify that the Reset button shall displayed on the AFib tab after updating Technician comment on panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-21       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-22: Verify that the Reset button shall displayed on the AFib tab after removing AFib strip on Panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-22       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-23: Verify that the Reset button shall displayed on the AFib tab after marking all AFib event as artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-23       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-24: Verify that the Reset button shall displayed on the AFib tab after deleting all AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-24       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-25: Verify that the changes will be reset by clicking on the Reset button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-25       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-26: Verify the user can reset all changes when using the 'Reset all changes' function
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/22/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-26       AIRP-1.14.0    manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-27: Verify that the 'Reset All Changes' function works correctly if the user has used the 'Delete all events' function before
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-27       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-RESET-28: Verify that the 'Reset All Changes' function works correctly if the user has used the 'Mark all as artifact' function before
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
    [Tags]      BFCC-AIRP-BEAT-AFIB-RESET-28       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-29:Verify that the checkbox 'Use 100% available time' appears in the 'Add New Event' modal when the event type is set to AFib.
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
    ...     Update date: 09/30/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-29       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-VIEW-30:Verify that the checkbox 'Use 100% available time' can be marked when adding a new event with the event type AFib.
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
    ...     Update date: 09/30/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-AFIB-VIEW-30       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-02: Verify signal beat marks on the thumbnail display correctly in the first view
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-02       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-03: Verify beat types on the thumbnail match the beat types on the corresponding ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-03       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-BEAT-AFIB-THUMBNAIL-04: Verify the number of beats on the thumbnail matches the number of beats on the corresponding ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-04       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-BEAT-AFIB-THUMBNAIL-05: Verify that the color of each beat on the thumbnail type displays correctly
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-05       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-06: Verify N beats on thumbnail is deleted when deleting N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-06       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-07: Verify S beats on thumbnail is deleted when deleting S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-07       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-08: Verify V beats on thumbnail is deleted when deleting V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-08       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-09: Verify Q beats on thumbnail is deleted when deleting Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-09       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-10: Verify N beats on thumbnail is updated to S beats when changing N beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-10       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-11: Verify N beats on thumbnail is updated to V beats when changing N beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-11       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-12: Verify N beats on thumbnail is updated to Q beats when changing N beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-12       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-13: Verify S beats on thumbnail is updated to N beats when changing S beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-13      AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-14: Verify S beats on thumbnail is updated to V beats when changing S beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-14       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-15: Verify S beats on thumbnail is updated to Q beats when changing S beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-15       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-16: Verify V beats on thumbnail is updated to N beats when changing V beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-16       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-17: Verify V beats on thumbnail is updated to S beats when changing V beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-17       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-18: Verify V beats on thumbnail is updated to Q beats when changing V beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-18       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-19: Verify Q beats on thumbnail is updated to N beats when changing Q beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-19       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-20: Verify Q beats on thumbnail is updated to V beats when changing Q beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-20       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-AFIB-THUMBNAIL-21: Verify Q beats on thumbnail is updated to S beats when changing Q beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-AFIB-THUMBNAIL-21       AIRP-1.13.0             manual      R1
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
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management_2]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Stop Processing
    Quit Browser

Navigate to aireport
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management_2]
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

Delete a strip to beat by button
    ${number_beats}   Get Information Cell On Chart
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - 1
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Strip Beat Hr Heatmap
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    ${beat_name}     Deleted Strip Beat Hr Heatmap          is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${beat_name}        Deleted
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Delete multiple strips to beats by button
    ${number_beats}   Get Information Cell On Chart
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Multiple Artifact Event Airp
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    ${beats_deleted}      Deleted Multiple Artifact Event Airp    is_save=${True}
    Run Keyword And Continue On Failure    List Should Contain Value    ${beats_deleted}[Beat Name]        Deleted
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - ${beats_deleted}[Number Strips Beats]
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Delete a strip to beat by hotkey
    ${number_beats}   Get Information Cell On Chart
    Change Strip To Beats On Page    is_deleted=${True}
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - 1
    Filter Header    is_save=${True}
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Delete multiple strips to beats by hotkey
    ${number_beats}   Get Information Cell On Chart
    ${number_elements_deleted}      Change Multiple Strips To Beats On Page    is_deleted=${True}
    Filter Header    is_save=${True}
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - ${number_elements_deleted}
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Check reset change on beat "${beat_name}"
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    ${results}     Change Strip To Beats On Page     beat_change=beat${beat_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${results}        ${beat_name}
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
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

Capture afib event
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On   row=2
    Filter Capture      comment=Test        is_submit=${True}
    Filter Header    is_save=${True}

Create capture afib event unsave status on panel tab "${tab_name}"
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Filter Header    panel_tab=${tab_name}
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Mark A Strip Airp    technician_comment=test capture        title=Thang Capture      is_save=${True}

Create new artifact event
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-400      y_offset_start_time=10      x_offset_end_time=400      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}           is_close=${True}
    Filter Header    is_save=${True}

Change afib event duration
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    View Each Event Thumbnail On      row=1
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-450      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10     is_done=${True}
    Filter Header    is_save=${True}