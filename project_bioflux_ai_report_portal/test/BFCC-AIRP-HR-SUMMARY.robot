*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-HR-SUMMARY
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-HR-SUMMARY   web
Test Timeout    15m

*** Test Cases ***
BFCC-AIRP-HR-SUMMARY-VIEW-01: Check a list of cards
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The information in the card displayed
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Navigate to AI report
    ...     2. Click on "HR summary" link
    ...     3. Navigate to the list cards and Observe the result
    ...
    ...     Expected Results:
    ...     3. - A card will contain the following information: Date (MM/DD), Day [#number], Min, Avg, Max
    ...        - Check format: Date (MM/DD)
    ...
    ...     **Others**
    ...     Update date: 03/28/2024 - Thang Tran
    ...     Auto Update: 04/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-VIEW-01     auto
    Navigate Airp Tab     tab=HR summary
    Sleep  5s
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${date}         Evaluate    [item['Date'] for item in ${thumbnail}]
    Check Format Date    ${date}
    ${actual_header}         Evaluate    [k for k, v in ${thumbnail}[0].items()]
    ${expected_header}      Create List    Date   Day   Min   Avg   Max
    Run Keyword And Continue On Failure     Lists Should Be Equal    ${expected_header}     ${actual_header}

BFCC-AIRP-HR-SUMMARY-VIEW-02: Check the toolbar on the selected date working properly
    [Documentation]     Author: Thang Tran
    ...
    ...     Description: The toolbar is displayed
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Navigate to AI report
    ...     2. Click on "HR summary" link
    ...     3. Selected on the card
    ...     4. Observe the result
    ...
    ...     Expected Results:
    ...     4. Verify the toolbar displayed: SPEED, GAIN, HP, LP, CH1, CH2, CH3, Capture, Beat Marker, Zoom, View All
    ...
    ...     **Others**
    ...     Update date: 03/28/2024 - Thang Tran
    ...     Auto Update: 04/03/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-VIEW-02     auto
    Navigate Airp Tab     HR summary
    Sleep  5s
    View Thumbnail Hr Summary On    row=1
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

BFCC-AIRP-HR-SUMMARY-VIEW-03: verify that the values in the HR summary for each day are displayed correctly in the first view
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check on a list of cards
    ...     2. Check on the selected date
    ...
    ...     Expected Results:
    ...     1. A list of card:
    ...     - Date (MM/DD)
    ...     - Day [#number]
    ...     - Min HR of the day
    ...     - Avg HR
    ...     - Max HR of the day
    ...     2. On the selected date, it displays the following data:
    ...     - Min/Avg/Max HR information
    ...     - By default, the Max HR highlighted area is displayed when the user selects on the date
    ...     - Min HR – the user can click on the ‘View’ button to go to Min HR’s position on the HR chart and view its ECG
    ...      + The ECG viewer will display the Min HR highlighted area
    ...     - Avg HR
    ...     - Max HR - the user can click on the ‘View’ button to go to Max HR’s position on the HR chart and view its ECG
    ...      + The ECG viewer will display the Max HR highlighted area
    ...     - The definition of selecting Min/Max HR by system:
    ...      + Does not include S, V, Q, or pauses > 2.5 seconds
    ...      + If the user selects min/max HR (by using ‘Set a min/max HR’ tool), it takes precedence over all other settings, and the system cannot recalculate
    ...     3. Check all values on a lists of card and the selected date only displayed NA in cases below:
    ...     - All beats for the day are S, V, or Q beats
    ...     - If there is no data record for the day
    ...     - Artifact event during the study duration
    ...     - SVT/VT/SVE Run/VE Run event during the study duration
    ...     - RR> 2.5seconds across all ECGs of the day
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-VIEW-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-01: Verify the Max HR highlighted area is displayed when the user selects on the date by default
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
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-01       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-02: Verify the user can navigate to the Min HR's position on the HR chart and ECG by using View button
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
    ...     1. The ECG viewer will display the Min HR highlighted area
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-03: Verify the user can navigate to the Max HR's position on the HR chart and ECG by using View button
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
    ...     1. The ECG viewer will display the Max HR highlighted area
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-04: Verify the values on the selected date are displayed as NA if user updates all N beats to S beats on R-R heatmap tab
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-05: Verify the values on the selected date are displayed as NA if user updates all N beats to V beats on R-R heatmap tab
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-05       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-06: Verify the values on the selected date are displayed as NA if user updates all N beats to Q beats on R-R heatmap tab
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-06       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-07: Verify the values on the selected date are displayed as NA if user adds an artifact event during the selected date on Beat & HR tab
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-07       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-08: Verify the values on the selected date are displayed as NA if user adds an SVT event during the selected date on ECG event tab
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-09: Verify the values on the selected date are displayed as NA if user adds an VT event during the selected date on ECG event tab
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-10: Verify the value on the selected date are displayed as NA if RR > 2.5 seconds across the ECG
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-11: Verify that the system cannot recalculate values on the selected date if the user has used the 'Set as Min/Max HR' tool
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
    ...     1. MIN/MAX/AVG on the selected date/ a list of card shall display as NA
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-SELECTED-DATE-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-01: Verify the HR chart will display the Min HR's position by default once the user selects the date
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
    ...     1. There is panel that will show the position of the heart rate with the following information on the panel:
    ...     - Time - MM/DD/YYYY, HH:mm:ss
    ...     - Channel
    ...     - Min HR
    ...     - Avg HR
    ...     - Max HR
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-01       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-02: Verify the data shall be displayed corresponding in HR chart once the user clicks the View button on Min HR's
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
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-03: Verify the data shall be displayed corresponding in HR chart once the user clicks the View button on Max HR's
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
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-04: Verify user can zoom in HR chart by drags an area in the chart
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
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-05: Verify user can zoom in HR chart by clicking the (+) button
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
    ...     Update date: 8/14/2024 - Trinh Nguyen
    ...     Auto Create: 08/19/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-05       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=HR summary
    Sleep  5s
    View Thumbnail Hr Summary On    row=1
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

BFCC-AIRP-HR-SUMMARY-HR-CHART-06: Verify user can zoom out HR chart by clicking the (-) button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/14/2024 - Trinh Nguyen
    ...     Auto Create: 08/19/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-06       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-07: Verify the user can reset zoom by using Reset zoom button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/14/2024 - Trinh Nguyen
    ...     Auto Create: 08/19/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-07       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-08: Verify the user can reset zoom HR chart by using Reset zoom button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/14/2024 - Trinh Nguyen
    ...     Auto Create: 08/19/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-08       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-10: Verify the user can select a minutely HR value in the chart to view its ECG data ( 1 minute data)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.  The panel of selected information will include:
    ...     - This section will display the time (MM/DD/YYYY, HH:mm:ss), channel, max/min/avg HR of the minutely HR
    ...
    ...     **Others**
    ...     Update date: 8/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-10       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-11: Verify in HR chart, areas that do not have study data (due to study paused) will be marked in HR chart
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-11       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-12: Verify in HR chart, areas that have events will be highlighted with colors
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-12       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-13: Verify the tool tip shall be displayed when the user hovers over the HR chart
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
    ...     Update date: 8/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-14: Verify the tool tip 'No data' shall be displayed when the user hovers over the HR chart if there is no data in a selected minute
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-14       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-15: Verify the tool tip 'NA' shall be displayed when the user hovers over the HR chart if the HR cannot be calculated
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-15       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-HR-CHART-16: Verify the HR chart is not displayed if there is no data recorded
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-HR-CHART-16       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-01: Verify only the artifact events are displayed on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-02: Verify the ECG Viewer plots ECG data of the selected minutly HR above
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-02       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-03: Can go to next 1 minute
    [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-03       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=1
    ${minute_infor}     Get Minute Info Hr Summary
    ${time_value}       Evaluate    "${minute_infor}[0][Time]".split()[1]
    ${expected_time}    Get Time The Next Minute    current_time=${time_value}
    Pagination Minute    next_or_previous=next
    ${minute_infor}     Get Minute Info Hr Summary
    ${actual_time_next}       Evaluate    "${minute_infor}[0][Time]".split()[1]
    Pagination Minute    next_or_previous=previous
    ${minute_infor}     Get Minute Info Hr Summary
    ${actual_time_previous}       Evaluate    "${minute_infor}[0][Time]".split()[1]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_time}      ${actual_time_next}
    Run Keyword And Continue On Failure    Should Be Equal    ${time_value}     ${actual_time_previous}

BFCC-AIRP-HR-SUMMARY-ECG-04: Can go to previous 1 minute
    [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-04       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-05: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 2.5 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-05       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-04.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-04.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-05.1: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 25 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-05.1       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-06: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-06       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-07: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 75 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-07       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-08: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-08       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-09: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-09       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-10: Verify that the Speed toolbar is functioning correctly in ECG Viewer with the value set to 500 mm/s
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-10       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-11: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 1 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-11       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-12: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 2 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-12       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-13: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 5 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-13       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-14: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 7.5 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-14       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-15: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 10 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-15       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-16: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 20 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-16       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-17: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 50 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-17       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-18: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 100 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-18       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-19: Verify that the Gain toolbar is functioning correctly in ECG Viewer with the value set to 200 mm/mV
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-19       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-20: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to No
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-20       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-21: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.05 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-21       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-22: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 0.5 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-22       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-23: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 1 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-23      AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-24: Verify that the High pass filter is functioning correctly in ECG Viewer with the value set to 2 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-24       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-25: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to No
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-25       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-26: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 15 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-26       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-27: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 30 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-27       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-28: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 40 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-28       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-29: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 50 Hz (Notch)
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-29       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-30: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 60 Hz (Notch)
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-30       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-31: Verify that the Low pass filter is functioning correctly in ECG Viewer with the value set to 100 Hz
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-31       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-32: Verify that the the ECG Viewer displays correctly after hiding only the CH1 channel
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-32       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-33: Verify that the the ECG Viewer displays correctly after hiding only the CH2 channel
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-33       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-34: Verify that the the ECG Viewer displays correctly after hiding only the CH3 channel
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-34       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-35: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH2 channel
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-35       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-36: Verify that the the ECG Viewer displays correctly after hiding the CH1 & CH3 channel
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-36       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-37: Verify that the the ECG Viewer displays correctly after hiding the CH2 & CH3 channel
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-37       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-38: Can mark a strip that does not belong to any event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-38       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-39: Can mark multiple strips that does not belong to any event at the same time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-39       AIRP-1.10.0       manual      R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-40: Cannot mark a strip that does not belong to any event without entering title
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-40       AIRP-1.10.0       auto       R3
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=1
    Mark A Strip Airp    technician_comment=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a title

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-41: Cannot mark a strip that does not belong to any event without entering technician comment
    [Documentation]     Author: Trinh Nguyen
    ...
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-41       AIRP-1.10.0      auto    R1
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=1
    Mark A Strip Airp    title=test capture        is_save=${True}
    ${msg}      Get Message Input Airp
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Please enter a comment

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-42: Verify the system shall automatically recapture the strip in case updating S/V/Q beat to previous strip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-43: Verify that the user can capture multiple strips within a minute while in unsaved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-44: Verify that the user can capture multiple strips within a minute while in saved status
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-45: Verify if the user captures the same Start time, Stop time and Type, the system will take a new strip and overwrite the old strip
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-45       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-46: Verify that the user can simultaneously update the beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-46       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-47: Verify that the user can simultaneously add the new beat (N/S/V/Q) and capture
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-47       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-48: Verify that the user cannot capture data in areas where no data is available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-CAPTURE-48       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AIRP-HR-SUMMARY-ECG-49: Verify that the user can add an N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-49       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-50: Verify that the user can add an N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-50       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-51: Verify that the user can add an N beat in the ECG Viewer using add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-51       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-52: Verify that the user can change V/S/Q beats to N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-52       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-53: Verify that the user can change V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-53       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-54: Verify that the user can change V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-54       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-55: Verify that the user can delete an N beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-55       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-56: Verify that the user can delete an N beat in the ECG Viewer using the 'D' ketboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-56       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-57: Verify that the user can delete an N beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-57       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-58: Verify that the user can delete an N beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-58       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-59: Verify that the user can add an S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-59       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-60: Verify that the user can add an S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-60       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-61: Verify that the user can add an S beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-61       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-62: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-62       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-63: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-63       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-64: Verify that the user can change N/V/Q beat to S beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-64       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AIRP-HR-SUMMARY-ECG-65: Verify that the user can delete an S beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-65       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-66: Verify that the user can delete an S beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-66       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-67: Verify that the user can delete an S beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-67       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-68: Verify that the user can delete an S beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-68       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-69: Verify that the user can add an V beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-69       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-70: Verify that the user can add an V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-70       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-71: Verify that the user can add an V beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-71       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-72: Verify that the user can change N/S/Q beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-72       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-73: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-73       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-74: Verify that the user can change N/S/Q beat to V beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-74       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-75: Verify that the user can delete an V beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-75       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-76: Verify that the user can delete an V beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-76       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-77: Verify that the user can delete an V beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-77       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-78: Verify that the user can delete an V beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-78       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-79: Verify that the user can add an Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-79       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-80: Verify that the user can add an Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-80       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-81: Verify that the user can add an Q beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-81       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-82: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-82       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-83: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-83       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-84: Verify that the user can change N/S/V beat to Q beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-84       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-85: Verify that the user can delete an Q beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-85       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-86: Verify that the user can delete an Q beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-86       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-87: Verify that the user can delete an Q beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-87       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-88: Verify that the user can delete an Q beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-88       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-89: Verify that the Zoom in toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-89       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-90: Verify that the Zoom out toolbar is functioning correctly in ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-90       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-91: Verify that the user can exit "View All Strips" mode by clicking the "Exit view all strip mode" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-91       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-92: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-92       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-93: Verify that the Horizontal Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-93       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-94: Verify that the Vertical Caliper option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-94       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-95: Verify that the Beat Calipers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-95       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-96: Verify that the Text Annotation option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-96       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-97: Verify that the Mark a Pattern option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-97       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-99: Verify that the Hide Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-99       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-ECG-100: Verify that the Show Beat Markers option from context menu is working correctly on ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-ECG-100       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-01: Verify the user will not able to edit Min HR if the data is not available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-01       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-02: Verify the user will not able to edit Max HR if the data is not available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-02       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-03: Verify the user will not able to edit Avg HR if the data is not available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-03       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-04: Verify the Set as Max/Min HR is removed if the data is not available
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-04       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
# This test case is no longer available.
#BFCC-AIRP-HR-SUMMARY-EDIT-05: Verify the modal shall display the date and time of the currently selected Min HR by using Edit button
#    [Documentation]     Author: Trinh Nguyen
#    ...
#    ...     Description:
#    ...
#    ...     Precondition:
#    ...
#    ...     Test Steps:
#    ...
#    ...     Expected Results:
#    ...     1.
#    ...
#    ...     **Others**
#    ...     Update date: 08/14/2024 - Trinh Nguyen
#    ...     Auto create: 08/20/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-05       AIRP-1.10.0     auto      R1
#    Navigate Airp Tab     tab=HR summary
#    View Thumbnail Hr Summary On    row=1
#    Edit Hr On Hr Summary       min_hr=55
#    ${date_time}        Get Datetime Min Max Hr
#    ${minute_infor}     Get Minute Info Hr Summary
#    ${expected_date_time}    Format Datetime To Datetime    ${minute_infor}[0][Time]
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_time}       ${expected_date_time}
#    Pagination Min Max Hr    next_or_previous=next
#    ${date_time_next}        Get Datetime Min Max Hr
#    ${minute_infor_next}     Get Minute Info Hr Summary
#    ${expected_date_time_next}    Format Datetime To Datetime    ${minute_infor_next}[0][Time]
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_time_next}       ${expected_date_time_next}
#    Pagination Min Max Hr    next_or_previous=previous
#    ${date_time_previous}        Get Datetime Min Max Hr
#    ${minute_infor_previous}     Get Minute Info Hr Summary
#    ${expected_date_time_previous}    Format Datetime To Datetime    ${minute_infor_previous}[0][Time]
#    Run Keyword And Continue On Failure    Should Be Equal    ${date_time_previous}       ${expected_date_time_previous}

BFCC-AIRP-HR-SUMMARY-EDIT-06: Verify the user can navigate to the next Min HR of the day by using Right arrow button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-06       AIRP-1.10.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-07: Verify the user can navigate to the previous Min HR of the day by using Left arrow button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-07       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-08: Verify the list of Min HR will show 10 lowest HR values of the day and prioritize the earliest time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-08       AIRP-1.10.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
# This test case is no longer available, need Manual update tcs
#    Navigate Airp Tab     tab=HR summary
#    View Thumbnail Hr Summary On    row=1
#    Edit Hr On Hr Summary       min_hr=55
#    ${status}     Check Pagination Min Max Hr      pagination_next=${True}
#    Run Keyword And Continue On Failure    Should Be True    ${status}

BFCC-AIRP-HR-SUMMARY-EDIT-09: Verify the user can change the Min HR value on the selected day by entering valid value on the Edit Min HR modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...     Valid value from 25bpm to 300bpm
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The user can change the value.
    ...     2. The Min HR in card of selected day is updated to the changed value
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang tran
    ...     Auto updated: 04/23/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-09       AIRP-1.10.0      auto      R1
    Navigate Airp Tab    tab=HR Summary
    View Thumbnail Hr Summary On    row=1
    Edit Hr On Hr Summary    min_hr=52    is_save=${True}
    Filter Header        is_save=${True}
    ${hr_info}    Get All Thumbnail Hr Summary
    ${min}        Set Variable    ${hr_info[0]['Min']}
    Run Keyword And Continue On Failure    Should Be Equal    ${min}    ${52}

BFCC-AIRP-HR-SUMMARY-EDIT-10: Verify the user cannot change the Min HR value on the selected day by entering Invalid value on the Edit Min HR modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...     Valid value from 25bpm to 300bpm
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Valid value from 1 to 250
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang tran
    ...     Auto updated: 04/23/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-10       AIRP-1.10.0    auto      R1
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=1
    Check Value Min Hr With Value Is "0"
    Check Value Min Hr With Value Is "301"

BFCC-AIRP-HR-SUMMARY-EDIT-11: Verify that user can change the Min HR value for the selected day by selecting the system-suggested value in the Edit Min HR modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The user can change the value.
    ...     2. The changed value should not affect the min HR of the selected minute
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-12: Verify that the user can cancel the Min HR editing process on the selected day by using the "Cancel" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-13: Verify the user can change the Min HR value on the Minute info by using Set as Max/Min HR button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. It shall display the Max or Min HR of the selected minute, depending on the selected “Set as” value above
    ...     2. The user can change the value
    ...     3. The changed value should not affect the minute’s max or min HR
    ...     4. Shall set the currently selected minute as Min HR for the day depending on the “Set as” data with the set Value data
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-13       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=3
    Verify The User Can Change The Min HR Value On The Minute Info

BFCC-AIRP-HR-SUMMARY-EDIT-14: Verify that the user can cancel the Min HR editing process on the Minute info by using the "Cancel" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-15: Verify that the Min HR value/area is updated after changing N beats to S in the Min HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-16: Verify that the Min HR value/area is updated after changing N beats to V in the Min HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-17: Verify that the Min HR value/area is updated after changing N beats to Q in the Min HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-18: Verify that the Min HR value/area is updated after updating RR > 2.5 seconds on Min HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-19: Verify that the Min HR value/area is updated if user updates all Q beats to N beat on Q-Q beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-20: Verify that the Min HR value/area is updated if user updates all Q beats to N beat on Q-N/S/V beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-21: Verify that the Min HR value/area is updated if user updates all V beats to N beat on V beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-22: Verify that the Min HR value/area is updated if user updates all S beats to N beat on S beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-23: Verify that the Min HR value/area is updated after adding artifact event overriding Min HR area on ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
# This test case is no longer available.
#BFCC-AIRP-HR-SUMMARY-EDIT-24: Verify the modal shall display the date and time of the currently selected Max HR by using Edit button
#    [Documentation]     Author: Trinh Nguyen
#    ...
#    ...     Description:
#    ...
#    ...     Precondition:
#    ...
#    ...     Test Steps:
#    ...
#    ...     Expected Results:
#    ...     1.
#    ...
#    ...     **Others**
#    ...     Update date: 08/14/2024 - Trinh Nguyen
#    ...     Auto create: 08/20/2024 - Thang Tran
#    ...
#    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-24       AIRP-1.10.0     auto      R1
##    Navigate Airp Tab     tab=HR summary
##    View Thumbnail Hr Summary On    row=1
##    Edit Hr On Hr Summary       max_hr=55
##    ${date_time}        Get Datetime Min Max Hr
##    ${minute_infor}     Get Minute Info Hr Summary
##    ${expected_date_time}    Format Datetime To Datetime    ${minute_infor}[0][Time]
##    Run Keyword And Continue On Failure    Should Be Equal    ${date_time}       ${expected_date_time}
##    Pagination Min Max Hr    next_or_previous=next
##    ${date_time_next}        Get Datetime Min Max Hr
##    ${minute_infor_next}     Get Minute Info Hr Summary
##    ${expected_date_time_next}    Format Datetime To Datetime    ${minute_infor_next}[0][Time]
##    Run Keyword And Continue On Failure    Should Be Equal    ${date_time_next}       ${expected_date_time_next}
##    Pagination Min Max Hr    next_or_previous=previous
##    ${date_time_previous}        Get Datetime Min Max Hr
##    ${minute_infor_previous}     Get Minute Info Hr Summary
##    ${expected_date_time_previous}    Format Datetime To Datetime    ${minute_infor_previous}[0][Time]
##    Run Keyword And Continue On Failure    Should Be Equal    ${date_time_previous}       ${expected_date_time_previous}

BFCC-AIRP-HR-SUMMARY-EDIT-25: Verify the user can navigate to the next Max HR of the day by using Right arrow button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-25       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-26: Verify the user can navigate to the previous Max HR of the day by using Left arrow button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-28: Verify the list of Max HR will show 10 lowest Max values of the day and prioritize the earliest time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-28       AIRP-1.10.0      auto      R1
# This test case is no longer available, need Manual update tcs
#    Navigate Airp Tab     tab=HR summary
#    View Thumbnail Hr Summary On    row=1
#    Edit Hr On Hr Summary       max_hr=55
#    ${status}     Check Pagination Min Max Hr      pagination_next=${True}
#    Run Keyword And Continue On Failure    Should Be True    ${status}

BFCC-AIRP-HR-SUMMARY-EDIT-29: Verify the user can change the Max HR value on the selected day by entering valid value on the Edit Max HR modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...     Valid value from 25bpm to 300bpm
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The user can change the value.
    ...     2. The changed value should not affect the min HR of the selected minute
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang Tran
    ...     Auto create: 03/21/2025 - Hang Le
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-29       AIRP-1.10.0             auto      R1
    Navigate Airp Tab    tab=HR Summary
    View Thumbnail Hr Summary On    row=1
    Edit Hr On Hr Summary    max_hr=100    is_save=${True}
    Filter Header        is_save=${True}
    ${hr_info}    Get All Thumbnail Hr Summary
    ${max}        Set Variable    ${hr_info[0]['Max']}
    Run Keyword And Continue On Failure    Should Be Equal    ${max}    ${100}

BFCC-AIRP-HR-SUMMARY-EDIT-30: Verify the user cannot change the Max HR value on the selected day by entering Invalid value on the Edit Max HR modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Valid value from 1 to 250
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang Tran
    ...     Auto updated: 04/23/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-30       AIRP-1.10.0          auto      R1
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=1
    Check Value Max Hr With Value Is "0"
    Check Value Max Hr With Value Is "301"

BFCC-AIRP-HR-SUMMARY-EDIT-31: Verify that user can change the Max HR value for the selected day by selecting the system-suggested value in the Edit Max HR modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The user can change the value.
    ...     2. The changed value should not affect the min HR of the selected minute
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-31       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-32: Verify that the user can cancel the Max HR editing process on the selected day by using the "Cancel" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-32       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-33: Verify the user can change the Max HR value on the Minute info by using Set as Max/Min HR button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. It shall display the Max or Min HR of the selected minute, depending on the selected “Set as” value above
    ...     2. The user can change the value
    ...     3. The changed value should not affect the minute’s max or min HR
    ...     4. Shall set the currently selected minute as Min HR for the day depending on the “Set as” data with the set Value data
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-33       AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=2
    Verify The User Can Change The Max HR Value On The Minute Info

BFCC-AIRP-HR-SUMMARY-EDIT-34: Verify that the user can cancel the Max HR editing process on the Minute info by using the "Cancel" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-34       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-35: Verify that the Max HR value/area is updated after changing N beats to S in the Max HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-35       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-36: Verify that the Max HR value/area is updated after changing N beats to V in the Max HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-36       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-37: Verify that the Max HR value/area is updated after changing N beats to Q in the Max HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-37       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-38: Verify that the Max HR value/area is updated after updating RR > 2.5 seconds on Max HR area on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-38       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-39: Verify that the Max HR value/area is updated if user updates all Q beats to N beat on Q-Q beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-39       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-40: Verify that the Max HR value/area is updated if user updates all Q beats to N beat on Q-N/S/V beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-40       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-41: Verify that the Max HR value/area is updated if user updates all V beats to N beat on V beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-41       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-42: Verify that the Max HR value/area is updated if user updates all S beats to N beat on S beats tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-43: Verify that the Max HR value/area is updated after adding artifact event overriding Max HR area on ECG Viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-44: Verify the user can change the Avg HR value on the selected day by using Edit button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Displays the avg bpm of the day
    ...
    ...     **Others**
    ...     Update date: 08/14/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-HR-SUMMARY-EDIT-45: Verify the user cannot change the Avg HR value on the selected day by entering Invalid value on the Average HR modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Valid value from 1 to 250
    ...
    ...     **Others**
    ...     Update date: 08/16/2024 - Trinh Nguyen
    ...     Auto create: 08/20/2024 - Thang Tran
    ...     Auto updated: 04/23/2025 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-45       AIRP-1.10.0        auto      R1
    Navigate Airp Tab     tab=HR summary
    View Thumbnail Hr Summary On    row=1
    Check Value Avg Hr With Value Is "0"
    Check Value Avg Hr With Value Is "301"

BFCC-AIRP-HR-SUMMARY-EDIT-46: Verify that the user can cancel the Avg HR editing process on the selected day by using the "Cancel" button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
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
    ...     Auto create: 08/20/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-HR-SUMMARY-EDIT-46       AIRP-1.10.0      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
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

Check value min hr with value is "${value_min_hr}"
    Edit Hr On Hr Summary       min_hr=${value_min_hr}       is_save=${True}
    ${message}     Check Error Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}[MinHR]        Invalid value
    Edit Hr On Hr Summary       is_cancel=${True}

Check value max hr with value is "${value_max_hr}"
    Edit Hr On Hr Summary       max_hr=${value_max_hr}       is_save=${True}
    ${message}     Check Error Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}[MaxHR]        Invalid value
    Edit Hr On Hr Summary       is_cancel=${True}

Check value avg hr with value is "${value_avg_hr}"
    Edit Hr On Hr Summary       avg_hr=${value_avg_hr}       is_save=${True}
    ${message}     Check Error Message
    Run Keyword And Continue On Failure    Should Be Equal    ${message}[AvgHR]        Invalid value
    Edit Hr On Hr Summary       is_cancel=${True}

Verify the user can change the Min HR value on the Minute info
    ${minute_info}      Get Minute Info Hr Summary
    ${minute_min_hr}           Evaluate        "${minute_info}[0][Min HR]".split()[0]
    Set As Min Max Hr
    ${suggest_value_min}    Get Value On Set Value
    Edit Value Min Max Hr    min_hr=40
    ${value_min}    Get Value On Set Value
    ${expected_value_min}    Evaluate    int(${value_min})
    Edit Value Min Max Hr    is_set=${True}
    ${hr_summary}       Get All Thumbnail Hr Summary
    ${hr_summary_2}     Get Hr Summary Infor
    ${min_hr_2}           Evaluate        int("${hr_summary_2}[Min HR]".split()[0])
    Filter Header    is_save=${True}
    ${minute_info}      Get Minute Info Hr Summary
    ${actual_minute_min_hr}           Evaluate        "${minute_info}[0][Min HR]".split()[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${hr_summary}[1][Min]      ${expected_value_min}
    Run Keyword And Continue On Failure    Should Be Equal    ${min_hr_2}                ${expected_value_min}
    Run Keyword And Continue On Failure    Should Be Equal    ${minute_min_hr}                ${actual_minute_min_hr}

Verify the user can change the Max HR value on the Minute info
    ${minute_info}      Get Minute Info Hr Summary
    ${minute_max_hr}           Evaluate        "${minute_info}[0][Max HR]".split()[0]
    Set As Min Max Hr
    ${suggest_value_max}    Get Value On Set Value
    Edit Value Min Max Hr    max_hr=250
    ${value_max}    Get Value On Set Value
    ${expected_value_max}    Evaluate    int(${value_max})
    Edit Value Min Max Hr    is_set=${True}
    ${hr_summary}       Get All Thumbnail Hr Summary
    ${hr_summary_2}     Get Hr Summary Infor
    ${max_hr_2}           Evaluate        int("${hr_summary_2}[Max HR]".split()[0])
    Filter Header    is_save=${True}
    ${minute_info}      Get Minute Info Hr Summary
    ${actual_minute_max_hr}           Evaluate        "${minute_info}[0][Max HR]".split()[0]
    Run Keyword And Continue On Failure    Should Be Equal    ${hr_summary}[1][Max]      ${expected_value_max}
    Run Keyword And Continue On Failure    Should Be Equal    ${max_hr_2}                ${expected_value_max}
    Run Keyword And Continue On Failure    Should Be Equal    ${minute_max_hr}                ${actual_minute_max_hr}
