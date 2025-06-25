*** Settings ***
Documentation   Test Suite - Service Portal - Operation forms page
Metadata    sid     BSP-QMS-OP
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-QMS-OP      web
Test Timeout    1h

*** Test Cases ***
BSP-QMS-OP-VIEW-02: QMS-Observe the information displayed in the list of new tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in the list of new tickets
    ...
    ...     Precondition:
    ...     - 1.The QMS user is on the New tab of the Operation Forms page, QMS Portal
    ...     - 2.There is an operation form that was approved by OM and waiting for QMS's approval
    ...
    ...     Test Steps:
    ...     - 1. Observe the information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1.The form’s information shall be displayed, including:
    ...     - Form ID
    ...     - Form Type: FT-1306-7 or FT-1306-2
    ...     - Device ID: must be the device id of the operation form
    ...     - The user can view all information of device by clicking on the Device ID hyperlink
    ...     - Created Date: must be the date that the user created the Operation form
    ...     - Submission Date: must the the date the user submited the Operation form
    ...     - Operation Approved: display name of the OM who approved the ticket
    ...     - 2.By default, the list of operation forms shall be sorted in descending order of Form ID.

    [Tags]    BSP-QMS-OP-VIEW-02    manual    FRS-053-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-03: Hover over the new tiket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Hover over the new tiket
    ...
    ...     Precondition:
    ...     - 1.The QMS user is on the Operation Forms page
    ...     - 2.There is an operation form that submitted from the Operation Digitalization app and displayed on the New tab
    ...
    ...     Test Steps:
    ...     - 1. Hover over each ticket
    ...     - 2. Clicks on the  [Edit] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be an  [Edit] button displayed at the end of the row
    ...     - 2.The user should be navigated to the Form Details page

    [Tags]    BSP-QMS-OP-VIEW-03    manual    FRS-053-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-04: Sort the list of new tickets by Form ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the list of new tickets by Form ID
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The “New” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the [Sort] button next to the Form ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by Form ID in descending order by default
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Form ID

    [Tags]    BSP-QMS-OP-VIEW-04    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-05: Pagination-Move to other pages of the New tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination to move to other pages of the new tab
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The “New” tab is selected
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

    [Tags]    BSP-QMS-OP-VIEW-05    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-06: Pagination-View quantity of tickets display per page in new tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in new tab
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The “New” tab is selected
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

    [Tags]    BSP-QMS-OP-VIEW-06    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-07: Observe the information displayed in the list of approved tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in the list of approved ticket
    ...
    ...     Precondition:
    ...     - 1.The QMS is on the Operation Forms page, QMS Portal
    ...     - 2.There are some operation form are waiting for QMS's approval
    ...     - 3.There are some operation form are approved by QMS
    ...
    ...     Test Steps:
    ...     - 1. Observe the information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1.The form’s information shall be displayed, including:
    ...     - Form ID
    ...     - Form Type: FT-1306-7 or FT-1306-2
    ...     - Device ID: must be the device ID of the Operation form
    ...     - The user can view all information of device by clicking on the Device ID hyperlink
    ...     - Created Date: must be the date that the user created the Operation form
    ...     - Submission Date: must be the date that the user submitted the Operation form
    ...     - QMS status:
    ...     --Pending – status of the form is “New” on the QMS Officer
    ...     --Approved, the QMS’ name – the form is approved by QMS Officer
    ...     - 2. By default, the list of operation forms shall be sorted in descending order of Form ID.

    [Tags]    BSP-QMS-OP-VIEW-07    manual    FRS-053-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-08: Hover over the Approved tiket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Hover over the Approved tiket
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Operation Forms page, QMS Portal
    ...     - 2.There are some operation form are waiting for QMS's approvals
    ...     - 3.There are some operation form are approved by QMS
    ...
    ...     Test Steps:
    ...     - 1. Hover over each ticket
    ...     - 2. Clicks on [Edit] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be an [Edit] button displayed at the end of the row
    ...     - 2.The user should be navigated to the Form Details page

    [Tags]    BSP-QMS-OP-VIEW-08    manual    FRS-053-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-09: Sort the list of approved tickets by Form ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the list of approved tickets by Form ID
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The “Approved” tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the [Sort] button next to the Form ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by Form ID in descending order by default
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Form ID

    [Tags]    BSP-QMS-OP-VIEW-09    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-10: Pagination-Move to other pages of the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination to move to other pages of the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The “Approved” tab is selected
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

    [Tags]    BSP-QMS-OP-VIEW-10    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-11: Pagination-View quantity of tickets display per page in Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The “Approved” tab is selected
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

    [Tags]    BSP-QMS-OP-VIEW-11    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-12: Observe the information displayed in the list of rejected tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the information displayed in the list of rejected tickets
    ...
    ...     Precondition:
    ...     - 1.The QMS is on the Reject tab of Operation Forms page, QMS Portal
    ...     - 2.There are some operation form are rejected by OM
    ...     - 3.There are some operation form are rejected by QMS
    ...
    ...     Test Steps:
    ...     - 1. Observe the information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1.The form’s information shall be displayed, including:
    ...     - Form ID
    ...     - Form type
    ...     - Device ID: must be the device ID of the Operation form
    ...     - The user can view all information of device by clicking on the Device ID hyperlink
    ...     - Created Date: must be the date that the user created the Operation form
    ...     - Submission Date: must be the date that the user submitted the Operation form
    ...     - Rejected by: should display name of the user who rejected the form
    ...     - 2. By default, the list of operation forms shall be sorted in descending order of Form ID.

    [Tags]    BSP-QMS-OP-VIEW-12    manual    FRS-053-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-13: Hover over the rejected tiket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Hover over the rejected tiket
    ...
    ...     Precondition:
    ...     - 1.The QMS is on the Reject tab of Operation Forms page, QMS Portal
    ...     - 2.There are some operation form are rejected by OM
    ...     - 3.There are some operation form are rejected by QMS
    ...
    ...     Test Steps:
    ...     - 1. Hover over each ticket
    ...     - 2. Clicks on [Edit] button
    ...
    ...     Expected Results:
    ...     - 1.There shall be an [Edit] button displayed at the end of the row
    ...     - 2.The user should be navigated to the Form Details page

    [Tags]    BSP-QMS-OP-VIEW-13    manual    FRS-053-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-14: Sort the list of rejected tickets by Form ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the list of rejected tickets by Form ID
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The Rejected tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the order of the list
    ...     - 2. The user selects the [Sort] button next to the Form ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by Form ID in descending order by default
    ...     - 2. The list will switch the sorting order between descending and ascending order of the Form ID

    [Tags]    BSP-QMS-OP-VIEW-14    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-15: Pagination-Move to other pages of the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination to move to other pages of the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The Rejected tab is selected
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

    [Tags]    BSP-QMS-OP-VIEW-15    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-VIEW-16: Pagination-View quantity of tickets display per page in Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page in Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS Officer is on the Operation form page
    ...     - 2. The “Rejected” tab is selected
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

    [Tags]    BSP-QMS-OP-VIEW-16    manual     FRS-053-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-01: Observe the search bar on the New tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar on the New tab
    ...
    ...     Precondition:
    ...     - 1. TThe QMS is on the New tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Device ID, with a string saying “Search by Device ID"

    [Tags]    BSP-QMS-OP-SEARCH-NEW-01    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-02: Check the Search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the Search options
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Device ID
    ...     - Form ID

    [Tags]    BSP-QMS-OP-SEARCH-NEW-02    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-03: Enter a Device ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-QMS-OP-SEARCH-NEW-03    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-04: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...     - 3. Enter a Device ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-SEARCH-NEW-04    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-05: Enter a Form ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Form ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Form ID

    [Tags]    BSP-QMS-OP-SEARCH-NEW-05    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-06: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...     - 3. Enter a Form ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-SEARCH-NEW-06    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-07: Enter an invalid value into the search bar when the search option is "Form ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID or invalid form ID into the search bar
    ...     - 2. Enter characters or special characters into the searchbar
    ...     - 3. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-OP-SEARCH-NEW-07    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-NEW-08: Enter an invalid value into the search bar when the search option is "Device ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID or invalid Device ID into the search bar
    ...     - 2. Enter characters or special characters into the searchbar
    ...     - 3. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-OP-SEARCH-NEW-08    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-01: Check Filter options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Filter option
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to filter for the following options:
    ...     - All device models (default selected)
    ...     - Bioflux
    ...     - Biotres

    [Tags]    BSP-QMS-OP-FILTER-NEW-01    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-02: Filter "All device models"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "All device models"
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "All device models"
    ...
    ...     Expected Results:
    ...     - 1. All tickets should be displayed

    [Tags]    BSP-QMS-OP-FILTER-NEW-02    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-03: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "All device models"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-NEW-03    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-04: Filter "Bioflux"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Bioflux"
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "Bioflux"
    ...
    ...     Expected Results:
    ...     - 1. Only Bioflux forms are displayed

    [Tags]    BSP-QMS-OP-FILTER-NEW-04    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-05: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "Bioflux"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-NEW-05    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-06: Filter "Biotres"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Biotres"
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "Biotres"
    ...
    ...     Expected Results:
    ...     - 1. Only Biotres forms are displayed

    [Tags]    BSP-QMS-OP-FILTER-NEW-06    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-07: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "Biotres"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-NEW-07    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-NEW-08: Search and filter at the same time
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search and filter at the same time
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the New tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user searchs by Form ID/Device ID
    ...     - 2. The user filters Bioflux/Biotres
    ...     - 3. Observe the list
    ...
    ...     Expected Results:
    ...     - 1. The option shall be filtered and displayed accordingly with the search value and filter options

    [Tags]    BSP-QMS-OP-FILTER-NEW-08    manual    FRS-046-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-01: Observe the search bar on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar on the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Device ID, with a string saying “Search by Device ID"

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-01    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-02: Check the Search options on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the Search options on the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Device ID
    ...     - Form ID

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-02    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-03: Enter a Device ID into the search bar on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar on the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-03    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-04: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...     - 3. Enter a Device ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-04    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-05: Enter a Form ID into the search bar on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Form ID into the search bar on the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Form ID

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-05    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-06: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...     - 3. Enter a Form ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-06    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-07: Enter an invalid value into the search bar when the search option is "Form ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID or invalid form ID into the search bar
    ...     - 2. Enter characters or special characters into the searchbar
    ...     - 3. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-07    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-APPROVED-08: Enter an invalid value into the search bar when the search option is "Device ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID or invalid Device ID into the search bar
    ...     - 2. Enter characters or special characters into the searchbar
    ...     - 3. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-OP-SEARCH-APPROVED-08    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-01: Check Filter options on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Filter option
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to filter for the following options:
    ...     - All device models (default selected)
    ...     - Bioflux
    ...     - Biotres

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-01    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-02: Filter "All device models" on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "All device models" on the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "All device models"
    ...
    ...     Expected Results:
    ...     - 1. All tickets should be displayed

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-02    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-03: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "All device models"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-03    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-04: Filter "Bioflux" on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Bioflux" on the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "Bioflux"
    ...
    ...     Expected Results:
    ...     - 1. Only Bioflux forms are displayed

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-04    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-05: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "Bioflux"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-05    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-06: Filter "Biotres" on the Approved tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Biotres" on the Approved tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "Biotres"
    ...
    ...     Expected Results:
    ...     - 1. Only Biotres forms are displayed

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-06    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-07: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "Biotres"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-07    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-APPROVED-08: Search and filter at the same time
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search and filter at the same time
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Approved tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user searchs by Form ID/Device ID
    ...     - 2. The user filters Bioflux/Biotres
    ...     - 3. Observe the list
    ...
    ...     Expected Results:
    ...     - 1. The option shall be filtered and displayed accordingly with the search value and filter options

    [Tags]    BSP-QMS-OP-FILTER-APPROVED-08    manual    FRS-046-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-01: Observe the search bar on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar on the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Device ID, with a string saying “Search by Device ID"

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-01    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-02: Check the Search options on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the Search options on the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Device ID
    ...     - Form ID

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-02    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-03: Enter a Device ID into the search bar on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar on the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-03    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-04: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...     - 3. Enter a Device ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-04    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-05: Enter a Form ID into the search bar on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Form ID into the search bar on the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Form ID

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-05    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-06: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...     - 3. Enter a Form ID into the search bar
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-06    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-07: Enter an invalid value into the search bar when the search option is "Form ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Form ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Device ID or invalid form ID into the search bar
    ...     - 2. Enter characters or special characters into the searchbar
    ...     - 3. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-07    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-SEARCH-REJECTED-08: Enter an invalid value into the search bar when the search option is "Device ID"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter an invalid value into the search bar
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...     - 2. The search option is "Device ID"
    ...
    ...     Test Steps:
    ...     - 1. Enter a Form ID or invalid Device ID into the search bar
    ...     - 2. Enter characters or special characters into the searchbar
    ...     - 3. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message "There is no data to display" when the user inputs an invalid value into searchbar
    ...     - 2. The entered characters or special characters shall not be displayed in the searchbar

    [Tags]    BSP-QMS-OP-SEARCH-REJECTED-08    manual     FRS-054-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-01: Check Filter options on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check Filter options
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Filter option
    ...
    ...     Expected Results:
    ...     - 1. The user should be able to filter for the following options:
    ...     - All device models (default selected)
    ...     - Bioflux
    ...     - Biotres

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-01    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-02: Filter "All device models" on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "All device models" on the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "All device models"
    ...
    ...     Expected Results:
    ...     - 1. All tickets should be displayed

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-02    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-03: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "All device models"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-03    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-04: Filter "Bioflux" on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Bioflux" on the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "Bioflux"
    ...
    ...     Expected Results:
    ...     - 1. Only Bioflux forms are displayed

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-04    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-05: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...
    ...     - 2. The filter option is "Bioflux"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-05    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-06: Filter "Biotres" on the Rejected tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filter "Biotres" on the Rejected tab
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user filters  "Biotres"
    ...
    ...     Expected Results:
    ...     - 1. Only Biotres forms are displayed

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-06    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-07: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...     - 2. The filter option is "Biotres"
    ...
    ...     Test Steps:
    ...     - 1. Switches the tabs on the page
    ...     - 2. Observe the filter option and result in all the pages (New/Approved/Rejected)
    ...
    ...     Expected Results:
    ...     - 1. When the user switches the tabs on the page the filter option and
    ...     its result should remain.

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-07    manual      FRS-054-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-FILTER-REJECTED-08: Search and filter at the same time
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search and filter at the same time
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Rejected tab of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user searchs by Form ID/Device ID
    ...     - 2. The user filters Bioflux/Biotres
    ...     - 3. Observe the list
    ...
    ...     Expected Results:
    ...     - 1. The option shall be filtered and displayed accordingly with the search value and filter options

    [Tags]    BSP-QMS-OP-FILTER-REJECTED-08    manual    FRS-046-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-01: View detail of a new Operation Form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of a new Operation Form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the information displayed on the details page
    ...
    ...     Expected Results: The Form details page shall display the following information:
    ...     - 1. Header information: Form ID
    ...     - 2. Bioflux final Approveance traveler (Form type)
    ...     - Device ID: must be the device ID of the Operation Form
    ...     - Model: (Bioflux or Biotres)
    ...     - Created Date: must be the date that user created the form
    ...     - Submission Date: must be the date that user submitted the form
    ...     - 3. Approvals – should only display when the form is approved by an OM
    ...         -  Operations
    ...         -  Approved Date
    ...         -  QMS Officer – should only display if a QMS Officer approved the form
    ...         -  Approved Date – should only display if a QMS Officer approved the form
    ...     - 4. Operation details
    ...         -  Step number
    ...         -  Step description
    ...         -  Complete per WI
    ...         -  Action performed
    ...         -  Completed by
    ...     - 4. Notes textbox
    ...     - 5. A Reject button
    ...     - 6. An Approve button
    ...     - 7. Print button

    [Tags]    BSP-QMS-OP-DETAIL-01    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-02: Edit Notes of the new Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Notes of the new Operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user edits Notes
    ...     - 2. Observe the Note text box
    ...
    ...     Expected Results:
    ...     - 1. There should be a Save button when the user makes any changes
    ...     - 2. The edited Notes should be displayed

    [Tags]    BSP-QMS-OP-DETAIL-02    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-03: View detail of an approved Operation Forms (the Operation form has not been processed by the QMS Officer yet)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of a new Operation Form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...     - 2.The Operation form has not been processed by the QMS Officer yet
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed on the details page
    ...
    ...     Expected Results: The Form details page shall display the following information:
    ...     - 1. Header information: Form ID
    ...     - 2. Bioflux final Approveance traveler (Form type)
    ...     - Device ID: must be the device ID of the Operation Form
    ...     - Model: (Bioflux or Biotres)
    ...     - Created Date: must be the date that user created the form
    ...     - Submission Date: must be the date that user submitted the form
    ...     - 3. Approvals
    ...     - Operations: the name of the user who approved the form
    ...     - Approved date: the approval date of Operation Manager
    ...     - 4. Operation details
    ...     - Step number
    ...     - Step description
    ...     - Complete per WI
    ...     - Action performed
    ...     - Completed by
    ...     - 5. Notes textbox
    ...     - 6. "Approved" status
    ...     - 7. Print button

    [Tags]    BSP-QMS-OP-DETAIL-03    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-04: View detail of an approved Operation Forms (the Operation form has been approved by the QMS Officer)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of a new Operation Form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...     - 2.The Operation form  has been approved by the QMS Officer
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed on the details page
    ...
    ...     Expected Results: The Form details page shall display the following information:
    ...     - 1. Header information: Form ID
    ...     - 2. Bioflux final Approveance traveler (Form type)
    ...     - Device ID: must be the device ID of the Operation Form
    ...     - Model: (Bioflux or Biotres)
    ...     - Created Date: must be the date that user created the form
    ...     - Submission Date: must be the date that user submitted the form
    ...     - 3. Approvals
    ...     - Operations: the name of the user who approved the form
    ...     - Approved date: the approval date of Operation Manager
    ...     - QMS Officer: the name of the user who approved the form
    ...     - Approved date: the approval date of Operation Manager
    ...     - 4. Operation details
    ...     - Step number
    ...     - Step description
    ...     - Complete per WI
    ...     - Action performed
    ...     - Completed by
    ...     - 5. Notes textbox
    ...     - 6. "Approved" status
    ...     - 7. Print button

    [Tags]    BSP-QMS-OP-DETAIL-04    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-05: Edit Notes of the approved Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Notes of the approved Operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user edits Notes,
    ...     - 2. Observe the Note text box
    ...
    ...     Expected Results:
    ...     - 1. There should be a Save button when the user makes any changes
    ...     - 2. The edited Notes should be displayed

    [Tags]    BSP-QMS-OP-DETAIL-05    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-06: View detail of an rejected Operation Forms (rejected by Operation Manager)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of a rejected Operation Forms (rejected by Operation Manager)
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...     - 2.The Operation form  has been rejected by Operation Manager
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed on the details page
    ...
    ...     Expected Results: The Form details page shall display the following information:
    ...     - 1. Header information: Form ID
    ...     - 2. Bioflux final Approveance traveler (Form type)
    ...     - Device ID: must be the device ID of the Operation Form
    ...     - Model: (Bioflux or Biotres)
    ...     - Created Date: must be the date that user created the form
    ...     - Submission Date: must be the date that user submitted the form
    ...     - 3. Rejection
    ...     - Operations: the name of the user who rejected the form
    ...     - Rejected date: the rejection date of Operation Manager
    ...     - 4. Operation details
    ...     - Step number
    ...     - Step description
    ...     - Complete per WI
    ...     - Action performed
    ...     - Completed by
    ...     - 5. Notes textbox
    ...     - 6. "Rejected" status
    ...     - 7. Print button

    [Tags]    BSP-QMS-OP-DETAIL-06    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-07: View detail of an rejected Operation Forms (rejected by QMS)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View detail of a rejected Operation Forms (rejected by QMS)
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...     - 2.The Operation form has been rejected by QMS
    ...
    ...     Test Steps:
    ...     - 1.Observe the information displayed on the details page
    ...
    ...     Expected Results: The Form details page shall display the following information:
    ...     - 1. Header information: Form ID
    ...     - 2. Bioflux final Approveance traveler (Form type)
    ...     - Device ID: must be the device ID of the Operation Form
    ...     - Model: (Bioflux or Biotres)
    ...     - Created Date: must be the date that user created the form
    ...     - Submission Date: must be the date that user submitted the form
    ...     - 3. Rejection
    ...     - QMS Officer: the name of the user who rejected the form
    ...     - Rejected date: the rejection date of QMS
    ...     - 4. Operation details
    ...     - Step number
    ...     - Step description
    ...     - Complete per WI
    ...     - Action performed
    ...     - Completed by
    ...     - 5. Notes textbox
    ...     - 6. "Rejected" status
    ...     - 7. Print button

    [Tags]    BSP-QMS-OP-DETAIL-07    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-08: Edit Notes of the approved Operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Notes of the approved Operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. The user edits Notes,
    ...     - 2. Observe the Note text box
    ...
    ...     Expected Results:
    ...     - 1. There should be a Save button when the user makes any changes
    ...     - 2. The edited Notes should be displayed

    [Tags]    BSP-QMS-OP-DETAIL-08    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-09: View Operation details information on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View Operation details information on the details page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the Operation details information displayed on the details page
    ...
    ...     Expected Results:
    ...     - 1. The Operation details shall display the following information in a table-list:
    ...     - Step description (8 steps)
    ...     - Complete per WI
    ...     - Action performed
    ...     - Completed by

    [Tags]    BSP-QMS-OP-DETAIL-09    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-10: View step 1 on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 1 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 1 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Install SIM card
    ...     - 2. Completed per WI: WI-1306-1
    ...     - 3. Action performed:
    ...     - SIM card #: the entered SIM card number from the Operation Digitalization app
    ...     - Carrier: the selected option from the Operation Digitalization app
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-10    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-11: View step 2 on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 2 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 2 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Update Carrier web portal with Device ID
    ...     - 2. Completed per WI: WI-1306-1
    ...     - 3. Action performed: Confirm web portal is updated
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-11    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-12: View step 3 on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 3 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 3 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results:
    ...     The following information shall be displayed:
    ...     - 1. Step description: Install firmware
    ...     - 2. Completed per WI: WI-1306-2
    ...     - 3. Action performed: Confirm Version “xxx” is installed. “xxx” shall be matched the information on the Operation Digitalization web app
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-12    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-13: View step 4 on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 4 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 4 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Program device parameters (set Device ID)
    ...     - 2. Completed per WI: WI-1306-3
    ...     - 3. Action performed: Confirm Device ID is set
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-13    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-14: View step 5 on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 5 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 5 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Check cellular signal
    ...     - 2. Completed per WI: WI-1306-1
    ...     - 3. Action performed: Confirm network and signal strength is displayed
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-14    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-15: View step 6 on the details page of the Bioflux model operation form,
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 6 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 6 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Perform functional test
    ...     - 2. Completed per WI: WI-1306-4
    ...     - 3. Action performed:
    ...     - Study ID
    ...     - Simulator ID
    ...     - Result: If the result is “pass” and the report is generated, there is a “Report link” hyperlink
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-15    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-16: Check the Report link when the user selected "Pass" option in step 6 (Bioflux model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the Report link when the user selected "Pass" option in step 6 (Bioflux model)
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...     - 2. The user selected the "Pass" option in step 6
    ...
    ...     Test Steps:
    ...     - 1. Click on the "report link" hyperlink
    ...
    ...     Expected Results:
    ...     - 1. The user can view and download the report by clicking on the “Report link” hyperlink

    [Tags]    BSP-QMS-OP-DETAIL-16    manual     FRS-055-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-17: View step 7 on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 7 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 7 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Charge battery
    ...     - 2. Completed per WI: WI-1306-1
    ...     - 3. Action performed: Confirm battery is charged
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-17    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-18: View step 8 on the details page of the Bioflux model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 8 on the details page of the Bioflux model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 8 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Package device
    ...     - 2. Completed per WI: WI-1306-1
    ...     - 3. Action performed: -Confirm device is packaged per WI
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-18    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-19: View Operation details information on the details page of the Biotres model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View Operation details information on the details page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe the Operation details information displayed on the details page
    ...
    ...     Expected Results:
    ...     - 1. The Operation details shall display the following information in a table-list:
    ...     - Step description (5 steps)
    ...     - Complete per WI
    ...     - Action performed
    ...     - Completed by

    [Tags]    BSP-QMS-OP-DETAIL-19    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-20: View step 1 on the details page of the Biotres model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 1 on the details page of the Biotres model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 1 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Install firmware
    ...     - 2. Completed per WI: WI-1306-15
    ...     - 3. Action performed: Confirm Version “xxx” is installed. “xxx” shall be matched the information in the Operation Digitalization app
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-20    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-21: View step 2 on the details page of the Biotres model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 2 on the details page of the Biotres model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 2 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Program device parameters (set Device ID)
    ...     - 2. Completed per WI: WI-1306-16
    ...     - 3. Action performed:  Confirm Device ID is set
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-21    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-22: View step 3 on the details page of the Biotres model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 3 on the details page of the Biotres model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 3 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Perform functional test
    ...     - 2. Completed per WI: WI-1306-17
    ...     - 3. Action performed:
    ...     - Study ID
    ...     - Simulator ID / Test Fix #
    ...     - Result: If the result is “pass” and the report is generated, there is a “Report link” hyperlink to the user can view and download this report
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-22    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-23: Check the Report link when the user selected "Pass" option in step 3 (Biotres model)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the Report link when the user selected "Pass" option in step 3 (Biotres model)
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...     - 2. The user selected the "Pass" option in step 3
    ...
    ...     Test Steps:
    ...     - 1. Click on the "report link" hyperlink
    ...
    ...     Expected Results:
    ...     - 1. The user can view and download the report by clicking on the “Report link” hyperlink

    [Tags]    BSP-QMS-OP-DETAIL-23    manual     FRS-055-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-24: View step 4 on the details page of the Biotres model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 4 on the details page of the Biotres model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 4 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Charge battery
    ...     - 2. Completed per WI: WI-1306-14
    ...     - 3. Action performed: Confirm battery is charged
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-24    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-DETAIL-25: View step 5 on the details page of the Biotres model operation form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View step 5 on the details page of the Biotres model operation form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Observe step 5 on the details page of the Bioflux model operation form
    ...
    ...     Expected Results: 
    ...     The following information shall be displayed:
    ...     - 1. Step description: Package device
    ...     - 2. Completed per WI: WI-1306-14
    ...     - 3. Action performed: Confirm device is packaged per WI
    ...     - 4. Completed by:
    ...     - Name: the name of user who completed this step
    ...     - Date: the completion date of this step

    [Tags]    BSP-QMS-OP-DETAIL-25    manual      FRS-055-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-APPROVE-01: The OM approves a new Operation Form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The OM approves a new Operation Form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1.OM click the “Approve” button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a confirmation pop-up with the message: “You are going to approve a new Operation form.
    ...     If you are sure you want to move forward with the request, please confirm this action.”
    ...     - 2. Options: “Approve”, “Cancel” and “Approve & go to the next form” button

    [Tags]    BSP-QMS-OP-APPROVE-01    manual     FRS-056-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-APPROVE-02: Select the “Approve” button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the “Approve” button on the confirmation pop-up
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Select the “Approve” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Approved” state
    ...     - 2.The user shall be navigated to the details of the form on the “Approved” state

    [Tags]    BSP-QMS-OP-APPROVE-02    manual     FRS-056-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-APPROVE-03: Select the “Cancel” button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the “Cancel” button on the confirmation pop-up
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Select the “Cancel” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The confirmation pop-up shall disappear

    [Tags]    BSP-QMS-OP-APPROVE-03    manual     FRS-056-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-APPROVE-04: Select the “Approve & go to the next form” button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Approve & go to the next form" option
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Select the “Approve & go to the next form” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Approved” state
    ...     - 2.The user shall be navigated to the details page of the next form on the “New” tab
    ...     - 3. If the form was the last form on the list, the user should be redirected to the “Approved” page for the form with the message “There are no more new forms”

    [Tags]    BSP-QMS-OP-APPROVE-04    manual     FRS-056-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-REJECT-01: The OM rejects a new Operation Form
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The OM rejects a new Operation Form
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1.OM click the “Reject” button
    ...
    ...     Expected Results:
    ...     - 1.There shall be a confirmation pop-up with the message: “You are going to reject a new Operation form.
    ...     If you are sure you want to move forward with the request, please confirm this action.”
    ...     - 2. Options: “Reject”, “Cancel” and “Reject & go to the next form” button

    [Tags]    BSP-QMS-OP-REJECT-01    manual      FRS-057-01-SPF-1     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-REJECT-02: Select the “Reject” button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the “Reject” button on the confirmation pop-up
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Select the “Reject” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Rejected” state
    ...     - 2.The user shall be navigated to the details of the form on the “Rejected” state

    [Tags]    BSP-QMS-OP-REJECT-02    manual      FRS-057-01-SPF-1     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-REJECT-03: Select the “Cancel” button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the “Cancel” button on the confirmation pop-up
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Select the “Cancel” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The confirmation pop-up shall disappear

    [Tags]    BSP-QMS-OP-REJECT-03    manual      FRS-057-01-SPF-1     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-REJECT-04: Select the “Reject & go to the next form” button on the confirmation pop-up
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Reject & go to the next form" option
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Select the “Reject & go to the next form” button on the confirmation pop-up
    ...
    ...     Expected Results:
    ...     - 1.The form shall be moved to the “Rejected” state
    ...     - 2.The user shall be navigated to the details page of the next form on the “New” tab
   ...      - 3.If the form was the last form on the list,
    ...     the user should be redirected to the “Rejected” page for the form with the message “There are no more new forms”

    [Tags]    BSP-QMS-OP-REJECT-04    manual      FRS-057-01-SPF-1     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-01: Print an Operation Form final report on the new Operation Form page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Print an Operation Form final report on the new Operation Form page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the details page of Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Print final report] button on the header of the details page
    ...     - 2. Observe the preview page
    ...
    ...     Expected Results:
    ...     - 1.There shall be a preview page of the final report file displayed
    ...     - 2.There shall be a “Print” button, a “Close” button and “Download” button

    [Tags]    BSP-QMS-OP-PRINT-01    manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-02: Click on Print button on the preview page of the final report (new ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on Print button on the preview page of the final report
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Print button
    ...
    ...     Expected Results:
    ...     - 1.Print window shall be displayed

    [Tags]    BSP-QMS-OP-PRINT-02    manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-03: Click on the Close button on the preview page of the final report (new ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on the Close button on the preview page of the final report
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the Close button
    ...
    ...     Expected Results:
    ...     - 1.The preview page shall be closed

    [Tags]    BSP-QMS-OP-PRINT-03    manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-04: Download the final report and check the content of the PDF file (New ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Download the final report and check the content of the PDF file
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the Download button
    ...     - 2. Check the content of the PDF file
    ...
    ...     Expected Results:
    ...     - 1.The report should be downloaded
    ...     - 2.The report file’s name shall be [OF-<Operation Forms ID>] Operation Form final report.pdf
    ...     - 3.The information in the PDF file should be same as the opertation form

    [Tags]    BSP-QMS-OP-PRINT-04    manual     FRS-097-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-05: Print an Operation Form final report on the approved Operation Form page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Print an Operation Form final report on the approved Operation Form page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Print final report] button on the header of the details page
    ...     - 2. Observe the preview page
    ...
    ...     Expected Results:
    ...     - 1.There shall be a preview page of the final report file displayed
    ...     - 2.There shall be a “Print” button, a “Close” button and “Download” button

    [Tags]    BSP-QMS-OP-PRINT-05    manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-06: Click on Print button on the preview page of the final report (approved ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on Print button on the preview page of the final report
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Print button
    ...
    ...     Expected Results:
    ...     - 1.Print window shall be displayed

    [Tags]    BSP-QMS-OP-PRINT-06    manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-07: Click on the Close button on the preview page of the final report (approved ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on the Close button on the preview page of the final report
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the Close button
    ...
    ...     Expected Results:
    ...     - 1.The preview page shall be closed

    [Tags]    BSP-QMS-OP-PRINT-07    manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-08: Download the final report and check the content of the PDF file (approved ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Download the final report and check the content of the PDF file
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the Download button
    ...     - 2. Check the content of the PDF file
    ...
    ...     Expected Results:
    ...     - 1.The report should be downloaded
    ...     - 2.The report file’s name shall be [OF-<Operation Forms ID>] Operation Form final report.pdf
    ...     - 3.The information in the PDF file should be same as the opertation form

    [Tags]    BSP-QMS-OP-PRINT-08     manual     FRS-097-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-09: Print an Operation Form final report on the rejected Operation Form page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Print an Operation Form final report on the rejected Operation Form page
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the [Print final report] button on the header of the details page
    ...     - 2. Observe the preview page
    ...
    ...     Expected Results:
    ...     - 1.There shall be a preview page of the final report file displayed
    ...     - 2.There shall be a “Print” button, a “Close” button and “Download” button
    
    [Tags]    BSP-QMS-OP-PRINT-09         manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-10: Click on Print button on the preview page of the final report (rejected ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on Print button on the preview page of the final report
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Print button
    ...
    ...     Expected Results:
    ...     - 1.The Print window shall be displayed

    [Tags]    BSP-QMS-OP-PRINT-10         manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-11: Click on the Close button on the preview page of the final report (rejected ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on the Close button on the preview page of the final report
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the Close button
    ...
    ...     Expected Results:
    ...     - 1.The preview page shall be closed

    [Tags]    BSP-QMS-OP-PRINT-11         manual      FRS-097-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-PRINT-12: Download the final report and check the content of the PDF file (rejected ticket)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Download the final report and check the content of the PDF file
    ...
    ...     Precondition:
    ...     - 1. The QMS is on the preview page of the final report, Operation Forms page, QMS Portal
    ...
    ...     Test Steps:
    ...     - 1. Click on the Download button
    ...     - 2. Check the content of the PDF file
    ...
    ...     Expected Results:
    ...     - 1.The report should be downloaded
    ...     - 2.The report file’s name shall be [OF-<Operation Forms ID>] Operation Form final report.pdf
    ...     - 3.The information in the PDF file should be same as the opertation form

    [Tags]    BSP-QMS-OP-PRINT-12      manual     FRS-097-01-SPF-2    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-EMAIL-01: Notification Email for new Operation Forms
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: There is an email send to OM for a new Operation Form submitted
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. The user submits an operation form
    ...
    ...     Expected Results:
    ...     - 1.When the new form is submitted successfully, the user shall be received an email

    [Tags]    BSP-QMS-OP-EMAIL-01       manual     FRS-058-01-SPF-1    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-OP-EMAIL-02: Check the email format
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the email format
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     - 1. The user submits an operation form
    ...     - 2. Check the email format
    ...
    ...     Expected Results:
    ...     - Subject: New Operation form of Device ID [Device ID]
    ...     - Content:
    ...     - The Operation form of the Device ID [Device ID] has been submitted successfully.
    ...     - Please go to the portal and review it.

    [Tags]    BSP-QMS-OP-EMAIL-02       manual    R1
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
