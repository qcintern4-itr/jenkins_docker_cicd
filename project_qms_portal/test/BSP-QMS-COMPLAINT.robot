*** Settings ***
Documentation   Test Suite - QMS Portal - Complaint tickets page
Metadata    sid     BSP-QMS-COMPLAINT
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_qms_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-QMS-COMPLAINT       web
Test Timeout    1h

*** Test Cases ***
BSP-QMS-COMPLAINT-VIEWLIST-01: View list of new Complaint tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of new Complaint tickets
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “New” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Service and Support portal-The user approves a "New" RMA request
    ...     - 2. Support portal-The user adds a new RMA ticket on the ‘Patient Support’ page
    ...     - 3. Service and Support portal-The user creates RMA request on new tab
    ...     - 4. Clinic and Support portal-The user creates a new ‘Clinic Support’ ticket with the “Device issue” category
    ...     - 5. Service portal-The user adds a new device on the ‘Inbound’ tab of an ‘In process’ RMA ticket
    ...     - 6. Clinic portal-The user creates a RMA ticket that has renewal device
    ...
    ...     Expected Results:
    ...     - There shall be a new complaint ticket generated for each case

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-01    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-02: View the information in the list of new Complaint tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the information in the list of new Complaint tickets
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “New” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of new Complaint tickets
    ...
    ...     Expected Results:
    ...     - 1. The list shall contain the following information:
    ...     - Complaint ID (system auto-generated)
    ...     - Clinic Ticket ID (if any)
    ...     - RMA ID (if any)
    ...     - Device ID (hyperlink which should display all informarion of device when clicking it)
    ...     - Date of Event (Must be same as the "Date of event" in the ticket)
    ...     - Date Notified (Complain ticket's created date)
    ...     - Facility (hyperlink which should display all information of facility when clicking it)
    ...     - Contact Person (hyperlink which should display all information of Contact person when clicking it)
    ...     - Patient Impact
    ...     - Complaint Description

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-02    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-03: The user hovers over on each row
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user hovers on each row
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “New” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. The user hovers over on each row
    ...
    ...     Expected Results:
    ...     - 1. There should a [Edit] button

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-03    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-04: Sort the new Complaint list by Complaint ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the new Complaint list by Complaint ID
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “New” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the sort order of the list
    ...     - 2. The user selects the [Sort] button next to the Complaint ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by Complaint ID in descending order by default
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Complaint ID

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-04    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-05: Pagination-Move to other pages in new Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination to move to other pages in new Complaint ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “New” subtab is selected
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

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-05    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-06: Pagination-View quantity of tickets display per page in new Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in new Complaint ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “New” subtab is selected
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

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-06    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-07: View list of accepted Complaint tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of accepted Complaint tickets
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Accepted” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. QMS portal-The user accepts a new Complaint ticket
    ...
    ...     Expected Results:
    ...     - 1. The accepted Complain ticket shall display on Accepted list

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-07    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-08: View the information in the list of accepted Complaint tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the information in the list of accepted Complaint tickets
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Accepted” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of accepted Complaint ticket
    ...
    ...     Expected Results:
    ...     - 1. The list shall contain the following information:
    ...     - Complaint ID (system auto-generated)
    ...     - Clinic Ticket ID (if any)
    ...     - RMA ID (if any)
    ...     - Device ID (hyperlink which should display all informarion of device when clicking it)
    ...     - Date of Event (Must be same as the "Date of event" in the ticket)
    ...     - Date Notified (Complain ticket's created date)
    ...     - Facility (hyperlink which should display all information of facility when clicking it)
    ...     - Contact Person (hyperlink which should display all information of Contact person when clicking it)
    ...     - Patient Impact
    ...     - Complaint Description

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-08    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-09: The user hovers over on each row
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user hovers over on each row
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Accepted” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. The user hovers on each row
    ...
    ...     Expected Results:
    ...     - 1.There should a [Edit] button

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-09    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-10: Sort the accepted Complaint list by Complaint ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the accepted Complaint list by Complaint ID
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Accepted” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the [Sort] button next to the Complaint ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by Complaint ID in descending order by default
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Complaint ID

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-10    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-11: Pagination-Move to other pages in accepted Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Accepted” subtab is selected
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

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-11    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-12: Pagination-View quantity of tickets display per page in accepted Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in accepted Complaint ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Accepted” subtab is selected
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

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-12    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-13: View list of rejected Complaint tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of rejected Complaint tickets
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Rejected” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. QMS portal-The user rejects a rejected Complaint ticket
    ...
    ...     Expected Results:
    ...     - 1. The rejected Complain ticket shall display on Rejected list

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-13    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-14: View the information in the list of rejected Complaint tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the information in the list of rejected Complaint tickets
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “rejected” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of rejected Complaint ticket
    ...
    ...     Expected Results:
    ...     - 1. The list shall contain the following information:
    ...     - Complaint ID (system auto-generated)
    ...     - Clinic Ticket ID (if any)
    ...     - RMA ID (if any)
    ...     - Device ID (hyperlink which should display all informarion of device when clicking it)
    ...     - Date of Event (Must be same as the "Date of event" in the ticket)
    ...     - Date Notified (Complain ticket's created date)
    ...     - Facility (hyperlink which should display all information of facility when clicking it)
    ...     - Contact Person (hyperlink which should display all information of Contact person when clicking it)
    ...     - Patient Impact
    ...     - Complaint Description

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-14    FRS-045-01    manual     FRS-045-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-15: The user hovers over on each row
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user hovers over on each row
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Rejected” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. The user hovers on each row
    ...
    ...     Expected Results:
    ...     - 1.There should a [Edit] button

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-15    FRS-045-01    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-16: Sort the rejected Complaint list by Complaint ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the rejected Complaint list by Complaint ID
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Rejected” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the [Sort] button next to the Complaint ID
    ...
    ...     Expected Results:
    ...     - 1.The list should be sorted by default by Complaint ID in descending order
    ...     - 2.The list will switch the sorting order between ascending and descending of the Complaint ID

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-16    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-17: Pagination-Move to other pages in rejected Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Move to other pages in rejected Complaint ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Rejected” subtab is selected
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

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-17    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEWLIST-18: Pagination-View quantity of tickets display per page in rejected Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in rejected Complaint ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The “Rejected” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click on the pagination drop-down, observe the list
    ...     - 2. The user selects “10 rows” from the drop-down box
    ...     - 3. TThe user selects “30 rows” from the drop-down box
    ...     - 4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...    - 1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...    - 2. The list with 10 tickets shall be displayed
    ...    - 3. The list with 30 tickets shall be displayed
    ...    - 4. The list with 50 tickets shall be displayed
    ...    - 5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-QMS-COMPLAINT-VIEWLIST-18    FRS-045-01    manual     FRS-045-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-01: Observe the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar on each tab (New, Accepted, Rejected)
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Complaint ID, with a string saying “Search by Complaint ID"

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-01    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-02: Observe search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search options
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Complaint ID
    ...     - Clinic Ticket ID
    ...     - RMA ID
    ...     - Device ID

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-02    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-03: Search by Complaint ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a valid Complaint ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The search option is "Complaint ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a valid Complaint ID into the search bar
    ...     - 2. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Complaint ID

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-03    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-04: Enter an invalid value into the search bar when the search option is "Complaint ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The search option is "Complaint ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...     - 2. Enter a clinic ticket ID into the search bar
    ...     - 3. Enter a RMA ID into the search bar
    ...     - 4. Enter characters or special characters into the searchbar
    ...     - 5. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-04    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-05: Searching by Complaint ID shall be applied to other tabs
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Searching by Complaint ID shall be applied to other subtabs
    ...
    ...     Precondition:
    ...     - 1. The search option is "Complaint ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Complaint ID into the search bar
    ...     - 2. Switches to other tabs on the page
    ...
    ...     Expected Results:
    ...     - 1. The Search by option and values entered shall be applied to all tabs on the page

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-05    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-06: Search by Clinic Ticket ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Clinic Ticket ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The search option is "Clinic Ticket ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Clinic Ticket ID into the search bar
    ...     - 2. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Clinic Ticket ID

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-06    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-07: Enter an invalid value into the search bar when the search option is "Clinic Ticket ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The search option is "Clinic Ticket ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...     - 2. Enter a Complaint ID into the search bar
    ...     - 3. Enter a RMA ID into the search bar
    ...     - 4. Enter characters or special characters into the searchbar
    ...     - 5. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-07    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-08: Searching by Clinic Ticket ID shall be applied to other tabs
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Searching by Clinic Ticket ID shall be applied to other tabs
    ...
    ...     Precondition:
    ...     - 1. The search option is "Clinic Ticket ID"
    ...     - 2. Enter a Clinic ticket ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Enter a Clinic Ticket ID into the search bar
    ...     - 2. Switches to other tabs on the page
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and its result should remain.

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-08    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-09: Search by RMA ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a RMA ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...
    ...     Test Steps:
    ...     - 1. Enter a RMA ID into the search bar
    ...     - 2. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered RMA ID

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-09    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-10: Enter an invalid value into the search bar when the search option is "RMA ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The search option is "RMA ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...     - 2. Enter a Complaint ID into the search bar
    ...     - 3. Enter a Clinic ticket ID into the search bar
    ...     - 4. Enter characters or special characters into the searchbar
    ...     - 5. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-10    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-11: Searching by RMA ID shall be applied to other tabs
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "RMA ID"
    ...     - 2. Enter an RMA ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Enter an RMA ID into the search bar
    ...     - 2. Switches to other tabs on the page
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and its result should remain.

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-11    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-12: Search by Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...     - 2. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-12    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-13: Enter an invalid value into the search bar when the search option is "Device ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a RMA ID into the search bar
    ...     - 2. Enter a Complaint ID into the search bar
    ...     - 3. Enter a Clinic ticket ID into the search bar
    ...     - 4. Enter characters or special characters into the searchbar
    ...     - 5. Observe the search result on New, Accepted, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-13    FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-SEARCH-14: Searching by Device ID shall be applied to other tabs
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Device ID"
    ...     - 2. Enter a Device ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Enter an RMA ID into the search bar
    ...     - 2. Switches to other tabs on the page
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and its result should remain.

    [Tags]    BSP-QMS-COMPLAINT-SEARCH-14   FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-FILTER-01: Observe the filter options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the filter options
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on Filter button on each tab (New, Accepted, Rejected)
    ...     - 2. Observe the modal
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to filter for the following:
    ...     - Charging Issue
    ...     - Screen Issue
    ...     - Device errors
    ...     - Broken Charger
    ...     - ECG Issue
    ...     - Closed Account
    ...     - No Cell Connection
    ...     - Courtesy RMA
    ...     - Return To Stock
    ...     - Other

    [Tags]    BSP-QMS-COMPLAINT-FILTER-01   FRS-046-01    manual    FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-FILTER-02: Filter by one or multiple options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter by one or multiple options
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...
    ...     Test Steps:
    ...     - 1. The user selects an/some options to filter at once
    ...
    ...     Expected Results:
    ...     - 1. The system should filter and display accordingly to the selected options

    [Tags]    BSP-QMS-COMPLAINT-FILTER-02   FRS-046-01    manual    FRS-046-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-FILTER-03: Remove filter options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user can remove filter options
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...     - 2. There are some selected options
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on “x” button on each option
    ...     - 2. On the Filter modal, deselect the selected options, then click "Filter" button
    ...     - 3. Observe the list
    ...
    ...     Expected Results:
    ...     - 1. The option shall be removed and the list shall be filtered again

    [Tags]    BSP-QMS-COMPLAINT-FILTER-03   FRS-046-01    manual    FRS-046-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-FILTER-04: Search and filter at the same time
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search and filter at the same time
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Complaint page
    ...
    ...     Test Steps:
    ...     - 1. The user searchs by Complaint ID/Clinic ticket ID/ RMA ID/Device ID
    ...     - 2. The user filters by some options
    ...     - 3. Observe the list
    ...
    ...     Expected Results:
    ...     - 1. The option shall be filtered and displayed accordingly with the search value and filter options

    [Tags]    BSP-QMS-COMPLAINT-FILTER-04   FRS-046-01    manual    FRS-046-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-01: View new Complaint ticket details
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View new Complaint ticket details
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Observe the header section
    ...     - 2. Observe the Ticket Information section
    ...     - 3. Observe the Complaint Information section of the ticket
    ...
    ...     Expected Results:
    ...     - 1. In the Header:
    ...     - Complaint ID and tag 'New'
    ...     - Facility (the user should be able to click on the Facility hyperlink to view the Facility quick access)
    ...     - 2. In the Ticket Information section
    ...     - Clinic Ticket ID (can be clicked on to navigate to the respective clinic support ticket)
    ...     - RMA ID (can be clicked on to navigate to the respective RMA request ticket)
    ...     - Contact Person (can be clicked on to view the Contact Person quick access sidebar)
    ...     - Device ID (should be accompanied by a device model tag. The user can click on it to view the Device details quick access)
    ...     - Device Issues
    ...     - Patient Impact (There should be a “Help” button. When clicked on it, the user should be able to view the Patient Impact quick access sidebar)
    ...     - 3. In the Complaint Information section
    ...     - As Received Code with a drop-down list
    ...     - As Analyzed Code with a drop-down list
    ...     - Root Cause Code with a drop-down list
    ...     - Adverse Event with a drop-down list. The “No” option is selected, by default.
    ...     - Investigation Required with a drop-down list. The “No” option is selected, by default.
    ...     - Investigation Summary text field

    [Tags]    BSP-QMS-COMPLAINT-VIEW-01   FRS-047-01    manual   FRS-047-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-02: View accepted Complaint ticket details
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View accepted Complaint ticket details
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the accepted Complaint ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Observe the header section
    ...     - 2. Observe the Ticket Information section
    ...     - 3. Observe the Complaint Information section of the ticket
    ...
    ...     Expected Results:
    ...     - 1. In the Header:
    ...     - Complaint ID and tag 'Accepted'
    ...     - Facility (the user should be able to click on the Facility hyperlink to view the Facility quick access)
    ...     - 2. In the Ticket Information section
    ...     - Clinic Ticket ID (can be clicked on to navigate to the respective clinic support ticket)
    ...     - RMA ID (can be clicked on to navigate to the respective RMA request ticket)
    ...     - Contact Person (can be clicked on to view the Contact Person quick access sidebar)
    ...     - Device ID (should be accompanied by a device model tag. The user can click on it to view the Device details quick access)
    ...     - Device Issues
    ...     - Patient Impact (There should be a “Help” button. When clicked on it, the user should be able to view the Patient Impact quick access sidebar)
    ...     - 3. In the Complaint Information section
    ...     - As Received Code: There shall be the selected options (If any)
    ...     - As Analyzed Code:There shall be the selected options (If any)
    ...     - Root Cause Code:There shall be the selected options (If any)
    ...     - Adverse Event: There shall be the selected options (If any)
    ...     - Investigation Required: There shall be the selected options (If any)
    ...     - Investigation Summary text field: There shall be the inputted text (If any)

    [Tags]    BSP-QMS-COMPLAINT-VIEW-02   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-03: View rejected Complaint ticket details
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View rejected Complaint ticket details
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the rejected Complaint ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Observe the header section
    ...     - 2. Observe the Ticket Information section
    ...     - 3. Observe the Complaint Information section of the ticket
    ...
    ...     Expected Results:
    ...     - 1. In the Header:
    ...     - Complaint ID and tag 'Rejected'
    ...     - Facility (the user should be able to click on the Facility hyperlink to view the Facility quick access)
    ...     - 2. In the Ticket Information section
    ...     - Clinic Ticket ID (can be clicked on to navigate to the respective clinic support ticket)
    ...     - RMA ID (can be clicked on to navigate to the respective RMA request ticket)
    ...     - Contact Person (can be clicked on to view the Contact Person quick access sidebar)
    ...     - Device ID (should be accompanied by a device model tag. The user can click on it to view the Device details quick access)
    ...     - Device Issues
    ...     - Patient Impact (There should be a “Help” button. When clicked on it, the user should be able to view the Patient Impact quick access sidebar)
    ...     - 3. In the Complaint Information section
    ...     - As Received Code-disabled field: There shall be the selected options (If any)
    ...     - As Analyzed Code-disabled field:There shall be the selected options (If any)
    ...     - Root Cause Code-disabled field:There shall be the selected options (If any)
    ...     - Adverse Event-disabled field: There shall be the selected options (If any)
    ...     - Investigation Required-disabled field: There shall be the selected options (If any)
    ...     - Investigation Summary text field-disabled field: There shall be the inputted text (If any)

    [Tags]    BSP-QMS-COMPLAINT-VIEW-03   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-04: View the list of 'As Received Code' information (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user observe the list of “As Received Code” (Bioflux device)
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page of a Bioflux device
    ...     - The QMS Officer is on the accepted Complaint ticket detail page of a Bioflux device
    ...     - The QMS Officer is on the rejected Complaint ticket detail page of a Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. Click on the "As Received Code" dropdown
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following options:
    ...     - Charging Issue
    ...     - Device Errors
    ...     - ECG Issue
    ...     - No Cell Connection
    ...     - Screen Issue
    ...     - Broken Charger
    ...     - Closed Account
    ...     - Courtesy RMA
    ...     - Return To Stock
    ...     - Other

    [Tags]    BSP-QMS-COMPLAINT-VIEW-04   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-05: View the list of 'As Received Code' information (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user observe the list of “As Received Code” (Biotres device)
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page of a Biotres device
    ...
    ...     Test Steps:
    ...     - 1. Click on the "As Received Code" dropdown
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following options:
    ...     - Charging Issue
    ...     - Device Errors
    ...     - Device Dead On Arrival
    ...     - Connection Issue
    ...     - ECG Leads
    ...     - Damaged (describe)
    ...     - Closed Account
    ...     - Courtesy RMA
    ...     - Return To Stock
    ...     - Other

    [Tags]    BSP-QMS-COMPLAINT-VIEW-05   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-06: View the list of 'As Analyzed Code' information (Bioflux device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user observe the list of “As Analyzed Code” (Bioflux device)
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page of a Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. Click on the “As Analyzed Code” dropdown
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following options:
    ...     - Charger Damage
    ...     - Charger Connector Damage
    ...     - Battery EOL
    ...     - Battery Defect
    ...     - Error Code 20600
    ...     - Error Code 20601
    ...     - Error Code 20400
    ...     - ECG Cable Damage
    ...     - ECG Cable Removed
    ...     - ECG Connector Damage
    ...     - Water Damage
    ...     - SD Card Damage
    ...     - Cellular Connection
    ...     - Damaged (Describe)
    ...     - No Issue Found
    ...     - Other

    [Tags]    BSP-QMS-COMPLAINT-VIEW-06   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-07: View the list of 'As Analyzed Code' information (Biotres device)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user observe the list of “As Analyzed Code” (Biotres device)
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page of a Bioflux device
    ...
    ...     Test Steps:
    ...     - 1. Click on the “As Analyzed Code” dropdown
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following options:
    ...     - Charger Damage
    ...     - Charger Connector Damage
    ...     - Battery Defect
    ...     - Device Error Confirmed(describe)
    ...     - ECG Leads Damage Confirmed
    ...     - Water Damage
    ...     - Connection Issue Confirmed
    ...     - Damage Confirmed (describe)
    ...     - No Issue Found
    ...     - Other

    [Tags]    BSP-QMS-COMPLAINT-VIEW-07   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-08: View the list of 'Root Cause Code' information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user observe the list of “Root Cause Code”
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Click on the “Root Cause Code” dropdown
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following options:
    ...     - Intended Misuse
    ...     - Unintended Misuse
    ...     - User Error
    ...     - Manufacturing Error
    ...     - Supplier Error
    ...     - Design/Usability Error
    ...     - Not Confirmed

    [Tags]    BSP-QMS-COMPLAINT-VIEW-08   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-09: View the list of 'Adverse Event' information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user observe the “Adverse Event” drop down list
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Click on the “Adverse Event” drop down
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following options:
    ...     - Yes
    ...     - No

    [Tags]    BSP-QMS-COMPLAINT-VIEW-09   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-VIEW-10: View the list of 'Investigation Required' information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user observe the “Investigation Required” drop down list
    ...
    ...     Precondition:
    ...     - The QMS Officer is on the new Complaint ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Click on the “Adverse Event” drop down
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following options:
    ...     - Yes
    ...     - No

    [Tags]    BSP-QMS-COMPLAINT-VIEW-10   FRS-047-01    manual     FRS-046-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-01: Edit 'As Received Code' information (Bioflux device) for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'As Received Code' information (Bioflux device) for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...     - 2. The device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. Select an/some options from the “As Received Code” drop-down list
    ...
    ...     Expected Results:
    ...     - 1. The selected option should be displayed and auto-saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-01   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-02: Edit 'As Received Code' information (Biotres device) for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'As Received Code' information (Biotres device) for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...     - 2. The device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. Select an/some options from the “As Received Code” drop-down list
    ...
    ...     Expected Results:
    ...     - 1. The selected option should be displayed and auto-saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-02   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-03: Edit 'As Analyzed Code' information (Bioflux device) for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'As Analyzed Code' information (Bioflux device) for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...     - 2. The device model is Bioflux
    ...
    ...     Test Steps:
    ...     - 1. Select an/some option from the “As Analyzed Code” drop-down list
    ...
    ...     Expected Results:
    ...     - 1. The selected option should be displayed and auto-saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-03   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-04: Edit 'As Analyzed Code' information (Biotres device) for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'As Analyzed Code' information (Biotres device) for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...     - 2. The device model is Biotres
    ...
    ...     Test Steps:
    ...     - 1. Select an/some option from the “As Analyzed Code” drop-down list
    ...
    ...     Expected Results:
    ...     - 1. The selected option should be displayed and auto-saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-04   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-05: Edit 'Root Cause Code' information for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'Root Cause Code' information for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Select an/some option from the “Root Cause Code” drop-down list
    ...
    ...     Expected Results:
    ...     - 1. The selected option should be displayed and auto-saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-05   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-06: Edit 'Investigation Required' information for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'Investigation Required' information for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Select an options from the "Investigation Required" drop down list
    ...
    ...     Expected Results:
    ...     - 1. The selected option should be displayed and auto-saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-06   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-07: Edit 'Adverse Event' information for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'Adverse Event' information for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Select an options from the "Adverse Event" drop down list
    ...
    ...     Expected Results:
    ...     - 1. The selected option should be displayed and auto-saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-07   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-08: Edit 'Investigation Summary' information for New/Accepted ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit 'Investigation Summary' information for New/Accepted ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the new/accepted ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Input text into Investigation Summary text field
    ...     - 2. Click Save button
    ...
    ...     Expected Results:
    ...     - 1. The inputted text shall be displayed and saved

    [Tags]    BSP-QMS-COMPLAINT-EDIT-08   FRS-047-01    manual     FRS-047-01-SPF-2    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EDIT-09: Cannot edit Complaint information for Rejected ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Cannot edit Complaint information for rejected ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the rejected ticket detail page
    ...
    ...     Test Steps:
    ...     - 1. Observe all information in the Complaint information section
    ...
    ...     Expected Results:
    ...     - 1. All fields are disabled and the user cannot edit them

    [Tags]    BSP-QMS-COMPLAINT-EDIT-09   FRS-047-01    manual     FRS-047-01-SPF-3    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-ACCEPT-01: Accept a new Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Accept a new Complaint ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the ticket detail page (New tab)
    ...
    ...     Test Steps:
    ...     - 1. Click the “Accept” button on the ticket details page
    ...     - 2. Click the "Accept" button from the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation pop-up with the message:
    ...     “You are going to accept this Complaint ticket. If you are sure you want to move forward with the action, please confirm below.”,
    ...     and 2 options  “Cancel” and “Accept”
    ...     - 2. The ticket should be moved to the ‘Accepted’ tab, and the user should be redirected to the ‘Accepted’ ticket details page

    [Tags]    BSP-QMS-COMPLAINT-ACCEPT-01     FRS-048-01    manual     FRS-048-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-ACCEPT-02: Cancel accepting of a new ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Cancel accepting of a new ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the ticket detail page (New tab)
    ...
    ...     Test Steps:
    ...     - 1. Click the “Accept” button on the ticket details page
    ...     - 2. Click the “Cancel” button from the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation pop-up with the message:
    ...     “You are going to accept this Complaint ticket. If you are sure you want to move forward with the action, please confirm below.”,
    ...     and 2 options  “Cancel” and “Accept”
    ...     - 2. The confirmation pop-up shall disappear

    [Tags]    BSP-QMS-COMPLAINT-ACCEPT-02  FRS-048-01    manual     FRS-048-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-REJECT-01: Reject a new Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Reject a new Complaint ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the ticket detail page (New tab)
    ...
    ...     Test Steps:
    ...     - 1. Click the “Reject” button on the Form details page
    ...     - 2. Click the "Reject" button from the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation pop-up with the message:
    ...     “You are going to reject this Complaint ticket. If you are sure you want to move forward with the action, please confirm below.”,
    ...     and 2 options  “Cancel” and “Reject”
    ...     - 2. The ticket should be moved to the ‘Rejected’ tab, and the user should be redirected to the ‘Rejected’ ticket details page

    [Tags]    BSP-QMS-COMPLAINT-REJECT-01  FRS-049-01    manual     FRS-049-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-REJECT-02: Cancel rejecting of a new ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Cancel rejecting of a new ticket
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the ticket detail page (New tab)
    ...
    ...     Test Steps:
    ...     - 1. Click the “Reject” button on the Form details page
    ...     - 2. Click the "Cancel" button from the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation pop-up with the message:
    ...     “You are going to reject this Complaint ticket. If you are sure you want to move forward with the action, please confirm below.”,
    ...     and 2 options  “Cancel” and “Reject”
    ...     - 2. The confirmation pop-up shall disappear

    [Tags]    BSP-QMS-COMPLAINT-REJECT-02  FRS-049-01    manual     FRS-049-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EXPORT-01: Export a New/Accepted Complaint ticket to Excel
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Export a Complaint ticket to Excel
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer user is on the detail page of the New or Accepted Complaint ticket
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on [Export Excel] button
    ...     - 2. Open the downloaded Excel file and check the information in the file
    ...
    ...     Expected Results:
    ...     - 1. There should be an Excel file downloaded. The filename should be [<Complaint ID>] Complaint information.
    ...     - 2. All information is displayed properly that is the same as the information of the ticket

    [Tags]    BSP-QMS-COMPLAINT-EXPORT-01  FRS-050-01    manual       FRS-050-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-EXPORT-02: Export a list of accepted complaint ticket to Excel
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Export a list of accepted complaint ticket to Excel
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer user is on the Accepted Complaint tab
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on [Export Excel] button
    ...     - 2. The user selects any non-future date for the Start Date
    ...     - 3. The user selects any date between the Start Date and the current date for the End Date
    ...     - 4. The user clicks on [Export] button
    ...     - 5. Open the downloaded Excel file and check the information in the file
    ...
    ...     Expected Results:
    ...     - 1. There should be a modal that prompts the user for the Start and End date.
    ...     - 2. The selected date shall be displayed
    ...     - 3. There should be an Excel file downloaded. The filename should be [<Complaint ID>] Complaint information.
    ...     - 4. All information is displayed properly that is the same as the information of the tickets in the selected range date

    [Tags]    BSP-QMS-COMPLAINT-EXPORT-02  FRS-051-01    manual     FRS-051-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-COMPLAINT-CONTACT-01: Quick access to Contact Person (Requestor) of a New/Accepted/Rejected ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: As a QMS Officer, I want to view the quick access to Contact Person.
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer user is on the list of complaint ticket (New/Accepted/Rejected)
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on “Contact Person” hyperlink
    ...     - 2. Check the information in the sidebar
    ...
    ...     Expected Results:
    ...     - 1. There shall be a sidebar displaying the following information:
    ...     - Name
    ...     - Role
    ...     - Phone Number
    ...     - Email
    ...     - 2. The Requestor's information is displayed properly

    [Tags]    BSP-QMS-COMPLAINT-CONTACT-01  FRS-052-01    manual    FRS-052-01-SPF-1    R2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_qms_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Qms Portal
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
