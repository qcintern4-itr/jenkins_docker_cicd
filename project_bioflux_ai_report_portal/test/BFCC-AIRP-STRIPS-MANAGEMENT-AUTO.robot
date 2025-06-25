*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-STRIPS-MANAGEMENT-AUTO
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
Force Tags      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO  web
Test Timeout    30m

*** Test Cases ***

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-01: Verify that the AFib strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will automatically capture 10 seconds of AFib events:
    ...     - Highest Avg. HR
    ...     - Slowest Avg. HR
    ...     - Longest AFib and get the Onset
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-01       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-02: Verify that the VE strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.  AI will capture the VT/VE Run event’s duration with maximum time 30 seconds:
    ...     - Fastest and Longest
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-02       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-03: Verify that the SVE strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will capture the SVT/SVE Run event’s duration with maximum time 30 seconds:
    ...     - Fastest and Longest
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-03       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-04: Verify that the Tachy strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will automatically capture 10 seconds of Tachy events:
    ...     - Highest Avg. HR
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-04       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-05: Verify that the Brady strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will automatically capture 10 seconds of Brady events:
    ...     - Slowest Avg. HR
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-05       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-06: Verify that the Pause strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will capture the Pause event’s duration with maximum time 30 seconds:
    ...     - Longest pause
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-06       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-07: Verify that the VT strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will capture the VT/VE Run event’s duration with maximum time 30 seconds:
    ...     - Fastest and Longest
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-07       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-08: Verify that the SVT strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will capture the SVT/SVE Run event’s duration with maximum time 30 seconds:
    ...     - Fastest and Longest
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-08       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-09: Verify that the MinHR strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will automatically capture 10 seconds of MinHR
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-09       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-10: Verify that the MaxHR strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. AI will automatically capture 10 seconds of MaxHR
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-10       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-11: Verify that the HB strips captured by the system are displayed correctly
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The study has just been stopped, and the user hasn't processed any AI data yet
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results: AI will automatically capture 10 seconds of 2nd/3rd Deg HB events
    ...     1. 2nd Deg HB:
    ...     - Slowest Avg. HR
    ...     2. 3rd Deg HB:
    ...     - Slowest Avg. HR
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-11       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-12: Verify that the list of events sorted by ascending time
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-12       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-13: Verify the first event will be selected after clicking on the Auto events tab
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-13       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-01: Verify that the user can switch between Small, Medium, and Large sizes
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-01       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-02: Verify the size on thumbnail is displayed correctly after selecting Small size
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-02       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-03: Verify the size on thumbnail is displayed correctly after selecting Medium size
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-03       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-04: Verify the size on thumbnail is displayed correctly after selecting Large size
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-SIZE-04       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-01: Verify that the user can check the checkbox for a Baseline event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-01       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-02: Verify that the user can check the checkbox for a VE Couplet event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-02       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-03: Verify that the user can check the checkbox for a VE Run event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-03       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-04: Verify that the user can check the checkbox for a VE Bigeminy event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-04       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-05: Verify that the user can check the checkbox for a VE Trigeminy event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-05       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-06: Verify that the user can check the checkbox for a VE Quadrigeminy event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-06       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-07: Verify that the user can check the checkbox for a SVE Couplet event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-07       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-08: Verify that the user can check the checkbox for a SVE Run event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-08       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-09: Verify that the user can check the checkbox for a SVE Bigeminy event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-09       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-10: Verify that the user can check the checkbox for a SVE Trigeminy event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-10       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-11: Verify that the user can check the checkbox for a SVE Quadrigeminy event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-11       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-12: Verify that the user can check the checkbox for a AFib event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-12       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-13: Verify that the user can check the checkbox for a Tachy event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-13       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-14: Verify that the user can check the checkbox for a Brady event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-14       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-15: Verify that the user can check the checkbox for a Pause event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-15       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-16: Verify that the user can check the checkbox for a MaxHR event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-16       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-17: Verify that the user can check the checkbox for a VT event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-17       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-18: Verify that the user can check the checkbox for a 2nd Deg HB event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-18       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-19: Verify that the user can check the checkbox for a 3rd Deg HB event to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-19       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-19.1: Verify that the user can check the checkbox for multiple events to include it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-19.1       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-20: Verify that the "Include strip" checkbox is enabled when the "Include in the report" checkbox is checked
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-20       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-21: Verify that the user can uncheck the checkbox for a Baseline event to exclude it from the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-21       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-22: Verify that the user can uncheck the checkbox for a VE Couplet event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-22       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-23: Verify that the user can uncheck the checkbox for a VE Run event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-23       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-24: Verify that the user can uncheck the checkbox for a VE Bigeminy event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-24       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-25: Verify that the user can uncheck the checkbox for a VE Trigeminy event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-25       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-26: Verify that the user can uncheck the checkbox for a VE Quadrigeminy event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-26       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-27: Verify that the user can uncheck the checkbox for a SVE Couplet event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-27       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-28: Verify that the user can uncheck the checkbox for a SVE Run event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-28       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-29: Verify that the user can uncheck the checkbox for a SVE Bigeminy event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-29       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-30: Verify that the user can uncheck the checkbox for a SVE Trigeminy event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-30       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-31: Verify that the user can uncheck the checkbox for a SVE Quadrigeminy event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-31       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-32: Verify that the user can uncheck the checkbox for a AFib event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-32       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-33: Verify that the user can uncheck the checkbox for a Tachy event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-33       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-34: Verify that the user can uncheck the checkbox for a Brady event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-34       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-35: Verify that the user can uncheck the checkbox for a Pause event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-35       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-36: Verify that the user can uncheck the checkbox for a MaxHR event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-36       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-37: Verify that the user can uncheck the checkbox for a VT event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-37       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-38: Verify that the user can uncheck the checkbox for a 2nd Deg HB event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-38       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-39: Verify that the user can uncheck the checkbox for a 3rd Deg HB event to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-39       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-39.1: Verify that the user can uncheck the checkbox for multiple events to exclude it in the report
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-39.1      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-40: Verify that the "Include strip" checkbox is disable when the "Include in the report" checkbox is unchecked
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-EVENT-40       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-01: Verify that the user can check the checkbox for a Baseline event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-01       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-02: Verify that the user can check the checkbox for a VE Couplet event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-02       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-03: Verify that the user can check the checkbox for a VE Run event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-03       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-04: Verify that the user can check the checkbox for a VE Bigeminy event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-04       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-05: Verify that the user can check the checkbox for a VE Trigeminy event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-05       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-06: Verify that the user can check the checkbox for a VE Quadrigeminy event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-06       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-07: Verify that the user can check the checkbox for a SVE Couplet event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-07       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-08: Verify that the user can check the checkbox for a SVE Run event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-08       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-09: Verify that the user can check the checkbox for a SVE Bigeminy event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-09       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-10: Verify that the user can check the checkbox for a SVE Trigeminy event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-10       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-11: Verify that the user can check the checkbox for a SVE Quadrigeminy event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-11       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-12: Verify that the user can check the checkbox for a AFib event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-12       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-13: Verify that the user can check the checkbox for a Tachy event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-13       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-14: Verify that the user can check the checkbox for a Brady event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-14       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-15: Verify that the user can check the checkbox for a Pause event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-15       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-16: Verify that the user can check the checkbox for a MinHR event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-16       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-17: Verify that the user can check the checkbox for a VT event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-17       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-18: Verify that the user can check the checkbox for a SVT event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-18       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-19: Verify that the user can check the checkbox for a 2nd Deg HB event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-19       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-20: Verify that the user can check the checkbox for a 3rd Deg HB event to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-20       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-21: Verify that the user can check the checkbox for multiple events to include strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-21       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-22: Verify that the user can uncheck the checkbox for a Baseline event to exclude strip in PDF report
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
    ...     1. When it is unchecked, the strip image(s) of the event should be removed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-22       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-23: Verify that the user can check the uncheckbox for a VE Couplet event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-23       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-24: Verify that the user can check the uncheckbox for a VE Run event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-24       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-25: Verify that the user can check the uncheckbox for a VE Bigeminy event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-25       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-26: Verify that the user can check the uncheckbox for a VE Trigeminy event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-26       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-27: Verify that the user can check the uncheckbox for a VE Quadrigeminy event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-27       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-28: Verify that the user can check the uncheckbox for a SVE Couplet event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-28       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-29: Verify that the user can check the uncheckbox for a SVE Run event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-29       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-30: Verify that the user can check the uncheckbox for a SVE Bigeminy event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-30       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-31: Verify that the user can check the uncheckbox for a SVE Trigeminy event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-31       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-32: Verify that the user can check the uncheckbox for a SVE Quadrigeminy event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-32       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-33: Verify that the user can check the uncheckbox for a AFib event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-33       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-34: Verify that the user can check the uncheckbox for a Tachy event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-34       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-35: Verify that the user can check the uncheckbox for a Brady event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-35       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-36: Verify that the user can check the uncheckbox for a Pause event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-36       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-37: Verify that the user can check the uncheckbox for a MinHR event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-37       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-38: Verify that the user can check the uncheckbox for a VT event to exclude strip in PDF report
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: This will be enabled once the ‘Include event in report’ is available
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-38       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-39: Verify that the user can check the uncheckbox for a SVT event to exclude strip in PDF report
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
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-39       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-40: Verify that the user can check the uncheckbox for a 2nd Deg HB event to exclude strip in PDF report
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
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-40       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-41: Verify that the user can check the uncheckbox for a 3rd Deg HB event to exclude strip in PDF report
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
    ...     1. When it is checked, the strip image(s) of the event should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-41       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-42: Verify that the user can check the uncheckbox multiple events to exclude strip in PDF report
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
    ...     1. When it is checked, the strip image(s) of multiple events should be displayed in the PDF report
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-INCLUDE-STRIP-42       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-01: Verify that the user cannot perform the 'Include event in report' action once the event is in the removing state
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-01       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-02: Verify that the user cannot perform the 'Include strip' action once the event is in the removing state
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-02       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-03: Verify that the user cannot perform the 'Update technician comment' action once the event is in the removing state
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-03       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-04: Verify that the user cannot perform the 'Update title' action once the event is in the removing state
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-04       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-05: Verify that the user cannot perform the 'Edit Strips (Capture)' action once the event is in the removing state
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-05       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-06: Verify that a tooltip appears when the user hovers over the delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-06       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-07: Verify that the user can successfully delete a Baseline event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-07       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-08: Verify that the user can successfully delete a VE Couplet event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-08       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-09: Verify that the user can successfully delete a VE Run event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-09       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-10: Verify that the user can successfully delete a VE Bigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-10       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-12: Verify that the user can successfully delete a VE Quadrigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-12       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-13: Verify that the user can successfully delete a SVE Couplet event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-13       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-14: Verify that the user can successfully delete a SVE Run event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-14       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-15: Verify that the user can successfully delete a SVE Bigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-15       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-16: Verify that the user can successfully delete a SVE Quadrigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-16       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-17: Verify that the user can successfully delete a AFib event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-17       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-18: Verify that the user can successfully delete a Tachy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-18       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-19: Verify that the user can successfully delete a Brady event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-19       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-20: Verify that the user can successfully delete a Pause event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-20       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-21: Verify that the user can successfully delete a MaxHR event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-21       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-22: Verify that the user can successfully delete a MinHR event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-22       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-23: Verify that the user can successfully delete a VT event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-23       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-24: Verify that the user can successfully delete a SVT event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-24       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-25: Verify that the user can successfully delete a 2nd Deg HB event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-25       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-26: Verify that the user can successfully delete a 3rd Deg HB event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-26       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-33: Verify that the user can successfully delete a Baseline event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-33       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-34: Verify that the user can successfully delete a VE Couplet event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-34       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-35: Verify that the user can successfully delete a VE Run event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-35       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-36: Verify that the user can successfully delete a VE Bigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-36       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-37: Verify that the user can successfully delete a VE Quadrigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-37       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-38: Verify that the user can successfully delete a SVE Couplet event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-38       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-39: Verify that the user can successfully delete a SVE Run event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-39       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-40: Verify that the user can successfully delete a SVE Bigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-40       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-41: Verify that the user can successfully delete a SVE Quadrigeminy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-41       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-42: Verify that the user can successfully delete a AFib event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-42       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-43: Verify that the user can successfully delete a Tachy event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-43       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-44: Verify that the user can successfully delete a Brady event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-44       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-45: Verify that the user can successfully delete a Pause event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-45       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-46: Verify that the user can successfully delete a MaxHR event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-46       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-47: Verify that the user can successfully delete a MinHR event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-47       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-48: Verify that the user can successfully delete a VT event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-48       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-49: Verify that the user can successfully delete a SVT event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-49       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-50: Verify that the user can successfully delete a 2nd Deg HB event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-50       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-51: Verify that the user can successfully delete a 3rd Deg HB event by using the Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-51       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-52: Verify that the user can successfully delete multiple events by using Delete button
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-52       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-53: Verify that the user can successfully delete a Baseline event by using D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-53       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-54: Verify that the user can successfully delete a VE Couplet event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-54       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-55: Verify that the user can successfully delete a VE Run event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-55       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-56: Verify that the user can successfully delete a VE Bigeminy event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-56       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-57: Verify that the user can successfully delete a VE Quadrigeminy event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-57       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-58: Verify that the user can successfully delete a SVE Couplet event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-58       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-59: Verify that the user can successfully delete a SVE Run event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-59       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-60: Verify that the user can successfully delete a SVE Bigeminy event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-60       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-61: Verify that the user can successfully delete a SVE Quadrigeminy event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-61       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-62: Verify that the user can successfully delete a AFib event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-62       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-62.: Verify that the user can successfully delete a Tachy event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-62.       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-63: Verify that the user can successfully delete a Brady event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-63       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-64: Verify that the user can successfully delete a Pause event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-64       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-65: Verify that the user can successfully delete a MaxHR event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-65       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-66: Verify that the user can successfully delete a MinHR event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-66       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-67: Verify that the user can successfully delete a VT event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-67       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-68: Verify that the user can successfully delete a SVT event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-68       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-69: Verify that the user can successfully delete a 2nd Deg HB event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-69       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-70: Verify that the user can successfully delete a 3rd Deg HB event by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-70       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-71: Verify that the user can successfully delete multiple events by using the D hotkey
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
    ...
    ...     **Others**
    ...     Create date: 10/4/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-DELETE-71       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-01-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Single VE strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-01-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-02-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the VE Couplet strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-02-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-03-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the VE Run strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-03-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-04-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the VE Bigeminy strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-04-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-05-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the VE Trigeminy strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-05-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-06-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the VE Quadrigeminy strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-06-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-22-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Single SVE strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-22-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-07-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the SVE Couplet strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-07-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-08-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the SVE Run strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-08-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-09-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the SVE Bigeminy strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-09-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-10-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the SVE Trigeminy strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-10-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-11-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the SVE Quadrigeminy strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-11-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-12-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the AFib strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-12-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-13-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Tachy strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-13-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-14-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Brady strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-14-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-15-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Pause strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-15-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-16-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the VT strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-16-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-17-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the SVT strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-17-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-18-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Min HR strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-18-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-19-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Max HR strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-19-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-20-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the 2nd Deg HB strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-20-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-21-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the 3rd Deg HB strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 09/25/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-21-1.12.0       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-22.-1.12.0: Verify that the 'Strips Configuration' is displayed correctly on the Baseline strip after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1. The strips configuration in the event matches the strips in the PDF report and corresponds to the ECG captured strips configuration
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-22.-1.12.0       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-23: Verify that the Baseline strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1. Observe the strip configuration
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-23      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-24: Verify that the Single VE strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-24      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-25: Verify that the VE Couplet strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-25      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-26: Verify that the VE Run strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-26      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-27: Verify that the VE Bigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-27      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-28: Verify that the VE Trigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-28      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-29: Verify that the VE Quadrigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-29      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-30: Verify that the VE Quadrigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-30      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-31: Verify that the Single VE strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-31      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-32: Verify that the SVE Couplet strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-32      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-33: Verify that the SVE Run strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-33      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-34: Verify that the SVE Bigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-34      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-35: Verify that the SVE Trigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-35      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-36: Verify that the SVE Quadrigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-36      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-37: Verify that the SVE Quadrigeminy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-37      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-38: Verify that the AFib strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-38      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-39: Verify that the Tachy strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-39      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-40: Verify that the Brady strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-40      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-41: Verify that the Pause strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-41      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-42: Verify that the VT strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-42      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-43: Verify that the SVT strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-43      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-44: Verify that the MinHR strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-44      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-45: Verify that the MaxHR strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-45      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-46: Verify that the 2nd Deg HB strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-46      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-47: Verify that the 3rd Deg HB strip automatically checks 'Include event in report' and 'Include strip in report' after completing the study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-47      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-48: Verify that Other event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-48      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-49: Verify that VE Couplet event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-49      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-50: Verify that VE Run event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-50      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-51: Verify that VE Bigeminy event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-51      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-52: Verify that VE Trigeminy event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-52      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-53: Verify that VE Quadrigeminy event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-53      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-54: Verify that SVE Couplet event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-54      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-55: Verify that SVE Run event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-55      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-56: Verify that SVE Bigeminy event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-56      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-57: Verify that SVE Trigeminy event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-57      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-58: Verify that SVE Quadrigeminy event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-58      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-59: Verify that AFib event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-59      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-60: Verify that Tachy event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-60      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-61: Verify that Brady event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-61      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-62: Verify that Pause event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-62      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-63: Verify that MaxHR event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-63      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-64: Verify that MinHR event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-64      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-65: Verify that VT event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-65      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-66: Verify that SVT event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-66      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-67: Verify that 2nd Deg HB event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-67      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-68: Verify that 3rd Deg HB event strip automatically checks 'Include event in report' and 'Include strip in report' after capturing from ECG event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Create date: 10/01/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-VIEW-68      AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-01: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Baseline event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-01       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-02: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Other event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-02       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-03: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Single VE event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-03       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-04: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-04       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-05: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-05       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-06: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-06       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-07: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-07       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-08: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-08       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-09: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Single SVE event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-09       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-10: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-10       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-11: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-11       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-12: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-12       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-13: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-13       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-14: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-14       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-15: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-15       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-16: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-16       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-17: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-17       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-18: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-18       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-19: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the MaxHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-19       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-20: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the MinHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-20       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-21: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-21       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-22: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-22       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-23: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-23       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-24: Verify the 'Strips Configuration' is not updated when the user changes the capture and configuration in the Edit Strip modal for the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-24       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-25: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for Other event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-25       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-26: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-26       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-27: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-27       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-28: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-28       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-29: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-29       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-30: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-30       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-31: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-31       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-32: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-32       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-33: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-33       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-34: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-34       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-35: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-35       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-36: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-36       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-37: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-37       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-38: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-38       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-39: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-39       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-40: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for MaxHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-40       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-41: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for MinHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-41       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-42: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-42       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-43: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-43       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-44: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-44       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-45: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-45       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-46: Verify the 'Strips Configuration' is not updated when the user has captured and modifies configuration from ECG events tab for 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-46       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-47: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for Other event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-47       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-48: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-48       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-49: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-49       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-50: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-50       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-51: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-51       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-52: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-52       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-53: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-53       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-54: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-54       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-55: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-55       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-56: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-56       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-57: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-57       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-58: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-58       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-59: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-59       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-60: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for MaxHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-60       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-61: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for MinHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-61       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-62: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-62       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-63: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-63       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-64: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-64       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-65: Verify the 'Strips Configuration' is not updated when the user has just captured a strip from ECG events tab for 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration of the event will remain unchanged, just as it was before regeneration
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-65       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-66: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Baseline event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-66       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-68: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Other event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-68       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-69: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Single VE event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-69       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-70: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-70       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-71: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-71       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-72: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-72       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-73: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-73       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-74: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-74       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-75: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Single SVE event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-75       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-76: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-76       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-77: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-77       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-78: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-78       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-79: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-79       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-80: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-80       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-81: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-81       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-82: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-82       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-83: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-83       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-84: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-84       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-85: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the MaxHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-85       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-86: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the MinHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-86       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-87: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-87       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-88: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-88       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-89: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-89       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-90: Verify the 'Strips Configuration' is updated when the user changes the capture and configuration in the Edit Strip modal for the 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click edit button on event, update capture and configuration on Edit strip modal, then click save button
    ...     2. Update the configuration on PDF report tab
    ...     3. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-90       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-91: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for Other event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-91       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-92: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-92       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-93: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for VE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-93       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-94: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-94       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-95: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-95       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-96: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-96       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-97: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-97       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-98: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for SVE Run event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-98       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-99: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-99       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-100: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-100       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-101: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-101       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-102: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-102       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-103: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-103       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-104: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-104       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-105: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-105       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-106: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for MaxHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-106       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-107: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for MinHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-107       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-108: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-108       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-109: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-109       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-110: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-110       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-111: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-111       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-112: Verify the 'Strips Configuration' is updated when the user has captured and modifies configuration from ECG events tab for 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, captured and modifies configuration, then click save button
    ...     2. Observe that event strip in Strip management
    ...     3. Update the configuration on PDF report tab
    ...     4. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-112       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-113: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for Other event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-113       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-114: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for VE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-114       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-115: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for VE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-115       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-116: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for VE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-116       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-117: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for VE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-117       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-118: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for SVE Couplet event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-118       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-119: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for SVE Bigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-119       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-120: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for SVE Trigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-120       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-121: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for SVE Quadrigeminy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-121       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-122: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for AFib event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-122       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-123: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for Tachy event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-123       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-124: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for Brady event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-124       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-125: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for Pause event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-125       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-126: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for MaxHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-126       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-127: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for MinHR event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-127       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-128: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for VT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-128       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-129: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for SVT event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-129       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-130: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for 2nd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-130       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-131: Verify the 'Strips Configuration' is updated when the user has just captured a strip from ECG events tab for 3rd Deg HB event
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. On ECG Event tab, has just captured a strip, then click save button
    ...     2. Observe that event strip in Strip management
    ...     2. Click Generate report button
    ...
    ...     Expected Results:
    ...     1. The strips configuration on event in the 'Included in Report' tab matches the strips in the PDF report tab
    ...
    ...     **Others**
    ...     Create date: 10/2/2024 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-CONFIG-131       AIRP-1.8.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-01: Verify that hovering over the “Re-capture” button displays a tooltip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    - This test case verifies that when the user hovers the mouse over the “Re-capture” button in the Strip Management page, a tooltip appears
    ...    - The tooltip provides additional explanation of the button’s function
    ...
    ...     Expected Results:
    ...    1. A tooltip is displayed near the “Re-capture” button
    ...
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-02: Verify that hovering on the icon of auto events displays a tooltip
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that for auto events that are updated or created, an icon appears at the top-right corner of the strip card
    ...    - When the user hovers over the icon, a tooltip is displayed explaining the origin of the event
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Identify any auto event that was updated or created (e.g., after clicking “Re-capture”)
    ...    3. Hover the mouse cursor over the icon located in the top-right corner of the strip card
    ...
    ...     Expected Results:
    ...    1. A tooltip appears when hovering over the icon
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-03: Verify that the auto-icon disappears after the user updates the technician comment in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-03       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-04: Verify that the auto-icon disappears after the user recaptures the strip in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-05: Verify that the auto-icon does not disappear after the user unchecks "Include Strip" in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-05       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-06: Verify that the auto-icon does not disappear after the user unchecks "Include event in report" in the Strip Management tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-06       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-07: Verify that the auto-icon disappears after the user updates the technician comment in the ECG Event tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...    1.
    ...
    ...     Expected Results:
    ...    1.
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-ICON-07       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-01: Verify that the filter modal allows users to filter Auto Events by capture type
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that clicking the filter button opens a modal containing filtering options for Auto Events
    ...    - Users can choose to show all, only auto captured events, or only manually captured events
    ...    - Clicking the "Apply" button applies the selected filter to the Auto Events list
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...    3. Observe that a modal appears with the following options:
    ...       - Show all events
    ...       - Only show auto captured events
    ...       - Only show manually captured events
    ...    4. Select “Only show auto captured events” and click “Apply”
    ...    5. Observe the filtered result
    ...    6. Repeat step 4 with “Only show manually captured events” and click “Apply”
    ...    7. Repeat step 4 with “Show all events” and click “Apply”
    ...
    ...     Expected Results:
    ...    1. The modal appears with the 3 correct filtering options
    ...    2. When "Only show auto captured events" is selected and applied:
    ...       - Only events captured automatically are shown in the list
    ...    3. When "Only show manually captured events" is selected and applied:
    ...       - Only events captured manually by users are shown
    ...    4. When "Show all events" is selected and applied:
    ...       - Both auto and manually captured events are displayed
    ...
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-02: Verify that closing the filter modal without clicking “Apply” does not change the filter
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that if the user closes the filter modal without clicking “Apply,” the selected filter is not applied to the Auto Events list
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...    3. Select the option “Only show manually captured events”
    ...    4. Click outside the modal area to close it (anywhere on the portal outside the modal)
    ...
    ...     Expected Results:
    ...    1. The filter is not applied
    ...    2. The list of Auto Events remains unchanged
    ...
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-03: Verify that “Show all events” is selected by default when opening the filter modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when the filter modal is opened, the default selected option is “Show all events”
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...
    ...     Expected Results:
    ...    1. The filter modal opens
    ...    2. The radio option “Show all events” is pre-selected by default
    ...
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-03       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-04: Verify that “Show all events” is selected by default when opening the filter modal
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when the filter modal is opened, the default selected option is “Show all events”
    ...
    ...     Precondition:
    ...    -
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the filter button
    ...
    ...     Expected Results:
    ...    1. The filter modal opens
    ...    2. The radio option “Show all events” is pre-selected by default
    ...
    ...     **Others**
    ...     Create date: 6/9/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-FILTER-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-01: Verify that system re-captures AFib event with highest average HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that clicking the Re-capture button causes the system to automatically capture the AFib event with the highest average HR
    ...
    ...     Precondition:
    ...    - A completed study with multiple AFib events with different average HR values
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strips Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to be refreshed
    ...    4. Locate the AFib event with the highest average HR
    ...
    ...     Expected Results:
    ...    1. A new AFib event is captured with highest average HR in ECG event and Strip management tab
    ...    2. This event appears in the auto events list
    ...    3. The event includes a strip
    ...    4. An icon marks this as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-02: Verify that system re-captures AFib event with slowest average HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that after re-capturing, the system includes the AFib event with the lowest average HR
    ...
    ...     Precondition:
    ...    - A completed study with multiple AFib events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strips Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to update
    ...    4. Check AFib events and find one with the lowest Avg. HR
    ...
    ...     Expected Results:
    ...    1. An AFib event with slowest average HR is captured and listed in ECG event and Strip management tab
    ...    2. It appears correctly in the auto events list
    ...    3. The event includes a strip
    ...    4. An icon marks this as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-03: Verify that system re-captures the longest AFib episode and its onset
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test verifies that the longest duration AFib episode is selected and its onset point is captured in the auto strip list after re-capture
    ...
    ...     Precondition:
    ...    - A completed study with multiple AFib events with different durations
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strips Management page
    ...    2. Click on the “Re-capture” button
    ...    3. Observe AFib events in the updated auto list
    ...
    ...     Expected Results:
    ...    1. The longest AFib episode is captured and listed in ECG event and Strip management tab
    ...    2. The captured strip includes the onset of the longest AFib
    ...    3. Event is labeled as auto-captured with the respective icon
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-03       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-TACHY-01: Verify that system re-captures Tachy event with highest average HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that clicking the Re-capture button causes the system to automatically capture the Tachycardia event with the highest average HR
    ...
    ...     Precondition:
    ...    - A completed study with multiple Tachy events having different average HR values
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strips Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to be refreshed
    ...    4. Locate the Tachycardia event with the highest average HR
    ...
    ...     Expected Results:
    ...    1. A new Tachy event is captured with highest average HR in both ECG Event and Strip Management tabs
    ...    2. This event appears in the auto events list
    ...    3. The event includes a strip
    ...    4. An icon marks this as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-TACHY-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-BRADY-01: Verify that system re-captures Brady event with slowest average HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the Bradycardia event with the lowest average HR after re-capture
    ...
    ...     Precondition:
    ...    - A completed study with multiple Brady events having different average HR values
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strips Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to update
    ...    4. Locate the Bradycardia event with the lowest average HR
    ...
    ...     Expected Results:
    ...    1. A Brady event with the slowest average HR is captured in both ECG Event and Strip Management tabs
    ...    2. The event appears in the auto events list
    ...    3. The event includes a strip
    ...    4. An icon marks this as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-BRADY-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-PAUSE-01: Verify that system re-captures Pause event with the longest duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the longest Pause event is automatically selected and captured by the system when re-capture is performed
    ...
    ...     Precondition:
    ...    - A completed study with multiple Pause events of varying durations
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strips Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to refresh
    ...    4. Locate the Pause event with the longest pause duration
    ...
    ...     Expected Results:
    ...    1. A new Pause event with the longest duration is captured in both ECG Event and Strip Management tabs
    ...    2. This event appears in the auto events list
    ...    3. The event includes a strip
    ...    4. An icon marks this as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-PAUSE-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VERUN-01: Verify that system re-captures the VE Run event with the fastest HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system automatically captures the VE Run event with the highest average or peak HR when re-capture is performed
    ...
    ...     Precondition:
    ...    - A completed study containing only VE Run events
    ...    - The study does not contain VT or SVT events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto event list to be updated
    ...    4. Identify the VE Run event with the highest HR
    ...
    ...     Expected Results:
    ...    1. The system captures the VE Run with the fastest HR
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. A strip is included in report
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VERUN-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VERUN-02: Verify that system re-captures the VE Run event with the longest duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system automatically captures the VE Run event with the longest run (most beats or duration)
    ...
    ...     Precondition:
    ...    - A completed study containing only VE Run events
    ...    - The study does not contain VT or SVT events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto event list to be updated
    ...    4. Identify the VE Run event with the longest duration or highest beat count
    ...
    ...     Expected Results:
    ...    1. The system captures the VE Run with the longest run
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. A strip is included in report
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VERUN-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVERUN-01: Verify that system re-captures the SVE Run event with the fastest HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system automatically captures the SVE Run event with the highest HR when re-capture is triggered
    ...
    ...     Precondition:
    ...    - A completed study containing only SVE Run events
    ...    - The study does not contain SVT or VT events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto event list to be refreshed
    ...    4. Identify the SVE Run event with the highest HR
    ...
    ...     Expected Results:
    ...    1. The system captures the SVE Run event with the fastest HR
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. A strip is included in report
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVERUN-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVERUN-02: Verify that system re-captures the SVE Run event with the longest duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the SVE Run event with the longest run during re-capture
    ...
    ...     Precondition:
    ...    - A completed study containing only SVE Run events
    ...    - The study does not contain SVT or VT events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto event list to be refreshed
    ...    4. Identify the SVE Run event with the longest duration or highest beat count
    ...
    ...     Expected Results:
    ...    1. The system captures the longest SVE Run event
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. A strip is included in report
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVERUN-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VT-01: Verify that system re-captures the VT event with the fastest HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the Ventricular Tachycardia (VT) event with the highest HR when re-capture is triggered
    ...
    ...     Precondition:
    ...    - A completed study that contains only VT events
    ...    - The study does not contain VE Run or SVE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to be updated
    ...    4. Identify the VT event with the highest HR
    ...
    ...     Expected Results:
    ...    1. The system captures the fastest VT event
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. The event includes a strip
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VT-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VT-02: Verify that system re-captures the VT event with the longest duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the VT event with the longest duration or most beats after re-capture
    ...
    ...     Precondition:
    ...    - A completed study that contains only VT events
    ...    - The study does not contain VE Run or SVE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to update
    ...    4. Identify the VT event with the longest run
    ...
    ...     Expected Results:
    ...    1. The system captures the longest VT event
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. The event includes a strip
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VT-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVT-01: Verify that system re-captures the SVT event with the fastest HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the Supraventricular Tachycardia (SVT) event with the highest HR after clicking re-capture
    ...
    ...     Precondition:
    ...    - A completed study that contains only SVT events
    ...    - The study does not contain SVE Run or VE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to be refreshed
    ...    4. Identify the SVT event with the highest average HR
    ...
    ...     Expected Results:
    ...    1. The system captures the fastest SVT event
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. The event includes a strip
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVT-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVT-02: Verify that system re-captures the SVT event with the longest duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system captures the SVT event with the longest run after re-capture
    ...
    ...     Precondition:
    ...    - A completed study that contains only SVT events
    ...    - The study does not contain SVE Run or VE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto events list to be refreshed
    ...    4. Identify the SVT event with the longest duration or beat count
    ...
    ...     Expected Results:
    ...    1. The system captures the longest SVT event
    ...    2. The event appears in both ECG Event and Strip Management tabs
    ...    3. The event includes a strip
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVT-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VE-01: Verify that system captures the fastest event among VT and VE Run
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when both VT and VE Run events exist, the system selects the one with the highest HR among them
    ...
    ...     Precondition:
    ...    - A completed study containing both VT and VE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for auto event list to refresh
    ...    4. Identify VT and VE Run events and compare average HR
    ...
    ...     Expected Results:
    ...    1. The event (VT or VE Run) with highest HR is captured
    ...    2. The event is shown in ECG Event and Strip Management tabs
    ...    3. The strip is included and marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VE-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VE-02: Verify that system captures the longest event among VT and VE Run
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when both VT and VE Run events exist, the system selects the one with the longest run (based on beat count or duration)
    ...
    ...     Precondition:
    ...    - A completed study containing both VT and VE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for auto event list to refresh
    ...    4. Identify VT and VE Run events and compare duration/beat count
    ...
    ...     Expected Results:
    ...    1. The longest VT or VE Run event is captured
    ...    2. The event appears in ECG Event and Strip Management tabs
    ...    3. A strip is included and marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VE-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVE-01: Verify that system captures the fastest event among SVT and SVE Run
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when both SVT and SVE Run events exist, the system selects the one with the highest HR
    ...
    ...     Precondition:
    ...    - A completed study containing both SVT and SVE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for auto event list to refresh
    ...    4. Identify SVT and SVE Run events and compare average HR
    ...
    ...     Expected Results:
    ...    1. The event (SVT or SVE Run) with highest HR is captured
    ...    2. The event is listed in ECG Event and Strip Management tabs
    ...    3. A strip is included and marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVE-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVE-02: Verify that system captures the longest event among SVT and SVE Run
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when both SVT and SVE Run events exist, the system selects the one with the longest run (duration or beat count)
    ...
    ...     Precondition:
    ...    - A completed study containing both SVT and SVE Run events
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for auto event list to refresh
    ...    4. Identify SVT and SVE Run events and compare duration/beat count
    ...
    ...     Expected Results:
    ...    1. The longest SVT or SVE Run event is captured
    ...    2. The event appears in ECG Event and Strip Management tabs
    ...    3. A strip is included and marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/12/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVE-02       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-2NDDEG-01: Verify that system captures 2nd Degree Heart Block event with the slowest average HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that after clicking the "Re-capture" button, the system automatically captures the 2nd Degree AV Block event with the lowest average HR
    ...
    ...     Precondition:
    ...    - A completed study with at least two or more 2nd Degree Heart Block events with different average HR values
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto event list to refresh
    ...    4. Identify 2nd Degree HB events and their HRs
    ...
    ...     Expected Results:
    ...    1. The system captures the 2nd Degree HB event with the slowest average HR
    ...    2. The event is displayed in both ECG Event and Strip Management tabs
    ...    3. The event includes a strip
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/13/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-2NDDEG-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-3RDDEG-01: Verify that system captures 3rd Degree Heart Block event with the slowest average HR
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system automatically selects the 3rd Degree AV Block event with the lowest average HR for strip capture after re-capture
    ...
    ...     Precondition:
    ...    - A completed study with at least two or more 3rd Degree Heart Block events with different average HR values
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the "Re-capture" button
    ...    3. Wait for the auto event list to refresh
    ...    4. Identify 3rd Degree HB events and compare HRs
    ...
    ...     Expected Results:
    ...    1. The system captures the 3rd Degree HB event with the slowest average HR
    ...    2. The event appears in ECG Event and Strip Management tabs
    ...    3. A strip is included
    ...    4. The event is marked as auto-captured
    ...
    ...     **Others**
    ...     Create date: 6/13/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-3RDDEG-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MINHR-01: Verify that system captures Min HR event with the slowest HR of a study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when the “Re-capture” button is clicked, the system automatically captures the Min HR event that corresponds to the slowest heart rate recorded in the study
    ...
    ...     Precondition:
    ...    - A completed (stopped) study with a valid HR trend across the full duration
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the “Re-capture” button
    ...    3. Wait for the system to update the auto events list
    ...    4. Identify the Min HR value from the HR Summary or corresponding data source
    ...    5. Locate the captured Min HR event
    ...
    ...     Expected Results:
    ...    1. The Min HR event captured by the system corresponds to the slowest heart rate recorded in the study
    ...    2. The strip includes the correct timestamp and HR value
    ...    3. The event is marked as auto-captured and appears in ECG Event and Strip Management tabs
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MINHR-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MAXHR-01: Verify that system captures Max HR event with the highest HR of a study
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that when the “Re-capture” button is clicked, the system automatically captures the Max HR event that corresponds to the highest heart rate recorded in the study
    ...
    ...     Precondition:
    ...    - A completed (stopped) study with a valid HR trend across the full duration
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Click the “Re-capture” button
    ...    3. Wait for the system to update the auto events list
    ...    4. Identify the Max HR value from the HR Summary or data source
    ...    5. Locate the captured Max HR event
    ...
    ...     Expected Results:
    ...    1. The Max HR event captured corresponds to the highest heart rate recorded in the study
    ...    2. The strip includes correct timestamp and HR value
    ...    3. The event is marked as auto-captured and appears in ECG Event and Strip Management tabs
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MAXHR-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VERUN-04: Verify that auto VE Run is not displayed if an existing VE Run with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto VE Run strip if a previous VE Run event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with VE Run event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a VE Run event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto VE Run with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto VE Run if its Event ID matches an existing event
    ...    2. Existing captured VE Run remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VERUN-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VECOUPLET-01: Verify that auto VE Run is not displayed if an existing VE Couplet with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto VE Run strip if a previous VE Couplet event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with VE Couplet event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a VE Couplet event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto VE Couplet with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto VE Couplet if its Event ID matches an existing event
    ...    2. Existing captured VE Couplet remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VECOUPLET-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VEBI-01: Verify that auto VE Run is not displayed if an existing VE Bigeminy with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto VE Bigeminy strip if a previous VE Bigeminy event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with VE Bigeminy event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a VE Bigeminy event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto VE Bigeminy with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto VE Bigeminy if its Event ID matches an existing event
    ...    2. Existing captured VE Bigeminy remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VEBI-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VETRI-01: Verify that auto VE Run is not displayed if an existing VE Trigeminy with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto VE Trigeminy strip if a previous VE Trigeminy event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with VE Trigeminy event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a VE Trigeminy event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto VE Trigeminy with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto VE Trigeminy if its Event ID matches an existing event
    ...    2. Existing captured VE Trigeminy remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VETRI-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VEQUAD-01: Verify that auto VE Run is not displayed if an existing VE Quadrigeminy with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto VE Quadrigeminy strip if a previous VE Quadrigeminy event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with VE Quadrigeminy event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a VE Quadrigeminy event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto VE Quadrigeminy with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto VE Quadrigeminy if its Event ID matches an existing event
    ...    2. Existing captured VE Quadrigeminy remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VEQUAD-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVECOUPLET-01: Verify that auto VE Run is not displayed if an existing SVE Couplet with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto SVE Couplet strip if a previous SVE Couplet event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with SVE Couplet event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a SVE Couplet event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto SVE Couplet with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto SVE Couplet if its Event ID matches an existing event
    ...    2. Existing captured SVE Couplet remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVECOUPLET-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVERUN-04: Verify that auto VE Run is not displayed if an existing SVE Run with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto SVE Run strip if a previous SVE Run event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with SVE Run event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a SVE Run event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto SVE Run with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto SVE Run if its Event ID matches an existing event
    ...    2. Existing captured SVE Run remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVERUN-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVEBI-01: Verify that auto VE Run is not displayed if an existing SVE Bigeminy with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto SVE Bigeminy strip if a previous SVE Bigeminy event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with SVE Bigeminy event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a SVE Bigeminy event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto SVE Bigeminy with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto SVE Bigeminy if its Event ID matches an existing event
    ...    2. Existing captured SVE Bigeminy remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVEBI-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVETRI-01: Verify that auto VE Run is not displayed if an existing SVE Trigeminy with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto SVE Trigeminy strip if a previous SVE Trigeminy event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with SVE Trigeminy event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a SVE Trigeminy event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto SVE Trigeminy with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto SVE Trigeminy if its Event ID matches an existing event
    ...    2. Existing captured SVE Trigeminy remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVETRI-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVEQUAD-01: Verify that auto VE Run is not displayed if an existing SVE Quadrigeminy with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto SVE Quadrigeminy strip if a previous SVE Quadrigeminy event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with SVE Quadrigeminy event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a SVE Quadrigeminy event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto SVE Quadrigeminy with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto SVE Quadrigeminy if its Event ID matches an existing event
    ...    2. Existing captured SVE Quadrigeminy remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVEQUAD-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-04: Verify that auto AFib is not displayed if an existing AFib with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto AFib strip if a previous AFib event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with AFib event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a AFib event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto AFib with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto AFib if its Event ID matches an existing event
    ...    2. Existing captured AFib remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-AFIB-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-TACHY-04: Verify that auto Tachy is not displayed if an existing Tachy with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto Tachy strip if a previous Tachy event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with Tachy event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a Tachy event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto Tachy with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto Tachy if its Event ID matches an existing event
    ...    2. Existing captured Tachy remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-TACHY-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-BRADY-04: Verify that auto Brady is not displayed if an existing Brady with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto Brady strip if a previous Brady event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with Brady event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a Brady event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto Brady with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto Brady if its Event ID matches an existing event
    ...    2. Existing captured Brady remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-BRADY-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-PAUSE-04: Verify that auto Pause is not displayed if an existing Pause with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto Pause strip if a previous Pause event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with Pause event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a Pause event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto Pause with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto Pause if its Event ID matches an existing event
    ...    2. Existing captured Pause remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-PAUSE-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VT-04: Verify that auto VT is not displayed if an existing VT with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto VT strip if a previous VT event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with VT event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a VT event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto VT with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto VT if its Event ID matches an existing event
    ...    2. Existing captured VT remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-VT-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVT-04: Verify that auto SVT is not displayed if an existing SVT with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto SVT strip if a previous SVT event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with SVT event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a SVT event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto SVT with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto SVT if its Event ID matches an existing event
    ...    2. Existing captured SVT remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SVT-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-2NDDEG-04: Verify that auto 2nd Deg HB is not displayed if an existing 2nd Deg HB with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto 2nd Deg HB strip if a previous 2nd Deg HB event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with 2nd Deg HB event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a 2nd Deg HB event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto 2nd Deg HB with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto 2nd Deg HB if its Event ID matches an existing event
    ...    2. Existing captured 2nd Deg HB remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-2NDDEG-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-3RDDEG-04: Verify that auto 3rd Deg HB is not displayed if an existing 3rd Deg HB with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto 3rd Deg HB strip if a previous 3rd Deg HB event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with 3rd Deg HB event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a 3rd Deg HB event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto 3rd Deg HB with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto 3rd Deg HB if its Event ID matches an existing event
    ...    2. Existing captured 3rd Deg HB remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-3RDDEG-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MINHR-04: Verify that auto MinHR is not displayed if an existing MinHR with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto MinHR strip if a previous MinHR event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with MinHR event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a MinHR event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto MinHR with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto MinHR if its Event ID matches an existing event
    ...    2. Existing captured MinHR remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MINHR-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MAXHR-04: Verify that auto MaxHR is not displayed if an existing MaxHR with same Event ID was previously captured
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case ensures that the system does not show a new auto MaxHR strip if a previous MaxHR event with the same Event ID has already been captured
    ...
    ...     Precondition:
    ...    - A completed study with MaxHR event already captured (manual or from previous re-capture)
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm there is a MaxHR event present in the list
    ...    3. Click "Re-capture" button
    ...    4. Observe whether a new auto MaxHR with the same Event ID appears
    ...
    ...     Expected Results:
    ...    1. The system does not display a new auto MaxHR if its Event ID matches an existing event
    ...    2. Existing captured MaxHR remains in the list
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-MAXHR-04       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-BASELINE-01: Verify that auto Baseline event is excluded if a manual Baseline event exists (matching Event Type)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - This test case verifies that the system does not display an auto Baseline event if a manual Baseline event already exists
    ...    - Matching Event Type alone is sufficient to suppress the auto version, even if Event ID is different
    ...
    ...     Precondition:
    ...    - A completed study with a manually captured Baseline event
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm a manual Baseline event is present
    ...    3. Click the "Re-capture" button
    ...
    ...     Expected Results:
    ...    1. No new auto Baseline event is displayed
    ...    2. Manual event remains visible
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-BASELINE-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SINGLESVE-01: Verify that auto Single SVE event is excluded if a manual Single SVE event exists (matching Event Type)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - Verifies that a manually captured Single SVE event suppresses the display of a new auto event of the same type
    ...    - Matching Event Type is enough for exclusion
    ...
    ...     Precondition:
    ...    - A completed study with at least one manual Single SVE event
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm a manual Single SVE event is present
    ...    3. Click the "Re-capture" button
    ...
    ...     Expected Results:
    ...    1. No new auto Single SVE event is displayed
    ...    2. Manual event remains visible
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SINGLESVE-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SINGLEVE-01: Verify that auto Single VE event is excluded if a manual Single VE event exists (matching Event Type)
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...    - Ensures that the auto Single VE event is not shown if a manual one of the same type already exists
    ...
    ...     Precondition:
    ...    - A completed study with at least one manually captured Single VE event
    ...
    ...     Test Steps:
    ...    1. Navigate to the Strip Management page
    ...    2. Confirm a manual Single VE event is present
    ...    3. Click the "Re-capture" button
    ...
    ...     Expected Results:
    ...    1. No new auto Single VE event is displayed
    ...    2. Manual event remains visible
    ...
    ...     **Others**
    ...     Create date: 6/17/2025 - Trinh Nguyen

    [Tags]      BFCC-AIRP-STRIPS-MANAGEMENT-AUTO-RECAPTURE-SINGLEVE-01       AIRP-1.16.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EventDetails.py          ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py          ${BROWSER_NODE}     ${ENV}
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
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
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
    Quit Browser

Navigate to aireport
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Reports
    View Completed New Report Status On          row=1
    Switch Tab

Navigate to events page
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies      search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_strips_management]
    ${reports}      Get Completed Studies On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Manage Complete Study On              row=1
    Navigate To Studies Type        Events

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success
