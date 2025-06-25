*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-BEAT
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
Force Tags      BFCC-AIRP-BEAT   web
Test Timeout    15m

#*** Variables ***
#${study_id}
#${username}
#${password}

*** Test Cases ***
#BFCC-AIRP-BEAT-VIEW-REPORT-STATUS-01: Verify Beats after change beats
#    [Documentation]     Author: Thang Tran
#    ...
#    ...     Description:
#    ...
#    ...     Precondition:
#    ...     - Existing user login callcenter alpha
#    ...
#    ...     Test Steps:
#    ...     1. Navigate to "Reports" screen on menu
#    ...     2. Click tab "Pending" link -> Click subtab "End of Use reports" link
#    ...     3. Click "View" link in colum New Report Status
#    ...     4. Nagigate to tab "Beats" link
#    ...     5. Select the "N-N/S/V beats" button on the R-R heatmap
#    ...     6. Click to cell that have the value quality on H-R heatmap chart
#    ...     7. Select all the beats
#    ...     8. Select the "Change to S-beats/V-beats/Q-beats" -> Click on the "Save" button
#    ...     9. Observe the result
#    ...     Expected Results:
#    ...     8. If select the "N-beats" button
#    ...         - Do not the value change
#    ...     9. That cell selected is was delete on R-R heatmap and displayed message "Select a cell on the heatmap chart to view its beats."
#    ...
#    [Tags]      BFCC-AIRP-BEAT-VIEW-REPORT-STATUS-01     manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Tab Menu      Studies
#    Navigate To Studies Type        Completed
#    ${reports}      Get Completed Studies Customer
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Studies      search_by=Study ID      text_search=${study_id}
#    ${reports}      Get Completed Studies Customer
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Manage Complete Study On              row=1
#    Navigate To Studies Type        Reports
#    View Completed New Report Status On          row=1
#    Switch Tab
#    Navigate Tab        tab=Beats
#    Wait Element Beat Visible       beat=N beats
#    ${random_element}       Get Cell On Chart
#    ${result}     Change To Beat     beatS    is_save=${True}    element_or_locator=${random_element}
#    Run Keyword And Continue On Failure   Should Not Be True    ${result}
#    Navigate Tab        tab=ECG Events
#    ${element_beat_event}       Get Element Beat Event
#    ${check_mark}     Mark As Artifact    element_or_locator=${element_beat_event}     is_save=${True}
##    Run Keyword And Continue On Failure    Should Be True    ${check_mark}
#    Navigate Tab        tab=PDF Report
#    ${check_pdf_viewer}     Get Generate Report
#    Run Keyword And Continue On Failure    Should Be True    ${check_pdf_viewer}
#    Stop Ai Processing
#    ${msg}      Get Message Stop Successful
#    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success

BFCC-AIRP-BEAT-VIEW-01: View Beat&HR tab details
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Can view Beat&HR tab details
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.Click Beat&HR tab
    ...     2. Observe the screen
    ...
    ...     Expected Results:
    ...     1. The Beat&HR include the information following:
    ...     - Artifact areas
    ...     - AFib
    ...     - R-R histogram (heatmap chart)
    ...     - HR summary
    ...     - Add new event button
    ...     - Add a bookmark button
    ...
    ...     **Others**
    ...     Update date: 03/8/2024 - Trinh Nguyen
    ...     Auto update: 03/13/2024 - Thang Tran
    ...
    [Tags]      BFCC-AIRP-BEAT-VIEW-01       auto
    Navigate Airp Tab      tab=Beats
    Navigate To Aireport Subtab     Artifact areas
    ${actual_tabs}      Get Header Tabs On Beats Hr
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_tabs}[Artifact areas]        Artifact areas
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_tabs}[AFib][0]               AFib events
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_tabs}[R-R histogram]         R-R heatmap
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_tabs}[Add new event]         Add New Event
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_tabs}[Add a bookmark]        Add a bookmark

BFCC-AIRP-BEAT-VIEW-02: View Artifact areas sub tab details
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: Can view Artifact areas sub tab details
    ...
    ...     Precondition:
    ...     - The user is on the AI report processing screen
    ...
    ...     Test Steps:
    ...     1.Click Beat&HR tab
    ...     2. Click the Artifact areas sub tab
    ...     3. Observe the screen
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 03/8/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-BEAT-VIEW-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-VIEW-03: View AFib tab details
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-BEAT-VIEW-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-VIEW-04: View R-R heatmap details
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-BEAT-VIEW-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-BEAT-VIEW-05: View HR summary details
    [Documentation]     Author: Trinh Nguyen
    ...
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

    [Tags]      BFCC-AIRP-BEAT-VIEW-05     manual
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

SUITE TEARDOWN
    Stop Processing
    Quit Browser

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success
