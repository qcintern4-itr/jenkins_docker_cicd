*** Settings ***
Documentation   Test Suite - Integration cases
Metadata    sid     BF-INTEGRATION
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Clinic.py       ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py         ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/StudyDetails.py

#Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BF-INTEGRATION     web
Test Timeout        1h

*** Test Cases ***
BF-INTEGRATION-CREATE-01: Clinic Technician - Create a new study for Bioflux device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Clinic Technician - Create a new study for Bioflux device
    ...
    ...     Precondition:
    ...     - The Clinic Technician has logged into the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Clinic Technician: Create a new study for Bioflux device
    ...     2. View Active studies page of:
    ...         - Clinic Physician
    ...         - Call Center Supervisor
    ...         - Call Center QA Leader
    ...         - Call Center QA
    ...         - Call Center Technician
    ...
    ...     Expected Results:
    ...     1. Study info is displayed properly on all related portals
    ...
    [Tags]      BF-INTEGRATION-CREATE-01       auto
    [Setup]    SUITE SETUP      clinic_technician
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    ${study_id}     Set Variable    ${studies}[0][Study]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    Open browser callcenter     callcenter_qa
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_qa}      Set Variable    ${studies}[Study ID]
    ${device_id_qa}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    Open browser callcenter     callcenter_qaleader
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_qal}      Set Variable    ${studies}[Study ID]
    ${device_id_qal}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    Open browser callcenter     callcenter_supervisor
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_sup}      Set Variable    ${studies}[Study ID]
    ${device_id_sup}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    Open browser callcenter     callcenter_technician
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_tech}      Set Variable    ${studies}[Study ID]
    ${device_id_tech}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}
    ...             AND              Quit Browser

BF-INTEGRATION-CREATE-02: Clinic Technician - Create a new study for Biotres device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Clinic Technician - Create a new study for Biotres device
    ...
    ...     Precondition:
    ...     - The Clinic Technician has logged into the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Clinic Technician: Create a new study for Biotres device
    ...     2. View Active studies page of:
    ...         - Clinic Physician
    ...         - Call Center Supervisor
    ...         - Call Center QA Leader
    ...         - Call Center QA
    ...         - Call Center Technician
    ...
    ...     Expected Results:
    ...     1. Study info is displayed properly on all related portals
    ...
    [Tags]      BF-INTEGRATION-CREATE-02       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-INTEGRATION-CREATE-03: Clinic Technician - Create a new study for Bioflux device using Biodirect
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Clinic Technician - Create a new study for Bioflux device
    ...
    ...     Precondition:
    ...     - The Clinic Technician has logged into the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Clinic Technician: Create a new study for Bioflux device using Biodirect
    ...     2. View Study info in:
    ...         - Biodirect portal >> Order page
    ...         - Clinic Physician portal >> Active studies page
    ...
    ...     Expected Results:
    ...     1. Study info is displayed properly on all related portals
    ...
    [Tags]      BF-INTEGRATION-CREATE-03      auto
    Sleep    1000s
    [Setup]    SUITE SETUP     clinic_technician
    Navigate To Studies Page
    ${studies}      Get Active Studies
    ${study_id}     Set Variable    ${studies}[0][Study]
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${study_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    Open browser direct     direct_user
    Navigate To Order Page      sidebar_name=Orders
    Filter Studies On Direct    search_by=Study ID      text_search=${study_id}
    ${orders}       Get Order Direct
    ${study_id_order}       Set Variable    ${orders}[0][Study ID]
    Run Keyword And Continue On Failure     Should Be Equal    ${study_id}      ${study_id_order}
    SUITE SETUP      clinic_physician
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${study_id}
    ${studies}      Get Active Studies
    ${study_id_tech}    Set Variable    ${studies}[0][Study]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED
    Run Keyword And Continue On Failure     Should Be Equal    ${study_id}      ${study_id_tech}
    Run Keyword And Continue On Failure     Should Be Equal    ${study_id_order}      ${study_id_tech}
    [Teardown]      Run Keywords    Quit Browser

BF-INTEGRATION-CREATE-04: Clinic Physician - Create a new study for Bioflux device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Clinic Physician - Create a new study for Bioflux device
    ...
    ...     Precondition:
    ...     - The Clinic Physician has logged into the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Clinic Physician: Create a new study for Bioflux device
    ...     2. View Active studies page of:
    ...         - Clinic Technician
    ...         - Call Center Supervisor
    ...         - Call Center QA Leader
    ...         - Call Center QA
    ...         - Call Center Technician
    ...
    ...     Expected Results:
    ...     1. Study info is displayed properly on all related portals
    ...
    [Tags]      BF-INTEGRATION-CREATE-04       auto
    [Setup]    SUITE SETUP      clinic_physician
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter All Studies    option=All studies
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${friendly_id}
    ${studies}      Get Active Studies
    ${study_id}     Set Variable    ${studies}[0][Study]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED HOLTER
    Open browser callcenter     callcenter_qa
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_qa}      Set Variable    ${studies}[Study ID]
    ${device_id_qa}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    Open browser callcenter     callcenter_qaleader
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_qal}      Set Variable    ${studies}[Study ID]
    ${device_id_qal}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    Open browser callcenter     callcenter_supervisor
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_sup}      Set Variable    ${studies}[Study ID]
    ${device_id_sup}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    Open browser callcenter     callcenter_technician
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Active       facility=All facilities     search_by=Study ID      text_search=${study_id}
    ${studies}       Get Active Studies Callcenter    row=1
    ${study_id_tech}      Set Variable    ${studies}[Study ID]
    ${device_id_tech}      Set Variable    ${studies}[Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    [Teardown]      Run Keywords     Api Stop Study           ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies       ${AWS_TOKEN}     studyIds=${study_id}
    ...             AND              Quit Browser

BF-INTEGRATION-CREATE-05: Clinic Physician - Create a new study for Biotres device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Clinic Physician - Create a new study for Biotres device
    ...
    ...     Precondition:
    ...     - The Clinic Physician has logged into the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Clinic Physician: Create a new study for Biotres device
    ...     2. View Active studies page of:
    ...         - Clinic Technician
    ...         - Call Center Supervisor
    ...         - Call Center QA Leader
    ...         - Call Center QA
    ...         - Call Center Technician
    ...
    ...     Expected Results:
    ...     1. Study info is displayed properly on all related portals
    ...
    [Tags]      BF-INTEGRATION-CREATE-05       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-INTEGRATION-CREATE-06: Clinic Physician - Create a new study for Bioflux device using Biodirect
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Clinic Physician - Create a new study for Bioflux device
    ...
    ...     Precondition:
    ...     - The Clinic Physician has logged into the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Clinic Physician: Create a new study for Bioflux device using Biodirect
    ...     2. View Study info in:
    ...         - Biodirect portal >> Order page
    ...         - Clinic Technician portal >> Active studies page
    ...
    ...     Expected Results:
    ...     1. Study info is displayed properly on all related portals
    ...
    [Tags]      BF-INTEGRATION-CREATE-06       auto
    [Setup]    SUITE SETUP      clinic_physician
    Navigate To Studies Page
    ${studies}      Get Active Studies
    ${study_id}     Set Variable    ${studies}[0][Study]
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${study_id}
    ${studies}      Get Active Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    Open browser direct     direct_user
    Navigate To Order Page      sidebar_name=Orders
    Filter Studies On Direct    search_by=Study ID      text_search=${study_id}
    ${orders}       Get Order Direct
    ${study_id_order}       Set Variable    ${orders}[0][Study ID]
    Run Keyword And Continue On Failure     Should Be Equal    ${study_id}      ${study_id_order}
    SUITE SETUP      clinic_technician
    Navigate To Studies Page
    Filter Studies  study_state=Active    search_by=Study ID      text_search=${study_id}
    ${studies}      Get Active Studies
    ${study_id_tech}    Set Variable    ${studies}[0][Study]
    Run Keyword And Continue On Failure    Should Not Be Equal    ${studies}[0][Study type]     EXTENDED
    Run Keyword And Continue On Failure     Should Be Equal    ${study_id}      ${study_id_tech}
    Run Keyword And Continue On Failure     Should Be Equal    ${study_id_order}      ${study_id_tech}
    [Teardown]      Run Keywords    Quit Browser

BF-INTEGRATION-CREATE-07: Verify the study completed when change the interpreting physician
    [Documentation]
    ...     Description:
    ...     - The user Technician can view all study of Completed studies
    ...     - The user Physician can't view the study when change the interpreting physician
    ...
    ...     Precondition:
    ...     - The user is on the Completed tab of the STUDIES page
    ...     - Existing a study on the "Completed" screen on user physician and technician
    ...
    ...     Test Steps:
    ...     1. Login app with the user technician
    ...     2. Navigate to the 'Completed' screen on tab STUDIES
    ...     3. Click on the "Edit" button -> change value "Interpreting physician"
    ...     4. Login app with the user physician
    ...     5. Navigate to the 'Completed' screen on tab STUDIES
    ...     6. Obsever the result
    ...
    ...     Epected Results:
    ...     1. The Completed tab includes completed studies that have already been uploaded to the server
    ...     2. For the physician's login, the user shall only be able to view studies of which he/she is the interpreting
    ...     physician. If his/her study has the interpreting physician changed to another one (by clinic technician).
    ...     That study shall be hidden from their list of studies
    ...
    ...     **Others**
    ...     Author: Thang Tran
    ...     Create Date: 10/25/2023
    ...
    [Tags]  BF-INTEGRATION-CREATE-07       auto
    [Setup]    SUITE SETUP      clinic_physician
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter All Studies    option=All studies
    Filter Studies    study_state=Active    search_by=Study ID      text_search=${friendly_id}
    Stop Active Studies    row=1
    Filter Studies    study_state=Completed
    Clear Studies Text Search
    #The Completed tab includes completed studies
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    #The tab includes the following information
    Filter Studies    search_by=Study ID        text_search=${friendly_id}
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    Change Interpreting Physician   ${friendly_id}
    SUITE SETUP      clinic_physician
    Navigate To Studies Page
    Filter Studies    study_state=Completed      text_search=${friendly_id}     search_by=Study ID
    Select Facility    All facilities
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${studies}        No All devices found
    [Teardown]      Run Keywords    Quit Browser

BF-INTEGRATION-CREATE-08: Verify the study completed when change the include aborted study
    [Documentation]
    ...
    ...     Description:
    ...     - The user Physician can view the study when change the include aborted study
    ...
    ...     Precondition:
    ...     - The user is on the Completed tab of the STUDIES page
    ...     - Existing a study on the "Completed" screen on user physician and callcenter
    ...
    ...     Test Steps:
    ...     1. Login the callcenter app with user super
    ...     2. Navigate to the 'Completed' screen on tab STUDIES
    ...     3. Click on the 'Manage study' button -> click and select value 'Abort study'
    ...     4. Login app with the user physician
    ...     5. Navigate to the 'Completed' screen on tab STUDIES
    ...     6. Input text search -> click on the 'Include aborted study' radio button
    ...     7. Obsever the result
    ...     8. Click on more icon -> obsever the result
    ...
    ...     Epected Results:
    ...     2,5. The Completed tab includes completed studies that have already been uploaded to the server
    ...     7. This tab shall also include aborted studies (studies canceled by Call center users super) but they won’t be
    ...     displayed until the user searches for a study and selects the “Include aborted study” checkbox
    ...     8. The 'Delete study' button will not be displayed for aborted studies
    ...
    ...     **Others**
    ...     Author: Thang Tran
    ...     Create Date: 10/25/2023
    ...
    [Tags]  BF-INTEGRATION-CREATE-08       auto
    [Setup]    SUITE SETUP      clinic_physician
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Studies Page
    Filter All Studies    option=All studies
    Filter Studies    study_state=Active    search_by=Study ID        text_search=${friendly_id}
    Stop Active Studies    row=1
    Filter Studies    study_state=Completed
    Clear Studies Text Search
    Select Facility    All facilities
    #The Completed tab includes completed studies
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    #The tab includes the following information
    Filter Studies    search_by=Study ID        text_search=${friendly_id}
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    ${study_id}       Set Variable    ${studies}[0][Study ID]
    Change Aborted Study   ${study_id}
    SUITE SETUP      clinic_physician
    Navigate To Studies Page
    Select Facility    All facilities
    Filter All Studies    option=All studies
    Filter Studies    study_state=Completed      text_search=${friendly_id}     search_by=Study ID
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Be Empty    ${studies}
    Select Aborted Study
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}
    ${more_item}     Get More Completed Study On    row=1
    # True is displayed, False is not displayed
    Run Keyword And Continue On Failure    Should Be Equal    ${more_item}[Delete study]        ${False}
    Run Keyword And Continue On Failure    Should Be Equal    ${more_item}[Copy study]          ${True}
    [Teardown]      Run Keywords    Quit Browser

*** Keywords ***
SUITE SETUP
    [Arguments]    ${user_clinic}
    ${BROWSER_NODE}     Start Browser
    Import Library      project_bioflux_clinic_portal/lib/web/Common.py         ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Studies.py        ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}  ${ENV}
    Import Library      project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}         Get Config Param       NEW_USER > ${user_clinic}
    ${FACILITIES}       Get Config Param       FACILITY
    ${DEVICES}          Get Config Param       DEVICE
    ${AWS_AUTH}         Get Config Param       AWS_AUTH
    Set Suite Variable  ${PHY_USER}
    Set Suite Variable  ${DEVICES}
    Set Suite Variable  ${FACILITIES}
    ${TOKEN}            Sign In Bioflux       username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${AWS_RPS}          Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
    Set Suite Variable  ${AWS_TOKEN}          ${AWS_RPS}[AuthenticationResult][AccessToken]
    ${VERSION}          Get Release Version
    Set Suite Variable  ${TOKEN}
    Set Suite Metadata  version     ${VERSION}
    Set Suite Metadata  browser     ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

Api Study - Create
    Api Create Study On    token=${AWS_TOKEN}    facility=${FACILITIES}[0][id]   device_id=${DEVICES}[bioflux_device][0][id]   study_type=CARDIAC EVENT   device_type=Bioflux
    ${filter}          Create Dictionary     status=Ongoing        deviceId=${DEVICES}[bioflux_device][0][id]
    ${filter}          Create Dictionary     filter=${filter}
    ${studies}         Api Clinic Studies    ${AWS_TOKEN}      ${filter}
    ${study_id}        Set Variable     ${studies}[body][data][clinicStudies][0][id]
    ${friendly_id}     Set Variable     ${studies}[body][data][clinicStudies][0][friendlyId]
    Set Global Variable    ${study_id}
    Set Global Variable    ${friendly_id}
    RETURN    ${study_id}     ${friendly_id}

Open browser callcenter
    [Arguments]    ${user_callcenter}
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_clinic_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_clinic_portal/lib/web/Studies.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}  ${ENV}
    Import Library       project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    ${USERS}             Get Config Param    NEW_USERS_CALLCENTER
    ${CURRENT_USER}      Set Variable        ${USERS}[${user_callcenter}]
    ${URL_CALLCENTER}    Get Config Param    WEB_BASE_URL_CALLCENTER
    Set Suite Variable  ${URL_CALLCENTER}
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page        url_callcenter=${URL_CALLCENTER}
    ${TOKEN}             Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

Open browser direct
    [Arguments]    ${direct_user}
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_clinic_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_clinic_portal/lib/web/Studies.py      ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_clinic_portal/lib/web/StudyDetails.py   ${BROWSER_NODE}  ${ENV}
    Import Library       project_bioflux_clinic_portal/lib/web/Inbox.py          ${BROWSER_NODE}  ${ENV}
    ${USERS}             Get Config Param    NEW_USERS_DIRECT
    ${CURRENT_USER}      Set Variable        ${USERS}[${direct_user}]
    ${URL_DIRECT}        Get Config Param    WEB_BASE_URL_DIRECT
    Set Suite Variable  ${URL_DIRECT}
    ${RELEASE_VERSION}   Navigate To Direct Sign In Page      url_direct=${URL_DIRECT}
    ${TOKEN}             Sign In Direct      ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

Change Interpreting Physician
    [Arguments]    ${friendly_id}
    SUITE SETUP     clinic_technician
    Navigate To Studies Page
    Filter Studies    study_state=Completed
    Select Facility    All facilities
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    #The tab includes the following information
    Filter Studies    search_by=Study ID        text_search=${friendly_id}
    ${studies}        Get Completed Studies
    Run Keyword And Continue On Failure    Should Not Be Empty    ${studies}        No All devices found
    Manage Completed Study On      row=1
#    ${interpreting_physician}   Create Dictionary    interpreting_physician=QC Automation
    ${interpreting_physician}   Create Dictionary    interpreting_physician=nhan cp1
    Edit Study Details    interpreting_physician=${interpreting_physician}

Change Aborted Study
    [Arguments]    ${friendly_id}
    Open browser callcenter     callcenter_supervisor
    Navigate To Studies Page Callcenter
    Filter Studies On Callcenter    study_type=Completed       facility=All facilities     search_by=Study ID      text_search=${friendly_id}
    ${studies}       Get Completed Studies Callcenter
    Run Keyword And Continue On Failure    Should Not Be Empty        ${studies}
    Manage Completed Studies Callcenter On      row=1
    Change Abort Study Callcenter
    ${msg}      Get Message Abort Study Callcenter
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        This study has been aborted and will not be counted toward your billing.
