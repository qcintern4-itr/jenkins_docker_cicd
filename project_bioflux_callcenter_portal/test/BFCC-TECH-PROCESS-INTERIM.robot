*** Settings ***
Documentation   Test Suite - Call Center Technician Portal - Process Interim Reports
Metadata    sid     BFCC-TECH-PROCESS-INTERIM
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-TECH-PROCESS-INTERIM   web
Test Timeout    1h

*** Test Cases ***
BFCC-TECH-PROCESS-INTERIM-CREATE-01: Create Interim Report–No Existing Report
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

    [Tags]  BFCC-TECH-PROCESS-INTERIM-CREATE-01     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-CREATE-02: Create Interim Report–Overlapping Time Frame (No New Data Uploaded) and The previous report is generated
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

    [Tags]  BFCC-TECH-PROCESS-INTERIM-CREATE-02     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-CREATE-03: Create Interim Report–Overlapping Time Frame (No New Data Uploaded) and The previous report is generating
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

    [Tags]  BFCC-TECH-PROCESS-INTERIM-CREATE-03     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-CREATE-04: Create Interim Report–Overlapping Time Frame (New Data Uploaded)
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

    [Tags]  BFCC-TECH-PROCESS-INTERIM-CREATE-04     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-CREATE-05: Create Interim Report-Ensure unavailable dates are greyed out and unselectable
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

    [Tags]  BFCC-TECH-PROCESS-INTERIM-CREATE-05     manual    CP-2.29.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BFCC-TECH-PROCESS-INTERIM-DETAILS-01: View details of Report summary tab on the new Interim report editing page of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-02: View details of Report summary tab on the new Interim report editing page of Cardiac/Holter/Extended Holter studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-03: View details of Test summary sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-04: View details of Tachycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-05: View details of Bradycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-06: View details of Atrial Fibrillation sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-07: View details of Pause sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-08: View details of Manual sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-09: Can refresh the Test summary sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-10: Can refresh the Tachycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-11: Can refresh the Bradycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-12: Can refresh the AFib Fibrillation sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-13: Can refresh the Pause sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-14: Can refresh the Manual sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-15: Can enter value on Min/AVG/Max HR on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-16: Can recalculate the values of the heart rate parameters on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-17: Can use filter button in the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-18: Manually sort events by Event ID on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-18      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-19: Can navigate to the Event Editing page on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-19      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-20: Quick access to Event information on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-20      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-21: Check pagination tool works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-21      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-22: Check Open new tab button (Longest episode) works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-22      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-23: Check Open new tab button (Fastest heart rate) works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-23      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-24: Can use filter button in the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-24      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-25: Manually sort events by Event ID on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-25      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-26: Can navigate to the Event Editing page on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-26      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-27: Quick access to Event information on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-27      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-28: Check pagination tool works properly on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-28      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-29: Can use filter button in the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-29      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-30: Manually sort events by Event ID on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-30      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-31: Can navigate to the Event Editing page on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-31      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-32: Quick access to Event information on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-32      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-33: Check pagination tool works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-33      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-34: Check Open new tab button (Longest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-34      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-35: Check Open new tab button (Fastest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-35      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-36: Check Open new tab button (Slowest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-36      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-37: Can manually update AFib AVG HR on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-37      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-38: Check the Calculate HR button is working properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-38      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-39: Can use filter button in the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-39      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-40: Manually sort events by Event ID on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-40      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-41: Can navigate to the Event Editing page on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-41      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-42: Quick access to Event information on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-42      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-43: Check pagination tool works properly on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-43      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-44: Check Open new tab button (Longest episode) works properly in the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-44      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-45: Can use filter button in the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-45      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-46: Manually sort events by Event ID on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-46      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-47: Can navigate to the Event Editing page on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-47      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-48: Quick access to Event information on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-48      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-49: Check pagination tool works properly on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-49      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-50: View details of Strips Selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-50      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-51: View a list of events reports with "All events" option is selected on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-51      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-52: View a list of events reports with "Include in report" option is selected on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-52      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-53: View a list of events reports with "Exclude from report" option is selected on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-53      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-54: Can reload the events by using Refresh button on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-54      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-55: Can search by Event ID on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-55     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-56: Can sort the event lists on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-56     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-57: Can use filter button on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-57     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-58: Can navigate to the Event Editing page on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-58      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-59: Quick access to Event information on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-59      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-60: Check View strip button is working properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-60      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-61: Check the Include in report checkbox is working properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-61      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-62: Check the Include Strips checkbox is working properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-62      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-63: Check pagination tool works properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-63      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-64: View details of PDF report tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-64      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-65: Can edit the facility notes PDF report on PDF report tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-65      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-DETAILS-66: Can edit the Technician comments on PDF report tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-DETAILS-66      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-GENERATE-01: Can generate a PDF file report on PDF report tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-GENERATE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-GENERATE-02: Can regenerate a PDF file report on PDF report tab
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-GENERATE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-GENERATE-03: Can upload a PDF report from computer to a report on PDF report tab
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
    ...     Update date: 3/11/2024 - Nhan Nguyen - Remove this feature

    [Tags]      BFCC-TECH-PROCESS-INTERIM-GENERATE-03      manual     deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-REPORT-01: Can set a report status to Ready
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-REPORT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-REPORT-02: Marking report as Artifact report
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-REPORT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-REPORT-03: Download an Interim report
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-REPORT-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-REPORT-04: Can view report logs
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-REPORT-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-REPORT-05: View details and format for the Interim report (Cardiac Event/ Holter/Extended Holter)
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-REPORT-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-REPORT-06: View details and format for the Interim report (MCT/ MCT Peek)
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-REPORT-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-INTERIM-REPORT-07: Can lock a summary report so that won’t be processed by more than one user at the same time
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

    [Tags]      BFCC-TECH-PROCESS-INTERIM-REPORT-07     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
