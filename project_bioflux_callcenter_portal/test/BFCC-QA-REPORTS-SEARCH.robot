*** Settings ***
Documentation   Test Suite - Call Center QA Portal - Search Reports
Metadata    sid     BFCC-QA-REPORTS-SEARCH
Metadata    owner   Trinh Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BFCC-QA-REPORTS-SEARCH   web
Test Timeout    1h

*** Test Cases ***
BFCC-QA-REPORTS-SEARCH-01: Test
    [Documentation]     Author:
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

    [Tags]      BFCC-QA-REPORTS-SEARCH-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
