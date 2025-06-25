*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY
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
Force Tags      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY  web
Test Timeout    30m

*** Test Cases ***

BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-01: Verify the list of manual event is sorted by captured time
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
    ...     Update Date: 9/27/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-01       AIRP-1.13.0     manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-02: Verify that manual events are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that manual events are sorted based on their capture time rather than triggered time
    ...    - Especially relevant when events occur close together in time
    ...
    ...     Precondition:
    ...    - Two manual events exist with distinct triggered and captured timestamps
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two manual events:
    ...       - Event A: Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events appear
    ...
    ...     Expected Results:
    ...    1. Manual events should be sorted by captured time in ascending order
    ...    2. Event B (captured at 23:21:56) should appear **before** Event A (captured at 23:22:09)
    ...    3. Follow issue https://github.com/ITR-vietnam/btcy-bioflux-qc-bug_report/issues/2499
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-02       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-03: Verify that auto device events are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
 ...     Description:
    ...    - This test case verifies that auto device events are sorted based on their capture time rather than triggered time
    ...    - Ensures correct order display in the UI, especially when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two auto device events exist with different captured times
    ...    - Their triggered times are close together (within ~1 minute)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two auto device events:
    ...       - Event A: Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events appear
    ...
    ...     Expected Results:
    ...    1. Auto device events should be sorted by captured time in ascending order
    ...    2. Event B (captured at 23:21:56) should appear **before** Event A (captured at 23:22:09)
    ...    3. Triggered time should not affect sorting priority when capture time is available
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-03       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-04: Verify that auto AI events (e.g., AFib) are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
        ...     Description:
    ...    - This test case verifies that auto AI events of the same type (e.g., AFib) are sorted based on their capture time rather than triggered time
    ...    - Ensures correct display order when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two auto AI events of type AFib exist with different capture times
    ...    - Their triggered times are close together (within ~1 minute)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two AFib events:
    ...       - Event A: Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events are listed in the UI
    ...
    ...     Expected Results:
    ...    1. Auto AI events should be sorted by captured time in ascending order
    ...    2. Event B (captured at 23:21:56) should appear **before** Event A (captured at 23:22:09)
    ...    3. Triggered time should not affect sorting priority when capture time is available
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-04       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-05: Verify that auto AI events of different types (e.g., Tachy and Brady) are sorted by capture time, not triggered time
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that auto AI events of different types (e.g., Tachycardia and Bradycardia) are sorted based on their capture time rather than triggered time
    ...    - Ensures correct chronological display in the UI when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two auto AI events exist: one Tachy and one Brady
    ...    - Triggered times are close together (e.g., ~1 minute apart)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two events:
    ...       - Event A (Tachycardia): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B (Bradycardia): Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe how the events are ordered in the UI
    ...
    ...     Expected Results:
    ...    1. Auto AI events of different types should still be sorted by captured time
    ...    2. Event B (Brady, captured at 23:21:56) should appear **before** Event A (Tachy, captured at 23:22:09)
    ...    3. Event type and triggered time should not affect the order when capture time is available
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-05       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-06: Verify that auto AI and auto device events of different types are sorted by capture time when captured times are close
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that auto AI and auto device events of different types (e.g., VT and Brady) are sorted by captured time even when captured times are close together
    ...    - Ensures correct chronological display in the UI when triggered times are close (within ~1 minute)
    ...
    ...     Precondition:
    ...    - Two events exist with close triggered times (~1 minute apart) and close captured times (~a few seconds apart)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two events:
    ...       - Event A (VT – Auto AI): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B (Brady – Auto Device): Triggered at 04/08/2025, 23:22:26, captured at 23:22:05
    ...    5. Observe how the events are listed in the UI
    ...
    ...     Expected Results:
    ...    1. Events should be sorted by captured time in ascending order, regardless of event type or source
    ...    2. Event B (Brady, captured at 23:22:05) should appear **before** Event A (VT, captured at 23:22:09)
    ...    3. Triggered time and event source should not affect the order when captured time is present and close
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-06       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-07: Verify that auto AI and manual device events are sorted by capture time when captured times are close
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that auto AI and manual device events are sorted based on captured time
    ...    - Ensures accurate chronological display even when captured times are close (within ~15 seconds)
    ...
    ...     Precondition:
    ...    - Two events exist with close captured times (e.g., within ~15 seconds):
    ...    - VT event (Auto AI): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...    - Manual Device event: Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...
    ...     Test Steps:
    ...    1. Navigate to the Patient Event Summary page
    ...    2. Navigate to the Strip Management page
    ...    3. Navigate to the Sample Strip page
    ...    4. Observe the following two events:
    ...       - Event A (VT – Auto AI): Triggered at 04/08/2025, 23:21:49, captured at 23:22:09
    ...       - Event B (Manual Device): Triggered at 04/08/2025, 23:22:26, captured at 23:21:56
    ...    5. Observe the order in which the events are displayed
    ...
    ...     Expected Results:
    ...    1. Events should be sorted in ascending order of captured time, regardless of event type or origin
    ...    2. Event B (Manual, captured at 23:21:56) should appear **before** Event A (VT, captured at 23:22:09)
    ...    3. Triggered time and classification should not override captured time in sorting logic
    ...
    ...     **Others**
    ...     Create date: 7/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-EVENT-SUMMARY-SORT-07       AIRP-1.13.0       manual      R1
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

Add new the event
    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=350      y_offset_start_time=20
    Navigate To Add New Event
    Edit Artifact Event      is_start_time=${True}       is_end_time=${True}     x_offset_start_time=-400     y_offset_start_time=10      x_offset_end_time=300      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}
#    ${panel_infor}          Get Panel Information Event
#    ${time_duration}        Evaluate    '${panel_infor}[Duration]'.replace('s', '')
#    ${new_time}             Conversion Duration Time    duration_time=${time_duration}
#    Set Global Variable    ${new_time}

Delete the afib event on Beats
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=350      y_offset_start_time=20
    Filter Header       is_deleted=${True}      is_save=${True}

Select start and end time override
    Edit Artifact Event      is_start_time=${True}        x_offset_start_time=-450      y_offset_start_time=10
    Filter Thumbnail Option        jum_to_end_time=${True}
    Edit Artifact Event      is_end_time=${True}     x_offset_end_time=300      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}

Change event duration
    Change Event Duration Airp
    Edit Artifact Event      is_start_time=${True}        x_offset_start_time=-450      y_offset_start_time=10
    Edit Artifact Event      is_end_time=${True}     x_offset_end_time=150      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}

Add new artifact
    Navigate To Add New Event
    Filter Thumbnail Option    select_event_type=Artifact
    Edit Artifact Event      is_start_time=${True}        x_offset_start_time=-460      y_offset_start_time=10
    Edit Artifact Event      is_end_time=${True}     x_offset_end_time=250      y_offset_end_time=100
    Filter Thumbnail Option          is_add=${True}
    Filter Header    is_save=${True}

Delete the "${events_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${events_type}
    Edit Artifact Event      is_hr_chart=${True}         x_offset_start_time=350      y_offset_start_time=20
    Filter Thumbnail Option    is_deleted_event=${True}
    Filter Header      is_save=${True}

Get value min heart rate on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${min_hr}           Evaluate    [item['Min'] for item in ${thumbnail}]
    ${actual_min_hr}           Evaluate    min(${min_hr})
    Set Global Variable    ${actual_min_hr}
    [Return]    ${actual_min_hr}

Get value max heart rate on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${max_hr}           Evaluate    [item['Max'] for item in ${thumbnail}]
    ${actual_max_hr}           Evaluate    max(${max_hr})
    Set Global Variable    ${actual_max_hr}
    [Return]    ${actual_max_hr}

Get value "${value_name}" heart rate on ecg event page
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${value_name}
    ${panel_infor}         Get Panel Information Event
    ${actual_ecg_event}           Evaluate    int("${panel_infor}[${value_name}]".split()[0])
    Set Global Variable    ${actual_ecg_event}
    [Return]    ${actual_ecg_event}

Get value "${value_name}" heart rate on strips management page
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=${value_name}
    ${infor_box}       Get Strips Management Box
    ${strip_management_min_hr}           Evaluate     int("${infor_box}[Technician comment]".split()[3])
    Set Global Variable    ${strip_management_min_hr}
    [Return]    ${strip_management_min_hr}

Get value "${value_name}" heart rate on cover page
    ${data_cover_page}     Read File Pdf Pages On     page_number=0
    ${value_cover_page}     Get Value In Cover File Pdf   data_pdf=${data_cover_page}
    ${expected_cover_page}     Evaluate    int("${value_cover_page}[${value_name}]".split()[0])
    Set Global Variable     ${expected_cover_page}
    [Return]    ${expected_cover_page}

Get value "${value_name}" heart rate on summary page
    ${data_summary_page}     Read File Pdf Pages On     page_number=2
    ${values_summary_page}     Get Value In Summary File Pdf       data_pdf=${data_summary_page}
    ${expected_summary_page}     Evaluate    int("${values_summary_page}[${value_name}]".split()[0])
    Set Global Variable     ${expected_summary_page}
    [Return]    ${expected_summary_page}

Edit min hr on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    View Thumbnail Hr Summary On    row=2
    Edit Hr On Hr Summary    min_hr=10      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${min_hr}           Evaluate    [item['Min'] for item in ${thumbnail}]
    ${actual_min_hr}           Evaluate    min(${min_hr})
    Set Global Variable     ${actual_min_hr}
    [Return]    ${actual_min_hr}

Edit max hr on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    View Thumbnail Hr Summary On    row=2
    Edit Hr On Hr Summary    max_hr=999      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${max_hr}           Evaluate    [item['Max'] for item in ${thumbnail}]
    ${actual_max_hr}           Evaluate    max(${max_hr})
    Set Global Variable     ${actual_max_hr}
    [Return]    ${actual_max_hr}

Edit avg hr on beats page
    Navigate Airp Tab     tab=Beats
    Navigate To Aireport Subtab     HR summary
    View Thumbnail Hr Summary On    row=2
    Edit Hr On Hr Summary    avg_hr=40      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${avg_hr}           Evaluate    [item['Avg'] for item in ${thumbnail}]
    ${sum_avg_hr}       Evaluate    round(sum(${avg_hr}) / len(${avg_hr}), 1)
    ${actual_avg_hr}    Conversion Duration Time    duration_time=${sum_avg_hr}
    Set Global Variable     ${actual_avg_hr}
    [Return]    ${actual_avg_hr}

Delete the "${event_type}" event on ECG events by button
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        is_deleted_event=${True}
    Filter Header    is_save=${True}

Mark the "${event_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        is_mark_as_artifact=${True}
    Filter Header    is_save=${True}

Add new "${event_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Add New The Event

Add new event on Beats
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Add New The Event

Change "${event_type}" event to "${other_event_type}" event on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        is_change_event_type=${True}     select_event_type=${other_event_type}       is_save=${True}
    Filter Header    is_save=${True}

Change "${event_type}" event duration on ECG events
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    ${event_type}
    Filter Thumbnail Option        change_event_duration=${True}
    Select Start And End Time Override
    Filter Header    is_save=${True}

Verify the total afib episodes on pdf page
    [Arguments]     ${actual_total_afib}
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_total_afib_cover}      Evaluate    int(${test_summary}[total_afib_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_afib_cover}        ${actual_total_afib}
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_afib_summary}      Evaluate    int(${test_summary}[total_afib_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_afib_summary}        ${expected_total_afib_cover}

Verify the value avg hr on pdf page
    [Arguments]     ${actual_avg_hr}
    Download The Pdf File On Pdf Report
    ${data_cover_page}     Read File Pdf Pages On     page_number=0
    ${value_cover_page}     Get Value In Cover File Pdf   data_pdf=${data_cover_page}
    ${expected_avg_hr}     Evaluate    int("${value_cover_page}[avg_hr])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr}        ${actual_avg_hr}
    ${data_summary_page}     Read File Pdf Pages On     page_number=2
    ${values_summary_page}     Get Value In Summary File Pdf       data_pdf=${data_summary_page}
    ${expected_avg_hr_summary_page}     Evaluate    int("${values_summary_page}[avg_hr])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr_summary_page}     ${actual_avg_hr}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr_summary_page}     ${expected_avg_hr}
