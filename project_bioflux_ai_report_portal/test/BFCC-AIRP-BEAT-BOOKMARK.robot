*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-BEAT-BOOKMARK
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
Force Tags      BFCC-AIRP-BEAT-BOOKMARK   web
Test Timeout    15m

*** Test Cases ***
BFCC-AIRP-BEAT-BOOKMARK-01: Verify the user can view all information on Mark a flag modal by clicking Add a bookmark button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The modal shall feature 2 sections: timestamp and notes
    ...     2. “Timestamp” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. There shall be a textbox for the user to leave their bookmark’s comments. This section is optional
    ...     4. There shall be “Add” and “Cancel” buttons for the user to add and cancel the bookmark
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-01       AIRP-1.10.0      auto      R2
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Bookmark    add_bookmark=${True}
    ${bookmark_status}      Check Event Bookmark
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${bookmark_status}[Jump To Timestamp]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Pick on ECG Viewer]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Add Bookmark]
    Filter Bookmark    is_cancel=${True}

BFCC-AIRP-BEAT-BOOKMARK-02: Verify the user can view all information on Mark a flag modal by using F hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The modal shall feature 2 sections: timestamp and notes
    ...     2. “Timestamp” sections shall also feature 2 buttons, “Jump to” and “Pick on ECG viewer”
    ...     3. There shall be a textbox for the user to leave their bookmark’s comments. This section is optional
    ...     4. There shall be “Add” and “Cancel” buttons for the user to add and cancel the bookmark
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-02       AIRP-1.10.0       auto      R2
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    by_hotkey=F
    ${bookmark_status}      Check Event Bookmark
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Cancel]
    Run Keyword And Continue On Failure    Should Not Be True    ${bookmark_status}[Jump To Timestamp]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Pick on ECG Viewer]
    Run Keyword And Continue On Failure    Should Be True    ${bookmark_status}[Add Bookmark]
    Filter Bookmark    is_cancel=${True}

BFCC-AIRP-BEAT-BOOKMARK-03: Verify the timestamp is displayed after using the Pick on ECG button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-03       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-04: Verify the timestamp is updated after selecting another date and time using Pick on ECG viewer button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-04       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-05: Verify the bookmark time indicator is displayed if the timestamp is selected by the user
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-05       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-06: Verify that the Jump to button will be disable if there is no data in the Timestamp
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-06       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-07: Verify that clicking the 'Jump To' button navigates the user to the specified timestamp on the ECG viewer
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Selecting the “Jump to” button shall navigate the user to the timestamp on the ECG viewer
    ...     - The bookmark will appear in the center of the ECG viewer, excluding the timeframes [0:01 -> 0:04] and [0:56 -> 0:59]
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-07       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-08: Verify user can close the pop-up and exit the Add a bookmark function by using Cancel button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...     Auto create: 08/30/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-08       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-09: Verify that the user can add a flag without enter Notes on Mark a flag modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-09       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-10: Verify that the limit for the 'Notes' field is 200 characters in the 'Mark a flag' modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-10       AIRP-1.10.0             manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-11: Verify there shall be a warning message to display if there is no data on the timestamp
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-11       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-12: Verify that the user can mark a position in the Artifact Areas tab using the 'Add Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-12       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-13: Verify that user can mark the position on the AFib events tab using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-13       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-14: Verify that user can mark the position on the AFib events tab using the F hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-14       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-15: Verify that user can mark the position on the R-R heatmap tab using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-15       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-16: Verify that user can mark the position on the R-R heatmap tab using the F hotkey
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-16       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-17: Verify that user can mark the position on the Artifact tab using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-17       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-18: Verify that user can mark the position on the AFib event tab using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-18       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-19: Verify that user can mark the position on the Q-Q beats group using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-19       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-20: Verify that user can mark the position on the Q-N/S/V beats group using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-20       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-21: Verify that user can mark the position on the V beats group using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-21       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-22: Verify that user can mark the position on the S beats group using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-22       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-23: Verify that user can mark the position on the N beats group using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-23       AIRP-1.10.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-BOOKMARK-24: Verify that user can mark the position on the HR summary tab using the 'Add a Bookmark' button
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 08/23/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-BEAT-BOOKMARK-24       AIRP-1.10.0             manual      R1
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
