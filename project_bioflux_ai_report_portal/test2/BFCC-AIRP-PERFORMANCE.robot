*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PERFORMANCE
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
Force Tags      BFCC-AIRP-PERFORMANCE  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-PERFORMANCE-Q-Q-01: Verify that saving after changing 10 pages of Q-Q beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-Q beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition: 
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-02: Verify that saving after changing 10 pages of Q-Q beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-Q beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-02       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-03: Verify that saving after changing 20 pages of Q-Q beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-Q beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-03       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-04: Verify that saving after changing 20 pages of Q-Q beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-Q beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-04       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-05: Verify that saving after changing 30 pages of Q-Q beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-Q beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-05       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-06: Verify that saving after changing 30 pages of Q-Q beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-Q beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-06       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-07: Verify that saving after changing 10 pages of Q-Q beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-Q beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-07       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-08: Verify that saving after changing 10 pages of Q-Q beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-Q beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-08       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-09: Verify that saving after changing 20 pages of Q-Q beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-Q beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-09       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-10: Verify that saving after changing 20 pages of Q-Q beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-Q beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-10       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-11: Verify that saving after changing 30 pages of Q-Q beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-Q beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-11       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-12: Verify that saving after changing 30 pages of Q-Q beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-Q beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-12       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-13: Verify that saving after changing 10 pages of Q-Q beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-Q beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-13       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-14: Verify that saving after changing 10 pages of Q-Q beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-Q beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-14       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-15: Verify that saving after changing 20 pages of Q-Q beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-Q beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-15       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-16: Verify that saving after changing 20 pages of Q-Q beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-Q beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-16       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-17: Verify that saving after changing 30 pages of Q-Q beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-Q beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-17       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-18: Verify that saving after changing 30 pages of Q-Q beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-Q beats to V beats using the hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-Q beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-18       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-19: Verify saving after deleting 10 pages of Q-Q beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of Q-Q beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of Q-Q beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-19       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-20: Verify saving after deleting 10 pages of Q-Q beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of Q-Q beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of Q-Q beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-20       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-21: Verify saving after deleting 20 pages of Q-Q beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of Q-Q beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of Q-Q beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-21       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-22: Verify saving after deleting 20 pages of Q-Q beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of Q-Q beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of Q-Q beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-22       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-23: Verify saving after deleting 30 pages of Q-Q beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of Q-Q beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of Q-Q beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-23       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-Q-24: Verify saving after deleting 30 pages of Q-Q beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of Q-Q beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of Q-Q beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-Q beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-Q-24       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-01: Verify that saving after changing 10 pages of Q-N/S/V beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-N/S/V beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-02: Verify that saving after changing 10 pages of Q-N/S/V beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-N/S/V beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-02       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-03: Verify that saving after changing 20 pages of Q-N/S/V beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-N/S/V beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-03       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-04: Verify that saving after changing 20 pages of Q-N/S/V beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-N/S/V beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-04       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-05: Verify that saving after changing 30 pages of Q-N/S/V beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-N/S/V beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-05       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-06: Verify that saving after changing 30 pages of Q-N/S/V beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-N/S/V beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-06       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-07: Verify that saving after changing 10 pages of Q-N/S/V beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-N/S/V beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-07       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-08: Verify that saving after changing 10 pages of Q-N/S/V beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-N/S/V beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-08       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-09: Verify that saving after changing 20 pages of Q-N/S/V beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-N/S/V beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-09       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-10: Verify that saving after changing 20 pages of Q-N/S/V beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-N/S/V beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-10       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-11: Verify that saving after changing 30 pages of Q-N/S/V beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-N/S/V beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-11       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-12: Verify that saving after changing 30 pages of Q-N/S/V beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-N/S/V beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-12       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-13: Verify that saving after changing 10 pages of Q-N/S/V beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-N/S/V beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-13       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-14: Verify that saving after changing 10 pages of Q-N/S/V beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of Q-N/S/V beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-14       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-15: Verify that saving after changing 20 pages of Q-N/S/V beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-N/S/V beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-15       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-16: Verify that saving after changing 20 pages of Q-N/S/V beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of Q-N/S/V beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-16       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-17: Verify that saving after changing 30 pages of Q-N/S/V beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-N/S/V beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-17       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-18: Verify that saving after changing 30 pages of Q-N/S/V beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of Q-N/S/V beats to V beats using the hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient Q-N/S/V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-18       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-19: Verify saving after deleting 10 pages of Q-N/S/V beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of Q-N/S/V beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of Q-N/S/V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-19       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-20: Verify saving after deleting 10 pages of Q-N/S/V beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of Q-N/S/V beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of Q-N/S/V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-20       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-21: Verify saving after deleting 20 pages of Q-N/S/V beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of Q-N/S/V beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of Q-N/S/V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-21       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-22: Verify saving after deleting 20 pages of Q-N/S/V beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of Q-N/S/V beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of Q-N/S/V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-22       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-23: Verify saving after deleting 30 pages of Q-N/S/V beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of Q-N/S/V beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of Q-N/S/V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-23       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-Q-N/S/V-24: Verify saving after deleting 30 pages of Q-N/S/V beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of Q-N/S/V beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of Q-N/S/V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the Q-N/S/V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-Q-N/S/V-24       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-01: Verify that saving after changing 10 pages of N beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of N beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-02: Verify that saving after changing 10 pages of N beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of N beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-02       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-03: Verify that saving after changing 20 pages of N beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of N beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-03       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-04: Verify that saving after changing 20 pages of N beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of N beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-04       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-05: Verify that saving after changing 30 pages of N beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of N beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-05       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-06: Verify that saving after changing 30 pages of N beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of N beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-06       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-07: Verify that saving after changing 10 pages of N beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of N beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-07       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-08: Verify that saving after changing 10 pages of N beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of N beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-08       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-09: Verify that saving after changing 20 pages of N beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of N beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-09       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-10: Verify that saving after changing 20 pages of N beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of N beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-10       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-11: Verify that saving after changing 30 pages of N beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of N beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-11       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-12: Verify that saving after changing 30 pages of N beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of N beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-12       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-13: Verify that saving after changing 10 pages of N beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of N beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-13       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-14: Verify that saving after changing 10 pages of N beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of N beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-14       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-15: Verify that saving after changing 20 pages of N beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of N beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-15       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-16: Verify that saving after changing 20 pages of N beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of N beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-16       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-17: Verify that saving after changing 30 pages of N beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of N beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-17       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-18: Verify that saving after changing 30 pages of N beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of N beats to V beats using the hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient N beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-18       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-19: Verify saving after deleting 10 pages of N beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of N beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of N beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-19       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-20: Verify saving after deleting 10 pages of N beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of N beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of N beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-20       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-21: Verify saving after deleting 20 pages of N beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of N beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of N beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-21       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-22: Verify saving after deleting 20 pages of N beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of N beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of N beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-22       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-23: Verify saving after deleting 30 pages of N beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of N beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of N beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-23       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-N-24: Verify saving after deleting 30 pages of N beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of N beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of N beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the N beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-N-24       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-01: Verify that saving after changing 10 pages of S beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of S beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-02: Verify that saving after changing 10 pages of S beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of S beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-02       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-03: Verify that saving after changing 20 pages of S beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of S beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-03       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-04: Verify that saving after changing 20 pages of S beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of S beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-04       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-05: Verify that saving after changing 30 pages of S beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of S beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-05       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-06: Verify that saving after changing 30 pages of S beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of S beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-06       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-07: Verify that saving after changing 10 pages of S beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of S beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-07       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-08: Verify that saving after changing 10 pages of S beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of S beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-08       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-09: Verify that saving after changing 20 pages of S beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of S beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-09       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-10: Verify that saving after changing 20 pages of S beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of S beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-10       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-11: Verify that saving after changing 30 pages of S beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of S beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-11       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-12: Verify that saving after changing 30 pages of S beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of S beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-12       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-13: Verify that saving after changing 10 pages of S beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of S beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-13       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-14: Verify that saving after changing 10 pages of S beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of S beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-14       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-15: Verify that saving after changing 20 pages of S beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of S beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-15       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-16: Verify that saving after changing 20 pages of S beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of S beats to V beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-16       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-17: Verify that saving after changing 30 pages of S beats to V via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of S beats to V beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to V beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-17       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-18: Verify that saving after changing 30 pages of S beats to V via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of S beats to V beats using the hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient S beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 4 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-18       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-19: Verify saving after deleting 10 pages of S beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of S beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of S beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-19       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-20: Verify saving after deleting 10 pages of S beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of S beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of S beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-20       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-21: Verify saving after deleting 20 pages of S beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of S beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of S beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-21       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-22: Verify saving after deleting 20 pages of S beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of S beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of S beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-22       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-23: Verify saving after deleting 30 pages of S beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of S beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of S beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-23       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-S-24: Verify saving after deleting 30 pages of S beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of S beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of S beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the S beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-S-24       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-01: Verify that saving after changing 10 pages of V beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of V beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-02: Verify that saving after changing 10 pages of V beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of V beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-02       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-03: Verify that saving after changing 20 pages of V beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of V beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-03       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-04: Verify that saving after changing 20 pages of V beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of V beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-04       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-05: Verify that saving after changing 30 pages of V beats to Q via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of V beats to Q beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to Q beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-05       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-06: Verify that saving after changing 30 pages of V beats to Q via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of V beats to Q beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 5 on the keyboard to assign Q beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-06       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-07: Verify that saving after changing 10 pages of V beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of V beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-07       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-08: Verify that saving after changing 10 pages of V beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of V beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-08       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-09: Verify that saving after changing 20 pages of V beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of V beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-09       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-10: Verify that saving after changing 20 pages of V beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of V beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-10       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-11: Verify that saving after changing 30 pages of V beats to N via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of V beats to N beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to N beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-11       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-12: Verify that saving after changing 30 pages of V beats to N via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of V beats to N beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 2 on the keyboard to assign N beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-12       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-13: Verify that saving after changing 10 pages of V beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of V beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-13       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-14: Verify that saving after changing 10 pages of V beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~10 pages of V beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 10 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-14       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-15: Verify that saving after changing 20 pages of V beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of V beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-15       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-16: Verify that saving after changing 20 pages of V beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~20 pages of V beats to S beats using the hotkey option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 20 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign V beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-16       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-17: Verify that saving after changing 30 pages of V beats to S via button does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of V beats to S beats using the button option and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Choose Change all to S beat
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-17       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-18: Verify that saving after changing 30 pages of V beats to S via hotkey does not exceed performance threshold
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that changing ~30 pages of V beats to S beats using the hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study loaded with sufficient V beats spanning at least 30 pages
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 3 on the keyboard to assign S beats
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No freezing or UI blocking during save process.
    ...    3. Beat changes are reflected correctly after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-18       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-19: Verify saving after deleting 10 pages of V beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of V beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-19       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-20: Verify saving after deleting 10 pages of V beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~10 pages of V beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 10 pages of V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~10 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-20       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-21: Verify saving after deleting 20 pages of V beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of V beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-21       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-22: Verify saving after deleting 20 pages of V beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~20 pages of V beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 20 pages of V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~20 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-22       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-23: Verify saving after deleting 30 pages of V beats via button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of V beats using the Delete all beats button and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Select Delete all beats option
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-23       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PERFORMANCE-V-24: Verify saving after deleting 30 pages of V beats via hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: This test case verifies that deleting ~30 pages of V beats using the Delete all beats hotkey and clicking Save performs within the expected time (<5 minutes)
    ...
    ...     Precondition:
    ...    1. Study with at least 30 pages of V beats
    ...
    ...    Test Steps:
    ...    1. Navigate to the V beats tab on the R-R heatmap page
    ...    2. Use the mouse to select multiple cells across ~30 pages
    ...    3. Click on the Page Actions button
    ...    4. Press key 6 on the keyboard
    ...    5. Click the Save button
    ...    6. Observe if the save completes successfully and track duration
    ...
    ...     Expected Results:
    ...    1. Save completes in under 5 minutes.
    ...    2. No UI freezing or unresponsiveness.
    ...    3. Deleted beats are not shown after save.
    ...
    ...     **Others**
    ...     Create date: 9/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PERFORMANCE-V-24       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/PdfReport.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py           ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py           ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_airp_pdf]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[study_id_completed]
    Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Navigate To Tab Menu      Studies
    Navigate To Subtab Menu        Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Navigate to ai report page
    Navigate To Tab Menu      Studies
    Navigate To Subtab Menu        Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Manage Complete Study On              row=1
    Navigate To Subtab Menu     Reports
    View Completed New Report Status On          row=1
    Switch Tab

Navigate to study management page
    Navigate To Tab Menu      Studies
    Navigate To Subtab Menu        Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Manage Complete Study On              row=1

Download the pdf file on pdf report
    Navigate Airp Tab     tab=PDF Report
    Wait For Pdf Viewer Available
    Generate Pdf Report
    Download File Pdf

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success