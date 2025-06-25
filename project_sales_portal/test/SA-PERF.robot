*** Settings ***
Documentation   Test Suite - Sales Portal - Authentication
Metadata    sid    SA-PERF
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py   ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags     SA-PERF     web
Test Timeout    1h

*** Test Cases ***

SA-PERF-RANK-01: Edit the data and view the Facility accounts ranking table
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Edit the data and view the Facility accounts ranking table
    ...
    ...     Precondition:
    ...     - As a sales representative/manager/admin, I want to view the ranking table.
    ...     - As a sales representative, I want to view the ranking tables and know where I am standing in the list of all sales reps.
    ...
    ...     Test Steps:
    ...     1. View the Sales accounts ranking table
    ...     2. Edit the data, check the ranking table
    ...
    ...     Expected Results:
    ...     1. The Sales ranking shall just display Top 5 and Low 5 in each category.
    ...     --- Only Sales admin can view the facility information by clicking on the row.
    ...     --- The system will display the list of facilities with the information accordingly.
    ...     2. The ranking table should be updated

    [Tags]  SA-PERF-RANK-01      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_services_and_distribution_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To SD Portal Page
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser