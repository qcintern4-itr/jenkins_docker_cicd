*** Settings ***
Documentation   Test Suite - Support Portal - Clinic Support page
Metadata    sid     BSP-SUPPORT-CLINIC
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_support_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-SUPPORT-CLINIC      web
Test Timeout    1h

*** Test Cases ***
BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-01: View list of open clinic Support tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of open tickets
    ...
    ...     Precondition:
    ...  - The Support Staff is on Support Portal, Clinic Support page
    ...  - The “Open” tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the attributes in the table
    ...
    ...     Expected Results:
    ...     1. The “Open” tab contains the tickets that are newly created from the ERP Portal,
    ...     and tickets that have been Reopened while it was previously resolved.
    ...     2.In the open tab, there should be a list with the following attributes:
    ...     - Ticket ID
    ...     - Date
    ...     - Category
    ...     - Facility
    ...     - Requester
    ...     - Requester Role

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-01      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-02: Observe the order of the list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the order of the list
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the order of the list
    ...     2. Click on the sort button in the Ticket ID title
    ...
    ...     Expected Results:
    ...     1. The list of tickets should be sorted in chronological order
    ...     2. The list should be sorted

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-02      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-03: Check the pagination
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the pagination, click on > button
    ...     2. The user clicks on < button
    ...     3. The user clicks on page number
    ...
    ...     Expected Results:
    ...     1. The user shall be navigated to the next page
    ...     2. The user shall be navigated to the previous page of the list
    ...     3. The user shall be navigated to that page

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-03      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-04: Check the pagination
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click on the pagination drop-down, observe the list
    ...     2. The user selects “10 rows” from the drop-down box
    ...     3. TThe user selects “30 rows” from the drop-down box
    ...     4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...     2. The list with 10 tickets shall be displayed
    ...     3. The list with 30 tickets shall be displayed
    ...     4. The list with 50 tickets shall be displayed
    ...     5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-04      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-05: Check new open ticket displayed when Support user create with Web portal issues
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-05     R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-06: Check new open ticket displayed when Support user create with Billing questions (4 Billing issues)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-06      R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-07: Check new open ticket displayed when Support user create with Insurance portal questions
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-07      R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-08: Check new open ticket displayed when Support user create with Others
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-08      R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-09: Check new open ticket displayed when Clinic user (portal, app) create with Web portal issues
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-09     R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-10: Check new open ticket displayed when Clinic user (portal, app) create with Billing questions (4 Billing issues)
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-10      R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-11: Check new open ticket displayed when Clinic user (portal, app) create with Others
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-11      R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-12: Check new open ticket displayed when Billing user create with Insurance portal questions
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-12      R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-13: Check new open ticket displayed when Clinic user(Cardiac) create with Web portal issues
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-13     R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-14: Check new open ticket displayed when Clinic user (Cardiac) create with Others
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-OPEN-14      R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-01: View list of resolved clinic Support tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of resolved tickets
    ...
    ...     Precondition:
    ...  - The Support Staff is on Support Portal, Clinic Support page
    ...  - The “Resolved" tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the attributes in the table
    ...
    ...     Expected Results:
    ...     In the open tab, there should be a list with the following attributes:
    ...     - Ticket ID
    ...     - Request Date
    ...     - Resolved Date
    ...     - Category
    ...     - Facility
    ...     - Requester
    ...     - Requester Role
    ...     **Others**
    ...     Update date: 8/16/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-01      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-02: Observe the order of the list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the order of the list
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the order of the list
    ...     2. Click on the sort button in the Ticket ID title
    ...
    ...     Expected Results:
    ...     1. The list of tickets should be sorted in chronological order
    ...     2. The list should be sorted

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-02      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-03: Check the pagination
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the pagination, click on > button
    ...     2. The user clicks on < button
    ...     3. The user clicks on page number
    ...
    ...     Expected Results:
    ...     1. The user shall be navigated to the next page
    ...     2. The user shall be navigated to the previous page of the list
    ...     3. The user shall be navigated to that page

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-03      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-04: Check the pagination
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Click on the pagination drop-down, observe the list
    ...     2. The user selects “10 rows” from the drop-down box
    ...     3. TThe user selects “30 rows” from the drop-down box
    ...     4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...     2. The list with 10 tickets shall be displayed
    ...     3. The list with 30 tickets shall be displayed
    ...     4. The list with 50 tickets shall be displayed
    ...     5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-SUPPORT-CLINIC-VIEWLIST-RESOLVED-04      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-01: Observe the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the search bar
    ...
    ...     Expected Results:
    ...     1. The default search parameter for Ticket ID, with a string saying “Search by Ticket ID"

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-01      BSP-SRS-003-FRS-02-1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-02: Search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     1. Clinic Support requests should be able to be searched by the following criteria:
    ...     - Ticket ID
    ...     - Facility. It includes Facility Name, ID, status

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-02      BSP-SRS-003-FRS-02-1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-03: Search by Ticket ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Ticket ID into the search bar
    ...
    ...     Precondition: The search option is "Search by Ticket ID"
    ...
    ...     Test Steps:
    ...     1. Enter a Ticket ID into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered ticket ID

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-03      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-04: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Ticket ID"
    ...                   2. Enter a Ticket ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-04      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-05: Switches pages on the portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Ticket ID into the search bar
    ...
    ...     Precondition: 1. The search option is "Search by Ticket ID"
    ...                   2. Enter a Ticket ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches pages on the portal
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. he search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-05      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-06: Search by Facility name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a facility's name into the search bar
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Select search option “Facility” and enter a facility’s name into the search bar
    ...     1. Enter a facility's name into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered ticket ID
    ...     2. Each result includes Facility Name, ID, status.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-06      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-07: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Facility"
    ...                   2. Enter a facility's name into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-07      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-OPEN-08: Switches pages on the portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a facility's name into the search bar
    ...
    ...     Precondition: 1. The search option is "Facility"
    ...                   2. Enter a facility's name into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches pages on the portal
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. the search value and its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-OPEN-08     BSP-SRS-003-FRS-02-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-OPEN-SC1.15.1-01: Check Filter options of "Diagnostics"
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition: The Device type is "Diagnostics"
    ...
    ...     Test Steps:
    ...     1. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Billing questions
    ...     - Insurance portal questions
    ...     - Others
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen


    [Tags]    BSP-SUPPORT-CLINIC-FILTER-OPEN-SC1.15.1-01    manual     SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-OPEN-SC1.15.1-02: Check Filter options of "Disease Management"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects “Disease Management” in the drop-down menu
    ...     2. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Others
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-OPEN-SC1.15.1-02    manual     SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-OPEN-11: The user selects filters options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects filters options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects filters options
    ...
    ...     Expected Results:
    ...     1. The selected option shall be displayed

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-OPEN-11     BSP-SRS-003-FRS-02-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-OPEN-12: The user removes the selected options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user removes the selected options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user clicks on “Remove” button on each selected option
    ...
    ...     Expected Results:
    ...     1. The option shall be removed

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-OPEN-12     BSP-SRS-003-FRS-02-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-OPEN-13: Select options then switch tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects filters options
    ...      2. The user switchs tabs on the page
    ...
    ...     Expected Results:
    ...     1. The filters should be kept and applied to the navigated page

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-OPEN-13      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-OPEN-14-SC1.15.1: Filter “Disease Management” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Disease Management” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Disease Management” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Disease Management” portal
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-OPEN-14-SC1.15.1      BSP-SRS-003-FRS-02-1     R1   manual      SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-OPEN-15-SC1.15.1: Filter “Diagnostics” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Diagnostics” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Diagnostics” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Diagnostics” portal
    ...     2. “Diagnostics” is default selected
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-OPEN-15-SC1.15.1      BSP-SRS-003-FRS-02-1     R1   manual      SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-01: Observe the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the search bar
    ...
    ...     Expected Results:
    ...     1. The default search parameter for Ticket ID, with a string saying “Search by Ticket ID"

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-01      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-02: Search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     1. Clinic Support requests should be able to be searched by the following criteria:
    ...     - Ticket ID
    ...     - Facility. It includes Facility Name, ID, status

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-02      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-03: Enter a Ticket ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Ticket ID into the search bar
    ...
    ...     Precondition: The search option is "Search by Ticket ID"
    ...
    ...     Test Steps:
    ...     1. Enter a Ticket ID into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered ticket ID

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-03      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-04: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Ticket ID"
    ...                   2. Enter a Ticket ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-04      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-05: Switches pages on the portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Ticket ID into the search bar
    ...
    ...     Precondition: 1. The search option is "Search by Ticket ID"
    ...                   2. Enter a Ticket ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches pages on the portal
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. he search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-05      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-06: Enter a facility's name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a facility's name into the search bar
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Select search option “Facility” and enter a facility’s name into the search bar
    ...     1. Enter a facility's name into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered ticket ID
    ...     2. Each result includes Facility Name, ID, status.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-06      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-07: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Facility"
    ...                   2. Enter a facility's name into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-07      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-08: Switches pages on the portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a facility's name into the search bar
    ...
    ...     Precondition: 1. The search option is "Facility"
    ...                   2. Enter a facility's name into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches pages on the portal
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. the search value and its result should remain.

    [Tags]    BSP-SUPPORT-CLINIC-SEARCH-RESOLVED-08      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-RESOLVED-10-SC1.15.1: Check Filter options of "Diagnostics"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition: The Device type is "Diagnostics"
    ...
    ...     Test Steps:
    ...     1. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Billing questions
    ...     - Insurance portal questions
    ...     - Others
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-RESOLVED-10-SC1.15.1      BSP-SRS-003-FRS-02-1     R1   manual   SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-RESOLVED-11-SC1.15.1: Check Filter options of "Disease Management"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects “Disease Management” in the drop-down menu
    ...     2. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Others
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-RESOLVED-11-SC1.15.1      BSP-SRS-003-FRS-02-1     R1   manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-RESOLVED-11: The user selects filters options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user selects filters options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects filters options
    ...
    ...     Expected Results:
    ...     1. The selected option shall be displayed

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-RESOLVED-11      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-RESOLVED-12: The user removes the selected options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user removes the selected options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user clicks on “Remove” button on each selected option
    ...
    ...     Expected Results:
    ...     1. The option shall be removed

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-RESOLVED-12      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-RESOLVED-13: Select options then switch tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects filters options
    ...      2. The user switchs tabs on the page
    ...
    ...     Expected Results:
    ...     1. The filters should be kept and applied to the navigated page

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-RESOLVED-13      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-RESOLVED-14-SC1.15.1: Filter “Disease Management” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Disease Management” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Disease Management” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Disease Management” portal
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-RESOLVED-14-SC1.15.1      BSP-SRS-003-FRS-02-1     R1   manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-FILTER-RESOLVED-15-SC1.15.1 : Filter “Diagnostics” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Diagnostics” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Diagnostics” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Diagnostics” portal
    ...     2. “Diagnostics” is default selected
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-FILTER-RESOLVED-15-SC1.15.1      BSP-SRS-003-FRS-02-1     R1   manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-01-SC1.15.1: Observe the “New Request” sidebar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the “New Request” sidebar
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user clicks on “New Request” button on the Clinic Support ticket list page
    ...     2. Observe the “New Request” sidebar
    ...
    ...     Expected Results:
    ...     1. There shall be a "New Request" sidebar displayed
    ...     2. There should be four fields for the user to input information:
    ...     - Facility
    ...     - Category
    ...     - Notification email
    ...     - Support message
    ...     - Internal support notes (optional)
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-01-SC1.15.1     BSP-SRS-003-FRS-03-1    R1     manual   SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-02: The user enters a facility’s name into Facility field
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user enters a facility’s name into Facility field
    ...     2. Observe the result
    ...
    ...     Expected Results:
    ...     1. There should be a search dropdown menu.
    ...     It includes: Name, Facility ID, Facility Status

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-02     BSP-SRS-003-FRS-03-1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-03: The user clicks on Category
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user clicks on Category
    ...     2. Observe the list
    ...
    ...     Expected Results:
    ...     1. There should be a drop-down menu:
    ...     - Web portal issues
    ...     - Billing questions
    ...     - Insurance portal questions
    ...     - Others

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-03     BSP-SRS-003-FRS-03-1    SC-1.9.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-04: Inputs the emails into Notification email text box
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user inputs the emails into Notification email text box, separated by a space or a comma
    ...
    ...     Expected Results:
    ...     1. The inputted emails shall be displayed

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-04     BSP-SRS-003-FRS-03-1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-05: Remove the emails into Notification email text box
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: There is at least an email inputted
    ...
    ...     Test Steps:
    ...     1.The user clicks on the “Remove” button on each email
    ...
    ...     Expected Results:
    ...     1. The emails shall be removed

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-05     BSP-SRS-003-FRS-03-1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-06: Inputs the text into the Support Message text box
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user inputs the text into the Support Message text box
    ...
    ...     Expected Results:
    ...     1. The inputted text shall be displayed

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-06     BSP-SRS-003-FRS-03-1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-06-SC1.15.1: Inputs the text into the Internal support notes text box
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user inputs the text into the Support Message text box
    ...
    ...     Expected Results:
    ...     1. The inputted text shall be displayed
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-06-SC1.15.1     BSP-SRS-003-FRS-03-1   manual     SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-07-SC1.15.1: Create “Billing questions” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  Search and select a facility
    ...     2.  The user selects category “Billing questions”
    ...     3.  Select one of options on Billing issue
    ...     4.  Enter a valid email into Notification email field
    ...     5.  Enter a text into Support message field
    ...     6.  Enter or leave empty Internal support note
    ...     7.  Click "Create Request" button
    ...
    ...     Expected Results:
    ...     1. Step 2-There should be a section with multiple choice option featuring these options added to the sidebar
    ...     - I want to pay my bill.This option is selected by default
    ...     - I have inquiries about my invoice.
    ...     - My account is on hold.
    ...     - Other
    ...     - Other
    ...     2. Step 7-Ticket is create successfully
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-07-SC1.15.1     BSP-SRS-003-FRS-03-1    R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-08-SC1.15.1: Create “Web portal issues” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  Search and select a facility
    ...     2.  The user selects category “Web portal issues”
    ...     3.  Enter a valid email into Notification email field
    ...     4.  Enter a text into Support message field
    ...     5.  Enter or leave empty Internal support note
    ...     6.  Click "Create Request" button
    ...
    ...     Expected Results:
    ...     Step 6-Ticket is create successfully
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-08-SC1.15.1     BSP-SRS-003-FRS-03-1     R1    manual   SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-09-SC1.15.1: Create “Insurance portal questions” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  Search and select a facility
    ...     2.  The user selects category “Insurance portal questions”
    ...     3.  Enter a valid email into Notification email field
    ...     4.  Enter a text into Support message field
    ...     5.  Enter or leave empty Internal support note
    ...     6.  Click "Create Request" button
    ...
    ...     Expected Results:
    ...     Step 6-Ticket is create successfully
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-09-SC1.15.1     BSP-SRS-003-FRS-03-1    R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-10-SC1.15.1: Create “Others” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  Search and select a facility
    ...     2.  The user selects category “Others”
    ...     3.  Enter a valid email into Notification email field
    ...     4.  Enter a text into Support message field
    ...     5.  Enter or leave empty Internal support note
    ...     6.  Click "Create Request" button
    ...
    ...     Expected Results:
    ...     Step 6-Ticket is create successfully
    ...
    ...     **Others**
    ...     Update Date: 8/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-10-SC1.15.1     BSP-SRS-003-FRS-03-1    R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-CREATE-11: Checks the “Create Request” button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  Observe the “Create Request” button in the case there is a required field that is not filled in
    ...
    ...     Expected Results:
    ...     1. The “Create Request” button is disabled

    [Tags]    BSP-SUPPORT-CLINIC-CREATE-11     BSP-SRS-003-FRS-04-1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWTICKET-OPEN-01-SC1.15.1: View an Open Clinic Support ticket details-Category is “Billing questions”
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the Open tab, Clinic Support page, Support portal
    ...
    ...     Test Steps:
    ...     1. Hover on a row of a Clinic Supports tickets and click the [Edit] button
    ...     2. Observe the header section
    ...     3. Observe the Support Information section
    ...     4. Observe the Internal notes section
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the details page
    ...     2. Header:
    ...     - Ticket ID
    ...     - Facility
    ...     - Request Date
    ...     - Category
    ...     3. Support Information section:
    ...     - Message – should display the Support Message inputted when creating the ticket
    ...     4. Billing issue – the selected option when creating the ticket should be displayed
    ...     5. Internal notes is displayed
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWTICKET-OPEN-01-SC1.15.1     BSP-SRS-003-FRS-04-1    R1    manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWTICKET-OPEN-02-SC1.15.1 : View an open Clinic Support ticket details-Category “Others”, "Web portal issues", "Insurance portal questions"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the Open tab, Clinic Support page, Support portal
    ...
    ...     Test Steps:
    ...     1. Hover on a row of a Clinic Supports tickets and click the [Edit] button
    ...     2. Observe the header section
    ...     3. Observe the Comunication section
    ...     4. Observe the Internal notes section
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the details page
    ...     2. Header:
    ...     - Ticket ID
    ...     - Facility
    ...     - Request Date
    ...     - Category
    ...     3. Comunication section:
    ...     - Message – should display the Support Message inputted when creating the ticket
    ...     4. Internal notes is displayed and allow the user to add notes
    ...
    ...     **Others**
    ...     Update date: 8/15/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-VIEWTICKET-OPEN-02-SC1.15.1      BSP-SRS-003-FRS-04-1    R1      SC-1.9.0    manual      SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWTICKET-RESOLVED-01-SC1.15.1: View a Resolved Clinic Support ticket details-Category is “Billing questions”
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the Open tab, Clinic Support page, Support portal
    ...
    ...     Test Steps:
    ...     1. Hover on a row of a Clinic Supports tickets and click the [Edit] button
    ...     2. Observe the header section
    ...     3. Observe the Comunication section
    ...     4. Observe the Internal notes section
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the details page
    ...     2. Header:
    ...     - Ticket ID
    ...     - Facility
    ...     - Request Date
    ...     - Category
    ...     3. Comunication section:
    ...     - Message
    ...     - Text input shall be hidden
    ...     4. Internal notes is displayed and allow the user to add notes

    [Tags]    BSP-SUPPORT-CLINIC-VIEWTICKET-RESOLVED-01-SC1.15.1     BSP-SRS-003-FRS-04-1    R1     manual    SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-VIEWTICKET-RESOLVED-02-SC1.15.1: View a Resolved Clinic Support ticket details-Category is “Others”, "Web portal issues", "Insurance portal questions"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the Open tab, Clinic Support page, Support portal
    ...
    ...     Test Steps:
    ...     1. Hover on a row of a Clinic Supports tickets and click the [Edit] button
    ...     2. Observe the header section
    ...     3. Observe the Comunication section
    ...     4. Observe the Internal notes section
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the details page
    ...     2. Header:
    ...     - Ticket ID
    ...     - Facility
    ...     - Request Date
    ...     - Category
    ...     3. Comunication section:
    ...     - Message
    ...     - Text input shall be hidden
    ...     4. Internal notes is displayed and allow the user to add notes

    [Tags]    BSP-SUPPORT-CLINIC-VIEWTICKET-RESOLVED-02-SC1.15.1     BSP-SRS-003-FRS-04-1      SC-1.9.0    manual    R1   SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-EDIT-01:Edit the open ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the Open tab, Clinic Support page, Support portal.
    ...
    ...     Test Steps:
    ...     1. The user inputs text into the Resolution text box
    ...
    ...     Expected Results:
    ...     1. The inputted text shall be displayed
    ...
    ...     **Others**
    ...     Update date: 08/14/2023 - Nhan Nguyen

    [Tags]    BSP-SUPPORT-CLINIC-EDIT-01     BSP-SRS-003-FRS-05-1    manual    R1   out of date
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-PARTICIPIANT-01-SC1.15.1: Check the participant section in the open ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the Open tab, Clinic Support page, Support portal.
    ...
    ...     Test Steps:
    ...     1. The user inputs text into the Resolution text box
    ...
    ...     Expected Results:
    ...     1. There shall be a ‘Participant’ section, it will display the people (avatar and name)
    ...     who have the following action:
    ...     - Complete the request
    ...     - Leave the message
    ...     - Requester
    ...     - Re-open the request
    ...
    ...     **Others**
    ...     Update date: 08/14/2023 - Nhan Nguyen: SC-1.15.1-this feature is removed

    [Tags]    BSP-SUPPORT-CLINIC-PARTICIPIANT-01-SC1.15.1    SC-1.9.0    manual    R1    SC-1.15.1   out of date
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-PARTICIPIANT-02-SC1.15.1: Check the participant section in the Resolved ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the Resolved tab, Clinic Support page, Support portal.
    ...
    ...     Test Steps:
    ...     1. The user inputs text into the Resolution text box
    ...
    ...     Expected Results:
    ...     1. There shall be a ‘Participant’ section, it will display the people (avatar and name)
    ...     who have the following action:
    ...     - Complete the request
    ...     - Leave the message
    ...     - Requester
    ...     - Re-open the request
    ...     2. Check the information of the open ticket is displayed when the ticket is resolved
    ...
    ...     **Others**
    ...     Update date: 08/14/2023 - Nhan Nguyen: SC-1.15.1-this feature is removed

    [Tags]    BSP-SUPPORT-CLINIC-PARTICIPIANT-02-SC1.15.1    SC-1.9.0    manual    R1    SC-1.15.1   out of date
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-COMMUNICATE-01: Check the "Send" button in the case the Input field is empty
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the detail page of an open ticket
    ...
    ...     Test Steps:
    ...     1. Leave the Input field empty
    ...     2. Observe "Send" button
    ...
    ...     Expected Results:
    ...     1. The "Send" button should be disabled

    [Tags]    BSP-SUPPORT-CLINIC-COMMUNICATE-01     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-COMMUNICATE-02: Check the "Send" button in the case the Input field only contains spaces
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the detail page of an open ticket
    ...
    ...     Test Steps:
    ...     1. Input field only contains spaces
    ...     2. Observe "Send" button
    ...
    ...     Expected Results:
    ...     1. The "Send" button should be disabled

    [Tags]    BSP-SUPPORT-CLINIC-COMMUNICATE-02     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-COMMUNICATE-03: Check the message of the ticket (created from clinic portal)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The Support Staff is on the detail page of an open ticket
    ...     - The is a message created form clinic portal
    ...
    ...     Test Steps:
    ...     1. Observe the ticket detail page
    ...
    ...     Expected Results:
    ...     1. There shall be the message that created from the clinic portal displayed

    [Tags]    BSP-SUPPORT-CLINIC-COMMUNICATE-03     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-COMMUNICATE-04: Add message in a Open ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The Support Staff is on the detail page of an open ticket
    ...
    ...     Test Steps:
    ...     1. Input text into the Input field
    ...     2. Clicking on the "Send" button
    ...
    ...     Expected Results:
    ...     1. The inputted text shall be added to the section

    [Tags]    BSP-SUPPORT-CLINIC-COMMUNICATE-04     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-COMMUNICATE-05: Observe the added message
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user adds a message, then clicks on "send"
    ...
    ...     Test Steps:
    ...     1.Observe the added message
    ...     2.Check Avatar
    ...     3. Check Name
    ...     4. Check Date and time
    ...     5. Check message
    ...
    ...     Expected Results:
    ...     1. There shall be:
    ...     - Avatar:If the support staff resolve the ticket via Email’s link,
    ...     there shall be a default avatar.
    ...     - Name: If the support staff resolve the ticket via Email’s link,
    ...     there shall be a default name ‘Support Staff’.
    ...     - Date and time
    ...     - Message or action description.

    [Tags]    BSP-SUPPORT-CLINIC-COMMUNICATE-05    SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-COMMUNICATE-06: Observe the message when an action is taken in relation to this request
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The user resolves the ticket
    ...
    ...     Test Steps:
    ...     1.Observe the added message
    ...     2.Check Avatar
    ...     3. Check Name
    ...     4. Check Date and time
    ...     5. Check Action description
    ...
    ...     Expected Results:
    ...     1. There shall be:
    ...     - Avatar:If the support staff resolve the ticket via Email’s link,
    ...     there shall be a default avatar.
    ...     - Name: If the support staff resolve the ticket via Email’s link,
    ...     there shall be a default name ‘Support Staff’.
    ...     - Date and time
    ...     - Action description shall be " ... resolves this support ticket"

    [Tags]    BSP-SUPPORT-CLINIC-COMMUNICATE-06    SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-NOTES-01: Add internal notes in Open ticket
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user is on Open Clinic support ticket details
    ...
    ...     Test Steps:
    ...     1. Add notes into textbox
    ...     2. Click "Add internal notes" button
    ...     3. Observe Internal notes section
    ...
    ...     Expected Results:
    ...     1. The notes is added into section with the following information:
    ...     - Profile picture and name of the notes submitter
    ...     - Date and time of the notes, relative to the viewer
    ...     - Notes content
    ...     2. The internal notes shall be displayed in ascending order by time

    [Tags]    BSP-SUPPORT-CLINIC-NOTES-01    manual    R1   SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-NOTES-02: Add internal notes in Resolved ticket
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user is on Resolved Clinic support ticket details
    ...
    ...     Test Steps:
    ...     1. Add notes into textbox
    ...     2. Click "Add internal notes" button
    ...     3. Observe Internal notes section
    ...
    ...     Expected Results:
    ...     1. The notes is added into section with the following information:
    ...     - Profile picture and name of the notes submitter
    ...     - Date and time of the notes, relative to the viewer
    ...     - Notes content
    ...     2. The internal notes shall be displayed in ascending order by time

    [Tags]    BSP-SUPPORT-CLINIC-NOTES-02    manual    R1   SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-NOTES-03: Add internal notes is disabled if the input field is blank
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user is on Open/Resolved Clinic support ticket details
    ...
    ...     Test Steps:
    ...     1. Leave empty text field or enter all spaces into the text field
    ...     2. Observe "Add internal notes" button
    ...
    ...     Expected Results:
    ...     The "Add internal notes" button shall be disabled

    [Tags]    BSP-SUPPORT-CLINIC-NOTES-03    manual   SC-1.15.1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-RESOLVE-01: Resolve a clinic support ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the detail page of an open ticket
    ...
    ...     Test Steps
    ...     1. The user clicks on “Resolve” button on the ticket detail page
    ...     2. The user clicks on “Back” button
    ...     3. The user clicks on “Confirm” button
    ...
    ...     Expected Results:
    ...     1. The user should be prompted to confirm that they want to resolve the ticket.
    ...     There shall be a message “If you are sure you resolved this ticket, please confirm below.”
    ...     “Back” button, “Confirm” button
    ...     2. The user should be redirected to the detail page, the confirmation window shall be closed
    ...     3. The ticket shall be resolved and moved to the “Resolved” tab  page

    [Tags]    BSP-SUPPORT-CLINIC-RESOLVE-01    BSP-SRS-003-FRS-06    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-QUICKACCESS-01: Quick access to Facility information in the Open tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Facility information
    ...
    ...     Precondition: The Support Staff is on the ticket list, Open tab
    ...
    ...     Test Steps
    ...     1. The user clicks on Facility hyperlink
    ...     2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     1. A quick access sidebar that displays the following:
    ...     Contact information:
    ...     - Facility name
    ...     - Sales rep
    ...     - Phone number
    ...     - Fax number
    ...     - Address
    ...     Facility notes

    [Tags]    BSP-SUPPORT-CLINIC-QUICKACCESS-01    BSP-SRS-003-FRS-07    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-QUICKACCESS-02: Quick access to Facility information in the Resolved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Facility information
    ...
    ...     Precondition: The Support Staff is on the ticket list, Resolved tab
    ...
    ...     Test Steps
    ...     1. The user clicks on Facility hyperlink
    ...     2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     1. A quick access sidebar that displays the following:
    ...     Contact information:
    ...     - Facility name
    ...     - Sales rep
    ...     - Phone number
    ...     - Fax number
    ...     - Address
    ...     Facility notes

    [Tags]    BSP-SUPPORT-CLINIC-QUICKACCESS-02    BSP-SRS-003-FRS-07    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}
#Intergation test Support & Clinic

BSP-SUPPORT-CLINIC-BP-01: Create ticket from Diagnostics portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Display clinic ticket that created form Clinic portal

    [Tags]    BSP-SUPPORT-CLINIC-BP-01   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-BP-02: Create ticket from Diagnostics app
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Display clinic ticket that created form Clinic app

    [Tags]    BSP-SUPPORT-CLINIC-BP-02   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#Email when create ticket
BSP-SUPPORT-CLINIC-BP-03: Check email send to Service team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:

    [Tags]    BSP-SUPPORT-CLINIC-BP-03   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-CLINIC-BP-04: Complete ticket through email
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:

    [Tags]    BSP-SUPPORT-CLINIC-BP-04   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_support_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Support Portal Page
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
