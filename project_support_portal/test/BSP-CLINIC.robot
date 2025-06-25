*** Settings ***
Documentation   Test Suite - Support Portal - Clinic Support page
Metadata    sid     BSP-CLINIC
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_support_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-CLINIC      web
Test Timeout    1h

*** Test Cases ***
BSP-CLINIC-VIEWLIST-OPEN-01: View list of open clinic Support tickets
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
    ...     and tickets that have been Reopened while it was previously Closed/Resolved.
    ...     2.In the open tab, there should be a list with the following attributes:
    ...     - Ticket ID
    ...     - Date
    ...     - Category
    ...     - Facility
    ...     - Requester
    ...     - Requester Role

    [Tags]    BSP-CLINIC-VIEWLIST-OPEN-01      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWLIST-OPEN-02: Observe the order of the list
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

    [Tags]    BSP-CLINIC-VIEWLIST-OPEN-02      BSP-SRS-003-FRS-01-1     R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWLIST-OPEN-03: Check the pagination
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

    [Tags]    BSP-CLINIC-VIEWLIST-OPEN-03      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWLIST-OPEN-04: Check the pagination
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

    [Tags]    BSP-CLINIC-VIEWLIST-OPEN-04      BSP-SRS-003-FRS-01-1     R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWLIST-CLOSED-01: View list of closed clinic Support tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of closed tickets
    ...
    ...     Precondition:
    ...  - The Support Staff is on Support Portal, Clinic Support page
    ...  - The “Closed tab is selected
    ...
    ...     Test Steps:
    ...     1. Observe the attributes in the table
    ...
    ...     Expected Results:
    ...     1. The “Open” tab contains the tickets that are newly created from the ERP Portal,
    ...     and tickets that have been Reopened while it was previously Closed/Resolved.
    ...     2.In the open tab, there should be a list with the following attributes:
    ...     - Ticket ID
    ...     - Date
    ...     - Category
    ...     - Facility
    ...     - Requester
    ...     - Requester Role

    [Tags]    BSP-CLINIC-VIEWLIST-CLOSED-01      BSP-SRS-003-FRS-01-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWLIST-CLOSED-02: Observe the order of the list
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

    [Tags]    BSP-CLINIC-VIEWLIST-CLOSED-02      BSP-SRS-003-FRS-01-1     R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWLIST-CLOSED-03: Check the pagination
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

    [Tags]    BSP-CLINIC-VIEWLIST-CLOSED-03      BSP-SRS-003-FRS-01-1     R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWLIST-CLOSED-04: Check the pagination
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

    [Tags]    BSP-CLINIC-VIEWLIST-CLOSED-04      BSP-SRS-003-FRS-01-1     R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-OPEN-03: Enter a Ticket ID into the search bar
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

    [Tags]    BSP-CLINIC-SEARCH-OPEN-03      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-OPEN-04: Select other tabs on the page
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

    [Tags]    BSP-CLINIC-SEARCH-OPEN-04      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-OPEN-05: Switches pages on the portal
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

    [Tags]    BSP-CLINIC-SEARCH-OPEN-05      BSP-SRS-003-FRS-02-1     R2   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-OPEN-06: Enter a facility's name into the search bar
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

    [Tags]    BSP-CLINIC-SEARCH-OPEN-06      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-OPEN-07: Select other tabs on the page
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

    [Tags]    BSP-CLINIC-SEARCH-OPEN-07      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-OPEN-08: Switches pages on the portal
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

    [Tags]    BSP-CLINIC-SEARCH-OPEN-08     BSP-SRS-003-FRS-02-1    R2   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-OPEN-09: Check Filter options of "Biolfux"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition: The Device type is "Bioflux"
    ...
    ...     Test Steps:
    ...     1. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Billing questions
    ...     - Others

    [Tags]    BSP-CLINIC-FILTER-OPEN-09      BSP-SRS-003-FRS-02-1     R1   manual     SC-1.9.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-OPEN-10: Check Filter options of "Biocare cadiac"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects “Biocare cardiac” in the drop-down menu
    ...     2. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Others

    [Tags]    BSP-CLINIC-FILTER-OPEN-10      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-OPEN-11: The user selects filters options
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

    [Tags]    BSP-CLINIC-FILTER-OPEN-11     BSP-SRS-003-FRS-02-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-OPEN-12: The user removes the selected options
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

    [Tags]    BSP-CLINIC-FILTER-OPEN-12     BSP-SRS-003-FRS-02-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-OPEN-13: Select options then switch tabs on the page
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

    [Tags]    BSP-CLINIC-FILTER-OPEN-13      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-OPEN-14: Filter “Biocare cardiac” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Biocare cardiac” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Biocare cardiac” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Biocare cardiac” portal

    [Tags]    BSP-CLINIC-FILTER-OPEN-14      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-OPEN-15: Filter “Bioflux” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Biolfux” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Bioflux” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Bioflux” portal
    ...     2. “Bioflux” is default selected

    [Tags]    BSP-CLINIC-FILTER-OPEN-15      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-CLOSED-03: Enter a Ticket ID into the search bar
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

    [Tags]    BSP-CLINIC-SEARCH-CLOSED-03      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-CLOSED-04: Select other tabs on the page
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

    [Tags]    BSP-CLINIC-SEARCH-CLOSED-04      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-CLOSED-05: Switches pages on the portal
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

    [Tags]    BSP-CLINIC-SEARCH-CLOSED-05      BSP-SRS-003-FRS-02-1     R2   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-CLOSED-06: Enter a facility's name into the search bar
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

    [Tags]    BSP-CLINIC-SEARCH-CLOSED-06      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-CLOSED-07: Select other tabs on the page
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

    [Tags]    BSP-CLINIC-SEARCH-CLOSED-07      BSP-SRS-003-FRS-02-1     R2   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-SEARCH-CLOSED-08: Switches pages on the portal
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

    [Tags]    BSP-CLINIC-SEARCH-CLOSED-08      BSP-SRS-003-FRS-02-1     R2   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-CLOSED-09: Check Filter options of "Biolfux"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition: The Device type is "Bioflux"
    ...
    ...     Test Steps:
    ...     1. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Billing questions
    ...     - Others

    [Tags]    BSP-CLINIC-FILTER-CLOSED-09      BSP-SRS-003-FRS-02-1     R1   manual   SC-1.9.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-CLOSED-10: Check Filter options of "Biocare cadiac"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user selects “Biocare cardiac” in the drop-down menu
    ...     2. Click on Filter option
    ...
    ...     Expected Results:
    ...     1. The user should be able to filter for the following
    ...     - Web portal issues
    ...     - Others

    [Tags]    BSP-CLINIC-FILTER-CLOSED-10      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-CLOSED-11: The user selects filters options
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

    [Tags]    BSP-CLINIC-FILTER-CLOSED-11      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-CLOSED-12: The user removes the selected options
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

    [Tags]    BSP-CLINIC-FILTER-CLOSED-12      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-CLOSED-13: Select options then switch tabs on the page
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

    [Tags]    BSP-CLINIC-FILTER-CLOSED-13      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-CLOSED-14: Filter “Biocare cardiac” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Biocare cardiac” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Biocare cardiac” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Biocare cardiac” portal

    [Tags]    BSP-CLINIC-FILTER-CLOSED-14      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-FILTER-CLOSED-15: Filter “Bioflux” in the drop-down menu
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter “Biolfux” in the drop-down menu
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. The user filters “Bioflux” in the drop-down menu
    ...
    ...     Expected Results:
    ...     1. There should be the tickets that was generated from “Bioflux” portal
    ...     2. “Bioflux” is default selected

    [Tags]    BSP-CLINIC-FILTER-CLOSED-15      BSP-SRS-003-FRS-02-1     R1   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-01: Observe the “New Request” sidebar
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

    [Tags]    BSP-CLINIC-CREATE-01     BSP-SRS-003-FRS-03-1    R1     SC 1.9.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-02: The user enters a facility’s name into Facility field
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

    [Tags]    BSP-CLINIC-CREATE-02     BSP-SRS-003-FRS-03-1   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-03: The user clicks on Category
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
    ...     - Others

    [Tags]    BSP-CLINIC-CREATE-03     BSP-SRS-003-FRS-03-1   R1     SC-1.9.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-04: Inputs the emails into Notification email text box
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

    [Tags]    BSP-CLINIC-CREATE-04     BSP-SRS-003-FRS-03-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-05: Remove the emails into Notification email text box
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

    [Tags]    BSP-CLINIC-CREATE-05     BSP-SRS-003-FRS-03-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-06: Inputs the text into the Support Message text box
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

    [Tags]    BSP-CLINIC-CREATE-06     BSP-SRS-003-FRS-03-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-07: Create “Billing Issue” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  The user selects “Billing Issue” option from the Category drop-down menu
    ...     2.
    ...
    ...     Expected Results:
    ...     1. There should be a section with multiple choice option featuring these options added to the sidebar
    ...     - I want to pay my bill.This option is selected by default
    ...     - I have inquiries about my invoice.
    ...     - My account is on hold?
    ...     - Other

    [Tags]    BSP-CLINIC-CREATE-07     BSP-SRS-003-FRS-03-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-08: Create “Web portal issues” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  The user selects “Web portal issues” option from the Category
    ...
    ...     Expected Results:
    ...     1. There should be no additional fields required

    [Tags]    BSP-CLINIC-CREATE-08     BSP-SRS-003-FRS-03-1     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-09: Create “Insurance portal questions” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  The user selects “Insurance portal questions” option from the Category
    ...
    ...     Expected Results:
    ...     1. There should be no additional fields required

    [Tags]    BSP-CLINIC-CREATE-09     BSP-SRS-003-FRS-03-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-10: Create “Other” ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.  The user selects “Other” option from the Category
    ...
    ...     Expected Results:
    ...     1. There should be no additional fields required

    [Tags]    BSP-CLINIC-CREATE-10     BSP-SRS-003-FRS-03-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-CREATE-11: Checks the “Create Request” button
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

    [Tags]    BSP-CLINIC-CREATE-11     BSP-SRS-003-FRS-04-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWTICKET-OPEN-01: View an Open Clinic Support ticket details-Category is “Billing questions”
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
    ...     - Resolution – should be a text box
    ...     4. Billing issue – the selected option when creating the ticket should be displayed

    [Tags]    BSP-CLINIC-VIEWTICKET-OPEN-01     BSP-SRS-003-FRS-04-1    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWTICKET-OPEN-02: View Category “Other”, "Web portal issues", "Insurance ...questions"
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
    ...     - Resolution – should be a text box
    ...     4. The “Information” section should not appear

    [Tags]    BSP-CLINIC-VIEWTICKET-OPEN-02     BSP-SRS-003-FRS-04-1    R1      SC-1.9.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWTICKET-CLOSED-01: View a Clinic Support ticket details-Category is “Billing questions”
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
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the details page
    ...     2. Header:
    ...     - Ticket ID
    ...     - Facility
    ...     - Request Date
    ...     - Category
    ...     3. Support Information section:
    ...     - Message
    ...     - Resolution-This field shall be disabled
    ...     4. Billing issue – the selected option when creating the ticket should be displayed

    [Tags]    BSP-CLINIC-VIEWTICKET-CLOSED-01     BSP-SRS-003-FRS-04-1    R1     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-VIEWTICKET-CLOSED-02: View Category is “Other”, "Web portal issues", "Insurance questions"
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
    ...     - Resolution – should be a text box
    ...     4. The “Information” section should not appear

    [Tags]    BSP-CLINIC-VIEWTICKET-CLOSED-02     BSP-SRS-003-FRS-04-1      SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-EDIT-01:Edit the open ticket
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

    [Tags]    BSP-CLINIC-EDIT-01     BSP-SRS-003-FRS-05-1    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-PARTICIPIANT-01: CHECK THE PARTICIPANT SECTION IN THE OPEN TICKET
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

    [Tags]    BSP-CLINIC-PARTICIPIANT-01    SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-PARTICIPIANT-02: CHECK THE PARTICIPANT SECTION IN THE CLOSED TICKET
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is on the CLOSED tab, Clinic Support page, Support portal.
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

    [Tags]    BSP-CLINIC-PARTICIPIANT-02    SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-COMMUNICATE-01: Check the "Send" button in the case the Input field is empty
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

    [Tags]    BSP-CLINIC-COMMUNICATE-01     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-COMMUNICATE-02: Check the "Send" button in the case the Input field only contains spaces
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

    [Tags]    BSP-CLINIC-COMMUNICATE-02     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-COMMUNICATE-03: Check the message of the ticket (created from clinic portal)
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

    [Tags]    BSP-CLINIC-COMMUNICATE-03     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-COMMUNICATE-04: Add message
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

    [Tags]    BSP-CLINIC-COMMUNICATE-04     SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-COMMUNICATE-05: Observe the added message
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

    [Tags]    BSP-CLINIC-COMMUNICATE-05    SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-COMMUNICATE-06: Observe the message when an action is taken in relation to this request
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

    [Tags]    BSP-CLINIC-COMMUNICATE-06    SC-1.9.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-RESOLVE-01: Resolve a clinic support ticket
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
    ...     3. The ticket shall be resolved and moved to the “Closed” tab  page

    [Tags]    BSP-CLINIC-RESOLVE-01    BSP-SRS-003-FRS-06    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-QUICKACCESS-01: Quick access to Facility information in the OPEN tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Facility information
    ...
    ...     Precondition: The Support Staff is on the ticket list, OPEN tab
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

    [Tags]    BSP-CLINIC-QUICKACCESS-01    BSP-SRS-003-FRS-07    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-QUICKACCESS-02: Quick access to Facility information in the CLOSED tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Facility information
    ...
    ...     Precondition: The Support Staff is on the ticket list, CLOSED tab
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

    [Tags]    BSP-CLINIC-QUICKACCESS-02    BSP-SRS-003-FRS-07    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}
#Intergation test Support & Clinic

BSP-CLINIC-BP-01: Create ticket from Bioflux portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Display clinic ticket that created form Clinic portal

    [Tags]    BSP-CLINIC-BP-01   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-BP-02: Create ticket from Bioflux app
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Display clinic ticket that created form Clinic app

    [Tags]    BSP-CLINIC-BP-02   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#Email when create ticket
BSP-CLINIC-BP-03: Check email send to Service team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:

    [Tags]    BSP-CLINIC-BP-03   R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-CLINIC-BP-04: Complete ticket through email
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:

    [Tags]    BSP-CLINIC-BP-04   R1    manual
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
