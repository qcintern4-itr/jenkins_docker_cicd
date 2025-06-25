*** Settings ***
Documentation   Test Suite - Call Center Authentication
Metadata    sid     BFCC-AUTH
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_callcenter_portal/lib/web/Common.py
Library     project_bioflux_callcenter_portal/lib/web/Reports.py
Library     project_bioflux_callcenter_portal/lib/web/Task.py

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          BFCC-AUTH   web
Test Timeout        1h

*** Test Cases ***
BFCC-AUTH-SIGNIN-01: Sign in to Call Center Technician portal with valid username and password
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to the Call Center Technician portal with a valid username and password
    ...
    ...     Precondition:
    ...     - The user is on the Signin page of Bioflux portal
    ...
    ...     Test Steps:
    ...     1. Enter valid username of Call Center Technician role into [Username] textbox
    ...     2. Enter valid password of Call Center Technician role into [Password] textbox
    ...     3. Click [Sign in] button
    ...
    ...     Expected Results:
    ...     1. Sign in successfully
    ...     2. The user is landed on Reports page and Pending-Interim reports tab is selected
    ...
    [Tags]      BFCC-AUTH-SIGNIN-01     auto
    Sign In Callcenter      username=${CCT_USER}[username]      password=${CCT_USER}[password]
    ${header}       Get Current Page Header
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     REPORTS
    ${list}     Get Reports Current Filter Values
    Run Keyword And Continue On Failure  Should Be Equal  ${list}[Report State]     Pending
    Run Keyword And Continue On Failure  Should Contain   ${list}[Report Type]      Interim reports
    [Teardown]    Sign Out Callcenter


*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Reports.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Task.py       ${BROWSER_NODE}     ${ENV}
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}
    ${CCT_USER}    Get Config Param       USERS > callcenter_technician
    ${CCQA_USER}     Get Config Param       USERS > callcenter_qa
    ${CCQAL_USER}   Get Config Param       USERS > callcenter_qalead
    ${CCS_USER}   Get Config Param       USERS > callcenter_supervisor
    Set Suite Variable    ${CCT_USER}
    Set Suite Variable    ${CCQA_USER}
    Set Suite Variable    ${CCQAL_USER}
    Set Suite Variable    ${CCS_USER}

SUITE TEARDOWN
    Quit Browser