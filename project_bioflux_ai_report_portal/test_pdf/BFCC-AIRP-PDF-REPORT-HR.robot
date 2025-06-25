*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-HR
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py     ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py
Library     project_bioflux_ai_report_portal/lib/web/PdfReport.py
Library       project_bioflux_clinic_portal/lib/web/Studies.py
Library       project_bioflux_clinic_portal/lib/web/StudyDetails.py
Library       project_bioflux_clinic_portal/lib/web/Common.py
Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py
Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py
Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-PDF-REPORT-HR  web
Test Timeout    30m

*** Test Cases ***

BFCC-AIRP-PDF-REPORT-HR-01: Verify that Heart Rate section in EOU Report displays data by study duration, starting at actual study start time
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: 
    ...    - This test case verifies that in the EOU (End Of Use) report, the Heart Rate section displays a number of rows (Day 1, Day 2, ...) that matches the number of days in the study.
    ...    - The X-axis of the histogram must start at the exact Study Start Time (e.g. 06:42) and extend 24 hours per day.
    ...
    ...     Precondition:
    ...    - A completed (stopped) study with a known start time (e.g. 04/03/2025, 06:42:49 EDT)
    ...     Test Steps:
    ...    1. Open the generated PDF report of the study (EOU report).
    ...    2. Navigate to the Heart Rate section.
    ...    3. Count the number of “Day” rows displayed (Day 1, Day 2, etc.).
    ...    4. Check the X-axis label of each histogram.
    ...    5. Confirm that the first label starts at the actual Study Start Time (e.g. 06:42).
    ...    6. Confirm that each “Day” covers exactly 24 hours from that starting point.
    ...     
    ...    Expected Results:
    ...    1.The number of “Day” rows matches the number of days the study ran.
    ...    2. The X-axis starts from the Study Start Time (not 00:00).
    ...    3. Each row covers exactly 24 hours (e.g., Day 1: 06:42–06:42 next day).
    ...    4. The visualization correctly distinguishes day vs. night shift using background shading.
    ...     **Others**
    ...     Update date: 10/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-HR-01       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-HR-02: Verify that deleting a beat for a specific minute removes the corresponding column in the Heart Rate histogram
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when a beat is deleted from a specific minute in the study, that minute no longer appears as a blue column in the Heart Rate section of the PDF report
    ...    - The column for that exact minute is removed from the chart after regenerating the report.
    ...
    ...     Precondition:
    ...    - A stopped study that includes beats on a known minute (e.g., 06:45)
    ...    - PDF report already generated with Heart Rate chart displaying that minute.
    ...     Test Steps:
    ...    1. Navigate to the Beat tab, ECG viewer, or V morphologies tab.
    ...    2. Locate a beat at a specific time (e.g., 06:45).
    ...    3. Use the UI tool to delete the beat at that minute.
    ...    4. Click Save.
    ...    5. Go to Report Editing Page, click Regenerate Report.
    ...    6. Open the regenerated PDF report, go to Heart Rate section.
    ...    7. Locate the minute (e.g., 06:45) on the X-axis and check the column.
    ...
    ...    Expected Results:
    ...    1. The minute where the beat was deleted no longer shows a column in the chart.
    ...    2. No rendering errors or extra spacing appear.
    ...    3. All other columns remain unchanged.
    ...     **Others**
    ...     Update date: 10/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-HR-02       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-HR-03: Verify that reclassifying a beat from N to V/S/Q removes its minute from Heart Rate histogram
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case checks that changing a beat from N to another classification (V, S, or Q) removes that beat from the normal HR calculation.
    ...    - The corresponding minute column will disappear from the Heart Rate chart in the regenerated report
    ...
    ...     Precondition:
    ...    - A beat originally classified as N exists at a specific minute (e.g., 09:12)
    ...    - The column for that minute is currently visible in the PDF Heart Rate chart
    ...     Test Steps:
    ...    1. Navigate to Beat, ECG Viewer, or V morphologies tab.
    ...    2. Select a beat at a specific minute (e.g., 09:12).
    ...    3. Reclassify it from N to V, S, or Q.
    ...    4. Click Save.
    ...    5. Go to Report Editing Page, click Regenerate Report.
    ...    6. Open the PDF report and scroll to the Heart Rate section.
    ...    7. Locate the minute (e.g., 09:12) and check if the column is present.
    ...
    ...    Expected Results:
    ...    1. The minute where the beat was reclassified is no longer shown in the chart.
    ...    2. No unexpected data is visualized.
    ...    3. Adjacent columns are unaffected.
    ...     **Others**
    ...     Update date: 10/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-HR-03       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-HR-04: Verify that deleting all beats in a specific minute removes the corresponding column in the Heart Rate histogram
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when all beats in a specific minute are deleted (e.g., 06:45), that minute will no longer appear in the Heart Rate chart of the regenerated PDF report.
    ...    - Heart Rate histogram must reflect the loss of data for that time point
    ...
    ...     Precondition:
    ...    -A stopped study with multiple beats existing in a known minute (e.g., 06:45).
    ...    - PDF report originally includes that minute in the Heart Rate chart.
    ...     Test Steps:
    ...    1. Navigate to the Beat tab, ECG Viewer, or V Morphologies tab.
    ...    2. Filter or locate all beats recorded in a specific minute (e.g., 06:45).
    ...    3. Delete all beats in that minute using the deletion tool.
    ...    4. Click Save.
    ...    5. Navigate to the Report Editing page and click Regenerate Report.
    ...    6. Open the regenerated PDF report, and scroll to the Heart Rate section.
    ...    7. Locate the minute (e.g., 06:45) on the X-axis and observe the histogram.
    ...
    ...    Expected Results:
    ...    1. The column for that minute is no longer displayed in the chart.
    ...    2. No rendering glitches or visual gaps outside the removed minute.
    ...    3. Other columns before and after are unaffected.
    ...     **Others**
    ...     Update date: 10/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-HR-04       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-HR-05: Verify that adding N beats densely within a specific minute increases HR and raises the column height in the Heart Rate histogram
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that when multiple N beats are added close together within a specific minute, the calculated bpm increases and the column representing that minute in the Heart Rate chart becomes taller in the regenerated PDF report.
    ...    - The bpm must stay ≤ 250 bpm to remain valid.
    ...
    ...     Precondition:
    ...    - A stopped study where a chosen minute has room for adding more beats.
    ...    - Minute is already visible in the Heart Rate chart.
    ...     Test Steps:
    ...    1. Open the ECG Viewer and navigate to a specific minute (e.g., 07:30).
    ...    2. Insert several N beats very close together within that minute to simulate a high heart rate (e.g., 120–240 bpm).
    ...    3. Avoid exceeding the HR cap of 250 bpm.
    ...    4. Click Save.
    ...    5. Navigate to the Report Editing Page, click Regenerate Report.
    ...    6. Open the regenerated PDF report and scroll to the Heart Rate section.
    ...    7. Locate the modified minute (e.g., 07:30) on the chart.
    ...
    ...    Expected Results:
    ...    1. The column at that minute is taller than before, reflecting a higher bpm.
    ...    2. Column remains within chart bounds (≤ 250 bpm).
    ...    3. Adjacent columns remain unaffected.
    ...     **Others**
    ...     Update date: 10/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-HR-05       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-HR-06: Verify that removing N beats sparsely from a specific minute reduces HR and lowers the column height in the Heart Rate histogram
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that when some N beats are removed from a dense minute, causing greater distance between beats, the bpm will decrease and the column representing that minute becomes shorter in the Heart Rate chart.
    ...    - The resulting HR must stay ≥ 25 bpm to remain visible
    ...
    ...     Precondition:
    ...    - A minute in ECG Viewer with multiple N beats, originally generating a visible HR column.
    ...    - Study already stopped.
    ...     Test Steps:
    ...    1. Open the ECG Viewer and go to the specific minute (e.g., 09:15).
    ...    2. Delete several N beats in that minute, ensuring the remaining beats are spaced out.
    ...    3. Avoid removing too many — HR must stay ≥ 25 bpm.
    ...    4. Click Save.
    ...    5. Go to the Report Editing Page, click Regenerate Report.
    ...    6. Open the regenerated PDF report, go to the Heart Rate section.
    ...    7. Observe the modified minute (e.g., 09:15).
    ...
    ...    Expected Results:
    ...    1.The column height for that minute decreases, reflecting the lower HR.
    ...    2. Column remains visible (HR ≥ 25 bpm).
    ...    3. No graphical artifacts or errors appear.
    ...     **Others**
    ...     Update date: 10/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-HR-06       AIRP-1.14.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/VMorphologies.py            ${BROWSER_NODE}     ${ENV}
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

Change beats to "${beat_name}" beats by hotkey "${keyword}"
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${results}     Change Strip To Beats On Page     beat_change_by_hotkey=${keyword}
    Run Keyword And Continue On Failure    List Should Contain Value    ${results}        ${keyword}
    Run Keyword And Continue On Failure    List Should Contain Value    ${results}        ${beat_name}
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

Change beats to "${beat_name}" beats by button
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${results}     Change Strip To Beats On Page     beat_change=beat${beat_name}
    Run Keyword And Continue On Failure    List Should Contain Value    ${results}        ${beat_name}
    Filter Header    is_save=${True}
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

Delete a beats by button
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Strip Beat Hr Heatmap
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    Deleted Strip Beat Hr Heatmap          is_save=${True}
    ${expected_number_beats}   Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

Delete a beats by hotkey
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} - 1
    ${beats}              Get Strips Beats On Page
    ${actual_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Deleted Strip Beat Hr Heatmap    by_hotkey=D
    ${expected_status}      Check Toolbar Ecg Viewer Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_status}[Reset Changes]
    Filter Header    is_reset_change=${True}
    ${beats}              Get Strips Beats On Page
    ${expected_beats_name}       Evaluate    [item['Beat Name'] for item in ${beats}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_beats_name}     ${expected_beats_name}
    Deleted Strip Beat Hr Heatmap          is_save=${True}
    ${expected_number_beats}   Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}

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

Verify the number of beats in descending order
    ${number_of_beats}    Get All Numbers Beats
    ${list_of_beats}    Create List    ${number_of_beats}
    ${result}    Evaluate    ${list_of_beats} == sorted(${list_of_beats}, reverse=True)
    Run Keyword And Continue On Failure    Should Be True    ${result}

Check beats change by action "${action_name}" for beat by "All beats actions" feature
    ${number_list}    Get Number The V Morphologies List
    ${actual_number_list}    Evaluate    ${number_list} -1
    Filter Action Change All Beats Actions        beat_change=${action_name}
    Filter Header    is_save=${True}
    ${expected_number_list}    Get Number The V Morphologies List
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_list}     ${expected_number_list}