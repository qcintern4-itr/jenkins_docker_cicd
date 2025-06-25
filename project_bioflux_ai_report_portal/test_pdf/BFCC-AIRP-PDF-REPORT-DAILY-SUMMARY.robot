*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY
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
Force Tags      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-01: Verify the value on the Daily summary for each day is displayed correctly on the first view
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     Each row in this table presents daily data for the duration of the report. Most of the data in this table are from AI analysis:
    ...     1. Date: a day in the duration of the report
    ...     2. Analysis time: the total recording time of the day
    ...     3. Heart rate:
    ...     - Max: max HR of the day and the time it happened
    ...     - Min: min HR of the day and the time it happened
    ...     - Avg: average HR of the day
    ...     4. Arrhythmia burden:
    ...     - Brady: total burden of Bradycardia events of the day
    ...     - Tachy: total burden of Tachycardia events of the day
    ...     - AFib: total burden of AFib events of the day
    ...     5. Pause:
    ...     - Count: the total Pause events of the day.
    ...     - Longest: the longest pause of the day and its onset time.
    ...     6. Events:
    ...     - Manual: the number of events for which 'Include in report' is enabled in the day
    ...     - Auto: the number of valid auto events triggered from the device in the day
    ...     - Physician notified: the number of notification reports sent to clinic in the day

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-02: Verify the value on Heart rate column is displayed as NA if user updates all N beats to S beats on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. MIN/MAX/AVG on Heart Rate column shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-02       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-03: Verify the value on Heart rate column is displayed as NA if user updates all N beats to V beats on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. MIN/MAX/AVG on Heart Rate column shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-03       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-04: Verify the value on Heart rate column is displayed as NA if user updates all N beats to Q beats on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. MIN/MAX/AVG on Heart Rate column shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-04       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-05: Verify the value on Heart rate column is displayed as NA if user adds an artifact event during the study duration on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. MIN/MAX/AVG on Heart Rate column shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-05       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-06: Verify the value on Heart rate column is displayed as NA if user adds an SVT event during the study duration on ECG event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. MIN/MAX/AVG on Heart Rate column shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-06       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-07: Verify the value on Heart rate column is displayed as NA if user adds an VT event during the study duration on ECG event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. MIN/MAX/AVG on Heart Rate column shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-07       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-08: Verify the value on the Heart Rate column is displayed as NA if RR > 2.5 seconds across all ECGs of each day
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. MIN/MAX/AVG on Heart Rate column shall display as NA

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-08       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-09: Verify that the system cannot recalculate values ​​on the Heart Rate column if the user has used the Set as Min/Max HR tool
     [Documentation]     Author: Trinh Nguyen
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-09       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-10: Verify the Avg is updated after updating AVG HR for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-10       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-11: Verify Min value is updated after selecting the Min HR value suggested by the system on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-11       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-12: Verify Min value is updated after entering Min HR value for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-12       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-13: Verify Min value is updated after entering Min HR value by using Set as Max/Min HR tool for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-13       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-14: Verify Min value is updated after updating N beats to S on Min HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-14       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-15: Verify Min value is updated after updating N beats to V on Min HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-15       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-16: Verify Min value is updated after updating N beats to Q on Min HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-16       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-17: Verify Min value is updated after updating RR > 2.5 seconds on Min HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-17       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-18: Verify Min value is updated if user updates all Q beats to N beat on Q-Q beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-18       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-19: Verify Min value is updated if user updates all Q beats to N beat on Q-N/S/V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-19       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-20: Verify Min value is updated if user updates all V beats to N beat on V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-20       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-21: Verify Min value is updated if user updates all S beats to N beat on S beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-21       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-22: Verify Min value is updated after adding artifact event overriding Min HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-22       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-23: Verify Min value is updated after updating N beats to S on Min HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-23       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-24: Verify Min value is updated after updating N beats to V on Min HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-24       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Min: min HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-25       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-26: Verify Max value is updated after selecting the Min HR value suggested by the system on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-26       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-27: Verify Max value is updated after entering Min HR value for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-27       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-28: Verify Min value is updated after entering Min HR value by using Set as Max/Min HR tool for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-28       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-29: Verify Max value is updated after updating N beats to S on Max HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-29       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-30: Verify Max value is updated after updating N beats to V on Max HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-30       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-31: Verify Max value is updated after updating N beats to Q on Max HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-31       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-32: Verify Max value is updated after updating RR > 2.5 seconds on Min HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-32       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-33: Verify Max value is updated if user updates all Q beats to N beat on Q-Q beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-33       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-34: Verify Max value is updated if user updates all Q beats to N beat on Q-N/S/V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-34       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-35: Verify Max value is updated if user updates all V beats to N beat on V beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-35       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-36: Verify Max value is updated if user updates all S beats to N beat on S beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-36       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-37: Verify Max value is updated after adding artifact event overriding Max HR area for each day on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-37       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-38: Verify Max value is updated after updating N beats to S on Max HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-38       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-39: Verify Max value is updated after updating N beats to V on Max HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-39       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-40: Verify Max value is updated after updating N beats to Q on Max HR area on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Check value on Heart rate section of Daily summary page of PDF report
    ...     2. Check value on Beat & HR tab
    ...
    ...     Expected Results:
    ...     1. Max: max HR of the day and the time it happened
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-HR-40       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-01: Verify the value on Arrhythmia burdenv for each day is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. Brady: total burden of Bradycardia events of the day
    ...     2. Tachy: total burden of Tachycardia events of the day
    ...     3. AFib: total burden of AFib events of the day

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-01       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-02: Verify the Brady percentage is updated after adding new Brady events for each day in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Brady: total burden of Bradycardia events of the day

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-02       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-03: Verify the Brady percentage is updated after changing Brady events to AFib event for each day on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Brady: total burden of Bradycardia events of the day

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-03       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-04: Verify the Brady percentage is updated after changing Brady events to VT event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-04       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-05: Verify the Brady percentage is updated after changing Brady events to SVT event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-05       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-06: Verify the Brady percentage is updated after changing Brady events to 2nd Deg HB event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-06       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-07: Verify the Brady percentage is updated after changing Brady events to 3rd Deg HB event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-07       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-08: Verify the Brady percentage is updated after deleting Brady events for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-08       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-09: Verify the Brady percentage is updated after changing Brady events duration for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-09       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-10: Verify the Brady percentage is updated after marking Brady events as artifact for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-10       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-11: Verify the Brady percentage is updated after deleting all Brady events for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-11       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-12: Verify the Brady percentage is updated after marking all Brady events as artifact for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-12       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-14: Verify the Tachy percentage is updated after adding new Tachy events for each day in ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-14       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-15: Verify the Tachy percentage is updated after changing Tachy events to AFib event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-15       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-16: Verify the Tachy percentage is updated after changing Tachy events to VT event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-16       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-17: Verify the Tachy percentage is updated after changing Tachy events to SVT event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-17       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-18: Verify the Tachy percentage is updated after changing Tachy events to 2nd Deg HB event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-18       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-19: Verify the Tachy percentage is updated after changing Tachy events to 3rd Deg HB event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-19       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-20: Verify the Tachy percentage is updated after deleting Tachy events on ECG Event for each day tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-20       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-21: Verify the Tachy percentage is updated after changing Tachy events duration for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-21       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-22: Verify the Tachy percentage is updated after marking Tachy events as artifact for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-22       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-23: Verify the Tachy percentage is updated after deleting all Tachy events for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-23       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-24: Verify the Tachy percentage is updated after marking all Tachy events as artifact for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-24       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-26: Verify the Atrial Fibrillation percentage is updated after adding new AFib events for each day in Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-26       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-27: Verify the Atrial Fibrillation percentage is updated after changing AFib events to VT event for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-27       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-28: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to SVT event for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-28       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-29: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 2nd Deg HB event for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-29       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-30: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 3rd Deg HB event for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-30       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-31: Verify the Atrial Fibrillation percentage is updated is updated after deleting AFib events for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-31       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-32: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events duration for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-32       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-33: Verify the Atrial Fibrillation percentage is updated is updated after marking AFib events as artifact for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-33       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-34: Verify the Atrial Fibrillation percentage is updated is updated after deleting all AFib events for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-34       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-35: Verify the Atrial Fibrillation percentage is updated is updated after marking all AFib events as artifact for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-35       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-36: Verify the Atrial Fibrillation percentage is updated is updated after adding artifact override AFib events for each day on Beat & HR tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-36       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-37: Verify the Atrial Fibrillation percentage is updated is updated after adding new AFib events for each day in ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-37       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-38: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to VT event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-38       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-39: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to SVT event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-39       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-40: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 2nd Deg HB event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-40       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-41: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events to 3rd Deg HB event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-41       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-42: Verify the Atrial Fibrillation percentage is updated is updated after deleting AFib events for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-42       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-43: Verify the Atrial Fibrillation percentage is updated is updated after changing AFib events duration for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-43       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-44: Verify the Atrial Fibrillation percentage is updated is updated after marking AFib events as artifact for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-44       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-45: Verify the Atrial Fibrillation percentage is updated is updated after deleting all AFib events for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-45       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-46: Verify the Atrial Fibrillation percentage is updated is updated after marking all AFib events as artifact for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-46       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-47: Verify the Atrial Fibrillation percentage is updated is updated after changing Tachy events to AFib event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-47       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-48: Verify the Atrial Fibrillation percentage is updated after changing Brady events to AFib event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-48       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-49: Verify the Atrial Fibrillation percentage is updated after changing VT events to AFib event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-49       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-50: Verify the Atrial Fibrillation percentage is updated after changing SVT events to AFib event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-50       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-51: Verify the Atrial Fibrillation percentage is updated after changing 2nd Deg HB events to AFib event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-51       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-52: Verify the Atrial Fibrillation percentage is updated after changing 3rd Deg HB events to AFib event for each day on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-ARRHYTHMIA-BURDEN-52       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-01: Verify the value on Pause column for each day are displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-01       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-02: Verify the value on the Pause column for each day are updated after adding new Pause events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-02       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-03: Verify the value on the Pause column for each day are updated after marking Pause events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-03       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-04: Verify the value on the Pause column for each day are updated after deleting Pause events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-05: Verify the value on the Pause column for each day are updated after changing Pause events duration
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-05       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-06: Verify the value on the Pause column for each day are updated after deleting all Pause events
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-07: Verify the value on the Pause column for each day are updated after marking all Tachy events as artifact
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-PAUSE-07       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-01: Verify the value on the Events column for each day are displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Count: the total Pause events of the day
    ...     2. Longest: the longest pause of the day and its onset time

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-04: Verify the Auto-triggers is displayed correctly for each day with Brady event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-05: Verify the Auto-triggers is displayed correctly for each day with Tachy event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-05       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-06: Verify the Auto-triggers is displayed correctly for each day with AFib event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-07: Verify the Auto-triggers is displayed correctly for each day with Pause event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-07       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-08: Verify the Auto-triggers is displayed correctly for each day with Auto event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-08       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-09: Verify the Auto-triggers is displayed correctly for each day with Sinus event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-09       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-10: Verify the Auto-triggers is displayed correctly for each day with Brady event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-10       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-11: Verify the Auto-triggers is displayed correctly for each day with Tachy event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-11       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-12: Verify the Auto-triggers is displayed correctly for each day with AFib event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-12       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-13: Verify the Auto-triggers is displayed correctly for each day with Pause event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-13       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-14: Verify the Auto-triggers is displayed correctly for each day with Auto event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-14       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-15: Verify the Auto-triggers is displayed correctly for each day with Sinus event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-15       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-16: Verify the Brady event is not counted on the Auto-triggers for each day if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-16       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-17: Verify the Brady event is not counted on the Auto-triggers for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-17       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-18: Verify the Tachy event is not counted on the Auto-triggers for each day if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-18       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-19: Verify the Tachy event is not counted on the Auto-triggers for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-19       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-20: Verify the AFib event is not counted on the Auto-triggers for each day if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-20       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-21: Verify the AFib event is not counted on the Auto-triggers for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-21       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-22: Verify the Pause event is not counted on the Auto-triggers for each day if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-22       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-23: Verify the Pause event is not counted on the Auto-triggers for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-23       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-24: Verify the Auto event is not counted on the Auto-triggers for each day if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-24       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-25: Verify the Auto event is not counted on the Auto-triggers for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-25       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-26: Verify the Sinus event is not counted on the Auto-triggers for each day if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-26       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-27: Verify the Sinus event is not counted on the Auto-triggers for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-27       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-29: Verify the manual events is displayed correctly for each day with symptom 'Baseline' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-29       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-30: Verify the manual events is displayed correctly for each day with symptom 'Resume Study' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-30       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-31: Verify the manual events is displayed correctly for each day with symptom 'Evaluation strip' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-31       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-32: Verify the manual events is displayed correctly for each day with symptom 'Palpitations' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-32       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-33: Verify the manual events is displayed correctly for each day with symptom 'Shortness of breath' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-33       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-34: Verify the manual events is displayed correctly for each day with symptom 'Dizziness' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-34       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-35: Verify the manual events is displayed correctly for each day with symptom 'Chest Pain' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-35       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-36: Verify the manual events is displayed correctly for each day with symptom 'Other' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-36       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-37: Verify the manual events is displayed correctly for each day with symptom 'Not Specified' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-37       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-38: Verify the manual events is displayed correctly for each day with symptom 'Baseline' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-38       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-39: Verify the manual events is displayed correctly for each day with symptom 'Resume Study' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-39       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-40: Verify the manual events is displayed correctly for each day with symptom 'Palpitations' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-40       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-41: Verify the manual events is displayed correctly for each day with symptom 'Palpitations' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-41       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-42: Verify the manual events is displayed correctly for each day with symptom 'Shortness of breath' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-42       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-43: Verify the manual events is displayed correctly for each day with symptom 'Dizziness' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-43       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-44: Verify the manual events is displayed correctly for each day with symptom 'Chest Pain' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-44       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-45: Verify the manual events is displayed correctly for each day with symptom 'Other' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-45       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-46: Verify the manual events is displayed correctly for each day with symptom 'Not Specified' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-46       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-47: Verify the symptom 'Baseline' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-47       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-48: Verify the symptom 'Baseline' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-48       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-49: Verify the symptom 'Resume study' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-49       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-50: Verify the symptom 'Resume study' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-50       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-51: Verify the symptom 'Evaluation strip' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-51       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-52: Verify the symptom 'Evaluation strip' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-52       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-53: Verify the symptom 'Palpitations' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-53       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-54: Verify the symptom 'Palpitations' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-54       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-55: Verify the symptom 'Dizziness' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-55       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-56: Verify the symptom 'Shortness of breath' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-56       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-57: Verify the symptom 'Dizziness' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-57       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-58: Verify the symptom 'Dizziness' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-58       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-59: Verify the symptom 'Chest Pain' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-59       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-60: Verify the symptom 'Chest Pain' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-60       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-61: Verify the symptom 'Other' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-61       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-62: Verify the symptom 'Other' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-62       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-63: Verify the symptom 'Not Specified' is not counted on the Manual events for each day if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-63       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-64: Verify the symptom 'Not Specified' is not counted on the Manual events for each day if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-64       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-65: Verify the Physician notified is displayed correctly for each day if the notification report has Sent status
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-65       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-66: Verify the notification report is not counted on the Physician notified for each day if it has Ready status
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-66       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-67: Verify the notification report is not counted on the Physician notified for each day if the call center recall the notification report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-67       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-68: Verify the Physician notified is displayed correctly if the event report for each day has Sent status
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-68       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-69: Verify the event report is not counted on the Physician notified for each day if it has Ready status
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-69       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-70: Verify the event report is not counted on the Physician notified for each day if the call center recall the event report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-EVENTS-70       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-01:Verify the percentage of AFib in the Burden when AFib has a duration of 100% available time.
     [Documentation]     Author: Hoang Nguyen
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
    ...     Update Date: 10/2/2024 - Hoang Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-01       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-02:Verify the percentage of AFib in the total burden when AFib has a duration of 100% available time.
     [Documentation]     Author: Hoang Nguyen
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
    ...     Update Date: 10/2/2024 - Hoang Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-02       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-03:Verify the percentage of AFib in the arrhythmia burden when AFib has a duration of 100% available time.
     [Documentation]     Author: Hoang Nguyen
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
    ...     Update Date: 10/2/2024 - Hoang Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-03       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-04:Verify the percentage of AFib in the AFib burden analysis when AFib has a duration of 100% available time.
     [Documentation]     Author: Hoang Nguyen
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
    ...     Update Date: 10/2/2024 - Hoang Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-04       AIRP-1.12.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-05:Verify the percentage of AFib in the Findings when AFib has a duration of 100% available time.
     [Documentation]     Author: Hoang Nguyen
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
    ...     Update Date: 10/2/2024 - Hoang Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-DAILY-SUMMARY-BURDEN-05       AIRP-1.12.0       manual      R1
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