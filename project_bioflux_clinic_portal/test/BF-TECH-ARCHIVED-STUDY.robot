*** Settings ***
Documentation   Test Suite - Clinic Technician Portal - Archived studies
Metadata    sid     BF-TECH-ARCHIVED-STUDY
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_admin_portal/lib/ConfigHandler.py             ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/StudyDetails.py
#
Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags      BF-TECH-ARCHIVED-STUDY    web
Test Timeout    1h

*** Test Cases ***
BF-TECH-ARCHIVED-STUDY-01: Study management page >> Events tab-Cannot view event list
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: Events tab-Cannot view event list
    ...
    ...     Precondition:
    ...     - Existing the study has been archived
    ...
    ...     Test Steps:
    ...     1. Navigate to study Completed
    ...     2. Search by study id with text search is 15030
    ...     3. Open to study management
    ...     4. Click to "Events" link
    ...
    ...     Epected Results:
    ...     4. Display message "The events in this study have been archived. If you need support to view the events of this study, please contact the Biotricity customer support team."
    ...
    ...     **Others**:
    ...     Author Update: Thang Tran
    ...     Last Update: 11/03/2023
    ...
    [Tags]  BF-TECH-ARCHIVED-STUDY-01        auto        CP-2.16.7
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${studies}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_ARCHIVED}
    Manage Completed Study On    study_id=${STUDY_ID_ARCHIVED}
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab       Events
    ${events}           Get Events Viewer
    Run Keyword And Continue On Failure    Should Be Equal    ${events}       The events in this study have been archived. If you need support to view the events of this study, please contact the Biotricity customer support team.

BF-TECH-ARCHIVED-STUDY-02: Study management page >> ECG Viewer tab-Cannot view HR chart and events
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: Events tab-Cannot view event list
    ...
    ...     Precondition:
    ...     - Existing the study has been archived
    ...
    ...     Test Steps:
    ...     1. Navigate to study Completed
    ...     2. Search by study id with text search is 15030
    ...     3. Open to study management
    ...     4. Click to "ECG viewer" link
    ...
    ...     Epected Results:
    ...     Display message “The events in this study have been archived. If you need support to view ECG viewer and the events of this study, please contact the Biotricity customer support team.”
    ...
    ...     **Others**:
    ...     Author Update: Thang Tran
    ...     Last Update: 11/03/2023
    ...
    [Tags]  BF-TECH-ARCHIVED-STUDY-02        auto        CP-2.16.7
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    ${studies}      Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_ARCHIVED}
    Manage Completed Study On    study_id=${STUDY_ID_ARCHIVED}
    # Verify page header
    ${page_header}      Get Page Header Detail
    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
    Navigate To Study Details Tab       ECG viewer
    ${events}           Get Events Viewer
    Run Keyword And Continue On Failure    Should Be Equal    ${events}         The events in this study have been archived. If you need support to view ECG viewer and the events of this study, please contact the Biotricity customer support team.

BF-TECH-ARCHIVED-STUDY-03: Study management page >> Instant Reports-View tab if the study has never had reports created previously
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: Events tab-Cannot view event list
    ...
    ...     Precondition:
    ...     - Existing the study has been archived
    ...
    ...     Test Steps:
    ...     1. Navigate to study Completed
    ...     2. Search by study id with text search is 15030
    ...     3. Open to study management
    ...     4. Click to "Instant reports" link
    ...
    ...     Epected Results:
    ...     1. Display message "The creation of instant report feature has been disabled as this study has been archived. If you need support to create an instant report for this study, please contact the Biotricity customer support team."
    ...     2. Create Report button shall be hidden
    ...
    ...     **Others**:
    ...     Author Update: Thang Tran
    ...     Last Update: 11/03/2023, 07/24/2024-Nhan Nguyen
    ...
    [Tags]  BF-TECH-ARCHIVED-STUDY-03        manual       CP-2.16.7       inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Studies Page
#    Filter Studies    study_state=Completed
#    ${studies}      Get Completed Studies
#    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
#    Filter Studies    study_state=Completed     search_by=Study ID      text_search=${STUDY_ID_ARCHIVED}
#    Manage Completed Study On    study_id=${STUDY_ID_ARCHIVED}
#    # Verify page header
#    ${page_header}      Get Page Header Detail
#    Run Keyword And Continue On Failure    Should Be Equal    ${page_header}      STUDY
#    Navigate To Study Details Tab       Instant reports
#    ${events}           Get Message Instant Report Archived
#    Run Keyword And Continue On Failure    Should Be Equal    ${events}[Message]        The creation of instant report feature has been disabled as this study has been archived. If you need support to create an instant report for this study, please contact the Biotricity customer support team.
#    Run Keyword And Continue On Failure    Should Be Equal    ${events}[Create button]      ${False}

BF-TECH-ARCHIVED-STUDY-04: Study management page >> Instant Reports-View tab if the study has had reports created previously
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Epected Results:
    ...     1. Display message "The creation of instant report feature has been disabled as this study has been archived. If you need support to create an instant report for this study, please contact the Biotricity customer support team."
    ...     2. Create Report button shall be disabled
    ...
    ...     **Others
    ...     Last updated: 07/24/2024-Nhan Nguyen
    ...

    [Tags]  BF-TECH-ARCHIVED-STUDY-04       manual        CP-2.16.7     inactive
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}         Get Config Param       NEW_USER > clinic_physician
    ${FACILITIES}       Get Config Param       FACILITY
    ${DEVICES}          Get Config Param       DEVICE
    ${STUDY_ID}             Get Config Param    STUDY_ID
    ${STUDY_ID_ARCHIVED}   Set Variable        ${STUDY_ID}[study_id_completed][study_id_archived]
    Set Suite Variable  ${PHY_USER}
    Set Suite Variable  ${DEVICES}
    Set Suite Variable    ${FACILITIES}
    Set Suite Variable    ${STUDY_ID_ARCHIVED}
    ${TOKEN}            Sign In Bioflux       username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${VERSION}          Get Release Version
    Set Suite Metadata  version     ${VERSION}
    Set Suite Metadata  browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

