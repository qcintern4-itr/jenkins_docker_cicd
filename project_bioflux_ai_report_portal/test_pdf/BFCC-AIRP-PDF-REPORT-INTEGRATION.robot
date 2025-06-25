*** Settings ***
Documentation   Test Suite - Call Center AI - Process Reports
Metadata    sid     BFCC-AIRP-PDF-REPORT-INTEGRATION
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

#Suite Setup     Suite Setup
#Suite Teardown      Suite Teardown
Force Tags      BFCC-AIRP-PDF-REPORT-INTEGRATION  web
Test Timeout    30m

*** Test Cases ***
BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-02: Verify that Patient information is displayed correctly in the first view
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
    ...     Update Date: 7/12/2024 - Trinh Nguyen

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-02       AIRP-1.9.0       auto      R1
    Open Browser Clinic
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
    ${study}      Get Completed Studies
    Manage Completed Study On      row=1
    Navigate To Study Details Tab    Patient details
    ${patient_details}      Get Study Patient Details
    ${expected_patient_info}      Evaluate     {k: v for k, v in ${patient_details}[Patient information].items()}
    ${expected_patient_contact}      Evaluate     {k: v for k, v in ${patient_details}[Patient contact].items()}
    Open Browser Callcenter Ai Report
    Navigate Airp Tab     tab=PDF Report
    Wait For Pdf Viewer Available
    Download File Pdf
    ${data}     Read File Pdf Pages On     page_number=0
    ${patient_infor}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_phone_number}     Evaluate    "${expected_patient_contact}[Phone number]".replace('-','–')
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[patient_id]      ${expected_patient_info}[ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[dob]      ${expected_patient_info}[DOB]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[phone_numbers]      ${expected_phone_number}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-02.2: Verify that the Phone number on Patient information is displayed correctly with Canada country
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-02.2       AIRP-1.9.1       auto      R1
    Open Browser Clinic
    Edit Patient Information On Clinic Page With Canada Country
    Open Browser Callcenter Ai Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${patient_infor}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_phone_number}     Evaluate    "${expected_patient_contact}[Phone number]".replace('-','–')
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[patient_id]      ${expected_patient_info}[ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[dob]      ${expected_patient_info}[DOB]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[phone_numbers]      ${expected_phone_number}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-02.3: Verify that the Phone number on Patient information is displayed correctly with United States country
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-02.3       AIRP-1.9.1       auto      R1
    Open Browser Clinic
    Edit Patient Information On Clinic Page With US Country
    Open Browser Callcenter Ai Report
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${patient_infor}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_phone_number}     Evaluate    "${expected_patient_contact}[Phone number]".replace('-','–')
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[patient_id]      ${expected_patient_info}[ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[dob]      ${expected_patient_info}[DOB]
    Run Keyword And Continue On Failure    Should Be Equal    ${patient_infor}[phone_numbers]      ${expected_phone_number}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-04.1: Interpreting physician information in the PDF report is updated synchronously with the Diagnostic Portal
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-04.1       AIRP-1.9.0       auto      R1
    Open Browser Clinic
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
    ${study}      Get Completed Studies
    Manage Completed Study On      row=1
    Navigate To Study Details Tab    Study details
    ${study_details}        Get Study Details
    ${interpreting_physican}       Set Variable        ${study_details}[Interpreting physician]
    Open Browser Callcenter Ai Report
    Navigate Airp Tab     tab=PDF Report
    Wait For Pdf Viewer Available
    Download File Pdf
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_interpreting_physican}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_phone_number}     Evaluate    "${interpreting_physican}[Day phone]".replace('-','–')
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_interpreting_physican}[phone_numbers_interpreting]      ${expected_phone_number}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_interpreting_physican}[interpreting_physician]      ${interpreting_physican}[Name]
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-05.1: Verify that Diagnosis is synchronized immediately after the Clinic user updates the information
     [Documentation]     Author: Trinh Nguyen
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-05.1       AIRP-1.9.0       auto      R1
    Open Browser Clinic
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
    ${study}      Get Completed Studies
    Manage Completed Study On      row=1
    Navigate To Study Details Tab    Study details
    ${study_details}        Get Study Details
    ${diagnosis}       Set Variable        ${study_details}[Diagnosis]
    Open Browser Callcenter Ai Report
    Navigate Airp Tab     tab=PDF Report
    Wait For Pdf Viewer Available
    Download File Pdf
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_diagnosis}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_primary_diagnosis}     Evaluate    "${diagnosis}[Primary diagnosis code]".replace('-','–')
    ${expected_secondary_diagnosis}     Evaluate    "${diagnosis}[Secondary diagnosis code]".replace('-','–')
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_diagnosis}[primary_indication]        ${expected_primary_diagnosis}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_diagnosis}[secondary_indication]      ${expected_secondary_diagnosis}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_diagnosis}[patient_indication]        ${diagnosis}[Patient medication]
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-09: Verify the Auto-triggers is displayed correctly with Brady event closed as Valid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-09       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Brady" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-10: Verify the Auto-triggers is displayed correctly with Tachy event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-10       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Tachy" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-11: Verify the Auto-triggers is displayed correctly with AFib event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-11       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "AFib" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-12: Verify the Auto-triggers is displayed correctly with Pause event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-12       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Pause" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-13: Verify the Auto-triggers is displayed correctly with Auto event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-13       AIRP-1.9.0      auto      R1
    [Setup]    Create Event "Auto" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-14: Verify the Auto-triggers is displayed correctly with Sinus event closed as Valid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-14       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Sinus" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-15: Verify the Auto-triggers is displayed correctly with Brady event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-15       AIRP-1.9.0      auto      R1
    [Setup]    Create Event "Brady" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     is_save=${True}
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    Clear Event Text Search
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-16: Verify the Auto-triggers is displayed correctly with Tachy event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-16       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Tachy" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     is_save=${True}
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    Clear Event Text Search
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-17: Verify the Auto-triggers is displayed correctly with AFib event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-17       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "AFib" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     is_save=${True}
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    Clear Event Text Search
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-18: Verify the Auto-triggers is displayed correctly with Pause event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-18       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Pause" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     is_save=${True}
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    Clear Event Text Search
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-19: Verify the Auto-triggers is displayed correctly with Auto event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-19       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Auto" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     is_save=${True}
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    Clear Event Text Search
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-20: Verify the Auto-triggers is displayed correctly with Sinus event closed as Invalid and included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-20       AIRP-1.9.0       auto      R1
    [Setup]    Create Event "Sinus" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     is_save=${True}
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    Clear Event Text Search
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual})
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-21: Verify the Brady event is not counted on the Auto-triggers if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-21       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Brady     filter_submit=${True}
    Filter Strips Management    include_report=${False}    validity=Valid      is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-22: Verify the Brady event is not counted on the Auto-triggers if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-22       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Brady     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Invalid    is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-23: Verify the Tachy event is not counted on the Auto-triggers if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-23       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Tachy     filter_submit=${True}
    Filter Strips Management    include_report=${False}    validity=Valid        is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-24: Verify the Tachy event is not counted on the Auto-triggers if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-24       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Tachy     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Invalid    is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-25: Verify the AFib event is not counted on the Auto-triggers if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-25       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=AFib     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Valid      is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-26: Verify the AFib event is not counted on the Auto-triggers if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-26       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=AFib     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Invalid    is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-27: Verify the Pause event is not counted on the Auto-triggers if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-27       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Pause     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Valid      is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-28: Verify the Pause event is not counted on the Auto-triggers if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-28       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Pause     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Invalid    is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-29: Verify the Auto event is not counted on the Auto-triggers if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-29       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Auto     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Valid      is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-30: Verify the Auto event is not counted on the Auto-triggers if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-30       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Auto     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Invalid    is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-31: Verify the Sinus event is not counted on the Auto-triggers if closed as Valid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-31       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Sinus     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Valid      is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-32: Verify the Sinus event is not counted on the Auto-triggers if closed as Invalid and not included in report
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

    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-32       AIRP-1.9.0       auto      R1
    Open browser callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events_manual}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   search_by_event_type=Sinus     filter_submit=${True}
    Filter Strips Management    include_report=${False}     validity=Invalid    is_save=${True}
    ${number_events_auto}       Evaluate    (${number_events} - ${number_events_manual} - 1)
    Verify The Total Auto Triggers On Pdf Page      ${number_events_auto}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-43: Verify the manual events is displayed correctly with symptom 'Baseline' closed as Invalid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-43       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Manual Events Is Displayed Correctly With Event Closed As Valid And Included In Report
    Verify The Manual Events Is Displayed Correctly With Event Closed As Invalid And Included In Report
    Verify The Event Is Not Counted On The Manual Events If Closed As Valid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-44: Verify the manual events is displayed correctly with symptom 'Resume Study' closed as Invalid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-44       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Manual Events Is Displayed Correctly With Event Closed As Valid And Included In Report
    Verify The Manual Events Is Displayed Correctly With Event Closed As Invalid And Included In Report
    Verify The Event Is Not Counted On The Manual Events If Closed As Valid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-45: Verify the manual events is displayed correctly with symptom 'Evaluation strip' closed as Invalid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-45       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Manual Events Is Displayed Correctly With Event Closed As Valid And Included In Report
    Verify The Manual Events Is Displayed Correctly With Event Closed As Invalid And Included In Report
    Verify The Event Is Not Counted On The Manual Events If Closed As Valid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-52: Verify the manual events is displayed correctly with symptom 'Not Specified' closed as Invalid and included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-52       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Manual Events Is Displayed Correctly With Event Closed As Valid And Included In Report
    Verify The Manual Events Is Displayed Correctly With Event Closed As Invalid And Included In Report
    Verify The Event Is Not Counted On The Manual Events If Closed As Valid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-54: Verify the symptom 'Baseline' is not counted on the Manual events if closed as Invalid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-54       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Event Is Not Counted On The Manual Events If Closed As Invalid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-56: Verify the symptom 'Resume study' is not counted on the Manual events if closed as Invalid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-56       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Event Is Not Counted On The Manual Events If Closed As Invalid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-58: Verify the symptom 'Evaluation strip' is not counted on the Manual events if closed as Invalid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-58       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Event Is Not Counted On The Manual Events If Closed As Invalid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-70: Verify the symptom 'Not specified' is not counted on the Manual events if closed as Invalid and not included in report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-70       AIRP-1.9.1       auto      R1
    [Setup]    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Verify The Event Is Not Counted On The Manual Events If Closed As Invalid And Not Included In Report
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-72: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-72       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${values_cover}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "1st Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-73: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-73       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "2nd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-74: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-74       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "3rd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-75: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-75       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VTach"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-76: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-76       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVT"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-77: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-77       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFib"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-78: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-78       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFlutter"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-79: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-79       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Tachy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-80: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-80       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Brady"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-81: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-81       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PAC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-82: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-82       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Paced"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-83: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-83       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PVC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-84: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-84       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Pause"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-85: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-85       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single VEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-86: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-86       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-87: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-87       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-88: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-88       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-89: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-89       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single SVEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-90: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-90       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-91: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-91       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-92: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-92       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-93: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-93       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Trigeminal"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-94: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-94       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Long RR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-95: Verify the Correlated events are displayed correctly with symptom 'Baseline' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-95       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "IVCD"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-120: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-120       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "1st Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-121: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-121       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "2nd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-122: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-122       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "3rd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-123: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-123       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VTach"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-124: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-124       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVT"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-125: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-125       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFib"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-126: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-126       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFlutter"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-127: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-127       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Tachy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-128: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-128       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Brady"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-129: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-129       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PAC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-130: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-130       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Paced"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-131: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-131       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PVC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-132: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-132       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Pause"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-133: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-133       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single VEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-134: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-134       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-135: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-135       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-136: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-136       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-137: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-137       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single SVEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-138: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-138       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-139: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-139       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-140: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-140       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-141: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-141       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Trigeminal"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-142: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-142       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Long RR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-143: Verify the Correlated events are displayed correctly with symptom 'Resume Study' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-143       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "IVCD"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-168: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-168       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "1st Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-169: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-169       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "2nd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-170: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-170       AIRP-1.9.0      auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "3rd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-171: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-171       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VTach"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-172: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-172       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVT"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-173: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-173       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFib"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-174: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-174       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFlutter"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-175: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-175       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Tachy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-176: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-176       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Brady"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-177: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-177       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PAC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-178: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-178       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Paced"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-179: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-179       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PVC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-180: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-180       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Pause"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-181: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-181       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single VEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-182: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-182       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-183: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-183       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-184: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-184       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-185: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-185       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single SVEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-186: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-186       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-187: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-187       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-188: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-188       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-189: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-189       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Trigeminal"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-190: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-190       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Long RR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-191: Verify the Correlated events are displayed correctly with symptom 'Evaluation Strip' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-191       AIRP-1.9.0      auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "IVCD"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-456: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a 1st Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-456       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "1st Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-457: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a 2nd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-457       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "2nd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-458: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a 3rd Deg HB tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-458       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "3rd Deg HB"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-459: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VTach tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-459       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VTach"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-460: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVT tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-460       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVT"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-461: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a AFib tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-461       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFib"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-462: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a AFlutter tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-462       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "AFlutter"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-463: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Tachy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-463       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Tachy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-464: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Brady tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-464       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Brady"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-465: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a PAC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-465       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PAC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-466: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Paced tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-466       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Paced"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-467: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a PVC tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-467       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "PVC"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-468: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Pause tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-468       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Pause"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-469: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Single VEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-469       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single VEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-470: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-470       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-471: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-471       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-472: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a VEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-472       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "VEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-473: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Single SVEs tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-473       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Single SVEs"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-474: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Couplet tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-474       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Couplet"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-475: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Run tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-475       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Run"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-476: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Bigeminy tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-476       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Bigeminy"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-477: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a SVEs Trigeminal tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-477       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "SVEs Trigeminal"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-478: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has a Long RR tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-478       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "Long RR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-479: Verify the Correlated events are displayed correctly with symptom 'Not Specified ' closed as Valid and included in report that has an IVCD tag
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-479       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events]) + 1
    Close Tab    2
    Edit The Event Tag With Tag Name "IVCD"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-504: Verify the symptom 'Baseline' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-504       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Sinus Rhythm"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-505: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-505       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Min HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-506: Verify the symptom 'Baseline' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-506       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Baseline" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Max HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-510: Verify the symptom 'Resume study' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-510       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Sinus Rhythm"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-511: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-511       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Min HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-512: Verify the symptom 'Resume study' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-512       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Resume Study" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Max HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-516: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-516       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Sinus Rhythm"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-517: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-517       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Min HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-518: Verify the symptom 'Evaluation strip' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-518       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Evaluation Strip" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Max HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-552: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a sinus Rhythm tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-552       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Sinus Rhythm"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-553: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Min HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-553       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Min HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-554: Verify the symptom 'Not Specified' is not counted on the Correlated events if has a Max HR tag that closed as Valid and included in report
     [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...     1. The number of manual events that have been closed and included in the report, and there shall be event tags
    ...     added during the processing of technicians (excluding ‘sinus Rhythm’, ‘Min HR’, ‘Max HR’) in the duration of the report
    ...
    ...     **Other**:
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-554       AIRP-1.9.0       auto      R1
    Create Event Manual With Symptom "Not specified" Closed As Valid And Included In Report
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_cover}     Evaluate    int(${actual_test_summary}[correlated_events])
    Close Tab    2
    Edit The Event Tag With Tag Name "Max HR"
    Verify The Correlated Events Are Displayed Correctly        ${actual_correlated_cover}
    Edit The Event Closed As Invalid And Included In Report
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_correlated_events_summary}        ${actual_correlated_events_cover}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-559: Verify the Physician notified is displayed correctly if the notification report has Sent status
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
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-559       AIRP-1.9.0       auto      R1
    [Setup]    Create Notification Report Has Been The Status Is Generate
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0]) + 1
    Close Tab    1
    Switch Tab    tab_id=0
    Create Notification Report Has Been The Status Is Sent
    Navigate To Ai Report Page
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_physician_notified}        ${actual_physician_notified}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-560: Verify the notification report is not counted on the Physician notified if it has Ready status
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
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-560       AIRP-1.9.0       auto      R1
    [Setup]    Create Notification Report Has Been The Status Is Generate
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0])
    Create Notification Report Has Been The Status Is Ready
    Navigate To Ai Report Page
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_physician_notified}        ${actual_physician_notified}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-561: Verify the notification report is not counted on the Physician notified if the call center recall the notification report
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
    ...     Created auto: 05/08/2024
    ...
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-561       AIRP-1.9.0       auto      R1
    Open Browser Callcenter
    Navigate to study management page
    Create Notification Report Has Been The Status Is Sent
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0]) - 1
    Recall The Notification Report With "${report_id}"
    Navigate To Ai Report Page
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_physician_notified}        ${actual_physician_notified}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-559.1: Verify the Physician notified is displayed correctly if the event report has Sent status
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-559.1       AIRP-1.9.0       auto      R1
    Open Browser Callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${physician_notified}     Evaluate    "${actual_test_summary}[physician_notified])".split()[0]
    ${expected_physician_notified}     Evaluate    ${physician_notified} + 1
    Create Event Report Has Been The Status Is Sent
    Navigate To Ai Report Page
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_physician_notified}        ${actual_physician_notified}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-560.1: Verify the event report is not counted on the Physician notified if it has Ready status
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-560.1       AIRP-1.9.0       auto      R1
    Open Browser Callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${physician_notified}     Evaluate    "${actual_test_summary}[physician_notified])".split()[0]
    ${expected_physician_notified}     Evaluate    ${physician_notified}
    Create Event Report Has Been The Status Is Ready
    Navigate To Ai Report Page
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_physician_notified}        ${actual_physician_notified}
    [Teardown]    SUITE TEARDOWN

BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-561.1: Verify the event report is not counted on the Physician notified if the call center recall the event report
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
    [Tags]      BFCC-AIRP-PDF-REPORT-INTEGRATION-COVER-PAGE-561.1       AIRP-1.9.0       auto      R1
    Open Browser Callcenter
    Navigate To Ai Report Page
    Get Release Version Aireport
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0]) - 1
    Recall The Event Report
    Navigate To Ai Report Page
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${actual_test_summary}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_physician_notified}     Evaluate    int("${actual_test_summary}[physician_notified])".split()[0])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_physician_notified}        ${actual_physician_notified}
    [Teardown]    SUITE TEARDOWN

*** Keywords ***
Open browser callcenter ai report
    ${BROWSER_NODE_CALLCENTER}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE_CALLCENTER}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE_CALLCENTER}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE_CALLCENTER}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/PdfReport.py            ${BROWSER_NODE_CALLCENTER}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE_CALLCENTER}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}            Set Variable        ${USERS}[callcenter_airp_pdf]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[study_id_completed]
    ${URL_CALLCENTER}       Get Config Param       WEB_BASE_URL
    Open Page    ${URL_CALLCENTER}
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Navigate To Tab Menu      Studies
    Navigate To Subtab Menu        Completed
#    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Filter Studies On Callcenter     search_by=Study ID      text_search=${STUDY_ID_COMPLETED}[study_id_pdf_report]
    Manage Complete Study On              row=1
    Navigate To Subtab Menu       Reports
    View Completed New Report Status On          row=1
    Switch Tab
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

Open browser callcenter
    ${BROWSER_NODE_CALLCENTER}      Start Browser
    Import Library       project_bioflux_ai_report_portal/lib/web/Common.py       ${BROWSER_NODE_CALLCENTER}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Reports.py      ${BROWSER_NODE_CALLCENTER}        ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/EcgEvent.py            ${BROWSER_NODE_CALLCENTER}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/PdfReport.py            ${BROWSER_NODE_CALLCENTER}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/Studies.py            ${BROWSER_NODE_CALLCENTER}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StudyManagement.py            ${BROWSER_NODE_CALLCENTER}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/EventDetails.py           ${BROWSER_NODE_CALLCENTER}     ${ENV}
    Import Library       project_bioflux_ai_report_portal/lib/web/StripsManagement.py           ${BROWSER_NODE_CALLCENTER}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}            Set Variable        ${USERS}[callcenter_airp_pdf]
    ${STUDY_ID_COMPLETED}      Set Variable        ${STUDY_ID}[study_id_completed]
    ${URL_CALLCENTER}       Get Config Param       WEB_BASE_URL
    Open Page    ${URL_CALLCENTER}
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Variable      ${TOKEN}
    Set Global Variable     ${STUDY_ID_COMPLETED}

Get version aireport
    ${RELEASE_VERSION}      Get Release Version Aireport
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

Open browser clinic
    ${BROWSER_NODE}     Start Browser
    Import Library      project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}   ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}   ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}   ${ENV}
    ${PHY_USER}         Get Config Param       NEW_USER_CLINIC > clinic_physician
    ${FACILITIES}       Get Config Param       FACILITY
    ${DEVICES}          Get Config Param       DEVICE
    ${AWS_AUTH}         Get Config Param       AWS_AUTH
    ${URL_CLINIC}       Get Config Param       WEB_BASE_URL_CLINIC
    ${STUDY_ID}         Get Config Param       STUDY_ID
    ${STUDY_ID_PDF}     Set Variable        ${STUDY_ID}[study_id_completed][study_id_pdf_report]
    Set Suite Variable  ${PHY_USER}
    Set Suite Variable  ${DEVICES}
    Set Suite Variable  ${FACILITIES}
    Set Suite Variable  ${URL_CLINIC}
    Set Suite Variable  ${STUDY_ID_PDF}
    ${TOKEN}             Sign In Diagnostics     ${PHY_USER}[0][username]     ${PHY_USER}[0][password]        url_diagnostics=${URL_CLINIC}
#    ${AWS_RPS}          Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
#    Set Suite Variable  ${AWS_TOKEN}          ${AWS_RPS}[AuthenticationResult][AccessToken]
    Set Suite Variable  ${TOKEN}
    Set Suite Metadata  browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Edit patient information on clinic page with Canada country
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
    ${study}      Get Completed Studies
    Manage Completed Study On      row=1
    Navigate To Study Details Tab    Patient details
    ${new_patient_info}     Create Dictionary      patient_id=AutoTest02    dob=01/02/2024     is_save=${False}
    Edit Patient Details        patient_info=${new_patient_info}
    Edit Patient Information        is_save=${True}
    ${patient_details}      Get Study Patient Details
    ${new_patient_contact}     Create Dictionary     country=Canada      address=AAR Plumbing and Heating Supply, Steeles Avenue East, Brampton, ON, Canada     primary_phone_number=084-657-4638      is_save=${False}
    Edit Patient Details     patient_contact=${new_patient_contact}
    Edit Patient Contact        is_save=${True}
    ${patient_details}      Get Study Patient Details
    ${expected_patient_info}      Evaluate     {k: v for k, v in ${patient_details}[Patient information].items()}
    ${expected_patient_contact}      Evaluate     {k: v for k, v in ${patient_details}[Patient contact].items()}
    Set Suite Variable    ${expected_patient_info}
    Set Suite Variable    ${expected_patient_contact}

Edit patient information on clinic page with US country
    Navigate To Studies Page
    Filter Studies  study_state=Completed
    Filter Studies    search_by=Study ID      text_search=${STUDY_ID_PDF}
    ${study}      Get Completed Studies
    Manage Completed Study On      row=1
    Navigate To Study Details Tab    Patient details
    ${new_patient_info}     Create Dictionary      patient_id=AutoTest01    dob=01/02/2024     is_save=${False}
    Edit Patient Details        patient_info=${new_patient_info}
    Edit Patient Information        is_save=${True}
    ${patient_details}      Get Study Patient Details
    ${new_patient_contact}     Create Dictionary     country=United States      address=Dulles International Airport (IAD), Saarinen Circle, Dulles, VA, USA
    ...     primary_phone_number=484-414-5043      is_save=${False}
    Edit Patient Details     patient_contact=${new_patient_contact}
    Edit Patient Contact        is_save=${True}
    ${patient_details}      Get Study Patient Details
    ${expected_patient_info}      Evaluate     {k: v for k, v in ${patient_details}[Patient information].items()}
    ${expected_patient_contact}      Evaluate     {k: v for k, v in ${patient_details}[Patient contact].items()}
    Set Suite Variable    ${expected_patient_info}
    Set Suite Variable    ${expected_patient_contact}

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

Create event "${event_type}" closed as Valid and included in report
    Open Browser Callcenter
    Navigate To Study Management Page
    Navigate To Subtab Menu       Events
    Wait Until Study Events Available
    Filter Study Events     by_type=${event_type}
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab    Event Details
    ${event_type}   Get Event Details
    ${event_header}     Get Event Summary
    ${event_id}     Evaluate    "${event_header['EVENT ID'].split('\n')[0]}"
    Edit Event Details     event_validity=Valid       is_close=${True}      include_report=${True}
    Set Suite Variable    ${event_id}

Create event manual with symptom "${symptom_value}" closed as Valid and included in report
    Open Browser Callcenter
    Navigate To Study Management Page
    Navigate To Subtab Menu       Events
    Wait Until Study Events Available
    Filter Study Events     by_type=Manual
    ${events_study}         Get All Study Events
    ${events_id}     Evaluate    [item['Event ID'] for item in ${events_study} if item.get('Symptoms:') == '${symptom_value}']
    ${event_id}     Evaluate    random.choice(${events_id})    random
    Filter Study Events     text_search=${event_id}
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab    Event Details
    ${event_type}   Get Event Details
    Clear Event Tag
    Edit Event Details     is_save=${True}
    Edit Event Details     event_validity=Valid       is_close=${True}      include_report=${True}
    Set Suite Variable    ${event_id}

Create event manual with symptom "${symptom_value}" and event tag "${tag_name}" closed as Valid and included in report
    Open Browser Callcenter
    Navigate To Study Management Page
    Navigate To Subtab Menu       Events
    Wait Until Study Events Available
    Filter Study Events     by_type=Manual
    ${events_study}         Get All Study Events
    ${events_id}     Evaluate    [item['Event ID'] for item in ${events_study} if item.get('Symptoms:') == '${symptom_value}']
    ${event_id}     Set Variable    ${events_id}[0]
    Filter Study Events     text_search=${event_id}
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab    Event Details
    ${event_type}   Get Event Details
    Edit Event Tag    event_name=${tag_name}
    Edit Event Details     event_validity=Valid       is_close=${True}      include_report=${True}
    Set Suite Variable    ${event_id}

Download the pdf file on pdf report
    Navigate Airp Tab     tab=PDF Report
    Wait For Pdf Viewer Available
    Generate Pdf Report
    Download File Pdf

Verify the manual events is displayed correctly with event closed as Invalid and included in report
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${actual_number_events}        Get Total Number Events Strips Management
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     include_report=${True}    is_save=${True}
    Clear Event Text Search
    ${expected_number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_events_cover}     Evaluate    int(${values_cover}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_events}        ${actual_events_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_events}        ${actual_events_cover}
    ${data_summary}     Read File Pdf Pages On     page_number=2
    ${values_summary}     Get Value In Summary File Pdf       data_pdf=${data_summary}
    ${actual_events_summary}     Evaluate    int(${values_summary}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events_summary}        ${actual_events_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events_summary}        ${actual_number_events}

Verify the event is not counted on the Manual events if closed as valid and not included in report
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Valid      include_report=${False}     is_save=${True}
    Clear Event Text Search
    ${expacted_number_events}       Evaluate    (${number_events} - 1)
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_manual_events_cover}     Evaluate    int(${values_cover}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${expacted_number_events}        ${actual_manual_events_cover}
    ${data_summary}     Read File Pdf Pages On     page_number=2
    ${values_summary}     Get Value In Summary File Pdf       data_pdf=${data_summary}
    ${actual_manual_events_summary}     Evaluate    int(${values_summary}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_manual_events_summary}        ${actual_manual_events_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_manual_events_summary}        ${expacted_number_events}

Verify the manual events is displayed correctly with event closed as Valid and included in report
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${actual_number_events}        Get Total Number Events Strips Management
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Valid     include_report=${True}    is_save=${True}
    Clear Event Text Search
    ${expected_number_events}        Get Total Number Events Strips Management
    Filter Strips Management    search_by=${True}   filter_reset=${True}   filter_submit=${True}
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_events_cover}     Evaluate    int(${values_cover}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_number_events}      ${actual_events_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_number_events}        ${actual_events_cover}
    ${data_summary}     Read File Pdf Pages On     page_number=2
    ${values_summary}     Get Value In Summary File Pdf       data_pdf=${data_summary}
    ${actual_events_summary}     Evaluate    int(${values_summary}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events_summary}        ${actual_events_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events_summary}        ${actual_number_events}

Verify the event is not counted on the Manual events if closed as Invalid and not included in report
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    search_by=${True}   search_by_event_type=Manual     filter_submit=${True}
    ${number_events}        Get Total Number Events Strips Management
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid      include_report=${False}     is_save=${True}
    Clear Event Text Search
    ${expacted_number_events}       Evaluate    (${number_events} - 1)
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_events_cover}     Evaluate    int(${values_cover}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${expacted_number_events}        ${actual_events_cover}
    ${data_summary}     Read File Pdf Pages On     page_number=2
    ${values_summary}     Get Value In Summary File Pdf       data_pdf=${data_summary}
    ${actual_events_summary}     Evaluate    int(${values_summary}[manual_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events_summary}        ${actual_events_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_events_summary}        ${expacted_number_events}

Edit the event closed as Invalid and included in report
    Navigate Airp Tab     tab=Strips Management
    Navigate To Tab Menu Strips Management      menu=Included in report
    Filter Strips Management    text_search=${event_id}
    ${event_strips}     Get Strips Management
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_strips}
    Filter Strips Management    validity=Invalid     include_report=${True}    is_save=${True}
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_correlated_events_cover}     Evaluate    int(${values_cover}[correlated_events])
    ${data_cover}     Read File Pdf Pages On     page_number=2
    ${values_cover}     Get Value In Summary File Pdf       data_pdf=${data_cover}
    ${actual_correlated_events_summary}     Evaluate    int(${values_cover}[correlated_events])
    Set Global Variable    ${actual_correlated_events_cover}
    Set Global Variable    ${actual_correlated_events_summary}

Edit the event tag with tag name "${tag_name}"
    Switch Tab    tab_id=0
    Navigate To Subtab Menu       Events
    Wait Until Study Events Available
    Filter Study Events     text_search=${event_id}
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab    Event Details
    Edit Event Tag    event_name=${tag_name}     is_save=${True}

Create event report has been the status is Sent
    Close Tab    1
    Switch Tab    tab_id=0
    Navigate To Study Management Type    events
    Filter Study Events     by_validity=Invalid
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    ${event_id}         Evaluate        "${event_header['EVENT ID'].split('\n')[0]}"
    Edit Event Details    event_validity=Valid      include_report=${True}      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Sent

Stop Processing
    Stop Ai Processing
    ${msg}      Get Message Stop Successful
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}    Stop AI processing success

Select start and end time override
    Edit Artifact Event      is_start_time=${True}        x_offset_start_time=-450      y_offset_start_time=10
    Filter Thumbnail Option        jum_to_end_time=${True}
    Edit Artifact Event      is_end_time=${True}     x_offset_end_time=300      y_offset_end_time=100
    Edit Artifact Event      is_submit=${True}
    Filter Header    is_save=${True}

Verify the correlated events are displayed correctly
    [Arguments]     ${actual_correlated_cover}
    Navigate To Ai Report Page
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${expected_correlated_cover}     Evaluate    int(${values_cover}[correlated_events])
    Download File Pdf
    ${data_summary}     Read File Pdf Pages On     page_number=2
    ${values_summary}     Get Value In Summary File Pdf       data_pdf=${data_summary}
    ${expected_correlated_summary}     Evaluate    int(${values_summary}[correlated_events])
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_correlated_cover}     ${actual_correlated_cover}
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_correlated_summary}        ${expected_correlated_cover}

Create event report has been the status is ready
    Close Tab    1
    Switch Tab    tab_id=0
    Navigate To Study Management Type    events
    Filter Study Events     by_validity=Invalid
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    ${event_id}         Evaluate        "${event_header['EVENT ID'].split('\n')[0]}"
    Edit Event Details    event_validity=Valid      include_report=${True}      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Ready

Recall the event report
    Close Tab    1
    Switch Tab    tab_id=0
    Navigate To Study Management Type    Reports
    Filter Study Reports    by_report=Notification reports
    ${study_reports}        Get Study Reports
    ${report_status}        Evaluate    [item['Report ID'] for item in ${study_reports} if item.get('Report Status') == 'Sent']
    ${report_id}            Evaluate    random.choice(${report_status})     random
    Filter Study Reports    text_search=${report_id}
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    Back To Event Original    is_recall=${True}

Recall the notification report with "${report_id}"
    Close Tab    1
    Switch Tab    tab_id=0
    Navigate To Study Management Type    Reports
    Filter Study Reports    by_report=Notification reports
    Filter Study Reports    text_search=${report_id}
    Edit Report On      row=1
    Navigate To Event Tab    PDF Report
    Back To Event Original    is_recall=${True}

Create notification report has been the status is sent
    Navigate To Study Management Type    Reports
    Filter Study Reports    by_report=Notification reports
    ${study_reports}        Get Study Reports
    ${reports_id}       Get Reports Id Notification Events    report=${study_reports}
    ${report_id}            Evaluate    random.choice(${reports_id})     random
    Filter Study Reports    text_search=${report_id}
    Edit Report On      row=1
    Navigate To Event Tab    PDF Report
    Create Event Reports With Status Is Sent
    Set Global Variable    ${report_id}

Create notification report has been the status is ready
    Close Tab    1
    Switch Tab    tab_id=0
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    Create Notification Reports On      row=1
    Navigate To Event Tab    PDF Report
    Create Event Reports With Status Is Ready
    Edit Interim Pdf Report     is_save=${True}

Create notification report has been the status is generate
    Open Browser Callcenter
    Navigate To Study Management Page
    Navigate To Subtab Menu     Reports
    Filter Study Reports    by_report=Notification reports
    ${study_reports}        Get Study Reports
    ${reports_id}       Get Reports Id Notification Events    report=${study_reports}
    ${report_id}            Evaluate    random.choice(${reports_id})     random
    Filter Study Reports    text_search=${report_id}
    Edit Report On      row=1
    Navigate To Event Tab    PDF Report
    Create Event Reports With Status Is Generate
    Edit Interim Pdf Report     is_save=${True}

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

Verify the total auto triggers on pdf page
    [Arguments]     ${number_events_auto}
    Download The Pdf File On Pdf Report
    ${data}     Read File Pdf Pages On     page_number=0
    ${values_cover}     Get Value In Cover File Pdf   data_pdf=${data}
    ${actual_auto_cover}     Evaluate    int(${values_cover}[auto_triggers])
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_auto_cover}      ${number_events_auto}
    ${data_summary}     Read File Pdf Pages On     page_number=2
    ${values_summary}     Get Value In Summary File Pdf       data_pdf=${data_summary}
    ${actual_auto_summary}     Evaluate    int(${values_summary}[auto_triggers])
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_auto_summary}        ${actual_auto_cover}
