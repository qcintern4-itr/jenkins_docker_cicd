*** Settings ***
Documentation   Test Suite - S&D Portal - DEVICE TRANSFER page
Metadata    sid     BSP-SND-TRANSFER
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-SND-TRANSFER        web
Test Timeout    1h

*** Test Cases ***
#VIEW LIST
BSP-SND-TRANSFER-VIEWLIST-01: View list of pending transfer tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of pending transfer tickets
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Pending” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. On Sale portal, the user creates a Sale order from Device sales.
    ...     - 2. On Sale portal, the Sales Admin unsubscribes the Renewal Stock Program and the facility still has renewal devices.
    ...     - 3. On the Admin portal, the admin user changes the status of facility to “Closed” and the facility still has devices.
    ...     - 4. S&D Portal, the Bioflux/Biotres Transfer ticket is created manually from S&D portal.
    ...     - 5. S&D Portal, the Bioheart Transfer ticket is created manually from S&D portal.
    ...     - 6. Bioheart E-commerce, the user creates a Bioheart Device Sales order
    ...     - 7. S&D Portal, the Biokit Transfer ticket is created manually from S&D portal.
    ...
    ...     Expected Results:
    ...     - 1. The Pending tab should contain the ticket that is in-processing of the above tickets
    ...     Device sales ticket (Device type is Biotres)
    ...     Return Renewal device ticket
    ...     Closed Account ticket
    ...     Transfer ticket (Device type is Bioflux/Biotres)
    ...     Transfer ticket (Device type is Bioheart)
    ...     Device sales ticket (Device type is Bioheart)
    ...     Transfer ticket (Device type is Biokit)

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-01    RS-82-01     R1    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-02: View list of Completed transfer tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of Completed transfer tickets
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Completed” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. The user completes a Device sales ticket (Device type is Bioflux/Biotres)
    ...     - 2. The user completes a Return Renewal device ticket
    ...     - 3. The user completes a Closed Account ticket
    ...     - 4. The user completes a Transfer ticket (Device type is Bioflux/Biotres)
    ...     - 5. The user completes a Transfer ticket (Device type is Bioheart)
    ...     - 6. The user completes a Device sales ticket (Device type is Bioheart)
    ...     - 7. The user cancels a Transfer ticket (Device type is Bioflux/Biotres)
    ...     - 8. The user cancels a Transfer ticket (Device type is Bioheart)
    ...     - 9. The user completes a Transfer ticket (Device type is Biokit)
    ...     - 10. The user cancels a Transfer ticket (Device type is Biokit)
    ...
    ...     Expected Results:
    ...     - 1. The Completed tab should contain the ticket that is completed:
    ...     Device sales ticket (Device type is Bioflux/Biotres)
    ...     Return Renewal device ticket
    ...     Closed Account ticket
    ...     Transfer ticket (Device type is Bioflux/Biotres)
    ...     Transfer ticket (Device type is Bioheart)
    ...     Device sales ticket (Device type is Bioheart)
    ...     Transfer ticket (Device type is Biokit)
    ...     - 2. The Completed tab should contain the ticket that is cancelled:
    ...     Transfer ticket (Device type is Bioflux/Biotres)
    ...     Transfer ticket (Device type is Bioheart)
    ...     Transfer ticket (Device type is Biokit)

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-02    RS-82-01     R1  SC-1.13.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-03: View the information in the list of Pending transfer tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the information in the list of Pending transfer tickets
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Pending” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of Pending transfer tickets
    ...
    ...     Expected Results:
    ...     - 1. The list shall contain the following information:
    ...     - Transfer ID (system auto-generated)
    ...     - Request Date
    ...     - Device type: Bioflux/ Biotres, Bioheart, Biokit
    ...     - Purpose: could be Device sales, Transfer, Closed account, Return renewal device
    ...     - Sales Order ID: only display when ticket’s purpose is “Device sales”, if else display "--"
    ...     --Format of Bioflux/Biotres order: SO-<Facility ID>-<Order number>
    ...     --Format of Bioheart: <Order number taken from the web app in 6 digits>
    ...     - Requester
    ...     - Customer: Facility name, End User’s full name and there shall be an icon displaying the customer type
    ...     -- Facility (hyperlink- the user can view the information of facility by clicking on it)
    ...     -- End User’s full name (hyperlink-The user can view the End User information by clicling on it)
    ...     - Assigned Items: Display number of the assigned items, if there is no item added there shall be "--"
    ...     -- Assigned Items: (Hyperlink- the user can view the Assigned Items sidebar by clicking on it)
    ...     - Shipping Date: There should be a status (Pre-transit, Transit, Delivered, Returned, Failure

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-03     RS-82-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-05: Sort the pending Device Transfer list by Transfer ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the pending Device Transfer list by Device Transfer ID
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Pending” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the sort order of the list
    ...     - 2. The user selects the [Sort] button next to the Device Transfer ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by Device Transfer ID in chronological order.
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Device Transfer ID

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-05    RS-82-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-06: Pagination-Move to other pages in pending Device Transfer ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination to move to other pages in pending Device Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Pending” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the pagination, click on > button
    ...     - 2. The user clicks on < button
    ...     - 3. The user clicks on page number
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the next page
    ...     - 2. The user shall be navigated to the previous page of the list
    ...     - 3. The user shall be navigated to that page

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-06    RS-82-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-07: Pagination-View quantity of tickets display per page in pending Device Transfer ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in pending Device Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Pending” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click on the pagination drop-down, observe the list
    ...     - 2. The user selects “10 rows” from the drop-down box
    ...     - 3. The user selects “30 rows” from the drop-down box
    ...     - 4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 2. The list with 10 tickets shall be displayed
    ...     - 3. The list with 30 tickets shall be displayed
    ...     - 4. The list with 50 tickets shall be displayed
    ...     - 5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-07    RS-82-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-08: View the information in the list of completed transfer tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the information in the list of completed transfer tickets
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Completed” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of completed transfer tickets
    ...
    ...     Expected Results:
    ...     - 1. The list shall contain the following information:
    ...     - Transfer ID (system auto-generated): There should also be status tags “Cancelled” or “Completed”
    ...     - Request Date
    ...     - Device type: Bioflux/ Biotres, Bioheart, Biokit
    ...     - Purpose: could be Device sales, Transfer, Closed account, Return renewal device
    ...     - Sales Order ID: only display when ticket’s purpose is “Device sales”, if else display "--"
    ...     --Format of Bioflux/Biotres order: SO-<Facility ID>-<Order number>
    ...     --Format of Bioheart: <Order number taken from the web app in 6 digits>
    ...     - Requester
    ...     - Customer: Facility name, End User’s full name and there shall be an icon displaying the customer type
    ...     -- Facility (hyperlink- the user can view the information of facility by clicking on it)
    ...     -- End User’s full name (hyperlink-The user can view the End User information by clicling on it)
    ...     - Assigned Items: Display number of the assigned items, if there is no item added there shall be "--"
    ...     -- Assigned Items: (Hyperlink- the user can view the Assigned Items sidebar by clicking on it)
    ...     - Shipping Date: There should be a status (Pre-transit, Transit, Delivered, Returned, Failure

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-08     RS-82-01     R1     SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-10: Sort the completed Device Transfer list by Transfer ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the completed Device Transfer list by Device Transfer ID
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Completed” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the sort order of the list
    ...     - 2. The user selects the [Sort] button next to the Device Transfer ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by Device Transfer ID in chronological order.
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Device Transfer ID

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-10    RS-82-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-11: Pagination-Move to other pages in completed Device Transfer ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination to move to other pages in completed Device Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Completed” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the pagination, click on > button
    ...     - 2. The user clicks on < button
    ...     - 3. The user clicks on page number
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the next page
    ...     - 2. The user shall be navigated to the previous page of the list
    ...     - 3. The user shall be navigated to that page

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-11    RS-82-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEWLIST-12: Pagination-View quantity of tickets display per page in completed Device Transfer ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in completed Device Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Device Transfer page
    ...     - 2. The “Completed” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click on the pagination drop-down, observe the list
    ...     - 2. The user selects “10 rows” from the drop-down box
    ...     - 3. The user selects “30 rows” from the drop-down box
    ...     - 4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 2. The list with 10 tickets shall be displayed
    ...     - 3. The list with 30 tickets shall be displayed
    ...     - 4. The list with 50 tickets shall be displayed
    ...     - 5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-SND-TRANSFER-VIEWLIST-12    RS-82-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#SEARCH
BSP-SND-TRANSFER-SEARCH-PENDING-01: Observe the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Transfer ID, with a string saying “Search by Transfer ID"

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-01    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-02: Search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search options
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Transfer ID
	...		- Device ID
    ...     - Sales Order ID
    ...     - Customer-Facility
    ...     - Customer-End User
	...		- Requester

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-02    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-03: Enter a Transfer ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Transfer ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Transfer ID" option
    ...     - 2. Enter a Transfer ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Transfer ID

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-03       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-04: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Transfer ID"
    ...     - 2. Enter a Transfer ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-04    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-05: Enter a Sales Order ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Sales Order ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Sales Order ID" option
    ...     - 2. Enter a Sales Order ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Sales Order ID

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-05       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-06: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Sales Order ID"
    ...     - 2. Enter a Sales Order ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-06    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-07: Enter a Device ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Device ID" option
    ...     - 2. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-07       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-08: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Device ID"
    ...     - 2. Enter a Device ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-08    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-09: Enter a Facility name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Facility name into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Customer – Facility" option
    ...     - 2. Enter a Facility name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. If there is a result of the search keyword, the system displays the results accordingly. The list of facilities when searching shall include:
    ...     - Facility name
    ...     - Facility ID
    ...     - Facility status

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-09       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-10: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Customer – Facility"
    ...     - 2. Enter a Facility name into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-10    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-11: Enter a End User’s full name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a End User’s full name into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Customer – User" option
    ...     - 2. Enter a End User’s full name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. If there is a result of the search keyword, the system displays the results accordingly. The list of facilities when searching shall include:
    ...     - Customer full name
    ...     - Email: If unavailable, display “Email unavailable” instead
    ...     - Phone number: If unavailable, display “Phone no. unavailable” instead

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-11       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-12: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Customer – User"
    ...     - 2. Enter a End User’s full name into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-12    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-13: Enter a Requester full name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Requester full name into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Pending tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Requester" option
    ...     - 2. Enter a Requester full name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The user searches from the list of all Operation Managers, Operation Staffs, Support Staffs, Admins, Sales Admins, Sales Representatives, and Sales Managers
	...		- 2. If there is a result of the search keyword, the system displays the results accordingly. The list of facilities when searching shall include:
    ...     - Requester full name
    ...     - Email: If unavailable, display “Email unavailable” instead
    ...     - Phone number: If unavailable, display “Phone no. unavailable” instead

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-13       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-PENDING-14: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Requester"
    ...     - 2. Enter a Requester full name into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-PENDING-14    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-15: Observe the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Transfer ID, with a string saying “Search by Transfer ID"

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-15    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-16: Search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search options
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Transfer ID
	...		- Device ID
    ...     - Sales Order ID
	...		- Device ID
    ...     - Customer-Facility
    ...     - Customer-End User
	...		- Requester

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-16    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-17: Enter a Transfer ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Transfer ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Transfer ID" option
    ...     - 2. Enter a Transfer ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Transfer ID

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-17       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-18: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Transfer ID"
    ...     - 2. Enter a Transfer ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-18    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-19: Enter a Sales Order ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Sales Order ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Sales Order ID" option
    ...     - 2. Enter a Sales Order ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Sales Order ID

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-19       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-20: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Sales Order ID"
    ...     - 2. Enter a Sales Order ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-20    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-21: Enter a Device ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Device ID" option
    ...     - 2. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-21       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-22: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Device ID"
    ...     - 2. Enter a Device ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-22    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-23: Enter a Facility name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Facility name into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Customer – Facility" option
    ...     - 2. Enter a Facility name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. If there is a result of the search keyword, the system displays the results accordingly. The list of facilities when searching shall include:
    ...     - Facility name
    ...     - Facility ID
    ...     - Facility status

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-23       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-24: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Customer – Facility"
    ...     - 2. Enter a Facility name into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-24    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-25: Enter a End User’s full name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a End User’s full name into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Customer – User" option
    ...     - 2. Enter a End User’s full name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. If there is a result of the search keyword, the system displays the results accordingly. The list of facilities when searching shall include:
    ...     - Customer full name
    ...     - Email: If unavailable, display “Email unavailable” instead
    ...     - Phone number: If unavailable, display “Phone no. unavailable” instead

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-25       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-26: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Customer – User"
    ...     - 2. Enter a End User’s full name into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-26    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-27: Enter a Requester full name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Requester full name into the search bar
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Completed tab, Device Transfer
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Requester" option
    ...     - 2. Enter a Requester full name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The user searches from the list of all Operation Managers, Operation Staffs, Support Staffs, Admins, Sales Admins, Sales Representatives, and Sales Managers
	...		- 2. If there is a result of the search keyword, the system displays the results accordingly. The list of facilities when searching shall include:
    ...     - Requester full name
    ...     - Email: If unavailable, display “Email unavailable” instead
    ...     - Phone number: If unavailable, display “Phone no. unavailable” instead

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-27       RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SEARCH-COMPLETED-28: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Requester"
    ...     - 2. Enter a Requester full name into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.
    ...     - 2. The search value shall be applied in the other tabs

    [Tags]    BSP-SND-TRANSFER-SEARCH-COMPLETED-28    RS-83-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#FILTER
BSP-SND-TRANSFER-FILTER-PENDING-01: Check Filter options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Device Transfer tab
    ...
    ...     Test Steps:
    ...     - 1. Click on Filter option, check the filter option
    ...     - 2. Check the Purpose drop-down list
    ...     - 3. Check the Device type type drop-down list
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to filter tickets by: Purpose and Device type
    ...     - 2. Purpose drop-down list: Device sales, Transfer, Closed Account, Return Renewal devices
    ...     - 3. The Device type type drop-down list: All types, Biolfux/Biotres, Bioheart

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-01    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-02: Filter by Device type - Bioflux/Biotres
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Device type - Bioflux/Biotres
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select "Bioflux/Biotres" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, only Bioflux and Biotres tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-02    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-03: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type - Bioflux/Biotres
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-03    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-04: Filter by Device type - Bioheart
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Device type - Bioheart
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select "Bioheart" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, only Bioheart tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-04    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-05: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type - Bioheart
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-05    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-06: Filter by Device type - All types
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by  Device type -  All types
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select " All types" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, All tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-06    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-07: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type -  All types
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-07    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-08: Filter by Purpose - Device sales
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Device sales
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Device sales" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-08    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-09: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Device sales
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-09   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-10: Filter by Purpose - Transfer
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Transfer
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Transfer" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-10    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-11: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Transfer
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-11   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-12: Filter by Purpose - Closed Account
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Closed Account
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Closed Account" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-12    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-13: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Closed Account
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-13   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-14: Filter by Purpose - Return Renewal devices
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Return Renewal devices
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Return Renewal devices" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-14    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-15: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Return Renewal devices
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-15   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-16: Check Filter options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...     - 1. An OM is on the Device Transfer tab
    ...
    ...     Test Steps:
    ...     - 1. Click on Filter option, check the filter option
    ...     - 2. Check the Purpose drop-down list
    ...     - 3. Check the Device type drop-down list
	...		- 4. Check the Status drop-down list
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to filter tickets by: Purpose and Device type, Status
    ...     - 2. Purpose drop-down list: Device sales, Transfer, Closed Account, Return Renewal devices
    ...     - 3. The Device type drop-down list: All types, Biolfux/Biotres, Bioheart
	...		- 4. The Device Status drop-down list: All statuses, Cancelled, Completed

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-16    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-17: Filter by Device type - Bioflux/Biotres
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Device type - Bioflux/Biotres
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select "Bioflux/Biotres" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, only Bioflux and Biotres tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-17   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-18: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type - Bioflux/Biotres
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-18    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-19: Filter by Device type - Bioheart
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Device type - Bioheart
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select "Bioheart" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, only Bioheart tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-19    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-20: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type - Bioheart
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-20    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-21: Filter by Device type - All types
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by  Device type -  All types
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select " All types" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, All tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-21    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-22: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type -  All types
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-22    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-23: Filter by Purpose - Device sales
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Device sales
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Device sales" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-23    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-24: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Device sales
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-24   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-25: Filter by Purpose - Transfer
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Transfer
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Transfer" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-25    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-26: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Transfer
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-26   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-27: Filter by Purpose - Closed Account
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Closed Account
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Closed Account" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-27    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-28: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Closed Account
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-28   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-29: Filter by Purpose - Return Renewal devices
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Purpose - Return Renewal devices
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Purpose" filter, select "Return Renewal devices" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-29    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-30: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Purpose - Return Renewal devices
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-30   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-31: Filter by Status - All statuses
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Status -  All statuses
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Status" filter, select "All statuses" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-31    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-32: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Status -  All statuses
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-32   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-33: Filter by Status - Cancelled
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Status -  Cancelled
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Status" filter, select "Cancelled" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-33    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-34: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Status -  Cancelled
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-34   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-35: Filter by Status - Completed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Status -  Completed
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Status" filter, select "Completed" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, Device sales tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-35    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-36: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Status -  Completed
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-36   RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-37: Filter by Device type - Biokit
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Device type - Biokit
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select "Biokit" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, only Biokit tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-37  SC-1.13.0    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-PENDING-38: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type - Biokit
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-PENDING-38  SC-1.13.0    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-39: Filter by Device type - Biokit
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by Device type - Biokit
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. In the "Device type" filter, select "Biokit" option
    ...     - 2. Check the result
    ...     - 3. Check the notification number on the filer button
    ...
    ...     Expected Results:
    ...     - 2.The list shall be filtered, only Biokit tickets are displayed
    ...     - 3.The notification number on the Filter button shows the number of selected filters

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-39  SC-1.13.0    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-FILTER-COMPLETED-40: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. Filter by Device type - Biokit
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the selected filter option and its result
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter value and
    ...     its result should remain.
    ...     - 2. The filter should be applied in other tabs

    [Tags]    BSP-SND-TRANSFER-FILTER-COMPLETED-40  SC-1.13.0    RS-83-02     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE
BSP-SND-TRANSFER-CREATE-E-01: Select device type modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select device type modal
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [New tranfer] button on the Device Transfer page
    ...     - 2. Observe the modal,
    ...     - 3. Select Bioflux/Biotres option, then clicks on [Next] button
    ...
    ...     Expected Results:
    ...     - 2. There shall be a modal which features the following:
    ...     - Bioflux/Biotres -shall be selected by default
    ...     - Bioheart
    ...     - Biokit
    ...     - [Next] and [Cancel] button
    ...     - 3.The user shall be redirected to the Create Transfer Ticket page of the Bioflux/Biotres device

    [Tags]    BSP-SND-TRANSFER-CREATE-E-01   RS-83-02     R1   SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-02: Select device type modal - Bioheart
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select device type modal - Bioheart
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [New tranfer] button on the Device Transfer page
    ...     - 2. Observe the modal,
    ...     - 3. Select Bioheart option, then clicks on [Next] button
    ...
    ...     Expected Results:
    ...     - 2. There shall be a modal which features the following:
    ...     - Bioflux/Biotres -shall be selected by default
    ...     - Bioheart
    ...     - Biokit
    ...     - [Next] and [Cancel] button
    ...     - 3.The user shall be redirected to the Create Transfer Ticket page of the Bioheart device

    [Tags]    BSP-SND-TRANSFER-CREATE-E-02   RS-84-01     R1   SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-03: Click on [Cancel] button on the modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on [Cancel] button on the modal
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [New tranfer] button on the Device Transfer page
    ...     - 2. Observe the modal,
    ...     - 3. Clicks on [Cancel] button
    ...
    ...     Expected Results:
    ...     - 2. There shall be a modal which features the following:
    ...     - Bioflux/Biotres -shall be selected by default
    ...     - Bioheart
    ...     - Biokit
    ...     - [Next] and [Cancel] button
    ...     - 3.The user shall exsit the modal and return the user back to the Device Transfer page

    [Tags]    BSP-SND-TRANSFER-CREATE-E-03   RS-84-01     R1   SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-04: Observe the Customer Information section, Create Transfer Ticket page of the Bioheart device, End User ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer Information section
    ...
    ...     Expected Results:
    ...     - 1. There shall be the following fields in the Customer Information section
    ...     - Customer type: End User/Facility
    ...     - Order number (Optional)
    ...     - Order date (Optional)
    ...     - Customer first name
    ...     - Customer last name
    ...     - Country
    ...     - Address
    ...     - City, State, Zip code
    ...     - Contact phone number
    ...     - Contact Email

    [Tags]    BSP-SND-TRANSFER-CREATE-E-04   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-05: Observe the Items list in the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...     - 2. There are items added to the list: Bioheart bundle, Bioheart device, Bioheart strap, Bioheart charger
    ...
    ...     Test Steps:
    ...     - 1. Observe the Items list section
    ...
    ...     Expected Results:
    ...     - 1. There shall be an [Add items] button, which opens a sidebar for the user to add items to the transfer ticket
    ...     - 2. List of the items added

    [Tags]    BSP-SND-TRANSFER-CREATE-E-05   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-06: Observe the Other Information, Shipping Information in the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Other Information,Shipping Information section in the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 1. In the Other Information, there shall be:
    ...     - - Notification email textbox
    ...     - - Notes - optional
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Name
    ...     -- Recipient address
    ...     -- There shall be an option for user to choose if the shipping address is similar with the customer information
    ...     -- Country: Default is Unnited State
    ...     -- Address
    ...     -- Secondary Address (optional)
    ...     -- City, State, Zipcode,
    ...     -- Contact phone number, Contact Email

    [Tags]    BSP-SND-TRANSFER-CREATE-E-06   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-07: Input data into Customer first name textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input data into Customer first name textbox
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Input data into the Customer first name textbox
    ...
    ...     Expected Results:
    ...     - 1. The inputted value shall be displayed in the textbox

    [Tags]    BSP-SND-TRANSFER-CREATE-E-07  RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-08: Input data into Customer last name textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input data into Customer last name textbox
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Input data into the Customer last name textbox
    ...
    ...     Expected Results:
    ...     - 1. The inputted value shall be displayed in the textbox

    [Tags]    BSP-SND-TRANSFER-CREATE-E-08  RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-10: Select Country
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Country
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Observe the list country in the drop-down list
	...		- 2. Select an option
    ...
    ...     Expected Results:
    ...     - 1. Country: should be a drop-down menu that the user can be able to select an option
	...		- 2. The selected option shall be displayed

    [Tags]    BSP-SND-TRANSFER-CREATE-E-10   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-11: Select Address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Address
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Input an address into the Address textbox
	...		- 2. Select an suggestion
	...		- 3. Observe the Address field, State, City, State, Zipcode, Contact phone number, Contact Email
    ...
    ...     Expected Results:
    ...     - 1. Address: The web app should suggest address based on the inputs,
    ...     The user should be able to select the suggestion and the wep app should automatially fill the information in correctsponding input fields

    [Tags]    BSP-SND-TRANSFER-CREATE-E-11   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-12: Edit Zipcode
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Zipcode
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...     - 2. The wep app automatially filled the information in correctsponding input fields already when the selected the address
    ...
    ...     Test Steps:
	...		- 1. Fill out all required fields, then input an invalid zipcode
	...     - 2. Click on the "Create ticket" button
    ...
    ...     Expected Results:
    ...     - 1. There is an error message "Invalid Zipcode"

    [Tags]    BSP-SND-TRANSFER-CREATE-E-12   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-13: Input data into Contact phone number textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input data into Contact phone number textbox
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Input 10 digits into Contact phone number textbox
    ...     - 2. Input character, special character, > Digit
    ...     - 3. < 10 digits
    ...
    ...     Expected Results:
    ...     - 1. The inputted value shall be displayed in the textbox
    ...     - 2. The user can not input character, special character, only display 10 digits number
    ...     - 3. There shall be message "invalid phone number" when the user clicks on the "Create ticket" button

    [Tags]    BSP-SND-TRANSFER-CREATE-E-13   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-14: Input data into Contact Email textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input data into Contact Email textbox
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Input an valid email
    ...     - 2. Input an invalid email format
    ...
    ...     Expected Results:
    ...     - 1. The inputted value shall be displayed in the textbox
    ...     - 2. There shall be message "invalid email" when the user clicks on the "Create ticket" button

    [Tags]    BSP-SND-TRANSFER-CREATE-E-14   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-15: Add items to the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add items to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     - 1.There shall be a [ADD ITEMS] sidebar to add device
    ...     - 2. There shall be "Type" section contains 4 options: Bioheart bundle (Selected option), Bioheart device, Bioheart trap, Bioheart charger
    ...     - 3. There shall be "Bioheart device" textbox
    ...     - 4. There shall be "Trap size" section: Small(selected option), Medium, Large
    ...     - 5. The [Add items] button: Thiss button is disabled, by default

    [Tags]    BSP-SND-TRANSFER-CREATE-E-15   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-16: Add "Bioheart bundle" to the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart bundle" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart bundle" option
    ...     - 3. Seach and select a device ID in the "Bioheart devices" textbox
    ...     - 4. The user select 1 option out of 3 trap size option (Small/Medium/Large)
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     - The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected option shall be dispayed
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart bundle <Device ID>
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
    ...     - Bioheart strap (Small/Medium/Large size)
    ...     - Bioheart charger
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-CREATE-E-16   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-17: Add "Bioheart device" to the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart device" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart device" option
    ...     - 3. Seach and select multiple Bioheart device IDs in the "Bioheart devices" textbox
    ...     - 4. Click on a remove button on each of the selected device ID
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The user can select multiple Bioheart device IDs
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected device ID shall be removed by clicking on the [x] button on each option
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-CREATE-E-17   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-18: Add "Bioheart strap" to the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart strap" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs number of device into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...         Input negative number
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The selected option shall be displayed
    ...     - 4. The user can input a positive integer
    ...     - 5. Example: The Quantity is 4, Medium size, the list of items shall be added with format:
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)

    [Tags]    BSP-SND-TRANSFER-CREATE-E-18   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-19: Select "Bioheart strap" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart strap" then check the Quantity textbox in the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-CREATE-E-19   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-20: Add "Bioheart charger" to the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart charger" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. Inputs number of device into "Quantity" textbox or use the arrow icon to increase or decrease the number of device
    ...         Input negative number
    ...     - 4. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The user can input a positive integer
    ...     - 4. Example: The user selects Quantity: 4, the item shall be added to the list with format:
    ...     - Bioheart charger
    ...     - Bioheart charger
    ...     - Bioheart charger
    ...     - Bioheart charger

    [Tags]    BSP-SND-TRANSFER-CREATE-E-20   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-21: Select "Bioheart charger" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart charger" then check the Quantity textbox in the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-CREATE-E-21   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-22: Remove added item in the list of the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove added item
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...     - 2. There are some items added to the list
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Delete] button on every item in the list
    ...
    ...     Expected Results:
    ...     - 1. The added item shall be deleted

    [Tags]    BSP-SND-TRANSFER-CREATE-E-22   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-23: Edit Other Information section in the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Other Information section
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. The user inputs an email in to the textbox, press the [Space] or [,] to complete the email
    ...     - 2. Click on [x] button on each mail to remove it
    ...     - 3. The user input notes
    ...
    ...     Expected Results:
    ...     - 1. The email shall be displayed and seperated by [space] or [,]
    ...     - 2. The added email shall be removed by clicking on [x[ on each button
    ...     - 3. The inputted data shall be displayed

    [Tags]    BSP-SND-TRANSFER-CREATE-E-23   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-24: Turn on toggle "Same as customer address" in the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Turn on toggle "Same as customer address" in the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Turn on toggle "Same as customer address" in the Shipping information section
    ...     - 2. Observe the Shipping Information
    ...     - 3. Turn off the toggle "Same as customer address" and observe the information
    ...
    ...     Expected Results:
    ...     - 2. The Shipping information is autofilled the same address as the customer information,
    ...     -- As well as disable all fields in the shipping information section
    ...     - 3. The information shall be kept

    [Tags]    BSP-SND-TRANSFER-CREATE-E-24  RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-25: Edit the information in the Shipping Information section in the Create Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Edit the information in the Shipping Information section of the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. The user edits "Recipient Name"
    ...     - 2. Edit country, Address,
    ...
    ...     Expected Results:
    ...     - 1. The editted name shall be displayed
    ...     - 2. Country: should be a drop-down menu that the user can be able to select an option
    ...     - 3. Address: The web app should suggest address based on the inputs,
    ...     The user should be able to select the suggestion and the wep app should automatially fill the information in correctsponding input fields

    [Tags]    BSP-SND-TRANSFER-CREATE-E-25   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-26: Click [Create ticket] button in the Create Transfer Ticket page, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Click [Create ticket] button in the Create Transfer Ticket page,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Fill out required fields, add items to the list
    ...     - 2. Click on [Create ticket] button
    ...     - 3. Click on the [Okay] button in the modal
    ...     - 4. Click on the [Cancel] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. There shall be a message: “You are going to create this RMA request.
    ...     If you are sure you want to move forward with the action, please confirm below”.
    ...     There are 2 button, [Okay]/[Cancel]
    ...     - 3. [Okay] button: the ticket should be displayed in the pending tab, the user should be redirected to the detail page
    ...     - 4. [Cancel] button: exit the modal

    [Tags]    BSP-SND-TRANSFER-CREATE-E-26   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-27: Click [Return] button in the Create Transfer Ticket page, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Click [Return] button in the Create Transfer Ticket page,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Fill out required fields, add items to the list
    ...     - 2. Click on [Return] button
    ...     - 3. Click on the [Leave] button in the modal
    ...     - 4. Click on the [Stay] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. If there are unsaved changes and the user uses the button, there shall be a confirmation message “You have unsaved changes.
    ...     Are you sure you want to leave this page?” with “Leave” and “Stay” buttons
    ...    - 3. The “Leave” button shall redirect the user to the previous page, discarding any changes made to the page.
    ...    - 4. The “Stay” button shall exit the confirmation.

    [Tags]    BSP-SND-TRANSFER-CREATE-E-27   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-E-28: Click [Cancel] button in the Create Transfer Ticket page, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Click [Cancel] button in the Create Transfer Ticket page,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Fill out required fields, add items to the list
    ...     - 2. Click on [Cancel] button
    ...     - 3. Click on the [Leave] button in the modal
    ...     - 4. Click on the [Stay] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. If there are unsaved changes and the user uses the button, there shall be a confirmation message “You have unsaved changes.
    ...     Are you sure you want to leave this page?” with “Leave” and “Stay” buttons
    ...    - 3. The “Leave” button shall redirect the user to the previous page, discarding any changes made to the page.
    ...    - 4. The “Stay” button shall exit the confirmation.

    [Tags]    BSP-SND-TRANSFER-CREATE-E-28   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-01: Observe the Customer Information section, Create Transfer Ticket page of the Bioheart device, Facility ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer Information section
    ...
    ...     Expected Results:
    ...     - 1. There shall be the following fields in the Customer Information section
    ...     - Customer type: Facility
    ...     - Order number (Optional)
    ...     - Order date (Optional)
    ...     - 2. Facility Name

    [Tags]    BSP-SND-TRANSFER-CREATE-F-01   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-02: Observe the Items list in the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...     - 2. There are items added to the list: Bioheart bundle, Bioheart device, Bioheart strap, Bioheart charger
    ...
    ...     Test Steps:
    ...     - 1. Observe the Items list section
    ...
    ...     Expected Results:
    ...     - 1. There shall be an [Add items] button, which opens a sidebar for the user to add items to the transfer ticket
    ...     - 2. List of the items added

    [Tags]    BSP-SND-TRANSFER-CREATE-F-02   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-03: Observe the Other Information, Shipping Information in the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Other Information,Shipping Information section in the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 1. In the Other Information, there shall be:
    ...     - - Notification email textbox
    ...     - - Notes - optional
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Name
    ...     -- Recipient address
    ...     -- There shall be an option for user to choose if the shipping address is similar with the customer information
    ...     -- Country: Default is United State
    ...     -- Address
    ...     -- Secondary Address (optional)
    ...     -- City, State, Zipcode,
    ...     -- Contact phone number, Contact Email

    [Tags]    BSP-SND-TRANSFER-CREATE-F-03   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-CREATE-F-04: Input Order number, this fields is optional
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Input Oder number, this fields is optional
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Input data into the Order number
    ...
    ...     Expected Results:
    ...     - 1. The inputted value shall be displayed in the Order number textbox

    [Tags]    BSP-SND-TRANSFER-CREATE-F-04   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-05: Select Order date, this fields is optional
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Order date, this fields is optional
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Select Order date, select future date
    ...
    ...     Expected Results:
    ...     - 1. The selected date shall be displayed
	...		- 2. The user cannot select a future date

    [Tags]    BSP-SND-TRANSFER-CREATE-F-05   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-06: Remove the selected Order date
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove the selected Order date
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Select Order date, Click on remove button in the Order date box
    ...
    ...     Expected Results:
    ...     - 1. The selected date shall be removed, the textbox shall be empty

    [Tags]    BSP-SND-TRANSFER-CREATE-F-06   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-07: Select a Facility Name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select a Facility Name
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Name textbox, search and select a facility name
    ...
    ...     Expected Results:
    ...     - 1. Should be a search dropdown menu that the user should be able to select an option that the system suggests (all facilities)
	...		- 2. The selected facility shall displayed
	...		- 3. In the Shipping information section, Recipient name textbox shall take the facility name when the user selects it in the Customer information section

    [Tags]    BSP-SND-TRANSFER-CREATE-F-07   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-08: Add items to the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add items to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     - 1.There shall be a [ADD ITEMS] sidebar to add device
    ...     - 2. There shall be "Type" section contains 4 options: Bioheart bundle (Selected option), Bioheart device, Bioheart trap, Bioheart charger
    ...     - 3. There shall be "Bioheart device" textbox
    ...     - 4. There shall be "Trap size" section: Small(selected option), Medium, Large
    ...     - 5. The [Add items] button: Thiss button is disabled, by default

    [Tags]    BSP-SND-TRANSFER-CREATE-F-08   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-09: Add "Bioheart bundle" to the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart bundle" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart bundle" option
    ...     - 3. Seach and select a device ID in the "Bioheart devices" textbox
    ...     - 4. The user select 1 option out of 3 trap size option (Small/Medium/Large)
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     - The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected option shall be dispayed
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart bundle <Device ID>
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
    ...     - Bioheart strap (Small/Medium/Large size)
    ...     - Bioheart charger
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-CREATE-F-09   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-10: Add "Bioheart device" to the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart device" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart device" option
    ...     - 3. Seach and select multiple Bioheart device IDs in the "Bioheart devices" textbox
    ...     - 4. Click on a remove button on each of the selected device ID
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The user can select multiple Bioheart device IDs
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected device ID shall be removed by clicking on the [x] button on each option
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-CREATE-F-10   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-11: Add "Bioheart strap" to the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart strap" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs input a positive integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The selected option shall be displayed
    ...     - 4. The user can input a positive integer
    ...     - 5. Example: The Quantity is 4, Medium size, the list of items shall be added with format:
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)

    [Tags]    BSP-SND-TRANSFER-CREATE-F-11   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-12: Select "Bioheart strap" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart strap" then check the Quantity textbox in the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-CREATE-F-12   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-13: Add "Bioheart charger" to the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart charger" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. Inputs number of device into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 4. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The user can input a positive integer
    ...     - 4. Example: The user selects Quantity: 4, the item shall be added to the list with format:
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger

    [Tags]    BSP-SND-TRANSFER-CREATE-F-13   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-14: Select "Bioheart charger" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart charger" then check the Quantity textbox in the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-CREATE-F-14   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-15: Remove added item in the list of the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove added item
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...     - 2. There are some items added to the list
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Delete] button on every item in the list
    ...
    ...     Expected Results:
    ...     - 1. The added item shall be deleted

    [Tags]    BSP-SND-TRANSFER-CREATE-F-15   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-16: Edit Other Information section in the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Other Information section
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. The user inputs an email in to the textbox, press the [Space] or [,] to complete the email
    ...     - 2. Click on [x] button on each mail to remove it
    ...     - 3. The user input notes
    ...
    ...     Expected Results:
    ...     - 1. The email shall be displayed and seperated by [space] or [,]
    ...     - 2. The added email shall be removed by clicking on [x[ on each button
    ...     - 3. The inputted data shall be displayed

    [Tags]    BSP-SND-TRANSFER-CREATE-F-16   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-17: Turn on toggle "Same as customer address" in the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Turn on toggle "Same as customer address" in the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Turn on toggle "Same as customer address" in the Shipping information section
    ...     - 2. Observe the Shipping Information
    ...     - 3. Turn off the toggle "Same as customer address" and observe the information
    ...
    ...     Expected Results:
    ...     - 2. The Shipping information is autofilled the same address as the customer information,
    ...     -- As well as disable all fields in the shipping information section
    ...     - 3. The information shall be kept

    [Tags]    BSP-SND-TRANSFER-CREATE-F-17   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-18: Edit the information in the Shipping Information section in the Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Edit the information in the Shipping Information section of the Create Transfer Ticket page
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. The user edits "Recipient Name"
    ...     - 2. Edit country, Address,
    ...
    ...     Expected Results:
    ...     - 1. The editted name shall be displayed
    ...     - 2. Country: should be a drop-down menu that the user can be able to select an option
    ...     - 3. Address: The web app should suggest address based on the inputs,
    ...     The user should be able to select the suggestion and the wep app should automatially fill the information in correctsponding input fields

    [Tags]    BSP-SND-TRANSFER-CREATE-F-18   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-19: Edit Zipcode
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Zipcode
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...     - 2. The wep app automatially filled the information in correctsponding input fields already when the selected the address
    ...
    ...     Test Steps:
	...		- 1. Fill out all required fields, then input an invalid zipcode
	...     - 2. Click on the "Create ticket" button
    ...
    ...     Expected Results:
    ...     - 1. There is an error message "Invalid Zipcode"

    [Tags]    BSP-SND-TRANSFER-CREATE-F-19   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-20: Click [Create ticket] button in the Create Transfer Ticket page, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Click [Create ticket] button in the Create Transfer Ticket page,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Fill out required fields, add items to the list
    ...     - 2. Click on [Create ticket] button
    ...     - 3. Click on the [Okay] button in the modal
    ...     - 4. Click on the [Cancel] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. There shall be a message: “You are going to create this RMA request.
    ...     If you are sure you want to move forward with the action, please confirm below”.
    ...     There are 2 button, [Okay]/[Cancel]
    ...     - 3. [Okay] button: the ticket should be displayed in the pending tab, the user should be redirected to the detail page
    ...     - 4. [Cancel] button: exit the modal

    [Tags]    BSP-SND-TRANSFER-CREATE-F-20   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-21: Click [Return] button in the Create Transfer Ticket page, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Click [Return] button in the Create Transfer Ticket page,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Fill out required fields, add items to the list
    ...     - 2. Click on [Return] button
    ...     - 3. Click on the [Leave] button in the modal
    ...     - 4. Click on the [Stay] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. If there are unsaved changes and the user uses the button, there shall be a confirmation message “You have unsaved changes.
    ...     Are you sure you want to leave this page?” with “Leave” and “Stay” buttons
    ...    - 3. The “Leave” button shall redirect the user to the previous page, discarding any changes made to the page.
    ...    - 4. The “Stay” button shall exit the confirmation.

    [Tags]    BSP-SND-TRANSFER-CREATE-F-21   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CREATE-F-22: Click [Cancel] button in the Create Transfer Ticket page, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Click [Cancel] button in the Create Transfer Ticket page,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on Create Transfer Ticket page of the Bioheart device, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Fill out required fields, add items to the list
    ...     - 2. Click on [Cancel] button
    ...     - 3. Click on the [Leave] button in the modal
    ...     - 4. Click on the [Stay] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. If there are unsaved changes and the user uses the button, there shall be a confirmation message “You have unsaved changes.
    ...     Are you sure you want to leave this page?” with “Leave” and “Stay” buttons
    ...    - 3. The “Leave” button shall redirect the user to the previous page, discarding any changes made to the page.
    ...    - 4. The “Stay” button shall exit the confirmation.

    [Tags]    BSP-SND-TRANSFER-CREATE-F-22   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#VIEW PENDING
BSP-SND-TRANSFER-VIEW-PENDING-E-01: View header of a pending transfer ticket, customer type is End User
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the header of Transfer ticket details page
    ...     - 2. Click on the Customer hyberlink
    ...
    ...     Expected Results:
    ...     - 1. Header:
    ...     - Transfer ID
    ...     - Purpose: Transfer
    ...     - Device type: Bioheart
	...		- Customer: Name of the End user

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-E-01    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-E-02: Observe the customer information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Customer type: End User
    ...     - 2. Order number: Display the inputted order number, Displays “--” if unavailable
    ...     - 2. Order date: Display the selected order date, Displays “--” if unavailable
    ...     - 3. Customer name
	...		- 4. Contact phone number
	...		- 5. Contact email
	...		- 6. Address
	...		- 4. There shall also be an [Edit] button

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-E-02    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-E-03: Observe the items list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click on "Device ID" hyperlink
    ...
    ...     Expected Results:
    ...     - 1. Index number
	...		- 2. Item
	...		- If the item is a Bioheart device, there shall be a hyperlink to the Device details quick access
	...		- If the item is a Bioheart bundle, there shall be 3 lines of subtext:
	...		-- Bioheart device <Device ID> - The user can click on the device ID to view the device details quick access sidebar for the Bioheart device
	...		-- Bioheart strap ([Small/Medium/Large] size)
	...		-- Bioheart charger
	...		- 3. Label – displays the shipment label that the item belongs to, Display “—” if unavailable

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-E-03    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-E-04: Observe the Other information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the other information section
    ...
    ...     Expected Results:
    ...     - 1. Notification email: Display the inputted emails
	...		- 2. Display the inputted Note

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-E-04    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-E-05: Observe the Shipping Information in the Pending Transfer Ticket page of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information in the Pending Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Address
	...		-- Recipient Name:  Display the name in the "Create" page
    ...     -- Country: Display the selected Country
    ...     -- Address: Display the selected address
    ...     -- Secondary Address (optional): Display the inputted data (if any)
    ...     -- City, State, Zipcode: Display the inputted data
    ...     -- Contact phone number: dispay the inputted data
	...		-- Contact Email: dispay the inputted data

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-E-05   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-VIEW-PENDING-E-06: Observe the Tracking information section of the Pending Transfer tab (Customer type is End User)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Tracking information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on pending Transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...     - 3. There is a label created
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information section
    ...
    ...     Expected Results:
    ...     - 1.Tracking number - a hyperlink. When clicked on it should navigate the user to the Order-Shipping on Shippo site
    ...     - 2.Shipped date
    ...     - 3.Estimated arrival
    ...     - 4.Label - a hyperlink. The user should be able to download the label of the shipping by clicking on it.
    ...     - 5.The filename format should be “Transfer_<Transfer ID>_Transfer_Shipping_Label”
    ...     - 6.Carrier - total rates
    ...     - 7.Device (number of devices), list of devices included in this label
    ...     - 8.Timeline: date and status of shipping
    ...         After 120 days from the date of order creation, the timeline should no longer be visible.
	...		- 9. The user should be able to click on the Tracking Number to be redirected to the tracking site
	...		- 10. The user should be able to click on the Label to download the shipping label pdf file

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-E-06    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-01: Edit Order number, Order date in the Customer information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Customer information
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [Edit] button on the Customer Information section in a Bioheart Transfer ticket details page
	...		- 2. Observe the Customer type field
	...		- 3. Edit the Order number
	...		- 4. Edit the Order date
	...		- 5. The user click on "Save" button
	...		- 6. The user click on "Close" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be a sidebar displayed
	...		- 2. Customer type – This field is disabled and only for viewing purposes. It shall display “End User”
	...		- 3. The Order number field shall be edited, this field is optional so the user can leave this field blank and "Save"
	...		- 4. The Order date field shall be edited, this field is optional so the user can leave this field blank and "Save"
	...		- 5. The edited information shall be saved and the sidebar shall be closed
	...		- 6. The edited information shall not be saved and the sidebar shall be closed

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-01    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-02: Edit address the Customer information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Customer information
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [Edit] button on the Customer Information section in a Bioheart Transfer ticket details page
	...		- 2. Edit the Customer First Name
	...		- 3. Edit the Customer Last Name
	...		- 4. Select another country
	...		- 5. Select another Address
	...		- 6. The user click on "Save" button
	...		- 7. The user click on "Close" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be a sidebar displayed
	...		- 2. The user can edit the Customer First Name textbox
	...		- 3. The user can edit the Customer Last Name textbox
	...		- 4. There should be a drop-down menu that the user can be able to select an option. The selected country shall be displayed
	...		- 5. The web app should suggest address based on the inputs,
	...		--  The user should be able to select the suggestion and the wep app should automatially fill the information in correctsponding input fields
	...		- 6. The edited information shall be saved and the sidebar shall be closed
	...		- 7. The edited information shall not be saved and the sidebar shall be closed

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-02    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-03: Edit address the Customer information section, input invalid zipcode
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Customer information, input invalid zipcode
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [Edit] button on the Customer Information section in a Bioheart Transfer ticket details page
	...		- 2. Input invalid zipcode
	...		- 3. The user click on "Save" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be a sidebar displayed
	...		- 2. The zipcode shall be displayed
	...		- 3. There is an error message "Invalid zipcode", the user is stay on the sidebar

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-03    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-04: Add items to the pending transfer ticket of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add items to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     - 1.There shall be a [ADD ITEMS] sidebar to add device
    ...     - 2. There shall be "Type" section contains 4 options: Bioheart bundle (Selected option), Bioheart device, Bioheart trap, Bioheart charger
    ...     - 3. There shall be "Bioheart device" textbox
    ...     - 4. There shall be "Trap size" section: Small(selected option), Medium, Large
    ...     - 5. The [Add items] button: Thiss button is disabled, by default

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-04   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-05: Add "Bioheart bundle" to the pending transfer ticket of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart bundle" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart bundle" option
    ...     - 3. Seach and select a device ID in the "Bioheart devices" textbox
    ...     - 4. The user select 1 option out of 3 trap size option (Small/Medium/Large)
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected option shall be dispayed
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart bundle <Device ID>
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
    ...     - Bioheart strap (Small/Medium/Large size)
    ...     - Bioheart charger
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-05   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-06: Add "Bioheart device" to the pending transfer ticket of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart device" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart device" option
    ...     - 3. Seach and select multiple Bioheart device IDs in the "Bioheart devices" textbox
    ...     - 4. Click on a remove button on each of the selected device ID
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The user can select multiple Bioheart device IDs
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected device ID shall be removed by clicking on the [x] button on each option
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-06   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-07: Add "Bioheart strap" to the pending transfer ticket of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart strap" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs input a positive integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The selected option shall be displayed
    ...     - 4. The user can input a positive integer
    ...     - 5. Example: The Quantity is 4, Medium size, the list of items shall be added with format:
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-07   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-08: Select "Bioheart strap" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart strap" then check the Quantity textbox in the pending transfer ticket  of the Bioheart device, customer type is End User,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-08   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-09: Add "Bioheart charger" to the pending transfer ticket of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart charger" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. Inputs number of device into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...         Input negative number
    ...     - 4. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The user can input a positive integer
    ...     - 4. Example: The user selects Quantity: 4, the item shall be added to the list with format:
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-09   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-10: Select "Bioheart charger" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart charger" then check the Quantity textbox in the pending transfer ticket  of the Bioheart device, customer type is End User,
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-10   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-11: Remove added item in the list of the pending transfer ticket of the Bioheart device, customer type is End User,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove added item
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is End User,
    ...     - 2. There are some items added to the list
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Delete] button on every item in the list
    ...
    ...     Expected Results:
    ...     - 1. The added item shall be deleted

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-11   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-12: Enter emails into Notification Email textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter emails into Notification Email textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...    - 1. Observe the the email textbox
    ...    - 2. Enter one or multiple emails in the Notification email text box
    ...    - 3. Each email is separated by space bar
    ...
    ...     Expected Results:
    ...    - 1. Display the emails that is inputted when the user created the ticket
    ...     - The system shall automatically fill the following email: service@biotricity.com
    ...    - 2. The entered emails shall displayed
    ...    - 3. For each email, there shall be a [Delete] button to remove it.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-12    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-13: Remove emails in the Notification Email textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove emails in the Notification Email textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...    - 1. Click on [Delete] button on each email
    ...
    ...     Expected Results:
    ...    - 1. The email shall be removed

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-13     SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-14: Enter text into the Notes textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter text into the Notes textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...    - 1. Observe the note (the note inputted when the user created the ticket)
    ...    - 2. Enter text into the Notes textbox,
    ...    - 3. Click on [Save] button
    ...
    ...     Expected Results:
    ...    - 1. Display the note that is inputted when the user created the ticket
    ...    - 2. The entered text shall be displayed
    ...    - 3. All changes shall be saved, at the moment, a [Save] button will disappear.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-14    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-15: Observe the recipient address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the recipient address
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...    - 1. Observe the recipient address
    ...
    ...     Expected Results:
    ...    - 1. By default, all of the boxes in the address area shall be disabled.
    ...    - 2. The address information is correct

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-15   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-16: Edit the recipient address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the on the pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...    - 1.The user clicks on [Edit] button
    ...    - 2.The user selects a address
    ...
    ...     Expected Results:
    ...    - 1. All of the boxes shall be enabled for editing
    ...    - 2. A [Edit] button shall change to a [Save] button, and there is a [Cancel] button next to a [Save] button.
    ...    - 3. The web app shall suggest addresses based on the inputs of the user. The user shall select a suggestion and the web app shall automatically fill the information in the corresponding input fields.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-16   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-17: Edit the recipient address then clicks on [Save] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address then clicks on [Save] button
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...    - 1.The user edits recipient address then clicks on [Save] button
    ...
    ...     Expected Results:
    ...    - 1. All the edited data will be saved
    ...    - 2. A [Edit] button will replace a [Save] and [Cancel] button and all of the boxes shall be disabled.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-17  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-18: Edit recipient address, input invalid zipcode
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit recipient address, input invalid zipcode
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [Edit] button on the Shipping Information section
	...		- 2. Input invalid zipcode
	...		- 3. The user click on "Save" button
    ...
    ...     Expected Results:
    ...     - 1. All of the boxes shall be enabled for editing
	...		- 2. The zipcode shall be displayed
	...		- 3. There shall be an error message "Invalid zipcode"

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-18    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-E-19: Edit the recipient address then clicks on [Cancel] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address then clicks on [Cancel] button
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...    - 1.The user edits recipient address then clicks on [Cancel] button
    ...
    ...     Expected Results:
    ...    - 1. The user can exit edit mode
    ...    - 2. A [Edit] button will replace a [Save] and [Cancel] button and all of the boxes shall be disabled.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-E-19  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-F-01: View header of a pending transfer ticket, customer type is Facility
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the header of Transfer ticket details page
    ...     - 2. Click on the Customer hyberlink
    ...
    ...     Expected Results:
    ...     - 1. Header:
    ...     - Transfer ID
    ...     - Purpose: Transfer
    ...     - Device type: Bioheart
	...		- Customer: Name of the Facility
    ...     - 2. The user should be able to click on the Customer to view its details in the Facility quick access side panel or End User quick access side panel

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-F-01    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-F-02: Observe the customer information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Customer type: Facility
    ...     - 2. Order number: Display the inputted order number, Displays “--” if unavailable
    ...     - 2. Order date: Display the selected order date, Displays “--” if unavailable
    ...     - 3. Customer name: facility name. There should be a hyperlink to quick access to Facility Information
	...		- 4. There shall also be an [Edit] button

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-F-02    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-F-03: Observe the items list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending Transfer ticket, S&D Portal
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Click on "Device ID" hyperlink
    ...
    ...     Expected Results:
    ...     - 1. Index number
	...		- 2. Item
	...		- If the item is a Bioheart device, there shall be a hyperlink to the Device details quick access
	...		- If the item is a Bioheart bundle, there shall be 3 lines of subtext:
	...		-- Bioheart device <Device ID> - The user can click on the device ID to view the device details quick access sidebar for the Bioheart device
	...		-- Bioheart strap ([Small/Medium/Large] size)
	...		-- Bioheart charger
	...		- 3. Label – displays the shipment label that the item belongs to,  Display “—” if unavailable

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-F-03    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-F-04: Observe the Other information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the other information section
    ...
    ...     Expected Results:
    ...     - 1. Notification email: Display the inputted emails
	...		- 2. Display the inputted Note

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-F-04    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-F-05: Observe the Shipping Information in the Pending Transfer Ticket page of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information in the Pending Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Address
	...		-- Recipient Name:  Display the name in the "Create" page (the name of the facility or the edited name)
    ...     -- Country: Display the selected Country
    ...     -- Address: Display the selected address
    ...     -- Secondary Address (optional): Display the inputted data (if any)
    ...     -- City, State, Zipcode: Display the inputted data
    ...     -- Contact phone number: dispay the inputted data
	...		-- Contact Email: dispay the inputted data

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-F-05   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-VIEW-PENDING-F-06: Observe the Tracking information section of the Pending Transfer tab (Customer type is Facility)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Tracking information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on pending Transfer ticket, S&D Portal
    ...     - 2. Customer type is Facility
    ...     - 3. There is a lable created
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information section
    ...
    ...     Expected Results:
    ...     - 1.Tracking number - a hyperlink. When clicked on it should navigate the user to the Order-Shipping on Shippo site
    ...     - 2.Shipped date
    ...     - 3.Estimated arrival
    ...     - 4.Label - a hyperlink. The user should be able to download the label of the shipping by clicking on it.
    ...     - 5.The filename format should be “Transfer_<Transfer ID>_Transfer_Shipping_Labe”
    ...     - 6.Carrier - total rates
    ...     - 7.Device (number of devices), list of devices included in this label
    ...     - 8.Timeline: date and status of shipping
    ...         After 120 days from the date of order creation, the timeline should no longer be visible.
	...		- 9. The user should be able to click on the Tracking Number to be redirected to the tracking site
	...		- 10. The user should be able to click on the Label to download the shipping label pdf file

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-F-06    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-01: Edit the Customer information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Customer information
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [Edit] button on this section in a Bioheart Transfer ticket details page
	...		- 2. Observe the Customer type field
	...		- 3. Edit the Order number (optional)
	...		- 4. Edit the Order date (optional)
	...		- 5. The user click on "Save" button
	...		- 6. The user click on "Close" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be a sidebar displayed
	...		- 2. Customer type – This field is disabled and only for viewing purposes. It shall display “Facility”
	...		- 3. The Order number field shall be edited, this field is optional so the user can leave this field blank and "Save"
	...		- 4. The Order date field shall be edited, this field is optional so the user can leave this field blank and "Save"
	...		- 5. The edited information shall be saved and the sidebar shall be closed
	...		- 6. The edited information shall not be saved and the sidebar shall be closed


    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-01    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-02: Add items to the pending transfer ticket of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add items to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OMis on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     - 1.There shall be a [ADD ITEMS] sidebar to add device
    ...     - 2. There shall be "Type" section contains 4 options: Bioheart bundle (Selected option), Bioheart device, Bioheart trap, Bioheart charger
    ...     - 3. There shall be "Bioheart device" textbox
    ...     - 4. There shall be "Trap size" section: Small(selected option), Medium, Large
    ...     - 5. The [Add items] button: Thiss button is disabled, by default

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-02   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-03: Add "Bioheart bundle" to the pending transfer ticket of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart bundle" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart bundle" option
    ...     - 3. Seach and select a device ID in the "Bioheart devices" textbox
    ...     - 4. The user select 1 option out of 3 trap size option (Small/Medium/Large)
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected option shall be dispayed
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart bundle <Device ID>
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
    ...     - Bioheart strap (Small/Medium/Large size)
    ...     - Bioheart charger
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-03   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-04: Add "Bioheart device" to the pending transfer ticket of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart device" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart device" option
    ...     - 3. Seach and select multiple Bioheart device IDs in the "Bioheart devices" textbox
    ...     - 4. Click on a remove button on each of the selected device ID
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The user can select multiple Bioheart device IDs
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected device ID shall be removed by clicking on the [x] button on each option
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the transfer ticket

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-04   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-05: Add "Bioheart strap" to the pending transfer ticket of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart strap" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs input a positive integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The selected option shall be displayed
    ...     - 4. The user can input a positive integer
    ...     - 5. Example: The Quantity is 4, Medium size, the list of items shall be added with format:
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)
    ...     - Bioheart Strap (Medium size)

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-05   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-06: Select "Bioheart strap" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart strap" then check the Quantity textbox in the pending transfer ticket  of the Bioheart device, customer type is Facility,
    ...
    ...     Precondition:
    ...     - 1. The OS or OMis on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-06   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-07: Add "Bioheart charger" to the pending transfer ticket of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart charger" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OMis on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. Inputs number of device into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...         Input negative number
    ...     - 4. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The user can input a positive integer
    ...     - 4. Example: The user selects Quantity: 4, the item shall be added to the list with format:
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-07   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-08: Select "Bioheart charger" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart charger" then check the Quantity textbox in the pending transfer ticket  of the Bioheart device, customer type is Facility,
    ...
    ...     Precondition:
    ...     - 1. The OS or OMis on the Pending transfer ticket detail page, customer type is Facility,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-08   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-09: Remove added item in the list of the pending transfer ticket of the Bioheart device, customer type is Facility,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove added item
    ...
    ...     Precondition:
    ...     - 1. The OS or OMis on the Pending transfer ticket detail page, customer type is Facility,
    ...     - 2. There are some items added to the list
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Delete] button on every item in the list
    ...
    ...     Expected Results:
    ...     - 1. The added item shall be deleted

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-09   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-10: Enter emails into Notification Email textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter emails into Notification Email textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...    - 1. Observe the the email textbox
    ...    - 2. Enter one or multiple emails in the Notification email text box
    ...    - 3. Each email is separated by space bar
    ...
    ...     Expected Results:
    ...    - 1. Display the emails that is inputted when the user created the ticket
    ...     - The system shall automatically fill the following email: service@biotricity.com
    ...    - 2. The entered emails shall displayed
    ...    - 3. For each email, there shall be a [Delete] button to remove it.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-10    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-11: Remove emails in the Notification Email textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove emails in the Notification Email textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...    - 1. Click on [Delete] button on each email
    ...
    ...     Expected Results:
    ...    - 1. The email shall be removed

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-11     SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-12: Enter text into the Notes textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter text into the Notes textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is Facility)
    ...
    ...     Test Steps:
    ...    - 1. Observe the note (the note inputted when the user created the ticket)
    ...    - 2. Enter text into the Notes textbox,
    ...    - 3. Click on [Save] button
    ...
    ...     Expected Results:
    ...    - 1. Display the note that is inputted when the user created the ticket
    ...    - 2. The entered text shall be displayed
    ...    - 3. All changes shall be saved, at the moment, a [Save] button will disappear.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-12    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-13: Observe the recipient address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the recipient address
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...    - 1.Observe the recipient address
    ...
    ...     Expected Results:
    ...    - 1. By default, all of the boxes in the address area shall be disabled.
    ...    - 2. The address information is correct

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-13   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-14: Edit the recipient address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...    - 1.The user clicks on [Edit] button
    ...    - 2.The user selects a address
    ...
    ...     Expected Results:
    ...    - 1. All of the boxes shall be enabled for editing
    ...    - 2. A [Edit] button shall change to a [Save] button, and there is a [Cancel] button next to a [Save] button.
    ...    - 3. The web app shall suggest addresses based on the inputs of the user. The user shall select a suggestion and the web app shall automatically fill the information in the corresponding input fields.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-14   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-15: Edit the recipient address then clicks on [Save] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address then clicks on [Save] button
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...    - 1.The user edits recipient address then clicks on [Save] button
    ...
    ...     Expected Results:
    ...    - 1. All the edited data will be saved
    ...    - 2. A [Edit] button will replace a [Save] and [Cancel] button and all of the boxes shall be disabled.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-15  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-F-16: Edit the recipient address then clicks on [Cancel] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address then clicks on [Cancel] button
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...    - 1.The user edits recipient address then clicks on [Cancel] button
    ...
    ...     Expected Results:
    ...    - 1. The user can exit edit mode
    ...    - 2. A [Edit] button will replace a [Save] and [Cancel] button and all of the boxes shall be disabled.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-F-16   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-COMPLETE-01: Complete the Transfer ticket, customer type is End User
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete the Transfer ticket, customer type is End User
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is End User
	...		- 3. There are items added: Bioheart bundle, Bioheart device,
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Mark complete] button
	...		- 2. Click on "Confirm" button in the confirmation pop-up
	...		- 3. In the case the user click on "Cancel" button in the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation pop-up "You are going to complete this Device Transfer.
	...		If you are sure you want to move forward with the action, please confirm below."
	...		- 2. The location of the Bioheart device change from "Inventory" to "End User"
	...		-- The ticket shall be moved to Completed tab
	...		- 3. The pop-up shall be closed, the user is on the pending ticket

    [Tags]    BSP-SND-TRANSFER-COMPLETE-01   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-COMPLETE-02: Complete the Transfer ticket, customer type is Facility
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete the Transfer ticket, customet type is Facility
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is Facility
	...		- 3. There are items added: Bioheart bundle, Bioheart device,
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Mark complete] button
	...		- 2. Click on "Confirm" button in the confirmation pop-up
	...		- 3. In the case the user click on "Cancel" button in the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation pop-up "You are going to complete this Device Transfer.
	...		If you are sure you want to move forward with the action, please confirm below."
	...		- 2. The location of the Bioheart device change from "Inventory" to "Facility"
    ...     -- The Device belongs to the Facility of the ticket
	...		-- The ticket shall be moved to Completed tab
	...		- 3. The pop-up shall be closed, the user is on the pending ticket

    [Tags]    BSP-SND-TRANSFER-COMPLETE-02   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#SHIPMENT
BSP-SND-TRANSFER-SHIPMENT-E-01: Creat shipment order,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete the Transfer ticket, customer type is End User
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is End User
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
    ...     - 1. [Create Shipment Order] button
	...		- 2. The user selects Shipment date
	...		- 3. Observe the Pakage field
	...		- 4. Select a Package option (not Custom Dimensions)

    ...     Expected Results:
    ...     - 1. When clicked on [Create Shipment Order] button should navigate the user to the Create Shipment order page.
	...		- 2. The user only selects the shipment date within 7 days from the current date. The selected date shall be displayed
	...		- 3. By default, the option should be “Custom Dimensions”.
	...		- 4. In the dropdown box, there should be a list of package templates, the selected option shall be displayed
	...		 - Once the user has filled in all the data, the web app should show all the Rate options that include information:
	...		 - Carriers
	...		 - Fee – should always display hundredth decimal number
	...		 - Time (days)
	...		 - If the web app cannot show the Rates, there should be a message: “Something went wrong. Please check your information and try again.”

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-01  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-02: Fill out the Dimensions
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Fill out the Dimensions
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
	...		- 1. Fill out Dimension (Length x Width x Height)
	...		- 2. Weight (lbs)
	...		- 3. Click on [Apply] button

    ...     Expected Results:
    ...     - 1. The [Apply] button should be disable until the user enters all required data
	...		 - Once the user has filled in all the data, the web app should show all the Rate options that include information:
	...		 - Carriers
	...		 - Fee – should always display hundredth decimal number
	...		 - Time (days)
	...		 - If the web app cannot show the Rates, there should be a message: “Something went wrong. Please check your information and try again.”

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-02  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-03: Observe and edit the Items section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe and edit the Items section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
	...		- 1. Observe the Items section
	...		- 2. Deslect "All items" checkbox
	...		- 3. Deselect the checkbox of an item

    ...     Expected Results:
    ...     - 1. The user should be able to select devices assigned to the shipment order that they want to ship.
	...		- There shall be all items in the ticket displayed, all items are selected by default
	...		- 2. All the items shall be deselected
	...		- 3. That item shall be deseleted

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-03  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-04: Observe Sender information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe Sender information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
	...		- 1. Observe Sender information section

    ...     Expected Results:
    ...     - 1. The web app should get Biotricity Productions information automatically and display it with the following details:
    ...     - Transfer [Transfer ID] - Biotricity’s name
    ...     - Biotricity’s address
    ...     - Contact phone number
    ...     - Contact mail

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-04  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-05: Edit the Sender information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Sender information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Sender information section
	...		- 2. Edit "Name"
	...		- 3. Edit "Country"
	...		- 4. Edit "Address"
	...		- 5. Edit "Secondary address"
	...		- 6. Edit "Contact phone number", input valid value
	...		- 7. Edit "Contact phone email", input valid value
	...		- 8. Click on [Finish] button in the modal
	...		- 9. Click on [Cancel] button or [X] button in the modal

    ...     Expected Results:
    ...     - 2. The edited data shall be displayed
	...		- 3. The selected country shall be displayed
	...		- 4. The the web app should suggest addresses based on the inputs of the user.
	...		- The user should select a suggestion and the web app should automatically fill the information in corresponding input fields.
	...		- 5. The user can manually input the secondary address
	...		- 6. The inputted Contact phone number shall be displayed
	...		- 7. The inputted Contact email shall be displayed
	...		- 8. The edited information shall be saved
	...		- 9. The modal shall be closed, the changes are not saved

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-05  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-06: Edit the Sender information section, input invalid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Sender information section, input invalid value
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Sender information section
	...		- 2. Input Invalid zipcode
	...		- 3. Input invalid Contact phone number
	...		- 4. Input invalid email
	...		- 5. Click on "Finish" button
	...
    ...     Expected Results:
    ...     - There shall be error message displayed "invalid value" under the field "Contact phone number", "Contact email", "Zipcode"

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-06  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-07: Observe Recipient information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe Recipient information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
	...		- 1. Observe Recipient information section
	...
    ...     Expected Results:
    ...     - 1. The web app should get End User information automatically and display it with the following details:
    ...     - Transfer [Transfer ID] – End User’s name
    ...     - End User’s address

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-07  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-08: Edit the Recipient information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Recipient information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Recipient information section
	...		- 2. Edit "Name"
	...		- 3. Edit "Country"
	...		- 4. Edit "Address"
	...		- 5. Edit "Secondary address"
	...		- 6. Edit "Contact phone number", input valid value
	...		- 7. Edit "Contact phone email", input valid value
	...		- 8. Click on [Finish] button in the modal
	...		- 9. Click on [Cancel] button or [X] button in the modal

    ...     Expected Results:
    ...     - 2. The edited data shall be displayed
	...		- 3. The selected country shall be displayed
	...		- 4. The the web app should suggest addresses based on the inputs of the user.
	...		- The user should select a suggestion and the web app should automatically fill the information in corresponding input fields.
	...		- 5. The user can manually input the secondary address
	...		- 6. The inputted Contact phone number shall be displayed
	...		- 7. The inputted Contact email shall be displayed
	...		- 8. The edited information shall be saved
	...		- 9. The modal shall be closed, the changes are not saved

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-08  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-09: Edit the Recipient information section, input invalid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Recipient information section, input invalid value
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Recipient information section
	...		- 2. Input Invalid zipcode
	...		- 3. Input invalid Contact phone number
	...		- 4. Input invalid email
	...		- 5. Click on "Finish" button

    ...     Expected Results:
    ...     - There shall be error message displayed "invalid value" under the field "Contact phone number", "Contact email", "Zipcode"

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-09  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-E-10: Observe the Review modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Observe the Review modal
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
	...		- 1. The User selects an Rate option
	...		- 2. Click on the [Preview] button
	...		- 3. Click on [Back] button in the Review modal
	...		- 4. Click on the [Purchase] button, (If the order should be successful)
	...		- 5. Click on the [Purchase] button, (If the order should be fail)

    ...     Expected Results:
    ...     - 1. By default, the button should be disabled until the user selects the rate.
	...		- Once the rate should be selected, the button should be enabled.
	...		- 2. The pop-up review should display when the [Preview] button should be clicked on,
	...		- 3. The Preview modal shall be closed
	...		- 4. The shippment order is placed and the user shall be redirected to the detail page,
	...		 There is an successful message to notify
	...		- 5. There is a error message to notify

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-E-10  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-01: Creat shipment order,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete the Transfer ticket, customet type is Facility
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. Customer type is Facility
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
    ...     - 1. [Create Shipment Order] button
	...		- 2. The user selects Shipment date
	...		- 3. Observe the Pakage field
	...		- 4. Select a Package option (not Custom Dimensions)

    ...     Expected Results:
    ...     - 1. When clicked on [Create Shipment Order] button should navigate the user to the Create Shipment order page.
	...		- 2. The user only selects the shipment date within 7 days from the current date. The selected date shall be displayed
	...		- 3. By default, the option should be “Custom Dimensions”.
	...		- 4. In the dropdown box, there should be a list of package templates, the selected option shall be displayed
	...		 - Once the user has filled in all the data, the web app should show all the Rate options that include information:
	...		 - Carriers
	...		 - Fee – should always display hundredth decimal number
	...		 - Time (days)
	...		 - If the web app cannot show the Rates, there should be a message: “Something went wrong. Please check your information and try again.”

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-01  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-02: Fill out the Dimensions
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Fill out the Dimensions
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
	...		- 1. Fill out Dimension (Length x Width x Height)
	...		- 2. Weight (lbs)
	...		- 3. Click on [Apply] button

    ...     Expected Results:
    ...     - 1. The [Apply] button should be disable until the user enters all required data
	...		 - Once the user has filled in all the data, the web app should show all the Rate options that include information:
	...		 - Carriers
	...		 - Fee – should always display hundredth decimal number
	...		 - Time (days)
	...		 - If the web app cannot show the Rates, there should be a message: “Something went wrong. Please check your information and try again.”

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-02  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-03: Observe and edit the Items section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe and edit the Items section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
	...		- 1. Observe the Items section
	...		- 2. Deslect "All items" checkbox
	...		- 3. Deselect the checkbox of an item

    ...     Expected Results:
    ...     - 1. The user should be able to select devices assigned to the shipment order that they want to ship.
	...		- There shall be all items in the ticket displayed, all items are selected by default
	...		- 2. All the items shall be deselected
	...		- 3. That item shall be deseleted

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-03  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-04: Observe Sender information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe Sender information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
	...		- 1. Observe Sender information section

    ...     Expected Results:
    ...     - 1. The web app should get Biotricity Productions information automatically and display it with the following details:
    ...     - Transfer [Transfer ID] - Biotricity’s name
    ...     - Biotricity’s address
    ...     - Contact phone number
    ...     - Contact mail

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-04  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-05: Edit the Sender information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Sender information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Sender information section
	...		- 2. Edit "Name"
	...		- 3. Edit "Country"
	...		- 4. Edit "Address"
	...		- 5. Edit "Secondary address"
	...		- 6. Edit "Contact phone number", input valid value
	...		- 7. Edit "Contact phone email", input valid value
	...		- 8. Click on [Finish] button in the modal
	...		- 9. Click on [Cancel] button or [X] button in the modal

    ...     Expected Results:
    ...     - 2. The edited data shall be displayed
	...		- 3. The selected country shall be displayed
	...		- 4. The the web app should suggest addresses based on the inputs of the user.
	...		- The user should select a suggestion and the web app should automatically fill the information in corresponding input fields.
	...		- 5. The user can manually input the secondary address
	...		- 6. The inputted Contact phone number shall be displayed
	...		- 7. The inputted Contact email shall be displayed
	...		- 8. The edited information shall be saved
	...		- 9. The modal shall be closed, the changes are not saved

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-05  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-06: Edit the Sender information section, input invalid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Sender information section, input invalid value
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Sender information section
	...		- 2. Input Invalid zipcode
	...		- 3. Input invalid Contact phone number
	...		- 4. Input invalid email
	...		- 5. Click on "Finish" button

    ...     Expected Results:
    ...     - There shall be error message displayed "invalid value" under the field "Contact phone number", "Contact email", "Zipcode"

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-06  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-07: Observe Recipient information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe Recipient information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
	...		- 1. Observe Recipient information section

    ...     Expected Results:
    ...     - 1. The web app should get Facility information automatically and display it with the following details:
    ...     - Transfer [Transfer ID] – Facility’s name
    ...     - Facility’s address

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-07  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-08: Edit the Recipient information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Recipient information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Recipient information section
	...		- 2. Edit "Name"
	...		- 3. Edit "Country"
	...		- 4. Edit "Address"
	...		- 5. Edit "Secondary address"
	...		- 6. Edit "Contact phone number", input valid value
	...		- 7. Edit "Contact phone email", input valid value
	...		- 8. Click on [Finish] button in the modal
	...		- 9. Click on [Cancel] button or [X] button in the modal

    ...     Expected Results:
    ...     - 2. The edited data shall be displayed
	...		- 3. The selected country shall be displayed
	...		- 4. The the web app should suggest addresses based on the inputs of the user.
	...		- The user should select a suggestion and the web app should automatically fill the information in corresponding input fields.
	...		- 5. The user can manually input the secondary address
	...		- 6. The inputted Contact phone number shall be displayed
	...		- 7. The inputted Contact email shall be displayed
	...		- 8. The edited information shall be saved
	...		- 9. The modal shall be closed, the changes are not saved

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-08  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-09: Edit the Recipient information section, input invalid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Recipient information section, input invalid value
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Recipient information section
	...		- 2. Input Invalid zipcode
	...		- 3. Input invalid Contact phone number
	...		- 4. Input invalid email
	...		- 5. Click on "Finish" button

    ...     Expected Results:
    ...     - There shall be error message displayed "invalid value" under the field "Contact phone number", "Contact email", "Zipcode"

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-09  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-F-10: Observe the Review modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Observe the Review modal
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the Pending transfer ticket
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
	...		- 1. The User selects an Rate option
	...		- 2. Click on the [Preview] button
	...		- 3. Click on [Back] button in the Review modal
	...		- 4. Click on the [Purchase] button, (If the order should be successful)
	...		- 5. Click on the [Purchase] button, (If the order should be fail)

    ...     Expected Results:
    ...     - 1. By default, the button should be disabled until the user selects the rate.
	...		- Once the rate should be selected, the button should be enabled.
	...		- 2. The pop-up review should display when the [Preview] button should be clicked on,
	...		- 3. The Preview modal shall be closed
	...		- 4. The shippment order is placed and the user shall be redirected to the detail page,
	...		 There is an successful message to notify
	...		- 5. There is a error message to notify

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-F-10  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-E-01: Observe the “Email” modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the “Email” modal
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. There is at least 1 shipment lable created
	...		- 3. Customer type is "End User"
    ...
    ...     Test Steps:
	...		- 1. Click on [Mail] button next to the label

    ...     Expected Results:
    ...     - 1. Upon clicking on it, there should be an “Email” modal displayed.
    ...     - In the modal, there should be:
    ...     - “To” textbox
    ...     - “Subject” textbox
    ...     - Mail body textbox
    ...     - [Cancel] button
    ...     - [Send] button
	...		- Subject: Transfer [Transfer ID] - Transfer Shipment label
	...		- Mail body textbox should contain this mail template
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Transfer <Transfer ID> with item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Transfer_ [Transfer ID] _Transfer_Shipment_Label"

    [Tags]    BSP-SND-TRANSFER-EMAIL-E-01  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-E-02: Send shipment email manually
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Send shipment email manually
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. There is at least 1 shipment lable created
	...		- 3. Customer type is "End User"
    ...
    ...     Test Steps:
	...		- Click on [Mail] button next to the label
    ...     - In the modal:
    ...     - Fill emails into the “To” textbox
    ...     - Fill out the “Subject” textbox
    ...     - 1. Click on the [Send] button
	...		- 2. Click on the [Cancel] button

    ...     Expected Results:
	...		- 1. There shall be an email send to the email address in the “To” textbox
	...		- Subject: Transfer [Transfer ID] - Transfer Shipment label
	...		- Mail body textbox should contain this mail template:
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Transfer <Transfer ID> with item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Transfer_ [Transfer ID] _Transfer_Shipment_Label"
	...		- 2. The email modal shall be closed

    [Tags]    BSP-SND-TRANSFER-EMAIL-E-02  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-E-03: Automatically send notification emails when the Shipment Order created
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when the Shipment Order created
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
	...		- 2. Customer type is "End User"
    ...
    ...     Test Steps:
	...		- 1. The user create a shipment order

    ...     Expected Results:
    ...     - 1. When the order should be created successfully, there should be a mail that will be sent to people in the [Notification email].
	...		- Subject: Transfer [Transfer ID] - Transfer Shipment label
	...		- Mail body textbox should contain this mail template
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Transfer <Transfer ID> that contains [number] item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Transfer_ [Transfer ID] _Transfer_Shipment_Label"

    [Tags]    BSP-SND-TRANSFER-EMAIL-E-03  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-E-04: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
	...		- 2. There is a shipment order created
	...		- 3. Customer type is "End User"
    ...
    ...     Test Steps:
	...		- 1.When the shipment of the Transfer ticket is delivered,

    ...     Expected Results:
    ...     - 1. There should be an email automatically sent to the service@biotricity with the following content
	...		- Subject: Transfer [Transfer ID] - Transfer Delivery confirmation
	...		- Mail body textbox should contain this mail template
	...		-- "Hi,
	...		-- A shipment order of Transfer <TransferID> has been delivered to <Recipient Address> at <Time - Date> via <Carrier>.
	...		-- [List of devices/items]
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Biotricity"

    [Tags]    BSP-SND-TRANSFER-EMAIL-E-04  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-E-05: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
	...		- 2. There is a shipment order created
	...		- 3. Customer type is "End User"
    ...
    ...     Test Steps:
	...		- 1.When the shipment of the Transfer ticket is delivered,

    ...     Expected Results:
    ...     - 1. There should be an email automatically sent to the service@biotricity with the following content
	...		- Subject: Transfer [Transfer ID] - Transfer Delivery confirmation
	...		- Mail body textbox should contain this mail template
	...		-- "Hi,
	...		-- A shipment order of Transfer <TransferID> has been delivered to <Recipient Address> at <Time - Date> via <Carrier>.
	...		-- [List of devices/items]
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Biotricity"

    [Tags]    BSP-SND-TRANSFER-EMAIL-E-05  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-F-01: Observe the “Email” modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the “Email” modal
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. There is at least 1 shipment lable created
	...		- 3. Customer type is "Facility"
    ...
    ...     Test Steps:
	...		- 1. Click on [Mail] button next to the label

    ...     Expected Results:
    ...     - 1. Upon clicking on it, there should be an “Email” modal displayed.
    ...     - In the modal, there should be:
    ...     - “To” textbox
    ...     - “Subject” textbox
    ...     - Mail body textbox
    ...     - [Cancel] button
    ...     - [Send] button
	...		- Subject: Transfer [Transfer ID] - Transfer Shipment label
	...		- Mail body textbox should contain this mail template
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Transfer <Transfer ID> with item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Transfer_ [Transfer ID] _Transfer_Shipment_Label"

    [Tags]    BSP-SND-TRANSFER-EMAIL-F-01  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-F-02: Send shipment email manually
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Send shipment email manually
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
    ...     - 2. There is at least 1 shipment lable created
	...		- 3. Customer type is "Facility"
    ...
    ...     Test Steps:
	...		- Click on [Mail] button next to the label
    ...     - In the modal:
    ...     - Fill emails into the “To” textbox
    ...     - Fill out the “Subject” textbox
    ...     - 1. Click on the [Send] button
	...		- 2. Click on the [Cancel] button

    ...     Expected Results:
	...		- 1. There shall be an email send to the email address in the “To” textbox
	...		- Subject: Transfer [Transfer ID] - Transfer Shipment label
	...		- Mail body textbox should contain this mail template:
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Transfer <Transfer ID> with item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Transfer_ [Transfer ID] _Transfer_Shipment_Label"
	...		- 2. The email modal shall be closed

    [Tags]    BSP-SND-TRANSFER-EMAIL-F-02  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-F-03: Automatically send notification emails when the Shipment Order created
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when the Shipment Order created
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
	...		- 2. Customer type is "Facility"
    ...
    ...     Test Steps:
	...		- 1. The user create a shipment order

    ...     Expected Results:
    ...     - 1. When the order should be created successfully, there should be a mail that will be sent to people in the [Notification email].
	...		- Subject: Transfer [Transfer ID] - Transfer Shipment label
	...		- Mail body textbox should contain this mail template
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Transfer <Transfer ID> that contains [number] item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Transfer_ [Transfer ID] _Transfer_Shipment_Label"

    [Tags]    BSP-SND-TRANSFER-EMAIL-F-03  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-F-04: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
	...		- 2. There is a shipment order created
	...		- 3. Customer type is "Facility"
    ...
    ...     Test Steps:
	...		- 1.When the shipment of the Transfer ticket is delivered,

    ...     Expected Results:
    ...     - 1. There should be an email automatically sent to the service@biotricity with the following content
	...		- Subject: Transfer [Transfer ID] - Transfer Delivery confirmation
	...		- Mail body textbox should contain this mail template
	...		-- "Hi,
	...		-- A shipment order of Transfer <TransferID> has been delivered to <Recipient Address> at <Time - Date> via <Carrier>.
	...		-- [List of devices/items]
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Biotricity"

    [Tags]    BSP-SND-TRANSFER-EMAIL-F-04  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-F-05: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Pending transfer ticket
	...		- 2. There is a shipment order created
	...		- 3. Customer type is "Facility"
    ...
    ...     Test Steps:
	...		- 1.When the shipment of the Transfer ticket is delivered,

    ...     Expected Results:
    ...     - 1. There should be an email automatically sent to the service@biotricity with the following content
	...		- Subject: Transfer [Transfer ID] - Transfer Delivery confirmation
	...		- Mail body textbox should contain this mail template
	...		-- "Hi,
	...		-- A shipment order of Transfer <TransferID> has been delivered to <Recipient Address> at <Time - Date> via <Carrier>.
	...		-- [List of devices/items]
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Biotricity"

    [Tags]    BSP-SND-TRANSFER-EMAIL-F-05  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-01: View header of a pending Bioheart Device Sales ticket,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Bioheart Device Sales ticket, S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the header of Transfer ticket details page
    ...     - 2. Click on the Customer hyberlink
    ...
    ...     Expected Results:
    ...     - 1. Header:
    ...     - Transfer ID
    ...     - Purpose: Device Sales
    ...     - Device type: Bioheart
	...		- Customer: Name of the End user

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-01    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-02: Observe the Order information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Bioheart Device Sales ticket, S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Customer type – should be “End User”
    ...     - 2. Order number: Display the order number
    ...     - 2. Order Date: Display the order date,
	...		- 3. Order items – display a list of item types and their quantity ordered upon checkout on the e-commerce web app
    ...     - 3. Customer name
	...		- 4. Contact phone number
	...		- 5. Contact email
	...		- 6. Address

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-02    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-03: Observe the Other information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket, S&D Portal
    ...     - 2.
    ...
    ...     Test Steps:
    ...     - 1. Observe the other information section
    ...
    ...     Expected Results:
    ...     - 1. Notification email: Display the inputted emails
	...		- 2. Display the inputted Note

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-03    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-04: Observe the Shipping Information in the pending Bioheart Device Sales ticket page of the Bioheart device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information in the pending Bioheart Device Sales ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page, ,
    ...
    ...     Test Steps:
    ...     - 1. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 1. In the Shipping Information: Display the information that the user input in the Check out Page, Bioheart E-commerce portal
    ...     -- Recipient Address
    ...     -- Country: Display the selected Country
    ...     -- Address: Display the selected address
    ...     -- Secondary Address (optional): Display the inputted data (if any)
    ...     -- City, State, Zipcode: Display the inputted data
    ...     -- Contact phone number: dispay the inputted data
	...		-- Contact Email: dispay the inputted data

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-04   RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-05: Observe the Tracking information section of the Pending Transfer tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Tracking information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on pending Bioheart Device Sales ticket, S&D Portal
    ...     - 2.
    ...     - 3. There is a lable created
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information section
    ...
    ...     Expected Results:
    ...     - 1.Tracking number - a hyperlink. When clicked on it should navigate the user to the Order-Shipping on Shippo site
    ...     - 2.Shipped date
    ...     - 3.Estimated arrival
    ...     - 4.Label - a hyperlink. The user should be able to download the label of the shipping by clicking on it.
    ...     - 5.The filename format should be “Device_Sales_<Sales order ID>_Transfer_Shipment_Label.pdf”
    ...     - 6.Carrier - total rates
    ...     - 7.Device (number of devices), list of devices included in this label
    ...     - 8.Timeline: date and status of shipping
    ...         After 120 days from the date of order creation, the timeline should no longer be visible.
	...		- 9. The user should be able to click on the Tracking Number to be redirected to the tracking site
	...		- 10. The user should be able to click on the Label to download the shipping label pdf file

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-BHSALE-05    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-01: Add items to the pending Bioheart Device Sales ticket of the Bioheart device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add items to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page, ,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     - 1.There shall be a [ADD ITEMS] sidebar to add device
    ...     - 2. There shall be "Type" section contains 4 options: Bioheart bundle (Selected option), Bioheart device, Bioheart trap, Bioheart charger
    ...     - 3. There shall be "Bioheart device" textbox
    ...     - 4. There shall be "Trap size" section: Small(selected option), Medium, Large
    ...     - 5. The [Add items] button: Thiss button is disabled, by default
	...		- if the item being added exceeds the amount requested in the order, there shall be an error “Item exceeds the requested amount in the order.”
	...		- if the item being added has its size different from the Order item, there shall be an error " Item is not requested in the order"

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-01   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-02: Add "Bioheart bundle (Small)" to the pending Bioheart Device Sales ticket of the Bioheart device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart bundle" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page,
	...		- 2. The Order contains item "Biheart bundle (Small)"
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart bundle" option
    ...     - 3. Seach and select a device ID in the "Bioheart devices" textbox
    ...     - 4. The user select "Small" in the trap size option
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected option shall be dispayed
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart bundle <Device ID>
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
    ...     - Bioheart strap (Small size)
    ...     - Bioheart charger
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the Bioheart Device Sales ticket
	...		- if the item being added exceeds the amount requested in the order, there shall be an error “Item exceeds the requested amount in the order.”
	...		- if the item being added has its size different from the Order item, there shall be an error " Item is not requested in the order"

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-02   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-03: Add "Bioheart bundle(Medium)" to the pending Bioheart Device Sales ticket of the Bioheart device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart bundle(Medium)" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page,
	...		- 2. The Order contains item "Biheart bundle (Medium))"
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart bundle" option
    ...     - 3. Seach and select a device ID in the "Bioheart devices" textbox
    ...     - 4. The user select (Medium) in the trap size option
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected option shall be dispayed
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart bundle <Device ID>
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
    ...     - Bioheart strap (Medium size)
    ...     - Bioheart charger
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the Bioheart Device Sales ticket
	...		- if the item being added exceeds the amount requested in the order, there shall be an error “Item exceeds the requested amount in the order.”
	...		- if the item being added has its size different from the Order item, there shall be an error " Item is not requested in the order"

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-03   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-04: Add "Bioheart bundle(Large)" to the pending Bioheart Device Sales ticket of the Bioheart device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart bundle(Large)" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page,
	...		- 2. The Order contains item "Biheart bundle (Large)"
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart bundle" option
    ...     - 3. Seach and select a device ID in the "Bioheart devices" textbox
    ...     - 4. The user select (Large) in the trap size option
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 3. Bioheart device – the user shall be able to search and select a Bioheart device ID that has location “Inventory”
    ...     -  If the device has status “RMA”, an “RMA” tag shall be displayed
    ...     -  The [Add items] button shall be enabled when the the user selects a device ID
    ...     -  The selected device ID shall be dispayed in the textbox
    ...     - 4. The selected option shall be dispayed
    ...     - 5. The item shall be added to the list with format:
    ...     - Bioheart bundle <Device ID>
    ...     - Bioheart device <Device ID> hyperlink- the user can view the Device ID information by clicking on it
    ...     - Bioheart strap (Large size)
    ...     - Bioheart charger
	...		- If the device is RMA, tha status of the device shall be changed to active after adding to the Bioheart Device Sales ticket
	...		- if the item being added exceeds the amount requested in the order, there shall be an error “Item exceeds the requested amount in the order.”
	...		- if the item being added has its size different from the Order item, there shall be an error " Item is not requested in the order"


    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-04   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-05: Add "Bioheart strap" to the pending Bioheart Device Sales ticket of the Bioheart device

    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart strap" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page,
	...		- 2. The Order contains item "Bioheart device(Small)", quantity: 4
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select "small" options in the trap size
    ...     - 4. Inputs a positive integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The selected option shall be displayed
    ...     - 4. The user can input a positive integer
    ...     - 5. Example: The Quantity is 4, small size, the list of items shall be added with format:
    ...     - Bioheart Strap (Small size)
    ...     - Bioheart Strap (Small size)
    ...     - Bioheart Strap (Small size)
    ...     - Bioheart Strap (Small size)
	...		- if the item being added exceeds the amount requested in the order, there shall be an error “Item exceeds the requested amount in the order.”
	...		- if the item being added has its size different from the Order item, there shall be an error " Item is not requested in the order"

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-05   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-06: Select "Bioheart strap" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart strap" then check the Quantity textbox in the pending Bioheart Device Sales ticket  of the Bioheart device
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page, ,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart strap" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-06   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-07: Add "Bioheart charger" to the pending Bioheart Device Sales ticket of the Bioheart device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add "Bioheart charger" to the Bioheart transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page,
	...		- 2. The order contains item "Bioheart Charger", quantity: 4
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. Inputs number of device into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...         Input negative number
    ...     - 4. Click on [Add items] button
    ...
    ...     Expected Results:
    ...     - 2. The [Add items] button is enabled by default when the user selects "Bioheart strap" option
    ...     - 3. The user can input a positive integer
    ...     - 4. Example: The user selects Quantity: 4, the item shall be added to the list with format:
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger
    ...     - Bioheart Charger
	...		- if the item being added exceeds the amount requested in the order, there shall be an error “Item exceeds the requested amount in the order.”
	...		- if the item being added has its size different from the Order item, there shall be an error " Item is not requested in the order"

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-07   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-08: Select "Bioheart charger" then check the Quantity textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Bioheart charger" then check the Quantity textbox in the pending Bioheart Device Sales ticket  of the Bioheart device
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page, ,
    ...
    ...     Test Steps:
    ...     - 1. Click on [Add items] button
    ...     - 2. Select "Bioheart charger" option
    ...     - 3. The user select 1 option out of 3 trap size options (Small/Medium/Large)
    ...     - 4. Inputs a negative integer into "Quantity" textbox or  use the arrow icon to increase or decrease the number of device
    ...     - 5. Inputs a decimal number into "Quantity" textbox
	...		- 6. Inputs a number with spaces before or after the number
    ...
    ...     Expected Results:
    ...     - 4. Cannot input negative number into Quantity textbox
    ...     - 5. Can not input decimal number
    ...     - 6. The Spaces shall be cut, the number display in the textbox without spaces

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-08  RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-09: Remove added item in the list of the pending Bioheart Device Sales ticket of the Bioheart device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove added item
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the pending Bioheart Device Sales ticket detail page, ,
    ...     - 2. There are some items added to the list
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Delete] button on every item in the list
    ...
    ...     Expected Results:
    ...     - 1. The added item shall be deleted

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-09   RS-84-01     R1    manual    SC-1.10.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-10: Enter emails into Notification Email textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter emails into Notification Email textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
    ...    - 1. Observe the the email textbox
    ...    - 2. Enter one or multiple emails in the Notification email text box
    ...    - 3. Each email is separated by space bar
    ...
    ...     Expected Results:
    ...    - 1. Display the emails that is inputted when the user created the ticket
    ...     - The system shall automatically fill the following email: service@biotricity.com
    ...    - 2. The entered emails shall displayed
    ...    - 3. For each email, there shall be a [Delete] button to remove it.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-10    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-11: Remove emails in the Notification Email textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove emails in the Notification Email textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
    ...    - 1. Click on [Delete] button on each email
    ...
    ...     Expected Results:
    ...    - 1. The email shall be removed

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-11     SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-12: Enter text into the Notes textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter text into the Notes textbox
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2. )
    ...
    ...     Test Steps:
    ...    - 1. Observe the note (the note inputted when the user created the ticket)
    ...    - 2. Enter text into the Notes textbox,
    ...    - 3. Click on [Save] button
    ...
    ...     Expected Results:
    ...    - 1. Display the note that is inputted when the user created the ticket
    ...    - 2. The entered text shall be displayed
    ...    - 3. All changes shall be saved, at the moment, a [Save] button will disappear.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-12    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-13: Observe the recipient address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the recipient address
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
    ...    - 1. Observe the recipient address
    ...
    ...     Expected Results:
    ...    - 1. By default, all of the boxes in the address area shall be disabled.
    ...    - 2. The address information is correct

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-13   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-14: Edit the recipient address
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the on the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
    ...    - 1.The user clicks on [Edit] button
    ...    - 2.The user selects a address
    ...
    ...     Expected Results:
    ...    - 1. All of the boxes shall be enabled for editing
    ...    - 2. A [Edit] button shall change to a [Save] button, and there is a [Cancel] button next to a [Save] button.
    ...    - 3. The web app shall suggest addresses based on the inputs of the user. The user shall select a suggestion and the web app shall automatically fill the information in the corresponding input fields.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-14   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-15: Edit the recipient address then clicks on [Save] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address then clicks on [Save] button
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
    ...    - 1.The user edits recipient address then clicks on [Save] button
    ...
    ...     Expected Results:
    ...    - 1. All the edited data will be saved
    ...    - 2. A [Edit] button will replace a [Save] and [Cancel] button and all of the boxes shall be disabled.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-15  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-16: Edit recipient address, input invalid zipcode
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit recipient address, input invalid zipcode
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket, S&D Portal
    ...     - 2.
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [Edit] button on the Shipping Information section
	...		- 2. Input invalid zipcode
	...		- 3. The user click on "Save" button
    ...
    ...     Expected Results:
    ...     - 1. All of the boxes shall be enabled for editing
	...		- 2. The zipcode shall be displayed
	...		- 3. There shall be an error message "Invalid zipcode"

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-16    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-17: Edit the recipient address then clicks on [Cancel] button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the recipient address then clicks on [Cancel] button
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
    ...    - 1.The user edits recipient address then clicks on [Cancel] button
    ...
    ...     Expected Results:
    ...    - 1. The user can exit edit mode
    ...    - 2. A [Edit] button will replace a [Save] and [Cancel] button and all of the boxes shall be disabled.

    [Tags]    BSP-SND-TRANSFER-EDIT-PENDING-BHSALE-17  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-COMPLETE-BHSALE-01: Complete the Bioheart Device Sales ticket,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete the Bioheart Device Sales ticket,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2.
	...		- 3. There are items added: Bioheart bundle, Bioheart device,
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Mark complete] button
	...		- 2. Click on "Confirm" button in the confirmation pop-up
	...		- 3. In the case the user click on "Cancel" button in the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation pop-up "You are going to complete this Device Transfer.
	...		If you are sure you want to move forward with the action, please confirm below."
	...		- 2. The location of the Bioheart device change from "Inventory" to "End User"
	...		-- The ticket shall be moved to Completed tab
	...		- 3. The pop-up shall be closed, the user is on the pending ticket

    [Tags]    BSP-SND-TRANSFER-COMPLETE-BHSALE-01   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-01: Creat shipment order,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Complete the Bioheart Device Sales ticket,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2.
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
    ...     - 1. [Create Shipment Order] button
	...		- 2. The user selects Shipment date
	...		- 3. Observe the Pakage field
	...		- 4. Select a Package option (not Custom Dimensions)
    ...
    ...     Expected Results:
    ...     - 1. When clicked on [Create Shipment Order] button should navigate the user to the Create Shipment order page.
	...		- 2. The user only selects the shipment date within 7 days from the current date. The selected date shall be displayed
	...		- 3. By default, the option should be “Custom Dimensions”.
	...		- 4. In the dropdown box, there should be a list of package templates, the selected option shall be displayed
	...		 - Once the user has filled in all the data, the web app should show all the Rate options that include information:
	...		 - Carriers
	...		 - Fee – should always display hundredth decimal number
	...		 - Time (days)
	...		 - If the web app cannot show the Rates, there should be a message: “Something went wrong. Please check your information and try again.”

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-01  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-02: Fill out the Dimensions
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Fill out the Dimensions
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
	...		- 1. Fill out Dimension (Length x Width x Height)
	...		- 2. Weight (lbs)
	...		- 3. Click on [Apply] button
    ...
    ...     Expected Results:
    ...     - 1. The [Apply] button should be disable until the user enters all required data
	...		 - Once the user has filled in all the data, the web app should show all the Rate options that include information:
	...		 - Carriers
	...		 - Fee – should always display hundredth decimal number
	...		 - Time (days)
	...		 - If the web app cannot show the Rates, there should be a message: “Something went wrong. Please check your information and try again.”

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-02  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-03: Observe and edit the Items section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe and edit the Items section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
	...		- 3. There are items added: Bioheart bundle, Bioheart device, Bioheart Charger, Bioheart Stap
    ...
    ...     Test Steps:
	...		- 1. Observe the Items section
	...		- 2. Deslect "All items" checkbox
	...		- 3. Deselect the checkbox of an item
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to select devices assigned to the shipment order that they want to ship.
	...		- There shall be all items in the ticket displayed, all items are selected by default
	...		- 2. All the items shall be deselected
	...		- 3. That item shall be deseleted

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-03  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-04: Observe Sender information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe Sender information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
	...		- 1. Observe Sender information section
    ...
    ...     Expected Results:
    ...     - 1. The web app should get Biotricity Productions information automatically and display it with the following details:
    ...     - Transfer [Transfer ID] - Biotricity’s name
    ...     - Biotricity’s address
    ...     - Contact phone number
    ...     - Contact mail

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-04  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-05: Edit the Sender information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Sender information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Sender information section
	...		- 2. Edit "Name"
	...		- 3. Edit "Country"
	...		- 4. Edit "Address"
	...		- 5. Edit "Secondary address"
	...		- 6. Edit "Contact phone number", input valid value
	...		- 7. Edit "Contact phone email", input valid value
	...		- 8. Click on [Finish] button in the modal
	...		- 9. Click on [Cancel] button or [X] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. The edited data shall be displayed
	...		- 3. The selected country shall be displayed
	...		- 4. The the web app should suggest addresses based on the inputs of the user.
	...		- The user should select a suggestion and the web app should automatically fill the information in corresponding input fields.
	...		- 5. The user can manually input the secondary address
	...		- 6. The inputted Contact phone number shall be displayed
	...		- 7. The inputted Contact email shall be displayed
	...		- 8. The edited information shall be saved
	...		- 9. The modal shall be closed, the changes are not saved

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-05  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-06: Edit the Sender information section, input invalid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Sender information section, input invalid value
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Sender information section
	...		- 2. Input Invalid zipcode
	...		- 3. Input invalid Contact phone number
	...		- 4. Input invalid email
	...		- 5. Click on "Finish" button
    ...
    ...     Expected Results:
    ...     - There shall be error message displayed "invalid value" under the field "Contact phone number", "Contact email", "Zipcode"

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-06  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-07: Observe Recipient information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe Recipient information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
	...		- 1. Observe Recipient information section
    ...
    ...     Expected Results:
    ...     - 1. The web app should get End User information automatically and display it with the following details:
    ...     - Transfer [Transfer ID] – End User’s name
    ...     - End User’s address

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-07  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-08: Edit the Recipient information section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Recipient information section
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Recipient information section
	...		- 2. Edit "Name"
	...		- 3. Edit "Country"
	...		- 4. Edit "Address"
	...		- 5. Edit "Secondary address"
	...		- 6. Edit "Contact phone number", input valid value
	...		- 7. Edit "Contact phone email", input valid value
	...		- 8. Click on [Finish] button in the modal
	...		- 9. Click on [Cancel] button or [X] button in the modal
    ...
    ...     Expected Results:
    ...     - 2. The edited data shall be displayed
	...		- 3. The selected country shall be displayed
	...		- 4. The the web app should suggest addresses based on the inputs of the user.
	...		- The user should select a suggestion and the web app should automatically fill the information in corresponding input fields.
	...		- 5. The user can manually input the secondary address
	...		- 6. The inputted Contact phone number shall be displayed
	...		- 7. The inputted Contact email shall be displayed
	...		- 8. The edited information shall be saved
	...		- 9. The modal shall be closed, the changes are not saved

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-08  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-09: Edit the Recipient information section, input invalid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit the Recipient information section, input invalid value
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...
    ...     Test Steps:
	...		- 1. Click on the [Edit] button in the Recipient information section
	...		- 2. Input Invalid zipcode
	...		- 3. Input invalid Contact phone number
	...		- 4. Input invalid email
	...		- 5. Click on "Finish" button
    ...
    ...     Expected Results:
    ...     - There shall be error message displayed "invalid value" under the field "Contact phone number", "Contact email", "Zipcode"

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-09  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SHIPMENT-BHSALE-10: Observe the Review modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Observe the Review modal
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the CREATE SHIPMENT ORDER page of the pending Bioheart Device Sales ticket
    ...     - 2.
    ...
    ...     Test Steps:
	...		- 1. The User selects an Rate option
	...		- 2. Click on the [Preview] button
	...		- 3. Click on [Back] button in the Review modal
	...		- 4. Click on the [Purchase] button, (If the order should be successful)
	...		- 5. Click on the [Purchase] button, (If the order should be fail)
    ...
    ...     Expected Results:
    ...     - 1. By default, the button should be disabled until the user selects the rate.
	...		- Once the rate should be selected, the button should be enabled.
	...		- 2. The pop-up review should display when the [Preview] button should be clicked on,
	...		- 3. The Preview modal shall be closed
	...		- 4. The shippment order is placed and the user shall be redirected to the detail page,
	...		 There is an successful message to notify
	...		- 5. There is a error message to notify

    [Tags]    BSP-SND-TRANSFER-SHIPMENT-BHSALE-10  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-BHSALE-01: Observe the “Email” modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the “Email” modal
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2. There is at least 1 shipment lable created
    ...
    ...     Test Steps:
	...		- 1. Click on [Mail] button next to the label
    ...
    ...     Expected Results:
    ...     - 1. Upon clicking on it, there should be an “Email” modal displayed.
    ...     - In the modal, there should be:
    ...     - “To” textbox
    ...     - “Subject” textbox
    ...     - Mail body textbox
    ...     - [Cancel] button
    ...     - [Send] button
	...		- Subject: Device sales [Sales order ID] – Transfer Shipment label
	...		- Mail body textbox should contain this mail template
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Device Sales <Sales order ID> with item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Device_Sales_[Sales order ID]_Transfer_Shipment_Label"

    [Tags]    BSP-SND-TRANSFER-EMAIL-BHSALE-01  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-BHSALE-02: Send shipment email manually
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Send shipment email manually
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...     - 2. There is at least 1 shipment lable created
    ...
    ...     Test Steps:
	...		- Click on [Mail] button next to the label
    ...     - In the modal:
    ...     - Fill emails into the “To” textbox
    ...     - Fill out the “Subject” textbox
    ...     - 1. Click on the [Send] button
	...		- 2. Click on the [Cancel] button
    ...
    ...     Expected Results:
	...		- 1. There shall be an email send to the email address in the “To” textbox
	...		- Subject: Device sales [Sales order ID] – Transfer Shipment label
	...		- Mail body textbox should contain this mail template:
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Device Sales <Sales order ID> with item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Device_Sales_[Sales order ID]_Transfer_Shipment_Label"
	...		- 2. The email modal shall be closed

    [Tags]    BSP-SND-TRANSFER-EMAIL-BHSALE-02  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-BHSALE-03: Automatically send notification emails when the Shipment Order created
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when the Shipment Order created
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
    ...
    ...     Test Steps:
	...		- 1. The user create a shipment order
    ...
    ...     Expected Results:
    ...     - 1. When the order should be created successfully, there should be a mail that will be sent to people in the [Notification email].
	...		- Subject: Device sales [Sales order ID] – Transfer Shipment label
	...		- Mail body textbox should contain this mail template
	...		-- "Hi [Recipient name],
	...		-- Devices should be being shipped via [Carrier].
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Attached is the shipping label for Device Sales <Sales order ID> that contains [number] item(s):
	...		-- [List of devices item names, grouped by item type with amount]
	...		-- Please double-check the information and let us know if you have any questions.
	...		-- Biotricity"
	...		- The mail should have the shipment label file attached. Attachment "Device_Sales_[Sales order ID]_Transfer_Shipment_Label"

    [Tags]    BSP-SND-TRANSFER-EMAIL-BHSALE-03  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-BHSALE-04: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
	...		- 2. There is a shipment order created
    ...
    ...     Test Steps:
	...		- 1.When the shipment of the Bioheart Device Sales ticket is delivered,
    ...
    ...     Expected Results:
    ...     - 1. There should be an email automatically sent to the service@biotricity with the following content
	...		- Subject: Transfer [Transfer ID] - Transfer Delivery confirmation
	...		- Mail body textbox should contain this mail template
	...		-- "Hi,
	...		-- A shipment order of Transfer <TransferID> has been delivered to <Recipient Address> at <Time - Date> via <Carrier>.
	...		-- [List of devices/items]
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Biotricity"

    [Tags]    BSP-SND-TRANSFER-EMAIL-BHSALE-04  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EMAIL-BHSALE-05: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Automatically send notification emails when Shipment Order delivered – OM, Sales team, Finance team
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending Bioheart Device Sales ticket
	...		- 2. There is a shipment order created
    ...
    ...     Test Steps:
	...		- 1.When the shipment of the Bioheart Device Sales ticket is delivered,
    ...
    ...     Expected Results:
    ...     - 1. There should be an email automatically sent to the service@biotricity with the following content
	...		- Subject: Transfer [Transfer ID] - Transfer Delivery confirmation
	...		- Mail body textbox should contain this mail template
	...		-- "Hi,
	...		-- A shipment order of Transfer <TransferID> has been delivered to <Recipient Address> at <Time - Date> via <Carrier>.
	...		-- [List of devices/items]
	...		-- You should be able to track the shipment here:
	...		-- [Shippo tracking link]
	...		-- Biotricity"

    [Tags]    BSP-SND-TRANSFER-EMAIL-BHSALE-05  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-QA-01: Quick access to Assigned Devices Items
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Assigned Devices Items
    ...
    ...     Precondition:
    ...     - 1. User is on the “Pending” sub-tab or “Completed” sub-tab of the Transfer page.
	...		- 2. There is a shipment order created
    ...
    ...     Test Steps:
	...		- 1.User clicks on the hyperlinked number of Assigned devices of each transfer ID row

    ...     Expected Results:
    ...     - 1. Clicking on the hyperlink for a Bioheart device transfer ticket should display a sidebar that contains the following information
	...		-- Index number
	...		-- Item name: If item is a Bioheart bundle, also displays the contents of the bundle
	...		-- Quantity

    [Tags]    BSP-SND-TRANSFER-QA-01  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-QA-02: Quick access to Sales order side bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Sales order side bar
    ...
    ...     Precondition:
    ...     - 1. User is on the “Pending” sub-tab or “Completed” sub-tab of the Transfer page.
	...		- 2. There is a shipment order created
    ...
    ...     Test Steps:
	...		- 1.User clicks on the hyperlinked sales order ID of each transfer ID row

    ...     Expected Results:
    ...     - 1. Clicking on the hyperlink should display a sidebar that contains the following information
	...		-- Order <Order number>
	...		-- Customer name
	...		-- Phone number
	...		-- Email
	...		-- Address
	...		-- Order items
	...		-- Shall display the ordered items and their quantity per item type

    [Tags]    BSP-SND-TRANSFER-QA-02  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-QA-03: Quick access to Bioheart device detail
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Bioheart device detail
    ...
    ...     Precondition:
    ...     - 1. User is on the “Pending” sub-tab or “Completed” sub-tab of the Transfer page.
	...		- 2. There is a shipment order created
    ...
    ...     Test Steps:
	...		- 1.User clicks on the hyperlinked sales order ID of each transfer ID row

    ...     Expected Results:
    ...     - 1. Clicking on the hyperlink should display a sidebar that contains the following information
	...		-- Order <Order number>
	...		-- Customer name
	...		-- Phone number
	...		-- Email
	...		-- Address
	...		-- Order items:
	...		-- Shall display the ordered items and their quantity per item type

    [Tags]    BSP-SND-TRANSFER-QA-03  SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#TRANSFER _SALE _ VIEW
BSP-SND-TRANSFER-SALES-VIEW-BIOFT-01: Check that Recipient Address must have Recipient Name field (Device Sales - customer type: End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details page, Recipient Address must have Recipient Name field (Device Sales - customer type: End User)
    ...
    ...     Precondition:
    ...     1. The Operation Staff or Operation Manager is on the Device Transfer ticket details page
    ...     2. Ticket purpose is Device Sales and customer type is End User.
    ...     Test Steps:
    ...     - Observe the Recipient Address
    ...
    ...     Expected Results:
    ...     - Recipient Address has Recipient Name field.

    [Tags]    BSP-SND-TRANSFER-SALES-VIEW-BIOFT-01     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-BIOFT-02: Check that Recipient Name information must be displayed correctly (Device Sales - customer type: End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details of Device Sales, Recipient Name information must be displayed correctly
    ...
    ...     Precondition:
    ...     1. The Operation Staff or Operation Manager is on the Device Transfer ticket details page (Device Sales)
    ...     2. Ticket purpose is Device Sales and customer type is End User.
    ...
    ...     Test Steps:
    ...     - Observe the Recipient Name in Recipient Address
    ...
    ...     Expected Results:
    ...     - Recipient Name must match the Recipient name of ticket

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-BIOFT-02    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-01: Check that Refund label must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed same as designed (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - Observe Refund label in Tracking information.
    ...
    ...     Expected Results:
    ...     - 1. Refund label option is displayed same as designed (position, font style, font size, color...)
    ...     - 2. The message is displayed when hovering the “?” button

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-02: Check that Refund label must be displayed correctly when Refund type is “Refund requested”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund requested” (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund requested”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is orange.
    ...     - 2. Display message “Refunds typically take 14 days to credit your account”

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-02    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-03: Check that Refund label must be displayed correctly when Refund type is “Refunded”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refunded” (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refunded”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is green.
    ...     - 2. Display message “The cost of this label has been credited to your account”

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-03    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-04: Check that Refund label must be displayed correctly when Refund type is “Refund rejected”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund rejected” (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund rejected”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is red.
    ...     - 2. Display message “Your refund was unsuccessful, the shipping label may have been used”

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOFT-04    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-BIOFT-01: Check that Recipient Address must have Recipient Name field
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details of Transfer, Recipient Address must have Recipient Name field
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Device Transfer ticket details page (Transfer)
    ...
    ...     Test Steps:
    ...     - Observe the Recipient Address
    ...
    ...     Expected Results:
    ...     - Recipient Address has Recipient  field.

    [Tags]       BSP-SND-TRANSFER-VIEW-BIOFT-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-BIOFT-02: Check that Recipient Name information must be displayed correctly
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details of Transfer, Recipient Name information must be displayed correctly
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Device Transfer ticket details page (Transfer)
    ...
    ...     Test Steps:
    ...     - Observe the Recipient Name in Recipient Address
    ...
    ...     Expected Results:
    ...     - Recipient Name must match the Recipient name of ticket

    [Tags]       BSP-SND-TRANSFER-VIEW-BIOFT-02    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#TRANSFER _ SHIP
BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-01: Check that Refund label must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed same as designed (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - Observe Refund label in Tracking information.
    ...
    ...     Expected Results:
    ...     - 1. Refund label option is displayed same as designed (position, font style, font size, color...)
    ...     - 2. The message is displayed when hovering the “?” button

    [Tags]       BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-02: Check that Refund label must be displayed correctly when Refund type is “Refund requested”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund requested” (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund requested”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is orange.
    ...     - 2. Display message “Refunds typically take 14 days to credit your account”

    [Tags]      BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-02     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-03: Check that Refund label must be displayed correctly when Refund type is “Refunded”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refunded” (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refunded”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is green.
    ...     - 2. Display message “The cost of this label has been credited to your account”

    [Tags]     BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-03      RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-04: Check that Refund label must be displayed correctly when Refund type is “Refund rejected”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund rejected” (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund rejected”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is red.
    ...     - 2. Display message “Your refund was unsuccessful, the shipping label may have been used”

    [Tags]      BSP-SND-TRANSFER-VIEW-SHIP-BIOFT-04     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-RENEW-VIEW-BIOFT-01: Check that Sender Address must have Sender Name field
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details of Renewal, Sender Address must have Sender Name field
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Device Transfer ticket details page (Renewal)
    ...
    ...     Test Steps:
    ...     - Observe the Sender Address
    ...
    ...     Expected Results:
    ...     - Sender Address has Sender Name field.

    [Tags]       BSP-SND-TRANSFER-RENEW-VIEW-BIOFT-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-RENEW-VIEW-BIOFT-02: Check that Sender Name information must be displayed correctly
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details of Renewal, Sender Name information must be displayed correctly
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Device Transfer ticket details page (Renewal)
    ...
    ...     Test Steps:
    ...     - Observe the Sender Name in Sender Address
    ...
    ...     Expected Results:
    ...     - Sender Name must match the Sender name of ticket

    [Tags]       BSP-SND-TRANSFER-RENEW-VIEW-BIOFT-02    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-01: Check that Refund label must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed same as designed (Renewal)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - Observe Refund label in Tracking information.
    ...
    ...     Expected Results:
    ...     - 1. Refund label option is displayed same as designed (position, font style, font size, color...)
    ...     - 2. The message is displayed when hovering the “?” button

    [Tags]       BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-02: Check that Refund label must be displayed correctly when Refund type is “Refund requested”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund requested” (Renewal)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund requested”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is orange.
    ...     - 2. Display message “Refunds typically take 14 days to credit your account”

    [Tags]       BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-02     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-03: Check that Refund label must be displayed correctly when Refund type is “Refunded”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refunded” (Renewal)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refunded”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is green.
    ...     - 2. Display message “The cost of this label has been credited to your account”

    [Tags]       BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-03    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-04: Check that Refund label must be displayed correctly when Refund type is “Refund rejected”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund rejected” (Renewal)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund rejected”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is red.
    ...     - 2. Display message “Your refund was unsuccessful, the shipping label may have been used”

    [Tags]       BSP-SND-TRANSFER-RENEW-VIEW-SHIP-BIOFT-04    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CLOSED-VIEW-BIOFT-01: Check that Sender Address must have Sender Name field
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details of Closed Account, Sender Address must have Sender Name field
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Device Transfer ticket details page (Closed Account)
    ...
    ...     Test Steps:
    ...     - Observe the Sender Address
    ...
    ...     Expected Results:
    ...     - Sender Address has Sender Name field.

    [Tags]       BSP-SND-TRANSFER-CLOSED-VIEW-BIOFT-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CLOSED-VIEW-BIOFT-02: Check that Sender Name information must be displayed correctly
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details of Closed Account, Sender Name information must be displayed correctly
    ...
    ...     Precondition: The Operation Staff or Operation Manager is on the Device Transfer ticket details page (Closed Account)
    ...
    ...     Test Steps:
    ...     - Observe the Sender Name in Sender Address
    ...
    ...     Expected Results:
    ...     - Sender Name must match the Sender name of ticket

    [Tags]       BSP-SND-TRANSFER-CLOSED-VIEW-BIOFT-02     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-01: Check that Refund label must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed same as designed (Closed Account)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - Observe Refund label in Tracking information.
    ...
    ...     Expected Results:
    ...     - 1. Refund label option is displayed same as designed (position, font style, font size, color...)
    ...     - 2. The message is displayed when hovering the “?” button

    [Tags]       BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-02: Check that Refund label must be displayed correctly when Refund type is “Refund requested”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund requested” (Closed Account)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund requested”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is orange.
    ...     - 2. Display message “Refunds typically take 14 days to credit your account”

    [Tags]      BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-02     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-03: Check that Refund label must be displayed correctly when Refund type is “Refunded”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refunded” (Closed Account)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refunded”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is green.
    ...     - 2. Display message “The cost of this label has been credited to your account”

    [Tags]       BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-03     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-04: Check that Refund label must be displayed correctly when Refund type is “Refund rejected”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund rejected” (Closed Account)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund rejected”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is red.
    ...     - 2. Display message “Your refund was unsuccessful, the shipping label may have been used”

    [Tags]      BSP-SND-TRANSFER-CLOSED-VIEW-SHIP-BIOFT-04    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-01: Check that Refund label must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed same as designed (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - Observe Refund label in Tracking information.
    ...
    ...     Expected Results:
    ...     - 1. Refund label option is displayed same as designed (position, font style, font size, color...)
    ...     - 2. The message is displayed when hovering the “?” button

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-02: Check that Refund label must be displayed correctly when Refund type is “Refund requested”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund requested” (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund requested”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is orange.
    ...     - 2. Display message “Refunds typically take 14 days to credit your account”

    [Tags]      BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-02     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-03: Check that Refund label must be displayed correctly when Refund type is “Refunded”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refunded” (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refunded”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is green.
    ...     - 2. Display message “The cost of this label has been credited to your account”

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-03    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-04: Check that Refund label must be displayed correctly when Refund type is “Refund rejected”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund rejected” (Device Sales)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund rejected”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is red.
    ...     - 2. Display message “Your refund was unsuccessful, the shipping label may have been used”

    [Tags]       BSP-SND-TRANSFER-SALES-VIEW-SHIP-BIOH-04    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-SHIP-BIOH-01: Check that Refund label must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed same as designed (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - Observe Refund label in Tracking information.
    ...
    ...     Expected Results:
    ...     - 1. Refund label option is displayed same as designed (position, font style, font size, color...)
    ...     - 2. The message is displayed when hovering the “?” button

    [Tags]      BSP-SND-TRANSFER-VIEW-SHIP-BIOH-01     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-SHIP-BIOH-02: Check that Refund label must be displayed correctly when Refund type is “Refund requested”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund requested” (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund requested”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is orange.
    ...     - 2. Display message “Refunds typically take 14 days to credit your account”

    [Tags]       BSP-SND-TRANSFER-VIEW-SHIP-BIOH-02    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-SHIP-BIOH-03: Check that Refund label must be displayed correctly when Refund type is “Refunded”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refunded” (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refunded”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is green.
    ...     - 2. Display message “The cost of this label has been credited to your account”

    [Tags]      BSP-SND-TRANSFER-VIEW-SHIP-BIOH-03     RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-SHIP-BIOH-04: Check that Refund label must be displayed correctly when Refund type is “Refund rejected”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund rejected” (Transfer)
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund rejected”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is red.
    ...     - 2. Display message “Your refund was unsuccessful, the shipping label may have been used”

    [Tags]       BSP-SND-TRANSFER-VIEW-SHIP-BIOH-04    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-EDIT-PENDING-SHIP-BIOFT-09: Check that Sender Information in Outbound Shipment Order must have Company Name field (optional) when editing information
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Outbound Shipment page, when edit Sender Information, Company name field must be displayed
    ...
    ...     Precondition: The Operation Manager/Operation Staff is on the Create Outbound Shipment page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Sender Information to open the modal.
    ...     - 2. Observe the modal.
    ...
    ...     Expected Results:
    ...     - 1. Sender Information has Company name field.
    ...     - 2. Company name field is optional.

    [Tags]       BSP-SND-TRANSFER-EDIT-PENDING-SHIP-BIOFT-09    RS-029-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BIOKIT
BSP-SND-TRANSFER-VIEW-PENDING-KE-01: View header of a pending transfer ticket, Device type is Biokit
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View header of a pending transfer ticket, Device type is Biokit
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
	...		- 2. The Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the header of Transfer ticket details page
    ...
    ...     Expected Results:
    ...     - 1. Header:
    ...     - Transfer ID
    ...     - Purpose: Transfer
    ...     - Device type: Biokit

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KE-01    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KE-02: Observe the customer information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the customer information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, the Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Customer type: End User
    ...     - 2. Order number: Display the inputted order number, Displays “—” if unavailable
    ...     - 2. Order Date: Display the selected order date, Displays “—” if unavailable
    ...     - 3. Customer name
	...		- 4. Contact phone number
	...		- 5. Contact email
	...		- 6. Address,
	...		- 4. There shall also be an [Edit] button

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KE-02    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KE-03: Observe the items list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the items list
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, the Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the ITEMS LIST
    ...
    ...     Expected Results:
    ...     - There shall be 2 sections in the ITEMS LIST
	...		- 1. The Kits section
	...		- + Index number
	...     - + Kit No. – Kit No. identified in the Admin Portal
	...		- + Digital Thermometer – Displays the Digital Thermometer device ID included in the kit
	...		- + Blood Pressure Cuff – Displays the Blood Pressure Cuff device ID included in the kit
	...		- + Pulse Oximeter – Displays the Pulse Oximeter device ID included in the kit
	...		- ++ If it is selected while adding the Kit to the items list, there shall be an icon that indicates
	...		- “The system only adds the device to the kit after the ticket is marked as completed”
	...		- + [Delete] button on every kit in the list
	...		- 2. The Standalone devices section
	...		- Index number
	...		- Device ID
	...		- Device type: Digital thermometer, Blood Pressure Cuff, Pulse Oximeter
	...		- 3. Label – displays the shipment label that the item belongs to,  Display “—” if unavailable

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KE-03    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KE-04: Observe the Other information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the pending transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Observe the other information section
    ...
    ...     Expected Results:
    ...     - 1. Notification email: Display the inputted emails
	...		- 2. Display the inputted Note

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KE-04    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KE-05: Observe the Shipping Information in the Pending Transfer Ticket page of the Biokit device, Device type is Biokit,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information in the Pending Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the Pending transfer ticket detail page, Device type is Biokit,
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Address
	...		-- Recipient Name:  Display the name in the "Create" page
    ...     -- Country: Display the selected Country
    ...     -- Address: Display the selected address
    ...     -- Secondary Address (optional): Display the inputted data (if any)
    ...     -- City, State, Zipcode: Display the inputted data
    ...     -- Contact phone number: dispay the inputted data
	...		-- Contact Email: dispay the inputted data

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KE-05    RS-085-03    RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-VIEW-PENDING-KE-06: Observe the Tracking information section of the Pending Transfer tab (Device type is Biokit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Tracking information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on pending Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit
    ...     - 3. There is a lable created
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information section
    ...
    ...     Expected Results:
    ...     - 1.Tracking number - a hyperlink. When clicked on it should navigate the user to the Order-Shipping on Shippo site
    ...     - 2.Shipped date
    ...     - 3.Estimated arrival
	...		- 4. Signature Confirmation
    ...     - 5.Label - a hyperlink. The user should be able to download the label of the shipping by clicking on it.
    ...     - 6.The filename format should be “Transfer_<Transfer ID>_Transfer_Shipping_Label”
    ...     - 7.Carrier - total rates
    ...     - 8.Device (number of devices), list of devices included in this label
    ...     - 9.Timeline: date and status of shipping
	...		- 10.Refund status
    ...         After 120 days from the date of order creation, the timeline should no longer be visible.
	...		- 11. The user should be able to click on the Tracking Number to be redirected to the tracking site
	...		- 12. The user should be able to click on the Label to download the shipping label pdf file

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KE-06    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KE-01: View header of a completed or canceled transfer ticket, Device type is Biokit
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View header of a completed or canceled transfer ticket, Device type is Biokit
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
	...		- 2. The Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the header of Transfer ticket details page
    ...
    ...     Expected Results:
    ...     - 1. Header:
    ...     - Transfer ID
    ...     - Purpose: Transfer
    ...     - Device type: Biokit

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KE-01    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KE-02: Observe the customer information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the customer information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, the Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Customer type: End User
    ...     - 2. Order number: Display the inputted order number, Displays “—” if unavailable
    ...     - 2. Order Date: Display the selected order date, Displays “—” if unavailable
    ...     - 3. Customer name
	...		- 4. Contact phone number
	...		- 5. Contact email
	...		- 6. Address,
	...		- 4. There shall also be an [Edit] button

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KE-02    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KE-03: Observe the items list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the items list
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the completed or canceled transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, the Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe the ITERMS LIST
    ...
    ...     Expected Results:
    ...     - There shall be 2 sections in the ITERMS LIST
	...		- 1. The Kits section
	...		- + Index number
	...     - + Kit No. – Kit No. identified in the Admin Portal
	...		- + Digital Thermometer – Displays the Digital Thermometer device ID included in the kit
	...		- + Blood Pressure Cuff – Displays the Blood Pressure Cuff device ID included in the kit
	...		- + Pulse Oximeter – Displays the Pulse Oximeter device ID included in the kit
	...		- ++ If it is selected while adding the Kit to the items list, there shall be an icon that indicates
	...		- “The system only adds the device to the kit after the ticket is marked as completed”
	...		- + [Delete] button on every kit in the list
	...		- 2. The Standalone devices section
	...		- Index number
	...		- Device ID
	...		- Device type: Digital thermometer, Blood Pressure Cuff, Pulse Oximeter
	...		- 3. Label – displays the shipment label that the item belongs to,  Display “—” if unavailable

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KE-03    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KE-04: Observe the Other information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the completed or canceled transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Observe the other information section
    ...
    ...     Expected Results:
    ...     - 1. Notification email: Display the inputted emails
	...		- 2. Display the inputted Note

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KE-04    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KE-05: Observe the Shipping Information in the completed or canceled Transfer Ticket page of the Biokit device, Device type is Biokit,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information in the completed or canceled Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the completed or canceled transfer ticket detail page, Device type is Biokit,
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Address
	...		-- Recipient Name:  Display the name in the "Create" page
    ...     -- Country: Display the selected Country
    ...     -- Address: Display the selected address
    ...     -- Secondary Address (optional): Display the inputted data (if any)
    ...     -- City, State, Zipcode: Display the inputted data
    ...     -- Contact phone number: dispay the inputted data
	...		-- Contact Email: dispay the inputted data

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KE-05    RS-085-03    RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-VIEW-COMPLETED-KE-06: Observe the Tracking information section of the completed or canceled Transfer tab (Device type is Biokit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Tracking information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on completed or canceled Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit
    ...     - 3. There is a lable created
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information section
    ...
    ...     Expected Results:
    ...     - 1.Tracking number - a hyperlink. When clicked on it should navigate the user to the Order-Shipping on Shippo site
    ...     - 2.Shipped date
    ...     - 3.Estimated arrival
	...		- 4. Signature Confirmation
    ...     - 5.Label - a hyperlink. The user should be able to download the label of the shipping by clicking on it.
    ...     - 6.The filename format should be “Transfer_<Transfer ID>_Transfer_Shipping_Label”
    ...     - 7.Carrier - total rates
    ...     - 8.Device (number of devices), list of devices included in this label
    ...     - 9.Timeline: date and status of shipping
	...		- 10.Refund status
    ...         After 120 days from the date of order creation, the timeline should no longer be visible.
	...		- 11. The user should be able to click on the Tracking Number to be redirected to the tracking site
	...		- 12. The user should be able to click on the Label to download the shipping label pdf file

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KE-06    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KF-01: View header of a completed or canceled transfer ticket, Device type is Biokit
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View header of a completed or canceled transfer ticket, Device type is Biokit
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
	...		- 2. The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the header of Transfer ticket details page
    ...     - 2. Click on the Customer hyberlink
    ...
    ...     Expected Results:
    ...     - 1. Header:
    ...     - Transfer ID
    ...     - Purpose: Transfer
    ...     - Device type: Biokit

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KF-01    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KF-02: Observe the customer information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the customer information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Customer type: Facility
    ...     - 2. Order number: Display the inputted order number, Displays “—” if unavailable
    ...     - 3. Order Date: Display the selected order date, Displays “—” if unavailable
    ...     - 4. Customer name
	...		- 5. There shall also be an [Edit] button

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KF-02    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KF-03: Observe the items list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the items list
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the completed or canceled transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the ITERMS LIST
    ...
    ...     Expected Results:
    ...     - There shall be 2 sections in the ITERMS LIST
	...		- 1. The Kits section
	...		- + Index number
	...     - + Kit No. – Kit No. identified in the Admin Portal
	...		- + Digital Thermometer – Displays the Digital Thermometer device ID included in the kit
	...		- + Blood Pressure Cuff – Displays the Blood Pressure Cuff device ID included in the kit
	...		- + Pulse Oximeter – Displays the Pulse Oximeter device ID included in the kit
	...		- ++ If it is selected while adding the Kit to the items list, there shall be an icon that indicates
	...		- “The system only adds the device to the kit after the ticket is marked as completed”
	...		- + [Delete] button on every kit in the list
	...		- 2. The Standalone devices section
	...		- Index number
	...		- Device ID
	...		- Device type: Digital thermometer, Blood Pressure Cuff, Pulse Oximeter
	...		- 3. Label – displays the shipment label that the item belongs to,  Display “—” if unavailable

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KF-03    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KF-04: Observe the Other information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the completed or canceled transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the other information section
    ...
    ...     Expected Results:
    ...     - 1. Notification email: Display the inputted emails
	...		- 2. Display the inputted Note

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KF-04    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-PENDING-KF-05: Observe the Shipping Information in the completed or canceled Transfer Ticket page of the Biokit device, Device type is Biokit,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information in the completed or canceled Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the completed or canceled transfer ticket detail page,
	...		- 2. Device type is Biokit, the Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Address
	...		-- Recipient Name:  Display the name in the "Create" page
    ...     -- Country: Display the selected Country
    ...     -- Address: Display the selected address
    ...     -- Secondary Address (optional): Display the inputted data (if any)
    ...     -- City, State, Zipcode: Display the inputted data
    ...     -- Contact phone number: dispay the inputted data
	...		-- Contact Email: dispay the inputted data

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KF-05    RS-085-03    RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-VIEW-PENDING-KF-06: Observe the Tracking information section of the completed or canceled Transfer tab (Device type is Biokit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Tracking information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on completed or canceled Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...     - 3. There is a lable created
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information section
    ...
    ...     Expected Results:
    ...     - 1.Tracking number - a hyperlink. When clicked on it should navigate the user to the Order-Shipping on Shippo site
    ...     - 2.Shipped date
    ...     - 3.Estimated arrival
	...		- 4. Signature Confirmation
    ...     - 5.Label - a hyperlink. The user should be able to download the label of the shipping by clicking on it.
    ...     - 6.The filename format should be “Transfer_<Transfer ID>_Transfer_Shipping_Label”
    ...     - 7.Carrier - total rates
    ...     - 8.Device (number of devices), list of devices included in this label
    ...     - 9.Timeline: date and status of shipping
	...		- 10.Refund status
    ...         After 120 days from the date of order creation, the timeline should no longer be visible.
	...		- 11. The user should be able to click on the Tracking Number to be redirected to the tracking site
	...		- 12. The user should be able to click on the Label to download the shipping label pdf file

    [Tags]    BSP-SND-TRANSFER-VIEW-PENDING-KF-06    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KF-01: View header of a completed or canceled transfer ticket, Device type is Biokit
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View header of a completed or canceled transfer ticket, Device type is Biokit
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
	...		- 2. The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the header of Transfer ticket details page
    ...     - 2. Click on the Customer hyberlink
    ...
    ...     Expected Results:
    ...     - 1. Header:
    ...     - Transfer ID
    ...     - Purpose: Transfer
    ...     - Device type: Biokit

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KF-01    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KF-02: Observe the customer information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the customer information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Customer type: Facility
    ...     - 2. Order number: Display the inputted order number, Displays “—” if unavailable
    ...     - 3. Order Date: Display the selected order date, Displays “—” if unavailable
    ...     - 4. Customer name
	...		- 5. There shall also be an [Edit] button

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KF-02    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KF-03: Observe the items list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the items list
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the completed or canceled transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the ITERMS LIST
    ...
    ...     Expected Results:
    ...     - There shall be 2 sections in the ITERMS LIST
	...		- 1. The Kits section
	...		- + Index number
	...     - + Kit No. – Kit No. identified in the Admin Portal
	...		- + Digital Thermometer – Displays the Digital Thermometer device ID included in the kit
	...		- + Blood Pressure Cuff – Displays the Blood Pressure Cuff device ID included in the kit
	...		- + Pulse Oximeter – Displays the Pulse Oximeter device ID included in the kit
	...		- ++ If it is selected while adding the Kit to the items list, there shall be an icon that indicates
	...		- “The system only adds the device to the kit after the ticket is marked as completed”
	...		- + [Delete] button on every kit in the list
	...		- 2. The Standalone devices section
	...		- Index number
	...		- Device ID
	...		- Device type: Digital thermometer, Blood Pressure Cuff, Pulse Oximeter
	...		- 3. Label – displays the shipment label that the item belongs to,  Display “—” if unavailable

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KF-03    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KF-04: Observe the Other information section,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on the completed or canceled transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the other information section
    ...
    ...     Expected Results:
    ...     - 1. Notification email: Display the inputted emails
	...		- 2. Display the inputted Note

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KF-04    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-COMPLETED-KF-05: Observe the Shipping Information in the completed or canceled Transfer Ticket page of the Biokit device, Device type is Biokit,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information in the completed or canceled Transfer ticket
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the completed or canceled transfer ticket detail page,
	...		- 2. Device type is Biokit, the Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the Other Information section
    ...     - 2. Observe the Shipping Information
    ...
    ...     Expected Results:
    ...     - 2. In the Shipping Information:
    ...     -- Recipient Address
	...		-- Recipient Name:  Display the name in the "Create" page
    ...     -- Country: Display the selected Country
    ...     -- Address: Display the selected address
    ...     -- Secondary Address (optional): Display the inputted data (if any)
    ...     -- City, State, Zipcode: Display the inputted data
    ...     -- Contact phone number: dispay the inputted data
	...		-- Contact Email: dispay the inputted data

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KF-05    RS-085-03    RS-84-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}}

BSP-SND-TRANSFER-VIEW-COMPLETED-KF-06: Observe the Tracking information section of the completed or canceled Transfer tab (Device type is Biokit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Tracking information section,
    ...
    ...     Precondition:
    ...     - 1. The OM, OS is on completed or canceled Transfer ticket, S&D Portal
    ...     - 2. Device type is Biokit, The Customer type is Facility
    ...     - 3. There is a lable created
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information section
    ...
    ...     Expected Results:
    ...     - 1.Tracking number - a hyperlink. When clicked on it should navigate the user to the Order-Shipping on Shippo site
    ...     - 2.Shipped date
    ...     - 3.Estimated arrival
	...		- 4. Signature Confirmation
    ...     - 5.Label - a hyperlink. The user should be able to download the label of the shipping by clicking on it.
    ...     - 6.The filename format should be “Transfer_<Transfer ID>_Transfer_Shipping_Label”
    ...     - 7.Carrier - total rates
    ...     - 8.Device (number of devices), list of devices included in this label
    ...     - 9.Timeline: date and status of shipping
	...		- 10.Refund status
    ...         After 120 days from the date of order creation, the timeline should no longer be visible.
	...		- 11. The user should be able to click on the Tracking Number to be redirected to the tracking site
	...		- 12. The user should be able to click on the Label to download the shipping label pdf file

    [Tags]    BSP-SND-TRANSFER-VIEW-COMPLETED-KF-06    RS-085-03    SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#VIEWTAB
BSP-SND-TRANSFER-VIEW-TAB-01: Check that the Pending tab must contain tickets of 3 device types Bioflux/Biotres, Bioheart, Biokit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The Pending tab of Device Transfer must contain pending ticket of 3 device types are Bioflux/Biotres, Bioheart, Biokit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Device Transfer tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the ticket list in Pending tab
    ...
    ...     Expected Results:
    ...     - 1. Bioflux/Biotres, Bioheart, Biokit transfer tickets are displayed if available.

    [Tags]    BSP-SND-TRANSFER-VIEW-TAB-01   RS-082-01-01    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-TAB-02: Check that the Biokit tickets in Pending tab are fully displayed information
     [Documentation]  Author: Linh Nguyen
     ...
     ...     Description: Biokit tickets in pending tab are fully displayed information
     ...
     ...     Precondition:
     ...     - 1. The OM/OS is on Pending Device Transfer tab
     ...
     ...     Test Steps:
     ...     - 1. Observe the ticket list in Pending tab
     ...
     ...     Expected Results:
     ...     - 1. The Biokit ticket information must have: Transfer ID, Request Date, Device Type, Purpose, Sales Order ID, Requester, Customer, Assigned Devices, Shipping Date, Edit button
     ...     - 2. If any information is null, display "--"

     [Tags]    BSP-SND-TRANSFER-VIEW-TAB-02   RS-082-01-01    manual    SC-1.13.0
     Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-TAB-03: Check that the Completed tab must contain tickets of 3 device types Bioflux/Biotres, Bioheart, Biokit
     [Documentation]  Author: Linh Nguyen
     ...
     ...     Description: The Completed tab of Device Transfer must contain pending ticket of 3 device types are Bioflux/Biotres, Bioheart, Biokit
     ...
     ...     Precondition:
     ...     - 1. The OM/OS is on Completed Device Transfer tab
     ...
     ...     Test Steps:
     ...     - 1. Observe the ticket list in Completed tab
     ...
     ...     Expected Results:
     ...     - 1. Bioflux/Biotres, Bioheart, Biokit transfer tickets are displayed if available.

     [Tags]    BSP-SND-TRANSFER-VIEW-TAB-03   RS-082-01-02    manual    SC-1.13.0
     Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-TAB-04: Check that the Biokit tickets in Completed tab are fully displayed information
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Biokit tickets in Completed tab are fully displayed information
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Completed Device Transfer tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the ticket list in Completed tab
    ...
    ...     Expected Results:
    ...     - 1. The Biokit ticket information must have: Transfer ID (Cancelled/Completed), Request Date, Device Type, Purpose, Sales Order ID, Requester, Customer, Assigned Devices, Shipping Date, View button
    ...     - 2. If any information is null, display "--"

    [Tags]    BSP-SND-TRANSFER-VIEW-TAB-04   RS-082-01-02    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-TAB-05: Check that the filter by Device type must contain 3 options are Bioflux/Biotres, Bioheart, Biokit
     [Documentation]  Author: Linh Nguyen
     ...
     ...     Description: The filter by Device type must contain 3 options are Bioflux/Biotres, Bioheart, Biokit
     ...
     ...     Precondition:
     ...     - 1. The OM/OS is on Device Transfer tab
     ...
     ...     Test Steps:
     ...     - 1. Click on [Filter] button to open the modal
     ...     - 2. Click on [Device type] dropdown box and observe the options
     ...
     ...     Expected Results:
     ...     - 1. Options in dropdown box must contain Bioflux/Biotres, Bioheart, Biokit

     [Tags]    BSP-SND-TRANSFER-VIEW-TAB-05    RS-083-02    manual    SC-1.13.0
     Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-TAB-06: Check that the results are displayed correctly when user filter by Biokit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: When user filter by Biokit device, the results are displayed correctly
    ...
    ...     Preconditions:
    ...     - 1. The OM/OS is on Device Transfer tab
    ...
    ...     Test Steps:
    ...     - 1. Click on [Filter] button to open the modal
    ...     - 2. Select [Biokit] option in Device type dropdown box
    ...     - 3. Click on [Search] button and observe the result
    ...
    ...     Expected Results:
    ...     - 1. All tickets with Biokit devices are displayed

    [Tags]    BSP-SND-TRANSFER-VIEW-TAB-06    RS-083-02    manual    SC-1.13.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-VIEW-TAB-07: Check that the Biokit devices are displayed correctly in Assign Items sidebar
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Biokit devices are displayed correctly in Assign Items sidebar
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending/Completed Device Transfer tab
    ...
    ...     Test Steps:
    ...     - 1. Click hyperlink for a Biokit  in Assign Items to open sidebar
    ...     - 2. Observe information sidebar
    ...
    ...     Expected Results:
    ...     - 1. Biokit devices are displayed correctly in the format
    ...     + Index number
    ...     + Item name
    ...     + Biokit <Kit No.>
    ...        Digital thermometer <Device ID>
    ...        Blood Pressure  <Device ID>
    ...        Digital thermometer <Device ID>
    ...     + Digital thermometer <Device ID>
    ...     + Blood Pressure  <Device ID>
    ...     + Digital thermometer <Device ID>

    [Tags]    BSP-SND-TRANSFER-VIEW-TAB-07    RS-082-01-01    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE
BSP-SND-TRANSFER-TRANSF-CREATE-01: Check that the Select device type modal must contain 3 options are Bioflux/Biotres, Bioheart, Biokit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Select device type modal must contain 3 options are Bioflux/Biotres, Bioheart, Biokit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Device Transfer tab
    ...
    ...     Test Steps:
    ...     - 1. Click on [New Transfer] button to open Select device type modal
    ...     - 2. Observe the modal
    ...
    ...     Expected Results:
    ...     - 1. Options are Bioflux/Biotres, Bioheart, Biokit

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-01    RS-084-01    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-01: Select device type modal - Biokit
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select device type modal - Biokit
    ...
    ...     Precondition:
    ...     - 1. The OS or OM is on the S&D Portal
    ...
    ...     Test Steps:
    ...     - 1. The user selects the [New tranfer] button on the Device Transfer page
    ...     - 2. Observe the modal,
    ...     - 3. Select Biokit option, then clicks on [Next] button
    ...
    ...     Expected Results:
    ...     - 2. There shall be a modal which features the following:
    ...     - Bioflux/Biotres -shall be selected by default
    ...     - Bioheart
    ...     - Biokit
    ...     - [Next] and [Cancel] button
    ...     - 3.The user shall be redirected to the Create Transfer Ticket page of the Biokit device

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-01   RS-84-01     R1   SC-1.13.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-02: Check that Create Biokit transfer ticket page must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Create Biokit transfer page must be displayed same as designed
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe page
    ...
    ...     Expected Results:
    ...     - 1. Create Biokit transfer page is displayed same as designed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-03: Check that Create Biokit transfer ticket page must be displayed all sections
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Create Biokit transfer ticket page must be displayed all sections
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe page
    ...
    ...     Expected Results:
    ...     - 1. All sections are displayed (Customer information, Item list, Standalone Items, Other information, Shipping information, [Create ticket] button)

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-04: Check that Customer information must be displayed all elements
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Customer information must be displayed all elements
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe Customer information section
    ...
    ...     Expected Results:
    ...     - 1. All elements are displayed (Customer type, Order number, Order date)

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-05: Check that Customer type must have 2 options End User and Facility
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Customer type must have 2 options End User and Facility
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe Customer type section
    ...
    ...     Expected Results:
    ...     - 1. Customer type must have 2 options End User and Facility
    ...     - 2. The icon indicates the type is displayed correctly

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - ITEM LIST
BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-06: Check that Item list section must be displayed all elements
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Item list section must be displayed all elements
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Add kits to ticket and observe the item list
    ...
    ...     Expected Results:
    ...     - 1. Kit information is displayed all elements (Index number, Kit No., Digital Thermometer, Blood Pressure Cuff, Pulse Oximeter, [Delete] button, [Add kit] button)
    ...     - 2. Standalone device information is displayed all elements (Device ID, Device Type, [Delete] button, [Add standalone devices] button)

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-07: Check that Kit information is displayed correctly in Items list section
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit information is displayed correctly in Item list section
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Item list
    ...
    ...     Expected Results:
    ...     - 1. Digital Thermometer, Blood Pressure Cuff, Pulse Oximeter ID are corresponded with the Kit No
    ...     - 2. If Pulse Oximeter is not included, display "Not included"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-08: Check that message must be displayed when hovering the icon next to Pulse Oximeter ID
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Message is displayed when hovering the icon of Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the icon next to the Pulse Oximeter ID
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "The system only adds the device to the kit after the ticket is marked as completed"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-08    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-09: Check that Standalone devices information is displayed correctly in Items list section
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Standalone devices information is displayed correctly in Item list section
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe the Item list
    ...
    ...     Expected Results:
    ...     - 1. Index number, Device ID, Device type

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-10: Check that at the end of each row of kit in Kits section has Delete button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of kit has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe kit information rows in Kits section
    ...
    ...     Expected Results:
    ...     - 1. At the end of each row has Delete button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-11: Check that kit row in Kits section must be removed when clicking Delete button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit row must be removed when clicking Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Delete] button at the end of kit row in Kits section and observe
    ...
    ...     Expected Results:
    ...     - 1. The kit is removed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-11    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-12: Check that at the end of each row of device in Standalone devices section has Delete button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe Standalone devices information rows in Standalone devices section
    ...
    ...     Expected Results:
    ...     - 1. At the end of each row has Delete button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-12    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-14: Check that kit row in Standalone devices section must be removed when clicking Delete button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Device row must be removed when clicking Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Delete] button at the end of device row in Standalone devices section and observe
    ...
    ...     Expected Results:
    ...     - 1. The device is removed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-14    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - OTHER INFO
BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-15: Check that notification emails can not be empty
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Biokit transfer ticket page, notification emails can not be empty
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click Delete button at the end of each email to remove it.
    ...     - 2. Remove all the email.
    ...     - 3. Create the ticket.
    ...
    ...     Expected Results:
    ...     - 1. Notification email field is not empty.
    ...     - 2. Last notification email is saved.

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-15    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-16: Check that notification emails can be entered using Space bar or [,] key
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Biokit transfer ticket page, notification emails can be entered using Space bar or [,] key
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Press the [Space bar] or [,] key to complete an email.
    ...
    ...     Expected Results:
    ...     - 1. The emails are entered

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-16    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-17: Check that Notes field is optional
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Biokit transfer ticket page, Notes field is optional
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe Notes field
    ...     - 2. Leave the Notes blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The Notes field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-17    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - ADD KIT
BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-18: Check that the Add kit sidebar must be opened when clicking Add kit button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Add kit sidebar must be opened when clicking Add kit button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add kit] button and observe
    ...
    ...     Expected Results:
    ...     - 1. The Add kit sidebar is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-18    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-19: Check that Add Kit Sidebar has two options Scan label and Manual input
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Add Kit Sidebar has two options Scan label and Manual input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add kit] button to open sidebar
    ...     - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     - 1. Add Kit Sidebar has two options Scan label and Manual input

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-19    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-20: Check that Add standalone devices sidebar must be opened when clicking Add standalone devices button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Add standalone devices sidebar must be opened when clicking Add standalone devices button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add standalone devices] button and observe
    ...
    ...     Expected Results:
    ...     - 1. The Add standalone devices sidebar is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-20    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-21: Check that Add standalone device Sidebar has two options Scan label and Manual input
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Add standalone device sidebar has two options Scan label and Manual input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add standalone devices] button to open sidebar
    ...     - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     - 1. Add standalone device Sidebar has two options Scan label and Manual input

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-21    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-22: Check that kit can not be added to list when it belongs to another ticket, user click Add item in sidebar (Scan label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to list when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter which belongs to another ticket to select kit
    ...     – 2. Click [Add item] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "This kit is in transfer ticket <ticket id>"
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the kit to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-22    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-23: Check that kit can not be added to list when it belongs to another ticket, user click Add item in sidebar (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to list when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create ckBiokit ticket transfer page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search and select ID of Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter which belongs to another ticket to select kit
    ...     – 2. Click [Add item] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "This kit is in transfer ticket <ticket id>"
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the kit to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-23    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-24: Check that device can not be added to list when it belongs to another ticket, user click Add item in sidebar (Scan label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device can not be added to list when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add Standalone Device] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search and select ID of Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter which belongs to another ticket to select kit
    ...     – 2. Click [Add items] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device <Device ID> is in transfer ticket <ticket id>""
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the device to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-24    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-25: Check that device can not be added to list when it belongs to another ticket, user click Add item in sidebar (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device can not be added to list when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add Standalone Device] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search and select ID of Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter
    ...     – 2. Click [Add items] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device <Device ID> is in transfer ticket <ticket id>"
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the device to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-25    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-26: Check that kit can not be added to list when it is already added, user click Add item in sidebar (Scan label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to list when it is already added
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter to added to kit which is already added
    ...     – 2. Click [Add item] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Kit is already added to the list"
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the kit to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-26    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-27: Check that standalone device can not be added to list when it is already added, user click Add item in sidebar (Scan label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to list when it is already added
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone device] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter which is already added
    ...     – 2. Click [Add items] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device is already added to the list"
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the device to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-27    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-28: Check that kit can not be added to list when it is already added, user click Add item in sidebar (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to list when it is already added
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search and select ID of Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter to added to kit which is already added
    ...     – 2. Click [Add item] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Kit is already added to the list"
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the kit to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-28    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-29: Check that standalone device can not be added to list when it is already added, user click Add item in sidebar (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to list when it is already added
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone device] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search and select ID of Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter which is already added
    ...     – 2. Click [Add items] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device is already added to the list"
    ...     - 2. The sidebar is not closed
    ...     - 3. Can not added the device to the list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-29    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-30: Check that the confirmation modal must be displayed correctly when clicking Create ticket button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Confirmation modal must be displayed correctly when clicking Create ticket button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields
    ...     - 2. Click Create ticket button
    ...     - 3. Observe the modal
    ...
    ...     Expected Results:
    ...     - 1. The confirmation modal is displayed.
    ...     - 2. The message is "You are going to create this Transfer ticket. If you are sure you want to move forward with the action, please confirm below"
    ...     - 3. There are Okay and Cancel button.

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-30    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-31: Check that the ticket can be created after confirming
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: transfer ticket can be created after confirming
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Create ticket] button.
    ...     - 2. Click [Okay] button in the modal.
    ...     - 3. Observe the result.
    ...
    ...     Expected Results:
    ...     - 1. The ticket is changed status to "Pending" and moved to Pending tab.
    ...     - 2. The user is redirected to Pending ticket details page.

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-31    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-32: Check that the ticket the modal must be exited when clicking Cancel button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: ticket the modal must be exited when clicking Cancel button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Create ticket] button.
    ...     - 2. Click [Cancel] button in the modal.
    ...
    ...     Expected Results:
    ...     - 1. Exit the modal.

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-32    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-33: Check that the message must be displayed when clicking Return button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: the message must be displayed when clicking Return button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter some fields
    ...     - 2. Click [Return] button
    ...
    ...     Expected Results:
    ...     - 1. The message is displayed "You have unsaved changes. Are you sure you want to leave this page?"
    ...     - 3. There are Leave and Stay button.

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-33    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-34: Check that previous page must be displayed after selecting Leave button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: previous page must be displayed after selecting Leave button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter some fields
    ...     - 2. Click [Return] button to open the modal
    ...     - 2. Click [Leave] button in the modal.
    ...
    ...     Expected Results:
    ...     - 1. Discard the changes
    ...     - 2. The users are redirected to the previous page

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-34    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-35: Check that the return confirmation modal must be exited when clicking Stay button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: return confirmation modal must be exited when clicking Stay button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter some fields
    ...     - 2. Click [Return] button to open the modal
    ...     - 2. Click [Stay] button in the modal.
    ...
    ...     Expected Results:
    ...     - 1. Exit the modal.

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-35    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-36: Check that kit can not be added to ticket when it belongs to another ticket, user click Create ticket (Scan label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to ticket when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Add kit which belongs to another ticket
    ...     - 2. Click [Create ticket] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "This kit is in transfer ticket <ticket id>"
    ...     - 2. Can not create ticket

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-36    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-37: Check that device can not be added to ticket when it belongs to another ticket, user click Create ticket (Scan label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device can not be added to ticket when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Add device which belongs to another ticket
    ...     - 2. Click [Create ticket] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device <Device ID> is in transfer ticket <ticket id>"
    ...     - 2. Can not create ticket

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-37    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-38: Check that kit can not be added to ticket when it belongs to another ticket, user click Create ticket (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: kit can not be added to ticket when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Add kit which belongs to another ticket
    ...     - 2. Click [Create ticket] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "This kit is in transfer ticket <ticket id>"
    ...     - 2. Can not create ticket

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-38    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-39: Check that device can not be added to ticket when it belongs to another ticket, user click Create ticket (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device can not be added to ticket when it belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Add device which belongs to another ticket
    ...     - 2. Click [Create ticket] button
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device <Device ID> is in transfer ticket <ticket id>"
    ...     - 2. Can not create ticket

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-39    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#SHIPPING INFORMATION
BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-40: Check that shipping information must be displayed fully elements
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Shipping information must be displayed fully elements
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe the shipping information section
    ...
    ...     Expected Results:
    ...     - 1. All elements are displayed: recipient address (recipient name, country, address, secondary address, city, state, zip code, contact phone number, contact email)

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-40    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-41: Check that recipient address information must be automatically filled in based on address input
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: recipient address information must be automatically filled in based on address input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter and select the address suggested by the system in the address field
    ...     - 2. Observe fields
    ...
    ...     Expected Results:
    ...     - 1. The information is automatically filled in 3 fields namely City, State and Zip code based on address.

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-41    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-42: Check that recipient information must be autofilled the same address as customer information when "Same as customer address" toggle switch is turned on
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: recipient information must be autofilled the same address as customer information when "Same as customer address" toggle switch is turned on
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter customer information
    ...     - 2. Turn on [Same as customer address]
    ...     - 3. Observe and compare customer information with recipient information
    ...
    ...     Expected Results:
    ...     - 1. Shipping information is autofilled the same address as the customer information
    ...     - 2. Disable all fields in the Shipping Information section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-42    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-43: Check that Secondary Address field must be optional (Shipping information)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Secondary Address field must be optional (Shipping information)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. In Shipping information section, observe Secondary Address field
    ...     - 2. Leave the Secondary Address is blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The label of Secondary Address field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-43    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - ADD KIT - SCAN LABEL
BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-01: Check that Scan label information must be fully displayed when user select Scan label
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Scan label information must be fully displayed when user select Scan label
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add kit] button to open sidebar
    ...     - 2. Select Scan label and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + "Scan a QR or Data Matrix code of any device in the kit and the whole kit shall be selected. Once you’ve selected the kit you can press the [Enter] key or the “Add item” button to add them to the item list."
    ...     + Kit information
    ...     + [Keep adding kit] checkbox
    ...     + [Add item] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-02: Check that whole Kit must be selected when user scan QR/Data Matrix code of Digital Thermometer (kit has Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Digital thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-03: Check that whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff (kit has Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Blood Pressure Cuff
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-04: Check that whole Kit must be selected when user scan QR/Data Matrix code of Digital Thermometer (kit does not have Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Digital thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer which is in the kit does not have Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter: Not included

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-05: Check that whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff (kit have Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Blood Pressure Cuff
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter: Not included

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-06: Check that Kit devices must have "Inventory" location to be able to be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit must have "Inventory" location to be able to be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer/Blood Pressure Cuff which have location is "Inventory"
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID (if available)

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-07: Check that Kit devices cannot be selected if location is not Inventory
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit devices cannot be selected if location is not Inventory
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer/Blood Pressure Cuff which have location is not "Inventory"
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Kit is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-08: Check that invalid Digital Thermometer ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Digital Thermometer ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Digital Thermometer ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-08    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-09: Check that invalid Blood Pressure Cuff ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Blood Pressure Cuff ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Blood Pressure Cuff ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-10: Check that invalid Pulse Oximeter ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Pulse Oximeter ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Pulse Oximeter ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-12: Check that device does not belong to a KIT cannot be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Device does not belong to a KIT cannot be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not belong to a KIT
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device does not belong to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-12    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-13: Check that message is displayed when scanned kit does not have Pulse Oximeter
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Message is displayed when scanned kit does not have Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "The pulse oximeter is not included. You can scan the device to add it to the kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-13    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-14: Check that Pulse Oximeter can be added to the kit when scanned kit does not have one
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can be added to the kit when scanned kit does not have one
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to a kit
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID
    ...     – 2. Message is displayed “Please note that the system only adds the device to the kit after the ticket is marked as completed”

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-14    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-15: Check that Pulse Oximeter can not be added to the kit when it already belongs in another kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can not be added to the kit when it already belongs in another kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which already belongs to another kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-15    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-16: Check that Pulse Oximeter must be removed when clicking Remove button after scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter must be removed when clicking Remove button after scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to a kit
    ...     - 3. Click Remove button at the end of the Pulse Oximeter label
    ...
    ...     Expected Results:
    ...     - 1. The Pulse Oximeter is removed
    ...     - 2. Pulse Oximeter field in Kit information is displayed "Not included"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-16    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-17: Check that Pulse Oximeter cannot be added when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter cannot be added when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-17    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-18: Check that new kit is overwritten selected kit if user scans another device ID that belongs to another kit after a kit was selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: If the user scans another device ID that belongs to another kit after a kit was selected, the new kit shall overwrite the selected kit as the new selected kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter (if not have)
    ...     - 3. Scan QR/Data Matrix code of device in another kit
    ...
    ...     Expected Results:
    ...     - 1. The new kit is overwritten selected kit
    ...     - 2. The device id in new kit is displayed in kit information

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-18    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-19: Check that Pulse Oximeter must be displayed "Not included" in case in overwritten kit does not have one
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: If the new kit does not have a Pulse Oximeter device selected and the previous selected kit does, the new kit does not inherit the previous kit’s Pulse Oximeter device and the field stays “not included”
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which have Pulse Oximeter
    ...     - 3. Scan QR/Data Matrix code of device in another kit which does not have Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. The new kit is overwritten selected kit
    ...     - 2. The Pulse Oximeter is "Not included"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-19    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-20: Check that new Pulse Oximeter is overwritten selected one if user scans another Pulse Oximeter ID after a kit was selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: If the user scans another Pulse Oximeter after one was selected, the new Pulse Oximeter shall overwrite the selected Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter
    ...     - 3. Scan QR/Data Matrix code of another Pulse Oximeter which not belongs to another kit
    ...
    ...     Expected Results:
    ...     - 1. The new Pulse Oximeter is overwritten selected Pulse Oximeter
    ...     - 2. The new Pulse Oximeter is displayed in kit information

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-20    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-21: Check that kit which has Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Select Keep adding kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to transfer ticket
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-21    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-22: Check that kit which has Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-22    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-23: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff of kit which not have Pulse oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to another kit
    ...     - 3. Select Keep adding kit
    ...     - 4. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-23    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-24: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff of kit which not have Pulse oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to another kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to transfer ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KS-BIOK-24    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - ADD KIT - INPUT
BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-01: Check that Manual Input information must be fully displayed when user select Manual Input
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Manual Input information must be fully displayed when user select Manual Input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add kit] button to open sidebar
    ...     - 2. Select Manual Input and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + “Search & select a kit by its device ID” search box
    ...     + Kit information
    ...     + [Keep adding kit] checkbox
    ...     + [Add item] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-02: Check that “Search & select a kit by its device ID” can be searched by Digital Thermometer
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” can be searched by Digital Thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested kits are displayed correctly based on Digital Thermometer ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-03: Check that “Search & select a kit by its device ID” can be searched by Blood Pressure Cuff
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” can be searched by Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Blood Pressure Cuff ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested kits are displayed correctly based on Blood Pressure Cuff ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-04: Check that “Search & select a kit by its device ID” can be searched by Pulse Oximeter (kit has Pulse Oximeter from scratch)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” can be searched by Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Pulse Oximeter ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested kits are displayed correctly based on Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-05: Check that “Search & select a kit by its device ID” results are available kits which are in inventory, not be added to item list
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” results are available kits which are in inventory, not be added to item list
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter ID
    ...     – 2. Observe the suggestions
    ...
    ...     Expected Results:
    ...     - 1. Display only suggestions which are in inventory, not be added to item list
    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-06: Check that suggestions must be displayed all elements
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: suggestions must be displayed all elements
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     – 1. In search box, enter device ID
    ...     - 2. Observe the suggestions
    ...
    ...     Expected Results:
    ...     - 1. Suggestions shall display the Digital Thermometer, Blood Pressure Cuff, and Pulse Oximeter device IDs included in the kit
    ...     - 2. If Pulse Oximeter is unavailable, display "Not included"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-07: Check that suggestions can be selected to select the kit which doesn’t have Pulse oximeter from scratch
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Suggestions can be selected to select the kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter device ID
    ...     - 2. Select the suggestion
    ...
    ...     Expected Results:
    ...     - 1. The suggestion can be selected
    ...     - 2. The selected kit is displayed information in kit information
    ...     - 3. Pulse Oximeter field is displayed "Not included"
    ...     - 4. Message is displayed "The pulse oximeter device is not included. You can select a device to add it to the kit."
    ...     - 5. The search and select box is displayed to allows the user to search device

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-09: Check that standalone Pulse Oximeter can be selected when input kit does not have one (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can be selected when input kit does not have one (Manual Input)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of device in kit which does not have Pulse Oximeter
    ...     - 2. Search & select Enter standalone Pulse Oximeter ID which in Inventory
    ...
    ...     Expected Results:
    ...     - 1. Pulse Oximeter is selected
    ...     – 2. Message is displayed “Please note that the system only adds the device to the kit after the ticket is marked as completed”

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-10: Check that Pulse Oximeter can not be selected to the kit when it already belongs in another kit (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can not be selected to the kit when it already belongs in another kit (Manual Input)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of device in kit which does not have Pulse Oximeter
    ...     - 2. Search & select ID of Pulse Oximeter which already belongs to another kit
    ...
    ...     Expected Results:
    ...     - 1. No suggestion of Pulse Oximeter which already belongs to another kit


    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-11: Check that Pulse Oximeter cannot be selected when it is not in "Inventory" (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter cannot be selected when it is not in "Inventory" (Manual Input)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of device in kit which does not have Pulse Oximeter
    ...     - 2. Search & select ID of standalone Pulse Oximeter which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-11    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-12: Check that kit which has Pulse oximeter from scratch, can be added to list when whole kit is selected in Manual Input (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to list when whole kit is selected in Manual Input (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Select Keep adding kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to list
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-12    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-13: Check that kit which has Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is selected in Manual Input (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-13    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-14: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is selected in Manual Input (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of Digital Thermometer/Blood pressure cuff of kit which not have Pulse oximeter
    ...     - 2. Search & select ID of Pulse Oximeter which does not belong to another kit
    ...     - 3. Select Keep adding kit
    ...     - 4. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-14    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-15: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is selected in Manual Input (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID code of Digital Thermometer/Blood pressure cuff of kit which does not have Pulse oximeter
    ...     - 2. Search & select ID code of Pulse Oximeter which does not belong to another kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to transfer ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-15    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-16: Check that kit information is retained when switching between input modes
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit information is retained when switching between input modes
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID code of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Switch to Scan label tab
    ...     - 3. Observe kit information
    ...
    ...     Expected Results:
    ...     - 1. Kit information is retained

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-KI-BIOK-16    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - ADD STANDALONE DEVICE - SCAN LABEL
BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-01: Check that Scan label information must be fully displayed when user select Scan label
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Scan label information must be fully displayed when user select Scan label
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add standalone devices] button to open sidebar
    ...     - 2. Select Scan label and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + " Scan a QR or Data Matrix code of the Biokit device you want to be added to the transfer ticket. You can scan multiple devices to be added to this list"
    ...     + Device type
    ...     + Device ID
    ...     + [Add items] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-02: Check that device must be selected when user scan QR/Data Matrix code of Digital Thermometer
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected when user scan QR/Data Matrix code of Digital Thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer
    ...
    ...     Expected Results:
    ...     - 1. Digital Thermometer information (ID, type) is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-03: Check that device must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Blood Pressure Cuff
    ...
    ...     Expected Results:
    ...     - 1. Blood Pressure Cuff information (ID, type) is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-04: Check that device must be selected when user scan QR/Data Matrix code of Pulse Oximeter
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected when user scan QR/Data Matrix code of Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. Pulse Oximeter information (ID, type) is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-05: Check that invalid Digital Thermometer ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Digital Thermometer ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Digital Thermometer ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-06: Check that invalid Blood Pressure Cuff ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Blood Pressure Cuff ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Blood Pressure Cuff ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-07: Check that invalid Pulse Oximeter ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Pulse Oximeter ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Pulse Oximeter ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-08: Check that Digital Thermometer can not be selected when it already belongs in a kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Digital Thermometer can not be selected to the kit when it already belongs in a kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer which already belongs to a kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-08    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-09: Check that Blood Pressure Cuff can not be selected when it already belongs in a kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Blood Pressure Cuff can not be selected to the kit when it already belongs in a kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Blood Pressure Cuff which already belongs to a kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-10: Check that Pulse Oximeter can not be selected when it already belongs in a kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can not be selected to the kit when it already belongs in a kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Pulse Oximeter which already belongs to a kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-11: Check that Digital Thermometer cannot be selected when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Digital Thermometer cannot be selected when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-11    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-12: Check that Blood Pressure Cuff cannot be selected when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Blood Pressure Cuff cannot be selected when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Blood Pressure Cuff which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-12    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-13: Check that Pulse Oximeter cannot be selected when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter cannot be selected when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Pulse Oximeter which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-13    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-14: Check that available Digital Thermometer can be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: available Digital Thermometer can be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer which is in inventory and not belongs in a kit
    ...
    ...     Expected Results:
    ...     - 1. The scanned Digital Thermometer is selected and displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-14    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-15: Check that available Blood Pressure Cuff can be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: available Pulse Oximeter can be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Blood Pressure Cuff which is in inventory and not belongs in a kit
    ...
    ...     Expected Results:
    ...     - 1. The scanned Blood Pressure Cuff is selected and displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-15    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-16: Check that available Pulse Oximeter can be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: available Pulse Oximeter can be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Pulse Oximeter which is in inventory and not belongs in a kit
    ...
    ...     Expected Results:
    ...     - 1. The scanned Pulse Oximeter is selected and displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-16    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-17: Check that at the end of each row of device has Delete button (Scan Label - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of available device
    ...     - 2. Observe device information rows in device table
    ...
    ...     Expected Results:
    ...     - 1. At the end of each row has Delete button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-17    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-18: Check that device row must be removed when clicking Delete button (Scan Label - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device row must be removed when clicking Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of available device
    ...     - 2. Click [Delete] button at the end of device row and observe
    ...
    ...     Expected Results:
    ...     - 1. The device is removed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-18    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-19: Check that message is displayed when the standalone device list is empty (Scan Label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Observe the device information table
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "All selected devices will appear here"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-19    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-20: Check that devices can be added to ticket (Scan Label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: devices can be added to ticket (Scan Label)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan Label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of available device
    ...     - 2. Click [Add items]
    ...
    ...     Expected Results:
    ...     - 1. Devices are added to ticket
    ...     - 2. The Add Standalone devices sidebar is closed
    ...     - 3. The device information are displayed in standalone devices section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SS-BIOK-20    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - ADD STANDALONE DEVICE - INPUT
BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-01: Check that Manual Input information must be fully displayed when user select Manual Input
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Manual Input information must be fully displayed when user select Manual Input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add standalone devices] button to open sidebar
    ...     - 2. Select Manual Input and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + “Search & select a kit by its device ID” search box
    ...     + Kit information
    ...     + [Keep adding kit] checkbox
    ...     + [Add item] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-02: Check that “Search & select a device by its ID” can be searched by Digital Thermometer
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” can be searched by Digital Thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested devices are displayed correctly based on Digital Thermometer ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-03: Check that “Search & select a device by its ID” can be searched by Blood Pressure Cuff
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” can be searched by Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Blood Pressure Cuff ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested devices are displayed correctly based on Blood Pressure Cuff ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-04: Check that “Search & select a device by its ID” can be searched by Pulse Oximeter
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” can be searched by Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Pulse Oximeter ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested devices are displayed correctly based on Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-05: Check that “Search & select a device by its ID” results are available devices which are in inventory, not be added to item list
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” results are available devices which are in inventory, not be added to item list
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter ID
    ...     – 2. Observe the suggestions
    ...
    ...     Expected Results:
    ...     - 1. Display only suggestions are devices which are in inventory, not be added to item list

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-06: Check that device must be selected and displayed when selecting suggestion
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected and displayed when select suggestion
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter ID
    ...     – 2. Select the suggestion
    ...     – 3. Observe the device information table
    ...
    ...     Expected Results:
    ...     - 1. Device must be selected and displayed Device ID and Device type

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-07: Check that devices can be added to list (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: devices in Manual Input can be added to list
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of available Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 3. Click [Add items]
    ...
    ...     Expected Results:
    ...     - 1. Devices are added to list
    ...     - 2. The Add Standalone devices sidebar is closed
    ...     - 3. The device information are displayed in standalone devices section

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-08: Check that at the end of each row of device has Delete button (Manual Input - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select available device
    ...     - 2. Observe device information rows in device table
    ...
    ...     Expected Results:
    ...     - 1. At the end of each row has Delete button

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-08    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-09: Check that device row must be removed when clicking Delete button (Manual Input - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device row must be removed when clicking Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select available device
    ...     - 2. Click [Delete] button at the end of device row and observe
    ...
    ...     Expected Results:
    ...     - 1. The device is removed

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-10: Check that message is displayed when the standalone device list is empty (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Observe the device information table
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "All selected devices will appear here"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-SI-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - CUSTOMER INFO - FACILITY
BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-01: Check that Order number field must be optional (Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order number field must be optional (Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe Order number field
    ...     - 2. Leave the Order number is blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The label of Order number field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-02: Check that Order date field must be optional (Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order date field must be optional (Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Observe Order date field
    ...     - 2. Leave the Order date is blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The label of Order date field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-03: Check that user can not select future Order date (Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The user can not select future Order date (Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Select future date in Order date field
    ...
    ...     Expected Results:
    ...     - 1. The future date is blocked in date picker and can not be selected

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-04: Check that additional fields are displayed when user select customer type is Facility
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: When user select customer type is Facility, additional fields are displayed
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Select Customer type is Facility
    ...     - 2. Observe Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Additional fields are displayed (Facility name)

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-05: Check that Facility name can be suggested when user type in dropdown menu (Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Facility name can be suggested when user type in dropdown menu (Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. In Facility name dropdown menu, enter facility name
    ...     - 2. Observe the field
    ...
    ...     Expected Results:
    ...     - 1. Suggested facility names are displayed
    ...     - 2. Suggested names corresponding to the entered keyword

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-06: Check that suggested Facility name information must be correct (Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Suggested Facility name information must be correct (Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. In Facility name dropdown menu, enter facility name
    ...     - 2. Observe the field
    ...
    ...     Expected Results:
    ...     - 1. The suggested facility name information matches with information of facility (Facility name, Facility ID, Facility status)
    ...     - 2. If any information is null, display "--"

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-F-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - CUSTOMER INFO - CUSTOMER
BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-01: Check that Order number field must be optional (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order number field must be optional (End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe Order number field
    ...     - 2. Leave the Order number is blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The label of Order number field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-02: Check that Order date field must be optional (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order date field must be optional (End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe Order date field
    ...     - 2. Leave the Order date is blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The label of Order date field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-03: Check that user can not select future Order date (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The user can not select future Order date (End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Select future date in Order date field
    ...
    ...     Expected Results:
    ...     - 1. The future date is blocked in date picker and can not be selected

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-04: Check that additional fields are displayed when user select customer type is End User
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: When user select customer type is End User, additional fields are displayed
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Select Customer type is End User
    ...     - 2. Observe Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Additional fields are displayed (Customer first name, Customer last name, Country, Address, Secondary Address, City, State, Zipcode, Contact phone number, Contact email)

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-05: Check that Secondary Address field must be optional (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Secondary Address field must be optional (End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Observe Secondary Address field
    ...     - 2. Leave the Secondary Address is blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The label of Secondary Address field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-06: Check that Address information can be automatically filled in based on user entered address (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Address information can be automatically filled in based on user entered address (End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Enter and select the address suggested by the system in the address field
    ...     - 2. Observe fields
    ...
    ...     Expected Results:
    ...     - 1. Address information (City, State, Zipcode) is automatically filled in

    [Tags]    BSP-SND-TRANSFER-TRANSF-CREATE-BIOK-E-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#VIEW DETAILS
BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-01: Check Pending Biokit Transfer ticket details must be displayed all elements
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pending Biokit Transfer ticket details must be displayed all elements
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the page.
    ...
    ...     Expected Results:
    ...     - 1. The page must be displayed fully information:
    ...     + Header (Transfer ID, Purpose: Transfer, Device type: Biokit)
    ...     + Customer information (Customer type, Order number, Order date, additional data depends on customer type, Edit button)
    ...     + Item list (Index number, Kit no, Digital Thermometer, Blood Pressure Cuff, 	Pulse Oximeter, Label, Delete button)
    ...     + Item list (Index number, Device type, Label, Delete button)
    ...     + Other information (Notification email, Notes)
    ...     + Shipping information (Recipient address)
    ...     + Tracking information (Create shipment order button, Label, Shipped date, Estimated arrival, Signature confirmation, Items, Carrier, Fare, Timeline, Refund status)

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-01    RS-085-03    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-02: Check that information in Pending Biokit Transfer ticket details must be displayed correctly
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: information in Pending Biokit Transfer ticket details must be displayed correctly
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the information.
    ...
    ...     Expected Results:
    ...     - 1. Displayed information must match information in database

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-02    RS-085-03    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#EDIT - PENDING
BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-03: Check that customer information can be edited when customer type is End User in edit sidebar
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: customer information can be edited when customer type is End User in edit sidebar
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Edit customer information and Save
    ...     - 3. Observe customer information
    ...
    ...     Expected Results:
    ...     - 1. Save the changes and display new value
    ...     - 2.  The sidebar is closed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-03    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-04: Check that customer information additional fields must be displayed when customer type is End User in edit sidebar
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: customer information additional fields must be displayed when customer type is End User in edit sidebar
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Observe customer information
    ...
    ...     Expected Results:
    ...     - 1. Additional fields are displayed (Customer first name, Customer last name, Country, Address, City, State, Zipcode, Contact phone number, Contact email)

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-04    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-05: Check that customer information can be edited when customer type is Facility in edit sidebar
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: customer information can be edited when customer type is Facility in edit sidebar
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Edit customer information and Save
    ...     - 3. Observe customer information
    ...
    ...     Expected Results:
    ...     - 1. Save the changes and display new value
    ...     - 2.  The sidebar is closed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-05    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-06: Check that customer information additional fields must be displayed when customer type is Facility in edit sidebar
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: customer information additional fields must be displayed when customer type is Facility in edit sidebar
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Observe customer information
    ...
    ...     Expected Results:
    ...     - 1. Additional fields are displayed (Facility name)
    ...     - 2. Facility name is disabled

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-06    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-07: Check that sidebar is closed when clicking [Close] button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: sidebar is closed when clicking [Close] button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Click [Close] button
    ...
    ...     Expected Results:
    ...     - 1. Discard the changes
    ...     - 2. The sidebar is closed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-07    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-08: Check that customer type field is disabled in edit sidebar
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: customer information can be edited when customer type is End User in edit sidebar
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Observe customer type field
    ...
    ...     Expected Results:
    ...     - 1. The customer type is disabled

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-08    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-09: Check that Order number field must be optional in edit sidebar (Transfer - End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order number field must be optional in edit sidebar (Transfer - End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Leave the Order number is blank
    ...     - 3. Enter required fields and click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. The label of Order number field contains "Optional"
    ...     - 2. The edited information can be saved

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-09    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-10: Check that Order date field must be optional in edit sidebar (Transfer - End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order date field must be optional in edit sidebar (Transfer - End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Leave the Order date is blank
    ...     - 3. Enter required fields and click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. The label of Order date field contains "Optional"
    ...     - 2. The edited information can be saved

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-10    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-11: Check that user can not select future Order date in edit sidebar (Transfer - End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order date field must be optional in edit sidebar (Transfer - End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Select future date in Order date field
    ...
    ...     Expected Results:
    ...     - 1. The future date is blocked in date picker and can not be selected

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-11    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-12: Check that Address information can be automatically filled in based on input address in edit sidebar (Transfer - End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Address information can be automatically filled in based on input address in edit sidebar (Transfer - End User)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Enter and select the address suggested by the system in the address field
    ...     - 2. Observe fields
    ...
    ...     Expected Results:
    ...     - 1. Address information (City, State, Zipcode) is automatically filled in

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-12    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-13: Check that Order number field must be optional in edit sidebar (Transfer - Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order number field must be optional in edit sidebar (Transfer - Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Leave the Order number is blank
    ...     - 3. Enter required fields and click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. The label of Order number field contains "Optional"
    ...     - 2. The edited information can be saved

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-13    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-14: Check that Order date field must be optional in edit sidebar (Transfer - Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order date field must be optional in edit sidebar (Transfer - Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Leave the Order date is blank
    ...     - 3. Enter required fields and click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. The label of Order date field contains "Optional"
    ...     - 2. The edited information can be saved

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-14    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-15: Check that user can not select future Order date in edit sidebar (Transfer - Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Order date field must be optional in edit sidebar (Transfer - Facility)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in Customer information section to open sidebar
    ...     - 2. Select future date in Order date field
    ...
    ...     Expected Results:
    ...     - 1. The future date is blocked in date picker and can not be selected

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-15    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-16: Check that notification emails can not be empty
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: notification emails can not be empty
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click Delete button at the end of each email to remove it.
    ...     - 2. Remove all the email.
    ...     - 3. Create the ticket.
    ...
    ...     Expected Results:
    ...     - 1. Notification email field is not empty.
    ...     - 2. Last notification email is saved.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-16    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-17: Check that notification emails can be entered using Space bar or [,] key
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: notification emails can be entered using Space bar or [,] key
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Press the [Space bar] or [,] key to complete an email.
    ...
    ...     Expected Results:
    ...     - 1. The emails are entered

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-17    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-18: Check that other information can be edited
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: other information can be edited
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page     ...
    ...     Test Steps:
    ...     - 1. Add/Remove notification email.
    ...     - 2. Edit notes and click Save button.
    ...
    ...     Expected Results:
    ...     - 1. Notification email and notes are saved and displayed new value.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-18   RS-086-03     R1    manual    SC-1.11.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-19: Check that shipping information must be displayed fully elements
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Shipping information must be displayed fully elements
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Observe the shipping information section
    ...
    ...     Expected Results:
    ...     - 1. All elements are displayed: recipient address (country, address, secondary address, city, state, zip code, contact phone number, contact email)

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-19    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-20: Check that shipping information must be automatically filled in based on address input when editing address
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: recipient address information must be automatically filled in based on address input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in shipping information section
    ...     - 2. Edit address: enter and select the address suggested by the system in the address field
    ...     - 3. Observe fields
    ...
    ...     Expected Results:
    ...     - 1. The information is automatically filled in 3 fields namely City, State and Zip code based on address.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-20    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-21: Check that shipping information can be edited
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: shipping information can be edited
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in shipping information section
    ...     - 3. Edit address and click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Save the changes
    ...     - 2. New address is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-21    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-22: Check that shipping address edit mode must be exited when clicking Cancel button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: shipping address edit mode must be exited when clicking Cancel button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket details page
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button in shipping information section
    ...     - 3. Edit Sender name/country/address/secondary address/city/state/zip code/contact phone number/contact email.
    ...     - 3. Click Cancel button.
    ...     - 4. Observe the changes.
    ...
    ...     Expected Results:
    ...     - 1. Exit the edit mode.
    ...     - 1. The information is not changed.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-22   RS-86-03    manual    SC-1.11.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#EDIT - PENDING - SIGNATURE
BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-01: Check that Signature Confirmation is displayed same as designed

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Shipment page, Signature Confirmation is displayed same as designed
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:

    ...     - Observe the Signature Confirmation field.
    ...
    ...     Expected Results:
    ...     - Signature Confirmation is display same as designed.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-01    RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-02: Check that Signature Confirmation modal must be displayed when clicking Change button

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Shipment page, Signature Confirmation modal is displayed when clicking Change button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - Click [Change] button in Signature Confirmation field.
    ...
    ...     Expected Results:
    ...     - Signature Confirmation modal is displayed.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-02    RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-03: Check that Signature Confirmation modal must be displayed correctly

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Shipment page, Signature Confirmation modal must be displayed correctly when clicking Change button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Observe the modal.
    ...
    ...     Expected Results:
    ...     - 1. Same as designed
    ...     - 2. “Require a signature for delivery” has 2 options: Not required and Required

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-03    RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-04: Check that “Not Required” option must be default

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Signature Confirmation modal, “Not Required” must be default option
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Observe the modal.
    ...
    ...     Expected Results:
    ...     - Not Required option is default

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-04    RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-05: Check that when “Not required” option is selected must not be displayed Signed options

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Signature Confirmation modal, when select “Not required”, there are not displayed Signed options
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Not Required” (if not default)
    ...
    ...     Expected Results:
    ...     - 1. Not Required option is selected

    ...     - 2. Do not display Signed option

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-05    RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-06: Check that when “Required” option is selected must be displayed Signed options

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Signature Confirmation modal, when select “Required” must be displayed Signed options
    ...
    ...     Precondition: The Operation Manager/Operation Staff is on the Create Shipment page
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Required” option
    ...
    ...     Expected Results:
    ...     - 1. Required option is selected
    ...     - 2. Signed option is displayed fully below
    ...     - Anyone can sign (Cost $2.00+) – first selected by default
    ...     - An adult must sign (Cost $5.00+)

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-06    RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-07: Check that when “Required” option is selected must be displayed message

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Signature Confirmation modal, when select “Required” must be displayed message
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Required” option
    ...
    ...     Expected Results:
    ...     - 1. Required option is selected
    ...     - 2. Display message “The cost comes from the carrier and will be included in your selected rate”

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-07   RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-08: Check “Anyone can sign” option must be default

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Signature Confirmation modal, “Anyone can sign (Cost $2.00+)” must be default option

    ...
    ...     Precondition: The Operation Manager/Operation Staff is on the Create Shipment page
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Required” option.
    ...     - 3. Observe Signed option.
    ...
    ...     Expected Results:
    ...     - Exit the modal without making any changes.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-08   RS-089-01   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-09: Check that Signature Confirmation must be changed after clicking Save option

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Signature Confirmation modal, after clicking Save, exit the modal with the changes saved
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Required”, “Anyone can sign (Cost $2.00+)”.

    ...     - 2. Click [Save] button.
    ...
    ...     Expected Results:
    ...     - 1. Signature Confirmation information is changed
    ...     - 2. Exit the modal

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-09    RS-089-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-10: Check that modal must be exited when clicking Cancel option

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The modal must be exited when clicking Cancel option.
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Required”, “Anyone can sign (Cost $2.00+)”.
    ...     - 3. Click [Save] button.
    ...
    ...     Expected Results:
    ...     - Exit the modal without making any changes.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-10   RS-089-01   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-11: Check that the rates must be increased by more than $2.00 when selecting “Anyone can sign”

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The rates is increased by more than $2.00 when selecting “Anyone can sign (Cost $2.00+)”
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Required”, “Anyone can sign (Cost $2.00+)”.
    ...     - 3. Click [Save] button.
    ...     - 4. Observe the Rates.
    ...
    ...     Expected Results:
    ...     - The rates is increased by more than $2.00.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-11   RS-089-01   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-12: Check that the rates must be increased by more than $5.00 when selecting “An adult must sign”

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The rates is increased by more than $5.00 when selecting “An adult must sign (Cost $5.00+)”
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Required”, “An adult must sign (Cost $5.00+)”.
    ...     - 3. Click [Save] button.
    ...     - 4. Observe the Rates.
    ...
    ...     Expected Results:
    ...     - The rates is increased by more than $5.00.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-12    RS-089-01   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-13: Check that the rates must not changed when selecting “Not Required”

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The rates is not changed when selecting “Not Required”
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Not Required”.
    ...     - 3. Click [Save] button.
    ...     - 4. Observe the Rates.
    ...
    ...     Expected Results:
    ...     - The rates is not changed.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-13    RS-089-01   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-14: Check that the rates must change when switching to another option

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The Rates must change when switching to another option
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Anyone can sign (Cost $2.00+)”.
    ...     - 3. Click [Save] button.
    ...     - 4. Observe the Rates.
    ...     - 5. Click [Change] button in Signature Confirmation field.
    ...     - 6. Select “Not Required”.
    ...     - 7. Observe the Rates.
    ...
    ...     Expected Results:
    ...     - The rates are changed.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-14   RS-089-01   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-15: Check that the Signature must be displayed correctly in Preview shipment order

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description:  the Signature Confirmation must be displayed correctly in Preview shipment order
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Shipment Order page of Pending Biokit transfer ticket details
    ...
    ...     Test Steps:
    ...     - 1. Click [Change] button in Signature Confirmation field.
    ...     - 2. Select “Anyone can sign (Cost $2.00+)”.
    ...     - 3. Click [Save] button.
    ...     - 4. Observe the Rates.
    ...     - 5. Click [Preview] button.
    ...     - 6. Observe the Rates and Signature Confirmation in preview mode.
    ...
    ...     Expected Results:
    ...     - 1. Rates and Signature Confirmation is displayed correctly

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-SIGN-15    RS-089-01   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#EDIT - PENDING - REFUND
BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-01: Check that Refund label must be displayed same as designed

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed same as designed (Device Sales)
    ...
    ...     Precondition:

    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - Observe Refund label in Tracking information.
    ...
    ...     Expected Results:
    ...     - 1. Refund label option is displayed same as designed (position, font style, font size, color...)
    ...     - 2. The message is displayed when hovering the “?” button

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-01    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-02: Check that Refund label must be displayed correctly when Refund type is “Refund requested”

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund requested”
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund requested”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is orange.
    ...     - 2. Display message “Refunds typically take 14 days to credit your account”

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-02    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-03: Check that Refund label must be displayed correctly when Refund type is “Refunded”

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refunded”
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refunded”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is green.

    ...     - 2. Display message “The cost of this label has been credited to your account”

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-03    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-04: Check that Refund label must be displayed correctly when Refund type is “Refund rejected”

    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Device Transfer ticket details, Refund label must be displayed correctly when Refund type is “Refund rejected”
    ...
    ...     Precondition:
    ...     - 1.  The Operation Staff or Operation Manager is on the Device Transfer ticket details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe Refund label in Tracking information.
    ...     - 2. When refund type is “Refund rejected”, hover over the “?” button
    ...
    ...     Expected Results:
    ...     - 1. Refund label color is red.
    ...     - 2. Display message “Your refund was unsuccessful, the shipping label may have been used”

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-RF-04    RS-085-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#EDIT - PENDING - ADD KIT - SCAN LABEL
BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-01: Check that Scan label information must be fully displayed when user select Scan label
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Scan label information must be fully displayed when user select Scan label
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add kit] button to open sidebar
    ...     - 2. Select Scan label and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + "Scan a QR or Data Matrix code of any device in the kit and the whole kit shall be selected. Once you’ve selected the kit you can press the [Enter] key or the “Add item” button to add them to the item list."
    ...     + Kit information
    ...     + [Keep adding kit] checkbox
    ...     + [Add item] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-02: Check that whole Kit must be selected when user scan QR/Data Matrix code of Digital Thermometer (kit has Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Digital thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-03: Check that whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff (kit has Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Blood Pressure Cuff
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-04: Check that whole Kit must be selected when user scan QR/Data Matrix code of Digital Thermometer (kit does not have Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Digital thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer which is in the kit does not have Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter: Not included

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-05: Check that whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff (kit have Pulse Oximeter)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Whole Kit must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Blood Pressure Cuff
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter: Not included

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-06: Check that Kit devices must have "Inventory" location to be able to be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit must have "Inventory" location to be able to be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer/Blood Pressure Cuff which have location is "Inventory"
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID (if available)

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-07: Check that Kit devices cannot be selected if location is not Inventory
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit devices cannot be selected if location is not Inventory
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer/Blood Pressure Cuff which have location is not "Inventory"
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Kit is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-08: Check that invalid Digital Thermometer ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Digital Thermometer ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Digital Thermometer ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-08    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-09: Check that invalid Blood Pressure Cuff ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Blood Pressure Cuff ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Blood Pressure Cuff ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-10: Check that invalid Pulse Oximeter ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Pulse Oximeter ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Pulse Oximeter ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-12: Check that device does not belong to a KIT cannot be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Device does not belong to a KIT cannot be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not belong to a KIT
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device does not belong to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-12    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-13: Check that message is displayed when scanned kit does not have Pulse Oximeter
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Message is displayed when scanned kit does not have Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "The pulse oximeter is not included. You can scan the device to add it to the kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-13    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-14: Check that Pulse Oximeter can be added to the kit when scanned kit does not have one
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can be added to the kit when scanned kit does not have one
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to a kit
    ...
    ...     Expected Results:
    ...     - 1. The Kit is selected and be displayed information in Kit information
    ...     + Digital Thermometer ID
    ...     + Blood Pressure Cuff ID
    ...     + Pulse Oximeter ID
    ...     – 2. Message is displayed “Please note that the system only adds the device to the kit after the ticket is marked as completed”

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-14    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-15: Check that Pulse Oximeter can not be added to the kit when it already belongs in another kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can not be added to the kit when it already belongs in another kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which already belongs to another kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-15    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-16: Check that Pulse Oximeter must be removed when clicking Remove button after scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter must be removed when clicking Remove button after scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to a kit
    ...     - 3. Click Remove button at the end of the Pulse Oximeter label
    ...
    ...     Expected Results:
    ...     - 1. The Pulse Oximeter is removed
    ...     - 2. Pulse Oximeter field in Kit information is displayed "Not included"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-16    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-17: Check that Pulse Oximeter cannot be added when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter cannot be added when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which does not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-17    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-18: Check that new kit is overwritten selected kit if user scans another device ID that belongs to another kit after a kit was selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: If the user scans another device ID that belongs to another kit after a kit was selected, the new kit shall overwrite the selected kit as the new selected kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter (if not have)
    ...     - 3. Scan QR/Data Matrix code of device in another kit
    ...
    ...     Expected Results:
    ...     - 1. The new kit is overwritten selected kit
    ...     - 2. The device id in new kit is displayed in kit information

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-18    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-19: Check that Pulse Oximeter must be displayed "Not included" in case in overwritten kit does not have one
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: If the new kit does not have a Pulse Oximeter device selected and the previous selected kit does, the new kit does not inherit the previous kit’s Pulse Oximeter device and the field stays “not included”
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which have Pulse Oximeter
    ...     - 3. Scan QR/Data Matrix code of device in another kit which does not have Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. The new kit is overwritten selected kit
    ...     - 2. The Pulse Oximeter is "Not included"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-19    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-20: Check that new Pulse Oximeter is overwritten selected one if user scans another Pulse Oximeter ID after a kit was selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: If the user scans another Pulse Oximeter after one was selected, the new Pulse Oximeter shall overwrite the selected Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of device in kit which not have Pulse Oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter
    ...     - 3. Scan QR/Data Matrix code of another Pulse Oximeter which not belongs to another kit
    ...
    ...     Expected Results:
    ...     - 1. The new Pulse Oximeter is overwritten selected Pulse Oximeter
    ...     - 2. The new Pulse Oximeter is displayed in kit information

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-20    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-21: Check that kit which has Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Select Keep adding kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to transfer ticket
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-21    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-22: Check that kit which has Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-22    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-23: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff of kit which not have Pulse oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to another kit
    ...     - 3. Select Keep adding kit
    ...     - 4. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-23    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-24: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer/Blood pressure cuff of kit which not have Pulse oximeter
    ...     - 2. Scan QR/Data Matrix code of Pulse Oximeter which does not belong to another kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to transfer ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KS-BIOK-24    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#EDIT - PENDING - ADD KIT - INPUT
BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-01: Check that Manual Input information must be fully displayed when user select Manual Input
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Manual Input information must be fully displayed when user select Manual Input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add kit] button to open sidebar
    ...     - 2. Select Manual Input and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + “Search & select a kit by its device ID” search box
    ...     + Kit information
    ...     + [Keep adding kit] checkbox
    ...     + [Add item] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-02: Check that “Search & select a kit by its device ID” can be searched by Digital Thermometer
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” can be searched by Digital Thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested kits are displayed correctly based on Digital Thermometer ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-03: Check that “Search & select a kit by its device ID” can be searched by Blood Pressure Cuff
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” can be searched by Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Blood Pressure Cuff ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested kits are displayed correctly based on Blood Pressure Cuff ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-04: Check that “Search & select a kit by its device ID” can be searched by Pulse Oximeter (kit has Pulse Oximeter from scratch)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” can be searched by Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Pulse Oximeter ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested kits are displayed correctly based on Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-05: Check that “Search & select a kit by its device ID” results are available kits which are in inventory, not be added to item list
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a kit by its device ID” results are available kits which are in inventory, not be added to item list
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter ID
    ...     – 2. Observe the suggestions
    ...
    ...     Expected Results:
    ...     - 1. Display only suggestions which are in inventory, not be added to item list
    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-06: Check that suggestions must be displayed all elements
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: suggestions must be displayed all elements
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     – 1. In search box, enter device ID
    ...     - 2. Observe the suggestions
    ...
    ...     Expected Results:
    ...     - 1. Suggestions shall display the Digital Thermometer, Blood Pressure Cuff, and Pulse Oximeter device IDs included in the kit
    ...     - 2. If Pulse Oximeter is unavailable, display "Not included"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-07: Check that suggestions can be selected to select the kit which doesn’t have Pulse oximeter from scratch
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Suggestions can be selected to select the kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter device ID
    ...     - 2. Select the suggestion
    ...
    ...     Expected Results:
    ...     - 1. The suggestion can be selected
    ...     - 2. The selected kit is displayed information in kit information
    ...     - 3. Pulse Oximeter field is displayed "Not included"
    ...     - 4. Message is displayed "The pulse oximeter device is not included. You can select a device to add it to the kit."
    ...     - 5. The search and select box is displayed to allows the user to search device

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-09: Check that standalone Pulse Oximeter can be selected when input kit does not have one (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can be selected when input kit does not have one (Manual Input)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of device in kit which does not have Pulse Oximeter
    ...     - 2. Search & select Enter standalone Pulse Oximeter ID which in Inventory
    ...
    ...     Expected Results:
    ...     - 1. Pulse Oximeter is selected
    ...     – 2. Message is displayed “Please note that the system only adds the device to the kit after the ticket is marked as completed”

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-10: Check that Pulse Oximeter can not be selected to the kit when it already belongs in another kit (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can not be selected to the kit when it already belongs in another kit (Manual Input)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of device in kit which does not have Pulse Oximeter
    ...     - 2. Search & select ID of Pulse Oximeter which already belongs to another kit
    ...
    ...     Expected Results:
    ...     - 1. No suggestion of Pulse Oximeter which already belongs to another kit


    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-11: Check that Pulse Oximeter cannot be selected when it is not in "Inventory" (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter cannot be selected when it is not in "Inventory" (Manual Input)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of device in kit which does not have Pulse Oximeter
    ...     - 2. Search & select ID of standalone Pulse Oximeter which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-11    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-12: Check that kit which has Pulse oximeter from scratch, can be added to list when whole kit is selected in Manual Input (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to list when whole kit is selected in Manual Input (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Select Keep adding kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to list
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-12    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-13: Check that kit which has Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is selected in Manual Input (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-13    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-14: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is selected in Manual Input (keep adding kit is checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of Digital Thermometer/Blood pressure cuff of kit which not have Pulse oximeter
    ...     - 2. Search & select ID of Pulse Oximeter which does not belong to another kit
    ...     - 3. Select Keep adding kit
    ...     - 4. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to ticket
    ...     - 2. Message is displayed "Kit is added to item list"
    ...     - 3. The Add Biokit sidebar is cleared and not closed
    ...     – 4. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 5. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-14    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-15: Check that kit which does not have Pulse oximeter from scratch, can be added to ticket when whole kit is scanned (keep adding kit is not checked)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit can be added to ticket when whole kit is selected in Manual Input (keep adding kit is not checked)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID code of Digital Thermometer/Blood pressure cuff of kit which does not have Pulse oximeter
    ...     - 2. Search & select ID code of Pulse Oximeter which does not belong to another kit
    ...     - 3. Click [Add item]
    ...
    ...     Expected Results:
    ...     - 1. Kit is added to transfer ticket
    ...     - 2. The Add Biokit sidebar is closed
    ...     – 3. The Pulse Oximeter shall not be added to the kit on Admin Portal
    ...     - 4. The kit information is displayed in kits section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-15    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-16: Check that kit information is retained when switching between input modes
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Kit information is retained when switching between input modes
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add kit] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID code of Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 2. Switch to Scan label tab
    ...     - 3. Observe kit information
    ...
    ...     Expected Results:
    ...     - 1. Kit information is retained

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-KI-BIOK-16    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#EDIT - PENDING - ADD STANDALONE DEVICE - SCAN LABEL
BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-01: Check that Scan label information must be fully displayed when user select Scan label
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Scan label information must be fully displayed when user select Scan label
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add standalone devices] button to open sidebar
    ...     - 2. Select Scan label and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + " Scan a QR or Data Matrix code of the Biokit device you want to be added to the transfer ticket. You can scan multiple devices to be added to this list"
    ...     + Device type
    ...     + Device ID
    ...     + [Add items] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-02: Check that device must be selected when user scan QR/Data Matrix code of Digital Thermometer
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected when user scan QR/Data Matrix code of Digital Thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Digital Thermometer
    ...
    ...     Expected Results:
    ...     - 1. Digital Thermometer information (ID, type) is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-03: Check that device must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected when user scan QR/Data Matrix code of Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Blood Pressure Cuff
    ...
    ...     Expected Results:
    ...     - 1. Blood Pressure Cuff information (ID, type) is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-04: Check that device must be selected when user scan QR/Data Matrix code of Pulse Oximeter
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected when user scan QR/Data Matrix code of Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code using Pulse Oximeter
    ...
    ...     Expected Results:
    ...     - 1. Pulse Oximeter information (ID, type) is displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-05: Check that invalid Digital Thermometer ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Digital Thermometer ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Digital Thermometer ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-06: Check that invalid Blood Pressure Cuff ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Blood Pressure Cuff ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Blood Pressure Cuff ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-07: Check that invalid Pulse Oximeter ID cannot be scanned
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Invalid Pulse Oximeter ID cannot be scanned
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code which does not follow Pulse Oximeter ID format
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Invalid Device ID scanned. Please try again"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-08: Check that Digital Thermometer can not be selected when it already belongs in a kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Digital Thermometer can not be selected to the kit when it already belongs in a kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer which already belongs to a kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-08    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-09: Check that Blood Pressure Cuff can not be selected when it already belongs in a kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Blood Pressure Cuff can not be selected to the kit when it already belongs in a kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Blood Pressure Cuff which already belongs to a kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-10: Check that Pulse Oximeter can not be selected when it already belongs in a kit
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter can not be selected to the kit when it already belongs in a kit
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Pulse Oximeter which already belongs to a kit
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device already belongs to a kit"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-11: Check that Digital Thermometer cannot be selected when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Digital Thermometer cannot be selected when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-11    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-12: Check that Blood Pressure Cuff cannot be selected when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Blood Pressure Cuff cannot be selected when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Blood Pressure Cuff which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-12    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-13: Check that Pulse Oximeter cannot be selected when it is not in "Inventory"
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Pulse Oximeter cannot be selected when it is not in "Inventory"
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Pulse Oximeter which not in inventory
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "Device is not in Inventory"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-13    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-14: Check that available Digital Thermometer can be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: available Digital Thermometer can be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Digital Thermometer which is in inventory and not belongs in a kit
    ...
    ...     Expected Results:
    ...     - 1. The scanned Digital Thermometer is selected and displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-14    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-15: Check that available Blood Pressure Cuff can be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: available Pulse Oximeter can be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Blood Pressure Cuff which is in inventory and not belongs in a kit
    ...
    ...     Expected Results:
    ...     - 1. The scanned Blood Pressure Cuff is selected and displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-15    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-16: Check that available Pulse Oximeter can be selected
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: available Pulse Oximeter can be selected
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of Pulse Oximeter which is in inventory and not belongs in a kit
    ...
    ...     Expected Results:
    ...     - 1. The scanned Pulse Oximeter is selected and displayed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-16    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-17: Check that at the end of each row of device has Delete button (Scan Label - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of available device
    ...     - 2. Observe device information rows in device table
    ...
    ...     Expected Results:
    ...     - 1. At the end of each row has Delete button

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-17    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-18: Check that device row must be removed when clicking Delete button (Scan Label - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device row must be removed when clicking Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of available device
    ...     - 2. Click [Delete] button at the end of device row and observe
    ...
    ...     Expected Results:
    ...     - 1. The device is removed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-18    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-19: Check that message is displayed when the standalone device list is empty (Scan Label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Observe the device information table
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "All selected devices will appear here"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-19    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-20: Check that devices can be added to ticket (Scan Label)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: devices can be added to ticket (Scan Label)
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Scan Label of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Scan QR/Data Matrix code of available device
    ...     - 2. Click [Add items]
    ...
    ...     Expected Results:
    ...     - 1. Devices are added to ticket
    ...     - 2. The Add Standalone devices sidebar is closed
    ...     - 3. The device information are displayed in standalone devices section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SS-BIOK-20    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - ADD STANDALONE DEVICE - INPUT
BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-01: Check that Manual Input information must be fully displayed when user select Manual Input
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Manual Input information must be fully displayed when user select Manual Input
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Add standalone devices] button to open sidebar
    ...     - 2. Select Manual Input and observe
    ...
    ...     Expected Results:
    ...     - 1. Elements are fully displayed:
    ...     + “Search & select a kit by its device ID” search box
    ...     + Kit information
    ...     + [Keep adding kit] checkbox
    ...     + [Add item] button

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-01    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-02: Check that “Search & select a device by its ID” can be searched by Digital Thermometer
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” can be searched by Digital Thermometer
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested devices are displayed correctly based on Digital Thermometer ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-02    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-03: Check that “Search & select a device by its ID” can be searched by Blood Pressure Cuff
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” can be searched by Blood Pressure Cuff
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Blood Pressure Cuff ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested devices are displayed correctly based on Blood Pressure Cuff ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-03    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-04: Check that “Search & select a device by its ID” can be searched by Pulse Oximeter
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” can be searched by Pulse Oximeter
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Pulse Oximeter ID
    ...
    ...     Expected Results:
    ...     - 1. Suggested devices are displayed correctly based on Pulse Oximeter ID

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-04    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-05: Check that “Search & select a device by its ID” results are available devices which are in inventory, not be added to item list
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: “Search & select a device by its ID” results are available devices which are in inventory, not be added to item list
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter ID
    ...     – 2. Observe the suggestions
    ...
    ...     Expected Results:
    ...     - 1. Display only suggestions are devices which are in inventory, not be added to item list

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-05    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-06: Check that device must be selected and displayed when selecting suggestion
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device must be selected and displayed when select suggestion
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. In searchbox, enter Digital Thermometer/Blood Pressure Cuff/Pulse Oximeter ID
    ...     – 2. Select the suggestion
    ...     – 3. Observe the device information table
    ...
    ...     Expected Results:
    ...     - 1. Device must be selected and displayed Device ID and Device type

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-06    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-07: Check that devices can be added to list (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: devices in Manual Input can be added to list
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select ID of available Digital Thermometer/Blood pressure cuff/Pulse oximeter
    ...     - 3. Click [Add items]
    ...
    ...     Expected Results:
    ...     - 1. Devices are added to list
    ...     - 2. The Add Standalone devices sidebar is closed
    ...     - 3. The device information are displayed in standalone devices section

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-07    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-08: Check that at the end of each row of device has Delete button (Manual Input - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select available device
    ...     - 2. Observe device information rows in device table
    ...
    ...     Expected Results:
    ...     - 1. At the end of each row has Delete button

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-08    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-09: Check that device row must be removed when clicking Delete button (Manual Input - Add standalone devices)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: device row must be removed when clicking Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Search & select available device
    ...     - 2. Click [Delete] button at the end of device row and observe
    ...
    ...     Expected Results:
    ...     - 1. The device is removed

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-09    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-10: Check that message is displayed when the standalone device list is empty (Manual Input)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: at the end of each row of device has Delete button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create Biokit transfer ticket page
    ...     - 2. The user is on Manual Input of [Add standalone devices] sidebar
    ...
    ...     Test Steps:
    ...     - 1. Observe the device information table
    ...
    ...     Expected Results:
    ...     - 1. Message is displayed "All selected devices will appear here"

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-SI-BIOK-10    RS-084-04     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#MARK COMPLETED TICKET
BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-23: Check that the confirmation modal must be displayed correctly when clicking Mark Completed button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Confirmation modal must be displayed correctly when clicking Mark Completed ticket button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click Mark Completed button
    ...     - 2. Observe the modal
    ...
    ...     Expected Results:
    ...     - 1. The confirmation modal is displayed.
    ...     - 2. The message is " You are going to complete this Device Transfer. If you are sure you want to move forward with the action, please confirm below."
    ...     - 3. There are Confirm and Back button.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-23    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-24: Check that the ticket status must be changed to Completed after marking completed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: ticket status must be changed to Completed after marking completed
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields in page
    ...     - 2. Click Mark Completed button
    ...     - 3. Click [Confirm] button in the modal
    ...     - 4. Observe the Completed tab
    ...
    ...     Expected Results:
    ...     - 1. The ticket is changed status to "Completed" and moved to Completed tab.
    ...     - 2. The user is redirected to Completed ticket details page.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-24    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-25: Check that Pulse Oximeter must be added to the kit if it wasn’t previously on the Admin Portal, after marking completed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The Pulse Oximeter in the Biokit shall be added to the kit if it wasn’t previously on the Admin Portal
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields in page
    ...     - 2. Click Mark Completed button
    ...     - 3. Click [Confirm] button in the modal
    ...     - 4. Check Pulse Oximeter which is added to the ticket, on Admin Portal
    ...
    ...     Expected Results:
    ...     - 1. Pulse Oximeter is added to kit

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-25    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-26: Check that devices in ticket have Location changed after marking completed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The device IDs in the transfer ticket shall have their “Location” changed to “Facility” if the customer type is “Facility”, or “User” if the customer type is “End User”
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields in page
    ...     - 2. Check devices location before completing ticket
    ...     - 3. Click Mark Completed button
    ...     - 4. Click [Confirm] button in the modal
    ...     - 5. Check devices location after completing ticket
    ...
    ...     Expected Results:
    ...     - 1. The location of devices changed to Facility/End User if customer type is Facility/End User

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-26    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-27: Check that facility name in ticket is changed after marking completed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The device IDs in the transfer ticket shall have their “Facility” changed to the facility on the ticket if the customer type is “Facility”
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields in page (customer type is facility)
    ...     - 2. Click Mark Completed button
    ...     - 3. Click [Confirm] button in the modal
    ...     - 4. Check facility name of ticket
    ...
    ...     Expected Results:
    ...     - 1. The facility of devices changed to facility on the ticket

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-27    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-28: Check that the ticket the confirmation modal must be exited when clicking Cancel button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: confirmation ticket the modal must be exited when clicking Cancel button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields in page
    ...     - 2. Click [Mark Completed] button
    ...     - 3. Click [Back] button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Exit the modal.

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-28    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-29: Check that ticket can not be completed when kit in list belongs to another ticket, user click Mark Completed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: ticket can not be completed when kit in list belongs to another ticket, user click Mark Completed
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Add kit which belongs to another ticket
    ...     - 2. Enter required fields in page
    ...     - 3. Click [Mark Completed] button
    ...     - 4. Click [Confirmation] button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "This kit is in transfer ticket <ticket id>"
    ...     - 2. Can not mark to complete ticket

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-29    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-30: Check that ticket can not be completed when devices in list belongs to another ticket, user click Mark Completed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: ticket can not be completed when devices in list belongs to another ticket
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Add devices which belongs to another ticket
    ...     - 2. Enter required fields in page
    ...     - 3. Click [Mark Completed] button
    ...     - 4. Click [Confirmation] button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Error message is displayed "Device <Device ID> is in transfer ticket <ticket id>"
    ...     - 2. Can not create ticket

    [Tags]    BSP-SND-TRANSFER-TRANSF-PENDING-BIOK-30    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CANCEL TICKET
BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-31: Check that the confirmation modal must be displayed correctly when clicking Cancel button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Confirmation modal must be displayed correctly when clicking Cancel ticket button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Click [Cancel] button
    ...     - 2. Observe the modal
    ...
    ...     Expected Results:
    ...     - 1. The confirmation modal is displayed.
    ...     - 2. The message is "You are going to cancel this Device Transfer. If you are sure you want to move forward with the action, please confirm below."
    ...     - 3. There are Confirm and Back button.

    [Tags]    BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-31    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-32: Check that the ticket status must be changed to Cancelled after cancellation
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: ticket status must be changed to Cancelled after cancellation
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields in page
    ...     - 2. Click [Cancel] button
    ...     - 3. Click [Confirm] button in the modal
    ...     - 4. Observe the Completed tab
    ...
    ...     Expected Results:
    ...     - 1. The ticket is changed status to "Cancelled" and moved to Completed tab.
    # TODO:  confirm behavior (redirect to tab/details page)
    ...     - 2. The user is redirected to Cancelled ticket details page.

    [Tags]    BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-32    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-33: Check that the ticket the cancel confirmation modal must be exited when clicking Cancel button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: cancel confirmation ticket the modal must be exited when clicking Cancel button
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Enter required fields in page
    ...     - 2. Click [Cancel] button
    ...     - 3. Click [Back] button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Exit the modal.

    [Tags]    BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-33    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-34: Check that message must be displayed when ticket is being updated by another user
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: If the ticket is being updated by another user, there shall be a message.
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Pending Biokit transfer ticket page
    ...
    ...     Test Steps:
    ...     - 1. Access the ticket details with one account and edit the information.
    ...     - 2. Go to the same page but with a different account in a different tab.
    ...
    ...     Expected Results:
    ...     - 1. Display message: “Please reload the page to view the most recent data since it is being modified by another account.”

    [Tags]    BSP-SND-TRANSFER-TRANSF-EDIT-PENDING-BIOK-34    RS-087-01     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#COMPLETED - REFUND
BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-01: Check that Refund label option must be displayed correctly
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Completed ticket details, Refund label must be displayed correctly
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the Completed Ticket Details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe [Refund label] button in Tracking information.
    ...
    ...     Expected Results:
    ...     - Refund label option is displayed same as designed (position, font style, font size, color...).

    [Tags]  BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-01    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-02: Check that Request Refund modal must be displayed message when clicking on Refund label
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Completed ticket details, Request Refund modal must be displayed correct format message when clicking on Refund label.
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the Completed Ticket Details page.
    ...     - 2. The Ticket has tracking information.
    ...     Test Steps:
    ...     - 1. Click [Refund label] button on the shipping label information
    ...
    ...     Expected Results:
    ...     - Display message: “
    ...     Before request a refund, please consider the following important information:
    ...     * Refunds typically take 14 days to credit into your account. [Read more about refunds](https://support.goshippo.com/hc/en-us/articles/201772785).
    ...     * You will immediately be unable to use this shipping label for postage.
    ...     * This action cannot be undone, but you can create a new label.
    ...     * Note also that USPS labels that have not been used for 30 days since creation are automatically refunded. “

    [Tags]  BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-02    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-03: Check that Request Refund modal must be displayed correctly
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Completed ticket details, Request Refund modal must be displayed correctly when click Refund label option
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the Completed Ticket Details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Click [Refund label] button on the shipping label information
    ...     - 2. Observe the modal.
    ...
    ...     Expected Results:
    ...     - 1. Modal is displayed with correct content, [Request Refund] button, [Cancel] button

    [Tags]  BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-03    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-04: Check that refund request must be successful after clicking Request Refund option
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Completed ticket details, refund request must be successful after clicking Request Refund option.
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the Completed Ticket Details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Click [Refund label] button to open the modal.
    ...     - 2. Click [Request Refund] button.
    ...
    ...     Expected Results:
    ...     - 1. Change the status to “Refund requested” and the label color.
    ...     - 2. Refund the label.

    [Tags]  BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-04    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-05: Check that refund request modal must be exited when clicking Cancel option
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Completed ticket details, refund request modal must be exited when clicking Cancel option.
    ...     Precondition:
    ...     - 1. The Operation Manager is on the Completed Ticket Details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Click [Refund label] button to open the modal.
    ...     - 2. Click [Cancel] button.
    ...
    ...     Expected Results:
    ...     - Exit the modal.

    [Tags]  BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-05    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-06: Check that the OS can not request the refund
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Completed ticket details, the page must be directed when clicking the link in the message
    ...     Precondition:
    ...     - 1. The Operation Staff is on the Completed Ticket Details page.
    ...     - 2. The Ticket has tracking information.
    ...
    ...     Test Steps:
    ...     - 1. Observe the Tracking information.
    ...
    ...     Expected Results:
    ...     - The Refund label is disabled.

    [Tags]  BSP-SND-TRANSFER-TRANSF-COMPLETED-BIOK-RF-06    RS-086-03     R1    manual    SC-1.13.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_services_and_distribution_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Services And Distribution Portal
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser



