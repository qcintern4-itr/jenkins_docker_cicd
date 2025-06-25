*** Settings ***
Documentation   Test Suite - Call Center QA Portal - Process Interim Reports
Metadata    sid     BFCC-QA-PROCESS-INTERIM
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     Collections
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Reports.py
Library     project_bioflux_callcenter_portal/lib/web/StudyManagement.py
Library     project_bioflux_callcenter_portal/lib/web/EventDetails.py
Library     project_bioflux_callcenter_portal/lib/web/Studies.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-QA-PROCESS-INTERIM   web
Test Timeout    15m

*** Test Cases ***
BFCC-QA-PROCESS-INTERIM-CREATE-01: Create Interim Report–No Existing Report
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Verify that the system allows user to create a new Interim Report when no previous report exists and there is no new data.
    ...
    ...    Precondition: User is on the Reports tab of a study.
    ...
    ...    Test Steps:
    ...    1.Go to Reports tab of the Study.
    ...    2.Click on Create Report button.
    ...    3.Select a valid timeframe (with or without data).
    ...    4.Click on "Create report"
    ...
    ...    Expected Results:
    ...    - A new report is created with status Running.
    ...    - User is navigated back to the Reports tab.
    ...
    ...    **Others**
    ...    Update date: 04/17/2025 - Thanh Tieu

    [Tags]  BFCC-QA-PROCESS-INTERIM-CREATE-01     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-CREATE-02: Create Interim Report–Overlapping Time Frame (No New Data Uploaded) and The previous report is generated
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Verify that the system informs the user when trying to create a report that already exists for the same timeframe.
    ...
    ...    Precondition: User is on the Reports tab of a study where a report has already been generated.
    ...
    ...    Test Steps:
    ...    1.Click on "Create Report".
    ...    2.Select the same timeframe as the previously generated report.
    ...    3.Click on "Create report"
    ...
    ...    Expected Results:
    ...    - A toast appears: “A report already exists for the selected time period”
    ...    - "View report" button is shown to access the existing report.
    ...
    ...    **Others**
    ...    Update date: 04/17/2025 - Thanh Tieu

    [Tags]  BFCC-QA-PROCESS-INTERIM-CREATE-02     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-CREATE-03: Create Interim Report–Overlapping Time Frame (No New Data Uploaded) and The previous report is generating
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Verify that the system informs the user when trying to create a report that already exists for the same timeframe.
    ...
    ...    Precondition: User is on the Reports tab of a study where a report has already been generated.
    ...
    ...    Test Steps:
    ...    1.Click on "Create Report".
    ...    2.Select the same timeframe as the previously generated report.
    ...    3.Click on "Create report"
    ...
    ...    Expected Results:
    ...    - A toast appears: “A report already exists for the selected time period”
    ...    - If the report is still generating → user cannot access its details.
    ...
    ...    **Others**
    ...    Update date: 04/17/2025 - Thanh Tieu

    [Tags]  BFCC-QA-PROCESS-INTERIM-CREATE-03     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-CREATE-04: Create Interim Report–Overlapping Time Frame (New Data Uploaded)
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Ensure a new report is generated if there is new data within the selected timeframe.
    ...
    ...    Precondition: User is on the Reports tab of a study with an existing report and new data uploaded since last report.
    ...
    ...    Test Steps:
    ...    1.Click "Create Report"
    ...    2.Select timeframe that includes the new data
    ...    3.Click on "Create report"
    ...
    ...    Expected Results:
    ...    - User is navigated to Reports tab.
    ...    - A new record is created (new timeframe), status: Running.
    ...    - Toast appears: “The request is in progress.”
    ...
    ...    **Others**
    ...    Update date: 04/17/2025 - Thanh Tieu

    [Tags]  BFCC-QA-PROCESS-INTERIM-CREATE-04     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-CREATE-05: Create Interim Report-Ensure unavailable dates are greyed out and unselectable
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Verify the calendar disables dates outside the study start date to today and greys out dates with no data.
    ...
    ...    Precondition: User is on the Reports tab.
    ...
    ...    Test Steps:
    ...    1.Click "Create Report"
    ...    2.Open date picker/calendar
    ...
    ...    Expected Results:
    ...    - Dates before the study start date and after today are disabled.
    ...    - Dates with no data are greyed out.
    ...    - User cannot select greyed-out dates individually.
    ...
    ...    **Others**
    ...    Update date: 04/17/2025 - Thanh Tieu

    [Tags]  BFCC-QA-PROCESS-INTERIM-CREATE-05     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-CREATE-06: Create Interim Report-Allow range selection even if some dates have no data
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description: Check if the system allows a user to select a date range that includes days without data.
    ...
    ...    Precondition: User is on the Reports tab.
    ...
    ...    Test Steps:
    ...    1.Click Create Report.
    ...    2.In date picker, select a range including some greyed-out (no data) dates.
    ...    3.Click on "Create report"
    ...
    ...    Expected Results:
    ...    - System accepts the selection.
    ...    - Report includes only data for the days that have data.
    ...
    ...    **Others**
    ...    Update date: 04/17/2025 - Thanh Tieu

    [Tags]  BFCC-QA-PROCESS-INTERIM-CREATE-06     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-01: View details of Report summary tab on the new Interim report editing page of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-02: View details of Report summary tab on the new Interim report editing page of Cardiac/Holter/Extended Holter studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-03: View details of Test summary sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-03      auto
    Create New Interim Report
    Navigate To Event Tab      Report Summary
    Filter On Summary Report    calculate_hr=${True}
    Get Image Interim Report Details    test_summary=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=test_summary        image_name_compare=test_summary
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-04: View details of Tachycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-04     auto
    Create New Interim Report
    Navigate To Event Tab      Report Summary
    Get Image Interim Report Details    tachycardia=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=tachycardia        image_name_compare=tachycardia
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-05: View details of Bradycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-05     auto
    Create New Interim Report
    Navigate To Event Tab      Report Summary
    Get Image Interim Report Details    bradycardia=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=bradycardia        image_name_compare=bradycardia
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-06: View details of Atrial Fibrillation sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-06      auto
    Create New Interim Report
    Navigate To Event Tab      Report Summary
    Get Image Interim Report Details    atrial_fibrillation=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=atrial_fibrillation        image_name_compare=atrial_fibrillation
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-07: View details of Pause sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-07      auto
    Create New Interim Report
    Navigate To Event Tab      Report Summary
    Get Image Interim Report Details    pause=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=pause        image_name_compare=pause
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-08: View details of Manual sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-09: Can refresh the Test summary sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-09      auto
    Create New Interim Report
    Navigate To Event Tab      Report Summary
    Filter On Summary Report    test_summary=${True}
    ${expected_result}      Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Refresh Page]
    Filter On Summary Report    tachycardia=${True}
    ${expected_result}      Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Refresh Page]
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Filter]
    Filter On Summary Report    bradycardia=${True}
    ${expected_result}      Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Refresh Page]
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Filter]
    Filter On Summary Report    atrial_fibrillation=${True}
    ${expected_result}      Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Refresh Page]
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Filter]
    Filter On Summary Report    pause=${True}
    ${expected_result}      Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Refresh Page]
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Filter]
    Filter On Summary Report    manual=${True}
    ${expected_result}      Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Refresh Page]
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}[Filter]

BFCC-QA-PROCESS-INTERIM-DETAILS-10: Can refresh the Tachycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-11: Can refresh the Bradycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-12: Can refresh the AFib Fibrillation sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-13: Can refresh the Pause sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-14: Can refresh the Manual sub-tab on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-15: Can enter value on Min/AVG/Max HR on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-15      auto
    Create New Interim Report
    Navigate To Event Tab      Report Summary
    Edit Interim Report Summary    min_hr=50      max_hr=130     min_avg_hr=50     max_avg_hr=130     min_max_hr=50     max_max_hr=130
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    Filter Study Reports    by_report=Summary reports      text_search=${report_id}
    Edit Report On      row=1
    Navigate To Event Tab      Report Summary
    Get Image Interim Report Details    test_summary=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=test_summary        image_name_compare=test_summary
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}
    Filter On Summary Report    calculate_hr=${True}
    Get Image Interim Report Details    test_summary_1=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=test_summary_1      image_name_compare=test_summary
    Run Keyword And Continue On Failure    Should Not Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-16: Can recalculate the values of the heart rate parameters on Report summary tab of MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-17: Can use filter button in the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-18: Manually sort events by Event ID on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-18      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        tachycardia=${True}
    ${events_report}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events_report}
    # sort descending
    Sort Event Interim Reports     Event ID       desc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${descending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_event_id}
    # sort ascending
    Sort Event Interim Reports     Event Id       asc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${ascending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_event_id}

BFCC-QA-PROCESS-INTERIM-DETAILS-19: Can navigate to the Event Editing page on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-19      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        tachycardia=${True}
    ${event_reports}     Get Events Interim Report On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    ${event_ids}         Evaluate    [item['Event ID'] for item in ${event_reports}]
    ${expected_event_id}         Evaluate  random.choice(${event_ids})    random
    Edit Event Interim On    event_id=${expected_event_id}
    Switch Tab
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_content}           Get Event Summary
    ${actual_event_id}         Evaluate     "${event_content['EVENT ID'].split('\n')[0]}"
    ${actual_study_id}         Set Variable    ${event_content}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_event_id}      ${expected_event_id}
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_study_id}      ${STUDY_ID_COMPLETED}[study_id]
    Switch Tab   tab_id=0
    Close Tab   0       is_post_switch=${True}

BFCC-QA-PROCESS-INTERIM-DETAILS-20: Quick access to Event information on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-20      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        tachycardia=${True}
    ${event_reports}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    View Interim Report Event Information On       row=1
    ${event_information}    Get Event Information
    ${expected_event_info}      Create List     Trigger Time    Upload Time     First Opened    Closed Time
    ${actual_event_info}        Evaluate    [k for k, v in ${event_information}[EVENT INFORMATION].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_event_info}      ${actual_event_info}

BFCC-QA-PROCESS-INTERIM-DETAILS-21: Check pagination tool works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/06/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-21      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        tachycardia=${True}
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Pagination Reports    next_or_previous=next
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Reports    next_or_previous=previous
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Reports Size Rows    rows=30 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
    Custom Reports Size Rows    rows=50 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-QA-PROCESS-INTERIM-DETAILS-22: Check Open new tab button (Longest episode) works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-22      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-23: Check Open new tab button (Fastest heart rate) works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-23      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-24: Can use filter button in the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-24      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-25: Manually sort events by Event ID on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-25      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        bradycardia=${True}
    ${events_report}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events_report}
    # sort descending
    Sort Event Interim Reports     Event ID       desc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${descending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_event_id}
    # sort ascending
    Sort Event Interim Reports     Event Id       asc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${ascending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_event_id}

BFCC-QA-PROCESS-INTERIM-DETAILS-26: Can navigate to the Event Editing page on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-26      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        bradycardia=${True}
    ${event_reports}     Get Events Interim Report On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    ${event_ids}         Evaluate    [item['Event ID'] for item in ${event_reports}]
    ${expected_event_id}         Evaluate  random.choice(${event_ids})    random
    Edit Event Interim On    event_id=${expected_event_id}
    Switch Tab
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_content}           Get Event Summary
    ${actual_event_id}         Evaluate     "${event_content['EVENT ID'].split('\n')[0]}"
    ${actual_study_id}         Set Variable    ${event_content}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_event_id}      ${expected_event_id}
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_study_id}      ${STUDY_ID_COMPLETED}[study_id]
    Close Tab   1       is_post_switch=${True}
    Refresh Page

BFCC-QA-PROCESS-INTERIM-DETAILS-27: Quick access to Event information on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-27      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        bradycardia=${True}
    ${event_reports}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    View Interim Report Event Information On       row=1
    ${event_information}    Get Event Information
    ${expected_event_info}      Create List     Trigger Time    Upload Time     First Opened    Closed Time
    ${actual_event_info}        Evaluate    [k for k, v in ${event_information}[EVENT INFORMATION].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_event_info}      ${actual_event_info}

BFCC-QA-PROCESS-INTERIM-DETAILS-28: Check pagination tool works properly on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-28      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        tachycardia=${True}
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}

BFCC-QA-PROCESS-INTERIM-DETAILS-29: Can use filter button in the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-29      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-30: Manually sort events by Event ID on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-30      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        atrial_fibrillation=${True}
    ${events_report}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events_report}
    # sort descending
    Sort Event Interim Reports     Event ID       desc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${descending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_event_id}
    # sort ascending
    Sort Event Interim Reports     Event Id       asc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${ascending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_event_id}

BFCC-QA-PROCESS-INTERIM-DETAILS-31: Can navigate to the Event Editing page on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-31      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        atrial_fibrillation=${True}
    ${event_reports}     Get Events Interim Report On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    ${event_ids}         Evaluate    [item['Event ID'] for item in ${event_reports}]
    ${expected_event_id}         Evaluate  random.choice(${event_ids})    random
    Edit Event Interim On    event_id=${expected_event_id}
    Switch Tab
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_content}           Get Event Summary
    ${actual_event_id}         Evaluate     "${event_content['EVENT ID'].split('\n')[0]}"
    ${actual_study_id}         Set Variable    ${event_content}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_event_id}      ${expected_event_id}
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_study_id}      ${STUDY_ID_COMPLETED}[study_id]
    Close Tab   1       is_post_switch=${True}
    Refresh Page

BFCC-QA-PROCESS-INTERIM-DETAILS-32: Quick access to Event information on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-32      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        atrial_fibrillation=${True}
    ${event_reports}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    View Interim Report Event Information On       row=1
    ${event_information}    Get Event Information
    ${expected_event_info}      Create List     Trigger Time    Upload Time     First Opened    Closed Time
    ${actual_event_info}        Evaluate    [k for k, v in ${event_information}[EVENT INFORMATION].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_event_info}      ${actual_event_info}

BFCC-QA-PROCESS-INTERIM-DETAILS-33: Check pagination tool works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-33      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        atrial_fibrillation=${True}
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Pagination Reports    next_or_previous=next
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Reports    next_or_previous=previous
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Reports Size Rows    rows=30 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
    Custom Reports Size Rows    rows=50 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}

BFCC-QA-PROCESS-INTERIM-DETAILS-34: Check Open new tab button (Longest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-34      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-35: Check Open new tab button (Fastest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-35      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-36: Check Open new tab button (Slowest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-36      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-37: Can manually update AFib AVG HR on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-37      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        atrial_fibrillation=${True}
    ${expected_calculate}         Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${expected_calculate}
    Filter On Summary Report    calculate_avg_hr=${True}
    Get Image Calculate Interim Report    calculate_avg_hr=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=calculate_avg_hr        image_name_compare=calculate_avg_hr
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-38: Check the Calculate HR button is working properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-38      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-39: Can use filter button in the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-39      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-40: Manually sort events by Event ID on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-40      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        pause=${True}
    ${events_report}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events_report}
    # sort descending
    Sort Event Interim Reports     Event ID       desc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${descending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_event_id}
    # sort ascending
    Sort Event Interim Reports     Event Id       asc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${ascending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_event_id}

BFCC-QA-PROCESS-INTERIM-DETAILS-41: Can navigate to the Event Editing page on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-41      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        pause=${True}
    ${event_reports}     Get Events Interim Report On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    ${event_ids}         Evaluate    [item['Event ID'] for item in ${event_reports}]
    ${expected_event_id}         Evaluate  random.choice(${event_ids})    random
    Edit Event Interim On    event_id=${expected_event_id}
    Switch Tab
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_content}           Get Event Summary
    ${actual_event_id}         Evaluate     "${event_content['EVENT ID'].split('\n')[0]}"
    ${actual_study_id}         Set Variable    ${event_content}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_event_id}      ${expected_event_id}
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_study_id}      ${STUDY_ID_COMPLETED}[study_id]
    Close Tab   1       is_post_switch=${True}
    Refresh Page

BFCC-QA-PROCESS-INTERIM-DETAILS-42: Quick access to Event information on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-42      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        pause=${True}
    ${event_reports}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    View Interim Report Event Information On       row=1
    ${event_information}    Get Event Information
    ${expected_event_info}      Create List     Trigger Time    Upload Time     First Opened    Closed Time
    ${actual_event_info}        Evaluate    [k for k, v in ${event_information}[EVENT INFORMATION].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_event_info}      ${actual_event_info}

BFCC-QA-PROCESS-INTERIM-DETAILS-43: Check pagination tool works properly on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-43      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        pause=${True}
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Pagination Reports    next_or_previous=next
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Reports    next_or_previous=previous
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Reports Size Rows    rows=30 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
    Custom Reports Size Rows    rows=50 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}

BFCC-QA-PROCESS-INTERIM-DETAILS-44: Check Open new tab button (Longest episode) works properly in the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-44      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-45: Can use filter button in the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-45      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-46: Manually sort events by Event ID on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-46     auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        manual=${True}
    ${events_report}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${events_report}
    # sort descending
    Sort Event Interim Reports     Event ID       desc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${descending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_event_id}
    # sort ascending
    Sort Event Interim Reports     Event Id       asc
    ${events_report}     Get Events Interim Report
    ${event_id}       Evaluate    [item['Event ID'] for item in ${events_report}]
    ${ascending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_event_id}

BFCC-QA-PROCESS-INTERIM-DETAILS-47: Can navigate to the Event Editing page on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-47      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        manual=${True}
    ${event_reports}     Get Events Interim Report On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    ${event_ids}         Evaluate    [item['Event ID'] for item in ${event_reports}]
    ${expected_event_id}         Evaluate  random.choice(${event_ids})    random
    Edit Event Interim On    event_id=${expected_event_id}
    Switch Tab
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_content}           Get Event Summary
    ${actual_event_id}         Evaluate     "${event_content['EVENT ID'].split('\n')[0]}"
    ${actual_study_id}         Set Variable    ${event_content}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_event_id}      ${expected_event_id}
    Run Keyword And Continue On Failure    Should Be Equal      ${actual_study_id}      ${STUDY_ID_COMPLETED}[study_id]
    Close Tab   1       is_post_switch=${True}
    Refresh Page

BFCC-QA-PROCESS-INTERIM-DETAILS-48: Quick access to Event information on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-48      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        manual=${True}
    ${event_reports}     Get Events Interim Report
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    View Interim Report Event Information On       row=1
    ${event_information}    Get Event Information
    ${expected_event_info}      Create List     Trigger Time    Upload Time     First Opened    Closed Time
    ${actual_event_info}        Evaluate    [k for k, v in ${event_information}[EVENT INFORMATION].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_event_info}      ${actual_event_info}

BFCC-QA-PROCESS-INTERIM-DETAILS-49: Check pagination tool works properly on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-49      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Report Summary
    Filter On Summary Report        manual=${True}
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Pagination Reports    next_or_previous=next
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Reports    next_or_previous=previous
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Reports Size Rows    rows=30 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
    Custom Reports Size Rows    rows=50 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}

BFCC-QA-PROCESS-INTERIM-DETAILS-50: View details of Strips Selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-50      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    ${strips_selection_detail}         Get Events Interim Strips Selection
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_selection_detail}
    ${actual_header}      Evaluate    [k for k, v in ${strips_selection_detail}[0].items()] + ['Include Strips']
    ${expected_header}      Create List    Event ID   Date/Time   Type Of Event   Symptoms   Heart Rate   Technician Comment   Include In Report   Include Strips
    Run Keyword And Continue On Failure    Lists Should Be Equal        ${expected_header}      ${actual_header}

BFCC-QA-PROCESS-INTERIM-DETAILS-51: View a list of events reports with "All events" option is selected on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-51      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    Filter Event Interim Reports        by_report=Include in report
    ${strips_selection_detail}         Get Events Interim Strips Selection
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_selection_detail}
    ${actual_events_include}        Evaluate    [item['Event ID'].split()[0] for item in ${strips_selection_detail}]
    Filter Event Interim Reports        by_report=Exclude from report
    ${strips_selection_detail}         Get Events Interim Strips Selection
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_selection_detail}
    ${actual_events_exclude}        Evaluate    [item['Event ID'].split()[0] for item in ${strips_selection_detail}]
    Filter Event Interim Reports        by_report=All events
    ${strips_selection_detail}         Get Events Interim Strips Selection
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_selection_detail}
    ${actual_events_all}        Evaluate    [item['Event ID'].split()[0] for item in ${strips_selection_detail}]
    ${actual_events_all}        Evaluate    sorted(${actual_events_all}, key=int, reverse=True)
    # Check if all values in actual_events_include are not in actual_events_exclude
    ${expected_event_reports}      Evaluate    all(value not in ${actual_events_include} for value in ${actual_events_exclude})
    Run Keyword And Continue On Failure    Should Be True    ${expected_event_reports}
    # Check if all values in actual_events_include are in actual_events_all
    ${expected_event_reports}      Evaluate    all(value in ${actual_events_all} for value in ${actual_events_include})
    Run Keyword And Continue On Failure    Should Be True    ${expected_event_reports}
    # check list all
    ${combined_event_reports}     Run Keyword And Continue On Failure     Combine Lists    ${actual_events_include}     ${actual_events_exclude}
    ${combined_event_reports}        Evaluate    sorted(${combined_event_reports}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal        ${actual_events_all}         ${combined_event_reports}

BFCC-QA-PROCESS-INTERIM-DETAILS-52: View a list of events reports with "Include in report" option is selected on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-52      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-53: View a list of events reports with "Exclude from report" option is selected on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-53      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #done

BFCC-QA-PROCESS-INTERIM-DETAILS-54: Can reload the events by using Refresh button on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-54      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    ${refresh_event}     Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${refresh_event}[Refresh Event]

BFCC-QA-PROCESS-INTERIM-DETAILS-55: Can search by Event ID on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-55     auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    ${strips_selection_detail}         Get Events Interim Strips Selection
    Run Keyword And Continue On Failure    Should Not Be Empty    ${strips_selection_detail}
    ${event_ids}        Evaluate    [item['Event ID'] for item in ${strips_selection_detail}]
    ${event_id}         Evaluate  random.choice(${event_ids})    random
    Filter Event Interim Reports        text_search=${event_id}
    ${event_search}         Get Events Interim Strips Selection
    Run Keyword And Continue On Failure    Should Be Equal    ${event_id}       ${event_search}[0][Event ID]

BFCC-QA-PROCESS-INTERIM-DETAILS-56: Can sort the event lists on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-56     auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    # sort descending
    Filter Event Interim Reports        sort_event=desc
    ${events_report}     Get Events Interim Strips Selection
    ${event_id}       Evaluate    [item['Event ID'].split()[0] for item in ${events_report}]
    ${descending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_event_id}
    # sort ascending
    Filter Event Interim Reports        sort_event=asc
    ${events_report}     Get Events Interim Strips Selection
    ${event_id}       Evaluate    [item['Event ID'].split()[0] for item in ${events_report}]
    ${ascending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_event_id}

BFCC-QA-PROCESS-INTERIM-DETAILS-57: Can use filter button on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-57     auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    ${refresh_event}     Check Active Summary Report
    Run Keyword And Continue On Failure    Should Be True    ${refresh_event}[Strips Filter]

BFCC-QA-PROCESS-INTERIM-DETAILS-58: Can navigate to the Event Editing page on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-58      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    Edit Event Interim Strips On    row=1
    Switch Tab
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    Switch Tab   tab_id=0
    Close Tab   0       is_post_switch=${True}

BFCC-QA-PROCESS-INTERIM-DETAILS-59: Quick access to Event information on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-59      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    View Interim Strips Event Information On    row=1
    ${event_information}    Get Event Information
    ${expected_event_info}      Create List     Trigger Time    Upload Time     First Opened    Closed Time
    ${actual_event_info}        Evaluate    [k for k, v in ${event_information}[EVENT INFORMATION].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_event_info}      ${actual_event_info}

BFCC-QA-PROCESS-INTERIM-DETAILS-60: Check View strip button is working properly on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-60      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    View Interim Strips Ecg Information On    row=1
    ${expected_ecg}     Check Strips Container Available
    Run Keyword And Continue On Failure    Should Be True    ${expected_ecg}[Strips Container]

BFCC-QA-PROCESS-INTERIM-DETAILS-61: Check the Include in report checkbox is working properly on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-61      auto
    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
    Navigate To Event Tab      Strips Selection
    ${event_report}         Get Events Interim Strips Selection
    ${include_report}        Evaluate    [item['Include In Report'] for item in ${event_report} if item.get('Type Of Event') == 'Manual']
    ${include_report_2}        Evaluate    [item['Include In Report'] for item in ${event_report} if item.get('Type Of Event') != 'Manual']
    Run Keyword And Continue On Failure    List Should Contain Value    ${include_report}   ${False}
    Run Keyword And Continue On Failure    List Should Contain Value    ${include_report_2}   ${True}
    ${event_id}        Evaluate    [item['Event ID'].split()[0] for item in ${event_report} if item.get('Type Of Event') != 'Manual']
    ${event_id}        Evaluate  random.choice(${event_id})    random
    Filter Event Interim Reports        text_search=${event_id}
    Checkbox Include Report   is_include_report=${False}
    ${value}        Get Value Include Strips
    Run Keyword And Continue On Failure    Should Be Equal    ${value}[Include Strips]      X

BFCC-QA-PROCESS-INTERIM-DETAILS-62: Check the Include Strips checkbox is working properly on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-62      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-DETAILS-63: Check pagination tool works properly on Strip selection tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-63       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Interim Report By Study Id "${STUDY_ID_COMPLETED}[study_id]"
#    Navigate To Event Tab      Strips Selection
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
##    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}

BFCC-QA-PROCESS-INTERIM-DETAILS-64: View details of PDF report tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-64      auto
    Create New Interim Report
    Navigate To Event Tab      PDF Report
    Filter Interim Report    is_dismiss=${True}     is_dismiss_submit=${True}
    Filter Interim Report    is_dismiss=${True}
    Get Image Interim Report Details    pdf_report=${True}
    ${expected_result}           Check Interim Report Summary        image_name_original=pdf_report        image_name_compare=pdf_report
    Run Keyword And Continue On Failure    Should Be True    ${expected_result}

BFCC-QA-PROCESS-INTERIM-DETAILS-65: Can edit the facility notes PDF report on PDF report tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-65     auto
    Create New Interim Report
    Navigate To Event Tab      PDF Report
    Edit Interim Pdf Report    technician_comment=technician comments        facility_note=facility note       is_save=${True}
    Navigate To Interim Report By Study Id "${study_id}"
    Navigate To Event Tab      PDF Report
    ${actual_value}     Get Current Value Interim Pdf Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_value}[Facility Notes]       facility note
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_value}[Technician Comments]       technician comments
    Clear Technician Comments
    Clear Facility Note
    Edit Interim Pdf Report     is_save=${True}
    Refresh Page
    Navigate To Event Tab      PDF Report
    ${actual_value}     Get Current Value Interim Pdf Report
    Run Keyword And Continue On Failure    Should Be Empty    ${actual_value}[Facility Notes]
    Run Keyword And Continue On Failure    Should Be Empty    ${actual_value}[Technician Comments]

BFCC-QA-PROCESS-INTERIM-DETAILS-66: Can edit the Technician comments on PDF report tab for MCT/MCT PEEK studies
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-DETAILS-66      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-GENERATE-01: Can generate a PDF file report on PDF report tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-GENERATE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-GENERATE-02: Can regenerate a PDF file report on PDF report tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-GENERATE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-GENERATE-03: Can upload a PDF report from computer to a report on PDF report tab
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
    ...     Update date: 12/20/2023 - Trinh Nguyen
    ...     Update date: 3/11/2024 - Nhan Nguyen - Remove this feature

    [Tags]      BFCC-QA-PROCESS-INTERIM-GENERATE-03      manual     deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-01: Can set a report status to Ready
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-02: Can assign report to specific user
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
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-03: Marking report as Artifact report
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-04: Send an Interim report to Clinic Inbox
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-05: Email an Interim report to clinic
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-06: Fax an Interim report to clinic
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-07: Recall an Interim report from Clinic inbox
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-08: Dismiss an Interim report
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-08     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-09: Reenable an Interim report
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-09     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-10: Download an Interim report
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-10     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-11: Can view report logs
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
    ...     Update date: 12/21/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-11     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-12: View details and format for the Interim report (Cardiac Event/ Holter/Extended Holter)
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-12     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-13: View details and format for the Interim report (MCT/ MCT Peek)
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-13     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-QA-PROCESS-INTERIM-REPORT-14: Can lock a summary report so that won’t be processed by more than one user at the same time
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
    ...     Update date: 12/20/2023 - Trinh Nguyen

    [Tags]      BFCC-QA-PROCESS-INTERIM-REPORT-14     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/StudyManagement.py   ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${STUDY_ID}          Get Config Param    STUDY_ID
    ${STUDY_ID_COMPLETED}   Set Variable        ${STUDY_ID}[study_id_completed]
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_qa]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Navigate to report screen has the notification reports with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports

Create new interim report
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${STUDY_ID_COMPLETED}[study_id_mct]
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    Create Interim Report
    Refresh Page
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    ${report_id}         Evaluate        "${interim_report['REPORT ID'].split('\n')[0]}"
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}

Navigate to interim report by study id "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    ${reports_id}        Evaluate    [item['Report ID'] for item in ${study_report} if item.get('Type') == 'Interim']
    ${report_id}        Evaluate    random.choice(${reports_id})    random
    Filter Study Reports    by_report=Summary reports      text_search=${report_id}
    Edit Report On      row=1
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}
