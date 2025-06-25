*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-ECG-EVENT-MAXHR
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
Force Tags      BFCC-AIRP-ECG-EVENT-MAXHR  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-01: Verify the menu option on Max HR section
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The menu option not displayed on Max HR, Min HR section
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Hover to Max HR tab -> Observe the result
    ...
    ...     Expected Results:
    ...     3. The menu option not displayed
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-02: Verify the panel information on "Max HR" page
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: Check the panel information on "Max HR/Min HR" page
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1. Click ECG Events tab
    ...     2. Navigate to Rhythm events
    ...     3. Click on the "Max HR" button
    ...     4. Observe the result
    ...
    ...     Expected Results:
    ...     4. - Verify there shall be a section with the following data: Time, Min HR for Min HR event(Max HR for Max HR event), Captured strips
    ...        - Verify format Time: MM/DD/YYYY, HH:mm:ss
    ...        - Check the "Jump" button working properly
    ...
    ...     **Others**
    ...     Create date: 04/05/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-03: Verify the HR chart is working properly
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
    ...     3. Click on the "Max HR" button -> Click the zoom in, zoom out tool -> Observe the result
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
    ...     Update date: 04/08/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-RHYTHM-CAPTURE-01: The captured blue highlight will disappear when switching to the Minute info tab
    [Documentation]     Author: Hoang Nguyen
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
    ...     Create date: 05/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-RHYTHM-CAPTURE-01     manual    AIRP-1.9.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-RHYTHM-EDIT-01: Can not update beats in the nodata area
    [Documentation]     Author: Hoang Nguyen
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
    ...     Create date: 05/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-RHYTHM-EDIT-01      manual    AIRP-1.9.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-RHYTHM-CAPTURE-02: Can not capture in the nodata area
    [Documentation]     Author: Hoang Nguyen
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
    ...     Create date: 05/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-RHYTHM-CAPTURE-02      manual    AIRP-1.9.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-04:Verify that the checkbox 'Use 100% available time' appears in the 'Add New Event' modal when the event type is set to AFib.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-04       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib
    ${expected}    Verify Use Add All Afib In Ecg Event
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-05:Verify that the checkbox 'Use 100% available time' can be marked when adding a new event with the event type AFib.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-05       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib
    ${expected}    Verify Use Add All Afib In Ecg Event
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-MARK-01:Verify that when marking the checkbox 'Use 100% available time', the start time is set to the beginning of the study.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-MARK-01       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${verify_checkbox}    Get Time Event    is_checkbox_checked=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${verify_checkbox}

BFCC-AIRP-ECG-EVENT-MAXHR-MARK-02:Verify that when marking the checkbox 'Use 100% available time', the stop time is set to the end of the study
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-MARK-02       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    ${study_information}    Get Study Information
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    ${end_date}    Get Time Event    end_date=${True}
    ${end_time}    Get Time Event    end_time=${True}
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Date]    ${end_date}
    Run Keyword And Continue On Failure    Should Be Equal    ${study_information}[End Time]    ${end_time}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-06:Verify that using the 'Jump to' button for the start time will set it to the beginning of the day when the checkbox 'Use 100% available time' is marked
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-06       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-07:Verify that using the 'Jump to' button for the stop time will set it to the end of the day when the checkbox 'Use 100% available time' is marked
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-07       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Tachy type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Tachy
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}
    
BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.1:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Brady type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.1       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Brady
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.2:Verify that the 'Use 100% available time' checkbox is hidden when selecting the Pause type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.2       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Pause
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.3:Verify that the 'Use 100% available time' checkbox is hidden when selecting the VT type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.3       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=VT
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.4:Verify that the 'Use 100% available time' checkbox is hidden when selecting the SVT type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.4       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=SVT
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.5:Verify that the 'Use 100% available time' checkbox is hidden when selecting the 2nd Deg HB type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.5       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=2nd Deg HB
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.6:Verify that the 'Use 100% available time' checkbox is hidden when selecting the 3rd Deg HB type.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-08.6       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=3rd Deg HB
    ${expected}    Verify Use Add All Afib
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Not Be True    ${expected}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-09:Verify that when adding a new AFib event with the duration as 100% available time, all AFib events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-09       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    AFib
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-10:Verify that when adding a new AFib event with the duration as 100% available time, all Tachy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-10       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    Tachy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-11:Verify that when adding a new AFib event with the duration as 100% available time, all Brady events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-11      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    Brady
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-12:Verify that when adding a new AFib event with the duration as 100% available time, all SVT events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-12       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVT
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-13:Verify that when adding a new AFib event with the duration as 100% available time, all 2nd Deg HB events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-13       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    2nd Deg HB
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}
BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-14:Verify that when adding a new AFib event with the duration as 100% available time, all 3rd Deg HB events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-14       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    3rd Deg HB
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-15:Verify that when adding a new AFib event with the duration as 100% available time, all SVE couplet events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-15       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Couplet
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-16:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Run events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-16       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Run
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-17:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Bigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-17       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Bigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-18:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Trigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-18       AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Trigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-19:Verify that when adding a new AFib event with the duration as 100% available time, all SVE Quadrigeminy events within that duration will be deleted.
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-19      AIRP-1.14.0             auto      R1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    Max HR
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=AFib    use_add_all_afib=${True}
    Filter Thumbnail Option    is_add=${True}
    Navigate To Ecg Events Subtab    SVE Quadrigeminy
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Undo Until Disabled
    Run Keyword And Continue On Failure    Should Be Equal    ${event_status}      ${True}

BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-20:Verify that when adding a new AFib event with the duration as 100% available time, all beats S will be deleted
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
    [Tags]      BFCC-AIRP-ECG-EVENT-MAXHR-VIEW-20       AIRP-1.14.0             manual      R1
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
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

#SUITE SETUP
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
    Filter Header Beats Hr    is_save=${True}
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Change strips to beats by button "${beat_name}"
    ${number_beats}   Get Information Cell On Chart
    ${results}     Change Strip To Beats On Page     beat_change=beat${beat_name}
    Run Keyword And Continue On Failure    Should Be Equal    ${results}        ${beat_name}
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - 1
    Filter Header Beats Hr    is_save=${True}
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Delete a strip to beat by button
    ${number_beats}   Get Information Cell On Chart
    ${number_beats}       Evaluate    ${number_beats}[Number of beats] - 1
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Artifact Event Airp
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header Beats Hr    is_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    ${beat_name}     Deleted Artifact Event Airp          is_save=${True}
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
    Filter Header Beats Hr    is_change=${True}
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
    Filter Header Beats Hr    is_save=${True}
    ${expected_strip_beats}         Get Number Strip Beats
    ${expected_beats}   Get Information Cell On Chart
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats}     ${expected_beats}[Number of beats]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_strip_beats}     ${expected_beats}[Number of beats]

Delete multiple strips to beats by hotkey
    ${number_beats}   Get Information Cell On Chart
    ${number_elements_deleted}      Change Multiple Strips To Beats On Page    is_deleted=${True}
    Filter Header Beats Hr    is_save=${True}
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
    Filter Header Beats Hr    is_change=${True}
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
    Filter Header Beats Hr    is_save=${True}
    ${msg}              Get Message Notification
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[Beat Message]      Select a cell on the heatmap chart below to view its beats.
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}[ECG Message]       There is no ECG data to display.
