*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-PVC
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
Force Tags      BFCC-AIRP-PDF-REPORT-PVC  web
Test Timeout    30m

*** Test Cases ***

BFCC-AIRP-PDF-REPORT-PVC-VIEW-01: Verify that the PVC MORPHOLOGY ANALYSIS page is excluded from PDF report when no templates are included
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-01       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-01.1: Verify Total VE beats, Morphollogy #, Beat count and % of PVC are correctly displayed after including V template in the report
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-01.1       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-02: Verify that the Morphology # correctly reflects the V template that was previously included in the report
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-02       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-03: Verify that the beat count matches the number of beats in the corresponding morphology
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-03       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-03.1: Verify that the beat count matches the number of beats in the corresponding morphology
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-03.1       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-04: Verify that % of PVC is accurately calculated per V beat type over total V beats
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-04       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-05: Verify that the V morphology templates are sorted in descending order based on beat count
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-05       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-06: Verify that the PVC morphologies shows burden metrics for up to 5 morphology patterns in the report
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-06       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-07: Verify that the PVC morphologies shows waveform preview for each morphology type matching included templates from V Morphologies tab
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-07       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-08: Verify that the Hourly Morphology Burden Histogram (%) in PVC morphologies is calculated correctly based on given formula
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-08       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-09: Verify that the Hourly Morphology Burden Histogram (%) in PVC morphologies shows minimum of 2%, even for a single beat
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-09       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-10: Verify that the Histogram is divided into Night Shift (18:00–08:00) and Day Shift (08:00–18:00)
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-10       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-VIEW-11: Verify that the PVC Morphologies displays case-specific data for up to 30 days based on study runtime
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-VIEW-11       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-01: Verify that the V morphology templates re-sort after updating beats from the Q-Q tab to V in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-01       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-02: Verify that the V morphology templates re-sort after updating beats from the Q-N/S/V tab to V in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-02       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-03: Verify that the V morphology templates re-sort after updating beats from the S tab to V in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-03       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-04: Verify that the V morphology templates re-sort after updating beats from the N tab to V in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-04       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-05: Verify that the V morphology templates re-sort after updating beats from the V tab to N in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-05       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-06: Verify that the V morphology templates re-sort after updating beats from the V tab to S in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-06       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-07: Verify that the V morphology templates re-sort after updating beats from the V tab to Q in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-07       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-08: Verify that the V morphology templates re-sort after deleting beats from the V tab in the R-R heatmap section
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-08       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-09: Verify that the V morphology templates re-sort after adding new artifact event in the area containing V beats
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-09       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-10: Verify that the V morphology templates re-sort after changing included template’s beats to N beats in V morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-10       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-11: Verify that the V morphology templates re-sort after changing included template’s beats to S beats in V morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-11       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-12: Verify that the V morphology templates re-sort after changing included template’s beats to Q beats in V morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-12       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-13: Verify that the V morphology templates re-sort after deleting included template’s beats in V morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-13       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-SORT-14: Verify that the V morphology templates re-sort after swapping included template’s beats with another template in V morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-SORT-14       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-01: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing Q beats to V beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-01       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-02: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing S beats to V beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-02       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-03: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing N beats to V beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-03       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-04: Verify that the Total VE beats, Morphollogy #, Beat count and % of PVC are correctly updated after deleting V beats on the R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-04       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-05: Verify that the Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding artifact event overrides V beats on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-05       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-06: Verify that the Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding artifact event overrides V beats on Artifact tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-06       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-07: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing V beats to Q beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-07       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-08: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing V beats to S beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-08       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-09: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing V beats to N beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-09       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-10: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing V beats to Q beat on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-10       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-11: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing V beats to S beat on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-11       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-12: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing V beats to N beat on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-12       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-13: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after deleting V beats on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-13       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-14: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after marking VE Couplet events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-14       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-15: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Mark All as Artifact' on all VE Couplet events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-15       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-16: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after deleting VE Couplet events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-16       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-17: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Delete all events' on all VE Couplet events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-17       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-18: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides VE Couplet event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-18       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-19: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding SVT event that overrides VE Couplet event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-19       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-20: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after marking VE Run events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-20       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-21: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Mark All as Artifact' on all VE Run events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-21       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-22: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after deleting VE Run events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-22       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-23: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Delete all events' on all VE Run events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-23       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-24: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides VE Run event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-24       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-25: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding SVT event that overrides VE Run event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-25       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-26: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after marking VE Bigeminy events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-26       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-27: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Mark All as Artifact' on all VE Bigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-27       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-28: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after deleting VE Bigeminy events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-28       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-29: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Delete all events' on all VE Bigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-29       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-30: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides VE Bigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-30       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-31: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding SVT event that overrides VE Bigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-31       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-32: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after marking VE Trigeminy events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-32       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-33: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Mark All as Artifact' on all VE Trigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-33       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-34: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after deleting VE Trigeminy events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-34       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-35: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Delete all events' on all VE Trigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-35       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-36: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides VE Trigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-36       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-37: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding SVT event that overrides VE Trigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-37       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-38: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after marking VE Quadrigeminy events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-38       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-39: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Mark All as Artifact' on all VE Quadrigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-39       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-40: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after deleting VE Quadrigeminy events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-40       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-41: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after using 'Delete all events' on all VE Quadrigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-41       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-42: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides VE Quadrigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-42       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-43: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding SVT event that overrides VE Quadrigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-43       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-44: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides SVE Couplet event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-44       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-45: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides SVE Run event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-45       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-46: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides SVE Bigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-46       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-47: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides SVE Trigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-47       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-48: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides SVE Quadrigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-48       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-49: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides AFib event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-49       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-50: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides Tachy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-50       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-51: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides Brady event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-51       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-52: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides Pause event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-52       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-53: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-53       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-54: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides SVT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-54       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-55: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides 2nd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-55       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-56: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after adding VT event that overrides 3rd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-56       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-57: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing VT events to AFib event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-57       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-58: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing VT events to SVT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-58       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-59: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing VT events to 2nd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-59       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-60: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing VT events to 3rd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-60       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-61: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing AFib events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-61       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-62: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing Tachy events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-62       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-63: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing Brady events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-63       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-64: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing Pause events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-64       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-65: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing Pause events to SVT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-65       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-66: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing Pause events to 2nd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-66       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-INFO-67: Verify Total VE beats, Morphollogy #, Beat count and % of PVC update correctly after changing Pause events to 3rd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-INFO-67       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-01: Verify Morphology # updates correctly after adding a template when total templates in report are fewer than 5
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-01       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-02: Verify Morphology # updates correctly after excluding a template in V Morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-02       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-03: Verify Morphology # updates correctly after swapping included template with another in the report
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-03       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-04: Verify Morphology # updates correctly after changing all V beats in a template to N beat in V Morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-04       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-05: Verify Morphology # updates correctly after changing all V beats in a template to S beat in V Morphologies page
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
    ...     **Others**
    ...     Update date: 6/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-05       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-06: Verify Morphology # updates correctly after changing all V beats in a template to Q beat in V Morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-06       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-07: Verify Morphology # updates correctly after deleting all V beats in a template in Morphologies page
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
    ...     **Others**
    ...     Update date: 6/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-TEMPLATE-07       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-01: Verify Hourly morphology burden histogram (%) update correctly after changing Q beats to V beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-01       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-02: Verify Hourly morphology burden histogram (%) update correctly after changing S beats to V beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-02       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-03: Verify Hourly morphology burden histogram (%) update correctly after changing N beats to V beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-03       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-04: Verify that the Hourly morphology burden histogram (%) are correctly updated after deleting V beats on the R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-04       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-05: Verify that the Hourly morphology burden histogram (%) update correctly after adding artifact event overrides V beats on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-05       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-06: Verify that the Hourly morphology burden histogram (%) update correctly after adding artifact event overrides V beats on Artifact tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-06       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-07: Verify Hourly morphology burden histogram (%) update correctly after changing V beats to Q beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-07       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-08: Verify Hourly morphology burden histogram (%) update correctly after changing V beats to S beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-08       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-09: Verify Hourly morphology burden histogram (%) update correctly after changing V beats to N beat on R-R heat map
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-09       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-10: Verify Hourly morphology burden histogram (%) update correctly after changing V beats to Q beat on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-10       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-11: Verify Hourly morphology burden histogram (%) update correctly after changing V beats to S beat on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-11       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-12: Verify Hourly morphology burden histogram (%) update correctly after changing V beats to N beat on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-12       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-13: Verify Hourly morphology burden histogram (%) update correctly after deleting V beats on V Morphologies tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-13       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-14: Verify Hourly morphology burden histogram (%) update correctly after marking VE Couplet events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-14       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-15: Verify Hourly morphology burden histogram (%) update correctly after using 'Mark All as Artifact' on all VE Couplet events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-15       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-16: Verify Hourly morphology burden histogram (%) update correctly after deleting VE Couplet events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-16       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-17: Verify Hourly morphology burden histogram (%) update correctly after using 'Delete all events' on all VE Couplet events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-17       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-18: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides VE Couplet event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-18       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-19: Verify Hourly morphology burden histogram (%) update correctly after adding SVT event that overrides VE Couplet event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-19       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-20: Verify Hourly morphology burden histogram (%) update correctly after marking VE Run events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-20       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-21: Verify Hourly morphology burden histogram (%) update correctly after using 'Mark All as Artifact' on all VE Run events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-21       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-22: Verify Hourly morphology burden histogram (%) update correctly after deleting VE Run events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-22       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-23: Verify Hourly morphology burden histogram (%) update correctly after using 'Delete all events' on all VE Run events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-23       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-24: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides VE Run event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-24       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-25: Verify Hourly morphology burden histogram (%) update correctly after adding SVT event that overrides VE Run event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-25       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-26: Verify Hourly morphology burden histogram (%) update correctly after marking VE Bigeminy events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-26       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-27: Verify Hourly morphology burden histogram (%) update correctly after using 'Mark All as Artifact' on all VE Bigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-27       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-28: Verify Hourly morphology burden histogram (%) update correctly after deleting VE Bigeminy events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-28       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-29: Verify Hourly morphology burden histogram (%) update correctly after using 'Delete all events' on all VE Bigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-29       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-30: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides VE Bigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-30       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-31: Verify Hourly morphology burden histogram (%) update correctly after adding SVT event that overrides VE Bigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-31       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-32: Verify Hourly morphology burden histogram (%) update correctly after marking VE Trigeminy events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-32       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-33: Verify Hourly morphology burden histogram (%) update correctly after using 'Mark All as Artifact' on all VE Trigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-33       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-34: Verify Hourly morphology burden histogram (%) update correctly after deleting VE Trigeminy events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-34       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-35: Verify Hourly morphology burden histogram (%) update correctly after using 'Delete all events' on all VE Trigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-35       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-36: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides VE Trigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-36       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-37: Verify Hourly morphology burden histogram (%) update correctly after adding SVT event that overrides VE Trigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-37       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-38: Verify Hourly morphology burden histogram (%) update correctly after marking VE Quadrigeminy events as artifact via Artifact button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-38       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-39: Verify Hourly morphology burden histogram (%) update correctly after using 'Mark All as Artifact' on all VE Quadrigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-39       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-40: Verify Hourly morphology burden histogram (%) update correctly after deleting VE Quadrigeminy events via Delete button in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-40       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-41: Verify Hourly morphology burden histogram (%) update correctly after using 'Delete all events' on all VE Quadrigeminy events in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-41       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-42: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides VE Quadrigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-42       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-43: Verify Hourly morphology burden histogram (%) update correctly after adding SVT event that overrides VE Quadrigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-43       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-44: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides SVE Couplet event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-44       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-45: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides SVE Run event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-45       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-46: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides SVE Bigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-46       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-47: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides SVE Trigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-47       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-48: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides SVE Quadrigeminy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-48       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-49: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides AFib event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-49       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-50: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides Tachy event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-50       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-51: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides Brady event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-51       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-52: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides Pause event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-52       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-53: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-53       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-54: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides SVT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-54       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-55: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides 2nd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-55       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-56: Verify Hourly morphology burden histogram (%) update correctly after adding VT event that overrides 3rd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-56       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-57: Verify Hourly morphology burden histogram (%) update correctly after changing VT events to AFib event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-57       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-58: Verify Hourly morphology burden histogram (%) update correctly after changing VT events to SVT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-58       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-59: Verify Hourly morphology burden histogram (%) update correctly after changing VT events to 2nd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-59       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-60: Verify Hourly morphology burden histogram (%) update correctly after changing VT events to 3rd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-60       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-61: Verify Hourly morphology burden histogram (%) update correctly after changing AFib events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-61       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-62: Verify Hourly morphology burden histogram (%) update correctly after changing Tachy events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-62       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-63: Verify Hourly morphology burden histogram (%) update correctly after changing Brady events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-63       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-64: Verify Hourly morphology burden histogram (%) update correctly after changing Pause events to VT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-64       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-65: Verify Hourly morphology burden histogram (%) update correctly after changing Pause events to SVT event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-65       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-66: Verify Hourly morphology burden histogram (%) update correctly after changing Pause events to 2nd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-66       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-67: Verify Hourly morphology burden histogram (%) update correctly after changing Pause events to 3rd Deg HB event in ECG Event tab
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
    ...     **Others**
    ...     Update date: 5/5/2025 - Trinh Nguyen
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-PVC-HISTOGRAM-67       AIRP-1.15.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/VMorphologies.py            ${BROWSER_NODE}     ${ENV}
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