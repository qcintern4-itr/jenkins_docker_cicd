*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-COVER-PAGE
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
Force Tags      BFCC-AIRP-PDF-REPORT-COVER-PAGE  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-PDF-REPORT-COVER-PAGE-01: View all information on the cover page of a report is displayed same as design
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The Bioflux logo should be displayed in the top left corner/in the header of the report
    ...     2. Name and Logo (if any) of Clinic
    ...     3. Study Type (Holter/Extended Holter/ MCT PEEK/Mobile Cardiac Telemetry)
    ...     4. Type of report: ‘End of use report’
    ...     5. Date of Service
    ...     6. Patient Information
    ...     7. Diagnosis
    ...     8. Physicians Contact Information
    ...     9. Test summary
    ...     10. Heart rate
    ...     11. Burden
    ...     12. Atrial Fibrillation Summary
    ...     13. Findings
    ...
    ...     **Others**
    ...     Update Date: 7/12/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-01       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #Done

BFCC-AIRP-PDF-REPORT-COVER-PAGE-03: Referring physician information is displayed correctly in the first view
     [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - Referring physician information synchronizes with changes in the Diagnostic portal
    ...
    ...     **Others**
    ...     Update date: 05/27/2024 - Hoang Nguyen
    ...     Update date: 05/30/2024 - Trinh Nguyen
    ...     Update date: 07/12/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-03       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Open Browser Clinic
#    Navigate To Studies Page
#    Filter Studies  study_state=Completed
#    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
#    ${study}      Get Completed Studies
#    Manage Completed Study On      row=1
#    Navigate To Study Details Tab    Study details
#    ${study_details}        Get Study Details
#    ${referring_physican}       Set Variable        ${study_details}[Referring physician]
#    Navigate Airp Tab     tab=PDF Report
#    Wait For Pdf Viewer Available
#    Download File Pdf
#    ${data}     Read File Pdf Pages On     page_number=0
#    ${actual_referring_physican}     Get Value In Cover File Pdf   data_pdf=${data}
#    ${expected_phone_number}     Evaluate    "${referring_physican}[Day phone]".replace('-','–')
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_referring_physican}[phone_numbers_referring]      ${expected_phone_number}
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_referring_physican}[referring_physician]      ${referring_physican}[Name]
##    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-03.1: Referring physician information in the PDF report is updated synchronously with the Diagnostic Portal
     [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - Referring physician information synchronizes with changes in the Diagnostic portal
    ...
    ...     **Others**
    ...     Update date: 05/27/2024 - Hoang Nguyen
    ...     Update date: 05/30/2024 - Trinh Nguyen
    ...     Update date: 07/12/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-03.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-04: Interpreting physician information is displayed correctly in the first view
     [Documentation]     Author: Hoang Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     - Interpreting physician information synchronizes with changes in the Diagnostic portal
    ...
    ...     **Others**
    ...     Update date: 05/27/2024 - Hoang Nguyen
    ...     Update date: 05/30/2024 - Trinh Nguyen
    ...     Update date: 07/12/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-04       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Open Browser Clinic
#    Navigate To Studies Page
#    Filter Studies  study_state=Completed
#    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
#    ${study}      Get Completed Studies
#    Manage Completed Study On      row=1
#    Navigate To Study Details Tab    Study details
#    ${study_details}        Get Study Details
#    ${interpreting_physican}       Set Variable        ${study_details}[Interpreting physician]
#    Navigate Airp Tab     tab=PDF Report
#    Wait For Pdf Viewer Available
#    Download File Pdf
#    ${data}     Read File Pdf Pages On     page_number=0
#    ${actual_interpreting_physican}     Get Value In Cover File Pdf   data_pdf=${data}
#    ${expected_phone_number}     Evaluate    "${interpreting_physican}[Day phone]".replace('-','–')
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_interpreting_physican}[phone_numbers_interpreting]      ${expected_phone_number}
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_interpreting_physican}[interpreting_physician]      ${interpreting_physican}[Name]
##    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-05: Verify that Diagnosis is displayed correctly in the first view
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
    ...     Update date: 07/12/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-05       AIRP-1.9.0        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Open Browser Clinic
#    Navigate To Studies Page
#    Filter Studies  study_state=Completed
#    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
#    ${study}      Get Completed Studies
#    Manage Completed Study On      row=1
#    Navigate To Study Details Tab    Study details
#    ${study_details}        Get Study Details
#    ${diagnosis}       Set Variable        ${study_details}[Diagnosis
#    Navigate Airp Tab     tab=PDF Report
#    Wait For Pdf Viewer Available
#    Download File Pdf
#    ${data}     Read File Pdf Pages On     page_number=0
#    ${actual_diagnosis}     Get Value In Cover File Pdf   data_pdf=${data}
#    ${expected_primary_diagnosis}     Evaluate    "${diagnosis}[Primary diagnosis code]".replace('-','–')
#    ${expected_secondary_diagnosis}     Evaluate    "${diagnosis}[Secondary diagnosis code]".replace('-','–')
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_diagnosis}[primary_indication]        ${expected_primary_diagnosis}
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_diagnosis}[secondary_indication]      ${expected_secondary_diagnosis}
#    Run Keyword And Continue On Failure    Should Be Equal    ${actual_diagnosis}[patient_indication]        ${diagnosis}[Patient medication]

BFCC-AIRP-PDF-REPORT-COVER-PAGE-06: Verify that Total Test Duration is number of Days and Time in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-06       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-07: Verify that Analysis time matches Total Time Monitored on the call center portal in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-07       AIRP-1.9.0        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#    Navigate To Tab Menu      Studies
#    Navigate To Subtab Menu        Completed
#    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
#    Manage Complete Study On              row=1
#    Navigate To Subtab Menu       Study Details
#    ${study_details}        Get Study Details Callcenter
#    ${time_monitored}       Set Variable     ${study_details}[STUDY INFORMATION][Time Monitored]
#    ${expected_time_monitored}      Convert Time To Minutes    ${time_monitored}
#    Navigate To Subtab Menu       Reports
#    View Completed New Report Status On          row=1
#    Switch Tab

#    Navigate Airp Tab     tab=PDF Report
#    Wait For Pdf Viewer Available
#    Download File Pdf
#    ${data}     Read File Pdf Pages On     page_number=0
#    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
#    Run Keyword And Continue On Failure    Should Be Equal    ${expected_time_monitored}        ${actual_test_summary}[total_test_duration]

BFCC-AIRP-PDF-REPORT-COVER-PAGE-08: Verify the Auto-triggers is displayed correctly in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-08       AIRP-1.9.0         manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    [Setup


#    Navigate Airp Tab     tab=Strips Management
#    Navigate To Tab Menu Strips Management      menu=Included in report
#    ${number_events}        Get Total Number Events Strips Management
#    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
#    ${number_events_manual}        Get Total Number Events Strips Management
#    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
#    Navigate Airp Tab     tab=PDF Report
#    Wait For Pdf Viewer Available
#    Download File Pdf
#    ${data}     Read File Pdf Pages On     page_number=0
#    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
#    ${actual_auto_triggers}     Evaluate    int(${actual_test_summary}[auto_triggers])
#    Run Keyword And Continue On Failure    Should Be Equal    ${number_events_auto}        ${actual_auto_triggers}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-33: Verify the manual events are displayed correctly in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-33       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-34: Verify the manual events is displayed correctly with symptom 'Baseline' closed as Valid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-34       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #Done

BFCC-AIRP-PDF-REPORT-COVER-PAGE-35: Verify the manual events is displayed correctly with symptom 'Resume Study' closed as Valid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-35       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #Done
BFCC-AIRP-PDF-REPORT-COVER-PAGE-36: Verify the manual events is displayed correctly with symptom 'Evaluation strip' closed as Valid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-36       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #Done
BFCC-AIRP-PDF-REPORT-COVER-PAGE-37: Verify the manual events is displayed correctly with symptom 'Palpitations' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-37       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-38: Verify the manual events is displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-38       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-39: Verify the manual events is displayed correctly with symptom 'Dizziness' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-39       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-40: Verify the manual events is displayed correctly with symptom 'Chest Pain' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-40       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-41: Verify the manual events is displayed correctly with symptom 'Other' closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-41       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-42: Verify the manual events is displayed correctly with symptom 'Not Specified' closed as Valid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-42       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    #Done

BFCC-AIRP-PDF-REPORT-COVER-PAGE-46: Verify the manual events is displayed correctly with symptom 'Palpitations' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-46       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-48: Verify the manual events is displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-48       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-49: Verify the manual events is displayed correctly with symptom 'Dizziness' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-49       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-50: Verify the manual events is displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-50       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-51: Verify the manual events is displayed correctly with symptom 'Other' closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-51       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-53: Verify the symptom 'Baseline' is not counted on the Manual events if closed as valid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-53       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-55: Verify the symptom 'Resume study' is not counted on the Manual events if closed as valid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-55       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-57: Verify the symptom 'Evaluation strip' is not counted on the Manual events if closed as valid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-57       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-59: Verify the symptom 'Palpitations' is not counted on the Manual events if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-59       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-60: Verify the symptom 'Palpitations' is not counted on the Manual events if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-60       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-61: Verify the symptom 'Shortness of breath' is not counted on the Manual events if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-61       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-62: Verify the symptom 'Shortness of breath' is not counted on the Manual events if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-62       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-63: Verify the symptom 'Dizziness' is not counted on the Manual events if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-63       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-64: Verify the symptom 'Dizziness' is not counted on the Manual events if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-64       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-65: Verify the symptom 'Chest Pain' is not counted on the Manual events if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-65       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-66: Verify the symptom 'Chest Pain' is not counted on the Manual events if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-66       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-67: Verify the symptom 'Other' is not counted on the Manual events if closed as valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-67       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-68: Verify the symptom 'Other' is not counted on the Manual events if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-68       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-69: Verify the symptom 'Not Specified' is not counted on the Manual events if closed as valid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-69       AIRP-1.9.1       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-71: Verify the Correlated events are displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-71       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-96: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-96       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-97: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-97       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-98: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-98       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-99: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-99       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-100: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-100       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-101: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-101       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-102: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-102       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-103: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-103       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-104: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-104       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-105: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-105       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-106: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-106       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-107: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-107       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-108: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-108       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-109: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-109       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-110: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-110       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-111: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-111       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-112: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-112       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-113: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-113       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-114: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-114       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-115: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-115       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-116: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-116       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-117: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-117       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-118: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-118       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-119: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-119       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-144: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-144       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-145: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-145       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-146: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-146       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-147: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-147       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-148: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-148       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-149: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-149       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-150: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-150       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-151: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-151       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-152: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-152       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-153: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-153       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-154: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-154       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-155: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-155       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-156: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-156       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-157: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-157       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-158: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-158       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-159: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-159       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-160: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-160       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-161: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-161       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-162: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-162       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-163: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-163       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-164: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-164       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-165: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-165       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-166: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-166       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-167: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-167       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-192: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-192       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-193: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-193       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-194: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-194       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-195: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-195       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-196: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-196       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-197: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-197       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-198: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-198       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-199: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-199       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-200: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-200       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-201: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-201       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-202: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-202       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-203: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-203       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-204: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-204       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-205: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-205       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-206: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-206       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-207: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-207       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-208: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-208       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-209: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-209       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-210: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-210       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-211: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-211       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-212: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-212       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-213: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-213       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-214: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-214       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-215: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-215       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-216: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-216       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-217: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-217       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-218: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-218       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-219: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-219       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-220: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-220       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-221: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-221       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-222: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-222       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-223: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-223       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-224: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-224       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-225: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-225       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-226: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-226       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-227: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-227       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-228: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-228       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-229: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-229       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-230: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-230       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-231: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-231       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-232: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-232       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-233: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-233       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-234: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-234       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-235: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-235       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-236: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-236       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-237: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-237       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-238: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-238       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-239: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-239       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-240: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-240       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-241: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-241       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-242: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-242       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-242.: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-242.       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-243: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-243       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-244: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-244       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-245: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-245       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-246: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-246       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-247: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-247       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-248: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-248       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-249: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-249       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-250: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-250       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-251: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-251       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-252: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-252       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-253: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-253       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-254: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-254       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-255: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-255       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-256: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-256       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-257: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-257       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-258: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-258       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-259: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-259       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-260: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-260       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-261: Verify the Correlated events are displayed correctly with symptom 'Palpitations' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-261       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-262: Verify the Correlated events are displayed correctly with symptom 'Palpitations ' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-262       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-263: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-263       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-264: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-264       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-265: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-265       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-266: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-266       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-267: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-267       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-268: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-268       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-269: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-269       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-270: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-270       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-271: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-271       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-272: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-272       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-273: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-273       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-274: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-274       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-275: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-275       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-276: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-276       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-277: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-277       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-278: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-278       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-279: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-279       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-280: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-280       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-281: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-281       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-282: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-282       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-283: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-283       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-284: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-284       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-285: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-285       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-286: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-286       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-287: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-287       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-288: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-288       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-289: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-289       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-290: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-290       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-291: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-291       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-292: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-292       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-293: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-293       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-294: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-294       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-295: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-295       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-296: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-296       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-297: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-297       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-298: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-298       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-299: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-299       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-300: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-300       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-301: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-301       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-302: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-302       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-303: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-303       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-304: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-304       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-305: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-305       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-307: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-307       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-308: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-308       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-309: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-309       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-310: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-310       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-311: Verify the Correlated events are displayed correctly with symptom 'Shortness of breath' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-311       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-312: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-312       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-313: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-313       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-314: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-314       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-315: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-315       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-316: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-316       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-317: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-317       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-318: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-318       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-318.: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-318.       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-319: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-319       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-320: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-320       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-321: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-321       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-322: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-322       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-323: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-323       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-324: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-324       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-325: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-325       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-326: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-326       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-327: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-327       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-328: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-328       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-329: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-329       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-330: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-330       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-331: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-331       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-332: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-332       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-333: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-333       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-334: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-334       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-335: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-335       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-336: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-336       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-337: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-337       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-338: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-338       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-339: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-339       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-340: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-340       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-341: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-341       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-342: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-342       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-343: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-343       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-344: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-344       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-345: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-345       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-346: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-346       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-347: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-347       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-348: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-348       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-349: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-349       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-350: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-350       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-352: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-352       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-353: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-353       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-354: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-354       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-355: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-355       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-356: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-356       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-357: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-357       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-358: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-358       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-359: Verify the Correlated events are displayed correctly with symptom 'Dizziness' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-359       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-360: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-360       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-361: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-361       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-363: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-363       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-364: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-364       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-365: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-365       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-366: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-366       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-367: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-367       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-368: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-368       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-369: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-369       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-370: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-370       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-371: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-371       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-372: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-372       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-373: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-373       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-374: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-374       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-375: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-375       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-376: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-376       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-377: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-377       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-378: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-378       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-379: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-379       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-380: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-380       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-381: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-381       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-382: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-382       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-383: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-383       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-384: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-384       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-385: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-385       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-386: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-386       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-387: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-387       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-388: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-388       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-389: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-389       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-390: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-390       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-391: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-391       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-392: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-392       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-393: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-393       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-394: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-394       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-395: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-395       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-396: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-396       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-397: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-397       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-398: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-398       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-399: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-399       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-400: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-400       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-401: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-401       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-402: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-402       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-403: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-403       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-404: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-404       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-405: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-405       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-406: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-406       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-407: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-407       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-408: Verify the Correlated events are displayed correctly with symptom 'Chest Pain' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-408       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-409: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-409       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-410: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-410       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-411: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-411       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-412: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-412       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-413: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-413       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-414: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-414       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-415: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-415       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-416: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-416       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-417: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-417       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-418: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-418       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-419: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-419       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-420: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-420       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-421: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-421       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-422: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-422       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-423: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-423       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-424: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-424       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-425: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-425       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-426: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-426       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-427: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-427       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-428: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-428       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-429: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-429       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-429.: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-429.       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-430: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-430       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-431: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-431       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-432: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-432       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-433: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-433       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-434: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-434       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-435: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-435       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-436: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-436       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-437: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-437       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-438: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-438       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-439: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-439       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-440: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-440       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-441: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-441       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-442: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-442       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-443: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-443       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-444: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-444       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-445: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-445       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-446: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-446       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-447: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-447       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-448: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-448       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-449: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-449       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-450: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-450       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-451: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-451       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-452: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-452       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-453: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-453       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-454: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-454       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-455: Verify the Correlated events are displayed correctly with symptom 'Other' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-455       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-480: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-480       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-481: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-481       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-482: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-482       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-483: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-483       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-484: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-484       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-485: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-485       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-486: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-486       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-487: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-487       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-488: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-488       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-489: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-489       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-490: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-490       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-491: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-491       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-492: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-492       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-493: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-493       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-494: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-494       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-495: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-495       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-496: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-496       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-497: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-497       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-498: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-498       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-499: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-499       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-500: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-500       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-501: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-501       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-502: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-502       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-503: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Invalid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-503       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-507: Verify the symptom 'Baseline' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
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
    ...     Done
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-507       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-508: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-508       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-509: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
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
    ...     Done
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-509       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-513: Verify the symptom 'Resume study' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-513       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-514: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-514       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-515: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-515       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-519: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-519       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-520: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-520       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-521: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-521       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-522: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-522       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-523: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-523       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-524: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-524       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-525: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-525       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-526: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-526       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-527: Verify the symptom 'Palpitations' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-527       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-528: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-528       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-529: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-529       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-530: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-530       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-531: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-531       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-532: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-532       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-533: Verify the symptom 'Shortness of breath' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-533       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-534: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-534       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-535: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-535       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-536: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-536       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-537: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-537       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-538: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-538       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-539: Verify the symptom 'Dizziness' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-539       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-540: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-540       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-541: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-541       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-542: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-542      AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-543: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-543       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-544: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-544       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-545: Verify the symptom 'Chest Pain' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-545       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-546: Verify the symptom 'Other' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-546       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-547: Verify the symptom 'Other' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-547       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-548: Verify the symptom 'Other' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-548       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-549: Verify the symptom 'Other' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-549       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-550: Verify the symptom 'Other' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-550       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-551: Verify the symptom 'Other' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-551       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-555: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-555       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-556: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Min HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-556       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-557: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Max HR tag that closed as Invalid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-557       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-558: Verify the Physician notified is displayed correctly in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-558       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-23.1: Verify the Avg. HR is displayed correctly in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-23.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-24.1: Verify the Avg. HR is updated after updating AVG HR for each day on Beat & HR tab
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-24.1       AIRP-1.9.0             auto      R1
    Navigate Airp Tab     tab=HR Summary
    View Thumbnail Hr Summary On    row=1
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${avg_hr}           Evaluate    [item['Avg'] for item in ${thumbnail}]
    ${sum_avg_hr}       Evaluate    round(sum(${avg_hr}) / len(${avg_hr}), 1)
    ${actual_avg_hr}    Conversion Duration Time    duration_time=${sum_avg_hr}
    Navigate Airp Tab     tab=PDF Report
    Verify The Value Avg Hr On Pdf Page     ${actual_avg_hr}
#    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-25.1: Verify the Min. HR is displayed correctly in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-25.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-26.1: Verify Min. HR is updated after selecting the Min HR value suggested by the system on Beat & HR tab
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-26.1       AIRP-1.9.0       auto      R1
    ${actual_min_hr}    Get Value Min Heart Rate On Beats Page
    ${actual_ecg_event}     Get Value "Min HR" Heart Rate On Ecg Event Page
    ${strip_management_min_hr}      Get Value "Min HR" Heart Rate On Strips Management Page
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${expected_cover_page}      Get Value "min_hr" Heart Rate On Cover Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_min_hr}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_ecg_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${strip_management_min_hr}
    ${expected_summary_page}    Get Value "min_hr" Heart Rate On Summary Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_summary_page}     ${expected_cover_page}
#    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-27.1: Verify Min. HR is updated after entering Min HR value for each day on Beat & HR tab
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
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-27.1       AIRP-1.9.0        auto      R1
    ${actual_min_hr}        Edit Min Hr On Beats Page
    ${actual_ecg_event}     Get Value "Min HR" Heart Rate On Ecg Event Page
    ${strip_management_min_hr}      Get Value "Min HR" Heart Rate On Strips Management Page
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${expected_cover_page}      Get Value "min_hr" Heart Rate On Cover Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_min_hr}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_ecg_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${strip_management_min_hr}
    ${expected_summary_page}    Get Value "min_hr" Heart Rate On Summary Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_summary_page}     ${expected_cover_page}
#    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-28.1: Verify Min. HR is updated after updating N beats to S on Min HR area for each day
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-28.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-29.1: Verify Min. HR is updated after updating N beats to V on Min HR area for each day
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-29.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-30.1: Verify Min. HR is updated after updating N beats to Q on Min HR area for each day
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-30.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AIRP-PDF-REPORT-COVER-PAGE-31.1: Verify the . HR is displayed correctly in the first view
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
    ...     1. Max HR: the highest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-31.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-32.1: Verify Max. HR is updated after selecting the Max HR value suggested by the system on Beat & HR tab
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
    ...     1. Max HR: the highest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-32.1       AIRP-1.9.0       auto      R1
    ${actual_max_hr}    Get Value Max Heart Rate On Beats Page
    ${actual_ecg_event}     Get Value "Max HR" Heart Rate On Ecg Event Page
    ${strip_management_max_hr}      Get Value "Max HR" Heart Rate On Strips Management Page
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${expected_cover_page}      Get Value "max_hr" Heart Rate On Cover Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_max_hr}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_ecg_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${strip_management_max_hr}
    ${expected_summary_page}    Get Value "max_hr" Heart Rate On Summary Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_summary_page}     ${expected_cover_page}
#    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-33.1: Verify Max. HR is updated after entering Max HR value for each day on Beat & HR tab
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
    ...     1. Max HR: the highest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-33.1       AIRP-1.9.0      auto      R1
    ${actual_max_hr}    Edit Max Hr On Beats Page
    ${actual_ecg_event}     Get Value "Max HR" Heart Rate On Ecg Event Page
    ${strip_management_max_hr}      Get Value "Max HR" Heart Rate On Strips Management Page
    Navigate Airp Tab     tab=PDF Report
    Download The Pdf File On Pdf Report
    ${expected_cover_page}      Get Value "max_hr" Heart Rate On Cover Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_max_hr}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${actual_ecg_event}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_cover_page}        ${strip_management_max_hr}
    ${expected_summary_page}    Get Value "max_hr" Heart Rate On Summary Page
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_summary_page}     ${expected_cover_page}
#    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-34.1: Verify Max. HR is updated after updating N beats to S on Max HR area for each day
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
    ...     1. Max HR: the highest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-34.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-35.1: Verify Max. HR is updated after updating N beats to V on Max HR area for each day
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
    ...     1. Max HR: the highest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-35.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-36.1: Verify Max. HR is updated after updating N beats to Q on Max HR area for each day
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
    ...     1. Max HR: the highest-minimum heart rate value for the duration of the report and the time of its occurrence and the day number of the study
    ...     2. The values ​​in the above positions are displayed the same

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-36.1       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-571: Verify the VE percentage is displayed correctly on VE burden in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-571       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-572: Verify the number of VE beats is displayed correctly on VE burden in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the total number of VE beats to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-572       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-573: Verify VE percentage and beat count are updated on VE burden after marking a/multiple VE Couplet event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-573       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-574: Verify VE percentage and beat count are updated on VE burden after marking a/multiple VE Run event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-574       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-575: Verify VE percentage and beat count are updated on VE burden after marking a/multiple VE Bigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-575       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-576: Verify VE percentage and beat count are updated on VE burden after marking a/multiple VE Trigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-576       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-577: Verify VE percentage and beat count are updated on VE burden after marking a/multiple VE Quadrigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-577       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-578: Verify VE percentage and beat count are updated on VE burden after adding new a/multiple VE Couplet on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-578       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-579: Verify VE percentage and beat count are updated on VE burden after adding new a/multiple VE Run on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-579       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-580: Verify VE percentage and beat count are updated on VE burden after adding new a/multiple VE Bigeminy on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-580       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-581: Verify VE percentage and beat count are updated on VE burden after adding new a/multiple VE Trigeminy on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-581       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-582: Verify VE percentage and beat count are updated on VE burden after adding new a/multiple VE Quadrigeminy on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-582       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-583: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Couplet to N on ECG ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-583       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-584: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Couplet to S on ECG ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-584       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-585: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Couplet to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-585       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-586: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Run to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-586       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-587: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Run to S on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-587       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-588: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Run to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-588       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-589: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Bigeminy to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-589       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-590: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Bigeminy to S on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-590       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-591: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Bigeminy to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-591       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-592: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Trigeminy to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-592       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-593: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Trigeminy to S on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-593       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-594: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Trigeminy to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-594       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-595: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Quadrigeminy to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-595       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-596: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Quadrigeminy to S on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-596       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-597: Verify VE percentage and beat count are updated on VE burden after updating beats related to VE Quadrigeminy to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-597       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-598: Verify VE percentage and beat count are updated on VE burden after marking all VE Couplet event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-598       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-599: Verify VE percentage and beat count are updated on VE burden after marking all VE Run event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-599       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-600: Verify VE percentage and beat count are updated on VE burden after marking all VE Bigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-600       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-601: Verify VE percentage and beat count are updated on VE burden after marking all VE Trigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-601       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-602: Verify VE percentage and beat count are updated on VE burden after marking all VT event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-602       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-603: Verify VE percentage and beat count are updated on VE burden after deleting all VT events on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-603       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-604: Verify VE percentage and beat count are updated on VE burden after adding new VT events on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-604       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-605: Verify VE percentage and beat count are updated on VE burden after changing VT event to SVT on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-605       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-606: Verify VE percentage and beat count are not updated on VE burden after changing VT event to AFib on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-606       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-607: Verify VE percentage and beat count are not updated on VE burden after changing VT event to 2nd Deg HB on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-607       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-608: Verify VE percentage and beat count are not updated on VE burden after changing VT event to 3rd Deg HB on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-608       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-609: Verify VE percentage and beat count are updated on VE burden after deleting a/multiple VT event on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-609       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-610: Verify VE percentage and beat count are updated on VE burden after marking a/mulitple VT event as artifact on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-610       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-611: Verify VE percentage and beat count are updated on VE burden after changing a/multiple VT event duration on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-611       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-612: Verify VE percentage and beat count are updated on VE burden after updating all beats related to VT event to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-612       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-613: Verify VE percentage and beat count are updated on VE burden after updating all beats related to VT event to S on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-613       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-614: Verify VE percentage and beat count are updated on VE burden after updating all beats related to VT event to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-614       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-615: Verify VE percentage and beat count are updated on VE burden after deleting beats related to VT event on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-615       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-616: Verify VE percentage and beat count are updated on VE burden after adding new V beats on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-616       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-617: Verify VE percentage and beat count are updated on VE burden after changing AFib events to VT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-617       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-618: Verify VE percentage and beat count are updated on VE burden after changing SVT events to VT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-618       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-619: Verify VE percentage and beat count are updated on VE burden after changing 2nd Deg HB events to VT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-619       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-620: Verify VE percentage and beat count are updated on VE burden after changing 3rd Deg HB events to VT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-620       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-621: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on V beats group to N by using N beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-621       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-622: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on V beats group to S by using S beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-622       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-623: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on V beats group to Q by using Q beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-623       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-625: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on V beats group to N by using Delete beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-625       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-626: Verify VE percentage and beat count are updated on VE burden after using change all to N beat button on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-626       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-627: Verify VE percentage and beat count are updated on VE burden after using change all to S beat button on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-627       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-628: Verify VE percentage and beat count are updated on VE burden after using change all to Q beat button on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-628       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-629: Verify VE percentage and beat count are updated on VE burden after using delete all beats button on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-629       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-630: Verify VE percentage and beat count are updated on VE burden after using hotkey 2 on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-630       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-631: Verify VE percentage and beat count are updated on VE burden after using hotkey 3 on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-631       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-632: Verify VE percentage and beat count are updated on VE burden after using hotkey 5 on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-632       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-633: Verify VE percentage and beat count are updated on VE burden after using hotkey 6 on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-633       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-634: Verify VE percentage and beat count are updated on VE burden after adding new an artifact area on V beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-634       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-635: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on Q-Q beats group to V beat using V beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-635       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-636: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on Q-Q beats group to V beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-636       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-637: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on Q-N/S/V beats group to V beat using V beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-637       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-638: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on Q-N/S/V beat group to V beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-638       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-639: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on S beats group to V beat using V beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-639       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-640: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on S beat group to V beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-640       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-641: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on N beats group to V beat using V beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-641       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-642: Verify VE percentage and beat count are updated on VE burden after updating a/multiple beats on N beat group to V beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-642       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-643: Verify the SVE percentage is displayed correctly on SVE burden in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-643       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-644: Verify the number of S beats is displayed correctly on SVE burden in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the total number of VE beats to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-644       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-645: Verify SVE percentage and beat count are updated on SVE burden after marking a/multiple SVE Couplet event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-645       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-646: Verify SVE percentage and beat count are updated on SVE burden after marking a/multiple SVE Run event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-646       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-647: Verify SVE percentage and beat count are updated on SVE burden after marking a/multiple SVE Bigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-647       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-648: Verify SVE percentage and beat count are updated on SVE burden after marking a/multiple SVE Trigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-648       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-649: Verify SVE percentage and beat count are updated on SVE burden after marking a/multiple SVE Quadrigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-649       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-650: Verify SVE percentage and beat count are updated on SVE burden after adding new a/multiple SVE Couplet on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-650       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-651: Verify SVE percentage and beat count are updated on SVE burden after adding new a/multiple SVE Run on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-651       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-652: Verify SVE percentage and beat count are updated on SVE burden after adding new a/multiple SVE Bigeminy on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-652       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-653: Verify SVE percentage and beat count are updated on SVE burden after adding new a/multiple SVE Trigeminy on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-653       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-654: Verify SVE percentage and beat count are updated on SVE burden after adding new a/multiple SVE Quadrigeminy on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-654       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-655: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Couplet to N on ECG ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-655       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-656: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Couplet to V on ECG ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-656       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-657: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Couplet to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-657       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-658: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Run to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-658       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-659: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Run to V on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-659       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-660: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Run to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-660       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-661: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Bigeminy to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-661       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-662: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Bigeminy to V on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-662       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-663: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Bigeminy to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-663       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-664: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Trigeminy to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-664       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-665: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Trigeminy to V on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-665       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-666: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Trigeminy to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-666       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-667: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Quadrigeminy to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-667       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-668: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Quadrigeminy to V on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-668       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-669: Verify SVE percentage and beat count are updated on SVE burden after updating beats related to SVE Quadrigeminy to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-669       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-670: Verify SVE percentage and beat count are updated on SVE burden after marking all SVE Couplet event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-670       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-671: Verify SVE percentage and beat count are updated on SVE burden after marking all SVE Run event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-671       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-673: Verify SVE percentage and beat count are updated on SVE burden after marking all SVE Bigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-673       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-674: Verify SVE percentage and beat count are updated on SVE burden after marking all SVE Trigeminy event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-674       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-675: Verify SVE percentage and beat count are updated on SVE burden after marking all SVT event as artifact on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-675       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-676: Verify SVE percentage and beat count are updated on SVE burden after deleting all SVT events on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-676       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-677: Verify SVE percentage and beat count are updated on SVE burden after adding new SVT events on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-677       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-678: Verify SVE percentage and beat count are updated on SVE burden after changing SVT event to VT on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-678       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-679: Verify SVE percentage and beat count are not updated on SVE burden after changing SVT event to AFib on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-679       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-680: Verify SVE percentage and beat count are not updated on SVE burden after changing SVT event to 2nd Deg HB on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-680       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-681: Verify SVE percentage and beat count are not updated on SVE burden after changing SVT event to 3rd Deg HB on ECG events tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-681       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-682: Verify SVE percentage and beat count are updated on SVE burden after deleting a/multiple SVT event on ECG event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-682       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-683: Verify SVE percentage and beat count are updated on VE burden after marking a/mulitple SVT event as artifact on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-683       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-684: Verify SVE percentage and beat count are updated on SVE burden after changing a/multiple SVT event duration on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-684       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-685: Verify SVE percentage and beat count are updated on SVE burden after updating all beats related to SVT event to N on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-685       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-686: Verify SVE percentage and beat count are updated on SVE burden after updating all beats related to SVT event to V on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-686       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-687: Verify SVE percentage and beat count are updated on SVE burden after updating all beats related to SVT event to Q on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-687       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-688: Verify SVE percentage and beat count are updated on SVE burden after deleting beats related to SVT event on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-688       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-689: Verify SVE percentage and beat count are updated on SVE burden after adding new S beats on ECG viewer
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-689       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-690: Verify SVE percentage and beat count are updated on SVE burden after changing AFib events to SVT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-690       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-691: Verify SVE percentage and beat count are updated on SVE burden after changing VT events to SVT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-691       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-692: Verify SVE percentage and beat count are updated on SVE burden after changing 2nd Deg HB events to SVT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-692       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-693: Verify SVE percentage and beat count are updated on SVE burden after changing 3rd Deg HB events to SVT event on ECG Event tab
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-693       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-694: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on S beats group to N using N beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-694       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-695: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on S beats group to V using V beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-695       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-696: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on S beats group to Q using Q beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-696       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-697: Verify SVE percentage and beat count are updated on SVE burden after deleting a/multiple beats on S beats group using Delete beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-697       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-698: Verify SVE percentage and beat count are updated on SVE burden after using change all to N beat button on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-698       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-699: Verify SVE percentage and beat count are updated on SVE burden after using change all to V beat button on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-699       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-700: Verify SVE percentage and beat count are updated on SVE burden after using change all to Q beat button on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-700       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-701: Verify SVE percentage and beat count are updated on SVE burden after using delete all beats button on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-701       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-702: Verify SVE percentage and beat count are updated on SVE burden after using hotkey 2 on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-702       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-703: Verify SVE percentage and beat count are updated on SVE burden after using hotkey 3 on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-703       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-704: Verify SVE percentage and beat count are updated on SVE burden after using hotkey 5 on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-704       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-705: Verify SVE percentage and beat count are updated on SVE burden after using hotkey 6 on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-705       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-706: Verify SVE percentage and beat count are updated on SVE burden after adding new an artifact area on S beats group
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-706       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-707: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on Q-Q beats group to S beat using S beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-707       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-708: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on Q-Q beats group to S beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-708       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-709: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on Q-N/S/V beats group to S beat using S beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-709       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-710: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on Q-N/S/V beat group to S beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-710       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-711: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on V beats group to S beat using S beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-711       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-712: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on V beat group to S beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-712       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-713: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on N beats group to S beat using S beat button
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-713       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-714: Verify SVE percentage and beat count are updated on SVE burden after updating a/multiple beats on N beat group to S beat using hotkey 4
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-714       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-715: Verify the AFib percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-715       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-716: Verify the AFib percentage is updated after adding new AFib events in Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-716       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-717: Verify the AFib percentage is updated after changing AFib events to VT event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-717       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-718: Verify the AFib percentage is updated after changing AFib events to SVT event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-718       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-719: Verify the AFib percentage is updated after changing AFib events to 2nd Deg HB event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-719       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-720: Verify the AFib percentage is updated after changing AFib events to 3rd Deg HB event on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-720       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-721: Verify the AFib percentage is updated after deleting AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-721       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-722: Verify the AFib percentage is updated after changing AFib events duration on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-722       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-723: Verify the AFib percentage is updated after marking AFib events as artifact on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-723       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-724: Verify the AFib percentage is updated after deleting all AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-724       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-725: Verify the AFib percentage is updated after marking all AFib events as artifact on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-725       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-726: Verify the AFib percentage is updated after adding artifact override AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-726       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-727: Verify the AFib percentage is updated after adding new AFib events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-727       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-728: Verify the AFib percentage is updated after changing AFib events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-728       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-729: Verify the AFib percentage is updated after changing AFib events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-729       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-730: Verify the AFib percentage is updated after changing AFib events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-730       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-731: Verify the AFib percentage is updated after changing AFib events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-731       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-732: Verify the AFib percentage is updated after deleting AFib events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-732       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-733: Verify the AFib percentage is updated after changing AFib events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-733       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-734: Verify the AFib percentage is updated after marking AFib events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-734       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-735: Verify the AFib percentage is updated after deleting all AFib events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-735       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-736: Verify the AFib percentage is updated after marking all AFib events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-736       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-737: Verify the AFib percentage is updated after changing Tachy events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-737       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-738: Verify the AFib percentage is updated after changing Brady events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-738       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-739: Verify the AFib percentage is updated after changing VT events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-739       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-740: Verify the AFib percentage is updated after changing SVT events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-740       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-741: Verify the AFib percentage is updated after changing 2nd Deg HB events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-741       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-742: Verify the AFib percentage is updated after changing 3rd Deg HB events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-742       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-743: Verify the Brady percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of beats inside the Brady event to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-743       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-744: Verify the Brady percentage is updated after adding new Brady events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-744       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-745: Verify the Brady percentage is updated after changing Brady events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-745       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-746: Verify the Brady percentage is updated after changing Brady events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-746       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-747: Verify the Brady percentage is updated after changing Brady events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-747       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-748: Verify the Brady percentage is updated after changing Brady events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-748       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-749: Verify the Brady percentage is updated after changing Brady events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-749       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-750: Verify the Brady percentage is updated after deleting Brady events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-750       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-751: Verify the Brady percentage is updated after changing Brady events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-751       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-752: Verify the Brady percentage is updated after marking Brady events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-752       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-753: Verify the Brady percentage is updated after deleting all Brady events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-753       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-754: Verify the Brady percentage is updated after marking all Brady events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Brady episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-754       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-755: Verify the Tachy percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of beats inside the Tachy event to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-755       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-756: Verify the Tachy percentage is updated after adding new Tachy events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-756       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-757: Verify the Tachy percentage is updated after changing Tachy events to AFib event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-757       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-758: Verify the Tachy percentage is updated after changing Tachy events to VT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-758       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-759: Verify the Tachy percentage is updated after changing Tachy events to SVT event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-759       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-760: Verify the Tachy percentage is updated after changing Tachy events to 2nd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-760       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-761: Verify the Tachy percentage is updated after changing Tachy events to 3rd Deg HB event on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-761       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-762: Verify the Tachy percentage is updated after deleting Tachy events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-762       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-763: Verify the Tachy percentage is updated after changing Tachy events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-763       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-764: Verify the Tachy percentage is updated after marking Tachy events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-764       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-766: Verify the Tachy percentage is updated after deleting all Tachy events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-766       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-767: Verify the Tachy percentage is updated after marking all Tachy events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Tachy episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-767       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-768: Verify the Pause percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of beats inside the Pause event to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-768       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-769: Verify the Pause percentage is updated after adding new Pause events in ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Pause episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-769       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-770: Verify the Pause percentage is updated after deleting Pause events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Pause episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-770       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-771: Verify the Pause percentage is updated after changing Pause events duration on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Pause episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-771       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-772: Verify the Pause percentage is updated after marking Pause events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Pause episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-772       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-773: Verify the Pause percentage is updated after deleting all Pause events on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Pause episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-773       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-774: Verify the Pause percentage is updated after marking all Pause events as artifact on ECG Event tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an Pause episode to the total beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-774       AIRP-1.9.0             manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-775: Verify the Sinus percentage is displayed correctly in the first view
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of remaining beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-775       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-776: Verify Sinus percentage is updated if VE/SVE/AFib/Brady/Tachy/Pause burden above is updated
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of remaining beats

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-776       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-777: Verify the value on Atrial Fibrillation Summary are displayed correctly in the first view
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-777       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-778: Verify the value on Atrial Fibrillation Summary are updated after adding new AFib on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events (check manual)
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-778       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] + 1
    Add New Event On Beats
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
    Delete The Afib Event On Beats
#    [Teardown]     Run Keywords    Stop Processing
#    ...     AND     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-779: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to VT event on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-779       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=VT       is_save=${True}
#    ${panel_infor}          Get Panel Information Event
#    ${time_duration}        Evaluate    '${panel_infor}[Duration]'.replace('s', '')
#    ${new_time}             Conversion Duration Time    duration_time=${time_duration}
#    ${expected_new_time}    Evaluate     int(-${new_time})
#    ${total_time_afib}      Conversion Total Time    new_time=${expected_new_time}     old_time=${actual_test_summary}[time_in_afib]
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-780: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to SVT event on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-780       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=SVT       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-781: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to 2nd Deg HB event on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-781       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=2nd Deg HB       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-782: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to 3rd Deg HB event on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-782       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=3rd Deg HB       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-783: Verify the value on Atrial Fibrillation Summary are updated after deleting AFib events on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-783       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Header       is_deleted=${True}      is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-784: Verify the value on Atrial Fibrillation Summary are updated after marking AFib events as artifact on Beats tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. Time in AFib: total duration of all AFib events (manual)
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events (manual)
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-784       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Header       is_mark_artifact=${True}        is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-785: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events duration on Beats tab
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
    ...     2. Total episodes: total AFib events not change
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-785       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    int(${actual_test_summary}[total_afib_episodes])
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Change Event Duration Airp
    Select Start And End Time Override
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-786: Verify the value on Atrial Fibrillation Summary are updated after deleting all AFib events on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 03/28/2025 - Hoang Nguyen
    ...

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-786       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    int(${actual_test_summary}[total_afib_episodes] == 0)
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Option Select All    delete_all_events=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-787: Verify the value on Atrial Fibrillation Summary are updated after marking all AFib events as artifact on Beats tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 03/28/2025 - Hoang Nguyen
    ...

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-787       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    int(${actual_test_summary}[total_afib_episodes] == 0)
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Filter Option Select All    mark_all_artifact=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Artifact' for value in ${events_selected}])
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}


BFCC-AIRP-PDF-REPORT-COVER-PAGE-788: Verify the value on Atrial Fibrillation Summary are updated after adding artifact override AFib events on Beat & HR tab
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of the number of any beats inside of an AFib episode to the total beats
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-788       AIRP-1.9.0             auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    int(${actual_test_summary}[total_afib_episodes]) - 1
    Navigate Airp Tab     tab=Beats
    Navigate To Afib Events Tab
    Change Event Duration
    Add New Artifact
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]      SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-789: Verify the value on Atrial Fibrillation Summary are updated after adding new AFib on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-789       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] + 1
    Add New "AFib" Event On ECG Events
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
    Delete The "AFib" Event On ECG Events
#    [Teardown]     Run Keywords    Stop Processing
#    ...     AND     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-791: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to VT event on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-791       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=VT       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-792: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to SVT event on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-792       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=SVT       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-793: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to 2nd Deg HB event on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-793       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=2nd Deg HB       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-794: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events to 3rd Deg HB event on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-794       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=3rd Deg HB       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-795: Verify the value on Atrial Fibrillation Summary are updated after deleting AFib events on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-795       AIRP-1.9.0      auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Header       is_deleted=${True}      is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-796: Verify the value on Atrial Fibrillation Summary are updated after marking AFib events as artifact on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-796       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] - 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Thumbnail Option     is_mark_as_artifact=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-797: Verify the value on Atrial Fibrillation Summary are updated after changing AFib events duration on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-797       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    int(${actual_test_summary}[total_afib_episodes])
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Thumbnail Option    change_event_duration=${True}
    Select Start And End Time Override
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-798: Verify the value on Atrial Fibrillation Summary are updated after deleting all AFib events on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 03/28/2025 - Hoang Nguyen
    ...

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-798       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    int(${actual_test_summary}[total_afib_episodes] == 0)
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Option Select All    delete_all_events=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Deleted' for value in ${events_selected}])
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-799: Verify the value on Atrial Fibrillation Summary are updated after marking all AFib events as artifact on ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 03/28/2025 - Hoang Nguyen
    ...

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-799       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_total_afib}      Evaluate    int(${actual_test_summary}[total_afib_episodes] == 0)
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    AFib
    Filter Option Select All    mark_all_artifact=${True}
    ${events_selected}      Get Events Selected
    ${event_status}         Evaluate    all([value == 'Artifact' for value in ${events_selected}])
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-800: Verify the value on Atrial Fibrillation Summary are updated after changing VT events to AFib event ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-800       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] + 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    VT
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=AFib       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-801: Verify the value on Atrial Fibrillation Summary are updated after changing SVT events to AFib event ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-801       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] + 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    SVT
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=AFib       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-802: Verify the value on Atrial Fibrillation Summary are updated after changing 2nd Deg HB events to AFib event ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-802       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] + 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    2nd Deg HB
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=AFib       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-803: Verify the value on Atrial Fibrillation Summary are updated after changing 3rd Deg HB events to AFib event ECG Event tab
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
    ...     2. Total episodes: total AFib events
    ...     3. Average HR: average HR of all AFib events
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-803       AIRP-1.9.0       auto      R1
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    ${actual_total_afib}      Evaluate    ${actual_test_summary}[total_afib_episodes] + 1
    Navigate Airp Tab     tab=ECG Events
    Navigate To Ecg Events Subtab    3rd Deg HB
    Filter Thumbnail Option    is_change_event_type=${True}      select_event_type=AFib       is_save=${True}
    Filter Header    is_save=${True}
    Navigate Airp Tab     tab=PDF Report
    Verify The Total Afib Episodes On Pdf Page    ${actual_total_afib}
#    [Teardown]     SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-COVER-PAGE-804: Verify the contents in the Findings section will display same as the system in the first view
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
    ...     **Other**:
    ...     Created auto: 03/28/2025 - Hoang Nguyen
    ...

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-804       AIRP-1.9.0       auto      R2
    Updating findings
    ${actual_findings}  Get Fingdings Pdf Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${test_summary}     Get Value In Cover File Pdf      data_pdf=${data}
    Log    ${test_summary}
    ${expected_findings}      Get From Dictionary    ${test_summary}    findings
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_findings}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-805: Verify the Findings section is displayed for no more than 18 lines
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-805       AIRP-1.9.0       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-806: Verify the findings in ‘AIRP portal’ and ‘Diagnostics portal’ are synchronized with each other
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-806       AIRP-1.9.0       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-807: Verify Physician signature shall blank in the first view
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-807       AIRP-1.9.0       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-808: Verify Physician signature and signature date are synchronized with each other on 2 portals ‘AIRP’ and ‘Diagnostics’
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-808       AIRP-1.9.0       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-809: Verify the system shall keep the last date and the last signature from diagnostics portal
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-809       AIRP-1.9.0       manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-642.1: Verify VE percentage and beat count are not updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-642.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-714.1: Verify SVE percentage and beat count are updated after adding AFib event study overrides all study duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.  the percentage of remaining beats = 0%

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-714.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-742.1: Verify AFib percentage is updated after adding AFib event study overrides all study duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.  the percentage of remaining beats = 100%

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-742.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-754.1: Verify Brady percentage is updated after adding AFib event study overrides all study duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.  the percentage of remaining beats = 0%

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-754.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-767.1: Verify Tachy percentage is updated after adding AFib event study overrides all study duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.  the percentage of remaining beats = 0%

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-767.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-AIRP-PDF-REPORT-COVER-PAGE-774.1: Verify Pause percentage is updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-774.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-776.1: Verify Sinus percentage updated after adding AFib event study overrides all study duration
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. the percentage of remaining beats = 0%

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-776.1       AIRP-1.9.0       manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-AIRP-PDF-REPORT-COVER-PAGE-803.1: Verify the value on Atrial Fibrillation Summary are updated after adding AFib event study overrides all study duration
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

    [Tags]      BFCC-AIRP-PDF-REPORT-COVER-PAGE-803.1       AIRP-1.9.0       manual      R1
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
    Navigate Airp Tab     tab=HR Summary
    View Thumbnail Hr Summary On    row=1
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${min_hr}           Evaluate    [item['Min'] for item in ${thumbnail}]
    ${actual_min_hr}           Evaluate    min(${min_hr})
    Set Global Variable    ${actual_min_hr}
    [Return]    ${actual_min_hr}

Get value max heart rate on beats page
    Navigate Airp Tab     tab=HR Summary
    View Thumbnail Hr Summary On    row=1
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
    Navigate Airp Tab     tab=HR Summary
    View Thumbnail Hr Summary On    row=1
    Edit Hr On Hr Summary    min_hr=10      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${min_hr}           Evaluate    [item['Min'] for item in ${thumbnail}]
    ${actual_min_hr}           Evaluate    min(${min_hr})
    Set Global Variable     ${actual_min_hr}
    [Return]    ${actual_min_hr}

Edit max hr on beats page
    Navigate Airp Tab     tab=HR Summary
    View Thumbnail Hr Summary On    row=1
    Edit Hr On Hr Summary    max_hr=999      is_save=${True}
    Filter Header    is_save=${True}
    ${thumbnail}         Get All Thumbnail Hr Summary
    ${max_hr}           Evaluate    [item['Max'] for item in ${thumbnail}]
    ${actual_max_hr}           Evaluate    max(${max_hr})
    Set Global Variable     ${actual_max_hr}
    [Return]    ${actual_max_hr}

Edit avg hr on beats page
    Navigate Airp Tab     tab=HR Summary
    View Thumbnail Hr Summary On    row=1
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

Updating findings
    Navigate Airp Tab     tab=PDF Report
    Update Findings On Pdf Report