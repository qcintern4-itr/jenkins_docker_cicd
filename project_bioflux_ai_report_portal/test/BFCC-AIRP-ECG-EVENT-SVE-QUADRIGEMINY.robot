*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py

Suite Setup    SUITE SETUP
Suite Teardown    SUITE TEARDOWN
Force Tags      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY  web
Test Timeout    30m

*** Test Cases ***

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-01: Verify all components on the SVE Quadrigeminy event tab are displayed correctly in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-01       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-02: Check Reviewed status in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-02       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-03: Verify the menu option shall not displayed in case "There is no data to display"
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-03       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-04: Verify that if the number of SVE Quadrigeminy events exceeds 100, it displays as '99+'
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-04       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-05: Verify that when the user hovers over '99+', the correct number of events is displayed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-05       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-12: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as artifact using Mark as artifact button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-12       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-13: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as artifact using A hokey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-13       AIRP-1.11.1             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-16: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-16       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-17: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-17       AIRP-1.11.1             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-18: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after unmarking SVE Quadrigeminy events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-18       AIRP-1.11.1             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-19: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after unmarking SVE Quadrigeminy events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-19       AIRP-1.11.1             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-20: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after capturing SVE Quadrigeminy event using Capture button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-20       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-21: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after updating Technician comment on panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 03/26/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-21       AIRP-1.11.1      auto      R3
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    View Each Event Thumbnail On   row=2
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Filter Capture      comment=Test        is_submit=${True}
    Filter Header       is_save=${True}
    Filter Panel        view_detail=${True}     technician_comment=Test update the technician comment    is_done=${True}
    ${event_selected_update}     Get Events Selected
    ${status_event_update}         Evaluate    [value == 'SVE Quadrigeminy' for value in ${event_selected_update}]
    Run Keyword And Continue On Failure    Should Contain    ${status_event_update}       ${True}
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Header    is_reset_rhythm=${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-22: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after removing SVE Quadrigeminy strip on Panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-22       AIRP-1.11.1             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-23: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after marking all SVE Quadrigeminy event as artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 03/26/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-23       AIRP-1.11.1       auto      R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Filter Option Select All    mark_all_artifact=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Artifact' for value in ${events_selected}])
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Option Select All    reset_all_change=${False}
    ${mark_all_artifact}      Check Select All Option Available
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}        ${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${mark_all_artifact}[Mark all as artifact]      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-24: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after deleting SVE Quadrigeminy event by button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after deleting SVE Quadrigeminy event by button
    ...
    ...     Precondition:
    ...     1. Having a SVE Quadrigeminy event
    ...     2. The user is on the SVE Quadrigeminy sub-tab
    ...
    ...     Test Steps:
    ...    1. Click on an SVE Quadrigeminy event
    ...    2. Click the delete button
    ...    3. Observe the SVE Quadrigeminy sub-tab
    ...     Expected Results:
    ...     1.The unsaved symbol shall be displayed on the SVE Quadrigeminy sub-tab
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...     Update date: 3/30/2025 - Hang Le
    ...     Create auto: 3/30/2025 - Hang Le
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-24       AIRP-1.14.0    auto       R2
    Navigate Airp Tab         tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Filter Thumbnail Option    is_deleted_event=${True}
    Verify Unsaved Symbol Is Displayed
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-25: Verify that the unsaved symbol shall displayed on the SVE Run tab after deleting SVE Run event by D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...     Create auto: 20/4/2025 - Hang Le
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-25       AIRP-1.14.0    auto       R2
    Navigate Airp Tab        tab=ECG Events
    Navigate To Ecg Events Subtab   SVE Quadrigeminy
    Filter Thumbnail Option    by_hotkey=D
    Verify Unsaved Symbol Is Displayed
    Filter Thumbnail Option    is_reset_change=${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-26: Verify that the unsaved symbol shall displayed on the SVE Quadrigeminy tab after deleting all SVE Quadrigeminy event by using Delete all events button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-26       AIRP-1.14.0    auto       R2
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Filter Option Select All    delete_all_events=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-30: Can navigate between events in the list by using keyboard (Arrow left/right/up/down)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-30       AIRP-1.11.1             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-31: Verify the button thumbnail header on "SVE Quadrigeminy" page
    [Documentation]     Author: Thang Tran
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-31       AIRP-1.11.1      manual     R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-01: Verify the first event will be selected by default
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-01       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-02: Verify the the thumbnail is displayed correctly in the first view
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-02       AIRP-1.11.1             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-03: Verify the channel on thumbnail is displayed correctly after selecting only CH1 channel
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-03       AIRP-1.11.1       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-04: Verify the channel on thumbnail is displayed correctly after selecting only CH2 channel
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-04       AIRP-1.11.1      manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-05: Verify the channel on thumbnail is displayed correctly after selecting only CH3 channel
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-05       AIRP-1.11.1      manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-06: Verify the channel on thumbnail is displayed correctly after selecting only AI channel
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-06       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-07: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH2 channels
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-07       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-08: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH3 channels
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-08       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-09: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH3 channels
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-09       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-10: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH2 & CH3 channels
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-10       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-11: Verify the number event thumbnail displayed on "VT" page with different sizes
    [Documentation]     Author: Thang Tran
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-11       AIRP-1.11.1     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-12: Verify the size on thumbnail is displayed correctly after selecting Medium size
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-12       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-13: Verify the size on thumbnail is displayed correctly after selecting Large size
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-13       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-14: Verify the gain on thumbnail is displayed correctly after selecting 1 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-14       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-15: Verify the gain on thumbnail is displayed correctly after selecting 2 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-15       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-16: Verify the gain on thumbnail is displayed correctly after selecting 5 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-16       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-18: Verify the gain on thumbnail is displayed correctly after selecting 7.5 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-18       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-19: Verify the gain on thumbnail is displayed correctly after selecting 10 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-19       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-20: Verify the gain on thumbnail is displayed correctly after selecting 20 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-20       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-21: Verify the gain on thumbnail is displayed correctly after selecting 50 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-21       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-22: Verify the gain on thumbnail is displayed correctly after selecting 100 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-22       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-26: Verify the gain on thumbnail is displayed correctly after selecting 200 mm/mV gain
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-26       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-24: Verify the HP on thumbnail is displayed correctly after selecting No HP
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-24       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-25: Verify the HP on thumbnail is displayed correctly after selecting 0.05 Hz HP
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-25       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-26.1: Verify the HP on thumbnail is displayed correctly after selecting 0.5 Hz HP
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-26.1       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-27: Verify the HP on thumbnail is displayed correctly after selecting 1 Hz HP
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-27       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-28: Verify the HP on thumbnail is displayed correctly after selecting 2 Hz HP
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
    ...     Update date: 9/26/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FUNCTIONALITY-28       AIRP-1.11.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-01: Can next page by using Next/Previous button
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-01       AIRP-1.10.1     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-02: Can next page by using the hotkey ‘Z’ or ‘X’
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
    ...
    ...     **Others**
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-02       AIRP-1.10.1       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-03: Can manually input a number within the limit displayed on the page number
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-03       AIRP-1.10.1     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-04: Check case user input the number is larger than the all page number
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-04       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-05: Check case the system shall block the entry of values other than integers
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-05       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-01: Verify that all information on the VT thumbnail is displayed completely
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-01       AIRP-1.10.1    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-01: Verify that the user can view all components on the Filter modal after clicking the filter button
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-01       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-02: Verify the filter hide reviewed events
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-02       AIRP-1.10.1     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-03: Verify the filter hide reviewed events when unsave mark reviewed
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     Auto create: 09/19/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-03       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-04: Verify that reviewed SVE Quadrigeminy events are hidden after enabling 'Hide Reviewed Events' and clicking Apply
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-04       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-05: Verify that reviewed SVE Quadrigeminy events are displayed after turning off 'Hide Reviewed Events' and clicking Apply
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-05       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-06: Verify that reviewed SVE Quadrigeminy events are displayed after clicking Reset button
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-06       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-07: Verify that captured strips of SVE Quadrigeminy events appear after checking 'Captured Strips' and clicking Apply
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-07       AIRP-1.10.1     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-08: Verify that all SVE Quadrigeminy events are displayed after unchecking 'Captured Strips' and clicking Apply
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-08       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-09: Verify that all SVE Quadrigeminy events are displayed after clicking Reset button
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-09       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-10: Verify that all SVE Quadrigeminy events display correctly with 'Hide Reviewed Events' enabled and 'Captured Strips' checked
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-10       AIRP-1.10.1     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-11: Verify that all SVE Quadrigeminy events are fully displayed after turning off 'Hide Reviewed Events' and unchecking 'Captured Strips'
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-FILTER-11       AIRP-1.10.1             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-10: Verify that all components are fully displayed on the information panel
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-11: Verify that the header of the panel information is displayed correctly in an event is selected
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-12: Verify that the header of the panel information is displayed correctly is not in an any event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-13: Verify that the event tab is only visible when the minute contains SVE Quadrigeminy events
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
    ...     7. 'View' button
    ...     8. 'Jump to' button
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-14: Verify that the information panel can contain multiple beat/rhythm events tabs
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-15: Verify that the event tabs on the information panel are ordered by time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-16: Verify that the Artifact tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-17: Verify that the VE Couplet tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-18: Verify that the VE Run tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-20: Verify that the VE Bigeminy tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-21: Verify that the VE Trigeminy tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-22: Verify that the VE Quadrigeminy tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-23: Verify that the SVE Couplet tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-24: Verify that the SVE Run tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-26: Verify that the SVE Bigeminy tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-27: Verify that the SVE Trigeminy tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-27       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-28: Verify that the SVE Quadrigeminy tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. SVE Quadrigeminy tab shall display as 'SVE Quadrigeminy 1', 'SVE Quadrigeminy 2', ...
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-28       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-29: Verify that the AFib tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-29       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-30: Verify that the Tachy tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-30       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-31: Verify that the Brady tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-31       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-32: Verify that the Pause tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-32       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-33: Verify that the VT tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-33       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-34: Verify that the SVT tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-34       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-35: Verify that the 2nd Deg HB tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-35       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-36: Verify that the 3rd Deg HB tab is displayed next to the SVE Quadrigeminy tab immediately after adding a new event
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
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-36       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-37: Verify that the VE Couplet tab is removed immediately after marking it as an artifact
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-37       AIRP-1.10.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-38: Verify that the VE Run tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-38       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-39: Verify that the VE Bigeminy tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-39       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-40: Verify that the VE Trigeminy tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-40       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-41: Verify that the VE Quadrigeminy tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-41       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-42: Verify that the SVE Couplet tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-43: Verify that the SVE Run tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-44: Verify that the SVE Bigeminy tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-45: Verify that the SVE Trigeminy tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-45       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-47: Verify that the SVE Quadrigeminy tab is removed immediately after marking it as an artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The SVE Quadrigeminy tab will be replaced by the 'Artifact' tab
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-48: Verify that the AFib tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-49: Verify that the Tachy tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-50: Verify that the Brady tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-51: Verify that the Pause tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-52: Verify that the VT tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-53: Verify that the SVT tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-54: Verify that the 2nd Deg HB tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-55: Verify that the 3rd Deg HB tab is removed immediately after marking it as an artifact
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-56: Verify that the AFib tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-57: Verify that the Tachy tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-58: Verify that the Brady tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-59: Verify that the Pause tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-60: Verify that the VT tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-61: Verify that the SVT tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-62: Verify that the 2nd Deg HB tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-63: Verify that the 3rd Deg HB tab is removed immediately after deleting it
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-64: Verify that the SVE Quadrigeminy start time updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-65: Verify that the SVE Quadrigeminy duration updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-66: Verify that the heart rate updates after adding a new N/S/V/Q beat in the SVE Quadrigeminy event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-67: Verify that the heart rate updates after deleting beats in the SVE Quadrigeminy event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-68: Verify that the heart rate displays as NA after updating Q beats in the SVE Quadrigeminy event area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-69: Verify that the user can navigate to the position of this event on the ECG viewer using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-70: Verify that multiple SVE Quadrigeminy strips are displayed on the information panel
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-71: Can view details of SVE Quadrigeminy event strip by clicking the view button in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-71     AIRP-1.10.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-72: Can update tecnician comment on strip details table in unsave status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-72     AIRP-1.10.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-73: Verify that the user cannot update the technician comment if it exceeds 520 characters in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-73     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-74: Can remove the capture strip on strip details table in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-74     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-75: Can view details of SVE Quadrigeminy event strip by clicking the view button in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-75     AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-76: Can update tecnician comment on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-76     AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-77: Verify that the user cannot update the technician comment if it exceeds 520 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-77     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-78: Can remove the capture strip on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-78     AIRP-1.10.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-79: Can close the strip details table by using X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-79    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-80: Can close the strip details table by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 09/13/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-80    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-81: Can close the strip details table by using Done button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-EVENT-81    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-01: Verify that the Minute info tab is only visible when the minute is not in an any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-01    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-02: Verify that the heart rate updates after adding a new N/S/V/Q beat in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-02    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-03: Verify that the heart rate displays as NA after updating Q beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-04: Verify that the heart rate updates after deleting beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-05: Verify that multiple strips can be displayed for one minute on the panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-06: Can view details of strips by clicking the view button in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-06     AIRP-1.10.0      manual        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-07: Can update title on strip details table in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-07     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-08: Can update tecnician comment on strip details table in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-08     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-09: Verify that the user cannot update the technician comment if it exceeds 100 characters in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-09     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-10: Verify that the user cannot update the technician comment if it exceeds 520 characters in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-10     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-11: Can remove the capture strip on strip details table in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-11     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-12: Can view details of SVE Quadrigeminy event strip by clicking the view button in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-12     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-13: Can update title on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-13     AIRP-1.10.0      manual        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-14: Can update tecnician comment on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-14     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-15: Verify that the user cannot update the technician comment if it exceeds 100 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-15     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-16: Verify that the user cannot update the technician comment if it exceeds 520 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-16     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-17: Can remove the capture strip on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-17     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-18: Can close the strip details table by using X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-18    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-19: Can close the strip details table by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-19    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-20: Can close the strip details table by using Done button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PANEL-MINUTE-20    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-01: Verify the data shall be shown corresponding in HR chart once the user selects the SVE Quadrigeminy event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-01       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-01.1: Verify the HR chart is working properly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-01.1       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-02: Verify the HR chart There shall be a list of dates within the study period
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-02      AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-03: Verify the number of events will be displayed on each day
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-03       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-04: Verify "No data" will be displayed on each day if there is no data recorded
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-04       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-05: Verify the day with the first event will be shown by default
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-05       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-06: Verify that the user can navigate to another date using the Next button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-06       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-07: Verify that the user can navigate back to the previous day using the Previous button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-07       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-08: Verify that the selected SVE Quadrigeminy event on the HR chart is highlighted in the event list above
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-08       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-09: Check the UI of the SVE Quadrigeminy event on the HR chart when a new event is added in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-09       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-10: Check the UI of the SVE Quadrigeminy event on the HR chart when the event duration is being changed in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-10       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-11: Verify the HR chart will not be displayed corresponding to the list event card above if adding new event in unsaved status
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-11       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-12: Verify user can zoom in HR chart by drags an area in the chart
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-12       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-13: Verify user can zoom in HR chart by clicking the (+) button
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-13       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-14: Verify user can zoom out HR chart by clicking the (-) button
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-14       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-15: Verify the user can reset zoom HR chart by using Reset zoom button
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-15       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-16: Verify that the HR chart highlights only AFib and Artifact events
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-16       AIRP-1.6.7       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-17: Verify the tool tip shall be displayed when the user hovers over the HR chart
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-17       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-18: Verify in HR chart, areas that do not have study data (due to study paused) will be marked in HR chart
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-18       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-19: Verify the tool tip 'NA' shall be displayed when the user hovers over the HR chart if the HR cannot be calculated
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-HR-CHART-19       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-01: Verify the data shall be shown corresponding in ECG viewer once the user selects the event
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-01       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-02: Can go to next/previous minute
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-02       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-03: Check the toolbar on ECG viewer is working properly
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-03     AIRP-1.10.0       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-04: Check the toolbar on ECG viewer with tab panel artifact is working properly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-04     AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-05: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 2.5 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-05       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-04.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-04.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-05.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 25 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-05.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-06: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-06       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-07: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 75 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-07       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-08: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-08       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-09: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-09       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-10: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 500 mm/s
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-10       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-11: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 1 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-11       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-12: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 2 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-12       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-13: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 5 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-13       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-14: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 7.5 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-14       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-15: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-15       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-16: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 20 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-16       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-17: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-17       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-18: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-18       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-19: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/mV
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-19       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-20: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to No
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-20       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-21: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.05 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-21       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-22: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.5 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-22       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-23: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 1 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-23      AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-24: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 2 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-24       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-25: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to No
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-25       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-26: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 15 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-26       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-27: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 30 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-27       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-28: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 40 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-28       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-29: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 50 Hz (Notch)
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-29       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-30: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 60 Hz (Notch)
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-30       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-31: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 100 Hz
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-31       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-32: Verify that the the ECG Viewer displays correctly after hiding only the CH1 channel
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-32       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-33: Verify that the the ECG Viewer displays correctly after hiding only the CH2 channel
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-33       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-34: Verify that the the ECG Viewer displays correctly after hiding only the CH3 channel
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-34       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-35: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH2 channel
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-35       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-36: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH3 channel
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-36       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-37: Verify that the the ECG Viewer displays correctly after hiding the CH2 & CH3 channel
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-37       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-38: Can mark a strip that does not belong to any event
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-38       AIRP-1.10.0     manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-39: Can mark multiple strips that does not belong to any event at the same time
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-39       AIRP-1.10.0     manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-40: Cannot mark a strip that does not belong to any event without entering title
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-40       AIRP-1.10.0    manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-41: Cannot mark a strip that does not belong to any event without entering technician comment
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-41       AIRP-1.10.0      manual       R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-42: Verify the system shall automatically recapture the strip in case updating N/S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-43: Verify that the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-44: Verify that the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-45: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
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
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-45       AIRP-1.10.0   manual        R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-46: Verify that the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-46       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-47: Verify that the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-48: Verify that the View button on the panel information is disabled during the capture saving process
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-48.1: Verify that the user cannot capture data in areas where no data is available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-CAPTURE-48.1       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49: Verify the toolbar on ECG viewer is working properly
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
    ...
    ...     **Others**
    ...
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49.1: Verify beat mark tool on the toolbar on ECG
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49.1       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49.2: Verify the zoom in and zoom out on ECG viewer toolbar
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
    ...
    ...     **Others**
    ...     Update date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49.2      AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49.3: Verify that the user can add an N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-49.3       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-50: Verify that the user can add an N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-51: Verify that the user can add an N beat in the ECG Viewer using add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-52: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-53: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-54: Verify that the user can change V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-55: Verify that the user can delete an N beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-56: Verify that the user can delete an N beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-57: Verify that the user can delete an N beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-58: Verify that the user can delete an N beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-59: Verify that the user can add an S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-60: Verify that the user can add an S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-61: Verify that the user can add an S beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-62: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-63: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-64: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-65: Verify that the user can delete an S beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-66: Verify that the user can delete an S beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-67: Verify that the user can delete an S beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-68: Verify that the user can delete an S beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-69: Verify that the user can add an V beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-70: Verify that the user can add an V beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-71: Verify that the user can add an V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-71       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-72: Verify that the user can change N/S/Q beat to V in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-72       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-73: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-73       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-74: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-74       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-75: Verify that the user can delete an V beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-75       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-76: Verify that the user can delete an V beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-76       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-77: Verify that the user can delete an V beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-77       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-78: Verify that the user can delete an V beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-78       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-79: Verify that the user can add an Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-79       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-80: Verify that the user can add an Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-80       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-81: Verify that the user can add an Q beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-81       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-82: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-82       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-83: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-83       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-84: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-84       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-85: Verify that the user can delete an Q beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-85       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-86: Verify that the user can delete an Q beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-86       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-87: Verify that the user can delete an Q beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-87       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-88: Verify that the user can delete an Q beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-88       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-89: Verify that the Zoom in toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-89       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-90: Verify that the Zoom out toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-90       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-91: Verify that the user can exit "View All Strips" mode by clicking the "Exit view all strip mode" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-91       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-92: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-92       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-93: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-93       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-94: Verify that the Vertical Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-94       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-95: Verify that the Beat Calipers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-95       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-96: Verify that the Text Annotation option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-96       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-97: Verify that the Mark a Pattern option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-97       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-99: Verify that the Hide Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-99       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-100: Verify that the Show Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ECG-100       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-01: Verify if there is a delete button on the VE Quadrigeminy screen
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-01       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-02: Verify that a tooltip is displayed when hovering over the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-02       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-03: Verify that the user can delete an SVE Quadrigeminy event after using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...     Auto Create: 03/28/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-03       AIRP-1.14.0             auto      R1
    Navigate Airp Tab    tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Verify Delete A Event By Button

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-04: Verify that the user can delete an SVE Quadrigeminy event after using the delete hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-04       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-05: Verify that the user can delete multiple SVE Quadrigeminy events after using the D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-05       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-06: Verify that the user can delete multiple SVE Quadrigeminy events after using the D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-06       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-08: Verify that the SVE Quadrigeminy event is deleted if the user deletes all beats in the event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-08       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-09: In SVE Run event, if the user deletes all beats except one, the system should delete the event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-09       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-10: Verify that the SVE Quadrigeminy event is deleted if a new Tachy event is added that overrides the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    #hien tai dang bug 1816
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-10       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-12: Verify that the SVE Quadrigeminy event is deleted if a new Brady event is added that overrides the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    #hien tai dang bug 1816
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-12       AIRP-1.14.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-13: Verify that the SVE RQuadrigeminyun event is deleted if a new Pause event is added that overrides the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    #hien tai dang bug 1816
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-13       AIRP-1.14.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-14: Verify that the SVE Quadrigeminy event is deleted if a new VT event is added that overrides the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-14       AIRP-1.14.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-15: Verify that the SVE Quadrigeminy event is deleted if a new SVT event is added that overrides the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-16: Verify that the SVE Quadrigeminy event is deleted if a new 2nd Deg HB event is added that overrides the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    #hien tai dang bug 1816
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-16       AIRP-1.14.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-17: Verify that the SVE Quadrigeminy event is deleted if a new 3rd Deg HB event is added that overrides the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.The number of SVE Quadrigeminy should decrease after successfully saving
    ...     2.All beats in the event are automatically converted to 'N' beat
    ...     3.The total beat related to SVEs in the Findings section should be updated after regenerating findings
    ...     4.Percent related to SVEs in the Findings section should be updated after regenerating findings
    ...     5.The total beat related to SVE in the Cover page should be updated after regenerating PDF report
    ...     6.Percent related to SVEs in the Cover page should be updated after regenerating PDF report
    ...     7.The total beat related to VE in the Findings should be updated after regenerating PDF report
    ...     8.Percent related to SVEs in the Findings should be updated after regenerating PDF report
    ...     9.The total beat related to SVE in the Total summary page should be updated after regenerating PDF report
    ...     10.Percent related to SVEs in the Total summary page should be updated after regenerating PDF report
    ...     11.The total SVE Quadrigeminy event in the Total summary page should be updated after regenerating PDF report
    ...     12.The total beat related to VE in the SVE burden analysis page should be updated after regenerating PDF report
    ...     13.Burden related to SVE in the VE burden analysis page should be updated after regenerating PDF report
    ...     14.The total SVE Quadrigeminy event in the VE burden analysis page should be updated after regenerating PDF report
    ...     15.The total SVE Quadrigeminy event on the VE burden analysis page for each day should be updated after regenerating the PDF report
    ...     16.VE burden on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    ...     17.VE couplet on the SVE burden analysis page for each day should be updated after regenerating the PDF report
    #hien tai dang bug 1816
    ...
    ...     **Others**
    ...     Update date: 12/6/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-18: Verify that all events will be deleted when using the 'Delete all event' function
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 08/17/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-DELETE-18       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-01: Verify the can mark an event as artifact by "Mark as artifact" button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:can mark an event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Click on the "Mark as artifact" by button -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-01       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 1
    View Each Event Thumbnail On   row=1
      ${panel_infor}     Get Panel Information Event
      ${start_time}      Format Datetime To Mmdd    ${panel_infor}[Start time]
    Filter Thumbnail Option       is_mark_as_artifact=${True}
      ${status}         Get Events Selected
    Filter Header    is_save=${True}
      ${expected_number_event}        Get Total Number Events
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${expected_artifact_event}        Get All Thumbnail Artifact
      ${expected_number_artifact}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time}')
      ${actual_number_artifact}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time}') + 1
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_event}        ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact}        ${expected_number_artifact}
    Run Keyword And Continue On Failure    List Should Contain Value    ${status}        Artifact

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-02: Verify the can mark multiple event as artifact by "Mark as artifact" button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as artifact" by button -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-02       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 2
    View Each Event Thumbnail On   row=1
      ${panel_infor_1}     Get Panel Information Event
      ${start_time_1}      Format Datetime To Mmdd    ${panel_infor_1}[Start time]
    Filter Thumbnail Option       is_mark_as_artifact=${True}
      ${status_artifact_1}         Get Events Selected
    Pagination Datetime       next_or_previous=next
      Edit Artifact Event   is_hr_chart=${True}         x_offset_start_time=-400      y_offset_start_time=20
    View Each Event Thumbnail On   row=5
      ${panel_infor_2}     Get Panel Information Event
      ${start_time_2}      Format Datetime To Mmdd    ${panel_infor_2}[Start time]
    Filter Thumbnail Option       is_mark_as_artifact=${True}
      ${status_artifact_2}         Get Events Selected
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
    Run Keyword And Continue On Failure    List Should Contain Value    ${status_artifact_1}        Artifact
    Run Keyword And Continue On Failure    List Should Contain Value    ${status_artifact_2}        Artifact

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-03: Verify the can mark an event as artifact by "A" hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark an event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Click on the "Mark as artifact" by hotkey "A" -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-03       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 1
    View Each Event Thumbnail On   row=1
      ${panel_infor}     Get Panel Information Event
      ${start_time}      Format Datetime To Mmdd    ${panel_infor}[Start time]
    Filter Thumbnail Option    by_hotkey=A
      ${status}         Get Events Selected
    Filter Header    is_save=${True}
      ${expected_number_event}        Get Total Number Events
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${expected_artifact_event}        Get All Thumbnail Artifact
      ${expected_number_artifact}       Evaluate    next(item['Artifact value'] for item in ${expected_artifact_event} if item['Date'] == '${start_time}')
      ${actual_number_artifact}         Evaluate    next(item['Artifact value'] for item in ${actual_artifact_event} if item['Date'] == '${start_time}') + 1
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_number_event}        ${expected_number_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact}        ${expected_number_artifact}
    Run Keyword And Continue On Failure    List Should Contain Value    ${status}        Artifact

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-04: Verify the can mark multiple event as artifact by "A" hotkey
     [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as artifact" by hotkey "A" -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...     7. Navigate to tab "Beats" -> Navigate to "Artifact areas" subtab -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as artifact
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...     7. Check the event has marked artifact displayed.
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-04       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab    Artifact areas
      ${actual_artifact_event}       Get All Thumbnail Artifact
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${number_events}        Get Total Number Events
      ${actual_number_event}        Evaluate    ${number_events} - 2
    View Each Event Thumbnail On   row=1
      ${panel_infor_1}     Get Panel Information Event
      ${start_time_1}      Format Datetime To Mmdd    ${panel_infor_1}[Start time]
    Filter Thumbnail Option       by_hotkey=A
      ${status_artifact_1}         Get Events Selected
    View Each Event Thumbnail On   row=5
      ${panel_infor_2}     Get Panel Information Event
      ${start_time_2}      Format Datetime To Mmdd    ${panel_infor_2}[Start time]
    Filter Thumbnail Option       by_hotkey=A
      ${status_artifact_2}         Get Events Selected
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
      ...   AND   Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_artifact_2}        ${expected_number_artifact_2}
    Run Keyword And Continue On Failure     Should Be Equal    ${actual_number_event}        ${expected_number_event}
    Run Keyword And Continue On Failure    List Should Contain Value    ${status_artifact_1}        Artifact
    Run Keyword And Continue On Failure    List Should Contain Value    ${status_artifact_2}        Artifact

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-05: Verify disabled "mark as artifact" button is case no data
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - There is no data to display
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button -> Observer the result
    ...     4. Click on the "Mark as artifact" by button -> Observer the result
    ...
    ...     Expected Results:
    ...     3. Check the information event display " No data "
    ...     4. Check the "Mark as Artifact" button is disabled
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-05       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-06: Verify disabled "mark as artifact" by hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - There is no data to display
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button -> Observer the result
    ...     4. Click on the "Mark as artifact" by hotkey "A" -> Observer the result
    ...
    ...     Expected Results:
    ...     3. Check the information event display " No data "
    ...     4. Check hotkey "A" is disabled
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-06       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-07: Verify the can mark an event as reviewed by "Mark as reviewed" button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark an event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - Do not existing the beat marked as reviewed
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Click on the "Mark as reviewed" by button -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-07       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Verify The Event Mark As Reviewed
    Verify The Multiple Events Mark As Reviewed

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-08: Verify the can mark multiple event as reviewed by "Mark as reviewed" button
     [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as reviewed" by button -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-08       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-09: Verify the can mark an event as reviewed by "R" hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark an event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Click on the "Mark as reviewed" by hotkey "R" -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-09       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Verify The Event Mark As Reviewed By Hotkey
    Verify The Multiple Events Mark As Reviewed By Hotkey

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-10: Verify the can mark multiple event as reviewed by "R" hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can mark multiple event as reviewed
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the multiple event strip
    ...     5. Click on the "Mark as reviewed" by hotkey "R" -> Observer the result
    ...     6. Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has marked as reviewed
    ...     6. Check the number event in tab "SVE Quadrigeminy"
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-10       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-11: Verify disabled "mark as reviewed" by button
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - There is no data to display
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button -> Observer the result
    ...     4. Click on the "Mark as reviewed" by button -> Observer the result
    ...
    ...     Expected Results:
    ...     3. Check the information event display " No data "
    ...     4. Check the "Mark as Reviewed" button is disabled
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-11       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-12: Verify disabled "mark as reviewed" by hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - There is no data to display
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button -> Observer the result
    ...     4. Click on the "Mark as reviewed" by hotkey "R" -> Observer the result
    ...
    ...     Expected Results:
    ...     3. Check the information event display " No data "
    ...     4. Check hotkey "R" is disabled
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-12       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-09.1: Verify that all events are marked as artifact when using the 'Mark all as artifact' function
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-09.1       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-01: Verify that the user can add a SVE Quadrigeminy event by adding at least three consecutive pairs of NNNS beats in the ECG Viewer using the NNNS beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-01       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-02: Verify that the user can add a SVE Quadrigeminy event by adding at least three consecutive pairs of NNNS beats in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-03: Verify that the user can add a SVE Quadrigeminy event by adding at least three consecutive pairs of NNNS beats in the ECG Viewer using the 'NNNS' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-04.1: Verify that the user can add a SVE Quadrigeminy event by changing N/V/Q beat to NNNS beat in the ECG Viewer using the NNNS beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-04.1       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-05: Verify that the user can add a SVE Quadrigeminy event by changing N/V/Q beat to NNNS beat in the ECG Viewer using the 'NNNS' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-06: Verify that the user can add a SVE Quadrigeminy event by changing N/V/Q beat to NNNS beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-01: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH1 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-01       AIRP-1.10.0      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-02: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH1 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-03: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH1 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-04: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH2 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-04       AIRP-1.10.0      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-05: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH2 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-06: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH2 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-07: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH3 channel and 10-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-07       AIRP-1.10.0       manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-08: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH3 channel and 20-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-09: Verify that the user can mark a strip belonging to an SVE Quadrigeminy event with CH3 channel and 30-second duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-10: Verify that the user can mark multiple strips that belong to SVE Quadrigeminy event at the same time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-11: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-11       AIRP-1.10.0      manual        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-12: Verify the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-13: Verify the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-14: Verify the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-15: Verify the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-16: Verify that the user cannot mark a strip belonging to an SVE Quadrigeminy event without entering Technician comment
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-16       AIRP-1.10.0         manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-17: Verify the system shall automatically recapture the strip in case updating N/S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-18: Check case the capture duration 20s is disabled on pop-up
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-19: Check case the capture duration 30s is disabled on pop-up
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-20: Verify that the technician comment field allows a maximum of 520 characters
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-12: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as artifact using Mark as artifact button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-12       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-13: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as artifact using A hokey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-13       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-16: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-16       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-17: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after marking SVE Quadrigeminy events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-17       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-18: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after unmarking SVE Quadrigeminy events as reviewed using Mark as reviewed button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-18       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-19: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after unmarking SVE Quadrigeminy events as reviewed using R hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-19       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-20: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after capturing SVE Quadrigeminy event using Capture button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-20       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-21: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after updating Technician comment on panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-21       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-22: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after removing SVE Quadrigeminy strip on Panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-22       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-23: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after marking all SVE Quadrigeminy event as artifact
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-23       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-24: Verify that the Reset button shall displayed on the SVE Quadrigeminy tab after deleting all SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-24       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-25: Verify that the changes will be reset by clicking on the Reset button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 09/27/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-25       AIRP-1.10.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-26: Verify the user can reset all changes when using the 'Reset all changes' function
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
    ...     Update date: 9/26/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-26       AIRP-1.14.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-26.1: Verify that the 'Reset All Changes' function works correctly if the user has used the 'Delete all events' function before
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-26.1       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-27: Verify that the 'Reset All Changes' function works correctly if the user has used the 'Mark all as artifact' function before
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-RESET-27       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-01.: Verify the thumbnail header on "SVE Quadrigeminy" page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the all button is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Observer the result
    ...     5. Click on the "Size/Gain/HP" dropdown list -> Observer the result
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
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-01.     auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
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

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-02.: Verify the number event thumbnail displayed on "SVE Quadrigeminy" page with different sizes
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The number event displayed correct follow the size is small, medium, lager
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     5. Select "Small/Medium/Large" on the "Size" dropdown list -> Observer the result
    ...
    ...     Expected Results:
    ...     5. - Verify the number event thumbnail displayed: small > medium > large
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-02.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${number_small_size}          Filter Header    size=Small
      ${number_medium_size}         Filter Header    size=Medium
      ${number_large_size}          Filter Header    size=Large
      ${number_status}              Verify Number Size Heatmap    number_small=${number_small_size}   number_medium=${number_medium_size}     number_large=${number_large_size}
      Filter Header    size=Small
    Run Keyword And Continue On Failure    Should Be True    ${number_status}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-01.: Verify the pagination tool
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Click on the "Next" button
    ...     5. Click on the "Previous"
    ...     6. Observer the result
    ...
    ...     Expected Results:
    ...     3. Verify the page displayed default is 1
    ...     4. Verify the page displayed is 2
    ...     5. Verify the page displayed is 1
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-01.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=next
      ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports    next_or_previous=previous
      ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-02.: Verify the pagination tool by hotkey
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool by hotkey is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Using hotkey "Z" (is Next button)
    ...     5. Using hotkey "X" (is Previous button)
    ...     6. Observer the result
    ...
    ...     Expected Results:
    ...     3. Verify the page displayed default is 1
    ...     4. Verify the page displayed is 2
    ...     6. Verify the page displayed is 1
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-02.     auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${current_pagination_default}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=next
      ${current_pagination_next}     Get Current Airp Pagination
    Pagination Aireports Hotkey    next_or_previous=previous
      ${current_pagination_previous}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_next}[Page]     2
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_previous}[Page]     1

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-03.: Verify the pagination tool can manually input a number within the limit displayed on the page number
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool can manually input a number within the limit displayed on the page number
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Input number in page input
    ...
    ...     Expected Results:
    ...     4. - Input the page number is 0 -> verify message displayed
    ...        - Input the number is larger than the ‘all page’ number -> verify message displayed
    ...        - Check the user fill in only integers
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-PAGINATION-03.     auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${current_pagination_default}     Get Current Airp Pagination
      ${status_page_less_than}     Edit Page Number      page_number=0
      ${current_total_page}     Get Current Total Page Airp Pagination
      ${current_total_page}     Evaluate    ${current_total_page} + 1
      ${status_page_lager_than}     Edit Page Number      page_number=${current_total_page}
      ${status_page}     Edit Page Number      page_number=1
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination_default}[Page]     1
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_less_than}
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page_lager_than}
    Run Keyword And Continue On Failure    Should Be True    ${status_page}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-03.: Verify the information in Each event thumbnail
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the pagination tool is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Observer the result
    ...
    ...     Expected Results:
    ...     4. Verify the information for each event thumbnail is: Start time, Day number, Channel.)
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-03.     auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    View Each Event Thumbnail On   row=1
    Filter Header    panel_tab=SVE Quadrigeminy
      ${each_event_infor}     Get Thumbnail Ventricular Ecg Events
      ${panel_infor}          Get Panel Information Event
      ${panel_start_time}           Evaluate    '${panel_infor}[Start time]'.split(', ')[1]
    Run Keyword And Continue On Failure    Should Be Equal     ${each_event_infor}[0][Start Time]       ${panel_start_time}
    Run Keyword And Continue On Failure    Should Be Equal    ${each_event_infor}[0][Channel]          ${panel_infor}[Channel]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-04.: Verify the filter hide reviewed events
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The event mark as reviewed will be displayed when toggle off and hide if toggle on
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the events thumbnail -> Click on the "Mark as reviewed" button -> Click on the "Save" button
    ...     5. Filter by "Hide reviewed events" -> Click on the "Apply" button -> Observer the result
    ...     6. Select on the "Reset" button -> Observer the result
    ...
    ...     Expected Results:
    ...     4. Verify the all events has been mark as reviewed
    ...     5. filter "Hide reviewed events" toggle off -> Check displayed all event
    ...        filter "Hide reviewed events" toggle on -> Check hide all events that mark as reviewed
    ...     6. Verify the "Hide reviewed events" is toggle off, check events thumbnail back to original
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-04.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-05.: Verify the filter hide reviewed events when unsave mark reviewed
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The event mark as reviewed will be displayed when toggle off and hide if toggle on
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the events thumbnail -> Click on the "Mark as reviewed" button
    ...     5. Filter by "Hide reviewed events" -> Click on the "Apply" button -> Observer the result
    ...     6. Select on the "Reset" button -> Observer the result
    ...
    ...     Expected Results:
    ...     5. filter "Hide reviewed events" toggle off -> Check displayed all event
    ...        filter "Hide reviewed events" toggle on -> Check hide all events that mark as reviewed
    ...     6. Verify the "Hide reviewed events" is toggle off, check events thumbnail back to original
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-05.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-06.: Verify the HR chart is working properly
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
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button -> Click the zoom in, zoom out tool -> Observer the result
    ...     4. Click on the "Next"(or "Previous") button -> Observer the result
    ...
    ...     Expected Results:
    ...     3. - Check the zoom tool: Min: 100 %, max: 2000%
    ...        - Check the "Reset zoom" button will be displayed when the user zooms in on the Hr chart (not displayed for 100%)
    ...     4. - The number of events will be displayed on each day.
    ...        - By default, the day with the first event will be shown.
    ...        - The user will use the ‘Next’, or ‘Previous’ button to navigate to another date.
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-06.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    View Each Event Thumbnail On   row=1
      ${default_value_zoom}     Get Zoom Tool Hr Chart
    Filter Zoom Tool    min_or_max_percent=2000%
      ${expected_value_zoom}     Get Zoom Tool Hr Chart
    Filter Zoom Tool    is_reset_zoom=${True}
      ${current_value_zoom}     Get Zoom Tool Hr Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${default_value_zoom}       100%
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_value_zoom}       2000%
    Run Keyword And Continue On Failure    Should Be Equal    ${current_value_zoom}       100%

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-07.: Verify the HR chart There shall be a list of dates within the study period
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: - number of events will be displayed on each day
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Navigate to HR chart
    ...     4. Click on the "Next"(or "Previous") button -> Observer the result
    ...
    ...     Expected Results:
    ...     4. - The number of events will be displayed on each day.
    ...        - By default, the day with the first event will be shown.
    ...        - The user will use the ‘Next’, or ‘Previous’ button to navigate to another date.
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-07.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    View Each Event Thumbnail On   row=1
    ${panel_info}       Get Panel Information Event
    ${date_format}      Format Datetime To Mmdd    ${panel_info}[Start time]
    ${start_date}       Get Current Datetime Start Date
    Pagination Datetime       next_or_previous=next
    ${start_date_next}       Get Current Datetime Start Date
    Pagination Datetime       next_or_previous=previous
    ${start_date_previous}       Get Current Datetime Start Date
    Run Keyword And Continue On Failure    Should Be Equal    ${start_date}[Date]     ${date_format}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${start_date}[Date]      ${start_date_next}[Date]
    Run Keyword And Continue On Failure    Should Be Equal    ${start_date_previous}[Date]      ${start_date}[Date]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-08.: Verify the toolbar on ECG viewer is working properly
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
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button -> Observer the result
    ...     4. Click on the "Beat Marker Tool" -> Observer the result
    ...     5. Click on the "Zoom Tool" -> Observer the result
    ...
    ...     Expected Results:
    ...     3. Verify The toolbar displayed: SPEED, GAIN, HP, LP, CH1, CH2, CH3, Capture, Beat Marker Tool, Zoom Tool, View All Strip
    ...     4. Verify add beat marker: N, S, V, Q and Delete
    ...     5. Verify the zoom in, zoom out
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-08.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
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
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker N]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker S]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker V]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Add Beat Marker Q]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Delete]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-13.: Verify beat mark tool on the toolbar on ECG
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Click on the "Beat Marker Tool" -> Observer the result
    ...
    ...     Expected Results:
    ...     4. Verify add beat marker: N, S, V, Q and Delete
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-13.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-23.: Verify the zoom in and zoom out on ECG viewer toolbar
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Verify the zoom in and zoom out on ECG viewer toolbar
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Click on the "Zoom Tool" -> Click on chart -> Observer the result
    ...
    ...     Expected Results:
    ...     4. Verify the zoom in, zoom out
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-23.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Filter Toolbar Ecg Viewer    zoom_tool=${True}
    ${status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${status}[Zool Tool]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-09.: Verify the button thumbnail header on "SVE Quadrigeminy" page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: check the all button is working properly
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Observer the result
    ...
    ...     Expected Results:
    ...     4. The button is working properly and enabled
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-09.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${status_button}            Check Button Thumbnail Header Available
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Mark as artifact]
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Mark as reviewed]
    Run Keyword And Continue On Failure    Should Be True    ${status_button}[Filter event]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-01.: Verify adding beats in ECG Viewer will create an Event SVE Quadrigeminy
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Create an Event SVE Quadrigeminy
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Add beats to ECG Viewer
    ...     5. Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     5. The new event will add new to tab "SVE Quadrigeminy" -> verify the event
    ...
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-01.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-02.: Verify SVE Quadrigeminy is created from a one N beat and a one V beat alternating 3 or more times
     [Documentation]     Author: Thang Tran
    ...
    ...     Description: Create an Event SVE Quadrigeminy
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Check the SVE Quadrigeminy in ECG Viewer
    ...     5. Observer the result
    ...
    ...     Expected Results:
    ...     5. SVE Quadrigeminy is created from a one N beat and a one V beat alternating 3 or more times
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-02.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-03.: Verify that add new event with the other event type
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has not a duration that is related to the current duration
    ...     and End Time has a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...     - Does not existing the event on tab "AFib/Brady/Pause/Tachy/SVT/2nd Deg HB/3rd Deg HB" that event created from tab AFib
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the other event type "AFib/Brady/Pause/Tachy/SVT/2nd Deg HB/3rd Deg HB"
    ...     6. Select Start Time has not a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observer the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. The new event will add new to tab "AFib/Brady/Pause/Tachy/SVT/2nd Deg HB/3rd Deg HB" -> verify the event
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-03.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-04.: Verify that the new event cannot be added to the other event type when the new event already exists on the event.
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: can add new event when select Start Time has not a duration that is related to the current duration
    ...     and End Time has a duration that is related to the current duration
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - The start time and end time of the event has not add on the other tab
    ...     - Does not existing the event on tab "AFib/Brady/Pause/Tachy/SVT/2nd Deg HB/3rd Deg HB" that event created from tab AFib
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Click on the "Add New Event" button
    ...     5. Select the other event type "AFib/Brady/Pause/Tachy/SVT/2nd Deg HB/3rd Deg HB"
    ...     6. Select Start Time has not a duration that is related to the current duration on the ECG Viewer
    ...     7. Select End Time has a duration that is related to the current duration on the ECG Viewer
    ...     8. Click on the "Done" button -> Observer the result
    ...     9. Click on the "Close" button -> Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     8. The new event display on popup
    ...     9. The new event will add new to tab "AFib/Brady/Pause/Tachy/SVT/2nd Deg HB/3rd Deg HB" -> verify the event
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-04.     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-10.: Verify the information on list of rhythm events on page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Check the list of beat events displayed correct
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat Events -> Observe the screen
    ...
    ...     Expected Results:
    ...     2. - Verify the list of beat events displayed: V
    ...        - Verify the Number of events shall display on each section above: If the number is larger than 100, it will display ‘99+’
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-10.      auto
    Navigate Airp Tab     tab=ECG Events
    ${beat_events_menu}     Get List Beat Events Menu
    ${actual_beat_events_menu}                 Evaluate    [k for k, v in ${beat_events_menu}.items()]
    ${expected_event_types_menu}   Create List    VE Couplet    VE Run    VE Bigeminy    VE Trigeminy    VE Quadrigeminy    SVE Couplet   SVE Run   SVE Bigeminy   SVE Trigeminy    SVE Quadrigeminy
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${number_event}                 Evaluate    '${beat_events_menu}[SVE Quadrigeminy]'
    ${total_number}         Get Total Number Events
    ${number_of_events_hover}         Get Number Events On Tab Menu
    ${status}     Check Number Event Strips    total_number_event=${total_number}     number_on_section=${number_event}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_event_types_menu}     ${actual_beat_events_menu}
    Run Keyword And Continue On Failure    Should Be True        ${status}
    Run Keyword And Continue On Failure    Should Be Equal       ${total_number}     ${number_of_events_hover}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-11.: Verify the option "Mark all as artifact" on SVE Quadrigeminy section
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: the all the event has been marked all the artifact
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Hover to "SVE Quadrigeminy" tab
    ...     4. Select option "Mark all as artifact"
    ...     5. Select on the "Save" button
    ...     6. Observe the result
    ...
    ...     Expected Results:
    ...     5. Verify option: ‘Mark all as artifact’ function: all the events will be marked as artifact.
    ...     6. Number event on SVE Quadrigeminy = 0
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 05/20/2024 - Thang Tran
    ...     Update date: 09/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-11.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Filter Option Select All    mark_all_artifact=${True}
    ${events_selected}      Get Events Selected
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${status_mark_as_artifact}        Check Button Thumbnail Header Available
    Filter Option Select All    reset_all_change=${False}
    ${mark_all_artifact}      Check Select All Option Available
    Filter Option Select All    reset_all_change=${True}
    Run Keyword And Continue On Failure    List Should Contain Value    ${events_selected}      Artifact
    Run Keyword And Continue On Failure    Should Be True    ${mark_all_artifact}[Mark all as artifact]
    Run Keyword And Continue On Failure    Should Not Be True    ${status_mark_as_artifact}[Mark as artifact]
    Run Keyword And Continue On Failure    Should Not Be True    ${status_mark_as_artifact}[Mark as reviewed]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-12.: Verify the option "Reset all changes" on SVE Quadrigeminy section
     [Documentation]     Author: Thang Tran
    ...
    ...     Description: select "Reset all changes" then the All event SVE Quadrigeminy not change and back to original
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Hover to SVE Quadrigeminy tab
    ...     4. Select option "Mark all as artifact" or "Delete all events"
    ...     5. Select option "Reset all changes"
    ...     6. Select on the "Save" button
    ...     7. Observer the result
    ...
    ...     Expected Results:
    ...     5,7. - Verify option: All the value event back to original
    ...          - Number event on SVE Quadrigeminy back to original
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 05/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-12.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-13.: Verify the " Mark as Artifact " button is disabled when "Mark all artifact"
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Hover to "SVE Quadrigeminy" tab
    ...     4. Select option "Mark all as artifact"
    ...     5. Select on the "Save" button -> Observer the result
    ...     6. Check after Save that the "Mark as artifact" button is disabled
    ...
    ...     Expected Results:
#    ...     5. Number event on SVE Quadrigeminy = 0
    ...     6. "Mark as artifact" button disabled
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 05/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-13.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-14.: Verify the " Mark as Reviewed " button is disabled when "Mark all artifact"
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Hover to "SVE Quadrigeminy" tab
    ...     4. Select option "Mark all as artifact"
    ...     5. Select on the "Save" button -> Observer the result
    ...     6. Check after Save that the "Mark as reviewed" button is disabled
    ...
    ...     Expected Results:
#    ...     5. Number event on SVE Quadrigeminy = 0
    ...     6. "Mark as artifact" button disabled
    ...     Auto create: 05/20/2024 - Thang Tran
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-14.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-05.: Verify SVE Quadrigeminy when adding any beat into the SVE Quadrigeminy event area
      [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Add any beat to the SVE Quadrigeminy event area on ECG Viewer
    ...     6. Click on the "Save" button -> Observer the result
    ...
    ...     Expected Results:
    ...     6. The currently selected Event SVE Quadrigeminy will be deleted and will disappear from the Thumbnail
    ...
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-ADD-05.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-15.: Verify the number of events when hovering "99+" on the events tab
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Hover to "SVE Quadrigeminy" tab
    ...     4. Hover to "99+"
    ...     5. Observer the result
    ...
    ...     Expected Results:
    ...     5. Number event on SVE Quadrigeminy
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 09/29/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-15.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-16.: Verify and hold down the CTRL button to select other events on the Thumbnail tab
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:can select multiple event by "Ctrl" button
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Hold "Ctrl" button on the keyboard
    ...     6. Click select events you want to add
    ...     7. Observer the result
    ...
    ...     Expected Results:
    ...     7. Selected all desired events.
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-16.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-17.: Verify the can reset changes as artifact by button
      [Documentation]     Author: Thang Tran
    ...
    ...     Description:can reset changes an event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Select button "Mark as artifact" or "Mark as reviewed"
    ...     6. Select option "Reset changes"
    ...     7. Observer the result
    ...
    ...     Expected Results:
    ...     5,7. - Verify option: All the value event back to original
    ...          - Number event on SVE Quadrigeminy back to original
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-17.       auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${expected_number_events}        Get Total Number Events
    Filter Thumbnail Option     is_mark_as_artifact=${True}
      ${status_reset}       Check Button Thumbnail Header Available
    Filter Header         is_reset_rhythm=${True}
      ${actual_number_events}        Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_events}      ${actual_number_events}
    Run Keyword And Continue On Failure    Should Be True    ${status_reset}[Reset Changes]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-15.: Verify the can unmarked as reviewed as artifact by button
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:can unmarked as reviewed an event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...     - There must be at least 1 event marked reviewed
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event marked reviewed strip
    ...     5. Select the "Unmark as reviewed" button
    ...     6. Click on the "Save" button
    ...     7. Observer the result
    ...
    ...     Expected Results:
    ...     5. Check the information event has unmarked as reviewed
    ...     7. Check the number event in tab "SVE Quadrigeminy"
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-15.     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-18.: Verify page Panel information display
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...
    ...     Expected Results:
    ...     The header of the panel information :
    ...         - The time of the selected event (MM/DD/YYYY, HH:mm:ss)
    ...     Event tab:
    ...         - Event start time (MM/DD/YYYY, HH:mm:ss)
    ...         - Duration
    ...         - "Jump to" button
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-18.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-01.: Verify can capture strips by button
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Click on the "Capture" button -> Observer the result
    ...     5. Click "Capture" button  -> Observer the result
    ...     6. Click on the "Save" button
    ...     7. Observer the result
    ...
    ...     Expected Results:
    ...     4. The popup window that displays the following:
    ...         - Capture duration (sec) – selection between “10”, “20”, and “30”
    ...         - Highlight channel – selection between “1”, “2”, and “3”
    ...         - Technician comment
    ...     5,7. The ECG viewer for the event shall also be highlighted for the selected duration
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-01.      auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Filter Toolbar Ecg Viewer    beat_close=${True}
    Filter Toolbar Ecg Viewer    capture=${True}
    Mark A Strip Airp    technician_comment=test capture        is_save=${False}
      ${actual_capture_duration}        Get Value Capture Duration
      ${actual_hightlight_channel}        Get Value Highlight Channel
      ${expected_capture_duration}      Create List    10s   20s   30s
      ${expected_hightlight_channel}      Create List    CH1   CH2   CH3
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_capture_duration}       ${actual_capture_duration}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_hightlight_channel}       ${actual_hightlight_channel}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-02.: Verify can capture multiple strips by button on the same event
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Click on the "Capture" button -> Observer the result
    ...     5. Click "Capture" button -> Observer the result
    ...     6. Select another region on ECG Viewer
    ...     7. Click on the "Capture" button -> Observer the result
    ...     8. Click "Capture" button -> Observer the result
    ...     9. Click on the "Save" button
    ...     10. Observer the result
    ...
    ...     Expected Results:
    ...     4,7. The popup window that displays the following:
    ...         - Capture duration (sec) – selection between “10”, “20”, and “30”
    ...         - Highlight channel – selection between “1”, “2”, and “3”
    ...         - Technician comment
    ...     5,8,10. The ECG viewer for the event shall also be highlighted for the selected duration
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-02.     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-01.: Verify panel will change information according to the event changed on the thumbnail
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Continuously select other events on the thumbnail
    ...     6. Observer the result
    ...
    ...     Expected Results:
    ...     6. The panel will change to match the selected event
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-01.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-02.: Verify the ECG viewer will change information according to the event changed on the thumbnail
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "SVE Quadrigeminy" button
    ...     4. Select the event strip
    ...     5. Continuously select other events on the thumbnail
    ...     6. Observer the result
    ...
    ...     Expected Results:
    ...     6. The ECG viewer will change to match the selected event
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-02.      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-19.: Verify start time of the event card on the thumbnail appears the same as on the HR Chart
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - Start time in HR Chart displays the same as on the event card
    ...
    ...     **Others**
    ...     Update date: 07/01/2024 - Thang Tran

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-19.     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-20.: Verify day time of the event card on the thumbnail appears the same as on the HR Chart
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - Daytime in HR Chart displays the same as on the event card
    ...
    ...     **Others**
    ...     Update date: 07/01/2024 - Thang Tran

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-20.     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-21.: Verify to another day in HR chart
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - Unselected event card in thumbnail
    ...     - StartTime , daytime in ECG Viewer will change to the same HR Chart
    ...
    ...     **Others**
    ...     Update date: 07/01/2024 - Thang Tran

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-21.     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-03.: Selected event card has a different daytime than the daytime on the HR chart
     [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - HR chart changes to daytime containing events
    ...
    ...     **Others**
    ...     Update date: 07/01/2024 - Thang Tran

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-03.     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-03.: The captured blue highlight will disappear when switching to the Minute info tab
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - The capture's blue highlight does not appear in the minute tab
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-03.      manual    AIRP-1.9.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-04.: Can not update beats in the nodata area
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     -
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-EDIT-04.      manual    AIRP-1.9.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-04.: Can not capture in the nodata area
    [Documentation]     Author: Thang Tran
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     -
    ...
    ...     **Others**
    ...     Create date: 07/01/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-CAPTURE-04.     manual    AIRP-1.9.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-22.: Verify the can reset changes as reviewed by button
      [Documentation]     Author: Thang Tran
    ...
    ...     Description:can reset changes an event
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Beat events
    ...     3. Click on the "VE RUN" button
    ...     4. Select the event strip
    ...     5. Select button "Mark as reviewed"
    ...     6. Select option "Reset changes"
    ...     7. Observer the result
    ...
    ...     Expected Results:
    ...     5,7. - Verify option: All the value event back to original
    ...          - Number event on VE RUN back to original
    ...
    ...     **Others**
    ...     Create date: 05/23/2024 - Thang Tran
    ...     Auto create: 07/23/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-22.     auto
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
      ${expected_number_events}        Get Total Number Events
    Filter Header        mark_reviewed=${True}
      ${status_reset}       Check Button Thumbnail Header Available
    Filter Header         is_reset_rhythm=${True}
      ${actual_number_events}        Get Total Number Events
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_events}      ${actual_number_events}
    Run Keyword And Continue On Failure    Should Be True    ${status_reset}[Reset Changes]

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-23..:Verify that the checkbox 'Use 100% available time' appears in the 'Add New Event' modal when the event type is set to AFib.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-23..       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib
    ${expected}    Verify Use Add All Afib In Ecg Event
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-24.:Verify that the checkbox 'Use 100% available time' can be marked when adding a new event with the event type AFib.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-24.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${verify_checkbox}    Get Time Event    is_checkbox_checked=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${verify_checkbox}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-16:Verify that when marking the checkbox 'Use 100% available time', the start time is set to the beginning of the study.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-16       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${study_information}    Get Study Information
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${start_date}    Get Time Event    start_date=${True}
    ${start_time}    Get Time Event    start_time=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[Start Date]    ${start_date}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[Start Time]    ${start_time}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-17:Verify that when marking the checkbox 'Use 100% available time', the stop time is set to the end of the study
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-MARK-17       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${study_information}    Get Study Information
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${end_date}    Get Time Event    end_date=${True}
    ${end_time}    Get Time Event    end_time=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Date]    ${end_date}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Time]    ${end_time}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-25.:Verify that using the 'Jump to' button for the start time will set it to the beginning of the day when the checkbox 'Use 100% available time' is marked
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-25.       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-26.:Verify that using the 'Jump to' button for the stop time will set it to the end of the day when the checkbox 'Use 100% available time' is marked
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-26.       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Tachy type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Tachy
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.1:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Brady type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.1       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Brady
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.2:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Pause type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.2       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Pause
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.3:Verify that the 'Use 100% available time' checkbox is hidden when selecting the VT type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.3       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=VT
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.4:Verify that the 'Use 100% available time' checkbox is hidden when selecting the SVT type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.4       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=SVT
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.5:Verify that the 'Use 100% available time' checkbox is hidden when selecting the 2nd Deg HB type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.5       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=2nd Deg HB
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.6:Verify that the 'Use 100% available time' checkbox is hidden when selecting the 3rd Deg HB type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-27.6       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=3rd Deg HB
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-28.:Verify that when adding a new AFib event with the duration as 100% available time, all AFib events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-28.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    AFib
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}


BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-29.:Verify that when adding a new AFib event with the duration as 100% available time, all Tachy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-29.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    Tachy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-30.:Verify that when adding a new AFib event with the duration as 100% available time, all Brady events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-30.      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    Brady
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-31.:Verify that when adding a new AFib event with the duration as 100% available time, all SVT events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-31.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVT
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}


BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-32.:Verify that when adding a new AFib event with the duration as 100% available time, all 2nd Deg HB events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-32.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    2nd Deg HB
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-33.:Verify that when adding a new AFib event with the duration as 100% available time, all 3rd Deg HB events within that duration will be deleted.
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
    ...     Auto create: 05/13/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-33.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-34.:Verify that when adding a new AFib event with the duration as 100% available time, all SVE couplet events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-34.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Couplet
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-35.:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Run events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-35.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Run
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-36.:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Bigeminy events within that duration will be deleted.
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
    ..     Auto create: 05/13/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-36.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Bigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-37.:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Trigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-37.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Trigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-38.:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Quadrigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-38.       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-39:Verify that when adding a new AFib event with the duration as 100% available time, all beats S will be deleted
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
    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-VIEW-39       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-02: Verify signal beat marks on the thumbnail display correctly in the first view
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-02       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-03: Verify beat types on the thumbnail match the beat types on the corresponding ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-03       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-04: Verify the number of beats on the thumbnail matches the number of beats on the corresponding ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-04       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-05: Verify that the color of each beat on the thumbnail type displays correctly
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-05       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-06: Verify N beats on thumbnail is deleted when deleting N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-06       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-07: Verify S beats on thumbnail is deleted when deleting S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-07       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-08: Verify V beats on thumbnail is deleted when deleting V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-08       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-09: Verify Q beats on thumbnail is deleted when deleting Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-09       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-10: Verify N beats on thumbnail is updated to S beats when changing N beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-10       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-11: Verify N beats on thumbnail is updated to V beats when changing N beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-11       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-12: Verify N beats on thumbnail is updated to Q beats when changing N beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-12       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-13: Verify S beats on thumbnail is updated to N beats when changing S beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-13       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-14: Verify S beats on thumbnail is updated to V beats when changing S beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-14      AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-15: Verify S beats on thumbnail is updated to Q beats when changing S beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-15       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-16: Verify V beats on thumbnail is updated to N beats when changing V beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-16       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-17: Verify V beats on thumbnail is updated to S beats when changing V beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-17       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-18: Verify V beats on thumbnail is updated to Q beats when changing V beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-18       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-19: Verify Q beats on thumbnail is updated to N beats when changing Q beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-19       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-20: Verify Q beats on thumbnail is updated to V beats when changing Q beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-20       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-21: Verify Q beats on thumbnail is updated to S beats when changing Q beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-ECG-EVENT-SVE-QUADRIGEMINY-THUMBNAIL-21       AIRP-1.13.0             manual      R1
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
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-460      y_offset_start_time=100      x_offset_end_time=100      y_offset_end_time=10
    ${expected_datetime}                 Get Start And End Time
    Filter Thumbnail Option      is_add=${True}
    View New Events On    row=1
    ${actual_thumbnail_new_event}        Get Thumbnail New Events
    Set Global Variable    ${expected_datetime}
    Set Global Variable    ${actual_thumbnail_new_event}

Create a new event with the newly selected start time and the event type "${event_type}" on row "${row_number}"
    Navigate To Aireport
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    VT
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
    Edit Artifact Event      is_end_time=${True}  x_offset_end_time=350      y_offset_end_time=10
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
    Navigate To Aireport
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    VT
    View Each Event Thumbnail On    row=${row_number}
    Filter Thumbnail Option     change_event_duration=${True}
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Filter Thumbnail Option      is_done=${True}
    Filter Header     is_save=${True}
    ${actual_number_event}        Get Total Number Events
    Set Global Variable    ${actual_number_event}

Verify the multiple events mark as reviewed
    ${current_events}       Get Total Number Events
    ${actual_events}       Evaluate    ${current_events} - 2
    View Multiple Each Event Thumbnail On   row=2
    Filter Header     mark_reviewed=${True}       is_save=${True}
    Filter Each Event    hide_reviewed_event=checked      is_submit=${True}
    ${expected_events}       Get Total Number Events
    Filter Each Event     is_reset=${True}
    ${expected_events_total}       Get Total Number Events
    View Multiple Each Event Thumbnail On   row=2
    Filter Header     mark_reviewed=${True}       is_save=${True}
    View Each Event Thumbnail On    row=1
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_events}        ${expected_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${current_events}        ${expected_events_total}

Verify the event mark as reviewed
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

Verify the multiple events mark as reviewed by hotkey
    ${current_events}       Get Total Number Events
    ${actual_events}       Evaluate    ${current_events} - 2
    View Multiple Each Event Thumbnail On   row=2
    Filter Thumbnail Option    by_hotkey=R
    Filter Header     is_save=${True}
    Filter Each Event    hide_reviewed_event=checked      is_submit=${True}
    ${expected_events}       Get Total Number Events
    Filter Each Event     is_reset=${True}
    ${expected_events_total}       Get Total Number Events
    View Multiple Each Event Thumbnail On   row=2
    Filter Thumbnail Option    by_hotkey=R
    Filter Header     is_save=${True}
    View Each Event Thumbnail On    row=1
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_events}        ${expected_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${current_events}        ${expected_events_total}

Verify the event mark as reviewed by hotkey
    ${current_events}       Get Total Number Events
    ${actual_events}       Evaluate    ${current_events} - 1
    View Each Event Thumbnail On   row=2
    Filter Thumbnail Option    by_hotkey=R
    Filter Header     is_save=${True}
    Filter Each Event    hide_reviewed_event=checked      is_submit=${True}
    ${expected_events}       Get Total Number Events
    Filter Each Event     is_reset=${True}
    ${expected_events_total}       Get Total Number Events
    View Each Event Thumbnail On   row=2
    Filter Thumbnail Option    by_hotkey=R
    Filter Header     is_save=${True}
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_events}        ${expected_events}
    Run Keyword And Continue On Failure    Should Be Equal        ${current_events}      ${expected_events_total}

Verify Unsaved Symbol Is Displayed
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True         ${result}
