*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-BEAT-ARTIFACT
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library    project_bioflux_ai_report_portal/lib/web/EcgEvent.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-BEAT-ARTIFACT  web
Test Timeout    15m

*** Test Cases ***
BFCC-AIRP-BEAT-ARTIFACT-VIEW-01: View a list of cards
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. A card will contain the following information:
    ...     2. Date (MM/DD)
    ...     3. Day [#number]
    ...     4. The number of artifact events in the day
    ...
    ...     **Others**
    ...     Update date: 03/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-VIEW-01     auto    R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    ${artifact}     Get All Thumbnail Artifact
    ${date}         Evaluate    [item['Date'] for item in ${artifact}]
    Check Format Date    ${date}

BFCC-AIRP-BEAT-ARTIFACT-VIEW-02: View all information on the selected date
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. On the selected date, it displays the following data:
    ...     - A list of artifact events that happened in the day
    ...     - By default, the first event will be selected
    ...     - Every 20 events will be grouped into 1 page, the user will use the ‘Next’, or ‘Previous’ button or manually
    ...     input a number (1) to navigate to the other page with the other 20 events in the day.
    ...     - There shall be functionality for users to choose the channels displayed on the thumbnail, offering the
    ...     following options: CH1, CH2, CH3
    ...     - AI (set as default): The user can only select one of two options: AI or CH1,2,3
    ...     - Size: Small, Medium (set as default), Large
    ...     - Gain: the value from 1 -> 200 mm/mV, default value is 7.5 mm/mV
    ...     - HP: No, 0.05 Hz, 0.5 Hz, 1 Hz (set as default), 2 Hz
    ...     2. Each event thumbnail includes:
    ...     - Start time of the event
    ...     - Day number
    ...     - ECG sample - it will display the ECG in [“start time – 1s” to “start time + 4s”]
    ...     - Duration
    ...     - Channel
    ...     4. Panel information
    ...     5. HR chart and ECG Viewer
    ...
    ...     **Others**
    ...     Update date: 03/13/2024 - Trinh Nguyen
    ...     Auto Create: 03/19/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-VIEW-02     auto    R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${artifact_detail}     Get Thumbnail Overview
    ${events_thumbnail}     Get Thumbnail Events No Hr
    ${channel_config}      Create List    CH1   CH2   CH3   AI
    ${expected_size_config}      Create List    Small   Medium   Large
    ${expected_gain_config}      Create List    1 mm/mV   2 mm/mV   5 mm/mV   7.5 mm/mV   10 mm/mV   20 mm/mV    50 mm/mV   100 mm/mV    200 mm/mV
    ${expected_highpass_config}      Create List    No   0.05 Hz    0.5 Hz    1 Hz    2 Hz
    ${actual_size_config}     Get Size Config
    ${actual_gain_config}     Get Gain Config
    ${actual_highpass_config}     Get Highpass Config
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_gain_config}          ${actual_gain_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_highpass_config}          ${actual_highpass_config}
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${channel_config}       ${artifact_detail}[Thumbnail]
    Run Keyword And Continue On Failure    Lists Should Be Equal   ${expected_size_config}          ${actual_size_config}
    Run Keyword And Continue On Failure     Should Be Equal    ${artifact_detail}[Size][0]       Small
    Run Keyword And Continue On Failure     Should Be Equal    ${artifact_detail}[Gain][0]       7.5
    Run Keyword And Continue On Failure     Should Be Equal    ${artifact_detail}[HP][0]        1
    #4 ,5 not create

BFCC-AIRP-BEAT-ARTIFACT-VIEW-03: Verify all components on the Artifact areas are displayed correctly in case "There is no data to display"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Shall disable, hover displays tooltip
    ...
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-VIEW-03       AIRP-1.9.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-VIEW-04: Verify UI on the Artifact areas are displayed correctly in case "There is no data"
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. study: 17700, acc:super3, pls view UI on 06/22 tab
    ...
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-VIEW-04       AIRP-1.9.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-VIEW-05: Verify that the unsaved symbol shall displayed on the Artifact tab after changing Artifact event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. study: 17700, acc:super3, pls view UI on 06/22 tab
    ...
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-VIEW-05       AIRP-1.9.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-VIEW-06: Verify that the unsaved symbol shall displayed on the Artifact tab after deleting Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. study: 17700, acc:super3, pls view UI on 06/22 tab
    ...
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-VIEW-06       AIRP-1.9.0             manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-VIEW-07: Can navigate between events in the list by using keyboard (Arrow left/right/up/down)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 03/29/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-VIEW-07   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-01: Verify the Artifact tab only shows when the minute has an event in it
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Event start time (MM/DD/YYYY, HH:mm:ss)
    ...     2. Duration
    ...     3. ‘Jump to’ button
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-01    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-02: Verify the Artifact start time updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-02    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-03: Verify the Artifact duration updates after changing the event duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-03    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-04: Verify the user can navigate to the position of this event on the ECG Viewer using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-04    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-01: Verify that the Minute info tab is only visible when the minute is not in an any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 03/13/2024 - Trinh Nguyen
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...     Release: 1.7.0
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-01     manual     AIRP1.7.0
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    Navigate Airp Tab     tab=Beats
#    Navigate Airp Artifact
#    View Airp Artifact On    row=1
#    Filter Header    panel_tab=Minute info
#    ${minute_info}     Get Panel Information Event
#    ${expected_date}    Format Datetime To Mmdd    ${minute_info}[Time]
#    ${actual_panel_details}     Evaluate    [k for k, v in ${minute_info}.items()]
#    ${artifact}     Get All Thumbnail Artifact
#    ${actual_date}         Evaluate    [item['Date'] for item in ${artifact}]
#    ${events_thumbnail}     Get Thumbnail Events Selected No Hr
#    ${expected_panel_details}     Create List       Time    Channel     Heart rate      Captured strips
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_date}      ${actual_date}[0]
#    Run Keyword And Continue On Failure    Should Be Equal    ${minute_info}[Channel]      ${events_thumbnail}[0][Channel]
#    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_panel_details}        ${actual_panel_details}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-02: Verify that the heart rate updates after adding a new N/S/V/Q beat in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-02    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-03: Verify that the heart rate displays as NA after updating Q beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-04: Verify that the heart rate updates after deleting beats in that minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-05: Verify that multiple strips can be displayed for one minute on the panel info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-06: Can view details of strips by clicking the view button in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-06     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-07: Can update title on strip details table in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-07     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-08: Can update tecnician comment on strip details table in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-08     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-09: Verify that the user cannot update the technician comment if it exceeds 100 characters in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-09     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-10: Verify that the user cannot update the technician comment if it exceeds 520 characters in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-10     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-11: Can remove the capture strip on strip details table in draft status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-11     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-12: Can view details of AFib event strip by clicking the view button in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-12     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-13: Can update title on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-13     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-14: Can update tecnician comment on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-14     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-15: Verify that the user cannot update the technician comment if it exceeds 100 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-15     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-16: Verify that the user cannot update the technician comment if it exceeds 520 characters in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-16     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-17: Can remove the capture strip on strip details table in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-17     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-18: Can close the strip details table by using X button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-18    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-19: Can close the strip details table by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-19    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-20: Can close the strip details table by using Done button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PANEL-MINUTE-20    AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-01: Can next page by using Next/Previous button
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
    ...     Update date: 03/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-01     auto    R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${current_pagination}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Pagination Aireports    next_or_previous=next
    ${current_pagination}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Aireports    next_or_previous=previous
    ${current_pagination}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-02: Can next page by using the hotkey ‘Z’ or ‘X’
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
    ...     Update date: 03/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-02     auto
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${current_pagination}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Pagination Aireports Hotkey    next_or_previous=next
    ${current_pagination}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Aireports Hotkey    next_or_previous=previous
    ${current_pagination}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-03: Can manually input a number within the limit displayed on the page number
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
    ...     Update date: 03/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-03     auto
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${current_pagination}     Get Current Airp Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    ${status_page}     Edit Page Number      page_number=0
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page}
    ${current_total_page}     Get Current Total Page Airp Pagination
    ${current_total_page}     Evaluate    ${current_total_page} + 1
    ${status_page}     Edit Page Number      page_number=${current_total_page}
    Run Keyword And Continue On Failure    Should Not Be True    ${status_page}
    ${status_page}     Edit Page Number      page_number=1
    Run Keyword And Continue On Failure    Should Be True    ${status_page}

BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-04: Check case user input the number is larger than the all page number
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
    ...     Update date: 03/14/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-05: Check case the system shall block the entry of values other than integers
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-PAGINATION-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-01.1: Verify the thumbnail is displayed correctly in the first view
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-01.1       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-01: Verify the channel on thumbnail is displayed correctly after selecting only CH1 channel
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-01       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Filter Header    channel=CH1
    ${events_thumbnail}     Get Thumbnail Events No Hr
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH1' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be True    ${all_value}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-02: Verify the channel on thumbnail is displayed correctly after selecting only CH2 channel
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-02       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Filter Header    channel=CH2
    ${events_thumbnail}     Get Thumbnail Events No Hr
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH2' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be True    ${all_value}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-03: Verify the channel on thumbnail is displayed correctly after selecting only CH3 channel
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-03       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Filter Header    channel=CH3
    ${events_thumbnail}     Get Thumbnail Events No Hr
    ${actual_channel}         Evaluate    [item['Channel'] for item in ${events_thumbnail}]
    ${all_value}          Evaluate      all([value == 'CH3' for value in ${actual_channel}])
    Run Keyword And Continue On Failure    Should Be True    ${all_value}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-04: Verify the channel on thumbnail is displayed correctly after selecting only AI channel
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-05: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH2 channels
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-06: Verify the channel on thumbnail is displayed correctly after selecting CH1 & CH3 channels
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-07: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH3 channels
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-07       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-08: Verify the channel on thumbnail is displayed correctly after selecting CH2 & CH2 & CH3 channels
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-09: Verify the size on thumbnail is displayed correctly after selecting Small size
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto Create: 08/15/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-09       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${artifact_detail}     Get Thumbnail Overview
    Run Keyword And Continue On Failure     Should Be Equal    ${artifact_detail}[Size][0]       Small
    ${number_small_size}          Filter Header    size=Small
    ${number_medium_size}         Filter Header    size=Medium
    ${number_large_size}          Filter Header    size=Large
    ${number_status}              Verify Number Size Heatmap    number_small=${number_small_size}   number_medium=${number_medium_size}     number_large=${number_large_size}
    Run Keyword And Continue On Failure    Should Be True    ${number_status}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-10: Verify the size on thumbnail is displayed correctly after selecting Medium size
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto Create: 08/15/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-11: Verify the size on thumbnail is displayed correctly after selecting Large size
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto Create: 08/15/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-12: Verify the gain on thumbnail is displayed correctly after selecting 1 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-13: Verify the gain on thumbnail is displayed correctly after selecting 2 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-14: Verify the gain on thumbnail is displayed correctly after selecting 5 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-15: Verify the gain on thumbnail is displayed correctly after selecting 7.5 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-16: Verify the gain on thumbnail is displayed correctly after selecting 10 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-17: Verify the gain on thumbnail is displayed correctly after selecting 20 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-18: Verify the gain on thumbnail is displayed correctly after selecting 50 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-19: Verify the gain on thumbnail is displayed correctly after selecting 100 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-20: Verify the gain on thumbnail is displayed correctly after selecting 200 mm/mV gain
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-21: Verify the HP on thumbnail is displayed correctly after selecting No HP
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-22: Verify the HP on thumbnail is displayed correctly after selecting 0.05 Hz HP
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-23: Verify the HP on thumbnail is displayed correctly after selecting 0.5 Hz HP
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-24: Verify the HP on thumbnail is displayed correctly after selecting 1 Hz HP
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-25: Verify the HP on thumbnail is displayed correctly after selecting 2 Hz HP
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-FUNCTIONALITY-25       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-01.1: Verify only the artifact events are displayed on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-01.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-01: Verify the data shall be shown corresponding in ECG viewer once the user selects the event
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
    ...     Update date: 03/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-02: Can go to next/previous 1 minute
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-02     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
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

BFCC-AIRP-BEAT-ARTIFACT-ECG-03: Check the toolbar on ECG viewer is working properly
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
    ...     Update date: 03/14/2024 - Trinh Nguyen
    ...     Auto create: 03/26/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-03     auto
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
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
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Beat Marker Tool]
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[View All Strip]

BFCC-AIRP-BEAT-ARTIFACT-ECG-04: Check the toolbar on ECG viewer with tab panel artifact is working properly
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
    ...     Update date: 03/14/2024 - Trinh Nguyen
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...     Auto create: 03/28/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-04     auto
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
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
    Filter Header      panel_tab=Minute info
    ${expected_status}     Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Capture]

BFCC-AIRP-BEAT-ARTIFACT-ECG-05: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 2.5 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-05       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-04.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-04.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-05.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 25 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-05.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-06: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-06       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-07: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 75 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-07       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-08: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-08       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-09: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-09       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-10: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 500 mm/s
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-10       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-11: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 1 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-11       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-12: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 2 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-12       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-13: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 5 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-13       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-14: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 7.5 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-14       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-15: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-15       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-16: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 20 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-16       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-17: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-17       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-18: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-18       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-19: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/mV
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-19       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-20: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to No
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-20       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-21: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.05 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-21       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-22: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.5 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-22       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-23: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 1 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-23      AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-24: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 2 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-24       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-25: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to No
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-25       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-26: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 15 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-26       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-27: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 30 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-27       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-28: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 40 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-28       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-29: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 50 Hz (Notch)
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-29       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-30: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 60 Hz (Notch)
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-30       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-31: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 100 Hz
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-31       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-32: Verify that the the ECG Viewer displays correctly after hiding only the CH1 channel
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-32       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-33: Verify that the the ECG Viewer displays correctly after hiding only the CH2 channel
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-33       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-34: Verify that the the ECG Viewer displays correctly after hiding only the CH3 channel
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-34       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-35: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH2 channel
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-35       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-36: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH3 channel
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-36       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-37: Verify that the the ECG Viewer displays correctly after hiding the CH2 & CH3 channel
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
    ...     Update date: 8/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-37       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-38: Can mark a strip that does not belong to any event
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
    ...     Update date: 03/14/2024 - Trinh Nguyen
    ...     Update date: 08/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-38     auto      R3
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=300         y_offset_start_time=30
    ${minute_info}     Get Panel Information Event
    ${panel_details}     Evaluate    [k for k, v in ${minute_info}.items()]
    Mark A Strip Airp    technician_comment=test capture        title=Thang Capture      is_save=${True}
    Filter Header      is_save=${True}
    Edit Artifact Event     is_hr_chart=${True}     x_offset_start_time=300         y_offset_start_time=30
    ${minute_info}     Get Panel Information Event
    ${actual_panel_details}     Evaluate    [k for k, v in ${minute_info}.items()]
    ${expected_panel_details}       Create List    Time     Channel     Heart rate      Captured strips
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_panel_details}         ${actual_panel_details}
    Run Keyword And Continue On Failure    Should Not Be Equal    ${expected_panel_details}         ${panel_details}
    Filter Panel    view_detail=${True}     remove_strip=${True}
    Filter Header      is_save=${True}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-39: Can mark multiple strips that does not belong to any event at the same time
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
    ...     Update date: 03/14/2024 - Trinh Nguyen
    ...     Update date: 08/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-39     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-40: Cannot mark a strip that does not belong to any event without entering title
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
    ...     Update date: 03/14/2024 - Trinh Nguyen
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...     Auto Create: 03/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-40       auto        R3
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    Filter Header    panel_tab=Minute info
    Mark A Strip Airp    technician_comment=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a title

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-41: Cannot mark a strip that does not belong to any event without entering technician comment
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
    ...     Update date: 08/13/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-41       AIRP-1.10.0      auto       R3
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    Filter Header    panel_tab=Minute info
    Mark A Strip Airp    title=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a comment

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-42: Verify the system shall automatically recapture the strip in case updating S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-43: Verify that the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-44: Verify that the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-45: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
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
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-45       AIRP-1.10.0     auto        R3
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    Filter Header    panel_tab=Minute info
    Mark A Strip Airp    title=test title      technician_comment=test comment   is_save=${True}
    Filter Header    is_save=${True}
    View Each Event Thumbnail On    row=1
    Filter Header    panel_tab=Minute info
    ${panel_infor}      Get Panel Information Event
    ${actual_items_panel}      Evaluate    [k for k, v in ${panel_infor}.items()]
    ${expected_items_pannel}        Create List    Time     Channel     Heart rate     Captured strips
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_items_pannel}        ${actual_items_panel}
    Mark A Strip Airp    title=test title      technician_comment=test comment   is_save=${True}
    Filter Header    is_save=${True}
    ${actual_panel_infor}      Get Panel Information Event
    Run Keyword And Continue On Failure    Should Be Equal    ${panel_infor}[Captured strips]       ${actual_panel_infor}[Captured strips]

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-46: Verify that the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyenn
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-46       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-47: Verify that the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-48: Verify that the View button on the panel information is disabled during the capture saving process
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-48.1: Verify that the user cannot capture data in areas where no data is available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-CAPTURE-48.1       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-49: Verify that the user can add an N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-50: Verify that the user can add an N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-51: Verify that the user can add an N beat in the ECG Viewer using add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-52: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-53: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-54: Verify that the user can change V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-55: Verify that the user can delete an N beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-56: Verify that the user can delete an N beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-57: Verify that the user can delete an N beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-58: Verify that the user can delete an N beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-59: Verify that the user can add an S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-60: Verify that the user can add an S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-61: Verify that the user can add an S beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-62: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-63: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-64: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-65: Verify that the user can delete an S beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-66: Verify that the user can delete an S beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-67: Verify that the user can delete an S beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-68: Verify that the user can delete an S beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-69: Verify that the user can add an V beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-70: Verify that the user can add an V beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-71: Verify that the user can add an V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-71       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-72: Verify that the user can change N/S/Q beat to V in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-72       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-73: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-73       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-74: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-74       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-75: Verify that the user can delete an V beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-75       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-76: Verify that the user can delete an V beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-76       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-77: Verify that the user can delete an V beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-77       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-78: Verify that the user can delete an V beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-78       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-79: Verify that the user can add an Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-79       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-80: Verify that the user can add an Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-80       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-81: Verify that the user can add an Q beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-81       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-82: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-82       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-83: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-83       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-84: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-84       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-85: Verify that the user can delete an Q beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-85       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-86: Verify that the user can delete an Q beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-86       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-87: Verify that the user can delete an Q beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-87       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-88: Verify that the user can delete an Q beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-88       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-89: Verify that the Zoom in toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-89       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-90: Verify that the Zoom out toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-90       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-91: Verify that the user can exit "View All Strips" mode by clicking the "Exit view all mode" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/13/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-91       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-92: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-92       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-94: Verify that the Vertical Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-94       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-95: Verify that the Beat Calipers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-95       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-96: Verify that the Text Annotation option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-96       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-97: Verify that the Mark a Pattern option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-97       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-99: Verify that the Hide Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-99       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ECG-100: Verify that the Show Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ECG-100       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-01: Verify the data shall be shown corresponding in HR chart once the user selects the event
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-02: Verify user can zoom in HR chart by drags an area in the chart
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-02       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-03: Verify user can zoom in HR chart by clicking the (+) button
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto create: 19/08/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-03       AIRP-1.9.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
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

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-04: Verify user can zoom out HR chart by clicking the (-) button
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto create: 19/08/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-05: Verify the user can reset zoom by using Reset zoom button
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
    ...     Update date: 8/8/2024 - Trinh Nguyen
    ...     Auto create: 19/08/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-05       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-06: Verify the user can reset zoom HR chart by using Reset zoom button
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-08: Verify the HR chart will not be displayed corresponding to the list event card above if adding new draft event without saving
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-08       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-09: Verify in HR chart, areas that have events will be highlighted with colors
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-09       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-10: Verify in HR chart, areas that do not have study data (due to study paused) will be marked in HR chart
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-10       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-11: Verify the tool tip shall be displayed when the user hovers over the HR chart
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
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-11       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-12: Verify the tool tip 'No data' shall be displayed when the user hovers over the HR chart if there is no data in a selected minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-12       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-13: Verify the tool tip 'NA' shall be displayed when the user hovers over the HR chart if the HR cannot be calculated
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-14: Verify the HR chart is not displayed if there is no data recorded
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 8/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-HR-CHART-14       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-01: Verify the user can view all information on Add new event modal by clicking Add new event button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Event type: Artifact
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-01       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-02: Verify the user can view all information on Add new event modal by using W hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Event type: Artifact
    ...     2. “Start time” and “End time” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. On the ECG viewer, there shall be a “Start” or “End” time indicator if the newly selected start or end time is displayed on the ECG viewer
    ...     4. There shall be “Add” and “Cancel” buttons
    ...
    ...     **Others**
    ...     Update date: 8/21/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-02       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-03: Check the Jump to button on Add new event modal is working properly
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-03   AIRP-1.12.0            auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Add New Event
    ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_result}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Not Be True     ${expected_result}[Jump To End Time]
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=10      y_offset_start_time=10      x_offset_end_time=200      y_offset_end_time=100
    ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Be True     ${expected_result}[Jump To End Time]
    Edit Artifact Event      is_cancel=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-03.1: Verify user can navigate the user to the start time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-03.1       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-04: Verify the Jump to button shall be disabled if there is no data in the Start time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-04       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-05: Verify user can navigate the user to the end time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-05       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-06: Verify the Jump to button shall be disabled if there is no data in the end time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-06       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-07: Verify the user can close the pop-up and exit the 'Add new' function by clicking the Cancel button
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-07     AIRP-1.12.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Add New Event
    ${expected_status}      Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Cancel]
    Edit Artifact Event      is_cancel=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-08: Verify there shall be an error message if only the start time is selected
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-08     AIRP-1.12.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       x_offset_start_time=10      y_offset_start_time=10
    Edit Artifact Event      is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Edit Artifact Event    is_cancel=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-09: Verify there shall be an error message if only the end time is selected
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-09       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-10: Cannot add new artfiact event without selecting start time and end time
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-10    AIRP-1.12.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Add New Event
    Edit Artifact Event     is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Edit Artifact Event    is_cancel=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-11: Verify there shall be an error message if the end time is less than the start time
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-11     AIRP-1.12.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=200      y_offset_start_time=100      x_offset_end_time=10      y_offset_end_time=10
    Edit Artifact Event      is_submit=${True}
    ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Edit Artifact Event    is_cancel=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-12: Verify there shall be an error message if there is a 'no data' are in the artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-12       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-13: Verify there shall be an error message if less than 2 beats
    [Documentation]     Author: Trinh Nguyen
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-13       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-16: Cannot add new artifact event if the new event is in the curren event
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-16     AIRP-1.12.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=10      x_offset_end_time=100      y_offset_end_time=10
    Run Keyword And Continue On Failure    Edit Artifact Event      is_submit=${True}
#    ${msg}                 Get Message On Aireport
    ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Edit Artifact Event    is_cancel=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-18: Verify there shall be an error message if an Artifact event is an AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-18       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-19: Verify there shall be an error message if an Artifact event is an VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-19       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-20: Verify there shall be an error message if an Artifact event is an VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-20       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-21: Verify there shall be an error message if an Artifact event is an VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-21       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-22: Verify there shall be an error message if an Artifact event is an VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-22       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-23: Verify there shall be an error message if an Artifact event is an VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-23       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-24: Verify there shall be an error message if an Artifact event is an SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-24       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-25: Verify there shall be an error message if an Artifact event is an SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-25       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-26: Verify there shall be an error message if an Artifact event is an SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-26       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-27: Verify there shall be an error message if an Artifact event is an SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-27       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-28: Verify there shall be an error message if an Artifact event is an SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-28       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-29: Verify there shall be an error message if an Artifact event is an Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-29       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-30: Verify there shall be an error message if an Artifact event is an Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-30       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-31: Verify there shall be an error message if an Artifact event is an Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-31       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-32: Verify there shall be an error message if an Artifact event is an VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-32       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-33: Verify there shall be an error message if an Artifact event is an SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-33       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-34: Verify there shall be an error message if an Artifact event is an 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-34       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-35: Verify there shall be an error message if an Artifact event is an 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-35       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-36: Verify there shall be an error message if new artifact has no beat and a duration of less than 10s
    [Documentation]     Author: Trinh Nguyen
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-36       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-37: Verify there shall be an error message if new artifact event contains only one beat and has duration of less than 10s
    [Documentation]     Author: Trinh Nguyen
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-37       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-38: Verify that if the newly created event is independent, it will be stored in the new event list
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-38     AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate Airp Tab     tab=Beats
#    Navigate Airp Artifact
#    ${info_tab_artifact}        Get All Thumbnail Artifact
#    ${number_artifact}          Evaluate    '${info_tab_artifact}[0][Artifact value]'
#    ${number_artifact}          Evaluate    int(${number_artifact}) + 1
#    Navigate To Add New Event
#    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=200      y_offset_start_time=20
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-400      y_offset_start_time=10      x_offset_end_time=300      y_offset_end_time=100
#    Edit Artifact Event      is_submit=${True}           is_close=${True}
#    Filter Header    is_save=${True}
#    ${info_tab_artifact}        Get All Thumbnail Artifact
#    ${expected_number_artifact}          Evaluate    int(${info_tab_artifact}[0][Artifact value])
#    Run Keyword And Continue On Failure    Should Be Equal    ${number_artifact}        ${expected_number_artifact}
##    View Airp Artifact On    row=1
#    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=200      y_offset_start_time=20
#    Deleted Artifact Event Airp
#    Filter Header    is_save=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-39: Verify that the user can add an Artifact event with only one beat if the duration is at least 10 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-39       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-40: Verify that the user can add an Artifact event with no beat if the duration is at least 10 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-40       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-41: Can add new artifact event intersects with the current event
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-41     AIRP-1.12.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Setup]    Change Event Duration Artifact Areas
#    ${artifact_arear}     Get All Thumbnail Artifact
#    ${expected_artifact_number}     Evaluate    int(${artifact_arear}[0][Artifact value])
#    Navigate To Add New Event
#    Edit Artifact Event      is_start_time=${True}      is_end_time=${True}     x_offset_start_time=-420      y_offset_start_time=10      x_offset_end_time=300      y_offset_end_time=100
#    Edit Artifact Event      is_submit=${True}           is_close=${True}
#    ${event_selected}     Get Events Selected
#    Run Keyword And Continue On Failure    List Should Contain Value    ${event_selected}       Deleted
#    Filter Header    is_save=${True}
#    ${artifact_arear}     Get All Thumbnail Artifact
#    ${actual_artifact_number}     Evaluate    int(${artifact_arear}[0][Artifact value])
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_artifact_number}       ${actual_artifact_number}

BFCC-AIRP-BEAT-ARTIFACT-ADD-42: Check case the new Artifact event intersects with the current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-42       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-43: Check case the new Artifact event intersects with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-43       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-44: Check case the new Artifact event intersects with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-44       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-45: Check case the new Artifact event intersects with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-45       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-46: Check case the new Artifact event intersects with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-46       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-47: Check case the new Artifact event intersects with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-47       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-48: Check case the new Artifact event intersects with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-48       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-49: Check case the new Artifact event intersects with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-49       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-50: Check case the new Artifact event intersects with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-50       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-51: Check case the new Artifact event intersects with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-51       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-52: Check case the new Artifact event intersects with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-52       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-53: Check case the new Artifact event intersects with the current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-53       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-54: Check case the new Artifact event intersects with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-54       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-55: Check case the new Artifact event intersects with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-55       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-56: Check case the new Artifact event intersects with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-56       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-57: Check case the new Artifact event intersects with the current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-57       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-58: Check case the new Artifact event intersects with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-58       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-59: Check case the new Artifact event intersects with the current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-59       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-60: Check case the new Artifact event intersects with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-60       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-61: Can add new artifact event overrides the current event
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-61     AIRP-1.12.0             auto      R1
    [Setup]    Change Event Duration Artifact Areas
    ${artifact_arear}     Get All Thumbnail Artifact
    ${expected_artifact_number}     Evaluate    int(${artifact_arear}[0][Artifact value])
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-420      y_offset_start_time=10      x_offset_end_time=420      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}           is_close=${True}
    Filter Header    is_save=${True}
    ${artifact_arear}     Get All Thumbnail Artifact
    ${actual_artifact_number}     Evaluate    int(${artifact_arear}[0][Artifact value])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_artifact_number}       ${actual_artifact_number}

BFCC-AIRP-BEAT-ARTIFACT-ADD-63: Check case the new Artifact event overrides with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-63       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-64: Check case the new Artifact event overrides with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-64       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-65: Check case the new Artifact event overrides with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-65       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-66: Check case the new Artifact event overrides with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-66       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-67: Check case the new Artifact event overrides with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-67       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-68: Check case the new Artifact event overrides with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-68       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-69: Check case the new Artifact event overrides with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-69       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-70: Check case the new Artifact event overrides with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-70       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-71: Check case the new Artifact event overrides with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-71       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-72: Check case the new Artifact event overrides with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-72       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-73: Check case the new Artifact event overrides with the current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-73       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-74: Check case the new Artifact event overrides with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-74       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-75: Check case the new Artifact event overrides with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-75       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-76: Check case the new Artifact event overrides with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-76       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-77: Check case the new Artifact event overrides with the current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-77       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-78: Check case the new Artifact event overrides with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-78       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-79: Check case the new Artifact event overrides with the current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-79       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-80: Check case the new Artifact event overrides with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-80       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-81: If a new artifact event is spread out across several days, it will not be divided into smaller events on each day in unsaved status
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-81     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-88: If a new artifact event is spread out across several days, it will not be divided into smaller events on each day in saved status
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-88     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-82: Check case the start time is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-82       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-83: Check case the end time is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-83       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-84: Verify the user can view all information on the New events modal by clicking the New event list button
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
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-84       AIRP-1.12.0       auto     R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-465      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Edit Artifact Event      is_submit=${True}      is_close=${True}
    ${status}       Get Events Selected
    ${expected_status}      Evaluate    all([value == 'Deleted' for value in ${status}])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_status}     ${True}
    Navigate To Event Draft Status
    ${event_draft}      Get Thumbnail New Events
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_draft}
    View New Events On    row=1
    Delete New Events On    row=1
    ${expected_result}          Get New Events
    Run Keyword And Continue On Failure    Should Be Empty    ${expected_result}
    ${total_event}              Get Number New Events Artifact
    Run Keyword And Continue On Failure    Should Be Equal    ${total_event}        0
    Edit Artifact Event     is_close=${True}

BFCC-AIRP-BEAT-ARTIFACT-ADD-85: Verify the number of event in unsaved status is displayed correctly on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-85       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-86: Verify the user can delete an event by using delete button on New events modal
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-86     AIRP-1.12.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-ADD-87: Verify the user can navigate to the position of the selected event on the HR chart and ECG viewer by using View button on New events modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-ADD-87       AIRP-1.12.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-DELETE-01: Can delete an artifact event
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
    ...     Update date: 03/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-DELETE-01     auto
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${artifact}     Get All Thumbnail Artifact
    ${current_number_artifact}         Evaluate    [item['Artifact value'] for item in ${artifact}]
    ${current_number_artifact}         Evaluate    ${current_number_artifact}[0] - 1
    ${status_save}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${status_save}[Save]
    ${deleted}     Deleted Artifact Event Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${deleted}        Deleted
    Filter Header    is_save=${True}
    ${artifact}     Get All Thumbnail Artifact
    ${number_artifact}         Evaluate    [item['Artifact value'] for item in ${artifact}]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_number_artifact}        ${number_artifact}[0]

BFCC-AIRP-BEAT-ARTIFACT-DELETE-02: Can delete multiple artifact event
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
    ...     Update date: 03/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-DELETE-02     auto
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${artifact}     Get All Thumbnail Artifact
    ${current_number_artifact}         Evaluate    [item['Artifact value'] for item in ${artifact}]
    ${artifact_events}      Get Number Artifact Event On Page
    ${current_number_artifact}         Evaluate    ${current_number_artifact}[0] - ${artifact_events}
    ${status_save}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${status_save}[Save]
    Deleted Multiple Artifact Event Airp    is_save=${True}
    ${artifact}     Get All Thumbnail Artifact
    ${number_artifact}         Evaluate    [item['Artifact value'] for item in ${artifact}]
    Run Keyword And Continue On Failure    Should Be Equal    ${current_number_artifact}        ${number_artifact}[0]

BFCC-AIRP-BEAT-ARTIFACT-EDIT-01:Verify user can view all information on the Change Event Duration pop-up using the Change Event Duration button
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-01       AIRP-1.10.0     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${panel_info}       Get Panel Information Event
    Change Event Duration Airp
    ${event_duration}     Check Event Airp Available
    Edit Artifact Event     is_done=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-BEAT-ARTIFACT-EDIT-02:Verify user can view all information on the Change Event Duration pop-up using C hotkey
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-02       AIRP-1.10.0      auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    ${panel_info}       Get Panel Information Event
    Filter Thumbnail Option    by_hotkey=C
    ${event_duration}     Check Event Airp Available
    Edit Artifact Event     is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Cancel]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Jump To End Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG Start Time]
    Run Keyword And Continue On Failure    Should Be True    ${event_duration}[Pick on ECG End Time]

BFCC-AIRP-BEAT-ARTIFACT-EDIT-03: Verify that user can navigate to the Start time of the event on ECG viewer by using Jump to button
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-03     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-04: Verify that user can navigate to the End time of the event on ECG viewer by using Jump to button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-05: Verify that user can select the desired Start time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-06: Verify that user can select the desired End time on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-07: Verify that the user can exit select Start Time mode by pressing the 'Esc' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-07       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-08: Verify that the user can exit select End Time mode by pressing the 'Esc' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-09: Verify that user can close the pop-up and exity the Change event duration function by clicking Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-10: Verify there shall be an error message if the end time is less than the start time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-10       AIRP-1.10.0        auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=200      y_offset_start_time=100      x_offset_end_time=-200      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    ${expected_result}     Check Event Airp Available
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Date]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Edit Artifact Event    is_cancel=${True}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-11: Verify there shall be an error message if there is a 'no data' are in the artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-12: Verify there shall be an error message if less than 2 beats
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     #bug
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-13: Verify there shall be an error message if new artifact has no beat and a duration of less than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     #bug
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-14: Verify there shall be an error message if new artifact event contains only one beat and has duration of less than 10s
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...     #bug
    ...     **Others**
    ...     Update date: 8/20/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-15: Cannot change duration of an artfiact event if the edited event is independent and has a duration that is not related to the curren duration
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
    ...     Auto Create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-15     auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    Navigate Chart Scroller     x_offset=-350     y_offset=10
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-400      y_offset_start_time=100      x_offset_end_time=100      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    ${msg}        Get Message On Aireport
    ${expected_result}     Check Event Airp Available
    Edit Artifact Event    is_cancel=${True}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Updating the duration is not possible. Please utilize the 'Add new event' function for this purpose.

BFCC-AIRP-BEAT-ARTIFACT-EDIT-16: Verify there shall be an error message if add new Artifact event in a current artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-16       AIRP-1.10.0        manual    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    Change Duration Event On Row "2"
#    Navigate To Add New Event
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-350      y_offset_start_time=100      x_offset_end_time=300      y_offset_end_time=10
#    Edit Artifact Event      is_submit=${True}
#    ${expected_result}     Check Event Airp Available
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[Start Time Message Time]         Invalid value
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_result}[End Time Message Time]         Invalid value
#    Edit Artifact Event     is_cancel_add=${True}
#    ${status}        Get Events Selected
#    Run Keyword And Continue On Failure    Should Be Empty    ${status}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-17: Verify there shall be an error message if an Artifact event is an AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-17     AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-18: Verify there shall be an error message if an Artifact event is an VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-19: Verify there shall be an error message if an Artifact event is an VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-20: Verify there shall be an error message if an Artifact event is an VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-21: Verify there shall be an error message if an Artifact event is an VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-22: Verify there shall be an error message if an Artifact event is an VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-23: Verify there shall be an error message if an Artifact event is an SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-24: Verify there shall be an error message if an Artifact event is an SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-25: Verify there shall be an error message if an Artifact event is an SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-25       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-26: Verify there shall be an error message if an Artifact event is an SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-27: Verify there shall be an error message if an Artifact event is an SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-27       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-28: Verify there shall be an error message if an Artifact event is an Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-28       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-29: Verify there shall be an error message if an Artifact event is an Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-29       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-30: Verify there shall be an error message if an Artifact event is an Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-30       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-32: Verify there shall be an error message if an Artifact event is an VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-32       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-33: Verify there shall be an error message if an Artifact event is an SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-33       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-34: Verify there shall be an error message if an Artifact event is an 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-34       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-35: Verify there shall be an error message if an Artifact event is an 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-35       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-36: Can change duration of an artfiact event if the edited event is independent and has a duration that is related to the curren duration
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-36     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-37: Verify that the user can change duration of an Artifact event with only one beat if the duration is at least 10 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-37       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-38: Verify that the user can change duration of an Artifact event with no beat if the duration is at least 10 seconds
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-38       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-39: Check case the edited Artifact event intersects with the current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-39       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-40: Check case the edited Artifact event intersects with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-40       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-41: Check case the edited Artifact event intersects with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-41       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-42: Check case the edited Artifact event intersects with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-43: Check case the edited Artifact event intersects with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-44: Check case the edited Artifact event intersects with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-45: Check case the edited Artifact event intersects with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-45       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-46: Check case the edited Artifact event intersects with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-46       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-49: Check case the edited Artifact event intersects with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-50: Check case the edited Artifact event intersects with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-52: Check case the edited Artifact event intersects with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-53: Check case the edited Artifact event intersects with the current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-54: Check case the edited Artifact event intersects with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-55: Check case the edited Artifact event intersects with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-56: Check case the edited Artifact event intersects with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-57: Check case the edited Artifact event intersects with the current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-58: Check case the edited Artifact event intersects with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-59: Check case the edited Artifact event intersects with the current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-60: Check case the edited Artifact event intersects with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-62: Check case the edited Artifact event overrides with the current Artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-63: Check case the edited Artifact event overrides with the current VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-64: Check case the edited Artifact event overrides with the current VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-65: Check case the edited Artifact event overrides with the current VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-66: Check case the edited Artifact event overrides with the current VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-67: Check case the edited Artifact event overrides with the current VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-68: Check case the edited Artifact event overrides with the current SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-69: Check case the edited Artifact event overrides with the current SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-70: Check case the edited Artifact event overrides with the current SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-71: Check case the edited Artifact event overrides with the current SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-71       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-72: Check case the edited Artifact event overrides with the current SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-72       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-73: Check case the edited Artifact event overrides with the current AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-73       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-74: Check case the edited Artifact event overrides with the current Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-74       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-75: Check case the edited Artifact event overrides with the current Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-75       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-76: Check case the edited Artifact event overrides with the current Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-76       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-77: Check case the edited Artifact event overrides with the current VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-77       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-78: Check case the edited Artifact event overrides with the current SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-78       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-79: Check case the edited Artifact event overrides with the current 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-79       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-80: Check case the edited Artifact event overrides with the current 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-80       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-81: Check case the start time of the edited Artifact event is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-81       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-EDIT-82: Check case the end time of the edited Artifact event is in No data area, it will be moved to the nearest data area
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-EDIT-82       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-RESET-01: Verify the Reset button shall displayed on the Aritfact tab after changing artifact duration by button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-RESET-01       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-RESET-02: Verify the Reset button shall displayed on the Aritfact tab after deleting artifact event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-RESET-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-RESET-03: Can dismiss the changes by clicking the reset changes button
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-RESET-03     manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-02: Verify signal beat marks on the thumbnail display correctly in the first view
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-02       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-03: Verify beat types on the thumbnail match the beat types on the corresponding ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-03       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-04: Verify the number of beats on the thumbnail matches the number of beats on the corresponding ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-04       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-05: Verify that the color of each beat on the thumbnail type displays correctly
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-05       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-06: Verify N beats on thumbnail is deleted when deleting N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-06       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-07: Verify S beats on thumbnail is deleted when deleting S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-07       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-08: Verify V beats on thumbnail is deleted when deleting V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-08       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-09: Verify Q beats on thumbnail is deleted when deleting Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-09       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-10: Verify N beats on thumbnail is updated to S beats when changing N beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-10       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-11: Verify N beats on thumbnail is updated to V beats when changing N beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-11       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-12: Verify N beats on thumbnail is updated to Q beats when changing N beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-12       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-13: Verify S beats on thumbnail is updated to N beats when changing S beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-13       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-14: Verify S beats on thumbnail is updated to V beats when changing S beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-14       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-15: Verify S beats on thumbnail is updated to Q beats when changing S beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-15       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-16: Verify V beats on thumbnail is updated to N beats when changing V beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-16       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-17: Verify V beats on thumbnail is updated to S beats when changing V beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-17       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-18: Verify V beats on thumbnail is updated to Q beats when changing V beats to Q beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-18       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-19: Verify Q beats on thumbnail is updated to N beats when changing Q beats to N beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-19       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-20: Verify Q beats on thumbnail is updated to V beats when changing Q beats to V beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-20       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-21: Verify Q beats on thumbnail is updated to S beats when changing Q beats to S beats on ECG Viewer
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

    [Tags]      BFCC-AIRP-BEAT-ARTIFACT-THUMBNAIL-21       AIRP-1.13.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

# Shouldn't automate TC which have to click offset

#    Navigate Airp Tab     tab=Beats
#    Navigate Airp Artifact
#    View Airp Artifact On    row=1
#    View Each Event Thumbnail On   row=1
#    ${infor_events}        Get Thumbnail Events No Hr
#    ${current_ecg_start_time}           Evaluate    '${infor_events}[0][Start Time]'
#    ${infor_artiface_event}         Get Panel Information Event
#    ${current_artifact_start_time}           Evaluate    '${infor_artiface_event}[Start time]'.split(', ')[1]
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_ecg_start_time}     ${current_artifact_start_time}
#    Change Event Duration Airp
#    Sleep  200s
#    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-300      y_offset_start_time=10      x_offset_end_time=300      y_offset_end_time=100
#    ${expected_datetime}                 Get Start And End Time
#    Edit Artifact Event      is_done=${True}
#    ${infor_events}        Get Thumbnail Events No Hr
#    ${actual_ecg_start_time}           Evaluate    '${infor_events}[0][Start Time]'
#    ${infor_artiface_event}         Get Panel Information Event
#    ${actual_artifact_start_time}           Evaluate    '${infor_artiface_event}[Start time]'.split(', ')[1]
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_ecg_start_time}     ${actual_artifact_start_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_datetime}[Start Time Time]     ${actual_artifact_start_time}
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_datetime}[Start Time Time]     ${actual_ecg_start_time}
#    Filter Header     is_reset_change=${True}
#    ${infor_events}        Get Thumbnail Events No Hr
#    ${expected_ecg_start_time}           Evaluate    '${infor_events}[0][Start Time]'
#    ${infor_artiface_event}         Get Panel Information Event
#    ${expected_artifact_start_time}           Evaluate    '${infor_artiface_event}[Start time]'.split(', ')[1]
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_ecg_start_time}     ${expected_artifact_start_time}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py      ${BROWSER_NODE}     ${ENV}
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

Change event duration artifact areas
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}    next_or_previous=next       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    Filter Header    is_save=${True}

Change duration event on row "${row_number}"
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Each Event Thumbnail On   row=${row_number}
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    Filter Header    is_save=${True}