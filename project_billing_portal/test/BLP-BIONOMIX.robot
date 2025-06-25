*** Settings ***
Documentation   Test Suite - Billing Portal - Bionomix Report page
Metadata    sid     BLP-BIONOMIX
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}    ${HEADLESS}
Library     project_billing_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BLP-BIONOMIX    web
Test Timeout    1h

*** Test Cases ***
BLP-BIONOMIX-VIEW-01: View Bionomix report page in the case the user has been assigned to one facility
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View Bionomix report page in the case the user has been assigned to one facility
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on Bionomix button on the header of the portal
    ...     - 2. Observe the Bionomix page
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Bionomix page
    ...     - 2. The Bionomix page displays a list of Bionomix report generated monthly with the following attributes:
    ...         - Report name – follows the following format: BIONOMIX-reportingperiod – MMM is a 3-character month
    ...     abbreviation, DDDD is the current year
    ...         - By default, the list will be sorted by recent updates
    ...         - There shall be a sort filter by report date or recent updates
    [Tags]  BLP-BIONOMIX-VIEW-01      BP-SRS-06-FBS-01      BP-1.2.2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIONOMIX-VIEW-02: View Bionomix report page in the case the user has been assigned to multiple facilities
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View Bionomix report page in the case the user has been assigned to multiple facilities
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on Bionomix button on the header of the portal
    ...         - 1.1 Select [All facilities] option from Facility filter
    ...         - 1.2 Select a specific facility option from Facility filter
    ...     - 2. Observe the Bionomix page
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Bionomix page
    ...     - 2. The Bionomix page displays a list of Bionomix report generated monthly with the following attributes:
    ...     - Report name – follows the following format: BIONOMIX-reportingperiod – MMM is a 3-character month
    ...     abbreviation, DDDD is the current year
    ...     - Facility (display for step 1.1)
    ...     - By default, the list will be sorted by recent updates
    ...     - There shall be a sort filter by report date or recent updates
    [Tags]  BLP-BIONOMIX-VIEW-02     BP-SRS-06-FBS-01      BP-1.2.2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIONOMIX-VIEW-03: View a PDF report
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View a PDF report
    ...
    ...     Precondition:
    ...     - The user is on Bionomix report page
    ...
    ...     Test Steps:
    ...     - 1. Click the report row
    ...
    ...     Expected Results:
    ...     - 1. The report shall be loaded and displayed on the PDF viewer
    [Tags]  BLP-BIONOMIX-VIEW-03     BP-SRS-06-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIONOMIX-VIEW-04: View description of What is Bionomix
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: View a PDF report
    ...
    ...     Precondition:
    ...     - The user is on Bionomix report page
    ...
    ...     Test Steps:
    ...     - 1. Mouse over icon [i] next to the page title
    ...
    ...     Expected Results:
    ...     - 1. A tooltip “What is Bionomix report?” shall display. Clicking the icon shall display a side tab with the
    ...     description of What is Bionomix?
    [Tags]  BLP-BIONOMIX-VIEW-04     BP-SRS-06-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIONOMIX-VIEW-05: Navigate between the page if more than 50 reports in the list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate to between the pages by using pagination tool
    ...
    ...     Precondition:
    ...     - The user is on Bionomix report page
    ...     - There are more than 50 reports in the list
    ...
    ...     Test Steps:
    ...     - 1. Scroll down to view all reports in the list
    ...     - 2. Click "<" button
    ...     - 3. Click ">" button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The list of reports column displays maximum of 50 reports
    ...     - 2. Step 2 - Navigate the user to the previous page
    ...     - 3. Step 3 - Navigate the user to the next page
    ...
    [Tags]  BLP-BIONOMIX-VIEW-05     BP-SRS-06-FBS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-BIONOMIX-SORT-01: Sort the Bionomix report list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the Bionomix report list by report date or recent updates
    ...
    ...     Precondition:
    ...     - The user is on Bionomix report page
    ...
    ...     Test Steps:
    ...
    ...     - 1. Click Sort filter button
    ...     - 2. Click option "Sort by report date" on the sort option
    ...     - 3. Click option "Sort by recent updates" on the sort option
    ...
    ...     Expected Results:
    ...     - 1. There shall be 2 options to sort: Sort by report date and Sort by recent updates
    ...     - 2. The report list shall be sorted and displayed in descending order (newest to oldest according to report date)
    ...     - 3. The report list shall be sorted and displayed in descending order (newest to oldest according to recent updates)
    ...
    [Tags]  BLP-BIONOMIX-SORT-01     BP-SRS-06-FBS-01       BP-1.2.2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_billing_portal/lib/web/Common.py      ${BROWSER_NODE}      ${ENV}
    ${VERSION}           Navigate To Sign In Page
    Set Suite Metadata    browser       ${BROWSER.capitalize()}
    Set Suite Metadata    version       ${VERSION}

SUITE TEARDOWN
    Quit Browser
