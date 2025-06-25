*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-STATISTIC
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
Force Tags      BFCC-AIRP-PDF-REPORT-STATISTIC  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-01: Verify the total test duration is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Number of Days and Time

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
##in the first view: la study moi chay va stop xong, user vao view data lien (ko co edit gi truoc do)

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-02: Verify the Analysis time is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total Time Monitored - Number of Days and Time

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-02       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-03: Verify the Auto-triggers is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-03       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-04: Verify the Auto-triggers is displayed correctly with Brady event closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-05: Verify the Auto-triggers is displayed correctly with Tachy event closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-05       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-06: Verify the Auto-triggers is displayed correctly with AFib event closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-07: Verify the Auto-triggers is displayed correctly with Pause event closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-07       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-08: Verify the Auto-triggers is displayed correctly with Auto event closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-08       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-09: Verify the Auto-triggers is displayed correctly with Sinus event closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-09       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-10: Verify the Auto-triggers is displayed correctly with Brady event closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-10       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-11: Verify the Auto-triggers is displayed correctly with Tachy event closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-11       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-12: Verify the Auto-triggers is displayed correctly with AFib event closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-12       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-13: Verify the Auto-triggers is displayed correctly with Pause event closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-14: Verify the Auto-triggers is displayed correctly with Auto event closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-14       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-15: Verify the Auto-triggers is displayed correctly with Sinus event closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-15       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-16: Verify the Brady event is not counted on the Auto-triggers if closed as Valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-16       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-17: Verify the Brady event is not counted on the Auto-triggers if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-17       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-18: Verify the Tachy event is not counted on the Auto-triggers if closed as Valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-18       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-19: Verify the Tachy event is not counted on the Auto-triggers if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-19       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-20: Verify the AFib event is not counted on the Auto-triggers if closed as Valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-20       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-21: Verify the AFib event is not counted on the Auto-triggers if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-21       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-22: Verify the Pause event is not counted on the Auto-triggers if closed as Valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-22       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-23: Verify the Pause event is not counted on the Auto-triggers if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-23       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-24: Verify the Auto event is not counted on the Auto-triggers if closed as Valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-24       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-25: Verify the Auto event is not counted on the Auto-triggers if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-25       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-26: Verify the Sinus event is not counted on the Auto-triggers if closed as Valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-26       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-27: Verify the Sinus event is not counted on the Auto-triggers if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of auto events that have been closed and included in the report, triggered by the Bioflux device during the report duration
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-27       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-28: Verify the Manual events is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-28       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-29: Verify the manual events is displayed correctly with symptom 'Baseline' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-29       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-30: Verify the manual events is displayed correctly with symptom 'Resume Study' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-30       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-31: Verify the manual events is displayed correctly with symptom 'Evaluation strip' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-31       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-32: Verify the manual events is displayed correctly with symptom 'Palpitations' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-32       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-33: Verify the manual events is displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-33       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-34: Verify the manual events is displayed correctly with symptom 'Dizziness' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-34       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-35: Verify the manual events is displayed correctly with symptom 'Chest Pain' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-35       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-36: Verify the manual events is displayed correctly with symptom 'Other' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-36       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-37: Verify the manual events is displayed correctly with symptom 'Not Specified' closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-37       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-38: Verify the manual events is displayed correctly with symptom 'Baseline' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-38       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-39: Verify the manual events is displayed correctly with symptom 'Resume Study' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-39       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-40: Verify the manual events is displayed correctly with symptom 'Palpitations' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-40       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-41: Verify the manual events is displayed correctly with symptom 'Palpitations' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-41       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-42: Verify the manual events is displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-42       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-43: Verify the manual events is displayed correctly with symptom 'Dizziness' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-43       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-44: Verify the manual events is displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-44       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-45: Verify the manual events is displayed correctly with symptom 'Other' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-45       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-46: Verify the manual events is displayed correctly with symptom 'Not Specified' closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-46       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-47: Verify the symptom 'Baseline' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-47       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-48: Verify the symptom 'Baseline' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-48       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-49: Verify the symptom 'Resume study' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-49       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-50: Verify the symptom 'Resume study' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-50       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-51: Verify the symptom 'Evaluation strip' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-51       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-52: Verify the symptom 'Evaluation strip' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-52       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-53: Verify the symptom 'Palpitations' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-53       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-54: Verify the symptom 'Palpitations' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-54       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-55: Verify the symptom 'Dizziness' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-55       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-56: Verify the symptom 'Shortness of breath' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-56       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-57: Verify the symptom 'Dizziness' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-57       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-58: Verify the symptom 'Dizziness' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-58       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-59: Verify the symptom 'Chest Pain' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-59       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-60: Verify the symptom 'Chest Pain' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-60       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-61: Verify the symptom 'Other' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-61       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-62: Verify the symptom 'Other' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-62       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-63: Verify the symptom 'Not Specified' is not counted on the Manual events if closed as valid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-63       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-64: Verify the symptom 'Not Specified' is not counted on the Manual events if closed as Invalid and not included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the number of events for which 'Include in report' is enabled
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-64       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-65: Verify the Correlated events is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-65       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-66: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-66       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-67: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-67       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-68: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-68       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-69: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-69       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-70: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-70       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-71: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-71       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-72: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-72       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-73: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-73       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-74: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-74       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-75: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-75       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-76: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-76       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-77: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-77       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-78: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-78       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-79: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-79       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-80: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-80       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-81: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-81       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-82: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-82       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-83: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-83       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-84: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-84       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-85: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-85       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-86: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-86       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-87: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-87       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-88: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-88       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-89: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-89       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-90: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-90       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-91: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-91       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-92: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-92       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-93: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-93       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-94: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-94       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-95: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-95       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-96: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-96       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-97: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-97       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-98: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-98       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-99: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-99       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-100: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-100       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-101: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-101       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-102: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-102       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-103: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-103       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-104: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-104       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-105: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-105       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-106: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-106       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-107: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-107       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-108: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-108       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-109: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-109       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-110: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-110       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-111: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-111       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-112: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-112       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-113: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-113       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-114: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-114       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-115: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-115       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-116: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-116       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-117: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-117       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-118: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-118       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-119: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-119       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-120: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-120       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-121: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-121       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-122: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-122       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-123: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-123       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-124: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-124       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-125: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-125       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-126: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-126       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-127: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-127       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-128: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-128       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-129: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-129       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-130: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-130       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-131: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-131       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-132: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-132       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-133: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-133       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-134: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-134       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-135: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-135       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-136: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-136       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-137: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-137       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-138: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-138       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-139: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-139       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-140: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-140       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-141: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-141       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-142: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-142       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-143: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-143       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-144: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-144       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-145: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-145       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-146: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-146       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-147: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-147       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-148: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-148       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-149: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-149       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-150: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-150       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-151: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-151       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-152: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-152       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-153: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-153       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-154: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-154       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-155: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-155       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-156: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-156       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-157: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-157       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-158: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-158       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-159: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-159       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-160: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-160       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-161: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-161       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-162: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-162       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-163: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-163       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-164: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-164       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-165: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-165       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-166: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-166       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-167: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-167       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-168: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-168       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-169: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-169       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-170: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-170       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-171: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-171       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-172: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-172       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-173: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-173       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-175: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-175       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-176: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-176       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-177: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-177       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-178: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-178       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-179: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-179       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-180: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-180       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-181: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-181       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-182: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-182       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-183: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-183       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-184: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-184       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-185: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-185       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-186: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-186       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-187: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-187       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-188: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-188       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-189: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-189       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-190: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-190       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-191: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-191       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-192: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-192       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-193: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-193       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-194: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-194       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-195: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-195       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-196: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-196       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-197: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-197       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-198: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-198       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-199: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-199       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-200: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-200       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-201: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-201       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-202: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-202       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-203: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-203       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-204: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-204       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-205: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-205       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-206: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-206       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-208: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-208       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-209: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-209       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-210: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-210       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-211: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-211       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-212: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-212       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-213: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-213       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-214: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-214       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-215: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-215       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-216: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-216       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-217: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-217       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-218: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-218       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-219: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-219       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-220: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-220       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-221: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-221       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-222: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-222       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-223: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-223       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-224: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-224       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-225: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-225       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-226: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-226       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-227: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-227       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-228: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-228       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-229: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-229       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-230: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-230       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-231: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-231       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-232: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-232       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-233: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-233       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-234: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-234       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-235: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-235       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-236: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-236       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-237: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-237       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-238: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-238       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-239: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-239       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-240: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-240       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-241: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-241       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-242: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-242       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-243: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-243      AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-244: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-244       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-245: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-245       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-246: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-246       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-247: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-247       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-248: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-248       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-249: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-249       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-250: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-250       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-251: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-251       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-252: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-252       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-253: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-253       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-254: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-254       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-255: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-255       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-256: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-256       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-257: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-257       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-258: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-258       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-259: Verify the Correlated events are displayed correctly with symptom 'Palpitations ' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-259       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-260: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-260       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-261: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-261       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-262: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-262       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-263: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-263       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-264: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-264       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-265: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-265       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-266: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-266       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-267: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-267       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-268: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-268       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-269: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-269       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-270: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-270       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-271: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-271       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-272: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-272       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-273: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-273       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-274: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-274       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-275: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-275       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-276: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-276       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-277: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-277       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-278: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-278       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-279: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-279       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-280: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-280       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-281: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-281       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-282: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-282       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-283: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-283       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-284: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-284       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-285: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-285       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-286: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-286       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-287: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-287       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-288: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-288       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-289: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-289       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-290: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-290       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-291: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-291       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-292: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-292       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-293: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-293       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-294: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-294       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-295: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-295       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-296: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-296       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-297: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-297       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-298: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-298       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-299: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-299       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-300: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-300       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-301: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-301       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-302: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-302       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-303: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-303       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-304: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-304       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-305: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-305       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-306: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-306       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-307: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-307       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-308: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-308       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-309: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-309       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-310: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-310       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-311: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-311       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-312: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-312       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-313: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-313       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-314: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-314       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-315: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-315       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-316: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-316       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-317: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-317       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-318: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-318       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-319: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-319       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-320: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-320       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-321: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-321       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-322: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-322       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-323: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-323       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-324: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-324       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-325: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-325       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-326: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-326       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-327: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-327       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-328: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-328       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-329: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-329       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-330: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-330       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-331: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-331       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-332: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-332       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-333: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-333       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-334: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-334       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-335: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-335       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-336: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-336       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-337: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-337       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-338: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-338       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-339: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-339       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-340: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-340       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-341: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-341       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-342: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-342       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-343: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-343       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-344: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-344       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-345: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-345       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-346: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-346       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-347: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-347       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-348: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-348       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-349: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-349       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-350: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-350       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-351: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-351       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-352: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-352       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-353: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-353       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-354: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-354       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-355: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-355       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-356: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-356       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-357: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-357       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-358: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-358       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-359: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-359       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-360: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-360       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-361: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-361       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-362: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-362       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-363: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-363       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-364: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-364       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-365: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-365       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-366: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-366       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-367: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-367       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-368: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-368       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-369: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-369       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-370: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-370       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-371: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-371       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-372: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-372       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-373: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-373       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-374: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-374       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-375: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-375       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-376: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-376       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-377: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-377       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-378: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-378       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-379: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-379       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-380: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-380       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-381: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-381       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-382: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-382       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-383: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-383       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-384: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-384       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-385: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-385       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-386: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-386       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-387: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-387       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-388: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-388       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-389: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-389       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-390: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-390       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-391: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-391       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-392: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-392       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-393: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-393       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-394: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-394       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-395: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-395       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-396: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-396       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-397: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-397       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-398: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-398       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-399: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-399       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-400: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-400       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-401: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-401       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-402: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-402       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-403: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-403       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-404: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-404       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-405: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-405       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-406: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-406       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-407: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-407       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-408: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-408       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-409: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-409       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-410: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-410       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-411: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-411       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-412: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-412       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-413: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-413       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-414: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-414       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-415: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-415       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-416: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-416       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-417: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-417       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-418: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-418       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-419: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-419       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-420: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-420       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-421: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-421       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-422: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-422       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-423: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-423       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-424: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-424       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-425: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-425       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-426: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-426       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-427: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-427       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-428: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-428       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-429: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-429       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-430: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-430       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-431: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-431       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-432: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-432       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-433: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-433       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-434: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-434       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-435: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-435       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-436: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-436       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-437: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-437       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-438: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-438       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-439: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-439       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-440: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-440       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-441: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-441       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-442: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-442       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-443: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-443       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-444: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-444       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-445: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-445       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-446: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-446       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-447: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-447       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-448: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-448       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-449: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-449       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-450: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-450       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-451: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-451       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-452: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-452       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-453: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-453       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-454: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-454       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-455: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-455       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-456: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-456       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-457: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-457       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-458: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-458       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-459: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-459       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-460: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-460       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-461: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-461       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-462: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-462       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-463: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-463       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-464: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-464       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-465: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-465       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-466: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-466       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-467: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-467       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-468: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-468       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-469: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-469       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-470: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-470       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-471: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-471       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-472: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-472       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-473: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-473       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-474: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-474       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-475: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-475       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-476: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-476       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-477: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-477       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-478: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-478       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-479: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-479       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-480: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-480       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-481: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-481       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-482: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-482       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-483: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-483       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-484: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-484       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-485: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-485       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-486: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-486       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-487: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-487       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-488: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-488       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-489: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-489       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-490: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-490       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-491: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-491       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-492: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-492       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-493: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-493       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-494: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-494       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-495: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-495       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-496: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-496       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-497: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-497       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-498: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-498       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-499: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-499       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-504: Verify the symptom 'Baseline' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-504       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-505: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-505       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-506: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-506       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-507: Verify the symptom 'Baseline' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-507       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-508: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-508       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-509: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-509       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-510: Verify the symptom 'Resume study' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-510       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-511: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-511       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-512: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-512       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-513: Verify the symptom 'Resume study' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-513       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-514: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-514       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-515: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-515       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-516: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-516       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-517: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-517       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-518: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-518       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-519: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-519       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-520: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-520       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-521: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-521       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-522: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-522       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-523: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-523       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-524: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-524       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-525: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-525       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-526: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-526       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-527: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-527       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-528: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-528       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-529: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-529       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-530: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-530       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-531: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-531       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-532: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-532       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-533: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-533       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-534: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-534       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-535: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-535       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-536: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-536       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-537: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-537       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-538: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-538       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-539: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-539       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-540: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-540       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-541: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-541       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-542: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-542      AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-543: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-543       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-544: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-544       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-545: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-545       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-546: Verify the symptom 'Other' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-546       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-547: Verify the symptom 'Other' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-547       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-548: Verify the symptom 'Other' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-548       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-549: Verify the symptom 'Other' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-549       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-550: Verify the symptom 'Other' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-550       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-551: Verify the symptom 'Other' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-551       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-552: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-552       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-553: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-553       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-554: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-554       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-555: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-555       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-556: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-556       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-557: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-557       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-558: Verify the Physician notified is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of notification reports and event report sent to clinic in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-558       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-559: Verify the Physician notified is displayed correctly if the notification report has Sent status
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of notification reports and event report sent to clinic in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-559       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-560: Verify the notification report is not counted on the Physician notified if it has Ready status
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of notification reports and event report sent to clinic in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-560       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-561: Verify the notification report is not counted on the Physician notified if the call center recall the notification report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of notification reports and event report sent to clinic in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-561       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-562: Verify the Physician notified is displayed correctly if the event report has Sent status
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of notification reports and event report sent to clinic in the duration of the report
    ...
    ...     **Others**
    ...     Update Date: 8/1/2024 - Trinh Nguyen
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-562       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-563: Verify the event report is not counted on the Physician notified if it has Ready status
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of notification reports and event report sent to clinic in the duration of the report
    ...
    ...     **Others**
    ...     Update Date: 8/1/2024 - Trinh Nguyen
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-563       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-564: Verify the event report is not counted on the Physician notified if the call center recall the event report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of notification reports and event report sent to clinic in the duration of the report
    ...
    ...     **Others**
    ...     Update Date: 8/1/2024 - Trinh Nguyen
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SUMMARY-564       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-01: Verify the value on the Bradycardia section is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-02: Verify the value on the Bradycardia section is updated after adding new Brady events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-02       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] + 1
    Add New "Brady" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
    Delete The "Brady" Event On ECG Events
#    [Teardown]     Run Keywords    Stop Processing
#    ...     AND     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-03: Verify the value on the Bradycardia section is updated after marking Brady events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-03       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] - 1
    Mark The "Brady" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-04: Verify the value on the Bradycardia section is updated after deleting Brady events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-04       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] - 1
    Delete The "Brady" Event On ECG Events By Button
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-05: Verify the value on the Bradycardia section is updated after changing Brady events type to AFib event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-05       AIRP-1.13.0      auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] - 1
    Change "Brady" Event To "AFib" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-06: Verify the value on the Bradycardia section is updated after changing Brady events type to VT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-06       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] - 1
    Change "Brady" Event To "VT" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-07: Verify the value on the Bradycardia section is updated after changing Brady events type to SVT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-07       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] - 1
    Change "Brady" Event To "SVT" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-08: Verify the value on the Bradycardia section is updated after changing Brady events type to 2nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-08       AIRP-1.13.0      auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] - 1
    Change "Brady" Event To "2nd Deg HB" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-09: Verify the value on the Bradycardia section is updated after changing Brady events type to 3nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-09       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes] - 1
    Change "Brady" Event To "3nd Deg HB" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-10: Verify the value on the Bradycardia section is updated after changing Brady events duration
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-10       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_brady}      Evaluate    ${actual_test_summary}[brady_total_episodes]
    Change "Brady" Event Duration On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_brady}      Evaluate    int(${test_summary}[brady_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_brady}        ${actual_total_brady}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-11: Verify the value on the Bradycardia section is updated after deleting all Brady events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-11       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-12: Verify the value on the Bradycardia section is updated after marking all Brady events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-12       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-13: Verify the value on the Bradycardia section is updated after adding new Artifact event override the Brady event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Bradycardia events
    ...     2. Total duration: total duration of all Bradycardia events, burden of Brady event’s duration
    ...     3. Longest episode: the longest Bradycardia event and its onset time
    ...     4. Slowest heart rate: Brady's slowest heart rate is the slowest among the average HR of all Brady events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-13       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-01: Verify the value on the Tachycardia section is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-01       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-02: Verify the value on the Tachycardia section is updated after adding new Tachy events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-02       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] + 1
    Add New "Tachy" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
    Delete The "Tachy" Event On ECG Events
#    [Teardown]     Run Keywords    Stop Processing
#    ...     AND     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-03: Verify the value on the Tachycardia section is updated after marking Tachy events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-03       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] - 1
    Mark The "Tachy" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-04: Verify the value on the Tachycardia section is updated after deleting Tachy events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-04       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] - 1
    Delete The "Tachy" Event On ECG Events By Button
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-05: Verify the value on the Tachycardia section is updated after changing Tachy events type to AFib event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-05       AIRP-1.13.0      auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] - 1
    Change "Tachy" Event To "AFib" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-06: Verify the value on the Tachycardia section is updated after changing Tachy events type to VT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-06       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] - 1
    Change "Tachy" Event To "VT" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-07: Verify the value on the Tachycardia section is updated after changing Tachy events type to SVT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-07       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] - 1
    Change "Tachy" Event To "SVT" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-08: Verify the value on the Tachycardia section is updated after changing Tachy events type to 2nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-08       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] - 1
    Change "Tachy" Event To "2nd Deg HB" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-09: Verify the value on the Tachycardia section is updated after changing Tachy events type to 3nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-09       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes] - 1
    Change "Tachy" Event To "3nd Deg HB" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-10: Verify the value on the Tachycardia section is updated after changing Tachy events duration
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-10       AIRP-1.13.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_tachy}      Evaluate    ${actual_test_summary}[tachy_total_episodes]
    Change "Tachy" Event Duration On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_tachy}      Evaluate    int(${test_summary}[tachy_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_tachy}        ${actual_total_tachy}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-11: Verify the value on the Tachycardia section is updated after deleting all Tachy events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-11       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-12: Verify the value on the Tachycardia section is updated after marking all Tachy events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-12       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-13: Verify the value on the Tachycardia section is updated after adding new Artifact event override Tachy event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total number of all Tachycardia events
    ...     2. Total duration: total duration of all Tachycardia events, burden of Tachy event’s duration
    ...     3. Longest episode: the longest Tachycardia event and its onset time
    ...     4. Fastest heart rate: Tachy's fastest heart rate is the highest among the average HR of all Tachy events and the time it happened
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-13       AIRP-1.13.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-01: Verify the value on the Pause section is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total Pause events
    ...     2. Longest episode: the longest Pause event and its onset time
    ...     3. Shortest episode: the shortest Pause event and its onset time
    ...     4. Pause percentage: total burden (%) of all Pause events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-02: Verify the value on the Pause section is updated after adding new Pause events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total Pause events
    ...     2. Longest episode: the longest Pause event and its onset time
    ...     3. Shortest episode: the shortest Pause event and its onset time
    ...     4. Pause percentage: total burden (%) of all Pause events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-02       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_pause}      Evaluate    ${actual_test_summary}[pause_total_episodes] + 1
    Add New "Pause" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_pause}      Evaluate    int(${test_summary}[pause_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_pause}        ${actual_total_pause}
    Delete The "Pause" Event On ECG Events
#    [Teardown]     Run Keywords    Stop Processing
#    ...     AND     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-03: Verify the value on the Pause section is updated after marking Pause events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total Pause events
    ...     2. Longest episode: the longest Pause event and its onset time
    ...     3. Shortest episode: the shortest Pause event and its onset time
    ...     4. Pause percentage: total burden (%) of all Pause events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-03       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_pause}      Evaluate    ${actual_test_summary}[pause_total_episodes] - 1
    Mark The "Pause" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_pause}      Evaluate    int(${test_summary}[pause_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_pause}        ${actual_total_pause}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-04: Verify the value on the Pause section is updated after deleting Pause events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total Pause events
    ...     2. Longest episode: the longest Pause event and its onset time
    ...     3. Shortest episode: the shortest Pause event and its onset time
    ...     4. Pause percentage: total burden (%) of all Pause events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-04       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_pause}      Evaluate    ${actual_test_summary}[pause_total_episodes] - 1
    Delete The "Pause" Event On ECG Events By Button
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_pause}      Evaluate    int(${test_summary}[pause_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_pause}        ${actual_total_pause}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-05: Verify the value on the Pause section is updated after changing Pause events duration
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total Pause events
    ...     2. Longest episode: the longest Pause event and its onset time
    ...     3. Shortest episode: the shortest Pause event and its onset time
    ...     4. Pause percentage: total burden (%) of all Pause events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-05       AIRP-1.9.0      auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${actual_test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${actual_total_pause}      Evaluate    ${actual_test_summary}[pause_total_episodes]
    Change "Pause" Event Duration On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=2
    ${test_summary}     Get Value In Summary File Pdf    data_pdf=${data}
    ${expected_total_pause}      Evaluate    int(${test_summary}[pause_total_episodes])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_total_pause}        ${actual_total_pause}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-06: Verify the value on the Pause section is updated after deleting all Pause events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total Pause events
    ...     2. Longest episode: the longest Pause event and its onset time
    ...     3. Shortest episode: the shortest Pause event and its onset time
    ...     4. Pause percentage: total burden (%) of all Pause events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-07: Verify the value on the Pause section is updated after marking all Tachy events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total episodes: total Pause events
    ...     2. Longest episode: the longest Pause event and its onset time
    ...     3. Shortest episode: the shortest Pause event and its onset time
    ...     4. Pause percentage: total burden (%) of all Pause events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-07       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-01: Verify the value on the Atrial Fibrillation (AFib) section is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-02: Verify the value on the AFib Fibrillation (AFib) section is updated after adding new AFib events in Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-02       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-03: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to VT event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-03       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-04: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to SVT event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-04       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-05: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to 2nd Deg HB event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-05       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-06: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to 3rd Deg HB event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-06       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-07: Verify the value on the AFib Fibrillation (AFib) section is updated after deleting AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-07       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-08: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events duration on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-08       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-09: Verify the value on the AFib Fibrillation (AFib) section is updated after marking AFib events as artifact on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-09       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-10: Verify the value on the AFib Fibrillation (AFib) section is updated after deleting all AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-10       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-11: Verify the value on the AFib Fibrillation (AFib) section is updated after marking all AFib events as artifact on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-11       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-12: Verify the value on the AFib Fibrillation (AFib) section is updated after adding artifact override AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-12       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-13: Verify the value on the AFib Fibrillation (AFib) section is updated after adding new AFib events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-13       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-14: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-14       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-15: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-15       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-16: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-16       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-17: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-17       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-18: Verify the value on the AFib Fibrillation (AFib) section is updated after deleting AFib events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-18       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-19: Verify the value on the AFib Fibrillation (AFib) section is updated after changing AFib events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-19       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-20: Verify the value on the AFib Fibrillation (AFib) section is updated after marking AFib events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-20       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-21: Verify the value on the AFib Fibrillation (AFib) section is updated after deleting all AFib events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-21       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-22: Verify the value on the AFib Fibrillation (AFib) section is updated after marking all AFib events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib eventss

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-22       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-23: Verify the value on the AFib Fibrillation (AFib) section is updated after changing Tachy events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-23       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-24: Verify the value on the AFib Fibrillation (AFib) section is updated after changing Brady events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-24       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-25: Verify the value on the AFib Fibrillation (AFib) section is updated after changing VT events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-25       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-26: Verify the value on the AFib Fibrillation (AFib) section is updated after changing SVT events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-26       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-27: Verify the value on the AFib Fibrillation (AFib) section is updated after changing 2nd Deg HB events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-27       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-28: Verify the value on the AFib Fibrillation (AFib) section is updated after changing 3rd Deg HB events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events
    ...     2. Total burden: the percentage of the number of any beats inside of an AFib episode to the total beats
    ...     3. Total AFib episodes: total AFib events (auto)
    ...     4. Longest episode: the longest AFib event and its onset time
    ...     5. Nighttime burden: total burden of all AFib events happened from 8 PM to 6 AM
    ...     6. Daytime burden: total burden of all AFib events happened from 6 AM to 8 PM
    ...     7. Average heart rate: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-28       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-01: Verify the Brady percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-02: Verify the Brady percentage is updated after adding new Brady events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-02       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-03: Verify the Brady percentage is updated after changing Brady events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-03       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-04: Verify the Brady percentage is updated after changing Brady events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-04       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-05: Verify the Brady percentage is updated after changing Brady events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-05       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-06: Verify the Brady percentage is updated after changing Brady events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-06       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-07: Verify the Brady percentage is updated after changing Brady events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-07       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-08: Verify the Brady percentage is updated after deleting Brady events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-08       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-09: Verify the Brady percentage is updated after changing Brady events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-09       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-10: Verify the Brady percentage is updated after marking Brady events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-10       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-11: Verify the Brady percentage is updated after deleting all Brady events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-11       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-12: Verify the Brady percentage is updated after marking all Brady events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Brady in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-12       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-13: Verify the Tachy percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-14: Verify the Tachy percentage is updated after adding new Tachy events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-14       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-15: Verify the Tachy percentage is updated after changing Tachy events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-15       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-16: Verify the Tachy percentage is updated after changing Tachy events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-16       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-17: Verify the Tachy percentage is updated after changing Tachy events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-17       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-18: Verify the Tachy percentage is updated after changing Tachy events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-18       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-19: Verify the Tachy percentage is updated after changing Tachy events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-19       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-20: Verify the Tachy percentage is updated after deleting Tachy events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-20       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-21: Verify the Tachy percentage is updated after changing Tachy events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-21       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-22: Verify the Tachy percentage is updated after marking Tachy events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-22       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-23: Verify the Tachy percentage is updated after deleting all Tachy events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-23       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-24: Verify the Tachy percentage is updated after marking all Tachy events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-24       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-25: Verify the Atrial Fibrillation percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-25       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-26: Verify the Atrial Fibrillation percentage is updated after adding new AFib events in Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-26       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-27: Verify the Atrial Fibrillation percentage is updated after changing AFib events to VT event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-27       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-28: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to SVT event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-28       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-29: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 2nd Deg HB event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-29       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-30: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 3rd Deg HB event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-30       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-31: Verify the Atrial Fibrillation percentage is updated is updated after deleting AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-31       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-32: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events duration on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-32       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-33: Verify the Atrial Fibrillation percentage is updated is updated after marking AFib events as artifact on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-33       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-34: Verify the Atrial Fibrillation percentage is updated is updated after deleting all AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-34       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-35: Verify the Atrial Fibrillation percentage is updated is updated after marking all AFib events as artifact on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-35       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-36: Verify the Atrial Fibrillation percentage is updated is updated after adding artifact override AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-36       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-37: Verify the Atrial Fibrillation percentage is updated is updated after adding new AFib events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-37       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-38: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-38       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-39: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-39       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-40: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-40       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-41: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-41       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-42: Verify the Atrial Fibrillation percentage is updated is updated after deleting AFib events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-42       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-43: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-43       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-44: Verify the Atrial Fibrillation percentage is updated is updated after marking AFib events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-44       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-45: Verify the Atrial Fibrillation percentage is updated is updated after deleting all AFib events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-45       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-46: Verify the Atrial Fibrillation percentage is updated is updated after marking all AFib events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-46       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-47: Verify the Atrial Fibrillation percentage is updated is updated after changing Tachy events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-47       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-48: Verify the Atrial Fibrillation percentage is updated after changing Brady events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-48       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-49: Verify the Atrial Fibrillation percentage is updated after changing VT events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-49       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-50: Verify the Atrial Fibrillation percentage is updated after changing SVT events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-50       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-51: Verify the Atrial Fibrillation percentage is updated after changing 2nd Deg HB events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-51       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-52: Verify the Atrial Fibrillation percentage is updated after changing 3rd Deg HB events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of AFIB that is the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-52       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-53: Verify the Pause percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-53       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-54: Verify the Pause percentage is updated after adding new Pause events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-54       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-55: Verify the Pause percentage is updated after changing Pause events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-55       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-56: Verify the Pause percentage is updated after changing Pause events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-56       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-57: Verify the Pause percentage is updated after changing Pause events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-57       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-58: Verify the Pause percentage is updated after changing Pause events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-58       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-59: Verify the Pause percentage is updated after changing Pause events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-59       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-60: Verify the Pause percentage is updated after deleting Pause events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-60       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-61: Verify the Pause percentage is updated after changing Pause events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-61       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-62: Verify the Pause percentage is updated after marking Pause events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-62       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-63: Verify the Pause percentage is updated after deleting all Pause events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-63       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-64: Verify the Pause percentage is updated after marking all Pause events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The chart draws burden values of Tachy in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-64       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-01: Verify the value on Heart rate section is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Beats: the total number of beats in the duration of the report
    ...     2. Beats: the total number of beats in the duration of the report
    ...     3. Min HR: the highest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     4. Max HR: the lowest-maximum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     5. Nighttime Average: the average heart rate registered during the nighttime starting at 8:00 PM
    ...     6. Daytime Average: the average heart rate registered during the daytime starting at 06:00 AM

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-01       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-02: Verify the Beats is updated after deleting beats on Q-Q beats by using delete beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-02       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-03: Verify the Beats is updated after deleting beats on Q-Q beats by using delete all beats button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-03       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-04: Verify the Beats is updated after deleting beats on Q-Q beats by using hotkey 6
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-04       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-05: Verify the Beats is updated after deleting beats on Q-N/S/V beats by using delete beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-05       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-06: Verify the Beats is updated after deleting beats on Q-N/S/V beats by using delete all beats button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-06       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-07: Verify the Beats is updated after deleting beats on Q-N/S/V beats by using hotkey 6
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-07       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-08: Verify the Beats is updated after deleting beats on V beats by using delete beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-08       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-09: Verify the Beats is updated after deleting beats on V beats by using delete all beats button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-09       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-10: Verify the Beats is updated after deleting beats on V beats by using hotkey 6
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-10       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-11: Verify the Beats is updated after deleting beats on S beats by using delete beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-11       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-12: Verify the Beats is updated after deleting beats on S beats by using delete all beats button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-12       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-13: Verify the Beats is updated after deleting beats on S beats by using hotkey 6
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-13       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-14: Verify the Beats is updated after deleting beats on N beats by using delete beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-14       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-15: Verify the Beats is updated after deleting beats on N beats by using delete all beats button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-15       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-16: Verify the Beats is updated after deleting beats on N beats by using hotkey 6
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-16       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-17: Verify the Beats is updated after adding new Q beats ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-17       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-18: Verify the Beats is updated after adding new S beats ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-18       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-19: Verify the Beats is updated after adding new V beats ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-19       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-20: Verify the Beats is updated after adding new N beats ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-20       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-21: Verify the Beats is updated after deleting beats on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-21       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-22: Verify the Beats is updated after adding new artifact event in non-beat area
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the total number of beats in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-22       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-24: Verify the Avg. HR is updated after updating AVG HR on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on Heart rate section of Cover page of PDF report
    ...
    ...     Expected Results:
    ...     1. Avg. HR: the average heart rate for the duration of the report
    ...     2. The values ​​in the above positions are displayed the same
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-24       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-25: Verify the value on Heart rate section is displayed as NA if user updates all N beats to S beats on Beat & HR tab
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
    ...     1. MIN/MAX/AVG on Heart Rate section shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-25       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-26: Verify the value on Heart rate section is displayed as NA if user updates all N beats to V beats on Beat & HR tab
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
    ...     1. MIN/MAX/AVG on Heart Rate section shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-26       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-27: Verify the value on Heart rate section is displayed as NA if user updates all N beats to Q beats on Beat & HR tab
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
    ...     1. MIN/MAX/AVG on Heart Rate section shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-27       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-28: Verify the value on Heart rate section is displayed as NA if user adds an artifact event during the study duration on Beat & HR tab
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
    ...     1. MIN/MAX/AVG on Heart Rate section shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-28       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-29: Verify the value on Heart rate section is displayed as NA if user adds an SVT event during the study duration on ECG event tab
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
    ...     1. MIN/MAX/AVG on Heart Rate section shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-29       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-30: Verify the value on Heart rate section is displayed as NA if user adds an VT event during the study duration on ECG event tab
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
    ...     1. MIN/MAX/AVG on Heart Rate section shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-30       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-31: Verify the value on the Heart Rate section is displayed as NA if RR > 2.5 seconds across all ECGs of each day
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
    ...     1. MIN/MAX/AVG on Heart Rate section shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-31       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-32: Verify that the system cannot recalculate values on the Heart Rate section if the user has used the Set as Min/Max HR tool
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
    ...     1.

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-32       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-33: Verify the Avg is updated after updating AVG HR on Beat & HR tab
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
    ...     1. Avg: average HR of the day

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-33       AIRP-1.9.0      auto      R1
    ${actual_avg_hr}    Edit Avg Hr On Beats Page
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${data_cover_page}     Read File Pdf Pages On     page_number=0
    ${value_cover_page}     Get Value In Cover File Pdf   data_pdf=${data_cover_page}
    ${expected_avg_hr}     Evaluate    int("${value_cover_page}[avg_hr]".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr}        ${actual_avg_hr}
    ${data_summary_page}     Read File Pdf Pages On         page_number=2
    ${values_summary_page}     Get Value In Summary File Pdf       data_pdf=${data_summary_page}
    ${expected_avg_hr_summary_page}     Evaluate    int("${values_summary_page}[avg_hr]".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_avg_hr_summary_page}     ${expected_avg_hr}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-34: Verify Min value is updated after selecting the Min HR value suggested by the system on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-34       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-35: Verify Min value is updated after entering Min HR value on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-35       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-36: Verify Min value is updated after entering Min HR value by using Set as Max/Min HR tool on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-36       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-37: Verify Min value is updated after updating N beats to S on Min HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-37       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AIRP-PDF-REPORT-STATISTIC-HR-38: Verify Min value is updated after updating N beats to V on Min HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-38       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-39: Verify Min value is updated after updating N beats to Q on Min HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-39       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-40: Verify Min value is updated after updating RR > 2.5 seconds on Min HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-40       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-41: Verify Min value is updated if user updates all Q beats to N beat on Q-Q beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-41       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-42: Verify Min value is updated if user updates all Q beats to N beat on Q-N/S/V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-42       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-43: Verify Min value is updated if user updates all V beats to N beat on V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-43       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-44: Verify Min value is updated if user updates all S beats to N beat on S beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-44       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-45: Verify Min value is updated after adding artifact event overriding Min HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-45       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-46: Verify Min value is updated after updating N beats to S on Min HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-46       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-47: Verify Min value is updated after updating N beats to V on Min HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-47       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-48: Verify Min value is updated after updating N beats to Q on Min HR area on ECG Event tab

     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-48       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-49: Verify Max value is updated after selecting the Min HR value suggested by the system on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-49       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-50: Verify Max value is updated after entering Min HR value on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-50       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-51: Verify Min value is updated after entering Min HR value by using Set as Max/Min HR tool on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-51       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-52: Verify Max value is updated after updating N beats to S on Max HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-52       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-53: Verify Max value is updated after updating N beats to V on Max HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-53       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-54: Verify Max value is updated after updating N beats to Q on Max HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-54       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-55: Verify Max value is updated after updating RR > 2.5 seconds on Min HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-55       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-56: Verify Max value is updated if user updates all Q beats to N beat on Q-Q beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-56       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-57: Verify Max value is updated if user updates all Q beats to N beat on Q-N/S/V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-57       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-58: Verify Max value is updated if user updates all V beats to N beat on V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-58       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-59: Verify Max value is updated if user updates all S beats to N beat on S beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-59       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-60: Verify Max value is updated after adding artifact event overriding Max HR area on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-60       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-61: Verify Max value is updated after updating N beats to S on Max HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-61       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-62: Verify Max value is updated after updating N beats to V on Max HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-62       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-63: Verify Max value is updated after updating N beats to Q on Max HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Test summary page of PDF report
    ...     2. Check value on ECG event page
    ...     3. Check value on Strip management page
    ...     4. Check value on Heart rate section of Cover page of PDF report
    ...     5. Check value on Patient event summary page of PDF report
    ...     6. Check value on the Sameple strips page of PDF report
    ...
    ...     Expected Results:
    ...     1. Min HR: the lowest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-63       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-64: Verify value on Nighttime avg is updated after adding multiple beats on ECG viewer
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
    ...     1. The average heart rate registered during the nighttime starting at 8:00 PM

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-64       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-65: Verify value on Nighttime avg is updated after deleting multiple beats on ECG viewer
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
    ...     1. The average heart rate registered during the nighttime starting at 8:00 PM

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-65       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-66: Verify value on Daytime avg is updated after adding multiple beats on ECG viewer
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
    ...     1. The average heart rate registered during the nighttime starting at 8:00 PM

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-66       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-HR-VARIABILITY-01: Verify value on Heart rate variability is displayed correctly in the first view
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
    ...     1. SDNN: the milliseconds representing the standard deviation of all NN intervals
    ...     2. SDANN: the milliseconds representing the standard deviation of average NN intervals
    ...     3. rMSSD: the milliseconds representing the root mean square of the successive difference between normal heartbeats
    ...     4. pNN50: the percentage of adjacent NN intervals that differ from each other by more than 50 ms
    ...     5. TP: the total number of spectral powers that include VLF band, LF band, and HF band
    ...     6. VLF: the total number of very-low frequency power in the duration of the report
    ...     7. LF: the total amount of low frequency power in the duration of the report
    ...     8. HF: the total amount of high frequency power in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-HR-VARIABILITY-01       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-01: Verify value on Ventricular ectopic is displayed correctly in the first view
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
    ...     1. Total VEs: the total number of times a VE beat event occurred in the duration of the report
    ...     2. Single VEs: the total number of times a single VE beat event occurred in the duration of the report
    ...     3. VE Couplet: the total number of times a VE Couplet beat event occurred in the duration of the report and the number of beats it included
    ...     4. VE Run (VT will be calculated under VE Run as well): the total number of times a VE Run beat event occurred in the duration of the report and the number of beats it included
    ...     5. Fastest VE Run (VT will be calculated under VE Run as well): the highest-maximum heart rate value of a VE Run beat event and its time of occurrence and the day number of the study
    ...     6. Longest VE Run (VT will be calculated under VE Run as well): the total biggest number of beats of the report and its time of occurrence and the day number of the study
    ...     7. VE Bigeminy: the total number of times a VE Bigeminy beat event occurred in the duration of the report and the number of beats it included
    ...     8. VE Trigeminy: the total number of times a VE Trigeminal beat event occurred in the duration of the report and the number of beats it included
    ...     9. VE Quadrigeminy: the total number of times a VE Quadruple beat event occurred in the duration of the report and the number of beats it included
    ...     10. VE Percent: the percent of all VE beats on the total beats of the study

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-01       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-02: Verify the value on Ventricular ectopic section are updated after marking a/multiple VE Couplet event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Couplet, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-02       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-03: Verify the value on Ventricular ectopic section are updated after marking a/multiple VE Run event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-03       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-03.1: Verify the value on Ventricular ectopic section are updated after marking a/multiple VE Bigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Bigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-03.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-03.2: Verify the value on Ventricular ectopic section are updated after marking a/multiple VE Trigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Trigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-03.2       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-04: Verify the value on Ventricular ectopic section are updated after marking a/multiple VE Quadrigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Quadrigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-05: Verify the value on Ventricular ectopic section are updated after adding new a/multiple VE Couplet on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Couplet, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-05       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-06: Verify the value on Ventricular ectopic section are updated after adding new a/multiple VE Run on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-07: Verify the value on Ventricular ectopic section are updated after adding new a/multiple VE Bigeminy on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Bigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-07       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-08: Verify the value on Ventricular ectopic section are updated after adding new a/multiple VE Trigeminy on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Trigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-08       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-09: Verify the value on Ventricular ectopic section are updated after adding new a/multiple VE Quadrigeminy on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Quadrigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-09       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-10: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Couplet to N on ECG ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Couplet, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-10       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-11: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Couplet to S on ECG ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Couplet, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-11       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-12: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Couplet to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Couplet, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-12       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-13: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Run to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-14: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Run to S on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-14       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-15: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Run to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-15       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-16: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Bigeminy to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Bigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-16       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-17: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Bigeminy to S on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Bigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-17       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-18: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Bigeminy to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Bigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-18       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-19: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Trigeminy to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Trigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-19       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-20: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Trigeminy to S on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Trigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-20       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-21: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Trigeminy to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Trigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-21       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-22: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Quadrigeminy to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Quadrigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-22       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-23: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Quadrigeminy to S on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Quadrigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-23       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-24: Verify the value on Ventricular ectopic section are updated after updating beats related to VE Quadrigeminy to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Quadrigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-24       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-25: Verify the value on Ventricular ectopic section are updated after marking all VE Couplet event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Couplet, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-25       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-26: Verify the value on Ventricular ectopic section are updated after marking all VE Run event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-26       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-27: Verify the value on Ventricular ectopic section are updated after marking all VE Bigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Bigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-27       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-28: Verify the value on Ventricular ectopic section are updated after marking all VE Trigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Trigeminy, VE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-28       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-29: Verify the value on Ventricular ectopic section are updated after marking all VT event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-29       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-30: Verify the value on Ventricular ectopic section are updated after deleting all VT events on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-30       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-31: Verify the value on Ventricular ectopic section are updated after adding new VT events on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-31       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-32: Verify the value on Ventricular ectopic section are updated after changing VT event to SVT on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-32       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-33: Verify the value on Ventricular ectopic section are not updated after changing VT event to AFib on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-33       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-34: Verify the value on Ventricular ectopic section are not updated after changing VT event to 2nd Deg HB on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-34       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-35: Verify the value on Ventricular ectopic section are not updated after changing VT event to 3rd Deg HB on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-35       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-36: Verify the value on Ventricular ectopic section are updated after deleting a/multiple VT event on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-36       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-37: Verify the value on Ventricular ectopic section are updated after marking a/mulitple VT event as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-37       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-38: Verify the value on Ventricular ectopic section are updated after changing a/multiple VT event duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-38       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-39: Verify the value on Ventricular ectopic section are updated after updating all beats related to VT event to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-39       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-40: Verify the value on Ventricular ectopic section are updated after updating all beats related to VT event to S on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-40       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-41: Verify the value on Ventricular ectopic section are updated after updating all beats related to VT event to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-41       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-42: Verify the value on Ventricular ectopic section are updated after deleting beats related to VT event on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-42       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-44: Verify the value on Ventricular ectopic section are updated after changing AFib events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-44       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-45: Verify the value on Ventricular ectopic section are updated after changing SVT events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-45       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-46: Verify the value on Ventricular ectopic section are updated after changing 2nd Deg HB events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-46       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-47: Verify the value on Ventricular ectopic section are updated after changing 3rd Deg HB events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-47       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-48: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on V beats group to N by using N beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-48       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-49: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on V beats group to S by using S beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-49       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-50: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on V beats group to Q by using Q beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-50       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-51: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on V beats group to N by using Delete beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-51       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-52: Verify the value on Ventricular ectopic section are updated after using change all to N beat button on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-52       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-53: Verify the value on Ventricular ectopic section are updated after using change all to S beat button on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-53       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-55: Verify the value on Ventricular ectopic section are updated after using change all to Q beat button on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-55       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-56: Verify the value on Ventricular ectopic section are updated after using delete all beats button on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-56       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-57: Verify the value on Ventricular ectopic section are updated after using hotkey 2 on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-57       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-58: Verify the value on Ventricular ectopic section are updated after using hotkey 3 on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-58       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-59: Verify the value on Ventricular ectopic section are updated after using hotkey 5 on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-59       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-60: Verify the value on Ventricular ectopic section are updated after using hotkey 6 on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-60       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-61: Verify the value on Ventricular ectopic section are updated after adding new an artifact area on V beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-61       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-62: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on Q-Q beats group to V beat using V beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-62       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-63: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on Q-Q beats group to V beat using hotkey 4
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-63       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-64: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on Q-N/S/V beats group to V beat using V beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-64       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-65: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on Q-N/S/V beat group to V beat using hotkey 4
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-65       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-66: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on S beats group to V beat using V beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-66       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-67: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on S beat group to V beat using hotkey 4
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-67       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-68: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on N beats group to V beat using V beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-68       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-69: Verify the value on Ventricular ectopic section are updated after updating a/multiple beats on N beat group to V beat using hotkey 4
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-69       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-70: Verify the value on Ventricular ectopic section are updated after adding a/multiple Single VEs on ECG Viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, Single VEs, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-70       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-VE-71: Verify the value on Ventricular ectopic section are updated after adding AFib event study overrides all study duration
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-VE-71       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-01: Verify value on Supraventricular ectopic is displayed correctly in the first view
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
    ...     1. Total SVEs: the total number of times a SVE beat event occurred in the duration of the report
    ...     2. Single SVEs: the total number of times a single SVE beat event occurred in the duration of the report
    ...     3. SVE Couplet: the total number of times a SVE Couplet beat event occurred in the duration of the report and the number of beats it included
    ...     4. SVE Run (SVT will be calculated under SVE Run as well): the total number of times a SVE Run beat event occurred in the duration of the report and the number of beats it included
    ...     5. Fastest SVE Run (SVT will be calculated under SVE Run as well): the highest-maximum heart rate value of an SVE Run beat event and its time of occurrence and the day number of the study
    ...     6. Fastest SVE Run (SVT will be calculated under SVE Run as well): the highest-maximum heart rate value of an SVE Run beat event and its time of occurrence and the day number of the study
    ...     7. SVE Bigeminy: the total number of times a SVE Bigeminy beat event occurred in the duration of the report and the number of beats it included
    ...     8. SVE Trigeminy: the total number of times a SVE Trigeminal beat event occurred in the duration of the report and the number of beats it included
    ...     9. SVE Quadrigeminy: the total number of times a SVE Quadruple beat event occurred in the duration of the report and the number of beats it included
    ...     10. SVE Percent: the percent of all SVE beats on the total beats of the study

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-01       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-02: Verify the value on Supraventricular ectopic section are updated after marking a/multiple SVE Couplet event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Couplet, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-02       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-03: Verify the value on Supraventricular ectopic section are updated after marking a/multiple SVE Run event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-03       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-03.1: Verify the value on Supraventricular ectopic section are updated after marking a/multiple SVE Bigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Bigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-03.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-03.2: Verify the value on Supraventricular ectopic section are updated after marking a/multiple SVE Trigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Trigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-03.2       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-04: Verify the value on Supraventricular ectopic section are updated after marking a/multiple SVE Quadrigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Quadrigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-05: Verify the value on Supraventricular ectopic section are updated after adding new a/multiple SVE Couplet on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Couplet, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-05       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-06: Verify the value on Supraventricular ectopic section are updated after adding new a/multiple SVE Run on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-07: Verify the value on Supraventricular ectopic section are updated after adding new a/multiple SVE Bigeminy on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Bigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-07       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-08: Verify the value on Supraventricular ectopic section are updated after adding new a/multiple SVE Trigeminy on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Trigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-08       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-09: Verify the value on Supraventricular ectopic section are updated after adding new a/multiple SVE Quadrigeminy on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Quadrigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-09       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-10: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Couplet to N on ECG ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Couplet, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-10       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-11: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Couplet to V on ECG ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Couplet, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-11       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-12: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Couplet to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Couplet, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-12       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-13: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Run to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-14: Verify the value on Ventricular ectopic section are updated after updating beats related to SVE Run to V on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-14       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-15: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Run to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-15       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-16: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Bigeminy to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Bigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-16       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-17: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Bigeminy to V on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Bigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-17       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-18: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Bigeminy to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Bigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-18       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-19: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Trigeminy to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Trigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-19       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-20: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Trigeminy to S on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Trigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-20       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-21: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Trigeminy to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Trigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-21       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-22: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Quadrigeminy to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Quadrigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-22       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-23: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Quadrigeminy to V on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Quadrigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-23       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-24: Verify the value on Supraventricular ectopic section are updated after updating beats related to SVE Quadrigeminy to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Quadrigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-24       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-25: Verify the value on Supraventricular ectopic section are updated after marking all SVE Couplet event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Couplet, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-25       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-26: Verify the value on Supraventricular ectopic section are updated after marking all SVE Run event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-26       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-27: Verify the value on Supraventricular ectopic section are updated after marking all SVE Bigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Bigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-27       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-28: Verify the value on Supraventricular ectopic section are updated after marking all SVE Trigeminy event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Trigeminy, SVE Percent are updated on PDF report and Findings (user must regenerate findings to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-28       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-29: Verify the value on Supraventricular ectopic section are updated after marking all SVT event as artifact on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-29       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-30: Verify the value on Supraventricular ectopic section are updated after deleting all SVT events on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-30       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-31: Verify the value on Supraventricular ectopic section are updated after adding new SVT events on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-31       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-32: Verify the value on Supraventricular ectopic section are updated after changing DVT event to VT on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-32       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-33: Verify the value on Supraventricular ectopic section are not updated after changing SVT event to AFib on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-33       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-34: Verify the value on Supraventricular ectopic section are not updated after changing SVT event to 2nd Deg HB on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-34       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-35: Verify the value on Supraventricular ectopic section are not updated after changing SVT event to 3rd Deg HB on ECG events tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-35       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-36: Verify the value on Supraventricular ectopic section are updated after deleting a/multiple SVT event on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-36       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-37: Verify the value on Supraventricular ectopic section are updated after marking a/mulitple SVT event as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-37       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-38: Verify the value on Supraventricular ectopic section are updated after changing a/multiple SVT event duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-38       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-39: Verify the value on Supraventricular ectopic section are updated after updating all beats related to SVT event to N on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total VEs, VE Run, Fastest VE Run, Longest VE Run, VE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-39       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-40: Verify the value on Supraventricular ectopic section are updated after updating all beats related to SVT event to V on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-40       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-41: Verify the value on Supraventricular ectopic section are updated after updating all beats related to SVT event to Q on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-41       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-42: Verify the value on Supraventricular ectopic section are updated after deleting beats related to SVT event on ECG viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-42       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-44: Verify the value on Supraventricular ectopic section are updated after changing AFib events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-44       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-45: Verify the value on Supraventricular ectopic section are updated after changing VT events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-45       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-46: Verify the value on Supraventricular ectopic section are updated after changing 2nd Deg HB events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-46       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-47: Verify the value on Supraventricular ectopic section are updated after changing 3rd Deg HB events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, SVE Run, Fastest SVE Run, Longest SVE Run, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-47       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-48: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on S beats group to N by using N beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-48       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-49: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on S beats group to V by using V beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-49       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-50: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on S beats group to Q by using Q beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-50       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-51: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on S beats group to N by using Delete beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-51       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-52: Verify the value on Supraventricular ectopic section are updated after using change all to N beat button on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-52       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-53: Verify the value on Supraventricular ectopic section are updated after using change all to V beat button on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-53       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-55: Verify the value on Supraventricular ectopic section are updated after using change all to Q beat button on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-55       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-56: Verify the value on Supraventricular ectopic section are updated after using delete all beats button on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-56       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-57: Verify the value on Supraventricular ectopic section are updated after using hotkey 2 on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-57       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-58: Verify the value on Supraventricular ectopic section are updated after using hotkey 4 on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Ventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-58       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-59: Verify the value on Supraventricular ectopic section are updated after using hotkey 5 on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-59       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-60: Verify the value on Supraventricular ectopic section are updated after using hotkey 6 on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-60       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-61: Verify the value on Supraventricular ectopic section are updated after adding new an artifact area on S beats group
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-61       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-62: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on Q-Q beats group to S beat using S beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-62       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-63: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on Q-Q beats group to S beat using hotkey 3
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-63       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-64: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on Q-N/S/V beats group to S beat using S beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-64       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-65: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on Q-N/S/V beat group to S beat using hotkey 3
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-65       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-66: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on V beats group to S beat using S beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-66       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-67: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on V beat group to S beat using hotkey 3
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-67       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-68: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on N beats group to S beat using S beat button
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-68       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-69: Verify the value on Supraventricular ectopic section are updated after updating a/multiple beats on N beat group to S beat using hotkey 3
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-69       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-70: Verify the value on Supraventricular ectopic section are updated after adding a/multiple Single SVEs on ECG Viewer
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Total SVEs, Single SVEs, SVE Percent are updated on PDF report and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-70       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-71: Verify the value on Supraventricular ectopic section are updated after adding AFib event study overrides all study duration
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. All values on Supraventricular ectopic are updated, and Findings (user must regenerate report to view new udpate)

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-SVE-71       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-01: Verify the value on the AV Blocks section is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events
    ...     2. 3rd Degree HB: total 3rd Degree HB events

    [Tags]     BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-02: Verify the value on the AV Blocks section is updated after adding AFib event study overrides all study duration
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events
    ...     2. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-02       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-03: Verify the 2nd Degree HB on the AV Blocks section is updated after adding new 2nd Degree HB events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-03       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-04: Verify the 2nd Degree HB on the AV Blocks section is updated after marking 2nd Degree HB events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-05: Verify the 2nd Degree HB on the AV Blocks section is updated after deleting 2nd Degree HB events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-05       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-06: Verify the 2nd Degree HB on the AV Blocks section is updated after changing 2nd Degree HB events type to AFib event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-07: Verify the 2nd Degree HB on the AV Blocks section is updated after changing 2nd Degree HB events type to VT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events
    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-07       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-08: Verify the 2nd Degree HB on the AV Blocks section is updated after changing 2nd Degree HB events type to SVT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-08       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-09: Verify the 2nd Degree HB on the AV Blocks section is updated after changing 2nd Degree HB events type to 3nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-09       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-10: Verify the 2nd Degree HB on the AV Blocks section is updated after changing 2nd Degree HB events duration override 2nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-10       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-11: Verify the 2nd Degree HB on the AV Blocks section is updated after deleting all 2nd Degree HB events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-11       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-12: Verify the 2nd Degree HB on the AV Blocks section is updated after marking all 2nd Degree HB events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-12       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-13: Verify the 2nd Degree HB on the AV Blocks section is updated after changing AFib event to 2nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-14: Verify the 2nd Degree HB on the AV Blocks section is updated after changing VT event to 2nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-14       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-15: Verify the 2nd Degree HB on the AV Blocks section is updated after changing SVT event to 2nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-15       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-16: Verify the 2nd Degree HB on the AV Blocks section is updated after changing 3rd Deg HB event to 2nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 2nd Degree HB: total 2nd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-16       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-17: Verify the 3rd Degree HB on the AV Blocks section is updated after adding new 3rd Degree HB events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-17       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-18: Verify the 3rd Degree HB on the AV Blocks section is updated after marking 3rd Degree HB events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-18       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-19: Verify the 3rd Degree HB on the AV Blocks section is updated after deleting 3rd Degree HB events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-19       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-20: Verify the 3rd Degree HB on the AV Blocks section is updated after changing 3rd Degree HB events type to AFib event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-20       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-21: Verify the 3rd Degree HB on the AV Blocks section is updated after changing 3rd Degree HB events type to VT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-21       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-22: Verify the 3rd Degree HB on the AV Blocks section is updated after changing 3rd Degree HB events type to SVT event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-22       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-23: Verify the 3rd Degree HB on the AV Blocks section is updated after changing 3rd Degree HB events type to 3nd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-23       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-24: Verify the 3rd Degree HB on the AV Blocks section is updated after changing 3rd Degree HB events duration override 3rd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-24       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-25: Verify the 3rd Degree HB on the AV Blocks section is updated after deleting all 3rd Degree HB events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-25       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-26: Verify the 3rd Degree HB on the AV Blocks section is updated after marking all 3rd Degree HB events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-26       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-27: Verify the 3rd Degree HB on the AV Blocks section is updated after changing AFib event to 3rd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-27       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-28: Verify the 3rd Degree HB on the AV Blocks section is updated after changing VT event to 3rd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-28       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-29: Verify the 3rd Degree HB on the AV Blocks section is updated after changing SVT event to 3rd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-29       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-30: Verify the 3rd Degree HB on the AV Blocks section is updated after changing 2nd Deg HB event to 3rd Deg HB event
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. 3rd Degree HB: total 3rd Degree HB events

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AV-BLOCKS-30       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-12.1: Verify the value on Bradycardia section are updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-BRADY-12.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-12.1: Verify the value on Tachycardia section are updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-TACHY-12.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-07.1: Verify the value on Pause section are updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-PAUSE-07.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-28.1: Verify the value on the AFib Fibrillation (AFib) section are updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-AFIB-28.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-12.1: Verify the Brady percentage is updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-12.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-24.1: Verify the Tachy percentage is updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-24.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-52.1: Verify the Atrial Fibrillation percentage is updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-STATISTIC-ARRHYTHMIA-BURDEN-52.1       AIRP-1.9.0       manual      R1
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
