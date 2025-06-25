*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-STRIPS-MANAGEMENT-ECG
Metadata    owner   Thang Tran
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_ai_report_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_ai_report_portal/lib/web/Reports.py
Library     project_bioflux_ai_report_portal/lib/web/Common.py
Library     project_bioflux_ai_report_portal/lib/web/Studies.py
Library     project_bioflux_ai_report_portal/lib/web/VMorphologies.py
Library     project_bioflux_ai_report_portal/lib/web/StripsManagement.py
Library     project_bioflux_ai_report_portal/lib/web/EcgEvent.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-STRIPS-MANAGEMENT-ECG   web
Test Timeout    15m

*** Test Cases ***
BFCC-AIRP-STRIPS-MANAGEMENT-ECG-01:Verify
    [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...
    ...     **Others**
    ...     Create date: 08/27/2024 - Hoang Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-ECG-01       AIRP-1.11.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/VMorphologies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py            ${BROWSER_NODE}     ${ENV}
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

Check beats change by action "${action_name}" for beat by "Page actions" feature
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -16
    ${number_page}    Get Current Total Page Airp Pagination
    ${actual_number_page}    Evaluate    ${number_page}-1
    Filter Action Change    beat_change=${action_name}
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        ${action_name}
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       ${action_name}
    Filter Header    is_save=${True}
    ${expected_number_page}    Get Current Total Page Airp Pagination
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_page}     ${expected_number_page}

Check beats change by action with hotkey "${hotkey_name}" for beat "${beat_name}" by "Page actions" feature
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -16
    ${number_page}    Get Current Total Page Airp Pagination
    ${actual_number_page}    Evaluate    ${number_page}-1
    Change Strip To Beats On Page     beat_change_by_hotkey=${hotkey_name}
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        Change all to ${beat_name} beat
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       Change all to ${beat_name} beat
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Hotkey]       ${hotkey_name}
    Filter Header    is_save=${True}
    ${expected_number_page}    Get Current Total Page Airp Pagination
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_page}     ${expected_number_page}

Check beats change by action with hotkey "${hotkey_name}" for "Delete all beats" beat by "Page actions" feature
    ${number_beats}   Get Number Beats
    ${number_beats_processed}       Evaluate    ${number_beats} -16
    ${number_page}    Get Current Total Page Airp Pagination
    ${actual_number_page}    Evaluate    ${number_page}-1
    Change Strip To Beats On Page     beat_change_by_hotkey=${hotkey_name}
    ${current_action}       Get Current Action Change
    Run Keyword And Continue On Failure    Should Be Equal   ${current_action}        Delete all beats
    ${action_selected}      Get Action Change Selected
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Beat Change]       Delete all beats
    Run Keyword And Continue On Failure    Should Be Equal    ${action_selected}[0][Hotkey]       ${hotkey_name}
    Filter Header    is_save=${True}
    ${expected_number_page}    Get Current Total Page Airp Pagination
    ${expected_number_beats}         Get Number Beats
    Run Keyword And Continue On Failure    Should Be Equal    ${number_beats_processed}     ${expected_number_beats}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_page}     ${expected_number_page}
