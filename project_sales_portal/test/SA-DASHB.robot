*** Settings ***
Documentation   Test Suite - Sales Portal - Authentication
Metadata    sid    SA-DASHB
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py   ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags     SA-DASHB     web
Test Timeout    1h

*** Test Cases ***

SA-DASHB-RANK-01: Edit the data and view the Facility accounts ranking table
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

    [Tags]  SA-DASHB-RANK-01      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-DASHB-RANK-02: Edit the data and view the Sales ranking table
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Edit the data and view the Sales ranking table
    ...
    ...     Precondition:
    ...     - As a sales representative/manager/admin, I want to view the ranking table.
    ...     - As a sales representative, I want to view the ranking table and know where I am standing in the list of all sales reps.
    ...
    ...     Test Steps:
    ...     1. View the Facilities accounts ranking table
    ...     2. Edit the data, check the ranking table
    ...
    ...     Expected Results:
    ...     1. The ranking tables includes all sales rep accounts. User could scroll the account ranking list.
    ...     The top 5 is above and the low 5 is at the bottom.
    ...     --- The sales reps could know where they stand on the list.
    ...     --- Only the Sales admin can view the facility information by clicking on the row.
    ...     2. The ranking table should be updated

    [Tags]  SA-DASHB-RANK-02       SA_FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-DASHB-RANK-03: Filter the option in the Sales ranking facility
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Filter the option in the Sales ranking facility
    ...
    ...     Precondition:
    ...     - As a sales representative/manager/admin, I want to view the ranking table.
    ...     - As a sales representative, I want to view the ranking table and know where I am standing in the list of all sales reps.
    ...
    ...     Test Steps:
    ...     1. Check list option in the drop-down list
    ...     2. Select each option > observe the ranking table
    ...
    ...     Expected Results:
    ...     1.
    ...     - New Devices Sold,
    ...     - Study Revenue Growth,
    ...     - Device Utilization,
    ...     - Revenue per Device,
    ...     - Revenue, by default
    ...     - Devices Not In Use
    ...     --- Only the Sales admin can view the facility information by clicking on the row.
    ...     2. The list should be changed

    [Tags]  SA-DASHB-RANK-03       SA_FRS-8-01    manual     R1
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