*** Settings ***
Documentation   Test Suite - Call Center Technician Portal - Process EOU Reports
Metadata    sid     BFCC-TECH-PROCESS-EOU
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-TECH-PROCESS-EOU   web
Test Timeout    1h

*** Test Cases ***
BFCC-TECH-PROCESS-EOU-CREATE-01: Create an EOU report for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-CREATE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-CREATE-02: Create an EOU report in selected timeframe does not have any available for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-CREATE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-CREATE-03: Create an EOU report for Cardiac/Holter/Extended Holter studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-CREATE-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-CREATE-04: Create an EOU report in selected timeframe does not have any available for Cardiac/Holter/Extended Holter studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-CREATE-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-01: View details of Report summary tab on the new EOU report editing page of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-02: View details of Report summary tab on the new EOU report editing page of Cardiac/Holter/Extended Holter studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-03: View details of Test summary sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-04: View details of Tachycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-05: View details of Bradycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-06: View details of Atrial Fibrillation sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-07: View details of Pause sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-08: View details of Manual sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-09: Can refresh the Test summary sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-10: Can refresh the Tachycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-11: Can refresh the Bradycardia sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-12: Can refresh the AFib Fibrillation sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-13: Can refresh the Pause sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-14: Can refresh the Manual sub-tab on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-15: Can enter value on Min/AVG/Max HR on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-16: Can recalculate the values of the heart rate parameters on Report summary tab of MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-17: Can use filter button in the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-18: Manually sort events by Event ID on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-18      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-19: Can navigate to the Event Editing page on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-19      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-20: Quick access to Event information on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-20      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-21: Check pagination tool works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-21      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-22: Check Open new tab button (Longest episode) works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-22      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-23: Check Open new tab button (Fastest heart rate) works properly on the Tachycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-23      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-24: Can use filter button in the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-24      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-25: Manually sort events by Event ID on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-25      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-26: Can navigate to the Event Editing page on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-26      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-27: Quick access to Event information on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-27      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-28: Check pagination tool works properly on the Bradycardia sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-28      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-29: Can use filter button in the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-29      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-30: Manually sort events by Event ID on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-30      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-31: Can navigate to the Event Editing page on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-31      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-32: Quick access to Event information on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-32      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-33: Check pagination tool works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-33      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-34: Check Open new tab button (Longest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-34      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-35: Check Open new tab button (Fastest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-35      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-36: Check Open new tab button (Slowest episode) works properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-36      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-37: Can manually update AFib AVG HR on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-37      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-38: Check the Calculate HR button is working properly on the Atrial Fibrillation sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-38      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-39: Can use filter button in the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-39      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-40: Manually sort events by Event ID on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-40      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-41: Can navigate to the Event Editing page on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-41      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-42: Quick access to Event information on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-42      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-43: Check pagination tool works properly on the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-43      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-44: Check Open new tab button (Longest episode) works properly in the Pause sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-44      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-45: Can use filter button in the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-45      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-46: Manually sort events by Event ID on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-46      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-47: Can navigate to the Event Editing page on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-47      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-48: Quick access to Event information on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-48      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-49: Check pagination tool works properly on the Manual sub-tab of Report summary tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-49      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-50: View details of Strips Selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-50      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-51: View a list of events reports with "All events" option is selected on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-51      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-52: View a list of events reports with "Include in report" option is selected on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-52      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-53: View a list of events reports with "Exclude from report" option is selected on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-53      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-54: Can reload the events by using Refresh button on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-54      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-55: Can search by Event ID on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-55     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-56: Can sort the event lists on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-56     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-57: Can use filter button on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-57     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-58: Can navigate to the Event Editing page on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-58      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-59: Quick access to Event information on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-59      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-60: Check View strip button is working properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-60      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-61: Check the Include in report checkbox is working properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-61      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-62: Check the Include Strips checkbox is working properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-62      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-63: Check pagination tool works properly on Strip selection tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-63      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-64: View details of PDF report tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-64      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-65: Can edit the facility notes PDF report on PDF report tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-65      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-DETAILS-66: Can edit the Technician comments on PDF report tab for MCT/MCT PEEK studies
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

    [Tags]      BFCC-TECH-PROCESS-EOU-DETAILS-66      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-GENERATE-01: Can generate a PDF file report on PDF report tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-GENERATE-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-GENERATE-02: Can regenerate a PDF file report on PDF report tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-GENERATE-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-GENERATE-03: Can upload a PDF report from computer to a report on PDF report tab
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

    [Tags]      BFCC-TECH-PROCESS-EOU-GENERATE-03      manual     deactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-REPORT-01: Can set a report status to Ready
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

    [Tags]      BFCC-TECH-PROCESS-EOU-REPORT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-REPORT-02: Marking report as Artifact report
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

    [Tags]      BFCC-TECH-PROCESS-EOU-REPORT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-REPORT-03: Download an EOU report
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

    [Tags]      BFCC-TECH-PROCESS-EOU-REPORT-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-REPORT-04: Can view report logs
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

    [Tags]      BFCC-TECH-PROCESS-EOU-REPORT-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-REPORT-05: View details and format for the EOU report (Cardiac Event/ Holter/Extended Holter)
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

    [Tags]      BFCC-TECH-PROCESS-EOU-REPORT-05     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-REPORT-06: View details and format for the EOU report (MCT/ MCT Peek)
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

    [Tags]      BFCC-TECH-PROCESS-EOU-REPORT-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-PROCESS-EOU-REPORT-07: Can lock a summary report so that won’t be processed by more than one user at the same time
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

    [Tags]      BFCC-TECH-PROCESS-EOU-REPORT-07     manual
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
