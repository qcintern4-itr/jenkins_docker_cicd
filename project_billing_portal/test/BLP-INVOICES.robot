*** Settings ***
Documentation   Test Suite - Billing Portal - Invoices page
Metadata    sid     BLP-INVOICES
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_billing_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BLP-INVOICES    web
Test Timeout    1h

*** Test Cases ***
BLP-INVOICES-VIEW-01: View Invoices list in the case the user has been assigned to one facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Invoices list in the case the user has been assigned to one facility
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Invoices button on the header of the portal
    ...     - 2. Observe the Invoices list
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Invoices page
    ...     - 2. This page displays the list of invoices generated monthly.
    ...     The table includes the attributes below:
    ...     - Period Start
    ...     - Period End
    ...     - Device Type – it can be Bioflux or Biotres.
    ...     - Pricing Type – it can be Study code or Per device.
    [Tags]      BLP-INVOICES-VIEW-01    BP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INVOICES-VIEW-02: View Invoices list in the case the user has been assigned to multiple facilities
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Invoices list in the case the user has been assigned to multiple facilities
    ...
    ...     Precondition:
    ...     - The user has signed into the Billing portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Invoices button on the header of the portal
    ...         - 1.1 Select [All facilities] option from Facility filter
    ...         - 1.2 Select a specific facility option from Facility filter
    ...     - 2. Observe the Invoices list
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Invoices page
    ...     - 2. This page displays the list of invoices generated monthly.
    ...     The table includes the attributes below:
    ...     - Period Start
    ...     - Period End
    ...     - Device Type – it can be Bioflux or Biotres.
    ...     - Pricing Type – it can be Study code or Per device.
    ...     - Facility (display for step 1.1)
    [Tags]      BLP-INVOICES-VIEW-02    BP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INVOICES-VIEW-03: Filter the Invoices list by Pricing type
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter the Invoices list by Pricing type
    ...
    ...     Precondition:
    ...     - The user is on Invoices page
    ...
    ...     Test Steps:
    ...     - 1. Observe the top of the table
    ...     - 2. The user selects “Study code”, observe the invoicing report list
    ...     - 3. The user selects “Per device”, observe the invoicing report list
    ...     - 4. The user selects “All pricing types”, observe the invoicing report list
    ...
    ...     Expected Results:
    ...     - 1. There shall be a Pricing type filter. The default selection is “All pricing types”
    ...     - 2. The invoicing reports that have “Study code” pricing type displayed only
    ...     - 3. The invoicing reports that have “Per device” pricing type displayed only
    ...     - 4. The invoicing reports of "Study code" and "Per device" pricing displayed
    [Tags]      BLP-INVOICES-VIEW-03    BP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INVOICES-VIEW-04: Navigate between the page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate to between the pages by using pagination tool
    ...
    ...     Precondition:
    ...     - The user is on Invoices page
    ...
    ...     Test Steps:
    ...     - 1. Click ">" button
    ...     - 2. Click "<" button
    ...     - 3. Click a specific page number
    ...     - 4. Select 30 rows option
    ...     - 5. Select 50 rows option
    ...     - 6. Select 10 rows option
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to the next page
    ...     - 2. Step 2 - Navigate the user to the previous page
    ...     - 3. Step 3 - Navigate the user to the selected page number
    ...     - 4. Step 4 - The list shall display items in maximum of 30 invoices
    ...     - 5. Step 5 - The list shall display items in maximum of 50 invoices
    ...     - 6. Step 6 - The list shall display items in maximum of 10 invoices
    ...
    [Tags]      BLP-INVOICES-VIEW-04    BP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BLP-INVOICES-DOWNLOAD-01: Download and check the generated invoicing report
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: After the last day of the month ends, there shall be an invoicing report generated including
    ...     all studies which have their EOU reports first sent in that month and they are not marked as artifact
    ...
    ...     Precondition:
    ...     - 1. The user sends the EOU reports for the first time in that month
    ...     - 2. The user sends the EOU reports for the first time then dismiss the report
    ...     - 3. The user sends the EOU report, and that study is aborted for the first time in that month
    ...     - 4. The user sends the EOU report, and that study is deleted for the first time in that month
    ...     - 5. The user sends the EOU reports and then recalled the report for the first time in that month
    ...     - 6. The user sends the EOU reports and then recalled the report for the first time in that month
    ...     - 7. The user sends the EOU reports marked as artifact for the first time in that month
    ...     - 8. The user resends the EOU reports for the second time (this report is sent in the previous month)
    ...
    ...     Test Steps:
    ...     - 1. Mouse over the invoicing report row
    ...     - 2. Click on Download button
    ...     - 3. Check studies including in the downloaded report
    ...
    ...     Expected Results:
    ...     - 1. The Download button shall be displayed
    ...     - 2. The invoicing report shall be downloaded as PDF format
    ...     - 3. Only Studies (1,2,3,4,5) that mentioned in precondition shall be included in report
    ...     Notes: Invoicing report does not contains studies that duration less than 8h (test studies)
    [Tags]      BLP-INVOICES-DOWNLOAD-01    BP-SRS-04-FRS-02    manual
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
