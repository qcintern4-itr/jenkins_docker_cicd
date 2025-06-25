*** Settings ***
Documentation   Test Suite - Call Center Supervisor Portal - View Reports
Metadata    sid     BFCC-SUPVR-REPORTS-VIEW
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
Library     project_bioflux_callcenter_portal/lib/web/Task.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-SUPVR-REPORTS-VIEW   web
Test Timeout    10m

*** Test Cases ***
BFCC-SUPVR-REPORTS-VIEW-PENDING-01: View a list of Interim reports created automatically on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-02: View report screen in case the user only associates with one facility on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The Interim reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-03: Filter a facility in case the user associates with multiples facility on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The Interim reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-04: Quick access to Study information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-05: Quick access to Patient information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-06: Access to the Report editing screen on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-07: Access to the Study Management screen on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-08: Manually sort the report list by Study ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-09: Manually sort the report list by Report ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-10: Manually sort the report list by Creation Time on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-11: Manually sort the report list by Duration on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-SUPVR-REPORTS-VIEW-PENDING-12: Manually sort the report list by Patient name on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-13: Manually sort the report list by Patient ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-14: Manually sort the report list by Report Status on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-15: Automatically sort the report list by SLA priority (default) on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-15      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-16: Automatically sort the report list by CODE RED on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-17: Check pagination tool works properly on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-18: View a list of EOU reports of MCT/Cardiac Event studies on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: User can view a list of EOU reports of MCT/Cardiac Event studies with statuses of Not Generated and Generated
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe information on the End of Use Reports tab
    ...
    ...     Expected Results:
    ...     1. The End of Use Reports list consists of the following fields:
    ...     - Study ID: hyperlink
    ...     - Study Type: If the study is a Follow-on studypart of the “Holter & Follow-on study”, then there shall be
    ...     a tag “FO” attached next to the study type
    ...     - Upload Date
    ...     - Return Visit
    ...     - Duration
    ...     - Time Monitored
    ...     - Patient Name: hyperlink
    ...     - Report Status
    ...     - New report status
    ...     - Action:
    ...      + The user shall able to edit the report
    ...      + The user shall be able to access the Study Management screen

    ...     **Others**
    ...     Update date: 11/20/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-18     auto   CP-2.16.9
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${all_reports}  Get All Pending Eou Reports
    ${actual_study_type}    Evaluate    [item['Study Type'].replace('| FO', '').strip() for item in ${all_reports}]
    ${actual_report_status}    Evaluate    [item['Report Status'] for item in ${all_reports}]
    ${actual_fields}        Evaluate    [k for k, v in ${reports}[0].items()]
    ${expected_study_type}      Create List    MCT      CARDIAC EVENT
    ${expected_report_status}      Create List    Not generated   Generated
    ${expected_fields}      Create List     Study ID    Study Type    Upload Date    Return Visit   Duration    Time Monitored   Patient Name   Report Status   New Report Status
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_study_type}       ${actual_study_type}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_report_status}       ${actual_report_status}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_fields}       ${actual_fields}

BFCC-SUPVR-REPORTS-VIEW-PENDING-19: View report screen in case the user only associates with one facility on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-19      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-20: Filter a facility in case the user associates with multiples facility on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-20      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    Filter Reports      facility=Facility_QA_01
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=Facility_SUPVR_02
#    ${reports}      Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      facility=All facilities
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}

BFCC-SUPVR-REPORTS-VIEW-PENDING-21: Quick access to Study information on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-21      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    View Pending Eou Reports Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-PENDING-22: Quick access to Patient information on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-22      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    View Pending Eou Reports Patient Information On      row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-PENDING-23-CP2.16.9: View details of New report status column on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update date: 11/20/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-23-CP2.16.9      manual   CP-2.16.9
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-24: Access to the Report editing screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-24      auto
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Custom Reports Size Rows    rows=50 rows
    ${completed_studies}        Get Completed Studies On Page
    ${studies_id}         Evaluate      [item['Study ID'] for item in ${completed_studies} if '(0 open)' in [' '.join(item['Total Events'].split(' ')[1:])] and (item.get('Study Type') == 'MCT' or item.get('Study Type') == 'CARDIAC EVENT') and (item.get('Report Status') == 'Generated' or item.get('Report Status') == 'Not Generated')]
    ${studies_id}         Evaluate      [value.split('| Artifact')[0].strip() for value in ${studies_id}]
    ${random_studies_id}    Evaluate  random.choice(${studies_id})    random
    # Verify access to the Report editing screen on End of Use reports sub-tab
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      search_by=Study ID      text_search=${random_studies_id}
    Edit Pending Eou Reports On     row=1
    ${report_edit}  Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_edit}    END OF USE REPORT

BFCC-SUPVR-REPORTS-VIEW-PENDING-25: Access to the Study Management screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-25         auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    ${study_id}     Set Variable    ${reports}[0][Study ID]
    Filter Reports    search_by=Study ID        text_search=${study_id}
    Manage Pending Eou Reports On       row=1
    ${header_detail}    Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header_detail}       STUDY

BFCC-SUPVR-REPORTS-VIEW-PENDING-26: Initiate the process of running AI for EOU report on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-26      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-27: Manually sort the report list by Study ID on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-27      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Study Id       desc
    ${reports}      Get All Pending Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${descending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_device_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Study Id       asc
    ${reports}      Get All Pending Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${ascending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_device_id}

BFCC-SUPVR-REPORTS-VIEW-PENDING-28: Manually sort the report list by Study Type on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-28      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-29: Manually sort the report list by Upload Date on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-29      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Upload Date       desc
    ${reports}      Get All Pending Eou Reports
    ${upload_date}       Evaluate    [item['Upload Date'] for item in ${reports}]
    ${descending_upload_date}   Sort Datetime Descending    date_time=${upload_date}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${upload_date}        ${descending_upload_date}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Upload Date       asc
    ${reports}      Get All Pending Eou Reports
    ${upload_date}       Evaluate    [item['Upload Date'] for item in ${reports}]
    ${ascending_upload_date}   Sort Datetime Ascending    date_time=${upload_date}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${upload_date}        ${ascending_upload_date}

BFCC-SUPVR-REPORTS-VIEW-PENDING-30: Manually sort the report list by Return Visit on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-30      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Return Visit       desc
    ${reports}      Get All Pending Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${descending_return_visits}   Sort Datetime Descending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${descending_return_visits}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Return Visit      asc
    ${reports}      Get All Pending Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${ascending_return_visits}   Sort Datetime Ascending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${ascending_return_visits}

BFCC-SUPVR-REPORTS-VIEW-PENDING-31: Manually sort the report list by Duration on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-31      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Duration       desc
    ${reports}      Get All Pending Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${descending_duration}   Sort Datetime Descending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${descending_duration}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Duration      asc
    ${reports}      Get All Pending Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${ascending_duration}   Sort Datetime Ascending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${ascending_duration}

BFCC-SUPVR-REPORTS-VIEW-PENDING-32: Manually sort the report list by Patient Name on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-32      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-33: Manually sort the report list by Report Status on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-33      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-34: Automatically sort the report list by SLA priority (default) on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-34      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-35: Automatically sort the report list by CODE RED on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-35      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-36: Check pagination tool works properly on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-36      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=End of Use reports      facility=All facilities
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
    Pagination Reports    next_or_previous=next
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Reports    next_or_previous=previous
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Reports Size Rows    rows=30 rows
    ${current_pagination}     Get Current Pagination
    ${reports}        Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
    Custom Reports Size Rows    rows=50 rows
    ${current_pagination}     Get Current Pagination
    ${reports}        Get Pending Eou Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-SUPVR-REPORTS-VIEW-PENDING-37: View a list of EOU reports of Holter/Extended Holter/MCT Peek studies on Holter End of Use Reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: User can view a list of EOU reports of Holter/Extended Holter/MCT Peek studies with statuses of
    ...     Not Generated and Generated
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The Holter End of Use Reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe information on the End of Use Reports tab
    ...
    ...     Expected Results:
    ...     1. The End of Use Reports list consists of the following fields:
    ...     - Study ID: hyperlink
    ...     - Study Type: If the study is a Follow-on studypart of the “Holter & Follow-on study”, then there shall be
    ...     a tag “FO” attached next to the study type
    ...     - Upload Date
    ...     - Return Visit
    ...     - Duration
    ...     - Time Monitored
    ...     - Patient Name: hyperlink
    ...     - Report Status
    ...     - New report status
    ...     - Action:
    ...      + The user shall able to edit the report
    ...      + The user shall be able to access the Study Management screen

    ...     **Others**
    ...     Update date: 11/20/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-37     auto   CP-2.16.9
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${all_reports}  Get Pending Holter Eou Reports
    ${actual_study_type}    Evaluate    [item['Study Type'].replace('| FO', '').strip() for item in ${all_reports}]
    ${actual_report_status}    Evaluate    [item['Report Status'] for item in ${all_reports}]
    ${actual_fields}        Evaluate    [k for k, v in ${reports}[0].items()]
    ${expected_study_type}      Create List    HOLTER   EXTENDED HOLTER     MCT PEEK
    ${expected_report_status}      Create List    Not generated   Generated
    ${expected_fields}      Create List     Study ID    Study Type    Upload Date    Return Visit   Duration    Time Monitored   Patient Name   Report Status   New Report Status
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_study_type}       ${actual_study_type}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_report_status}       ${actual_report_status}

BFCC-SUPVR-REPORTS-VIEW-PENDING-38: View report screen in case the user only associates with one facility on Holter End of Use Reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use Reports reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-38      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-39: Filter a facility in case the user associates with multiples facility on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use Reports reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-39      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${filter_options}       Get Filter Facilities Options
    ${actual_facilities}           Set Variable    ${filter_options}[Facilities]
    Filter Reports     facility=${actual_facilities}[1]
    ${reports}          Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}      No completed studies found - with facility '${actual_facilities}[1]'
#    Filter Reports     facility=${actual_facilities}[2]
#    ${reports}          Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}      No completed studies found - with facility '${actual_facilities}[2]'
    Filter Reports     facility=All facilities
    ${reports}          Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}      No completed studies found - with facility 'All facilities'

BFCC-SUPVR-REPORTS-VIEW-PENDING-40: Quick access to Study information on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-40      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    View Pending Holter Eou Reports Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-PENDING-41: Quick access to Patient information on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-41      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    View Pending Holter Eou Reports Patient Details On      row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code     Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-PENDING-42-CP2.16.9: View details of New report status column on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 11/20/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-42-CP2.16.9      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-43: Access to the Report editing screen on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-43      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    ${study_id}     Set Variable    ${reports}[0][Study ID]
    Filter Reports    search_by=Study ID        text_search=${study_id}
    Edit Pending Holter Eou Reports On       row=1
    ${header_detail}    Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header_detail}       END OF USE REPORT

BFCC-SUPVR-REPORTS-VIEW-PENDING-44: Access to the Study Management screen on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-44      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    ${study_id}     Set Variable    ${reports}[0][Study ID]
    Filter Reports    search_by=Study ID        text_search=${study_id}
    Manage Pending Holter Eou Reports On       row=1
    ${header_detail}    Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header_detail}       STUDY

BFCC-SUPVR-REPORTS-VIEW-PENDING-45: Initiate the process of running AI for EOU report on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-45      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-46: Manually sort the report list by Study ID on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-46      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Study Id       desc
    ${reports}      Get All Pending Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${descending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_device_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Study Id       asc
    ${reports}      Get All Pending Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${ascending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_device_id}

BFCC-SUPVR-REPORTS-VIEW-PENDING-47: Manually sort the report list by Study Type on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-47      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-48: Manually sort the report list by Upload Date on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-48      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Upload Date       desc
    ${reports}      Get All Pending Eou Reports
    ${upload_date}       Evaluate    [item['Upload Date'] for item in ${reports}]
    ${descending_upload_date}   Sort Datetime Descending    date_time=${upload_date}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${upload_date}        ${descending_upload_date}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Study Id       asc
    ${reports}      Get All Pending Eou Reports
    ${upload_date}       Evaluate    [item['Upload Date'] for item in ${reports}]
    ${ascending_upload_date}   Sort Datetime Ascending    date_time=${upload_date}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${upload_date}        ${ascending_upload_date}

BFCC-SUPVR-REPORTS-VIEW-PENDING-49: Manually sort the report list by Return Visit on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-49      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Return Visit       desc
    ${reports}      Get All Pending Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${descending_return_visits}   Sort Datetime Descending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${descending_return_visits}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Return Visit      asc
    ${reports}      Get All Pending Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${ascending_return_visits}   Sort Datetime Ascending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${ascending_return_visits}

BFCC-SUPVR-REPORTS-VIEW-PENDING-50: Manually sort the report list by Duration on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-50     auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    ${reports}      Get Pending Holter Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Pending Holter Eou Reports     Duration       desc
    ${reports}      Get Pending Holter Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${descending_duration}   Sort Datetime Descending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${descending_duration}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    Sort Pending Holter Eou Reports     Duration      asc
    ${reports}      Get Pending Holter Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${ascending_duration}   Sort Datetime Ascending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${ascending_duration}

BFCC-SUPVR-REPORTS-VIEW-PENDING-51: Manually sort the report list by Patient Name on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-51      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-52: Manually sort the report list by Report Status on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-52      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-53: Automatically sort the report list by SLA priority (default) on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-53      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-54: Automatically sort the report list by CODE RED on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-54      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-PENDING-55: Check pagination tool works properly on Holter End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-PENDING-55      auto
    Navigate To Reports
    Filter Reports      report_state=Pending        report_type=Holter End of Use reports      facility=All facilities
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
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
    Custom Reports Size Rows    rows=50 rows
    ${current_pagination}     Get Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BFCC-SUPVR-REPORTS-VIEW-READY-01: View a list of Notification Reports in the “Ready” tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: User can view a list of Notification Reports in the “Ready” tab
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-01      auto
    [Setup]     Create Ready Notification Reports
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Notification reports      facility=All facilities     by_assignee=All
    ${notification_reports}     Get Ready Notification Reports
    ${notification_study_id}      Evaluate    [item.get('Study ID', None) for item in ${notification_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${notification_study_id}      ${study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-02: View report screen in case the user only associates with one facility on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Ready tab of the REPORTS page
    ...     - The Call required sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-03: Filter a facility in case the user associates with multiples facility on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Ready tab of the REPORTS page
    ...     - The Call required sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-03      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Notification reports      by_assignee=All
    ${reports}      Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    Filter Reports      facility=Facility_QA_01
    ${reports}      Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=Facility_QA_02
#    ${reports}      Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      facility=All facilities
    ${reports}      Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}

BFCC-SUPVR-REPORTS-VIEW-READY-04: View a list of Notification reports with "Assignee: You” is selected on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen
    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-04     auto
    [Setup]    Unassign Multiple "Notification reports" Reports
    Create Ready Notification Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_5]"
    Assign Event Reports To You
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=Assigned to you
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    ${assigned_study_id}         Evaluate    [item.get('Study ID', None) for item in ${notification_report}]
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    ${all_study_id}         Evaluate    [item.get('Study ID', None) for item in ${notification_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${all_study_id}        ${assigned_study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-05: View a list of Notification reports with “Assignee: Unassigned” is selected Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-05      auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=Unassigned
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    ${unassigned_study_id}         Evaluate    [item.get('Study ID', None) for item in ${notification_report}]
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    ${all_study_id}         Evaluate    [item.get('Study ID', None) for item in ${notification_report}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${all_study_id}        ${unassigned_study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-06: View a list of Notification reports with “Assignee: All” is selected Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-06      auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=Unassigned
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    ${study_id_unassigned}        Evaluate    [item.get('Study ID', None) for item in ${notification_report} if item.get('Study ID', None) is not None]
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=Assigned to you
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    ${study_id_assgined}        Evaluate    [item.get('Study ID', None) for item in ${notification_report} if item.get('Study ID', None) is not None]
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    ${study_id_all}        Evaluate    [item.get('Study ID', None) for item in ${notification_report} if item.get('Study ID', None) is not None]
    ${study_id_all}        Evaluate    sorted(${study_id_all}, key=int, reverse=True)
    # Check if all values in study_id_unassigned are not in study_id_assgined
    ${expected_unassigned_vs_assign}      Evaluate    all(value not in ${study_id_unassigned} for value in ${study_id_assgined})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_assign}
    # Check if all values in study_id_unassigned are in study_id_all
    ${expected_unassigned_vs_all}      Evaluate    all(value in ${study_id_all} for value in ${study_id_unassigned})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_all}
    # check list all
    ${combined_unassigned_and_assgined}     Run Keyword And Continue On Failure     Combine Lists    ${study_id_unassigned}     ${study_id_assgined}
    ${combined_unassigned_and_assgined}        Evaluate    sorted(${combined_unassigned_and_assgined}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal        ${study_id_all}      ${combined_unassigned_and_assgined}

BFCC-SUPVR-REPORTS-VIEW-READY-07: Quick access to Study information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-07      auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All     facility=All facilities
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    View Ready Notification Reports Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-READY-08: Quick access to Patient information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update Date: 11/21/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-08      auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All     facility=All facilities
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    View Ready Notification Reports Patient Details On    row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-READY-09: Dismiss notification on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.


    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-09      auto
    [Setup]    Create Ready Notification Reports
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    Filter Reports    search_by=Study ID     text_search=${study_id}
    Dismiss Events Ready Notification Reports On        is_delete=${True}     event_id=${event_search}
    Navigate to report screen has the notification reports with study id is "${study_id}"
    Filter Study Reports    text_search=${event_search}
    ${study_reports}        Get Study Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${study_reports}[0][Report Status]    Dismissed
    Edit Report On      row=1
    Navigate To Event Tab      Event Report
    ${check_dismissed}      Check Active Event Report Available
    Run Keyword And Continue On Failure    Should Be Equal    ${check_dismissed}[Text Dismiss]      Reenable
    Filter Event Report    is_dismiss=${True}
    Generate Event Report Data
    ${msg}      Get Toast Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Generate Report Success
    ${status_report}    Check Generate Successful
    Run Keyword And Continue On Failure    Should Be True    ${status_report}

BFCC-SUPVR-REPORTS-VIEW-READY-10: Can go to edit report screen by using edit button on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-10     auto
    [Setup]    Create Ready Notification Reports
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    Filter Reports    search_by=Study ID        text_search=${study_id}
    Edit Ready Notification Event Report On    event_id=${event_search}
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_summary}       Get Event Summary
    ${event_id}            Evaluate     "${event_summary['EVENT ID'].split('\n')[0]}"
    Run Keyword And Continue On Failure    Should Be Equal    ${event_id}     ${event_search}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_summary}[STUDY ID]     ${study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-11: Can access to the Study management screen by using Manage study button on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-11      auto
    [Setup]    Create Ready Notification Reports
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    Filter Reports    search_by=Study ID        text_search=${study_id}
    ${event_report}     Get Ready Notification Event Reports Detail
    Manage Ready Notification Event Report On       event_id=${event_search}
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    ${event_summary}       Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${event_summary}[STUDY ID]     ${study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-12: Can create report by using the Create notification report button on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-13: Can assign a study for an user by using assign button on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-13      auto
    [Setup]     Unassign Multiple "Notification reports" Reports
    Create Ready Notification Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_2]"
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Notification reports        by_assignee=All
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${notification_report}
    Filter Reports    search_by=Study ID     text_search=${study_id}
    Assign Ready Notification Reports To Me     row=1
    ${notification_report}     Get Ready Notification Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${notification_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${notification_report}[0][Assignee]      You
    Navigate To Report Screen Has The Notification Reports With Study Id Is "${study_id}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item['Assignee'] for item in ${study_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${assignees}       You
    Edit Report On    row=1
    Navigate To Event Tab      Event Report
    ${verify_active_action}         Check Active Event Report Available
    Run Keyword And Continue On Failure    Should Be True    ${verify_active_action}[Assigned]

BFCC-SUPVR-REPORTS-VIEW-READY-14: Mark call completed status for Notification reports on Call required sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...
    ...     **Others**
    ...     Update Date: 8/22/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-14      auto
    [Setup]     Create Ready Call Required
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Call required
    ${call_required}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required}
    Filter Reports      search_by=Study ID      text_search=${study_id}
    Mark Call Completed Ready Call Required Reports On      row=1
    ${msg}              Get Toast Message
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}      Mark call completed
    ${call_required_check}    Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Be Empty    ${call_required_check}      msg=We couldn’t find any reports matching
    Navigate To Tab Menu    Studies
    Navigate To Studies Type        Completed
    Filter Studies        search_by=Study ID    text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    Filter Study Events    text_search=${event_search}
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${actual_call_option}       Get Event Details
    Run Keyword And Continue On Failure    Should Be Equal    ${actual_call_option}[Call Option]      Call Completed

BFCC-SUPVR-REPORTS-VIEW-READY-15: Quick access to Study information on Call required sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-15      auto
    [Setup]    Create Ready Call Required
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Call required
    ${call_required}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required}
    View Ready Call Required Reports Study Information On       row=1
    ${study_infor_view}     Get Study Information
    ${expected_top_title}       Create List    STUDY INFORMATION    STUDY NOTES     PHYSICIAN AMENDMENTS NOTES  REFERRING PHYSICIAN     INTERPRETING PHYSICIAN
    ${expected_study_infor}     Create List    Status   Start Time  End Time   Study Type   Patient Return Visit   Device ID     Duration   Facility    Total artifact percentage   EOL
    ${expected_refer_physician}  Create List     Name    Day Phone      After Hours Phone    Email      Fax Number
    ${expected_inter_physician}  Create List     Name    Day Phone      After Hours Phone    Email      Fax Number
    ${top_title}       Evaluate    [k for k, v in ${study_infor_view}.items()]
    ${study_info}      Evaluate    [k for k, v in ${study_infor_view}[STUDY INFORMATION].items()]
    ${refer_phy}       Evaluate    [k for k, v in ${study_infor_view}[REFERRING PHYSICIAN].items()]
    ${inter_phy}       Evaluate    [k for k, v in ${study_infor_view}[INTERPRETING PHYSICIAN].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${top_title}     ${expected_top_title}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${study_info}    ${expected_study_infor}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${refer_phy}     ${expected_refer_physician}
    Run Keyword And Continue On Failure    Lists Should Be Equal           ${inter_phy}     ${expected_inter_physician}

BFCC-SUPVR-REPORTS-VIEW-READY-16: Quick access to Patient information on Call required sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-16      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Call required
    ${call_required}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required}
    View Ready Call Required Reports Patient Details On    row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-READY-17: Can go to edit report screen by using edit button on Call required sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-17     auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Call required
    ${call_required}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required}
    ${study_id}     Set Variable    ${call_required}[0][Study ID]
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}     Get Ready Notification Event Reports Detail
    Edit Ready Notification Event Report On    event_id=${event_report}[0][Event ID]
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_summary}       Get Event Summary
    ${event_id}            Evaluate     "${event_summary['EVENT ID'].split('\n')[0]}"
    Run Keyword And Continue On Failure    Should Be Equal    ${event_id}     ${event_report}[0][Event ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${event_summary}[STUDY ID]     ${study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-18: Can access to the Study management screen by using Manage study button on Call required sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-18      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Call required
    ${call_required}     Get Ready Call Required Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${call_required}
    ${study_id}     Set Variable    ${call_required}[0][Study ID]
    Filter Reports      search_by=Study ID      text_search=${study_id}
    ${event_report}     Get Ready Notification Event Reports Detail
    Manage Ready Call Required Reports On       event_id=${event_report}[0][Event ID]
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    ${event_summary}       Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${event_summary}[STUDY ID]     ${study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-19: View information of Interim reports list on the Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-19      auto
    [Setup]    Create Ready Interim Report
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    ${interim_reports}     Get Ready Interim Reports
    ${iterim_study_id}      Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${iterim_report_id}      Evaluate    [item['Report ID'] for item in ${interim_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_study_id}      ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_report_id}     ${report_id}

BFCC-SUPVR-REPORTS-VIEW-READY-20: View report screen in case the user only associates with one facility on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the READY tab of the REPORTS page
    ...     - The Interim reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-20      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-21: Filter a facility in case the user associates with multiples facility on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the READY tab of the REPORTS page
    ...     - The Interim reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-21      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports      by_assignee=All
    ${reports}      Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    Filter Reports      facility=Facility_QA_01
    ${reports}      Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=Facility_QA_02
#    ${reports}      Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      facility=All facilities
    ${reports}      Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}

BFCC-SUPVR-REPORTS-VIEW-READY-22: Quick access to Study information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-22      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    ${interim_reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    View Ready Interim Reports Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-READY-23: Access to the Report editing screen on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-23      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    ${interim_reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Filter Reports     search_by=Study ID       text_search=${interim_reports}[0][Study ID]
    Edit Ready Interim Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     INTERIM REPORT
    ${header_info}      Get Event Summary
    ${report_id}         Evaluate        "${header_info['REPORT ID'].split('\n')[0]}"
    ${report_type}         Evaluate        "${header_info['REPORT ID'].split('\n')[1]}"
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_reports}[0][Study ID]       ${header_info}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_reports}[0][Report ID]       ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${report_type}        Interim

BFCC-SUPVR-REPORTS-VIEW-READY-24: Access to the Study Management screen on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-24      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    ${interim_reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Filter Reports     search_by=Study ID       text_search=${interim_reports}[0][Study ID]
    Manage Ready Interim Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    ${header_info}      Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_reports}[0][Study ID]       ${header_info}[STUDY ID]

BFCC-SUPVR-REPORTS-VIEW-READY-25: Manually sort the report list by Study ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-25      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    ${interim_reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    # sort descending
    Sort Ready Interim Reports     Study Id       desc
    ${interim_reports}     Get Ready Interim Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    Sort Ready Interim Reports     Study Id       asc
    ${interim_reports}     Get Ready Interim Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-SUPVR-REPORTS-VIEW-READY-26: Manually sort the report list by Report ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-26      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    ${interim_reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    # sort descending
    Sort Ready Interim Reports     Report Id       desc
    ${interim_reports}     Get Ready Interim Reports
    ${report_id}       Evaluate    [item['Report ID'] for item in ${interim_reports}]
    ${descending_report_id}      Evaluate    sorted(${report_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${report_id}        ${descending_report_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    Sort Ready Interim Reports     Report Id       asc
    ${interim_reports}     Get Ready Interim Reports
    ${report_id}       Evaluate    [item['Report ID'] for item in ${interim_reports}]
    ${ascending_report_id}      Evaluate    sorted(${report_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${report_id}        ${ascending_report_id}

BFCC-SUPVR-REPORTS-VIEW-READY-27: Manually sort the report list by Creation Time on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-27      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-28: Manually sort the report list by Duration on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-28      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    ${interim_reports}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    # sort descending
    Sort Ready Interim Reports         Duration       desc
    ${interim_reports}     Get Ready Interim Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${interim_reports}]
    ${descending_duration}   Sort Datetime Descending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${descending_duration}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All
    Sort Ready Interim Reports     Duration      asc
    ${interim_reports}     Get Ready Interim Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${interim_reports}]
    ${ascending_duration}   Sort Datetime Ascending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${ascending_duration}

BFCC-SUPVR-REPORTS-VIEW-READY-29: Manually sort the report list by Patient name on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-29      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-30: Manually sort the report list by Patient ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-30      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-31: Manually sort the report list by Study Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-31      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-32: Automatically sort the report list by SLA priority (default) on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-32      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-33: Can assign a study for an user by using assign button on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-33      auto
    [Setup]    Unassign Multiple "Interim reports" Reports
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_ASSIGN}[study_id_3]
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    Create Interim Report
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=All
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_report}
    Filter Reports    search_by=Study ID     text_search=${study_id}
    Assign To Me Ready Interim Reports On     row=1
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_report}[0][Assignee]      You
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=Assigned to you
    ${interim_report}     Get Ready Interim Reports
    ${interim_study_id}        Evaluate    [item['Study ID'] for item in ${interim_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${interim_study_id}      ${study_id}
    Navigate to report screen with study id is "${study_id}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item['Assignee'] for item in ${study_report} if item.get('Type') == 'Interim']
    Run Keyword And Continue On Failure    List Should Contain Value    ${assignees}       You
    Edit Report On    row=1
    ${verify_active_action}         Check Active Event Report Available
    Run Keyword And Continue On Failure    Should Be True    ${verify_active_action}[Assigned]

BFCC-SUPVR-REPORTS-VIEW-READY-34: View a list of Interim reports with "Assignee: You” is selected on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-34     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-35: View a list of Interim reports with “Assignee: Unassigned” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-35      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-36: View a list of Interim reports with “Assignee: All” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-36      auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=Unassigned
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_report}
    ${study_id_unassigned}        Evaluate    [item['Study ID'] for item in ${interim_report}]
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=Assigned to you
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_report}
    ${study_id_assgined}        Evaluate    [item['Study ID'] for item in ${interim_report}]
    Filter Reports    report_state=Ready        report_type=Interim reports        by_assignee=All
    ${interim_report}     Get Ready Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_report}
    ${study_id_all}        Evaluate    [item['Study ID'] for item in ${interim_report}]
    ${study_id_all}        Evaluate    sorted(${study_id_all}, key=int, reverse=True)
    # Check if all values in study_id_unassigned are not in study_id_assgined
    ${expected_unassigned_vs_assign}      Evaluate    all(value not in ${study_id_unassigned} for value in ${study_id_assgined})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_assign}
    # Check if all values in study_id_unassigned are in study_id_all
    ${expected_unassigned_vs_all}      Evaluate    all(value in ${study_id_all} for value in ${study_id_unassigned})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_all}
    # check list all
    ${combined_unassigned_and_assgined}     Run Keyword And Continue On Failure     Combine Lists    ${study_id_unassigned}     ${study_id_assgined}
    ${combined_unassigned_and_assgined}        Evaluate    sorted(${combined_unassigned_and_assgined}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal        ${study_id_all}         ${combined_unassigned_and_assgined}

BFCC-SUPVR-REPORTS-VIEW-READY-37: View a list of Interim reports with “Report type: Artifact reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-37      auto
    [Setup]    Create Ready Interim Report
    Mark Artifact Ready Interim Report    is_mark=${True}
    Navigate To Reports
    # check for tc BFCC-QA-REPORTS-VIEW-READY-38
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All     by_report=All reports
    ${interim_reports}     Get Ready Interim Reports
    ${iterim_study_id}      Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${iterim_report_id}      Evaluate    [item['Report ID'] for item in ${interim_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_study_id}        ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_report_id}       ${report_id}
    Refresh Page
    Filter Reports      report_state=Ready        report_type=Interim reports       by_assignee=All     by_report=Artifact reports
    ${interim_reports}     Get Ready Interim Reports
    ${iterim_study_id}      Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${iterim_report_id}      Evaluate    [item['Report ID'] for item in ${interim_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_study_id}        ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_report_id}       ${report_id}

BFCC-SUPVR-REPORTS-VIEW-READY-38: View a list of Interim reports with “Report type: All reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-38      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-39: View a list of EOU reports in Ready tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: User can  view a list of EOU reports with the “Ready” status
    ...
    ...     Precondition:
    ...     - The user is on the Ready  tab of the REPORTS page
    ...     - The EOU sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe information on the End of Use Reports tab
    ...
    ...     Expected Results:
    ...     1. The Ready tab for EOU reports (MCT, Cardiac Event, and Holter studies) consists of the following fields:
    ...     - Study ID: hyperlink
    ...      + If the EOU Report has been marked as an “Artifact report”, then an “error” tag shall be placed next to the Study ID value of the report
    ...      + When the clinic user hovers over the “error” tag a tooltip shall appear with the label “This study has report marked as artifact.”
    ...     - Study Type: If the study is a Follow-on studypart of the “Holter & Follow-on study”, then there shall be
    ...     a tag “FO” attached next to the study type
    ...     - Upload Date
    ...     - Study Duration
    ...     - Time Monitored
    ...     - Patient Name: hyperlink
    ...     - Return Visit
    ...     - Action:
    ...      + The user shall able to edit the report
    ...      + The user shall be able to access the Study Management screen
    ...      + Assign button: When the user selects the “Unassigned” or “All” option, there shall be an Assign button to
    ...      allow the Call Center SUPVR user to self-assign the task that has not been assigned to any assignee. When the user
    ...      hovers over the button, a tooltip with the following message: “Assign to me” shall be displayed
    ...         . When it is clicked, the report shall be moved to the list of “Assigned to you”
    ...     - Assignee:
    ...     - New report status

    ...     **Others**
    ...     Update date: 11/20/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-39     auto   CP-2.16.9
    Create Ready End Of Use Reports
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports       by_assignee=All
    ${eou_reports}     Get Ready Eou Reports
    ${eou_study_id}      Evaluate    [item['Study ID'] for item in ${eou_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}      ${study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-40: View report screen in case the user only associates with one facility on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-40      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-41: Filter a facility in case the user associates with multiples facility on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-41      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports      by_assignee=All
    ${reports}      Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
    Filter Reports      facility=Facility_QA_01
    ${reports}      Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=Facility_QA_02
#    ${reports}      Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    Filter Reports      facility=All facilities
    ${reports}      Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}

BFCC-SUPVR-REPORTS-VIEW-READY-42: Quick access to Study information on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-42      auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=All     facility=All facilities
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    View Ready Eou Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-READY-43: Quick access to Patient information on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-43      auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=All     facility=All facilities
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    View Ready Eou Patient Details On       row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List      ${expected_diagnostic_info}    ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-READY-44-CP2.16.9: View details of New report status column on EOU sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 11/20/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-44-CP2.16.9     manual   CP-2.16.9
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-45: Access to the Report editing screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-45      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports       by_assignee=All
    ${eou_reports}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Filter Reports     search_by=Study ID       text_search=${eou_reports}[0][Study ID]
    Edit Ready Eou Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     END OF USE REPORT
    ${header_info}      Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_reports}[0][Study ID]       ${header_info}[STUDY ID]

BFCC-SUPVR-REPORTS-VIEW-READY-46: Access to the Study Management screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-46      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports       by_assignee=All
    ${eou_reports}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Filter Reports     search_by=Study ID       text_search=${eou_reports}[0][Study ID]
    Manage Ready Eou Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    ${header_info}      Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_reports}[0][Study ID]       ${header_info}[STUDY ID]

BFCC-SUPVR-REPORTS-VIEW-READY-47: Initiate the process of running AI for EOU report on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-47      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-48: Manually sort the report list by Study ID on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-48      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports      facility=All facilities       by_assignee=All
    ${reports}      Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Ready Eou Reports   Study Id       desc
    ${reports}      Get Ready Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${descending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_device_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Ready        report_type=End of Use reports      facility=All facilities       by_assignee=All
    Sort Ready Eou Reports     Study Id       asc
    ${reports}      Get Ready Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${ascending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_device_id}

BFCC-SUPVR-REPORTS-VIEW-READY-49: Manually sort the report list by Study Type on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-49      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-50: Manually sort the report list by Upload Date on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-50      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-51: Manually sort the report list by Duration on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-51      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports      facility=All facilities       by_assignee=All
    ${reports}      Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Ready Eou Reports     Duration       desc
    ${reports}      Get Ready Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${descending_duration}   Sort Datetime Descending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${descending_duration}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Ready        report_type=End of Use reports      facility=All facilities       by_assignee=All
    Sort Ready Eou Reports     Duration      asc
    ${reports}      Get Ready Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${ascending_duration}   Sort Datetime Ascending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${ascending_duration}

BFCC-SUPVR-REPORTS-VIEW-READY-52: Manually sort the report list by Patient Name on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-52      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-53: Manually sort the report list by Return Visit on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-53     auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports      facility=All facilities       by_assignee=All
    ${reports}      Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Ready Eou Reports     Return Visit       desc
    ${reports}      Get Ready Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${descending_return_visits}   Sort Datetime Descending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${descending_return_visits}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Ready        report_type=End of Use reports      facility=All facilities       by_assignee=All
    Sort Ready Eou Reports     Return Visit      asc
    ${reports}      Get Ready Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${ascending_return_visits}   Sort Datetime Ascending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${ascending_return_visits}

BFCC-SUPVR-REPORTS-VIEW-READY-54: Automatically sort the report list by SLA priority (default) on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-54      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-55: Automatically sort the report list by CODE RED on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-55      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-56: Check pagination tool works properly on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-56      auto
    Navigate To Reports
    Filter Reports      report_state=Ready        report_type=End of Use reports      facility=All facilities       by_assignee=All
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-SUPVR-REPORTS-VIEW-READY-57: Can assign a study for an user by using assign button on End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-57      auto
    [Setup]    Unassign Multiple "End of Use report" Reports
    Create Ready End Of Use Reports With Study Id Is "${STUDY_ID_ASSIGN}[study_id_4]"
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=End of Use reports      by_assignee=All
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    Filter Reports    search_by=Study ID     text_search=${study_id}
    Assign To Me Ready Eou Reports On         row=1
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_report}[0][Study ID]      ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_report}[0][Assignee]      You
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=Assigned to you
    ${eou_report}     Get Ready Eou Reports
    ${eou_study_id}        Evaluate    [item['Study ID'] for item in ${eou_report}]
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}      ${study_id}
    Navigate to report screen with study id is "${study_id}"
    ${study_report}     Get Study Reports
    ${assignees}        Evaluate    [item['Assignee'] for item in ${study_report} if item.get('Type') == 'End Of Use']
    Run Keyword And Continue On Failure    List Should Contain Value    ${assignees}       You
    Edit Report On    row=1
    ${verify_active_action}         Check Active Event Report Available
    Run Keyword And Continue On Failure    Should Be True    ${verify_active_action}[Assigned]

BFCC-SUPVR-REPORTS-VIEW-READY-58: View a list of End of Use reports with "Assignee: You” is selected on End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-58     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-59: View a list of End of Use reports with “Assignee: Unassigned” is selected End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-59      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-60: View a list of End of Use reports with “Assignee: All” is selected End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-60     auto
    Navigate To Reports
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=Unassigned
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    ${study_id_unassigned}        Evaluate    [item['Study ID'] for item in ${eou_report}]
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=Assigned to you
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    ${study_id_assgined}        Evaluate    [item['Study ID'] for item in ${eou_report}]
    Filter Reports    report_state=Ready        report_type=End of Use reports        by_assignee=All
    ${eou_report}     Get Ready Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    ${study_id_all}        Evaluate    [item['Study ID'] for item in ${eou_report}]
    ${study_id_all}        Evaluate    sorted(${study_id_all}, key=int, reverse=True)
    # Check if all values in study_id_unassigned are not in study_id_assgined
    ${expected_unassigned_vs_assign}      Evaluate    all(value not in ${study_id_unassigned} for value in ${study_id_assgined})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_assign}
    # Check if all values in study_id_unassigned are in study_id_all
    ${expected_unassigned_vs_all}      Evaluate    all(value in ${study_id_all} for value in ${study_id_unassigned})
    Run Keyword And Continue On Failure    Should Be True    ${expected_unassigned_vs_all}
    # check list all
    ${combined_unassigned_and_assgined}     Run Keyword And Continue On Failure     Combine Lists    ${study_id_unassigned}     ${study_id_assgined}
    ${combined_unassigned_and_assgined}        Evaluate    sorted(${combined_unassigned_and_assgined}, key=int, reverse=True)

BFCC-SUPVR-REPORTS-VIEW-READY-62: View a list of End of Use reports with “Report type: Artifact reports” is selected End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-62      auto
    [Setup]    Create Ready End Of Use Reports
    Mark Artifact Ready Interim Report    is_mark=${True}
    Navigate To Reports
    # check for tc BFCC-QA-REPORTS-VIEW-READY-63
    Filter Reports      report_state=Ready        report_type=End of Use reports       by_assignee=All     by_report=All reports
    ${eou_reports}     Get Ready Eou Reports
    ${eou_study_id}      Evaluate    [item['Study ID'] for item in ${eou_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}        ${study_id}
    Refresh Page
    Filter Reports      report_state=Ready        report_type=End of Use reports       by_assignee=All     by_report=Artifact reports
    ${eou_reports}     Get Ready Eou Reports
    ${eou_study_id}      Evaluate    [item['Study ID'] for item in ${eou_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}        ${study_id}

BFCC-SUPVR-REPORTS-VIEW-READY-63: View a list of End of Use reports with “Report type: All reports” is selected End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-63      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-READY-64: Access to the AI Report editing screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-READY-64      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-01: View a list of Event Reports in the “Sent” tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: User can view a list of Event Reports in the “Sent” tab
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-01      auto
    [Setup]    Create Event Report Has The Status Is Sent
    Refresh Page
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${event_reports}     Get Sent Event Reports
    ${event_study_id}      Evaluate    [item['Study ID'] for item in ${event_reports}]
    ${event_event_id}      Evaluate    [item['Event ID'] for item in ${event_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    ${actual_study_type}    Evaluate    [item['Study Type'].replace('| FO', '').strip() for item in ${event_reports}]
    ${actual_fields}        Evaluate    [k for k, v in ${event_reports}[0].items()]
    ${expected_study_type}      Create List    MCT  CARDIAC EVENT   HOLTER
    ${expected_fields}      Create List     Study ID    Event ID    Event Type   Patient Name   Patient ID   Study Type   Report Date
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_study_type}       ${actual_study_type}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_fields}       ${actual_fields}
    Run Keyword And Continue On Failure    List Should Contain Value     ${event_study_id}       ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${event_event_id}       ${event_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-02: View report screen in case the user only associates with one facility on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Sent tab of the REPORTS page
    ...     - The Event reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed
    ...
    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-03: Filter a facility in case the user associates with multiples facility on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Sent tab of the REPORTS page
    ...     - The Event reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly
    ...

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-03      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${event_reports}    Get Sent Event Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
#    Filter Reports      facility=Facility_QA_01
#    ${reports}      Get Sent Event Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=Facility_QA_02
#    ${reports}      Get Sent Event Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=All facilities
#    ${reports}      Get Sent Event Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}

BFCC-SUPVR-REPORTS-VIEW-SENT-04: Quick access to Study information on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-04      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${event_reports}    Get Sent Event Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    View Sent Event Reports Study Information On     row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-SENT-05: Quick access to Patient information on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-05      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${event_reports}    Get Sent Event Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}
    View Sent Event Report Patient Details On   row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List        ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-SENT-06: Can go to edit report screen by using edit button on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-06      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${event_reports}    Get Sent Event Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}      msg=The notification report not found
    Filter Reports      search_by=Study ID      text_search=${event_reports}[0][Study ID]
    Edit Sent Event Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     EVENT
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    ${event_id}         Evaluate        "${event_header['EVENT ID'].split('\n')[0]}"
    Run Keyword And Continue On Failure    Should Be Equal    ${event_reports}[0][Study ID]         ${study_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${event_reports}[0][Event ID]         ${event_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-07: Can access to the Study management screen by using Manage study button on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-07      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${event_reports}    Get Sent Event Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${event_reports}      msg=The notification report not found
    Manage Sent Event Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    ${event_header}     Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${event_reports}[0][Study ID]         ${event_header}[STUDY ID]

BFCC-SUPVR-REPORTS-VIEW-SENT-08: Manually sort the report list by Study ID on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-08      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${reports}      Get Sent Event Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Sent Event Reports     Study Id       desc
    ${reports}      Get Sent Event Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${descending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_device_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    Sort Sent Event Reports     Study Id       asc
    ${reports}      Get Sent Event Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${ascending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_device_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-09: Manually sort the report list by Event ID on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-09       auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${reports}      Get Sent Event Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Sent Event Reports     Event Id       desc
    ${reports}      Get Sent Event Reports
    ${event_id}       Evaluate    [item['Event ID'] for item in ${reports}]
    ${descending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${descending_event_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    Sort Sent Event Reports     Event Id       asc
    ${reports}      Get Sent Event Reports
    ${event_id}       Evaluate    [item['Event ID'] for item in ${reports}]
    ${ascending_event_id}      Evaluate    sorted(${event_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${event_id}        ${ascending_event_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-10: Manually sort the report list by Event Type on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-11: Manually sort the report list by Patient Name on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-12: Manually sort the report list by Patient ID on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-12      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-13: Manually sort the report list by Study Type on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-13      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-14: Manually sort the report list by Report Date on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-15: Check pagination tool works properly on Event reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-15      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Event reports      facility=All facilities
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-SUPVR-REPORTS-VIEW-SENT-16: View a list of Notification Reports in the “Sent” tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: User can view a list of Notification Reports in the “Sent” tab
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-16      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-17: View report screen in case the user only associates with one facility on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Sent tab of the REPORTS page
    ...     - The Notification reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed
    ...
    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-17      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-18: Filter a facility in case the user associates with multiples facility on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Sent tab of the REPORTS page
    ...     - The Notification reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly
    ...

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-18      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-19: Quick access to Study information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-19      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-20: Quick access to Patient information on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-20      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-21: Can go to edit report screen by using edit button on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-21      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-22: Can access to the Study management screen by using Manage study button on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-22      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-23: Manually sort the report list by Study ID on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-23      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-24: Manually sort the report list by Report ID on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-24      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-25: Manually sort the report list by Duration on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-25      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-26: Manually sort the report list by Patient Name on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-26      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-27: Manually sort the report list by Patient ID on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-27      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-28: Manually sort the report list by Study Type on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-28      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-29: Manually sort the report list by Report Date on Notification reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-29      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-30: View information of Interim reports list on the Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-30      auto
    [Setup]    Create Sent Interim Report
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    ${iterim_study_id}      Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${iterim_report_id}      Evaluate    [item['Report ID'] for item in ${interim_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_study_id}      ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_report_id}     ${report_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-31: View report screen in case the user only associates with one facility on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the READY tab of the REPORTS page
    ...     - The Interim reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-31      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-32: Filter a facility in case the user associates with multiples facility on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the READY tab of the REPORTS page
    ...     - The Interim reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-32      auto
    [Setup]    Create Sent Interim Report
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports
    ${reports}      Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
#    Filter Reports      facility=Facility_QA_01
#    ${reports}      Get Sent Interim Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=Facility_QA_02
#    ${reports}      Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=All facilities
#    ${reports}      Get Sent Interim Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}

BFCC-SUPVR-REPORTS-VIEW-SENT-33: Quick access to Patient information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-33     auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    View Sent Interim Reports Study Information On      row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-SENT-65: Quick access to Patient information on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-65      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    View Sent Interim Reports Patient Details On      row=1
    ${study_info}      Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code        Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-SENT-34: Access to the Report editing screen on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-34      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Filter Reports     search_by=Study ID       text_search=${interim_reports}[0][Study ID]
    Edit Sent Interim Reports On       row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     INTERIM REPORT
    ${header_info}      Get Event Summary
    ${report_id}         Evaluate        "${header_info['REPORT ID'].split('\n')[0]}"
    ${report_type}         Evaluate        "${header_info['REPORT ID'].split('\n')[1]}"
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_reports}[0][Study ID]       ${header_info}[STUDY ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_reports}[0][Report ID]       ${report_id}
    Run Keyword And Continue On Failure    Should Be Equal    ${report_type}        Interim

BFCC-SUPVR-REPORTS-VIEW-SENT-35: Access to the Study Management screen on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-35      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Filter Reports     search_by=Study ID       text_search=${interim_reports}[0][Study ID]
    Manage Sent Interim Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    ${header_info}      Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${interim_reports}[0][Study ID]       ${header_info}[STUDY ID]

BFCC-SUPVR-REPORTS-VIEW-SENT-36: Manually sort the report list by Study ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-36      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    # sort descending
    Sort Sent Interim Reports     Study Id       desc
    ${interim_reports}     Get Sent Interim Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${descending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_studies_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    Sort Sent Interim Reports     Study Id       asc
    ${interim_reports}     Get Sent Interim Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${ascending_studies_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_studies_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-37: Manually sort the report list by Report ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-37      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    # sort descending
    Sort Sent Interim Reports     Report Id       desc
    ${interim_reports}     Get Sent Interim Reports
    ${report_id}       Evaluate    [item['Report ID'] for item in ${interim_reports}]
    ${descending_report_id}      Evaluate    sorted(${report_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${report_id}        ${descending_report_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    Sort Sent Interim Reports     Report Id       asc
    ${interim_reports}     Get Sent Interim Reports
    ${report_id}       Evaluate    [item['Report ID'] for item in ${interim_reports}]
    ${ascending_report_id}      Evaluate    sorted(${report_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${report_id}        ${ascending_report_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-38: Manually sort the report list by Duration on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-38      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    # sort descending
    Sort Sent Interim Reports         Duration       desc
    ${interim_reports}     Get Sent Interim Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${interim_reports}]
    ${descending_duration}   Sort Datetime Descending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${descending_duration}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=All reports
    Sort Sent Interim Reports     Duration      asc
    ${interim_reports}     Get Sent Interim Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${interim_reports}]
    ${ascending_duration}   Sort Datetime Ascending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${ascending_duration}

BFCC-SUPVR-REPORTS-VIEW-SENT-39: Manually sort the report list by Patient Name on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-39      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-40: Manually sort the report list by Patient ID on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-40      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-41: Manually sort the report list by Study Type on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-41      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-42: Manually sort the report list by Report Date on Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-42      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-43: View a list of Interim reports with “Report type: Artifact reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-43      auto
    [Setup]    Create Ready Interim Report
    Mark Artifact Ready Interim Report    is_mark=${True}
    Filter Interim Report    is_click=${True}       is_send=${True}
    Navigate To Reports
    # check for tc BFCC-QA-REPORTS-VIEW-SENT-63
    Filter Reports      report_state=Sent        report_type=Interim reports     by_report=All reports
    ${interim_reports}     Get Sent Interim Reports
    ${iterim_study_id}      Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${iterim_report_id}      Evaluate    [item['Report ID'] for item in ${interim_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_study_id}        ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_report_id}       ${report_id}
    Refresh Page
    Filter Reports      report_state=Sent        report_type=Interim reports       by_report=Artifact reports
    ${interim_reports}     Get Sent Interim Reports
    ${iterim_study_id}      Evaluate    [item['Study ID'] for item in ${interim_reports}]
    ${iterim_report_id}      Evaluate    [item['Report ID'] for item in ${interim_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${interim_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_study_id}        ${study_id}
    Run Keyword And Continue On Failure    List Should Contain Value    ${iterim_report_id}       ${report_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-44: View a list of Interim reports with “Report type: All reports” is selected Interim reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-44     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-45: View a list of EOU reports in Sent tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: User can view a list of Sent EOU reports
    ...
    ...     Precondition:
    ...     - The user is on the Sent tab of the REPORTS page
    ...
    ...     Test Steps:
    ...     1. Observe information on the End of Use Reports tab
    ...
    ...     Expected Results:
    ...     1. The Sent reports EOU list consists of the following fields
    ...     - Study ID: hyperlink
    ...      + If the EOU Report has been marked as an “Artifact report”, then an “error” tag shall be placed next to the Study ID value of the report
    ...      + When the clinic user hovers over the “error” tag a tooltip shall appear with the label “This study has report marked as artifact.”
    ...     - Study Type: If the study is a Follow-on studypart of the “Holter & Follow-on study”, then there shall be
    ...     a tag “FO” attached next to the study type
    ...     - Upload Date
    ...     - Study Duration
    ...     - Time Monitored
    ...     - Patient Name: hyperlink
    ...     - Return Visit (EOU, Holter EOU)
    ...     - Action:
    ...      + Edit Report: there shall be a hyperlink that redirects the user to the Report Editing screen.
    ...      + The user shall be able to access the Study Management screen
    ...     - New report status

    ...     **Others**
    ...     Update date: 12/05/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-45    auto   CP-2.16.9
    [Setup]    Create Sent End Of Use Reports
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=End of Use reports
    ${eou_reports}     Get Sent Eou Reports
    ${eou_study_id}      Evaluate    [item['Study ID'] for item in ${eou_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}      ${study_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-46: View report screen in case the user only associates with one facility on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the header of REPORTS page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the REPORTS page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-46      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-47: Filter a facility in case the user associates with multiples facility on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can filter a specific facility
    ...
    ...     Precondition:
    ...     - The user is on the Pending tab of the REPORTS page
    ...     - The End of Use reports sub-tab is selected
    ...
    ...     Test Steps:
    ...     1. Click on the faclity drop-down list on header of the REPORTS page
    ...     2. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the REPORTS page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-47      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=End of Use reports
    ${reports}      Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    ${current_report}        Get Reports Current Filter Values
    ${report_header}        Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${report_header}       REPORTS
    Run Keyword And Continue On Failure    Should Be Equal    ${current_report}[Facility]       All facilities
#    Filter Reports      facility=Facility_QA_01
#    ${reports}      Get Sent Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=Facility_QA_02
#    ${reports}      Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
#    Filter Reports      facility=All facilities
#    ${reports}      Get Sent Eou Reports
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}

BFCC-SUPVR-REPORTS-VIEW-SENT-48: Quick access to Study information on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-48      auto
    Navigate To Reports
    Filter Reports    report_state=Sent        report_type=End of Use reports
    ${eou_report}     Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    View Sent Eou Reports Study Information On       row=1
    ${study_info}       Get Study Information
    # expected study information
    ${expected_study_info}      Create List    Status       Start Time      End Time        Study Type      Patient Return Visit       Device ID
    ...  Duration       Facility        Total artifact percentage       EOL
    ${expected_refer_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    ${expected_inter_phy}      Create List      Name        Day Phone       After Hours Phone       Email       Fax Number
    # actual study information
    ${actual_study_info}        Evaluate    [k for k, v in ${study_info}[STUDY INFORMATION].items()]
    ${actual_refer_phy}        Evaluate    [k for k, v in ${study_info}[REFERRING PHYSICIAN].items()]
    ${actual_inter_phy}        Evaluate    [k for k, v in ${study_info}[INTERPRETING PHYSICIAN].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_study_info}      ${actual_study_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_refer_phy}      ${actual_refer_phy}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_inter_phy}      ${actual_inter_phy}

BFCC-SUPVR-REPORTS-VIEW-SENT-49: Quick access to Patient information on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-49      auto
    Navigate To Reports
    Filter Reports    report_state=Sent        report_type=End of Use reports
    ${eou_report}     Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_report}
    View Sent Eou Reports Patient Details On       row=1
    ${study_info}       Get Patient Details
    # expected study information
    ${expected_patient_info}      Create List    Name       Gender      ID        DOB      Height       Weight      Ethnicity       Pacemaker       ICD
    ${expected_patient_contact}      Create List      Address        Zip code       Phone Number       2nd Phone Number       Email
    ${expected_diagnostic_info}      Create List      Medications        Insurance       Primary diagnosis code         Secondary diagnosis code    AFib Detected
    # actual study information
    ${actual_patient_info}        Evaluate    [k for k, v in ${study_info}[PATIENT INFORMATION].items()]
    ${actual_patient_contact}        Evaluate    [k for k, v in ${study_info}[PATIENT CONTACT].items()]
    ${actual_diagnostic_info}        Evaluate    [k for k, v in ${study_info}[DIAGNOSIS INFORMATION].items()]
    # compare the values
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_info}      ${actual_patient_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_patient_contact}      ${actual_patient_contact}
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_diagnostic_info}      ${actual_diagnostic_info}

BFCC-SUPVR-REPORTS-VIEW-SENT-50-CP2.16.9: View details of New report status column on EOU sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.
    ...     **Others**
    ...     Update date: 11/20/2023 - Trinh Nguyen

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-50-CP2.16.9    manual   CP-2.16.9
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-51: Access to the Report editing screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-51      auto
    Navigate To Reports
    Filter Reports    report_state=Sent        report_type=End of Use reports
    ${eou_reports}     Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Filter Reports     search_by=Study ID       text_search=${eou_reports}[0][Study ID]
    Edit Sent Eou Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     END OF USE REPORT
    ${header_info}      Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_reports}[0][Study ID]       ${header_info}[STUDY ID]

BFCC-SUPVR-REPORTS-VIEW-SENT-52: Access to the Study Management screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-52      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=End of Use reports
    ${eou_reports}     Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Filter Reports     search_by=Study ID       text_search=${eou_reports}[0][Study ID]
    Manage Sent Eou Reports On    row=1
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     STUDY
    ${header_info}      Get Event Summary
    Run Keyword And Continue On Failure    Should Be Equal    ${eou_reports}[0][Study ID]       ${header_info}[STUDY ID]

BFCC-SUPVR-REPORTS-VIEW-SENT-53: Initiate the process of running AI for EOU report on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-53      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-54: Manually sort the report list by Study ID on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-54      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Sent Eou Reports   Study Id       desc
    ${reports}      Get Sent Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${descending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${descending_device_id}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=End of Use reports      facility=All facilities
    Sort Sent Eou Reports     Study Id       asc
    ${reports}      Get Sent Eou Reports
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${reports}]
    ${ascending_device_id}      Evaluate    sorted(${studies_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${studies_id}        ${ascending_device_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-55: Manually sort the report list by Study Type on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-55      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-56: Manually sort the report list by Upload Date on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-56      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-57: Manually sort the report list by Duration on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-57      auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Sent Eou Reports     Duration       desc
    ${reports}      Get Sent Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${descending_duration}   Sort Datetime Descending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${descending_duration}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=End of Use reports      facility=All facilities
    Sort Sent Eou Reports     Duration      asc
    ${reports}      Get Sent Eou Reports
    ${duration}       Evaluate    [item['Duration'] for item in ${reports}]
    ${ascending_duration}   Sort Datetime Ascending    duration=${duration}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${duration}        ${ascending_duration}

BFCC-SUPVR-REPORTS-VIEW-SENT-58: Manually sort the report list by Patient Name on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-58      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-59: Manually sort the report list by Return Visit on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-59     auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=End of Use reports      facility=All facilities
    ${reports}      Get Sent Eou Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}
    # sort descending
    Sort Sent Eou Reports     Return Visit       desc
    ${reports}      Get Sent Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${descending_return_visits}   Sort Datetime Descending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${descending_return_visits}
    # sort ascending
    Refresh Page
    Filter Reports      report_state=Sent        report_type=End of Use reports      facility=All facilities
    Sort Sent Eou Reports     Return Visit      asc
    ${reports}      Get Sent Eou Reports
    ${return_visits}       Evaluate    [item['Return Visit'] for item in ${reports}]
    ${ascending_return_visits}   Sort Datetime Ascending    date_time=${return_visits}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${return_visits}        ${ascending_return_visits}

BFCC-SUPVR-REPORTS-VIEW-SENT-60: Manually sort the report list by Report Date on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-60      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-61: Check pagination tool works properly on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-61     auto
    Navigate To Reports
    Filter Reports      report_state=Sent        report_type=End of Use reports
    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 rows
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      10
#    Pagination Reports    next_or_previous=next
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
#    Pagination Reports    next_or_previous=previous
#    ${current_pagination}     Get Current Pagination
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Custom Reports Size Rows    rows=30 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      30
#    Custom Reports Size Rows    rows=50 rows
#    ${current_pagination}     Get Current Pagination
#    ${reports}        Get Pending Eou Reports
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 rows
#    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${reports}                      50

BFCC-SUPVR-REPORTS-VIEW-SENT-62: View a list of End of Use reports with “Report type: Artifact reports” is selected on End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-62      auto
    [Setup]    Create Ready End Of Use Reports
    Mark Artifact Ready Interim Report    is_mark=${True}
    Filter Interim Report    is_click=${True}       is_send=${True}
    Navigate To Reports
    # check for tc BFCC-QA-REPORTS-VIEW-SENT-63
    Filter Reports      report_state=Sent        report_type=End of Use reports     by_report=All reports
    ${eou_reports}     Get Sent Eou Reports
    ${eou_study_id}      Evaluate    [item['Study ID'] for item in ${eou_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}        ${study_id}
    Filter Reports      report_state=Sent        report_type=End of Use reports      by_report=Artifact reports
    ${eou_reports}     Get Sent Eou Reports
    ${eou_study_id}      Evaluate    [item['Study ID'] for item in ${eou_reports}]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${eou_reports}
    Run Keyword And Continue On Failure    List Should Contain Value    ${eou_study_id}        ${study_id}

BFCC-SUPVR-REPORTS-VIEW-SENT-63: View a list of End of Use reports with “Report type: All reports” is selected on End of Use reports reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-63      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-SUPVR-REPORTS-VIEW-SENT-64: Access to the AI Report editing screen on End of Use reports sub-tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     -
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1.

    [Tags]      BFCC-SUPVR-REPORTS-VIEW-SENT-64      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}         Start Browser
    Import Library          project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Reports.py      ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/StudyManagement.py   ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/EventDetails.py       ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Studies.py            ${BROWSER_NODE}     ${ENV}
    Import Library          project_bioflux_callcenter_portal/lib/web/Task.py            ${BROWSER_NODE}     ${ENV}
    ${USERS}                Get Config Param    NEW_USERS
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${CURRENT_USER}         Set Variable        ${USERS}[callcenter_supervisor]
    ${STUDY_ID_COMPLETED}   Set Variable        ${STUDY_ID}[study_id_completed]
    ${STUDY_ID_ASSIGN}      Set Variable        ${STUDY_ID}[study_id_completed]
    ${RELEASE_VERSION}      Navigate To Callcenter Sign In Page
    ${TOKEN}                Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Global Variable     ${STUDY_ID_COMPLETED}
    Set Global Variable     ${STUDY_ID_ASSIGN}
    Set Suite Variable      ${TOKEN}
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

#Create event report assign to you
#    Navigate To Studies
#    Navigate To Studies Type        Completed
#    Filter Studies          search_by=Study ID      text_search=${STUDY_ID_ASSIGN}
#    Manage Complete Study On    row=1
#    Navigate To Study Management Type    events
#    ${study_event}    Get Study Events
#    ${event_search}     Set Variable    ${study_event}[0][Event ID]
#    Edit Study Event On        row=1
#    Switch Tab
#    Navigate To Event Tab      Event Details
#    ${event_header}     Get Event Summary
#    ${study_id}         Set Variable    ${event_header}[STUDY ID]
#    Edit Event Details    event_validity=Valid      is_close=${True}
#    Navigate To Event Tab      Event Report
#    Assign Event Reports To You
#    Set Global Variable     ${event_search}
#    Set Global Variable     ${study_id}
#
#Create event report unassign
#    Navigate To Studies
#    Navigate To Studies Type        Completed
#    Manage Complete Study On    row=1
#    Navigate To Study Management Type    events
#    ${study_event}    Get Study Events
#    ${event_search}     Set Variable    ${study_event}[0][Event ID]
#    Edit Study Event On        row=1
#    Switch Tab
#    Navigate To Event Tab      Event Details
#    ${event_header}     Get Event Summary
#    ${study_id}         Set Variable    ${event_header}[STUDY ID]
#    Edit Event Details    event_validity=Valid      is_close=${True}
#    Navigate To Event Tab      Event Report
#    Create Event Reports With Status Is Ready
#    Set Global Variable     ${event_search}
#    Set Global Variable     ${study_id}
#
#Create event report has the status is Ready
#    Navigate To Tab Menu      Studies
#    Navigate To Studies Type        Completed
#    Manage Complete Study On    row=2
#    Navigate To Study Management Type    events
#    ${study_event}    Get Study Events
#    ${event_search}     Set Variable    ${study_event}[0][Event ID]
#    Edit Study Event On        row=1
#    Switch Tab
#    Navigate To Event Tab      Event Details
#    ${event_header}     Get Event Summary
#    ${study_id}         Set Variable    ${event_header}[STUDY ID]
#    Edit Event Details    event_validity=Valid      is_close=${True}
#    Navigate To Event Tab      Event Report
#    Create Event Reports With Status Is Ready
#    Set Global Variable     ${event_search}
#    Set Global Variable     ${study_id}

Create ready notification reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Ready
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Navigate to report screen has the notification reports with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Filter Study Reports    by_report=Notification reports

Create ready call required
    Navigate To Tab Menu      Studies
    Refresh Page
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid     call_option=Call Required     is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Sent
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Create ready interim report
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    Create Interim Report
    Refresh Page
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    ${report_id}         Evaluate        "${interim_report['REPORT ID'].split('\n')[0]}"
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}

Navigate to report screen with study id is "${study_id_completed}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id_completed}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports

Create ready end of use reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On     row=1
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
    Set Global Variable     ${study_id}

Create sent end of use reports with study id is "${study_id}"
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Filter Studies          search_by=Study ID      text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Sent
    Set Global Variable     ${study_id}

Create sent end of use reports
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Custom Reports Size Rows    rows=50 rows
    ${completed_studies}        Get Completed Studies On Page
    ${studies_id}         Evaluate      [item['Study ID'] for item in ${completed_studies} if '(0 open)' in [' '.join(item['Total Events'].split(' ')[1:])] and (item.get('Study Type') == 'MCT' or item.get('Study Type') == 'CARDIAC EVENT') and item.get('Report Status') != 'Sent']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    Edit End Of Use Report
    Create End Of Use Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Sent
    Set Global Variable     ${study_id}

Create ready end of use reports
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Custom Reports Size Rows    rows=50 rows
    ${completed_studies}        Get Completed Studies On Page
    ${studies_id}         Evaluate      [item['Study ID'] for item in ${completed_studies} if '(0 open)' in [' '.join(item['Total Events'].split(' ')[1:])] and (item.get('Study Type') == 'MCT' or item.get('Study Type') == 'CARDIAC EVENT') and item.get('Report Status') != 'Sent']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On        row=1
    Navigate To Study Management Type    reports
    ${study_report}     Get Study Reports
    Run Keyword And Continue On Failure    Should Not Be Empty    ${study_report}
    Edit End Of Use Report
    Create End Of Use Report
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Ready
    Set Global Variable     ${study_id}

Create event report has the status is Sent
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    ${event_id}         Evaluate        "${event_header['EVENT ID'].split('\n')[0]}"
    Edit Event Details    event_validity=Valid      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Sent
    Refresh Page
    Navigate To Event Tab      Event Details
    Edit Event Details    call_option=Call completed      is_close=${True}
    Set Global Variable     ${event_id}
    Set Global Variable     ${study_id}

Create sent interim report
    Navigate To Tab Menu      Studies
    Navigate To Studies Type        Completed
    Manage Complete Study On    row=1
    Navigate To Study Management Type    reports
    Create Interim Report
    Refresh Page
    ${interim_report}       Get Event Summary
    ${study_id}         Set Variable    ${interim_report}[STUDY ID]
    ${report_id}         Evaluate        "${interim_report['REPORT ID'].split('\n')[0]}"
    Navigate To Event Tab    PDF Report
    Create Interim Reports With Status Is Sent
    Set Global Variable     ${report_id}
    Set Global Variable     ${study_id}

Create ready notification reports
    Navigate To Studies
    Navigate To Studies Type        Completed
    ${completed}        Get Completed Studies On Page
    ${studies_id}       Evaluate    [item['Study ID'] for item in ${completed} if item['Total Events'].split()[0] != '0']
    ${study_id}    Evaluate  random.choice(${studies_id})    random
    Filter Studies    search_by=Study ID         text_search=${study_id}
    Manage Complete Study On    row=1
    Navigate To Study Management Type    events
    ${study_event}    Get Study Events
    ${event_search}     Set Variable    ${study_event}[0][Event ID]
    Edit Study Event On        row=1
    Switch Tab
    Navigate To Event Tab      Event Details
    ${event_header}     Get Event Summary
    ${study_id}         Set Variable    ${event_header}[STUDY ID]
    Edit Event Details    event_validity=Valid      is_close=${True}
    Navigate To Event Tab      Event Report
    Create Event Reports With Status Is Ready
    Set Global Variable     ${event_search}
    Set Global Variable     ${study_id}

Unassign Multiple "${task_name_report}" Reports
    Navigate To Task
    Filter Task         task_type=Assigned        by_report=${task_name_report}
    ${assigned_report}     Get Assigned Task
    Run Keyword If    len(${assigned_report}) != 0   Unassign Assigned Task On    row=all
