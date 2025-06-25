*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-QTC-CHART
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
Force Tags      BFCC-AIRP-PDF-REPORT-QTC-CHART  web
Test Timeout    30m

*** Test Cases ***

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-01: Verify UI of the QTc chart page match to the design.
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-02: Verify the QTc chart page displays by day with the 5 following subsections throughout the whole study.
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-02       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-03: Verify the QTc chart page displays the heart rate by day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-04: Verify the QTc chart page displays the QT by day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-05: Verify the QTc chart page displays the QTc by day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-05       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-06: Verify the QTc chart page displays the QTc Histogram by day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-06       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-07: Verify the QTc chart page displays the QTc variability by day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-07       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-08: Verify the QTc chart page displays the QTc dairy summary by day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-PAGE-08       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-01: Verify the trend of the heart rate throughout the duration of the study using the histogram chart
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-02: Verify X-axis of heart rate chart displays time in 24-hour format
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-02       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-03: Verify each column on X-Axis of heart rate chart represents one hour
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-04: Verify X-Axis of heart rate chart start time matches study start time
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-05: Verify Y-Axis of Heart Rate Chart Unit is bpm
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-05       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-06: Verify Y-Axis of Heart Rate Displays 5 Value Markers When HR > 150 bpm
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-06       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-07: Verify Y-Axis Maximum Value of Heart Rate Displays 250 When the date has HR > 150 bpm
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-07       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-08: Verify Y-Axis of Heart Rate Displays 3 Value Markers When the date has HR < 150 bpm
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-08       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-09: Verify Y-Axis Maximum Value of Heart Rate Displays 150 When HR < 150 bpm
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-09       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-10: Verify data of heart rate 24h on QTc chart page match with Heart rate page
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-11: Verify data of heart rate in 24h on QTc chart page match with HR Summary tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-12: Verify Heart rate chart does not display values when no data is available for 24 hours
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-Heart-Rate-12       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-01: Verify a histogram chart depicting the ventricular depolarization and repolarization throughout the duration of the report
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-02: Verify X-axis of QT chart displays time in 24-hour format
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-02      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-03: Verify each column on X-Axis of QT chart represents one hour
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-04: Verify X-Axis of QT chart start time matches study start time
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-05: Verify Y-Axis of QT chart Unit is ms
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-05       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-06: Verify Y-Axis of QT chart Displays 4 Value Markers
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-06       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-07: Verify QT Chart for each day changes after changing to N beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-07       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-08: Verify QT Chart for each day changes after changing to S beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-08       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-09: Verify QT Chart for each day changes after changing to V beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-09       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-10: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-11: Verify QT Chart for each day changes after deleting Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-12: Verify QT Chart for each day changes after changing to N beats for multiple thumbnails by hotkey N on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-12       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-13: Verify QT Chart for each day changes after changing to S beats for multiple thumbnails by hotkey S on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-13       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-14: Verify QT Chart for each day changes after changing to V beats for multiple thumbnails by hotkey V on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-14       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-15: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by hotkey Q on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-16: Verify QT Chart for each day changes after deleting Q beats for multiple thumbnails by hotkey D on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-16       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-17: Verify QT Chart for each day changes after changing all to N beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-18: Verify QT Chart for each day changes after changing all to S beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-18       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-19: Verify QT Chart for each day changes after changing all to V beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-19       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-20: Verify QT Chart for each day does not change after changing all to Q beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-20       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-21: Verify QT Chart for each day changes after deleting all beats tool by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-21       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-22: Verify QT Chart for each day does not change after using do nothing tool of page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-22       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-23: Verify QT Chart for each day changes after changing all to N beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-23       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-24: Verify QT Chart for each day changes after changing all to S beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-24       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-25: Verify QT Chart for each day changes after changing all to V beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-25       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-26: Verify QT Chart for each day does not change after changing all to Q beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-26       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-27: Verify QT Chart for each day changes after deleting all beats tool by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-27       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-28: Verify QT Chart for each day does not change after using hotkey 1 of page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-28       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-29: Verify QT Chart for each day changes after changing all to N beat by hotkey 2 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-29       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-30: Verify QT Chart for each day changes after changing all to S beat by hotkey 3 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-30       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-31: Verify QT Chart for each day changes after changing all to V beat by hotkey 4 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-31       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-32: Verify QT Chart for each day does not change after changing all to Q beat by hotkey 5 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-32       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-33: Verify QT Chart for each day changes after deleting all beats by hotkey 6 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-33       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-34: Verify QT Chart for each day changes after changing to N beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-34       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-35: Verify QT Chart for each day changes after changing to S beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-35       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-36: Verify QT Chart for each day changes after changing to V beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-36       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-37: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-37       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-38: Verify QT Chart for each day changes after deleting Q beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-38       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-39: Verify QT Chart for each day changes after changing to N beats for multiple thumbnails by hotkey N on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-39       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-40: Verify QT Chart for each day changes after changing to S beats for multiple thumbnails by hotkey S on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-40       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-41: Verify QT Chart for each day changes after changing to V beats for multiple thumbnails by hotkey V on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-41       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-42: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by hotkey Q on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-42       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-43: Verify QT Chart for each day changes after deleting Q beats for multiple thumbnails by hotkey D on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-43       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-44: Verify QT Chart for each day changes after changing all to N beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-44       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-45: Verify QT Chart for each day changes after changing all to S beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-45       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-46: Verify QT Chart for each day changes after changing all to V beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-46       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-47: Verify QT Chart for each day does not change after changing all to Q beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-47       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-48: Verify QT Chart for each day changes after deleting all beats tool by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-48       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-49: Verify QT Chart for each day does not change after using do nothing tool of page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-49       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-50: Verify QT Chart for each day changes after changing all to N beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-50       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-51: Verify QT Chart for each day changes after changing all to S beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-51       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-52: Verify QT Chart for each day changes after changing all to V beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-52       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-53: Verify QT Chart for each day does not change after changing all to Q beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-53       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-54: Verify QT Chart for each day changes after deleting all beats tool by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-54       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-55: Verify QT Chart for each day does not change after using hotkey 1 of page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-55       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-56: Verify QT Chart for each day changes after changing all to N beat by hotkey 2 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-56       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-57: Verify QT Chart for each day changes after changing all to S beat by hotkey 3 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-57       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-58: Verify QT Chart for each day changes after changing all to V beat by hotkey 4 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-58       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-59: Verify QT Chart for each day does not change after changing all to Q beat by hotkey 5 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-59       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-60: Verify QT Chart for each day changes after deleting all beats by hotkey 6 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-60       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-61: Verify QT Chart for each day changes after adding new multiple Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-61       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-62: Verify QT Chart for each day changes after deleting multiple Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-62       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-63: Verify QT Chart for each day changes after changing multiple Q to N Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-63       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-64: Verify QT Chart for each day changes after changing multiple Q to S Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-64       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-65: Verify QT Chart for each day changes after changing multiple Q to V Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-65       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-66: Verify QT Chart for each day does not change after changing multiple Q to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-66       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-67: Verify QT Chart for each day changes after changing multiple N to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-67       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-68: Verify QT Chart for each day changes after changing multiple S to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-68       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-69: Verify QT Chart does not changes after changing multiple V to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-69       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-70: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-70       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-71: Verify QT Chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-71       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-72: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-72       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-73: Verify QT Chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-73       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-74: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-74       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-75: Verify QT Chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-75       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-76: Verify QT Chart for each day changes after changing all to Q beat by all beats actions tool on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-76       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-77: Verify QT Chart for each day changes after changing all to Q beat by all beats actions tool on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-77       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-78: Verify QT Chart for each day changes after changing all to Q beat by all beats actions tool on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-78       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-79: Verify QT Chart for each day changes after changing all to Q beat by page actions tool on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-79       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-80: Verify QT Chart for each day changes after changing all to Q beat by page actions tool on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-80       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-81: Verify QT Chart for each day changes after changing all to Q beat by page actions tool on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-81       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-82: Verify QT Chart for each day changes after changing all to Q beat by hotkey 5 on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-82       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-83: Verify QT Chart for each day changes after changing all to Q beat by hotkey 5 on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-83       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-84: Verify QT Chart for each day changes after changing all to Q beat by hotkey 5 on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-84       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-85: Verify QT Chart Changes After Adding new multiple Artifact events on Artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-85       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-86: Verify QT Chart Changes After Adding new multiple Artifact events on AFib events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-86       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-87: Verify QT Chart Changes After Adding new multiple Artifact events on R-R heatmap tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-87       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-88: Verify QT Chart Changes After Adding new multiple Artifact events on HR Summary tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-88       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-89: Verify QT Chart Changes After Deleting multiple Artifact events by using Delete event tool on Artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-89       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-90: Verify QT Chart Changes After changing duration multiple Artifact events on Artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-90       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91: Verify QT Chart for each day changes after using make as artifact tool on beat events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.1: Verify QT Chart for each day changes after using make as artifact tool for multiple VE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.1       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.2: Verify QT Chart for each day changes after using make as artifact tool for multiple VE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.2       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.3: Verify QT Chart for each day changes after using make as artifact tool for multiple VE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.3       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.4: Verify QT Chart for each day changes after using make as artifact tool for multiple VE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.4       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.5: Verify QT Chart for each day changes after using make as artifact tool for multiple VE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.5       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.6: Verify QT Chart for each day changes after using make as artifact tool for multiple SVE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.6       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.7: Verify QT Chart for each day changes after using make as artifact tool for multiple SVE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.7       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.8: Verify QT Chart for each day changes after using make as artifact tool for multiple SVE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.8       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.9: Verify QT Chart for each day changes after using make as artifact tool for multiple SVE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.9       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.10: Verify QT Chart for each day changes after using make as artifact tool for multiple SVE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-91.10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-92: Verify QT chart does not display values when no data is available for each day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-92       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93: Verify QT Chart for each day changes after using make as artifact tool on rhythm events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.1: Verify QT Chart for each day changes after using make as artifact tool for multiple AFib events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.1       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.2: Verify QT Chart for each day changes after using make as artifact tool for multiple Tachy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.2       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.3: Verify QT Chart for each day changes after using make as artifact tool for multiple Brady events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.3       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.4: Verify QT Chart for each day changes after using make as artifact tool for multiple Pause events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.4       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.5: Verify QT Chart for each day changes after using make as artifact tool for multiple VT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.5       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.6: Verify QT Chart for each day changes after using make as artifact tool for multiple SVT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.6       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.7: Verify QT Chart for each day changes after using make as artifact tool for multiple 2nd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.7       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.8: Verify QT Chart for each day changes after using make as artifact tool for multiple 3rd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-93.8       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-94: Verify QT Chart for each day changes after using make as artifact tool for multiple AFib events on AFib events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-94       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-95: Verify QT Chart Changes After Deleting multiple Artifact events by using hotkey D on Artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-95       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96: Verify QT Chart for each day changes after using hotkey A on ECG events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.1: Verify QT Chart for each day changes after using hotkey A for multiple VE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.1       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.2: Verify QT Chart for each day changes after using hotkey A for multiple VE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.2       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.3: Verify QT Chart for each day changes after using hotkey A for multiple VE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.3       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.4: Verify QT Chart for each day changes after using hotkey A for multiple VE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.4       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.5: Verify QT Chart for each day changes after using hotkey A for multiple VE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.5       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.6: Verify QT Chart for each day changes after using hotkey A for multiple SVE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.6       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.7: Verify QT Chart for each day changes after using hotkey A for multiple SVE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.7       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.8: Verify QT Chart for each day changes after using hotkey A for multiple SVE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.8       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.9: Verify QT Chart for each day changes after using hotkey A for multiple SVE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.9       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.10: Verify QT Chart for each day changes after using hotkey A for multiple SVE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.11: Verify QT Chart for each day changes after using hotkey A for multiple AFib events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.12: Verify QT Chart for each day changes after using hotkey A for multiple Tachy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.12       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.13: Verify QT Chart for each day changes after using hotkey A for multiple Brady events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.13       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.14: Verify QT Chart for each day changes after using hotkey A for multiple Pause events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.14       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.15: Verify QT Chart for each day changes after using hotkey A for multiple VT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.16: Verify QT Chart for each day changes after using hotkey A for multiple SVT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.16       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.17: Verify QT Chart for each day changes after using hotkey A for multiple 2nd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.18: Verify QT Chart for each day changes after using hotkey A for multiple 3rd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/07/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-96.18       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97: Verify QT Chart for each day changes after using Mark all as artifact function on menu option of ECG Events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.1: Verify QT Chart for each day changes after using Mark all as artifact function for VE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.1      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.2: Verify QT Chart for each day changes after using Mark all as artifact function for VE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.2      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.3: Verify QT Chart for each day changes after using Mark all as artifact function for VE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.3      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.4: Verify QT Chart for each day changes after using Mark all as artifact function for VE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.4      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.5: Verify QT Chart for each day changes after using Mark all as artifact function for VE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.5      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.6: Verify QT Chart for each day changes after using Mark all as artifact function for SVE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.6      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.7: Verify QT Chart for each day changes after using Mark all as artifact function for SVE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.7      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.8: Verify QT Chart for each day changes after using Mark all as artifact function for SVE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.8      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.9: Verify QT Chart for each day changes after using Mark all as artifact function for SVE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.9      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.10: Verify QT Chart for each day changes after using Mark all as artifact function for SVE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.10      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.11: Verify QT Chart for each day changes after using Mark all as artifact function for AFib events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.11      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.12: Verify QT Chart for each day changes after using Mark all as artifact function for Tachy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.12      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.13: Verify QT Chart for each day changes after using Mark all as artifact function for Brady events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.13      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.14: Verify QT Chart for each day changes after using Mark all as artifact function for Pause events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.14      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.15: Verify QT Chart for each day changes after using Mark all as artifact function for VT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.15      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.16: Verify QT Chart for each day changes after using Mark all as artifact function for SVT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.16      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.17: Verify QT Chart for each day changes after using Mark all as artifact function for 2nd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.17      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.18: Verify QT Chart for each day changes after using Mark all as artifact function for 3rd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-97.18      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-98: Verify QTc Chart for each day changes after changing duration multiple artifact events by hotkey C on artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QT-98       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-01: Verify a histogram chart depicting the QT corrected for heart rate throughout the duration of the report
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-02: Verify X-axis of QTc chart displays time in 24-hour format
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-02      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-03: Verify each column on X-Axis of QTc chart represents one hour
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-04: Verify X-Axis of QTc chart start time matches study start time
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-05: Verify Y-Axis of QTc chart Unit is ms
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-05       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-06: Verify Y-Axis of QTc chart Displays 4 Value Markers
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-06       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-07: Verify QTc Chart for each day changes after changing to N beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-07       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-08: Verify QTc Chart for each day changes after changing to S beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-08       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-09: Verify QTc Chart for each day changes after changing to V beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-09       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-10: Verify QTc Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-11: Verify QTc Chart for each day changes after deleting Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-12: Verify QTc Chart for each day changes after changing to N beats for multiple thumbnails by hotkey N on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-12       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-13: Verify QTc Chart for each day changes after changing to S beats for multiple thumbnails by hotkey S on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-13       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-14: Verify QTc Chart for each day changes after changing to V beats for multiple thumbnails by hotkey V on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-14       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-15: Verify QTc Chart for each day does not change after changing to Q beats for multiple thumbnails by hotkey Q on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-16: Verify QTc Chart for each day changes after deleting Q beats for multiple thumbnails by hotkey D on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-16       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-17: Verify QTc Chart for each day changes after changing all to N beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-18: Verify QTc Chart for each day changes after changing all to S beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-18       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-19: Verify QTc Chart for each day changes after changing all to V beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-19       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-20: Verify QTc Chart for each day does not change after changing all to Q beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-20       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-21: Verify QTc Chart for each day changes after deleting all beats by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-21       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-22: Verify QTc Chart for each day does not change after using do nothing tool of page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-22       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-23: Verify QTc Chart for each day changes after changing all to N beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-23       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-24: Verify QTc Chart for each day changes after changing all to S beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-24       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-25: Verify QTc Chart for each day changes after changing all to V beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-25       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-26: Verify QTc Chart for each day does not change after changing all to Q beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-26       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-27: Verify QTc Chart for each day changes after deleting all beats by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-27       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-28: Verify QTc Chart for each day does not change after using hotkey 1 of page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-28       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-29: Verify QTc Chart for each day changes after changing all to N beat by hotkey 2 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-29       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-30: Verify QTc Chart for each day changes after changing all to S beat by hotkey 3 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-30       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-31: Verify QTc Chart for each day changes after changing all to V beat by hotkey 4 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-31       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-32: Verify QTc Chart for each day does not change after changing all to Q beat by hotkey 5 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-32       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-33: Verify QTc Chart for each day changes after deleting all beats by hotkey 6 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-33       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-34: Verify QTc Chart for each day changes after changing to N beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-34       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-35: Verify QTc Chart for each day changes after changing to S beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-35       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-36: Verify QTc Chart for each day changes after changing to V beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-36       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-37: Verify QTc Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-37       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-38: Verify QTc Chart for each day changes after deleting Q beats for multiple thumbnails by the button by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-38       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-39: Verify QTc Chart for each day changes after changing to N beats for multiple thumbnails by hotkey N on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-39       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-40: Verify QTc Chart for each day changes after changing to S beats for multiple thumbnails by hotkey S on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-40       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-41: Verify QTc Chart for each day changes after changing to V beats for multiple thumbnails by hotkey V on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-41       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-42: Verify QTc Chart for each day does not change after changing to Q beats for multiple thumbnails by hotkey Q on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-42       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-43: Verify QTc Chart for each day changes after deleting Q beats for multiple thumbnails by hotkey D on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-43       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-44: Verify QTc Chart for each day changes after changing all to N beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-44       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-45: Verify QTc Chart for each day changes after changing all to S beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-45       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-46: Verify QTc Chart for each day changes after changing all to V beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-46       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-47: Verify QTc Chart for each day does not change after changing all to Q beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-47       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-48: Verify QTc Chart for each day changes after deleting all beats tool by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-48       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-49: Verify QTc Chart for each day does not change after using do nothing tool of page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-49       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-50: Verify QTc Chart for each day changes after changing all to N beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-50       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-51: Verify QTc Chart for each day changes after changing all to S beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-51       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-52: Verify QTc Chart for each day changes after changing all to V beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-52       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-53: Verify QTc Chart for each day does not change after changing all to Q beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-53       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-54: Verify QTc Chart for each day changes after deleting all beats tool by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/09/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-54       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-55: Verify QTc Chart for each day does not change after using hotkey 1 of page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-55       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-56: Verify QTc Chart for each day changes after changing all to N beat by hotkey 2 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-56       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-57: Verify QTc Chart for each day changes after changing all to S beat by hotkey 3 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-57       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-58: Verify QTc Chart for each day changes after changing all to V beat by hotkey 4 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-58       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-59: Verify QTc Chart for each day does not change after changing all to Q beat by hotkey 5 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-59       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-60: Verify QTc Chart for each day changes after deleting all beats by hotkey 6 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-60       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-61: Verify QTc Chart for each day changes after adding new multiple Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-61       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-62: Verify QTc Chart for each day changes after deleting multiple Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-62       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-63: Verify QTc Chart for each day changes after changing multiple Q to N Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/04/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-63       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-64: Verify QTc Chart for each day changes after changing multiple Q to S Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-64       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-65: Verify QTc Chart for each day changes after changing multiple Q to V Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-65       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-66: Verify QTc Chart for each day does not change after changing multiple Q to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-66       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-67: Verify QTc Chart for each day changes after changing multiple N to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-67       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-68: Verify QTc Chart for each day changes after changing multiple S to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-68       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-69: Verify QTc Chart for each day changes after changing multiple V to Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-69       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-70: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-70       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-71: Verify QT Chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-71       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-72: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-72       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-73: Verify QT Chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-73       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-74: Verify QT Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-74       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-75: Verify QT Chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-75       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-76: Verify QTc Chart for each day changes after changing all to Q beat by all beats actions tool on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-76       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-77: Verify QTc Chart for each day changes after changing all to Q beat by all beats actions tool on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-77       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-78: Verify QTc Chart for each day changes after changing all to Q beat by all beats actions tool on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-78       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-79: Verify QTc Chart for each day changes after changing all to Q beat by page actions tool on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-79       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-80: Verify QTc Chart for each day changes after changing all to Q beat by page actions tool on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-80       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-81: Verify QTc Chart for each day changes after changing all to Q beat by page actions tool on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-81       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-82: Verify QTc Chart for each day changes after changing all to Q beat by hotkey 5 on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-82       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-83: Verify QTc Chart for each day changes after changing all to Q beat by hotkey 5 on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-83       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-84: Verify QTc Chart for each day changes after changing all to Q beat by hotkey 5 on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-84       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-85: Verify QTc Chart for each day changes after adding new multiple artifact events on artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-85       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-86: Verify QTc Chart for each day changes after adding new multiple artifact events on AFib events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-86       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-87: Verify QTc Chart for each day changes after adding new multiple artifact events on R-R heatmap tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-87       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-88: Verify QTc Chart for each day changes after adding new multiple artifact events on HR Summary tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-88       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-89: Verify QTc Chart for each day changes after deleting multiple artifact events by the button on artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-89       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-90: Verify QTc Chart for each day changes after deleting multiple artifact events by hotkey D on artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-90       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-91: Verify QTc Chart for each day changes after changing duration multiple artifact events by the button on artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-91       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-92: Verify QTc Chart for each day changes after changing duration multiple artifact events by hotkey C on artifact areas tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-92       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93: Verify QTc Chart for each day changes after using make as artifact tool on ECG events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.1: Verify QTc Chart for each day changes after using make as artifact tool for multiple VE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.1       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.2: Verify QTc Chart for each day changes after using make as artifact tool for multiple VE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.2       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.3: Verify QTc Chart for each day changes after using make as artifact tool for multiple VE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.3       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.4: Verify QTc Chart for each day changes after using make as artifact tool for multiple VE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.4       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.5: Verify QTc Chart for each day changes after using make as artifact tool for multiple VE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.5       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.6: Verify QTc Chart for each day changes after using make as artifact tool for multiple SVE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.6       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.7: Verify QTc Chart for each day changes after using make as artifact tool for multiple SVE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.7       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.8: Verify QTc Chart for each day changes after using make as artifact tool for multiple SVE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.8       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.9: Verify QTc Chart for each day changes after using make as artifact tool for multiple SVE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.9       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.10: Verify QTc Chart for each day changes after using make as artifact tool for multiple SVE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.11: Verify QTc Chart for each day changes after using make as artifact tool for multiple AFib events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.12: Verify QTc Chart for each day changes after using make as artifact tool for multiple Tachy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.12       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.13: Verify QTc Chart for each day changes after using make as artifact tool for multiple Brady events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.13       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.14: Verify QTc Chart for each day changes after using make as artifact tool for multiple Pause events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.14       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.15: Verify QTc Chart for each day changes after using make as artifact tool for multiple VT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.16: Verify QTc Chart for each day changes after using make as artifact tool for multiple SVT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.16       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.17: Verify QTc Chart for each day changes after using make as artifact tool for multiple 2nd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.18: Verify QTc Chart for each day changes after using make as artifact tool for multiple 3rd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-93.18       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-94: Verify QTc chart does not display values when no data is available for each day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-94       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-95: Verify QTc chart for each day changes after using make as artifact tool for multiple AFib events on AFib events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-95       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96: Verify QTc chart for each day changes after using hotkey A on ECG events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.1: Verify QTc chart for each day changes after using hotkey A for VE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.1       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.2: Verify QTc chart for each day changes after using hotkey A for VE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.2       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.3: Verify QTc chart for each day changes after using hotkey A for VE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.3       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.4: Verify QTc chart for each day changes after using hotkey A for VE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.4       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.5: Verify QTc chart for each day changes after using hotkey A for VE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.5       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.6: Verify QTc chart for each day changes after using hotkey A for SVE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.6       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.7: Verify QTc chart for each day changes after using hotkey A for SVE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.7       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.8: Verify QTc chart for each day changes after using hotkey A for SVE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.8       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.9: Verify QTc chart for each day changes after using hotkey A for SVE trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.9       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.10: Verify QTc chart for each day changes after using hotkey A for SVE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.11: Verify QTc chart for each day changes after using hotkey A for AFib events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.12: Verify QTc chart for each day changes after using hotkey A for Tachy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.12       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.13: Verify QTc chart for each day changes after using hotkey A for Brady events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.13       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.14: Verify QTc chart for each day changes after using hotkey A for Pause events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.14       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.15: Verify QTc chart for each day changes after using hotkey A for VT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.16: Verify QTc chart for each day changes after using hotkey A for SVT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.16       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.17: Verify QTc chart for each day changes after using hotkey A for 2nd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.18: Verify QTc chart for each day changes after using hotkey A for 3rd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-96.18       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97: Verify QTc chart for each day changes after using mark all as artifact function on menu option of ECG Events tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.1: Verify QTc chart for each day changes after using Mark all as artifact function for VE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.1       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.2: Verify QTc chart for each day changes after using Mark all as artifact function for VE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.2       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.3: Verify QTc chart for each day changes after using Mark all as artifact function for VE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.3       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.4: Verify QTc chart for each day changes after using Mark all as artifact function for VE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.4       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.5: Verify QTc chart for each day changes after using Mark all as artifact function for VE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.5       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.6: Verify QTc chart for each day changes after using Mark all as artifact function for SVE Couplet events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.6       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.7: Verify QTc chart for each day changes after using Mark all as artifact function for SVE Run events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.7       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.8: Verify QTc chart for each day changes after using Mark all as artifact function for SVE Bigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.8       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.9: Verify QTc chart for each day changes after using Mark all as artifact function for SVE Trigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.9       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.10: Verify QTc chart for each day changes after using Mark all as artifact function for SVE Quadrigeminy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.11: Verify QTc chart for each day changes after using Mark all as artifact function for AFib events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.12: Verify QTc chart for each day changes after using Mark all as artifact function for Tachy events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.12       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.13: Verify QTc chart for each day changes after using Mark all as artifact function for Brady events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.13       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.14: Verify QTc chart for each day changes after using Mark all as artifact function for Pause events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.14       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.15: Verify QTc chart for each day changes after using Mark all as artifact function for VT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.16: Verify QTc chart for each day changes after using Mark all as artifact function for SVT events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.16       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.17: Verify QTc chart for each day changes after using Mark all as artifact function for 2nd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.18: Verify QTc chart for each day changes after using Mark all as artifact function for 3rd Deg HB events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-97.18       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-01: Verify a chart depicting the number of groups of QT corrected for the heart rate values in milliseconds.
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-02: Verify X-axis of QTc Histogram Chart displays the heart rate values in milliseconds for each day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-02       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-03: Verify Y-Axis of QTc Histogram Chart displays the number of groups of QT for each day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-04: Verify the Y-axis values of QTc histogram chart vary according to 24 hour data
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-05: Verify QTc Histogram Chart for each day changes after changing to N beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-05       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-06: Verify QTc Histogram Chart for each day changes after changing to S beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-06       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-07: Verify QTc Histogram Chart for each day changes after changing to V beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-07       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-08: Verify QTc Histogram Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-08       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-09: Verify QTc Histogram Chart for each day changes after deleting Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-09       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-10: Verify QTc Histogram Chart for each day changes after changing to N beats for multiple thumbnails by hotkey N on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-11: Verify QTc Histogram Chart for each day changes after changing to S beats for multiple thumbnails by hotkey S on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-11       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-12: Verify QTc Histogram Chart for each day changes after changing to V beats for multiple thumbnails by hotkey V on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-12      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-13: Verify QTc Histogram Chart for each day does not changes after changing to Q beats for multiple thumbnails by hotkey Q on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]     BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-13       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-14: Verify QTc Histogram Chart for each day changes after deleting Q beats for multiple thumbnails by hotkey D on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-14       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-15: Verify QTc histogram chart does not display values when no data is available for each day
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-15       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-16: Verify QTc histogram chart for each day changes after changing all to N beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-16       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-17: Verify QTc histogram chart for each day changes after changing all to S beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-17       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-18: Verify QTc histogram chart for each day changes after changing all to V beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-18       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-19: Verify QTc histogram chart for each day does not change after changing all to Q beat by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-19       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-20: Verify QTc histogram chart for each day changes after deleting all beats by All beats actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-20       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-21: Verify QTc histogram chart for each day changes after changing all to N beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-21       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-22: Verify QTc histogram chart for each day changes after changing all to S beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-22       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-23: Verify QTc histogram chart for each day changes after changing all to V beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-23       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-24: Verify QTc histogram chart for each day does not change after changing all to Q beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-24       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-25: Verify QTc histogram chart for each day changes after deleting all beat by page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-25       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-26: Verify QTc histogram chart for each day does not change after using hotkey 1 of page actions tool on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-26       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-27: Verify QTc histogram chart for each day changes after changing all to N beat by hotkey 2 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-27       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-28: Verify QTc histogram chart for each day changes after changing all to S beat by hotkey 3 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-28       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-29: Verify QTc histogram chart for each day changes after changing all to V beat by hotkey 4 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-29       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-30: Verify QTc histogram chart for each day does not change after changing all to Q beat by hotkey 5 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-30       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-31: Verify QTc histogram chart for each day changes after deleting all beats by hotkey 6 on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-31       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-32: Verify QTc histogram chart for each day changes after changing all to N beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-32       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-33: Verify QTc histogram chart for each day changes after changing all to S beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-33       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-34: Verify QTc histogram chart for each day changes after changing all to V beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-34       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-35: Verify QTc histogram chart for each day does not change after changing all to Q beat by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-35       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-36: Verify QTc histogram chart for each day changes after deleting all beats by All beats actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-36       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-37: Verify QTc histogram chart for each day changes after changing all to N beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-37       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-38: Verify QTc histogram chart for each day changes after changing all to S beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-38       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-39: Verify QTc histogram chart for each day changes after changing all to V beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-39       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-40: Verify QTc histogram chart for each day does not change after changing all to Q beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-40       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-41: Verify QTc histogram chart for each day changes after deleting all beat by page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-41       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-42: Verify QTc histogram chart for each day does not change after using hotkey 1 of page actions tool on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-42       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-43: Verify QTc histogram chart for each day changes after changing all to N beat by hotkey 2 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-43       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-44: Verify QTc histogram chart for each day changes after changing all to S beat by hotkey 3 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-44       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-45: Verify QTc histogram chart for each day changes after changing all to V beat by hotkey 4 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-45       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-46: Verify QTc histogram chart for each day does not change after changing all to Q beat by hotkey 5 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-46       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-47: Verify QTc histogram chart for each day changes after deleting all beats by hotkey 6 on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-47       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-48: Verify QTc histogram chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-48       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-49: Verify QTc histogram chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-49       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-50: Verify QTc histogram chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-50       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-51: Verify QTc histogram chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-51       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-52: Verify QTc histogram chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-52       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-53: Verify QTc histogram chart for each day changes after changing to Q beats for multiple thumbnails by hotkey Q on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-53       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-54: Verify QTc histogram chart for each day changes after changing all to Q beat by all beats actions tool on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-54       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-55: Verify QTc histogram chart for each day changes after changing all to Q beat by all beats actions tool on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-55       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-56: Verify QTc histogram chart for each day changes after changing all to Q beat by all beats actions tool on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-56       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-57: Verify QTc histogram chart for each day changes after changing all to Q beat by page actions tool on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-57       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-58: Verify QTc histogram chart for each day changes after changing all to Q beat by page actions tool on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-58       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-59: Verify QTc histogram chart for each day changes after changing all to Q beat by page actions tool on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-59       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-60: Verify QTc histogram chart for each day changes after changing all to Q beat by hotkey 5 on V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-60       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-61: Verify QTc histogram chart for each day changes after changing all to Q beat by hotkey 5 on S beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-61       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-62: Verify QTc histogram chart for each day changes after changing all to Q beat by hotkey 5 on N beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-62       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-63: Verify QTc histogram chart for each day changes after adding new multiple Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-63       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-64: Verify QTc histogram chart for each day changes after deleting multiple Q Beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-64       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-65: Verify QTc histogram chart for each day changes after changing multiple Q to N beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-65       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-66: Verify QTc histogram chart for each day changes after changing multiple Q to S beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-66       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-67: Verify QTc histogram chart for each day changes after changing multiple Q to V beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-67       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-68: Verify QTc histogram chart for each day does not change after changing multiple Q to Q beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-68       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-69: Verify QTc histogram chart for each day changes after changing multiple N to Q beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-69       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-70: Verify QTc histogram chart for each day changes after changing multiple S to Q beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-70       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-71: Verify QTc histogram chart for each day changes after changing multiple V to Q beats on ECG Viewer
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-71       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-72: Verify QTc Histogram Chart for each day changes after changing to N beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-72       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-73: Verify QTc Histogram Chart for each day changes after changing to S beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-73       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-74: Verify QTc Histogram Chart for each day changes after changing to V beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-74       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-75: Verify QTc Histogram Chart for each day does not change after changing to Q beats for multiple thumbnails by the button on Q-Q beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-75       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-76: Verify QTc Histogram Chart for each day changes after deleting Q beats for multiple thumbnails by the button on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-76       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-77: Verify QTc Histogram Chart for each day changes after changing to N beats for multiple thumbnails by hotkey N on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-77       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-78: Verify QTc Histogram Chart for each day changes after changing to S beats for multiple thumbnails by hotkey S on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-78       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-79: Verify QTc Histogram Chart for each day changes after changing to V beats for multiple thumbnails by hotkey V on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/10/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-79      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-80: Verify QTc Histogram Chart for each day does not changes after changing to Q beats for multiple thumbnails by hotkey Q on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]     BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-80       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-81: Verify QTc Histogram Chart for each day changes after deleting Q beats for multiple thumbnails by hotkey D on Q-N/S/V beats tab
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-HISTOGRAM-81       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-01: Verify QTc Variability Table Changes After Updating Q Beats to N Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-01       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-02: Verify QTc Variability Table Changes After Updating Q Beats to V Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-02       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-03: Verify QTc Variability Table Changes After Updating Q Beats to S Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-03       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-04: Verify QTc Variability Table Changes After Updating N Beats to Q Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-04       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-05: Verify QTc Variability Table Changes After Updating V Beats to Q Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-05       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-06: Verify QTc Variability Table Changes After Updating S Beats to Q Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-06      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-07: Verify QTc Variability Table Changes After Deleting Q Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-07      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-08: Verify QTc Variability Table Changes After Adding Q Beats
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-08      AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-09: Verify QTc Variability Table Changes After Adding Artifact events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]     BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-09       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-10: Verify QTc Variability Table Changes After Deleting Artifact events
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-10       AIRP-1.14.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-11: Verify QTc variability table does not display values when no data is available for 24 hours
     [Documentation]     Author: Hang Le
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
    ...     Update Date: 12/03/2024 - Hang Le

    [Tags]      BFCC-AIRP-PDF-REPORT-QTC-CHART-QTC-VARIABILITY-11       AIRP-1.14.0       manual      R1
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