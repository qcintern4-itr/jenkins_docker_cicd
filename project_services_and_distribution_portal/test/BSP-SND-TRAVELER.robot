*** Settings ***
Documentation   Test Suite - S&D Portal - RMA TRAVELER page
Metadata    sid     BSP-SND-TRAVELER
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-SND-TRAVELER        web
Test Timeout    1h

*** Test Cases ***
BSP-SND-TRAVELER-VIEWLIST-01: View list of new RMA Traveler tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of new RMA Traveler tickets
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “New” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of the RMA Traveler forms in the “New” sub-tab
    ...
    ...     Expected Results:
    ...     - 1. The New subtab contains the Traveler form that just completed, waiting for approval
    ...     - 2. There should be a list with the following attributes:
    ...     - Form ID
    ...     - RMA ID
    ...     - Device ID: There shall be a tag beside device ID to present the device model.
    ...     - Created Date
    ...     - Submission Date

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-01      FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-03: Sort the new RMA traveler list by Form ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the new RMA traveler list by Form ID
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “New” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the sort order of the list
    ...     - 2. The user selects the [Sort] button next to the Form ID
    ...
    ...     Expected Results:
    ...     - 1. The lists should be sorted by Form ID in descending order by default
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Form ID

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-03     FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-04: Pagination-Move to other pages in new RMA traveler page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Move to other pages in new RMA traveler page
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
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

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-04    FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-05: Pagination-View quantity of tickets display per page in new RMA traveler page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in new RMA traveler page
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “New” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click on the pagination drop-down, observe the list
    ...     - 2. The user selects “10 rows” from the drop-down box
    ...     - 3. TThe user selects “30 rows” from the drop-down box
    ...     - 4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 2. The list with 10 tickets shall be displayed
    ...     - 3. The list with 30 tickets shall be displayed
    ...     - 4. The list with 50 tickets shall be displayed
    ...     - 5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-05      FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-06: View list of approved RMA Traveler tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View lis of approved RMA Traveler tickets
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “Approved” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of the RMA Traveler forms in the “Approved” sub-tab
    ...
    ...     Expected Results:
    ...     - 1. The Approved subtab contains the approved Traveler form
    ...     - 2. There should be a list with the following attributes:
    ...     - Form ID
    ...     - RMA ID
    ...     - Device ID: There shall be a tag beside device ID to present the device model.
    ...     - Created Date
    ...     - Submission Date

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-06      FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-08: Sort the approved RMA traveler list by Form ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the approved RMA traveler list by Form ID
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “Approved” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. Click on the "sort" button to sort by Form ID
    ...
    ...     Expected Results:
    ...     - 1. The lists should be sorted by Form ID in descending order by default
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Form ID

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-08     FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-09: Pagination-Move to other pages in approved RMA traveler page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Move to other pages in approved RMA traveler page
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “Approved” subtab is selected
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

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-09    FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-10: Pagination-View quantity of tickets display per page in approved RMA traveler page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in approved RMA traveler page
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “Approved” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click on the pagination drop-down, observe the list
    ...     - 2. The user selects “10 rows” from the drop-down box
    ...     - 3. TThe user selects “30 rows” from the drop-down box
    ...     - 4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 2. The list with 10 tickets shall be displayed
    ...     - 3. The list with 30 tickets shall be displayed
    ...     - 4. The list with 50 tickets shall be displayed
    ...     - 5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-10      FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-11: View list of rejected RMA Traveler tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View lis of rejected RMA Traveler tickets
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “Rejected” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the list of the RMA Traveler forms in the “Rejected” sub-tab
    ...
    ...     Expected Results:
    ...     - 1. The Rejected subtab contains the rejected Traveler form
    ...     - 2. There should be a list with the following attributes:
    ...     - Form ID
    ...     - RMA ID
    ...     - Device ID: There shall be a tag beside device ID to present the device model.
    ...     - Created Date
    ...     - Submission Date

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-11      FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-13: Sort the rejected RMA traveler list by Form ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the rejected RMA traveler list by Form ID
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “Rejected” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. Click on the "sort" button to sort by Form ID
    ...
    ...     Expected Results:
    ...     - 1. The lists should be sorted by default by Form ID in descending orde
    ...     - 2. The list will switch the sorting order between ascending and descending of the Form ID

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-13     FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-14: Pagination-Move to other pages in rejected RMA traveler page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Move to other pages in rejected RMA traveler page
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
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

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-14    FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-VIEWLIST-15: Pagination-View quantity of tickets display per page in rejected RMA traveler page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in rejected RMA traveler page
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The “Approved” subtab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click on the pagination drop-down, observe the list
    ...     - 2. The user selects “10 rows” from the drop-down box
    ...     - 3. TThe user selects “30 rows” from the drop-down box
    ...     - 4. The user selects “50 rows” from the drop-down box
    ...
    ...     Expected Results:
    ...     - 1. A list number of tickets “10 rows, 30 rows, 50 rows” shall be displayed
    ...     - 2. The list with 10 tickets shall be displayed
    ...     - 3. The list with 30 tickets shall be displayed
    ...     - 4. The list with 50 tickets shall be displayed
    ...     - 5. There should be a text displaying the number of tickets being displayed
    ...     out of the total number of tickets

    [Tags]    BSP-SND-TRAVELER-VIEWLIST-15      FRS-075-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-01: Observe the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar on each tab (New, Approved, Rejected)
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Form ID, with a string saying “Search by Form ID"

    [Tags]    BSP-SND-TRAVELER-SEARCH-01    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-02: Observe search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search options
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Form ID
    ...     - Device ID
    ...     - RMA ID

    [Tags]    BSP-SND-TRAVELER-SEARCH-02    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-03: Search by Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...     - 2. Observe the search result on New, Approved, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-SND-TRAVELER-SEARCH-03    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-04: Searching by Device ID shall be applied to other tabs
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Searching by Device ID shall be applied to other tabs
    ...
    ...     Precondition:
    ...     - 1. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...     - 2. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. The Search by option and values entered shall be applied to all tabs on the page

    [Tags]    BSP-SND-TRAVELER-SEARCH-04    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-05: Search by Form ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Form ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID into the search bar
    ...     - 2. Observe the search result on New, Approved, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Form ID

    [Tags]    BSP-SND-TRAVELER-SEARCH-05    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-06: Searching by Form ID shall be applied to other tabs
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "Form ID"
    ...     - 2. Enter a Form ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID into the search bar
    ...     - 2. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. The Search by option and values entered shall be applied to all tabs on the page

    [Tags]    BSP-SND-TRAVELER-SEARCH-06    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BSP-SND-TRAVELER-SEARCH-07: Search by RMA ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an RMA ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the RMA Traveler page
    ...     - 2. The search option is "RMA ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter an RMA ID into the search bar
    ...     - 2. Observe the search result on New, Approved, Rejected tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered RMA ID

    [Tags]    BSP-SND-TRAVELER-SEARCH-07    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-08: Searching by RMA ID shall be applied to other tabs
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The search option is "RMA ID"
    ...     - 2. Enter a RMA ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Enter a RMA ID into the search bar
    ...     - 2. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. The Search by option and values entered shall be applied to all tabs on the page

    [Tags]    BSP-SND-TRAVELER-SEARCH-08    FRS-076-01     R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION} 

BSP-SND-TRAVELER-SEARCH-09: Enter an invalid value into the search bar when the search option is "Device ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The OM is on the New tab of the Operation Form page, Service Portal
    ...     or the QMS is on the Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID or invalid Device ID into the search bar
    ...     - 2. Enter a Device ID or invalid Device ID into the search bar
    ...     - 3. Enter characters or special characters into the searchbar
    ...     - 4. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-SND-TRAVELER-SEARCH-09    FRS-054-01     R1   manual     FRS-054-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-10: Enter an invalid value into the search bar when the search option is "Form ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The OM is on the New tab of the Operation Form page, Service Portal
    ...     or the QMS is on the Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID or invalid Form ID into the search bar
    ...     - 2. Enter a RMA ID into the search bar
    ...     - 3. Enter characters or special characters into the searchbar
    ...     - 4. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-SND-TRAVELER-SEARCH-10    FRS-054-01     R1   manual     FRS-054-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-SEARCH-11: Enter an invalid value into the search bar when the search option is "RMA ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The OM is on the New tab of the Operation Form page, Service Portal
    ...     or the QMS is on the Operation Forms page, QMS Portal
    ...     - 2. The search option is "RMA ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID or invalid RMA ID into the search bar
    ...     - 2. Enter a Form ID into the search bar
    ...     - 3. Enter characters or special characters into the searchbar
    ...     - 4. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-SND-TRAVELER-SEARCH-11    FRS-054-01     R1   manual     FRS-054-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-01: Observe Filter options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe Filter options
    ...
    ...     Precondition: The user is on RMA Traveler Form tab
    ...
    ...     Test Steps:
    ...     - 1. Click on Filter option
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to filter for the following options:
    ...     - All device models (default selected)
    ...     - Bioflux
    ...     - Biotres

    [Tags]    BSP-SND-TRAVELER-FILTER-01    FRS-076-02      R1    manual    FRS-076-02-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-02: Filter by "All device models"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "All device models"
    ...
    ...     Precondition: The user is on RMA Traveler Form tab
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "All device models"
    ...
    ...     Expected Results:
    ...     - 1. All tickets should be displayed

    [Tags]    BSP-SND-TRAVELER-FILTER-02    FRS-076-02      R1    manual    FRS-076-02-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-03: Select other tabs on the page while filtering All device models
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The filter option is "All device models"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SND-TRAVELER-FILTER-03    FRS-076-02      R1    manual    FRS-076-02-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-04: Filter by "Bioflux"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Bioflux"
    ...
    ...     Precondition: The user is on RMA Traveler Form tab
    ...
    ...     Test Steps:
    ...     - 1. The user filters by "Bioflux"
    ...
    ...     Expected Results:
    ...     - 1. Only Bioflux forms are displayed

    [Tags]    BSP-SND-TRAVELER-FILTER-04    FRS-076-02      R1    manual    FRS-076-02-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-05: Select other tabs on the page while filtering Bioflux
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The filter option is "Bioflux"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-SND-TRAVELER-FILTER-05    FRS-076-02      R1    manual    FRS-076-02-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-06: Filter by "Biotres"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Bioflux"
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "Biotres"
    ...
    ...     Expected Results:
    ...     - 1. Only Biotres forms are displayed

    [Tags]    BSP-SND-TRAVELER-FILTER-06    FRS-076-02      R1    manual    FRS-076-02-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-07: Select other tabs on the page while filtering Biotres
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The filter option is "Biotres"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-SND-TRAVELER-FILTER-07    FRS-076-02      R1    manual    FRS-076-02-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-FILTER-08: Search and filter at the same time
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search and filter at the same time
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Traveler page, Service Portal
    ...
    ...     Test Steps:
    ...     - 1. The user searchs by Form ID/Device ID/RMA ID
    ...     - 2. The user filters Bioflux/Biotres
    ...     - 3. Observe the list
    ...
    ...     Expected Results:
    ...     - 1. The option shall be filtered and displayed accordingly with the search value and filter options

    [Tags]    BSP-SND-TRAVELER-FILTER-08    FRS-046-01      R1    manual    FRS-046-01-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-01: View detail of a new RMA Traveler Forms from Inprocess RMA ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of a new RMA Traveler Forms
    ...
    ...     Precondition:
    ...     - 1. There is a submitted RMA Traveler form
    ...     - 2. User is viewing detail of an in-process RMA ticket
    ...
    ...     Test Steps:
    ...     - 1. Click the [View] button of a Submitted/Approved traveler
    ...
    ...     Expected Results:
    ...     - 1. The OM should be redirected to the detail page of the RMA Traveler (on RMA Traveler tab)

    [Tags]    BSP-SND-TRAVELER-DETAIL-01    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-02: View detail of a new RMA Traveler Forms from RMA Traveler page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of a new RMA Traveler Forms
    ...
    ...     Precondition:
    ...     - 1. There is a submitted RMA Traveler form
    ...     - 2. The user is on RMA Traveler page
    ...
    ...     Test Steps:
    ...     - 1. User hover on a row of a New/ Appoved/Rejected Traveler form and click the [Edit] button
    ...
    ...     Expected Results:
    ...     - 1. The OM should be redirected to the detail page of the RMA Traveler

    [Tags]    BSP-SND-TRAVELER-DETAIL-02    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-03: View detail of an RMA ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of an RMA ticket
    ...
    ...     Precondition:
    ...     - 1.  The user is on the detail page of the RMA Travel ticket
    ...
    ...     Test Steps:
    ...     - 1. Observe the RMA Service Traveler (FT-1370-1) section
    ...     - 2. Observe the Form Details section
    ...
    ...     Expected Results:
    ...     - 1. A detail of the RMA Service Traveler section includes bellow information:
    ...     - Device ID
    ...     - RMA ID
    ...     - Model
    ...     - Reason for RMA
    ...     - Form ID
    ...     - Created Date
    ...     - Submission Date
    ...     - Date Received
    ...     - 2.  Form Details seciton includes bellow information
    ...     - Step description
    ...     - Action performed
    ...     - Completed by
    ...     - Name of Support staff/ OM completed on each step
    ...     - Date of the action.

    [Tags]    BSP-SND-TRAVELER-DETAIL-03    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-04: View step 1 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 1 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 1
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Sanitize with Disinfectant
    ...     - 2. Action performed: Sanitize with disinfectant all exposed parts of the product and any accessories.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-04    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-05: View step 2 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 2 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 2
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Inspect packaging and product
    ...     - 2. Action performed: Inspect packaging and product for damage or missing components, including product labels.
    ...     - Note: (if any)
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-05    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-06: View step 3 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 3 on the RMA Traveler Form FT-1307-1 (Yes option)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 3 (in the case the user selected "Yes" option on the form, Operation Digitalization web app)
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Verify an active study
    ...     - 2. Action performed: Upload the study data then move device to the Production portal.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-06    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-07: View step 3 on the RMA Traveler Form FT-1307-1 (No option)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 3 on the RMA Traveler Form FT-1307-1 (No option)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 3 (in the case the user selected "No" option on the form, Operation Digitalization web app)
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Verify an active study
    ...     - 2. Action performed: No active study.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-07    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-08: View step 4 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 4 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 4
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Report Device Malfunction
    ...     - 2. Action performed: Confirm the reported device malfunction is recreated
    ...         - Notes: (if any)
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-08    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-09: View step 5 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 5 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 5
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Perform troubleshooting
    ...     - 2. Action performed:  Failure Analysis
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-09    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-10: View step 6 on the RMA Traveler Form FT-1307-1 (If the result is 'Non-repairable')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 6 on the RMA Traveler Form FT-1307-1 (If the result is 'Non-repairable')
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (the result is 'Non-repairable')
    ...
    ...     Test Steps:
    ...     - 1. Observe step 6
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Verify device’s repairability
    ...     - 2. Action performed: Device is non-repairable.
    ...         - Failure Analysis
    ...         - RMA Resolution
    ...         - RMA Billing Resolution: Display the quantity (if any)
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-10    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-11: View step 6 on the RMA Traveler Form FT-1307-1 (If the result is 'Repairable')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 6 on the RMA Traveler Form FT-1307-1 (If the result is “Repairable”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (the result is “Repairable”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 6
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Verify device’s repairability
    ...     - 2. Action performed: Device can be repaired.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-11    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-12: View step 6 on the RMA Traveler Form FT-1307-1 (If the result is 'Refurbished')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 6 on the RMA Traveler Form FT-1307-1 (If the result is “Refurbished”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (the result is “Refurbished”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 6
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Verify device’s repairability
    ...     - 2. Action performed: Device is refurbished.
    ...         - Failure Analysis
    ...         - RMA Resolution
    ...         - RMA Billing Resolution: Display the quantity (if any)
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-12    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-13: View step 7 on the RMA Traveler Form FT-1307-1 (If the result is 'Yes')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 7 on the RMA Traveler Form FT-1307-1 (If the result is “Yes”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (If the result is “Yes”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 7
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Perform repair
    ...     - 2. Action performed: Confirm the device is performed the repair.
    ...         Notes: (if any).
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-13    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-14: View step 7 on the RMA Traveler Form FT-1307-1 (If the result is 'No')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 7 on the RMA Traveler Form FT-1307-1 (If the result is “No”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (If the result is “No”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 7
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Perform repair
    ...     - 2. Action performed: The device has not performed the repair.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-14    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-15: View step 8 on the RMA Traveler Form FT-1307-1 (If the result is 'Yes')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 8 on the RMA Traveler Form FT-1307-1 (If the result is “Yes”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (If the result is “Yes”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 8
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Lock ECG cable | WI-1306-5
    ...     - 2. Action performed: Confirm the device is locked ECG cable.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-15    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-16: View step 8 on the RMA Traveler Form FT-1307-1 (If the result is 'No')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 8 on the RMA Traveler Form FT-1307-1 (If the result is “No”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (If the result is “No”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 8
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Lock ECG cable | WI-1306-5
    ...     - 2. Action performed: No lock ECG cable.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-16   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-17: View step 9 on the RMA Traveler Form FT-1307-1 (If the result is 'Yes')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 9 on the RMA Traveler Form FT-1307-1 (If the result is “Yes”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (If the result is “Yes”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 9
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Install SIM card | WI-1306-1
    ...     - 2. Action performed: Not applicable.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-17    FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-18: View step 9 on the RMA Traveler Form FT-1307-1 (If the result is 'No')
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 9 on the RMA Traveler Form FT-1307-1 (If the result is “No”)
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form (If the result is “No”)
    ...
    ...     Test Steps:
    ...     - 1. Observe step 9
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Install SIM card | WI-1306-1
    ...     - 2. Action performed:
    ...         - SIM card #
    ...        - Carrier
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-18   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-19: View step 10 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 10 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 10
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Device firmware
    ...     - 2. Action performed: Confirm device firmware is [Bioflux/Biotres current version].
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-19   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-20: View step 11 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 11 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 11
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: RMA Resolution
    ...     - 2. Action performed: RMA Resolution
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-20   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-21: View step 12 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 12 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 12
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Perform functional test | WI-1306-4
    ...     - 2. Action performed:
    ...     - Study ID
    ...     - Simulator ID
    ...     - Result
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-21   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-22: View step 13 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 13 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 13
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: RMA Billing Resolution
    ...     - 2. Action performed:
    ...     - RMA Billing Resolution
    ...     - Display the quantity (if any)
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-22   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-23: View step 14 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 14 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 14
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Charge device
    ...     - 2. Action performed: Confirm device is charged
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-23   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-24: View step 15 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 15 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 15
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Device label
    ...     - 2. Action performed:
    ...     - The device label is legible
    ...     - (Or: “Replace label(s) or move to MRB for review and disposition.”)
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-24   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-DETAIL-25: View step 16 on the RMA Traveler Form FT-1307-1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 16 on the RMA Traveler Form FT-1307-1
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Observe step 16
    ...
    ...     Expected Results: The following information shall be displayed:
    ...     - 1. Step description: Package device
    ...     - 2. Action performed: Package device per WI-1306-1 (BF) or WI-1306-14 (BT).
    ...     Include all accessories and components, as required. Ensure current version of printed materials are included.
    ...     - 3. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-SND-TRAVELER-DETAIL-25   FRS-077-01      R1    manual    FRS-077-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-EDIT-01: Edit a new RMA Traveler form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit a new RMA Traveler form
    ...
    ...     Precondition:
    ...     - 1. The OM is on a detail screen of a RMA traveler.
    ...
    ...     Test Steps:
    ...     - 1. On the header of a RMA traveler detail, there shall be an [Edit] button, user clicks that button
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Traveler form on the https://operation.customer.biotricity.com/

    [Tags]    BSP-SND-TRAVELER-EDIT-01   FRS-078-01      R1    manual   FRS-078-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-EDIT-02: Edit Notes of the new RMA Traveler form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Notes of the new RMA Traveler form
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. The user edits Notes,
    ...     - 2. Observe the Note text box
    ...
    ...     Expected Results:
    ...     - 1. There should be a Save button when the user makes any changes
    ...     - 2. The edited Notes should be displayed

    [Tags]    BSP-SND-TRAVELER-EDIT-02    FRS-078-01      R1    manual   FRS-078-01-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-EDIT-03: Edit an approved RMA Traveler form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit an approved RMA Traveler form
    ...
    ...     Precondition:
    ...     - 1. The OM is on a detail screen of a RMA traveler.
    ...
    ...     Test Steps:
    ...     - 1. On the header of a RMA traveler detail, there shall be an [Edit] button, user clicks that button
    ...
    ...     Expected Results:
    ...     - 1. The user shall be navigated to the Traveler form on the https://operation.customer.biotricity.com/

    [Tags]    BSP-SND-TRAVELER-EDIT-03   FRS-078-01      R1    manual       FRS-078-01-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-EDIT-04: Edit Notes of an approved RMA Traveler form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Notes of an approved RMA Traveler form
    ...
    ...     Precondition:
    ...     - 1. The Operation Manager is on the details page of an approved RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. The user edits Notes,
    ...     - 2. Observe the Note text box
    ...
    ...     Expected Results:
    ...     - 1. There should be a Save button when the user makes any changes
    ...     - 2. The edited Notes should be displayed

    [Tags]    BSP-SND-TRAVELER-EDIT-04    FRS-078-01      R1    manual       FRS-078-01-SPF-2
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-REJECT-01: The OM rejects a new RMA Traveler Form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The OM rejects a new RMA Traveler Form
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1.OM click the “Reject” button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a confirmation pop-up with the message: “You are going to reject a new RMA Traveler Form.
    ...     If you are sure you want to move forward with the request, please confirm this action.”
    ...     - 2. Options: “Reject”, “Cancel” and “Reject & go to the next form” button

    [Tags]    BSP-SND-TRAVELER-REJECT-01    FRS-079-01      R1     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-REJECT-02: Select the 'Reject' button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The OM select "Reject" option on the confirmation pop-up
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...     - 2. Click on "Reject" button
    ...
    ...     Test Steps:
    ...     - 1. Select the “Reject” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Rejected” state
    ...     - 2.The user shall be navigated to the details of the form on the “Rejected” state
    ...     - 3. On Inbound of RMA ticket, the device ID shall be unchecked “Received”. Failure analysis and RMA Resolution shall be empty.
    ...     - 4. If the device is retired, there shall be a message: “Error – The device is retired.”

    [Tags]    BSP-SND-TRAVELER-REJECT-02    FRS-079-01      R1     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-REJECT-03: Select the 'Cancel' button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The OM select "Cancel" option
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Select the “Cancel” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The confirmation pop-up shall disappear

    [Tags]    BSP-SND-TRAVELER-REJECT-03    FRS-079-01      R1     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-REJECT-04: Select the 'Reject & go to the next form' button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Reject & go to the next form" option
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Select the “Reject & go to the next form” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Rejected” state
    ...     - 2.The user shall be navigated to the details page of the next form on the “New” tab
    ...     - 3.If the form was the last form on the list,
    ...     the user should be redirected to the “Rejected” page for the form with the message “There are no more new forms”
    ...     - 4. On Inbound of RMA ticket, the device ID shall be unchecked “Received”. Failure analysis and RMA Resolution shall be empty.
    ...     - 5. If the device is retired, there shall be a message: “Error – The device is retired.”

    [Tags]    BSP-SND-TRAVELER-REJECT-04    FRS-079-01      R1     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-APPROVE-01: The OM approves a new RMA Traveler Form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The OM approves a new RMA Traveler Form
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1.The OM click the “Approve” button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a confirmation pop-up with the message: “You are going to approve a new RMA Traveler Form.
    ...     If you are sure you want to move forward with the request, please confirm this action.”
    ...     - 2. Options: “Approve”, “Cancel” and “Approve & go to the next form” button

    [Tags]    BSP-SND-TRAVELER-APPROVE-01    FRS-080-01     R1   manual    FRS-080-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-APPROVE-02: Select the 'Approve' button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the “Approve” button on the confirmation pop-up
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Select the “Approve” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Approved” state
    ...     - 2.The user shall be navigated to the details of the form on the “Approved” state

    [Tags]    BSP-SND-TRAVELER-APPROVE-02    FRS-080-01     R1   manual    FRS-080-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-APPROVE-03: Select the 'Cancel' button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the “Cancel” button on the confirmation pop-up
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Select the “Cancel” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The confirmation pop-up shall disappear

    [Tags]    BSP-SND-TRAVELER-APPROVE-03    FRS-080-01     R1   manual    FRS-080-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-APPROVE-04: Select the 'Approve & go to the next form' button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Approve & go to the next form" option
    ...
    ...     Precondition:
    ...     - 1. The OM is on the Form details page of a new RMA Traveler Form
    ...
    ...     Test Steps:
    ...     - 1. Select the “Approve & go to the next form” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Approved” state
    ...     - 2.The user shall be navigated to the details page of the next form on the “New” tab
    ...     - 3. If the form was the last form on the list, the user should be redirected to the “Approved” page for the form with the message “There are no more new forms”

    [Tags]    BSP-SND-TRAVELER-APPROVE-04    FRS-080-01     R1   manual    FRS-080-01-SPF-1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-TRAVELER-EMAIL-01: Notification Email for new RMA Traveler Forms
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: There is an email send to OM for a new RMA Traveler Form submitted
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. The OM user submits an RMA Traveler Form
    ...     - 2. Check the email sent to OM user
    ...
    ...     Expected Results:
    ...     - 1.When the new form is submitted successfully, the OM user shall be received an email with:
    ...     - Subject: New RMA Traveler Form of Device ID [Device ID] in RMA [RMA ID]
    ...     - Content:
    ...     - The RMA Traveler Form of the Device ID [Device ID] in RMA [RMA ID] has been submitted successfully.
    ...     - Please go to the portal and review it.

    [Tags]    BSP-SND-TRAVELER-EMAIL-01    FRS-081-01    R1      manual    FRS-081-01-SPF-1
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
