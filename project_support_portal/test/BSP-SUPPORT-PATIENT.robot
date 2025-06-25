*** Settings ***
Documentation   Test Suite - Support Portal - Patient Support page
Metadata    sid     BSP-SUPPORT-PATIENT
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_support_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-SUPPORT-PATIENT     web
Test Timeout    1h

*** Test Cases ***
BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-01: View list of OPEN Patient Support tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of open tickets
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the attributes in the table
    ...
    ...     Expected Results:
    ...     1. The “Open” tab contains the tickets that are newly created from the ERP Portal,
    ...     and tickets that have been Reopened while it was previously Closed/Resolved.
    ...     2.In the open tab, there should be a list with the following attributes:
    ...     - Ticket ID
    ...     - Device ID-should be accompanied by a device model tag, hyperlink
    ...     - Date
    ...     - Study ID-hyperlink
    ...     - Patient Name
    ...     - Date of Birth
    ...     - Phone
    ...     - Physician

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-01      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-02: Observe the order of the list
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

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-02      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-03: Check the pagination
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

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-03      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-04: Check the pagination
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

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-OPEN-04      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-01: View list of closed Patient Support tickets
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of closed tickets
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. Observe the attributes in the table
    ...
    ...     Expected Results:
    ...     1. The Closed tab should contain tickets that are Resolved.
    ...     2.In the closed tab, there should be a list with the following attributes:
    ...     - Ticket ID
    ...     - Device ID-should be accompanied by a device model tag, hyperlink
    ...     - Date
    ...     - Study ID-hyperlink
    ...     - Patient Name
    ...     - Date of Birth
    ...     - Phone
    ...     - Physician

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-01      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-02: Observe the order of the list
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

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-02      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-03: Check the pagination
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

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-03      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-04: Check the pagination
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

    [Tags]    BSP-SUPPORT-PATIENT-VIEWLIST-CLOSED-04      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-01: Observe the search bar
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

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-01      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-02: Search options
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
    ...     1. Patient Support requests should be able to be searched by the following criteria:
    ...     - Ticket ID
    ...     - Study ID
    ...     - Device ID
    ...     - Patient Name
    ...     - Phone
    ...     - Date of Birth

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-02      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-03: Enter a Ticket ID into the search bar
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

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-03      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-04: Select other tabs on the page
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

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-04      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-05: Switches pages on the portal
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

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-05      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-06: Search by Study ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search by study ID
    ...
    ...     Precondition:
    ...
    ...     Test Steps
    ...     1. Select search option “Study ID”
    ...     2. Enter the study ID into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered Study ID

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-06      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-07: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Study ID"
    ...                   2. Enter a Study ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-07      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-08: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Study ID"
    ...                   2. Enter a Study ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-08      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-09: Search by Device ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search by Device ID
    ...
    ...     Precondition:
    ...
    ...     Test Steps
    ...     1. Select search option “Device ID”
    ...     2. Enter the Device ID into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered Study ID

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-09      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-10: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Device ID"
    ...                   2. Enter a Study ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-10      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-11: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Device ID"
    ...                   2. Enter a Study ID into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-11      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-12: Search by Patient Name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search by Patient Name
    ...
    ...     Precondition:
    ...
    ...     Test Steps
    ...     1. Select search option “Patient Name”
    ...     2. Enter the Patient Name into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered Patient Name

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-12      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-13: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Patient Name"
    ...                   2. Enter a Patient Name into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-13      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-14: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Patient Name"
    ...                   2. Enter a Patient Name into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-14      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-15: Search by Phone
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search by Phone number
    ...
    ...     Precondition:
    ...
    ...     Test Steps
    ...     1. Select search option “Phone”
    ...     2. Enter the Phone number into the search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered Phone number

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-15      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-16: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Phone"
    ...                   2. Enter a Phone number into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-16      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-SEARCH-OPEN-17: Select other tabs on the page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select other tabs on the page
    ...
    ...     Precondition: 1. The search option is "Search by Phone number"
    ...                   2. Enter a Phone number into the search bar
    ...
    ...     Test Steps:
    ...     1. Switches the tabs on the page
    ...     2. Observe the search value and result in all the pages
    ...
    ...     Expected Results:
    ...     1. When the user switches the tabs on the page the search value and
    ...     its result should remain.

    [Tags]    BSP-SUPPORT-PATIENT-SEARCH-OPEN-17      BSP-SRS-002-FRS-01-1   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATE-01: Observe the “New Support Ticket” page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the “New Support Ticket” page
    ...
    ...     Precondition: The user is on the Support Portal, Patient Support page, Open tab
    ...
    ...     Test Steps:
    ...     1. Click on the "New ticket" button
    ...     2. Observe the "New Support Ticket"
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the “New Support Ticket” page.
    ...     2. There should be a list that features the following attributes:
    ...     - Study ID
    ...     - Patient name
    ...     - Date of Birth
    ...     - Phone
    ...     - Physician
    ...     There should be three search bars for the user to search for a specific patient”
    ...     - Search by Patient’s Name
    ...     - Search by Date of Birth (MM/DD/YYYY)
    ...     - Search by Phone (000-000-0000)

    [Tags]    BSP-SUPPORT-PATIENT-CREATE-01     BSP-SRS-002-FRS-03   R2      manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATE-02: Search by Patient’s Name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user enters a Patient’s Name into the
    ...     “Search by Patient’s Name” search bar
    ...
    ...     Precondition: The user is on the “New Support Ticket” page
    ...
    ...     Test Steps
    ...     1. The user enters a Patient’s Name into the “Search by Patient’s Name” search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered Patient's Name

    [Tags]    BSP-SUPPORT-PATIENT-CREATE-02      BSP-SRS-002-FRS-03   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATE-03: Mouse over on the result and click on "Add ticket" button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user creates a ticket
    ...
    ...     Precondition: The user is on the “New Support Ticket” page
    ...
    ...     Test Steps
    ...     1. The user enters a Patient’s Name into the “Search by Patient’s Name” search bar
    ...     2. Mouse over on the result and click on "Add ticket" button
    ...     3. The user clicks on the “Cancel button”
    ...     4. The user enters note into the text field
    ...     5. The user clicks on the “Create button”
    ...
    ...     Expected Results:
    ...     1. The user should be prompted with a “New Ticket” window, which features:
    ...     - Study Information
    ...     - Start Date
    ...     - End Date
    ...     - Device ID – should be accompanied by a device model tag
    ...     - Firmware
    ...     - Battery Level
    ...     Issue – should be a text field
    ...     Cancel button
    ...     Create button- Should be disabled by default
    ...     2. “Cancel button” > The user should exit out of the prompt
    ...     3. Enters note > The entered data shall be displayed and the “Create button” is enabled
    ...     4. “Create button” > They should be redirected to the Patient Support ticket details page

    [Tags]    BSP-SUPPORT-PATIENT-CREATE-03      BSP-SRS-002-FRS-03   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATE-04: Search by Date of Birth
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user enters a Date of Birth into the
    ...     “Search by Date of Birth(MM/DD/YYYY)” search bar
    ...
    ...     Precondition: The user is on the “New Support Ticket” page
    ...
    ...     Test Steps
    ...     1. The user enters a Date of Birth into the “Search by Date of Birth(MM/DD/YYYY)” search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered Date of Birth

    [Tags]    BSP-SUPPORT-PATIENT-CREATE-04      BSP-SRS-002-FRS-03   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATE-05: Mouse over on the result and click on "Add ticket" button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user creates a ticket
    ...
    ...     Precondition: The user is on the “New Support Ticket” page
    ...
    ...     Test Steps
    ...     1. The user enters a Patient’s Name into the “Search by Patient’s Name” search bar
    ...     2. Mouse over on the result and click on "Add ticket" button
    ...     3. The user clicks on the “Cancel button”
    ...     4. The user enters note into the text field
    ...     5. The user clicks on the “Create button”
    ...
    ...     Expected Results:
    ...     1. The user should be prompted with a “New Ticket” window, which features:
    ...     - Study Information
    ...     - Start Date
    ...     - End Date
    ...     - Device ID – should be accompanied by a device model tag
    ...     - Firmware
    ...     - Battery Level
    ...     Issue – should be a text field
    ...     Cancel button
    ...     Create button- Should be disabled by default
    ...     2. “Cancel button” > The user should exit out of the prompt
    ...     3. Enters note > The entered data shall be displayed and the “Create button” is enabled
    ...     4. “Create button” > They should be redirected to the Patient Support ticket details page

    [Tags]    BSP-SUPPORT-PATIENT-CREATE-05      BSP-SRS-002-FRS-03   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATE-06: Search by phone number
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user enters a phone number into the
    ...     “Search by phone number(000-000-0000)” search bar
    ...
    ...     Precondition: The user is on the “New Support Ticket” page
    ...
    ...     Test Steps
    ...     1. The user enters a phone number into the “Search by phone number(000-000-0000)” search bar
    ...
    ...     Expected Results:
    ...     1. The list shall be filtered and displayed accordingly with the entered phone number

    [Tags]    BSP-SUPPORT-PATIENT-CREATE-06      BSP-SRS-002-FRS-03   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATE-07: Mouse over on the result and click on "Add ticket" button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user creates a ticket
    ...
    ...     Precondition: The user is on the “New Support Ticket” page
    ...
    ...     Test Steps
    ...     1. The user enters a Patient’s Name into the “Search by Patient’s Name” search bar
    ...     2. Mouse over on the result and click on "Add ticket" button
    ...     3. The user clicks on the “Cancel button”
    ...     4. The user enters note into the text field
    ...     5. The user clicks on the “Create button”
    ...
    ...     Expected Results:
    ...     1. The user should be prompted with a “New Ticket” window, which features:
    ...     - Study Information
    ...     - Start Date
    ...     - End Date
    ...     - Device ID – should be accompanied by a device model tag
    ...     - Firmware
    ...     - Battery Level
    ...     Issue – should be a text field
    ...     Cancel button
    ...     Create button- Should be disabled by default
    ...     2. “Cancel button” > The user should exit out of the prompt
    ...     3. Enters note > The entered data shall be displayed and the “Create button” is enabled
    ...     4. “Create button” > They should be redirected to the Patient Support ticket details page

    [Tags]    BSP-SUPPORT-PATIENT-CREATE-07      BSP-SRS-002-FRS-03   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-01: View an Open Patient Support ticket details
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View an Open Patient Support ticket details
    ...
    ...     Precondition: The Support Staff is on the Open tab, Patient Support page, Support portal
    ...
    ...     Test Steps
    ...     1. Hover on a row of a Patient Supports tickets and click the [Edit] button
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the details page

    [Tags]    BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-01     BSP-SRS-002-FRS-04   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-02: View an Open Patient Support ticket details
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View an Open Patient Support ticket details
    ...
    ...     Precondition: The user should be redirected to the details page
    ...
    ...     Test Steps
    ...     1. Observe the detail page
    ...
    ...     Expected Results:
    ...     1. Header:
    ...     - Ticket ID
    ...     - Patient Name
    ...     - Date of Birth
    ...     - Phone
    ...     2. Support Information section:
    ...     - Issues – should be a text box
    ...     - Resolution – should be a text box
    ...     3. Study Information section:
    ...     - Study ID
    ...     - Status
    ...     - Start Time
    ...     - End Time
    ...     - Study Type
    ...     - Patient Return Visit
    ...     - Device ID – should be accompanied by a device model tag
    ...     - Duration
    ...     - Facility
    ...    4. RMA ticket section:
    ...     - RMA ID
    ...     - Requester
    ...     - Requester Role
    ...     - Facility
    ...     - Inbound Devices
    ...     - Request Date
    ...    5. Study Log section: There should be the study logs (If any)

    [Tags]    BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-02    BSP-SRS-002-FRS-04   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-03: View a closed Support ticket details
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View a closed Patient Support ticket details
    ...
    ...     Precondition: The Support Staff is on the closed tab, Patient Support page, Support portal
    ...
    ...     Test Steps
    ...     1. Hover on a row of a Patient Supports tickets and click the [Edit] button
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the details page

    [Tags]    BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-03    BSP-SRS-002-FRS-04   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-04: View an Open Patient Support ticket details
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View an Open Patient Support ticket details
    ...
    ...     Precondition: The user should be redirected to the details page
    ...
    ...     Test Steps
    ...     1. Observe the detail page
    ...
    ...     Expected Results:
    ...     1. Header:
    ...     - Ticket ID
    ...     - Patient Name
    ...     - Date of Birth
    ...     - Phone
    ...     2. Support Information section:
    ...     - The Issue text box is disabled
    ...     - The Resolution text box is disabled
    ...     3. Study Information section:
    ...     - Study ID
    ...     - Status
    ...     - Start Time
    ...     - End Time
    ...     - Study Type
    ...     - Patient Return Visit
    ...     - Device ID – should be accompanied by a device model tag
    ...     - Duration
    ...     - Facility
    ...    4. RMA ticket section:
    ...     - RMA ID
    ...     - Requester
    ...     - Requester Role
    ...     - Facility
    ...     - Inbound Devices
    ...     - Request Date
    ...    5. Study Log section: There should be the study logs (If any)

    [Tags]    BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-04    BSP-SRS-002-FRS-04   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-05: Edit open ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit open ticket
    ...
    ...     Precondition: The Support Staff is on the open tab, Patient Support page, Support portal
    ...
    ...     Test Steps
    ...     1. The user inputs text into the Issues text field
    ...     2. The user inputs text into the Resolution text field
    ...
    ...     Expected Results:
    ...     1. The inputted text shall be displayed
    ...     2. The inputted text shall be displayed

    [Tags]    BSP-SUPPORT-PATIENT-VIEWTICKET-OPEN-05    BSP-SRS-002-FRS-04   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-RESET-01: Resetting a device from a Patient Support ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Resetting a device from a Patient Support ticket
    ...
    ...     Precondition: The Support Staff is on the open tab, Patient Support page, Support portal
    ...
    ...     Test Steps
    ...     1. The user select a the “Reset Device” button
    ...     2. The user clicks on “Back” button
    ...     3. The user clicks on “Confirm” button
    ...
    ...     Expected Results:
    ...     1. There should be a confirmation window “If you are sure you want to reset this device, please confirm below.”
    ...     Back” button, “Confirm” button
    ...     2. The user should be redirected to the detail page, the confirmation window shall be closed
    ...     3. The device shall be reset

    [Tags]    BSP-SUPPORT-PATIENT-RESET-01    BSP-SRS-002-FRS-05     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-CREATERMA-01: Create an RMA ticket from a patient support ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Create an RMA ticket from a patient support ticket
    ...
    ...     Precondition: The Support Staff is the detail page of an open ticket
    ...
    ...     Test Steps
    ...     1. The user clicks on “Add RMA ticket” button in the RMA ticket section
    ...     2. The user creates a RMA ticket successfully
    ...
    ...     Expected Results:
    ...     1. The user should be redirected to the “New RMA ticket” (section BSP-SRS-004-FRS-03)
    ...     with the Facility Name, Shipping Information, and Device ID fields filled out.
    ...     2. The user shall be navigated to the details of Patient support tickets.
    ...     3. The RMA ticket should show up in the “RMA Ticket” list of the Patient Support ticket details page

    [Tags]    BSP-SUPPORT-PATIENT-CREATERMA-01    BSP-SRS-002-FRS-06   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-RESOLVE-01: Resolve a patient support ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition: The Support Staff is the detail page of an open ticket
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

    [Tags]    BSP-SUPPORT-PATIENT-RESOLVE-01    BSP-SRS-002-FRS-07   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-REOPEN-01: Re-open a Patient Support ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Re-open a Patient Support ticket
    ...
    ...     Precondition: The Support Staff is the detail page of an Closed ticket
    ...
    ...     Test Steps
    ...     1. The user is on the closed ticket, clicks on the “Re-open” button on the detail ticket page
    ...     2. The user clicks on “Back” button
    ...     3. The user clicks on “Confirm” button
    ...
    ...     Expected Results:
    ...     1. The user should be prompted to confirm that they want to re-open the ticket.
    ...     There shall be a message “If you are sure you want to re-open this ticket, please confirm below.”
    ...     “Back” button, “Confirm” button
    ...     2. The user should be redirected to the detail page, the confirmation window shall be closed
    ...     3. The ticket shall be re-open and moved to the “Open” tab

    [Tags]    BSP-SUPPORT-PATIENT-REOPEN-01    BSP-SRS-002-FRS-08   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-QUICKACCESS-01: Quick access to Study information in the open tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Study information
    ...
    ...     Precondition: The Support Staff is on the ticket list, Open tab
    ...
    ...     Test Steps
    ...     1. The user clicks on Study ID hyperlink
    ...     2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     1. A quick access sidebar that displays the following:
    ...     Study information
    ...     Status
    ...     Start Time
    ...     End Time
    ...     Study Type
    ...     Patient Return Visit
    ...     Device ID – should be accompanied by a device model tag
    ...     Duration
    ...     Facility

    [Tags]    BSP-SUPPORT-PATIENT-QUICKACCESS-01    BSP-SRS-002-FRS-08   R2     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-PATIENT-QUICKACCESS-02: Quick access to Study information in the CLOSED tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to Study information
    ...
    ...     Precondition: The Support Staff is on the ticket list, CLOSED tab
    ...
    ...     Test Steps
    ...     1. The user clicks on Study ID hyperlink
    ...     2. Observe the sidebar
    ...
    ...     Expected Results:
    ...     1. A quick access sidebar that displays the following:
    ...     Study information
    ...     Status
    ...     Start Time
    ...     End Time
    ...     Study Type
    ...     Patient Return Visit
    ...     Device ID – should be accompanied by a device model tag
    ...     Duration
    ...     Facility

    [Tags]    BSP-SUPPORT-PATIENT-QUICKACCESS-02    BSP-SRS-002-FRS-08   R2     manual
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
