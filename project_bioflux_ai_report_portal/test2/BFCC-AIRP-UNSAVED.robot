*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-UNSAVED
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py
Library     project_bioflux_ai_report_portal/lib/web/StudyManagement.py
Library     project_bioflux_ai_report_portal/lib/web/EventDetails.py
Library     project_bioflux_ai_report_portal/lib/web/StripsManagement.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-UNSAVED  web
Test Timeout    30m
*** Test Cases ***
BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-01:Verify that the 'Unsaved Changes' function works properly when changing the artifact event duration using the 'Change Duration' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function function works properly when changing the artifact event duration using the 'Change Duration' button
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select a specific artifact event, then click the Change event duration button
    ...    2. Proceed to change the event duration by modifying the start time and end time, then click Done button
    ...    3. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    4. Click the Discard changes button
    ...    5. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 4, after clicking the 'Discard Changes' button, the data shall be discarded, and the user will remain on the same tab before the page reloads
    ...    2. At step 5, after clicking the 'Keep Editing' button, the user will remain on the same tab before the page reloads, and the unsaved changes made by the user will be kept and not lost
    ...     **Others**
    ...     Create date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]  BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-01      AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}    next_or_previous=next       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    ${actual_events}      Get Events Selected
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    ${expected_events}      Get Events Selected
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events}    ${expected_events}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}
    ${result_1}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Not Be True     ${result_1}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-02:Verify that the 'Unsaved Changes' function works properly when changing the artifact event duration using the C hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when changing the artifact event duration using the C hotkey
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select a specific artifact event, then click the Change event duration button
    ...    2. Proceed to change the event duration by modifying the start time and end time, then click Done button
    ...    3. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    4. Click the Discard changes button
    ...    5. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 4, after clicking the 'Discard Changes' button, the data shall be discarded, and the user will remain on the same tab before the page reloads
    ...    2. At step 5, after clicking the 'Keep Editing' button, the user will remain on the same tab before the page reloads, and the unsaved changes made by the user will be kept and not lost
    ...     **Others**
    ...     Create date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]  BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-02      AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Filter Thumbnail Option    by_hotkey=C
    Edit Artifact Event      is_start_time=${True}    next_or_previous=next       is_end_time=${True}     x_offset_start_time=-410      y_offset_start_time=100      x_offset_end_time=400      y_offset_end_time=10
    Edit Artifact Event      is_done=${True}
    ${actual_events}      Get Events Selected
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    ${expected_events}      Get Events Selected
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events}    ${expected_events}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}
    ${result_1}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Not Be True     ${result_1}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-03:Verify that the 'Unsaved Changes' function works properly when deleting the artifact event duration using the Delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when deleting the artifact event duration using the Delete button
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select a specific artifact event
    ...    2. Click the delete button
    ...    3. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    4. Click the Discard changes button
    ...    5. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 4, after clicking the 'Discard Changes' button, the data shall be discarded, and the user will remain on the same tab before the page reloads
    ...    2. At step 5, after clicking the 'Keep Editing' button, the user will remain on the same tab before the page reloads, and the unsaved changes made by the user will be kept and not lost
    ...     **Others**
    ...     Create date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]  BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-03      AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Filter Header    is_deleted=${True}
    ${actual_events}      Get Events Selected
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    ${expected_events}      Get Events Selected
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events}    ${expected_events}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}
    ${result_1}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Not Be True     ${result_1}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-04:Verify that the 'Unsaved Changes' function works properly when deleting the artifact event duration using the D hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when deleting the artifact event duration using the D hotkey
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select a specific artifact event
    ...    2. Press the 'D' hotkey on the keyboard
    ...    3. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    4. Click the Discard changes button
    ...    5. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 4, after clicking the 'Discard Changes' button, the data shall be discarded, and the user will remain on the same tab before the page reloads
    ...    2. At step 5, after clicking the 'Keep Editing' button, the user will remain on the same tab before the page reloads, and the unsaved changes made by the user will be kept and not lost
    ...     **Others**
    ...     Create date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]  BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-04      AIRP-1.10.0       auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Filter Thumbnail Option    by_hotkey=D
    ${actual_events}      Get Events Selected
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    ${expected_events}      Get Events Selected
    ${result}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Be True     ${result}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events}    ${expected_events}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}
    ${result_1}    Verify Unsaved Symbol
    Run Keyword And Continue On Failure    Should Not Be True     ${result_1}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-05: Verify that the 'Unsaved Changes' function works properly when adding an N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when adding an N beat in the ECG Viewer using the N beat button
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart
    ...    2. On ECG Viewer, click Beat marker tool then select N beat
    ...    3. Add N beat on ECG viewer
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
  
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-05       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_N_beat=${True}   x_offset_time=-410    y_offset_time=100
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-06: Verify that the 'Unsaved Changes' function works properly when adding an N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when adding an N beat in the ECG Viewer using the 'N' keyboard
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart
    ...    2. On the ECG Viewer, click the Beat Marker tool, then press the 'N' key on the keyboard
    ...    3. Add N beat on ECG viewer
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-06       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_N_beat=${True}   x_offset_time=-410    y_offset_time=100    use_hotkey=${True}
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-07: Verify that the 'Unsaved Changes' function works properly when adding an N beat in the ECG Viewer using add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when adding an N beat in the ECG Viewer using add beat option from context menu
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart
    ...    2. On the ECG Viewer, right-click, then select the 'Add Beats' option and choose 'N Beat'
    ...    3. Add N beat on ECG viewer
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-07       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-08: Verify that the 'Unsaved Changes' function works properly when changing V/S/Q beat to N beat in the ECG Viewer using the N beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when changing V/S/Q beat to N beat in the ECG Viewer using the N beat button
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart that contains a V/S/Q beat on the ECG viewer
    ...    2. On ECG Viewer, click Beat marker tool then select N beat button
    ...    3. Hover over the sections containing V/S/Q beats and click to replace them or "Press and hold the left mouse button, drag over the area containing V/S/Q beats on the ECG viewer, and release the mouse button"
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-08       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-09: Verify that the 'Unsaved Changes' function works properly when changing V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when changing V/S/Q beat to N beat in the ECG Viewer using the 'N' keyboard
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart that contains a V/S/Q beat on the ECG viewer
    ...    2. On the ECG Viewer, click the Beat Marker tool, then press the 'N' key on the keyboard
    ...    3. Hover over the sections containing V/S/Q beats and click to replace them or "Press and hold the left mouse button, drag over the area containing V/S/Q beats on the ECG viewer, and release the mouse button"
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-09       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-10: Verify that the 'Unsaved Changes' function works properly when changing V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when changing V/S/Q beats to N beat in the ECG Viewer using the change beat type from context menu
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart that contains a V/S/Q beat on the ECG viewer
    ...    2. On the ECG Viewer, right-click, then select the 'Add Beats' option and choose 'N Beat'
    ...    3. Hover over the sections containing V/S/Q beats and click to replace them or "Press and hold the left mouse button, drag over the area containing V/S/Q beats on the ECG viewer, and release the mouse button"
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-10       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-11: Verify that the 'Unsaved Changes' function works properly when deleting an N beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when deleting an N beat in the ECG Viewer using the delete button
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart that contains a N beat on the ECG viewer
    ...    2. On ECG Viewer, click Beat marker tool then select Delete beat button
    ...    3. Hover over the sections containing N beat and click to replace them or "Press and hold the left mouse button, drag over the area containing N beat on the ECG viewer, and release the mouse button"
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-12: Verify that the 'Unsaved Changes' function works properly when deleting an N beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart that contains a N beat on the ECG viewer
    ...    2. On the ECG Viewer, click the Beat Marker tool, then press the 'D' key on the keyboard
    ...    3. Hover over the sections containing N beat and click to delete them or "Press and hold the left mouse button, drag over the area containing N beat on the ECG viewer, and release the mouse button"
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-13: Verify that the 'Unsaved Changes' function works properly when deleting an N beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when deleting an N beat in the ECG Viewer by using the right-click mouse
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart that contains a N beat on the ECG viewer
    ...    2. On the ECG Viewer, click the Beat Marker tool, select the N/S/V/Q beat
    ...    3. Hover over the sections containing N beat and right-click to delete them
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-14: Verify that the 'Unsaved Changes' function works properly when deleting an N beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when deleting an N beat in the ECG Viewer by using remove beat option from context menu
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart that contains a N beat on the ECG viewer
    ...    2. On the ECG Viewer, right-click directly on the N beat on the ECG Viewer
    ...    3. Select the Remove beat button
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-15: Verify that the 'Unsaved Changes' function works properly when adding an S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when adding an S beat in the ECG Viewer using the S beat button
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart
    ...    2. On ECG Viewer, click Beat marker tool then select S beat
    ...    3. Add S beat on ECG viewer
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-15       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_S_beat=${True}   x_offset_time=-410    y_offset_time=100
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-16: Verify that the 'Unsaved Changes' function works properly when adding an S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The 'Unsaved Changes' function works properly when adding an S beat in the ECG Viewer using the 'S' keyboard
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...
    ...     Test Steps:
    ...    1. Select any area on the HR chart
    ...    2. On the ECG Viewer, click the Beat Marker tool, then press the 'S' key on the keyboard
    ...    3. Add S beat on ECG viewer
    ...    4. Perform the actions sequentially to meet the 3 preconditions for the 'Unsaved Changes' popup to display
    ...    5. Click the Discard changes button
    ...    6. Click the Keep editing button
    ...
    ...     Expected Results:
    ...    1. At step 5, after clicking the 'Discard Changes' button, the data will be discarded, and the position of the ECG viewer cannot be preserved
    ...    2. At step 6, after clicking the 'Keep Editing' button, the position of the ECG viewer cannot be preserved, and the unsaved changes made by the user will be kept and not lost
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-16       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_S_beat=${True}   x_offset_time=-410    y_offset_time=100    use_hotkey=${True}
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-17: Verify that the 'Unsaved Changes' function works properly when adding an S beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-18: Verify that the 'Unsaved Changes' function works properly when changing N/V/Q beat to S beat in the ECG Viewer using the S beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-19: Verify that the 'Unsaved Changes' function works properly when changing N/V/Q beat to S beat in the ECG Viewer using the 'S' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-20: Verify that the 'Unsaved Changes' function works properly when changing N/V/Q beat to S beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-21: Verify that the 'Unsaved Changes' function works properly when deleting an S beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-22: Verify that the 'Unsaved Changes' function works properly when deleting an S beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-23: Verify that the 'Unsaved Changes' function works properly when deleting an S beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-24: Verify that the 'Unsaved Changes' function works properly when deleting an S beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-24       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-25: Verify that the 'Unsaved Changes' function works properly when adding an V beat in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-25       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_V_beat=${True}   x_offset_time=-410    y_offset_time=100
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-26: Verify that the 'Unsaved Changes' function works properly when adding an V beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-26       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-27: Verify that the 'Unsaved Changes' function works properly when adding an V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-27       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_V_beat=${True}   x_offset_time=-410    y_offset_time=100    use_hotkey=${True}
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-28: Verify that the 'Unsaved Changes' function works properly when changing N/S/Q beat to V in the ECG Viewer using the V beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-28       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-29: Verify that the 'Unsaved Changes' function works properly when changing N/S/Q beat to V beat in the ECG Viewer using the 'V' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-29       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-30: Verify that the 'Unsaved Changes' function works properly when changing N/S/Q beat to V beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-30       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-31: Verify that the 'Unsaved Changes' function works properly when deleting an V beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-31       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-32: Verify that the 'Unsaved Changes' function works properly when deleting an V beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-32       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-33: Verify that the 'Unsaved Changes' function works properly when deleting an V beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-33       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-34: Verify that the 'Unsaved Changes' function works properly when deleting an V beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-34       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-35: Verify that the 'Unsaved Changes' function works properly when adding an Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-35       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_Q_beat=${True}   x_offset_time=-410    y_offset_time=100
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-36: Verify that the 'Unsaved Changes' function works properly when adding an Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...     Auto create: 04/22/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-36       AIRP-1.10.0             auto      R1
    Navigate Airp Tab     tab=Beats
    Navigate Airp Artifact
    View Airp Artifact On    row=1
    Add Beats In Ecg Viewer    is_add_Q_beat=${True}   x_offset_time=-410    y_offset_time=100    use_hotkey=${True}
    Reload Page
    Action Unsaved Changes    is_keep_editing=${True}
    Reload Page
    Action Unsaved Changes    is_discard_changes=${True}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-37: Verify that the 'Unsaved Changes' function works properly when adding an Q beat in the ECG Viewer using the add beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-37       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-38: Verify that the 'Unsaved Changes' function works properly when changing N/S/V beat to Q beat in the ECG Viewer using the Q beat button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-38       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-39: Verify that the 'Unsaved Changes' function works properly when changing N/S/V beat to Q beat in the ECG Viewer using the 'Q' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-39       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-40: Verify that the 'Unsaved Changes' function works properly when changing N/S/V beat to Q beat in the ECG Viewer using the change beat type from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-40       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-41: Verify that the 'Unsaved Changes' function works properly when deleting an Q beat in the ECG Viewer using the delete button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-41       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-42: Verify that the 'Unsaved Changes' function works properly when deleting an Q beat in the ECG Viewer using the 'D' keyboard
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-42       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-43: Verify that the 'Unsaved Changes' function works properly when deleting an Q beat in the ECG Viewer by using the right-click mouse
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-43       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-44: Verify that the 'Unsaved Changes' function works properly when deleting an Q beat in the ECG Viewer by using remove beat option from context menu
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    1. If the user does not take action, a notification shows for 15 minutes. Turn off the notification, and the portal will reload
    ...    2. The user reloads the page
    ...    3. When the Internet is disconnected
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 12/10/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-UNSAVED-BEATS-ARTIFACT-44       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py            ${BROWSER_NODE}     ${ENV}

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


