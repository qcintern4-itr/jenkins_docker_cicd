*** Settings ***
Documentation   Test Suite - Admin Portal - Users page
Metadata    sid     AP-USERS
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_admin_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      AP-USERS    web
Test Timeout    1h

*** Test Cases ***
AP-USERS-VIEW-01: View a list of users
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view a list of user
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Users] tab on the navigation bar
    ...
    ...     Expected Results:
    ...     - The Users page shall be displayed with 5 navigational tabs:
    ...     - - Call Center
    ...     - - Biocare Users
    ...     - - ERP
    ...     - - Unassigned
    ...     - - Referring Physicians
    ...     
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    ...
    ...
    [Tags]      AP-USERS-VIEW-01   AP-SRS-04-FRS-18    manual        CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-VIEW-01: View Call Center list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view Call Center list
    ...
    ...     Precondition:
    ...     - The Admin user is on Users page
    ...
    ...     Test Steps:
    ...     - 1. Click [Call Center] tab on the navigation bar
    ...     - 2. Observe the page
    ...
    ...
    ...     Expected Results:
    ...     - 1. The following attributes and columns of user’s information shall be displayed:
    ...     - - Username: Username of the user account,
    ...     - - Full name: First name and last name of the user,
    ...     - - Address: address + city + state + zip code + country,
    ...     - - Status: the status can be Active or Deactivated.
    ...     - - Email
    ...     - - Phone
    ...     - - Role
    ...     - 2. There shall be a search bar
    ...     - 3. By default, the list is sorted by creation order, in descending order
    ...     - 4. The list is divided into several pages
    ...     - 5. There shall be a [Assign] and [Edit] button when hovering over at the end of the row
    ...
    [Tags]      AP-USERS-CALLCENTER-VIEW-01   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-VIEW-02: Navigate between the pages of the Call Center list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the Call Center list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Users page and Call Center tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click ">" button
    ...     - 2. Click "<" button
    ...     - 3. Click a specific page number
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to the next page
    ...     - 2. Step 2 - Navigate the user to the previous page
    ...     - 3. Step 3 - Navigate the user to the selected page number
    ...
    [Tags]      AP-USERS-CALLCENTER-VIEW-02   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-SEARCH-01: Search a Call Center that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Call Center that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. Search by username that existing in the system
    ...     - 3. Search by First/Last Name that existing in the system
    ...     - 4. Search by Email that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The admin can search for Username, First/Last Name, and Email
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered username
    ...     - 3. Step 3 - The system shall be filtered and displayed accordingly with the entered First/Last Name
    ...     - 4. Step 4 - The system shall be filtered and displayed accordingly with the entered Email
    ...
    [Tags]      AP-USERS-CALLCENTER-SEARCH-01   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-SEARCH-02: Search a Call Center that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Call Center that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center Users page
    ...
    ...     Test Steps:
    ...     - 1. Search by username that not existing in the system
    ...     - 2. Search by First/Last Name that not existing in the system
    ...     - 3. Search by Email that not existing in the system
    ...
    ...     Expected Results:
    ...     - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-USERS-CALLCENTER-SEARCH-02   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-ASSIGN-01: Assign Call Center user to access Call Center portal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can assign the user roles to access Call Center
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On Bioflux portal section, click [User role] dropdown
    ...     - 3. Select a option from the dropdown, then click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. There shall be user roles displayed, including: Call Center QA, Call Center QA leader, Call Center Supervisor, Call Center Technician
    ...     - and message: “After assigning the role, please update the Call Center information on the account details page.”
    ...     - 3. The user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-CALLCENTER-ASSIGN-01   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-ASSIGN-02: Unassign Call Center user to access Call Center portal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can unassign the user roles to access Call Center
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On Bioflux portal section, uncheck [Bioflux Call Center Portal] checkbox, then click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. The user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-CALLCENTER-ASSIGN-02   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-ASSIGN-03: Assign Call Center user to access ERP portals
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can assign the user roles to access ERP portals
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On ERP Portals section
    ...     - 2.1 Check [Admin Portal] checkbox
    ...     - 2.2 Check [Biodirect portal, Operation Digitalization, Service and Distribution (S&D) Portal] checkbox,
    ...     - select a option from the [User role] dropdown
    ...     - 2.3 Check [Quality Management System (QMS) Portal] checkbox
    ...     - 2.4 Check [Support Portal] checkbox
    ...     - 2.5 Check [Sales Portal] checkbox, select a option from the [User role] dropdown
    ...     - 3. Click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. The selected checkbox shall display
    ...     - - Step 2.2 [User role] dropdown shall display, including: Operation Staff (default value) and Operation Manager
    ...     - - Step 2.5 [User role] dropdown shall display, including: Sales Representative (default value), Sales Manager and Sales Admin
    ...     - 3. The user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-CALLCENTER-ASSIGN-03   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-01: View all steps in Create New Call Center Technician screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Create New Call Center Technician screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center User page
    ...
    ...     Test Steps:
    ...     - 1. Click [Create new user] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Create New Call Center user with the following steps:
    ...     - - Step 1-User Information
    ...     - - Step 2-User Contact
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-01  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-01: View all fields in step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 1-User Information
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Role: CC Technician (default value)
    ...     - - Title
    ...     - - First name (required)
    ...     - - Last name (required)
    ...     - - Username (required)
    ...     - - Email (required)
    ...     - - Notification Criteria
    ...     - - Status: Active (default value)
    ...     - - Account Attributes checkbox
    ...     - - Call Center User group
    ...     - - Display Event Buckets (required)
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-01  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-02: Enter or leave empty Title
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Title
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Title field, leave empty value, then click [Next] button
    ...     - 2. In Title field, enter a title, then click [Next] button
    ...
    ...     Expected Results:
    ...     - Step 1,2 There is no error message under Title field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-02  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-03: Enter First name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid first name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. In First name field, leave empty value, then click [Next] button
    ...     - 2. In First name field, enter a First name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter first name" displayed under First name field
    ...     - 2. There is no error message displayed under First name field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-03  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-04: Enter Last name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid last name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Last name field, leave empty value, then click [Next] button
    ...     - 2. In Last name field, enter a First name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter last name" displayed under Last name field
    ...     - 2. There is no error message displayed under Last name field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-04  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-05: Enter username
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid username
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. In username field, leave empty value, then click [Next] button
    ...     - 2. In username field, enter an existing username, then click [Next] button
    ...     - 3. In username field, enter a valid username, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter username" displayed under username field
    ...     - 2. There shall be an error message "Username existed" displayed under username field
    ...     - 3. There is no error message displayed under username field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-05  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-06: Enter Email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter Email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Email field, leave empty value, then click [Next] button
    ...     - 2. In Email field, enter a valid email, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter email" displayed under Email field
    ...     - 2. Email is displayed and there is no error message displayed under Email field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-06  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-07: Enter or leave empty Notification Criteria
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Notification Criteria
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Notification Criteria field, leave empty value, then click [Next] button
    ...     - 2. In Notification Criteria field, enter a title, then click [Next] button
    ...
    ...     Expected Results:
    ...     - Step 1,2 There is no error message under Notification Criteria field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-07  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-08: Select status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select a status
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Status] dropdown
    ...     - 2. Select a status
    ...
    ...     Expected Results:
    ...     - 1. Step 1
    ...     - - There are the following status displayed: Active and Deactivated
    ...     - - The default selected value shall be Active
    ...     - 2. Step 2
    ...     - - The selected status shall display
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-08   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-09: Set Account Attributes
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can set Account Attributes
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. Check or uncheck [Test Account] checkbox
    ...     - 2. Check or uncheck [Enable AI Viewer] checkbox
    ...
    ...     Expected Results:
    ...     - 1. The checkbox shall display properly. When checked, the user will be created for testing purposes
    ...     - 2. The checkbox shall display properly. When checked, the AI Viewer shall be enabled
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-09   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-10: Select or leave empty Call Center User group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Call Center User group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. In the case Account Attributes is Test Account, click [Call Center User Group] dropdown, then select a group or leave empty
    ...     - 2. In the case Account Attributes is not Test Account, click [Call Center User Group] dropdown, then select a group or leave empty
    ...     - 3. In case of changing Account Attributes Status, observe Call Center User Group
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - A list of Call Center Technician group shall display according to Account Attributes is Test Account
    ...     - 2. Step 2 - A list of Call Center Technician group shall display according to Account Attributes is not Test Account
    ...     - 3. Step 3 - Display an error message “Please select another call center group accordingly to the user status.” under the Call Center User Group filed.
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-10   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-11: Select Display Event Buckets
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select Display Event Buckets
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 1
    ...
    ...     Test Steps:
    ...     - 1. Observe Display Event Buckets section
    ...     - 2. Uncheck all checkboxes, then click [Next] button
    ...     - 3. Check the following checkboxes, then click [Next] button
    ...     - 3.1 [Non-Viable] checkbox
    ...     - 3.2 [Viable] checkbox
    ...     - 3.3 [Sinus] checkbox
    ...     - 3.4 [Sinus Tachy] checkbox
    ...     - 3.5 [Sinus Brady] checkbox
    ...     - 3.6 [Pause] checkbox
    ...     - 3.7 [Priority] checkbox
    ...
    ...     Expected Results:
    ...     - 1. The event buckets shall be displayed in a row:
    ...     - - Non-Viable
    ...     - - Viable
    ...     - - Sinus
    ...     - - Sinus Tachy
    ...     - - Sinus Brady
    ...     - - Pause
    ...     - - Priority
    ...     - 2. There shall be an error message "Please select event buckets" displayed under Display Event Buckets field
    ...     - 3. There is no error message displayed under Display Event Buckets field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-11   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-12: Cancel the creating new Call Center user when is on step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cancel the creating new Call Center user when is on step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Call Center User page and all text input shall be dismissed
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-12   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP1-13: Move to step 2 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can move to step 2 if all valid information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 2-User Contact
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP1-13   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-01: View all fields in step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 2-User Contact
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Country (required)
    ...     - - Address (required)
    ...     - - City (required)
    ...     - - State (required)
    ...     - - Zip code (required)
    ...     - - Day phone number
    ...     - - After hours phone number
    ...     - - Fax number
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-01  AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-02: Enter Country, Address, City, State, Zipcode
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid address
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Country field, select a Country from the dropdown list
    ...     - 2. In Address field, search and select a address from the suggestion list
    ...     - 3. Click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - All available information shall be auto-filled on Address/City/State/Zipcode
    ...     - 2. There is no error message display under Country/Address/City/State/Zipcode field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-02   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-03: Enter Day phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Day phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under Day phone number field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-03   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-04: Enter After hours phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty After hours phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under Day phone number field
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-04   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-05: Enter fax number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Fax number field, enter one or multiple fax numbers seperated by space (format xxx-xxx-xxxx), then click [Next] button
    ...     - 2. In the case uncheck Auto-fax facility checkbox, leave empty value, then click [Next] button
    ...     - 3. In the case check Auto-fax facility checkbox, leave empty value, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There is no error message display under Phone number field
    ...     - 2. Step 2 - There is no error message display under Phone number field
    ...     - 3. Step 3 - There shall be an error message "Fax number cannot be empty because Auto-fax report to facility is enabled" displayed
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-05   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-06: Cancel the creating new Call Center user when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new Call Center user-Step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Call Center User page and all text input shall be dismissed
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-06   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-07: Back to step 1 when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 1-User Information
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-07   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CALLCENTER-CREATE-STEP2-08: Create new Call Center Technician
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create a new Call Center Technician succeffuly
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician-step 2
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Create] button
    ...
    ...     Expected Results:
    ...     - A new Call Center Technician shall be displayed on the Call Center user list and the user shall be navigated
    ...     - to the Call Center User page
    ...
    [Tags]      AP-USERS-CALLCENTER-CREATE-STEP2-08   AP-SRS-04-FRS-06    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CP-2.31.0: Từ đợt release này thì Merge Billing user với Clinic user thành Biocare Users tab (Các phần dưới đây hãy review lại)
#START-REVIEWING-FROM_HERE

AP-USERS-BILLING-VIEW-01: View Billing list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view Billing list
    ...
    ...     Precondition:
    ...     - The Admin user is on Users page
    ...
    ...     Test Steps:
    ...     - 1. Click [Billing] tab on the navigation bar
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     - 1. The following attributes and columns of user’s information shall be displayed:
    ...     - - Username: Username of the user account,
    ...     - - Full name: First name and last name of the user,
    ...     - - Address: address + city + state + zip code + country,
    ...     - - Status: the status can be Active or Deactivated.
    ...     - - Email
    ...     - - Phone
    ...     - - Role
    ...     - - Facility
    ...     - 2. There shall be a search bar
    ...     - 3. By default, the list is sorted by creation order, in descending order
    ...     - 4. The list is divided into several pages
    ...
    [Tags]      AP-USERS-BILLING-VIEW-01   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-VIEW-02: Navigate between the pages of the Billing list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the Billing list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Users page and Billing tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click ">" button
    ...     - 2. Click "<" button
    ...     - 3. Click a specific page number
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to the next page
    ...     - 2. Step 2 - Navigate the user to the previous page
    ...     - 3. Step 3 - Navigate the user to the selected page number
    ...
    [Tags]      AP-USERS-BILLING-VIEW-02   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-SEARCH-01: Search a Billing that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Billing that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Billing Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. Search by username that existing in the system
    ...     - 3. Search by First/Last Name that existing in the system
    ...     - 4. Search by Email that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The admin can search for Username, First/Last Name, and Email
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered username
    ...     - 3. Step 3 - The system shall be filtered and displayed accordingly with the entered First/Last Name
    ...     - 4. Step 4 - The system shall be filtered and displayed accordingly with the entered Email
    ...
    [Tags]      AP-USERS-BILLING-SEARCH-01   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-SEARCH-02: Search a Billing that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Billing that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Billing Users page
    ...
    ...     Test Steps:
    ...     - 1. Search by username that not existing in the system
    ...     - 2. Search by First/Last Name that not existing in the system
    ...     - 3. Search by Email that not existing in the system
    ...
    ...     Expected Results:
    ...     - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-USERS-BILLING-SEARCH-02   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-FILTER-01: Filter Billing list by Facility name that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter Billing list by Facility name that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Billing Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search dropdown
    ...     - 2. Enter a Facility name that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Search Dropdown with the text “Search by Facility”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered Facility name
    ...
    [Tags]      AP-USERS-BILLING-FILTER-01   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-FILTER-02: Filter Billing list by Facility name that not existing in the system
        [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter Billing list by Facility name that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Billing Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search dropdown
    ...     - 2. Enter a Facility name that not existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Search Dropdown with the text “Search by Facility”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-USERS-BILLING-FILTER-02   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-01: View all steps in Create New Billing screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Create New Billing screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Click [Create new user] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Create New Billing user with the following steps:
    ...     - - Step 1-User Information
    ...     - - Step 2-User Contact
    ...
    [Tags]      AP-USERS-BILLING-CREATE-01  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-01: View all fields in step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 1-User Information
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Role: Billing user
    ...     - - Title
    ...     - - First name (required)
    ...     - - Last name (required)
    ...     - - Username (required)
    ...     - - Email (required)
    ...     - - Facility (required)
    ...     - - Notification Criteria
    ...     - - Status: Active (default value)
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-01  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-02: Enter or leave empty Title
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Title
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Title field, leave empty value, then click [Next] button
    ...     - 2. In Title field, enter a title, then click [Next] button
    ...
    ...     Expected Results:
    ...     - Step 1,2 There is no error message under Title field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-02  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-03: Enter First name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid first name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. In First name field, leave empty value, then click [Next] button
    ...     - 2. In First name field, enter a First name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter first name" displayed under First name field
    ...     - 2. There is no error message displayed under First name field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-03  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-04: Enter Last name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid last name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Last name field, leave empty value, then click [Next] button
    ...     - 2. In Last name field, enter a First name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter last name" displayed under Last name field
    ...     - 2. There is no error message displayed under Last name field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-04  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-05: Enter username
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid username
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. In username field, leave empty value, then click [Next] button
    ...     - 2. In username field, enter an existing username, then click [Next] button
    ...     - 3. In username field, enter a valid username, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter username" displayed under username field
    ...     - 2. There shall be an error message "Username existed" displayed under username field
    ...     - 3. There is no error message displayed under username field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-05  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-06: Enter Email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter Email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Email field, leave empty value, then click [Next] button
    ...     - 2. In Email field, enter valid email, then click [Next] button
    ...     - 3. In Email field, enter an existing email, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1-There shall be an error message "Please enter email" displayed under Email field
    ...     - 2. Step 2-There is no error message displayed under Email field
    ...     - 3. Step 3-There shall be a message: “The email already exists. Please try another” under Email field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-06  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-07: Enter Facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter Facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Facility field, leave empty value, then click [Next] button
    ...     - 2. In Facility field, enter and select one or multiple facilities, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1-There is an error message "Please enter Facility" displayed under Facility field
    ...     - 2. Step 2-When the user inputs the search value, the system should filter/autosuggest the options.
    ...     - It includes: Name, Facility Id, and Facility status
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-07  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-08: Enter or leave empty Notification Criteria
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Notification Criteria
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Notification Criteria field, leave empty value, then click [Next] button
    ...     - 2. In Notification Criteria field, enter a title, then click [Next] button
    ...
    ...     Expected Results:
    ...     - Step 1,2 There is no error message under Notification Criteria field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-08  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-09: Select status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select a status
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Status] dropdown
    ...     - 2. Select a status
    ...
    ...     Expected Results:
    ...     - 1. Step 1
    ...     - - There are the following status displayed: Active and Deactivated
    ...     - - The default selected value shall be Active
    ...     - 2. Step 2
    ...     - - The selected status shall display
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-09   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-10: Cancel the creating new Billing user when is on step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cancel the creating new Billing user when is on step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Billing User page and all text input shall be dismissed
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-10   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP1-11: Move to step 2 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can move to step 2 if all valid information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 1
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 2-User Contact
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP1-11   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-01: View all fields in step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 2
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 2-User Contact
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Country (required)
    ...     - - Address (required)
    ...     - - City (required)
    ...     - - State (required)
    ...     - - Zip code (required)
    ...     - - Day phone number
    ...     - - After hours phone number
    ...     - - Fax number
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-01  AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-02: Enter Country, Address, City, State, Zipcode
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid address
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Country field, select a Country from the dropdown list
    ...     - 2. In Address field, search and select a address from the suggestion list
    ...     - 3. Click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - All available information shall be auto-filled on Address/City/State/Zipcode
    ...     - 2. There is no error message display under Country/Address/City/State/Zipcode field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-02   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-03: Enter Day phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Day phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billinf-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under Day phone number field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-03   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-04: Enter After hours phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty After hours phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under After phone number field
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-04   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-05: Enter fax number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Fax number field, enter one or multiple fax numbers seperated by space (format xxx-xxx-xxxx), then click [Next] button
    ...     - 2. In the case uncheck Auto-fax facility checkbox, leave empty value, then click [Next] button
    ...     - 3. In the case check Auto-fax facility checkbox, leave empty value, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There is no error message display under Phone number field
    ...     - 2. Step 2 - There is no error message display under Phone number field
    ...     - 3. Step 3 - There shall be an error message "Fax number cannot be empty because Auto-fax report to facility is enabled" displayed
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-05   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-06: Cancel the creating new Billing user when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new Clinic user-Step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Billing User page and all text input shall be dismissed
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-06   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-07: Back to step 1 when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 1-User Information
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-07   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-STEP2-08: Create new Billing user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create a new Billing user succeffuly
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Billing-step 2
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Create] button
    ...
    ...     Expected Results:
    ...     - A new Billing user shall be displayed on the Billing user list and the user shall be navigated
    ...     - to the Billing User page
    ...
    [Tags]      AP-USERS-BILLING-CREATE-STEP2-08   AP-SRS-04-FRS-09    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-SEND-EMAIL-01: Send email when creating Billing user with a valid email
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Send email when creating Billing user with a valid email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create new user
    ...
    ...     Test Steps:
    ...     - 1. Filling in the required information
    ...     - 2. In the Email filed - enter valid email
    ...     - 3. Click the Create button

    ...
    ...     Expected Results:
    ...     - The Billing user shall be created successfully and a Welcome email shall be sent to the user.
    ...
    ...
    [Tags]      AP-USERS-BILLING-CREATE-SEND-EMAIL-01   AP-SRS-04-FRS-02    manual      1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-SEND-EMAIL-02: Send email after creating billing user within 5 minutes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - A Billing user just created within 5 minutes
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. Observe the screen
    ...
    ...     Expected Results:
    ...     - The email is sent successfully, there shall be a success toast message “Welcome email sent successfully!”
    ...
    [Tags]      AP-USERS-BILLING-CREATE-SEND-EMAIL-02   AP-SRS-04-FRS-02    manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-CREATE-SEND-EMAIL-03: Send email when creating billing user after 5 minutes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - A Billing user just created after 5 minutes
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. Observe the screen
    ...
    ...     Expected Results:
    ...     - The email is sent successfully, there shall be a success toast message “Welcome email sent successfully!”
    ...
    [Tags]      AP-USERS-BILLING-CREATE-SEND-EMAIL-03   AP-SRS-04-FRS-02    manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-USERS-BILLING-CREATE-SEND-EMAIL-04: Don't send Welcome email when creating user don't fill in email
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email when creating user don't fill in email
    ...     Precondition:
    ...     - The Admin user is on the Create new user
    ...     Test Steps:
    ...     - 1. Create the Billing user with the empty email field
    ...     - 2. Observe

    ...
    ...     Expected Results:
    ...     - The Welcome email shall not be sent when creating user don't fill in email
    ...
    [Tags]      AP-USERS-BILLING-CREATE-SEND-EMAIL-04   AP-SRS-04-FRS-02    manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-USERS-BILLING-EDIT-01: View Edit Billing user page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in Edit Billing user page
    ...
    ...     Precondition:
    ...     - The Admin user is on the Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the row and click [Edit] button
    ...
    ...     Expected Results:
    ...     - 1. The user is navigated to Edit Billing user page with the following fields:
    ...     - - On the header of the “Edit User” screen, the username component shall be displayed next to the title of the page
    ...     - - In the body of the “Edit User” screen, there shall be two following sections:
    ...     - + User Information
    ...     - + User Contact
    ...
    [Tags]      AP-USERS-BILLING-EDIT-01   AP-SRS-04-FRS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-EDIT-02: Edit User Information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit User Information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Edit the following fields:
    ...     - 1.1 Title
    ...     - 1.2 First name
    ...     - 1.3 Last name
    ...     - 1.4 Facility
    ...     - 1.5 Status
    ...     - 1.6 Notification Criteria
    ...     - 2. Click [Save] button
    ...
    ...     Expected Results:
    ...     - The new changes shall be saved
    ...
    [Tags]      AP-USERS-BILLING-EDIT-02   AP-SRS-04-FRS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-EDIT-03: Edit User Contact
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Edit the following fields:
    ...     - 1.1 Country, Address, City, State, Zip code
    ...     - 1.2 Day phone number
    ...     - 1.3 After hours phone number
    ...     -  1.4 Fax number
    ...     - 2. Click [Save] button
    ...
    ...     Expected Results:
    ...     - The new changes shall be saved
    ...
    [Tags]      AP-USERS-BILLING-EDIT-03   AP-SRS-04-FRS-02    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-USERS-BILLING-EDIT-SEND-EMAIL-01: Resend email after sending email within 5 minutes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. Within 5 minutes - clicks the Resend email button
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - There shall be an error toast with the message: “Welcome email recently sent! Please try again in 5 minutes.”
    ...
    [Tags]      AP-USERS-BILLING-EDIT-SEND-EMAIL-01           manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-EDIT-SEND-EMAIL-02: Re-click on the button after 5 minutes from the first time
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. After 5 minutes - clicks the Resend email button
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall be sent to the inputted email in the account details page successfully and there shall be a success toast message “Welcome email sent successfully!
    ...
    [Tags]      AP-USERS-BILLING-EDIT-SEND-EMAIL-02          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-EDIT-SEND-EMAIL-03: Don't send Welcome email when creating user don't fill in email then clicking the Resend Welcome email button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email when creating user don't fill in email then clicking the Resend Welcome email button
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Resend Welcome email
    ...     - 2. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall not be sent when creating user don't fill in email
    ...
    [Tags]      AP-USERS-BILLING-EDIT-SEND-EMAIL-03          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-EDIT-SEND-EMAIL-04: Don't send Welcome email after updating email in the Edit User screen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email after updating email in the Edit User screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Update valid email for the empty email field >> click the Save button
    ...     - 2. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall not be sent after updating email
    ...
    [Tags]      AP-USERS-BILLING-EDIT-SEND-EMAIL-04          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-EDIT-SEND-EMAIL-05:Send Welcome email when updating the email then clicking the Resend welcome email button in the Edit User screen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email after updating email in the Edit User screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Update valid email for the empty email field >> click the Save button
    ...     - 2. Click  the Resend Welcome email button
    ...     - 3. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall be sent to the inputted email in the account details page successfully and there shall be a success toast message “Welcome email sent successfully!
    ...
    [Tags]      AP-USERS-BILLING-EDIT-SEND-EMAIL-05          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BILLING-EDIT-SEND-EMAIL-06: The welcome email with the previous content will be sent even if any information in the Edit User page is changed and click the Resend Welcome button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email after updating email in the Edit User screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Billing User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Update valid email for the empty email field >> click the Save button
    ...     - 2. Click  the Resend Welcome email button
    ...     - 3. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall be sent to the inputted email in the account details page successfully and there shall be a success toast message “Welcome email sent successfully!
    ...
    [Tags]      AP-USERS-BILLING-EDIT-SEND-EMAIL-06          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-ERP-VIEW-01: View ERP list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view ERP list
    ...
    ...     Precondition:
    ...     - The Admin user is on Users page
    ...
    ...     Test Steps:
    ...     - 1. Click [ERP] tab on the navigation bar
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     - 1. The following attributes and columns of user’s information shall be displayed:
    ...     - - Username: Username of the user account,
    ...     - - Full name: First name and last name of the user,
    ...     - - Address: address + city + state + zip code + country,
    ...     - - Status: the status can be Active or Deactivated.
    ...     - - Email
    ...     - - Phone
    ...     - - Role
    ...     - 2. There shall be a search bar
    ...     - 3. By default, the list is sorted by creation order, in descending order
    ...     - 4. The list is divided into several pages
    ...     - 5. There shall be a [Assign] and [Edit] button when hovering over at the end of the row
    ...
    [Tags]      AP-USERS-ERP-VIEW-01   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-ERP-VIEW-02: Navigate between the pages of the ERP list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the ERP list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Users page and ERP tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click ">" button
    ...     - 2. Click "<" button
    ...     - 3. Click a specific page number
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to the next page
    ...     - 2. Step 2 - Navigate the user to the previous page
    ...     - 3. Step 3 - Navigate the user to the selected page number
    ...
    [Tags]      AP-USERS-ERP-VIEW-02   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-ERP-SEARCH-01: Search a ERP that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for ERP that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the ERP Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. Search by username that existing in the system
    ...     - 3. Search by First/Last Name that existing in the system
    ...     - 4. Search by Email that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The admin can search for Username, First/Last Name, and Email
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered username
    ...     - 3. Step 3 - The system shall be filtered and displayed accordingly with the entered First/Last Name
    ...     - 4. Step 4 - The system shall be filtered and displayed accordingly with the entered Email
    ...
    [Tags]      AP-USERS-ERP-SEARCH-01   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-ERP-SEARCH-02: Search a ERP that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for ERP that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the ERP Users page
    ...
    ...     Test Steps:
    ...     - 1. Search by username that not existing in the system
    ...     - 2. Search by First/Last Name that not existing in the system
    ...     - 3. Search by Email that not existing in the system
    ...
    ...     Expected Results:
    ...     - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-USERS-ERP-SEARCH-02   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-ERP-ASSIGN-01: Assign ERP user to access Call Center portal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can assign the user roles to access Call Center portal
    ...
    ...     Precondition:
    ...     - The Admin user is on the ERP Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On Bioflux portal section, check [Bioflux Call Center Portal] checkbox, then click [User role] dropdown
    ...     - 3. Select a option from the dropdown, then click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. There shall be user roles displayed, including: Call Center QA, Call Center QA leader, Call Center Supervisor, Call Center Technician
    ...     - and message: “After assigning the role, please update the Call Center information on the account details page.”
    ...     - 3. The user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-ERP-ASSIGN-01   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-ERP-ASSIGN-02: Unassign ERP user to access ERP portals
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can unassign the user roles to access ERP portals
    ...
    ...     Precondition:
    ...     - The Admin user is on the ERP Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On ERP Portals section
    ...     - 2.1 Uncheck [Admin Portal] checkbox
    ...     - 2.2 Uncheck [Biodirect portal, Operation Digitalization, Service and Distribution (S&D) Portal] checkbox
    ...     - 2.3 Uncheck [Quality Management System (QMS) Portal] checkbox
    ...     - 2.4 Uncheck [Support Portal] checkbox
    ...     - 2.5 Uncheck [Sales Portal] checkbox
    ...     - 3. Click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. Step 3, the user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-ERP-ASSIGN-02   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-ERP-ASSIGN-03: Assign ERP user to access ERP portals
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can assign the user roles to access ERP portals
    ...
    ...     Precondition:
    ...     - The Admin user is on the ERP Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On ERP Portals section
    ...     - 2.1 Check [Admin Portal] checkbox
    ...     - 2.2 Check [Biodirect portal, Operation Digitalization, Service and Distribution (S&D) Portal] checkbox,
    ...     - - select a option from the [User role] dropdown
    ...     - 2.3 Check [Quality Management System (QMS) Portal] checkbox
    ...     - 2.4 Check [Support Portal] checkbox
    ...     - 2.5 Check [Sales Portal] checkbox, select a option from the [User role] dropdown
    ...     - 3. Click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. The selected checkbox shall display
    ...     - - Step 2.2 [User role] dropdown shall display, including: Operation Staff (default value) and Operation Manager
    ...     - - Step 2.5 [User role] dropdown shall display, including: Sales Representative (default value), Sales Manager and Sales Admin
    ...     - 3. The user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-ERP-ASSIGN-03   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-VIEW-01: View Clinic list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view Clinic list
    ...
    ...     Precondition:
    ...     - The Admin user is on Users page
    ...
    ...     Test Steps:
    ...     - 1. Click [Clinic] tab on the navigation bar
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     - 1. The following attributes and columns of user’s information shall be displayed:
    ...     - - Username: Username of the user account,
    ...     - - Full name: First name and last name of the user,
    ...     - - Address: address + city + state + zip code + country,
    ...     - - Status: the status can be Active or Deactivated.
    ...     - - Email
    ...     - - Phone
    ...     - - Role
    ...     - - Facility
    ...     - 2. There shall be a search bar and a search dropdown
    ...     - 3. By default, the list is sorted by creation order, in descending order
    ...     - 4. The list is divided into several pages
    ...
    [Tags]      AP-USERS-CLINIC-VIEW-01   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-VIEW-02: Navigate between the pages of the Clinic list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the Clinic list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Users page and Clinic tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click ">" button
    ...     - 2. Click "<" button
    ...     - 3. Click a specific page number
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to the next page
    ...     - 2. Step 2 - Navigate the user to the previous page
    ...     - 3. Step 3 - Navigate the user to the selected page number
    ...
    [Tags]      AP-USERS-CLINIC-VIEW-02   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-SEARCH-01: Search a Clinic that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Clinic that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Clinic Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. Search by username that existing in the system
    ...     - 3. Search by First/Last Name that existing in the system
    ...     - 4. Search by Email that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The admin can search for Username, First/Last Name, and Email
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered username
    ...     - 3. Step 3 - The system shall be filtered and displayed accordingly with the entered First/Last Name
    ...     - 4. Step 4 - The system shall be filtered and displayed accordingly with the entered Email
    ...
    [Tags]      AP-USERS-CLINIC-SEARCH-01   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-SEARCH-02: Search a Clinic that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Clinic that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Clinic Users page
    ...
    ...     Test Steps:
    ...     - 1. Search by username that not existing in the system
    ...     - 2. Search by First/Last Name that not existing in the system
    ...     - 3. Search by Email that not existing in the system
    ...
    ...     Expected Results:
    ...     - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-USERS-CLINIC-SEARCH-02   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-FILTER-01: Filter Clinic list by Facility name that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter Clinic list by Facility name that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Clinic Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search dropdown
    ...     - 2. Enter a Facility name that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Search Dropdown with the text “Search by Facility”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered Facility name
    ...
    [Tags]      AP-USERS-CLINIC-FILTER-01   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-FILTER-02: Filter Clinic list by Facility name that not existing in the system
        [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter Clinic list by Facility name that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Clinic Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search dropdown
    ...     - 2. Enter a Facility name that not existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Search Dropdown with the text “Search by Facility”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-USERS-CLINIC-FILTER-02   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-01: View all steps in Create New Clinic screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Create New Clinic screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Clinic User page
    ...
    ...     Test Steps:
    ...     - 1. Click [Create new user] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Create New Clinic user with the following steps:
    ...     - - Step 1-User Information
    ...     - - Step 2-User Contact
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-01  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-01: View all fields in step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 1-User Information
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Role: Clinic Technician (default value), Clinic Physician, Electrophysiologist
    ...     - - Title
    ...     - - First name (required)
    ...     - - Last name (required)
    ...     - - Username (required)
    ...     - - Email
    ...     - - Facility (required)
    ...     - - Notification Criteria
    ...     - - Status: Active (default value)
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-01  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-02: Enter or leave empty Title
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Title
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Title field, leave empty value, then click [Next] button
    ...     - 2. In Title field, enter a title, then click [Next] button
    ...
    ...     Expected Results:
    ...     - Step 1,2 There is no error message under Title field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-02  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-03: Enter First name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid first name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. In First name field, leave empty value, then click [Next] button
    ...     - 2. In First name field, enter a First name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter first name" displayed under First name field
    ...     - 2. There is no error message displayed under First name field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-03  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-04: Enter Last name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid last name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Last name field, leave empty value, then click [Next] button
    ...     - 2. In Last name field, enter a First name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter last name" displayed under Last name field
    ...     - 2. There is no error message displayed under Last name field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-04  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-05: Enter username
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid username
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. In username field, leave empty value, then click [Next] button
    ...     - 2. In username field, enter an existing username, then click [Next] button
    ...     - 3. In username field, enter a valid username, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter username" displayed under username field
    ...     - 2. There shall be an error message "Username existed" displayed under username field
    ...     - 3. There is no error message displayed under username field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-05  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-06: Enter or leave empty Email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Email field, enter valid email or leave empty, then click [Next] button
    ...     - 2. In Email field, enter an existing email, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1-There is no error message displayed under Email field
    ...     - 2. Step 2-There shall be a message: “The email already exists. Please try another” under Email field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-06  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-07: Enter Facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter Facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Facility field, leave empty value, then click [Next] button
    ...     - 2. In Facility field, enter and select one or multiple facilities, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1-There is an error message "Please enter Facility" displayed under Facility field
    ...     - 2. Step 2-When the user inputs the search value, the system should filter/autosuggest the options.
    ...     - It includes: Name, Facility Id, and Facility status
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-07  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-08: Enter or leave empty Notification Criteria
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Notification Criteria
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. In Notification Criteria field, leave empty value, then click [Next] button
    ...     - 2. In Notification Criteria field, enter a title, then click [Next] button
    ...
    ...     Expected Results:
    ...     - Step 1,2 There is no error message under Notification Criteria field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-08  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-09: Select status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select a status
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Status] dropdown
    ...     - 2. Select a status
    ...
    ...     Expected Results:
    ...     - 1. Step 1
    ...     - - There are the following status displayed: Active and Deactivated
    ...     - - The default selected value shall be Active
    ...     - 2. Step 2
    ...     - - The selected status shall display
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-09   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-10: Cancel the creating new Clinic user when is on step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cancel the creating new Clinic user when is on step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Clinic User page and all text input shall be dismissed
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-10   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP1-11: Move to step 2 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can move to step 2 if all valid information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 1
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 2-User Contact
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP1-11   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-01: View all fields in step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 2-User Contact
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Country (required)
    ...     - - Address (required)
    ...     - - City (required)
    ...     - - State (required)
    ...     - - Zip code (required)
    ...     - - Day phone number
    ...     - - After hours phone number
    ...     - - Fax number
    ...     - - There shall be an option “Display this contact on reports when the user serves as an interpreting physician.”
    ...     - if the role is “Clinic Physician”. By default, it is checked
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-01  AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-02: Enter Country, Address, City, State, Zipcode
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid address
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Country field, select a Country from the dropdown list
    ...     - 2. In Address field, search and select a address from the suggestion list
    ...     - 3. Click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - All available information shall be auto-filled on Address/City/State/Zipcode
    ...     - 2. There is no error message display under Country/Address/City/State/Zipcode field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-02   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-03: Enter Day phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Day phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under Day phone number field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-03   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-04: Enter After hours phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty After hours phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under After phone number field
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-04   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-05: Enter fax number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. In Fax number field, enter one or multiple fax numbers seperated by space (format xxx-xxx-xxxx), then click [Next] button
    ...     - 2. In the case uncheck Auto-fax facility checkbox, leave empty value, then click [Next] button
    ...     - 3. In the case check Auto-fax facility checkbox, leave empty value, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There is no error message display under Phone number field
    ...     - 2. Step 2 - There is no error message display under Phone number field
    ...     - 3. Step 3 - There shall be an error message "Fax number cannot be empty because Auto-fax report to facility is enabled" displayed
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-05   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-06: Cancel the creating new Clinic user when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new Clinic user-Step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Clinic User page and all text input shall be dismissed
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-06   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-07: Back to step 1 when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 1-User Information
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-07   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-STEP2-08: Create new Clinic user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create a new Clinic user succeffuly
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Clinic-step 2
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Create] button
    ...
    ...     Expected Results:
    ...     - A new Clinic user shall be displayed on the Clinic user list and the user shall be navigated
    ...     - to the Clinic User page
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-STEP2-08   AP-SRS-04-FRS-08    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-SEND-EMAIL-01: Send email when creating Billing user with a valid email
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Send email when creating Billing user with a valid email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create new user
    ...
    ...     Test Steps:
    ...     - 1. Filling in the required information
    ...     - 2. In the Email filed - enter valid email
    ...     - 3. Click the Create button

    ...
    ...     Expected Results:
    ...     - The Clinic user shall be created successfully and a Welcome email shall be sent to the user.
    ...
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-SEND-EMAIL-01   AP-SRS-04-FRS-02    manual      1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-SEND-EMAIL-02: Send email after creating billing user within 5 minutes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - A Billing user just created within 5 minutes
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. Observe the screen
    ...
    ...     Expected Results:
    ...     - The email is sent successfully, there shall be a success toast message “Welcome email sent successfully!”
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-SEND-EMAIL-02   AP-SRS-04-FRS-02    manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-CREATE-SEND-EMAIL-03: Send email when creating billing user after 5 minutes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - A Billing user just created after 5 minutes
    ...     - The Admin user is on the Edit Billing User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. Observe the screen
    ...
    ...     Expected Results:
    ...     - The email is sent successfully, there shall be a success toast message “Welcome email sent successfully!”
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-SEND-EMAIL-03   AP-SRS-04-FRS-02    manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-USERS-CLINIC-CREATE-SEND-EMAIL-04: Don't send Welcome email when creating user don't fill in email
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email when creating user don't fill in email
    ...     Precondition:
    ...     - The Admin user is on the Create new user
    ...     Test Steps:
    ...     - 1. Create the Billing user with the empty email field
    ...     - 2. Observe

    ...
    ...     Expected Results:
    ...     - The Welcome email shall not be sent when creating user don't fill in email
    ...
    [Tags]      AP-USERS-CLINIC-CREATE-SEND-EMAIL-04   AP-SRS-04-FRS-02    manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-01: View Edit Clinic user page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in Edit Clinic user page
    ...
    ...     Precondition:
    ...     - The Admin user is on the Clinic User page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the row and click [Edit] button
    ...
    ...     Expected Results:
    ...     - 1. The user is navigated to Edit Clinic user page with the following fields:
    ...     - - On the header of the “Edit User” screen, the username component shall be displayed next to the title of the page
    ...     - - In the body of the “Edit User” screen, there shall be two following sections:
    ...     - + User Information
    ...     - + User Contact
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-01   AP-SRS-04-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-02: Edit User Information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit User Information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...
    ...     Test Steps:
    ...     - 1. Edit the following fields:
    ...     - 1.1 Title
    ...     - 1.2 First name
    ...     - 1.3 Last name
    ...     - 1.4 Email
    ...     - 1.5 Facility
    ...     - 1.6 Status
    ...     - 1.7 Notification Criteria
    ...     - 2. Click [Save] button
    ...
    ...     Expected Results:
    ...     - The new changes shall be saved
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-02   AP-SRS-04-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-03: Edit User Contact
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...
    ...     Test Steps:
    ...     - 1. Edit the following fields:
    ...     - 1.1 Country, Address, City, State, Zip code
    ...     - 1.2 Day phone number
    ...     - 1.3 After hours phone number
    ...     - 1.4 Fax number
    ...     - 2. Click [Save] button
    ...
    ...     Expected Results:
    ...     The new changes shall be saved
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-03   AP-SRS-04-FRS-04    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-SEND-EMAIL-01: Resend email after sending email within 5 minutes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. Within 5 minutes - clicks the Resend email button
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - There shall be an error toast with the message: “Welcome email recently sent! Please try again in 5 minutes.”
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-SEND-EMAIL-01           manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-SEND-EMAIL-02: Re-click on the button after 5 minutes from the first time
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can edit User Contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...
    ...     Test Steps:
    ...     - 1. Click the Resend button
    ...     - 2. After 5 minutes - clicks the Resend email button
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall be sent to the inputted email in the account details page successfully and there shall be a success toast message “Welcome email sent successfully!
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-SEND-EMAIL-02          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-SEND-EMAIL-03: Don't send Welcome email when creating user don't fill in email then clicking the Resend Welcome email button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email when creating user don't fill in email then clicking the Resend Welcome email button
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Resend Welcome email
    ...     - 2. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall not be sent when creating user don't fill in email
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-SEND-EMAIL-03          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-SEND-EMAIL-04: Don't send Welcome email after updating email in the Edit User screen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email after updating email in the Edit User screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Update valid email for the empty email field >> click the Save button
    ...     - 2. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall not be sent after updating email
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-SEND-EMAIL-04          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-SEND-EMAIL-05:Send Welcome email when updating the email then clicking the Resend welcome email button in the Edit User screen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email after updating email in the Edit User screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Update valid email for the empty email field >> click the Save button
    ...     - 2. Click  the Resend Welcome email button
    ...     - 3. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall be sent to the inputted email in the account details page successfully and there shall be a success toast message “Welcome email sent successfully!
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-SEND-EMAIL-05          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-SEND-EMAIL-06: The welcome email with the previous content will be sent even if any information in the Edit User page is changed and click the Resend Welcome button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Don't send Welcome email after updating email in the Edit User screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page with the empty email field
    ...
    ...     Test Steps:
    ...     - 1. Update valid email for the empty email field >> click the Save button
    ...     - 2. Click  the Resend Welcome email button
    ...     - 3. Observe
    ...
    ...     Expected Results:
    ...     -  The Welcome email shall be sent to the inputted email in the account details page successfully and there shall be a success toast message “Welcome email sent successfully!
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-SEND-EMAIL-06          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-SEND-EMAIL-07: The Referring Doctor users do not have a Resend Welcome Email button.
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Referring Doctor users do not have a Resend Welcome Email button.
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...     Test Steps:
    ...     - 1. Observe
    ...     Expected Results:
    ...     -  The referring Doctor users do not have a Resend Welcome Email button.
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-SEND-EMAIL-07          manual       1.11.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-RESET-PW-01: Reset pw the account no email
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Reset pw the account no email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page without email
    ...     Test Steps:
    ...     - 1. Click the “More actions” button
    ...     - 2. Click the “Reset Password” button
    ...     Expected Results:
    ...     -  There shall be a modal that displays the new password for the user
    ... 	- On the modal there shall be a “Copy password” button that copies the password to the user’s clipboard
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-RESET-PW-01          manual       AP-1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-RESET-PW-02: Reset pw the account has email
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Reset pw the account has email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...     Test Steps:
    ...     - 1. Click the “More actions” button
    ...     - 2. Click the “Reset Password” button
    ...     Expected Results:
    ...     -  There shall be a modal that displays the new password for the user
    ... 	- On the modal there shall be a “Copy password” button that copies the password to the user’s clipboard
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-RESET-PW-02          manual       AP-1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-RESET-PW-03: Reset pw the account with new address
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Reset pw the account with new address
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...     Test Steps:
    ...     - 1. Change new adress then Save button
    ...     - 2. Click the “More actions” button
    ...     - 2. Click the “Reset Password” button
    ...     Expected Results:
    ...     1. Step 1: The new address shall be displayed.
    ...     2. Step 2: There shall be a modal that displays the new password for the user
    ...     •	If the address country is “United States”: 2@2@<username><address_state_code>
    ...     •	Else: 2@2@<username><country_code>
    ... 	- On the modal there shall be a “Copy password” button that copies the password to the user’s clipboard
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-RESET-PW-03          manual       AP-1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-RESET-PW-04: Reset the account pw when the account has been reset new pw
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Reset the account pw when the account has been reset new pw
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...     Test Steps:
    ...     - 1. Click the “More actions” button
    ...     - 2. Click the “Reset Password” button
    ...     Expected Results:
    ...     1. Step 2: There shall be a modal that displays the new password for the user
    ...     •	If the address country is “United States”: 2@2@<username><address_state_code>
    ...     •	Else: 2@2@<username><country_code>
    ... 	- On the modal there shall be a “Copy password” button that copies the password to the user’s clipboard
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-RESET-PW-04          manual       AP-1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-CLINIC-EDIT-RESET-PW-05: Copies the password to the user’s clipboard
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Copies the password to the user’s clipboard
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Clinic User page
    ...     Test Steps:
    ...     - 1. Click the “More actions” button
    ...     - 2. Click the “Reset Password” button
    ...     - 3. Click the “Copy password” button
    ...     Expected Results:
    ...     1. Step 2: There shall be a modal that displays the new password for the user
    ...     •	If the address country is “United States”: 2@2@<username><address_state_code>
    ...     •	Else: 2@2@<username><country_code>
    ...     2. Step 3: Display the "Copied to clipboard."
    ...
    [Tags]      AP-USERS-CLINIC-EDIT-RESET-PW-05          manual       AP-1.15.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CP-2.31.0: STOP-REVIEWING

AP-USERS-UNASSIGNED-VIEW-01: View Unassigned list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view Unassigned list
    ...
    ...     Precondition:
    ...     - The Admin user is on Users page
    ...
    ...     Test Steps:
    ...     - 1. Click [Unassigned] tab on the navigation bar
    ...     - 2. Observe the page
    ...
    ...     Expected Results:
    ...     - 1. The following attributes and columns of user’s information shall be displayed:
    ...     - - Username: Username of the user account,
    ...     - - Full name: First name and last name of the user,
    ...     - - Address: address + city + state + zip code + country,
    ...     - - Status: the status can be Active or Deactivated.
    ...     - - Email
    ...     - - Phone
    ...     - - Role
    ...     - 2. There shall be a search bar
    ...     - 3. By default, the list is sorted by creation order, in descending order
    ...     - 4. The list is divided into several pages
    ...
    [Tags]      AP-USERS-UNASSIGNED-VIEW-01   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-UNASSIGNED-VIEW-02: Navigate between the pages of the Unassigned list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the Unassigned list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Users page and Unassigned tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click ">" button
    ...     - 2. Click "<" button
    ...     - 3. Click a specific page number
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to the next page
    ...     - 2. Step 2 - Navigate the user to the previous page
    ...     - 3. Step 3 - Navigate the user to the selected page number
    ...
    [Tags]      AP-USERS-UNASSIGNED-VIEW-02   AP-SRS-04-FRS-01    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-UNASSIGNED-SEARCH-01: Search a Unassigned that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Unassigned that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Unassigned Users page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. Search by username that existing in the system
    ...     - 3. Search by First/Last Name that existing in the system
    ...     - 4. Search by Email that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The admin can search for Username, First/Last Name and Email
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered username
    ...     - 3. Step 3 - The system shall be filtered and displayed accordingly with the entered First/Last Name
    ...     - 4. Step 4 - The system shall be filtered and displayed accordingly with the entered Email
    ...
    [Tags]      AP-USERS-UNASSIGNED-SEARCH-01   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-UNASSIGNED-SEARCH-02: Search a Unassigned that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Unassigned that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Unassigned Users page
    ...
    ...     Test Steps:
    ...     - 1. Search by username that not existing in the system
    ...     - 2. Search by First/Last Name that not existing in the system
    ...     - 3. Search by Email that not existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1,2,3 The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-USERS-UNASSIGNED-SEARCH-02   AP-SRS-04-FRS-10    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-UNASSIGNED-ASSIGN-01: Assign an unassigned user to access Call Center portal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can assign the user roles to access Call Center portal
    ...
    ...     Precondition:
    ...     - The Admin user is on the Unassigned Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On Bioflux portal section, check [Bioflux Call Center Portal] checkbox, then click [User role] dropdown
    ...     - 3. Select a option from the dropdown, then click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. There shall be user roles displayed, including: Call Center QA, Call Center QA leader, Call Center Supervisor, Call Center Technician
    ...     - and message: “After assigning the role, please update the Call Center information on the account details page.”
    ...     - 3. The user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-UNASSIGNED-ASSIGN-01   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-UNASSIGN-ASSIGN-02: Assign an unassigned user to access ERP portals
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can assign the user roles to access ERP portals
    ...
    ...     Precondition:
    ...     - The Admin user is on the Unassigned Users page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the user row, then click [Assign] button
    ...     - 2. On ERP Portals section
    ...     - 2.1 Check [Admin Portal] checkbox
    ...     - 2.2 Check [Biodirect portal, Operation Digitalization, Service and Distribution (S&D) Portal] checkbox,
    ...     - select a option from the [User role] dropdown
    ...     - 2.3 Check [Quality Management System (QMS) Portal] checkbox
    ...     -  2.4 Check [Support Portal] checkbox
    ...     - 2.5 Check [Sales Portal] checkbox, select a option from the [User role] dropdown
    ...     - 3. Click [Assign] button
    ...
    ...     Expected Results:
    ...     - 1. The [Assign portal] sidebar shall display, the user can update information in Bioflux Portal and ERP portals
    ...     - 2. The selected checkbox shall display
    ...     - - Step 2.2 [User role] dropdown shall display, including: Operation Staff (default value) and Operation Manager
    ...     - - Step 2.5 [User role] dropdown shall display, including: Sales Representative (default value), Sales Manager and Sales Admin
    ...     - 3. The user role is updated when the user log in to ERP portal
    ...
    [Tags]      AP-USERS-UNASSIGN-ASSIGN-02   AP-SRS-04-FRS-11    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-VIEW-01: View Biocare Users list information
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: The user view Biocare Users list
    ...
    ...     Precondition:
    ...     - The Admin user is on Users page
    ...
    ...     Test Steps:
    ...     - 1. Click [Biocare Users] tab on the navigation bar
    ...     - 2. Observe the page
    ...
    ...
    ...     Expected Results:
    ...     1. The following attributes and columns of user’s information shall be displayed:
    ...     - Username: Username of the General user account or "--" character for Mercy user
    ...     - Full name: First name and last name of the user,
    ...     - Address: address + city + state + zip code + country,
    ...     - Status: the status can be Active or Deactivated.
    ...     - Email
    ...     - Phone
    ...     - Role
    ...     2. There shall be a search bar, a Facility filter and Role filter
    ...     3. By default, the list is sorted by creation order, in descending order
    ...     4. The list is divided into several pages
    ...     5. There shall be a [Assign] and [Edit] button when hovering over at the end of the row
    ...
     [Tags]      AP-USERS-BIOCARE-USERS-VIEW-01   AP-SRS-04-FRS-11    manual    CP-2.31.0    R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-CREATE-01: General - Manual Entry - Create Biocare User
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that Admin can create a Biocare user in General pool using Manual Entry.
    ...    
    ...    Precondition:
    ...    - Admin is on the ERP Admin portal > Users page.
    ...    - Admin clicks "Create New User" and selects "General" as organization, then "Manual Entry".
    ...    
    ...    Test Steps:
    ...    1. Select "General" in Organization dropdown.
    ...    2. Select "Manual Entry" and proceed.
    ...    3. Input valid user information (First name, Last name, Username, Email).
    ...    4. Assign roles (check mutually exclusive validation between Technician and Physician).
    ...    5. Select one or more facilities (matching General pool).
    ...    6. Input valid contact info: address, phone numbers.
    ...    7. Click "Next" to move to contact step.
    ...    8. Complete contact fields and submit.
    ...    
    ...    Expected Results:
    ...    - A new user is successfully created and appears in the list.
    ...    - User receives Welcome email.
    ...    - All validations (role, phone number, email uniqueness) are applied correctly.

    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-01    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-CREATE-01A: General - Manual Entry - Username already exists
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    - Validate error when the admin inputs a username that already exists.
    ...    
    ...    Precondition:
    ...    - Admin clicks "Create New User" and selects "General" as organization, then "Manual Entry".
    ...    - The Admin is on the User Information step.
    ...    
    ...    Test Steps:
    ...    1. Fill in the form with a username that already exists.
    ...    2. Click the "Next" button.
    ...    
    ...    Expected Results:
    ...    - Show error message: “Username existed.”
    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-01A      manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-CREATE-02: General - Search by NPI - Create Biocare user
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that Admin can create a Biocare user in General pool using Search by NPI Number.
    ...    
    ...    Precondition:
    ...    - Admin is on the Users page.
    ...    - Admin selects "General" and "Search by NPI Number".
    ...    
    ...    Test Steps:
    ...    1. Input a valid 10-digit NPI Number.
    ...    2. Click Search and wait for user info to load from API.
    ...    3. Ensure all fields are auto-filled except Role.
    ...    4. Assign role(s), select facility (General), and input remaining contact info.
    ...    5. Submit user creation.
    ...    
    ...    Expected Results:
    ...    - A new user is created and shown in General list.
    ...    - Welcome email is sent.
    ...    - Error message appears if NPI not found or input is invalid.
    
    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-02    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-CREATE-02A: General - Search by NPI - Username already exists
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    - Validate error when the admin inputs a username that already exists.
    ...    
    ...    Precondition:
    ...    - Admin clicks "Create New User" and selects "General" as organization, then "Search by NPI".
    ...    - The Admin is on the User Information step.
    ...    
    ...    Test Steps:
    ...    1. Fill in the form with a username that already exists.
    ...    2. Click the "Next" button.
    ...    
    ...    Expected Results:
    ...    - Show error message: “Username existed.”
    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-02A      manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
    
#CP-2.31.0: Allow Admin to manage Mercy user. Ticket #2558

AP-USERS-BIOCARE-USERS-CREATE-03: Mercy - Manual Entry - Create Biocare User
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that Admin can create a Biocare user in General pool using Manual Entry.
    ...
    ...    Precondition:
    ...    - Admin is on the ERP Admin portal > Users page.
    ...    - Admin clicks "Create New User" and selects "Mercy" as organization, then "Manual Entry".
    ...
    ...    Test Steps:
    ...    1. Select "Mercy" in Organization dropdown.
    ...    2. Select "Manual Entry" and proceed.
    ...    3. Input valid user information (exclude Username as it's disabled for Mercy).
    ...    4. Assign roles excluding Billing (check mutually exclusive validation between Technician and Physician).
    ...    5. Select one or more facilities (restricted to Mercy pool).
    ...    6. Input valid contact info: address, phone numbers.
    ...    7. Click "Next" to move to contact step.
    ...    8. Complete contact fields and submit.
    ...
    ...    Expected Results:
    ...    - User is created successfully and shown in list under Mercy pool.
    ...    - Welcome email is sent.
    ...    - Username field is disabled and not required.
    ...    - Billing role is not shown.

    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-03    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-USERS-BIOCARE-USERS-CREATE-04: Mercy - Search by NPI - Create Biocare user
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that Admin can create a Biocare user in General pool using Search by NPI Number.
    ...
    ...    Precondition:
    ...    - Admin is on the Users page.
    ...    - Admin selects "Mercy" and "Search by NPI Number".
    ...
    ...    Test Steps:
    ...    1. Input a valid 10-digit NPI Number.
    ...    2. Click Search and wait for user info to load from API.
    ...    3. Ensure all fields are auto-filled, and role must be adjusted (no Billing).
    ...    4. Verify Username is not required.
    ...    5. Assign role(s), select facility (General), and input remaining contact info.
    ...    6. Submit user creation.
    ...
    ...    Expected Results:
    ...    - User is created successfully and shown in Mercy user list.
    ...    - Welcome email is sent.
    ...    - Mercy rules applied: No Username, no Billing role.

    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-04    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-CREATE-05: Email already exists
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    - Validate error message when entering an email that already exists in the system.
    ...    Precondition:
    ...    - The Admin is on the User Information step in Create New User form (General or Mercy).
    ...    - Email field is blank.
    ...    
    ...    Test Steps:
    ...    1. Enter a valid First name, Last name, Role, Username.
    ...    2. Enter an email that already exists in the Biocare system.
    ...    3. Click the "Next" button.
    ...    
    ...    Expected Results:
    ...    - A validation message should appear: “The email already exists. Please try another”.
    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-05      manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
# Note 4 cases [AP-USERS-BIOCARE-USERS-CREATE-05: Email already exists]: General (Manual and NPI) & Mercy (Manual and NPI)

AP-USERS-BIOCARE-USERS-CREATE-06: Phone number format by country
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    - Validate that the phone number is in the correct format depending on the selected country.
    ...    Precondition:
    ...    - Admin is on the User Contact step.
    ...    Test Steps:
    ...    - Select Country as "United States".
    ...    - Enter more than 10 digits in Day phone number.
    ...    - Observe format.
    ...    - Change country to "Vietnam" and enter 15 digits.
    ...    Expected Results:
    ...    - US number should format as xxx-xxx-xxxx and max 10 digits.
    ...    - Vietnam number allows up to 15 digits and accepts numeric only.
    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-06      manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-CREATE-07: Mutually exclusive roles – Technician vs Physician
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    - Ensure Technician and Physician roles cannot be selected together.
    ...    
    ...    Precondition:
    ...    - On the User Information step.
    ...    
    ...    Test Steps:
    ...    1. Select "Technician" role.
    ...    2.Then select "Physician".
    ...    
    ...    Expected Results:
    ...    - "Technician" is automatically unselected when "Physician" is selected.
    ...    - And vice versa.

    [Tags]    AP-USERS-BIOCARE-USERS-CREATE-07      manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-01: Update email and role for General user
    [Documentation]     Author: Thanh Tieu
    ...     Description:
    ...     This test verifies the ability to update editable fields of a Biocare General user, including email and roles (except Technician/Physician), and handles validation for unique email.
    ...     
    ...    Precondition:
    ...     - Admin is logged in to ERP Admin Portal.
    ...     - Admin is on USERS page.
    ...     - A General Biocare user exists and is selected for editing.
    ...     
    ...    Test Steps:
    ...     1. Click on the Edit button next to an existing user in the General pool.
    ...     2. Attempt to change the Role to Facility Admin and Billing user.
    ...     3. Ensure Technician and Physician roles are selectable (if user does not currently have them).
    ...     4. Edit the Email field with an email already in use → Observe validation.
    ...     5. Edit the Email field with a unique valid email.
    ...     6. Click Next to go to User Contact step.
    ...     7. Review and update phone number or address if needed.
    ...     8. Click Save to confirm the changes.
    ...     
    ...    Expected Results:
    ...     - Roles should be editable unless current role is Technician/Physician.
    ...     - If using existing email → display: “The email already exists. Please try another”.
    ...     - If using valid unique email → proceed to next step.
    ...     - The changes should be saved and updated on the user list.
    ...     - A success message is shown upon saving.
    [Tags]      AP-USERS-BIOCARE-USERS-EDIT-01    manual    CP-2.31.0    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-01A: Edit user role with enabled and disabled role logic
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify the user role edit logic. If user has Technician or Physician role, those checkboxes are disabled. Other roles can be edited.
    ...
    ...    Precondition:
    ...    - Admin is on ERP Admin portal, Biocare USERS page.
    ...    - A user already exists with assigned roles.
    ...
    ...    Test Steps:
    ...    1. Open Edit User for a Biocare user.
    ...    2. Check the Role section.
    ...    3. Verify if Technician/Physician is selected, it is disabled.
    ...    4. Add or remove other roles (Billing, Facility Admin).
    ...    5. Click Save and re-open user.
    ...
    ...    Expected Results:
    ...    - Technician/Physician role checkbox is disabled if assigned.
    ...    - Other roles can be modified.
    ...    - Changes are saved and persist after reload.
    ...
    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-01A    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-01B: Edit user email with validation
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify email validation during user edit. The email must be unique and is required.
    ...
    ...    Precondition:
    ...    - Admin is editing a Biocare user.
    ...
    ...    Test Steps:
    ...    1. Clear the email field and click Next.
    ...    2. Observe validation message.
    ...    3. Enter an existing email used by another user.
    ...    4. Observe duplicate email error.
    ...    5. Enter a new, valid email with different casing (e.g., Test@domain.com).
    ...    6. Save changes.
    ...
    ...    Expected Results:
    ...    - "This field is required" shown if email is empty.
    ...    - "The email already exists. Please try another" is shown if duplicated.
    ...    - Email is saved and stored in lowercase internally.
    ...
    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-01B    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-02: Reset password for active user
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Validate password reset functionality for active Biocare users.
    ...
    ...    Precondition:
    ...    - User is active.
    ...
    ...    Test Steps:
    ...    1. Open Edit User page for an active user.
    ...    2. Click "Reset Password".
    ...    - If no email is present, verify error prompt.
    ...    - If email exists, confirm system-generated password is sent.
    ...
    ...    Expected Results:
    ...    - Button is visible only for active users.
    ...    - If no email: error displayed, prompt to update email.
    ...    - If email exists: password email is sent.
    ...
    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-02    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-03: Deactivate active Biocare user
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Validate deactivation process and expected changes for a Biocare user.
    ...
    ...    Precondition:
    ...    - User is currently active.
    ...
    ...    Test Steps:
    ...    1. Click "Deactivate" on the user's profile.
    ...    2. Confirm modal is displayed with warning.
    ...    3. Click Confirm.
    ...    4. Verify Day phone and email are cleared.
    ...    5. Ensure email field is disabled.
    ...
    ...    Expected Results:
    ...    - Modal shown before deactivation.
    ...    - Email and phone cleared.
    ...    - Email field becomes disabled.
    ...
    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-03    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-04: Reactivate deactivated Biocare user
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify reactivation process of a deactivated user and email/phone validation.
    ...
    ...    Precondition:
    ...    - User is deactivated.
    ...
    ...    Test Steps:
    ...    1. Click "Reactivate" button.
    ...    2. Modal prompts for email and Day phone.
    ...    3. Leave email blank, click Reactivate → check error.
    ...    4. Enter invalid phone → check format validation.
    ...    5. Enter valid email and phone → Reactivate.
    ...
    ...    Expected Results:
    ...    - "This field is required" error shown for empty email.
    ...    - Phone number format validated.
    ...    - On valid inputs, account is reactivated.
    ...    - Welcome email with password is sent.
    ...
    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-04    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-VIEW-01: View Referring Physicians list
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: The user view Biocare Users list
    ...
    ...     Precondition:
    ...     - The Admin user is on Users page
    ...
    ...     Test Steps:
    ...     - 1. Click [Referring Physicians] tab on the navigation bar
    ...     - 2. Observe the page
    ...
    ...
    ...     Expected Results:
    ...     1. The following attributes and columns of user’s information shall be displayed:
    ...     - Full name: First name and last name of the user,
    ...     - Address: address + city + state + zip code + country,
    ...     - Status: the status can be Active or Deactivated.
    ...     - Email (optional)
    ...     - Phone
    ...     2. There shall be a search bar, a Facility filter
    ...     3. By default, the list is sorted by creation order, in descending order
    ...     4. The list is divided into several pages
    ...     5. There shall be a [Edit] button when hovering over at the end of the row
    ...
     [Tags]      AP-USERS-BIOCARE-USERS-VIEW-01   AP-SRS-04-FRS-18    manual    CP-2.31.0    R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-01: Create new Referring Physician - Manual Entry
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify the flow to create a new Referring Physician manually, ensuring differences from Biocare user creation are applied correctly.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is logged in.
    ...    - On ERP Admin portal, under USERS → Referring Physician tab.
    ...    - Clicked the “Add new user” button.
    ...
    ...    Test Steps:
    ...    1. Select the “Enter manually” option.
    ...    2. Verify that the “User name” field is NOT displayed.
    ...    3. Verify that the “Role” field is disabled and selected as “Referring Physician”.
    ...    4. Enter First name, Last name, NPI number (optional).
    ...    5. Enter optional Email address and Day phone number (can leave blank).
    ...    6. Verify that the “Status” field is not shown.
    ...    7. Complete other fields (Title, Facility, Contact Info, etc.).
    ...    8. Click Next and Submit.
    ...
    ...    Expected Results:
    ...    - The “User name” field is not visible.
    ...    - The “Role” field is disabled and pre-selected as “Referring Physician”.
    ...    - The system does not validate for unique email or phone.
    ...    - The “Status” field is not shown.
    ...    - The new Referring Physician is created with default Active status.
    ...    - User appears in the Referring Physician list after creation.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-01    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-02: Create new Referring Physician - Search by NPI Number
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify the flow to create a new Referring Physician using the Search by NPI Number method, ensuring correct field auto-fill and required field behaviors.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is logged in.
    ...    - On ERP Admin portal, under USERS → Referring Physician tab.
    ...    - Clicked the “Add new user” button.
    ...
    ...    Test Steps:
    ...    1. Select the “Search by NPI Number” option.
    ...    2. Input a 10-digit NPI number.
    ...    3. Click Search.
    ...    4. Verify that user data is fetched successfully if the NPI is valid.
    ...    5. Verify the following on the auto-filled screen:
    ...        - “User name” field is NOT displayed.
    ...        - “Role” is disabled and set to “Referring Physician”.
    ...        - “Status” field is NOT displayed.
    ...        - “Email” and “Day phone number” are optional and do not require unique validation.
    ...    6. Fill in or edit any other editable fields.
    ...    7. Click Submit.
    ...
    ...    Expected Results:
    ...    - If NPI is valid, user data is fetched and displayed.
    ...    - The “User name” field is not shown.
    ...    - The “Role” field is disabled and pre-selected as “Referring Physician”.
    ...    - The “Status” field is hidden, and the user is created as Active by default.
    ...    - The “Email” and “Day phone number” fields are optional and do not check uniqueness.
    ...    - New Referring Physician is saved and appears in the Referring Physician list.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-02    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-03: Invalid NPI Number format
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the system displays an appropriate validation message when the inputted NPI number has an invalid format.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is on the “Add Referring Physician” screen.
    ...    - Chose “Search by NPI Number”.
    ...
    ...    Test Steps:
    ...    1. Input an invalid NPI number (e.g., not 10 digits, contains letters).
    ...    2. Click “Search”.
    ...
    ...    Expected Results:
    ...    - System displays a validation error such as: “Invalid NPI Number format. Must be 10 digits.”
    ...    - The user is not allowed to proceed to the next step.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-03    manual    CP-2.31.0    R2
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-04: NPI Number not found in registry
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the system properly handles the case when a valid-format NPI number is entered but no matching physician is found.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is on the “Add Referring Physician” screen.
    ...    - Chose “Search by NPI Number”.
    ...
    ...    Test Steps:
    ...    1. Input a valid 10-digit NPI number that is not in the registry.
    ...    2. Click “Search”.
    ...
    ...    Expected Results:
    ...    - System displays a message such as: “No Referring Physician found with this NPI Number.”
    ...    - Admin remains on the same screen without progressing.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-04    manual    CP-2.31.0    R2
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-05: Missing NPI input
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the system enforces input for NPI field before allowing search.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is on the “Add Referring Physician” screen.
    ...    - Chose “Search by NPI Number”.
    ...
    ...    Test Steps:
    ...    1. Leave the NPI input field empty.
    ...    2. Click “Search”.
    ...
    ...    Expected Results:
    ...    - System displays an error: “This field is required.”
    ...    - Admin cannot proceed without entering a valid NPI.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-05    manual    CP-2.31.0    R2
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-06: Allow duplicate Email and Phone Number
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the system allows Referring Physicians to be created even when email or phone number already exists in the system.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is on the Add Referring Physician screen.
    ...    - Chose either Manual Entry or Search by NPI Number.
    ...
    ...    Test Steps:
    ...    1. Enter an email and phone number that are already associated with an existing Referring Physician or Biocare user.
    ...    2. Fill in the remaining required fields.
    ...    3. Click “Submit”.
    ...
    ...    Expected Results:
    ...    - System does not show any validation error for duplicate email or phone number.
    ...    - Referring Physician is created successfully and appears in the list.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-06    manual    CP-2.31.0    R2
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-07: Hide Status and Username fields in UI
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the “Status” and “Username” fields are hidden from the UI when adding a new Referring Physician.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is on the Add Referring Physician screen.
    ...
    ...    Test Steps:
    ...    - Observe the screen layout and available fields.
    ...
    ...    Expected Results:
    ...    - “Username” field is not visible.
    ...    - “Status” field is not shown during creation; default is "Active" internally.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-07    manual    CP-2.31.0    R2
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-08: Optional Contact Info Handling
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the email and day phone number fields are optional and can be left blank when creating a Referring Physician.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is on the Add Referring Physician screen.
    ...
    ...    Test Steps:
    ...    - Leave the email and day phone number fields blank.
    ...    - Fill in all other required fields.
    ...    - Click “Submit”.
    ...
    ...    Expected Results:
    ...    - System accepts the form and creates the Referring Physician without requiring email or phone number.
    ...    - Referring Physician appears in the list as Active.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-08    manual    CP-2.31.0    R2
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-CREATE-09: Role field locked to 'Referring Physician'
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Ensure that the “Role” field is always disabled and pre-filled as “Referring Physician”.
    ...
    ...    Precondition:
    ...    - BTCY Admin user is on the Add Referring Physician screen (Manual or NPI).
    ...
    ...    Test Steps:
    ...    - Observe the “Role” field on the form.
    ...
    ...    Expected Results:
    ...    - “Role” field is displayed as “Referring Physician”.
    ...    - Field is disabled (read-only) and cannot be changed.
    ...
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-CREATE-09    manual    CP-2.31.0    R2
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-REFERRING-PHYSICIANS-EDIT-01: Edit Referring Physician Information
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that the BTCY Admin user can edit the Referring Physician's information including user info, contact info, and update status.
    ...    
    ...    Precondition:
    ...    - The user is logged into ERP Admin Portal.
    ...    - The user is on the Edit page of a specific Referring Physician.
    ...    
    ...    Test Steps:
    ...    1. Verify that there are two sections: "User Information" and "User Contact", expanded by default.
    ...    - In User Information:
    ...        - Update Title (optional).
    ...        - Update First name (required).
    ...        - Update Last name (required).
    ...        - Update Email (optional).
    ...        - Update Status to "Deactivated" or "Active".
    ...        - Update Facility (multi-select with autosuggest).
    ...    - In User Contact:
    ...        - Update required fields: Country, Address, City, State, Zip Code.
    ...        - Enter valid Day phone number depending on country.
    ...        - Enter valid After hours phone number.
    ...        - Enter valid Fax number.
    ...    2. Click Save.
    ...    3. Click Back to return to previous page.
    ...    
    ...    Expected Results:
    ...    - All fields are editable as per requirements.
    ...    - Save button persists the changes successfully.
    ...    - Referring Physician becomes unavailable on Diagnostics portal if status is Deactivated.
    ...    - Referring Physician becomes selectable on Diagnostics portal if status is Active.
    ...    - Status change does not affect prior studies/reports using that physician.
    ...    - Contact number validations are enforced correctly based on country rules.
    [Tags]    AP-USERS-REFERRING-PHYSICIANS-EDIT-01    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-01: Display Reset MFA button for Mercy user
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that the “Reset MFA” button is visible next to Day phone number for Mercy user who has set up MFA.
    ...    Precondition:
    ...    - Admin is viewing a Mercy user profile.
    ...    - User is Active and has a Day phone number (MFA set up).
    ...
    ...    Test Steps:
    ...    1. Navigate to the user profile of a Mercy user.
    ...    2. Locate the Day phone number field.
    ...    3. Verify presence of the “Reset MFA” button.
    ...
    ...    Expected Results:
    ...    1. “Reset MFA” button is displayed next to Day phone number.

    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-01    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-02: Hide Reset MFA button when Day phone is empty
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that the “Reset MFA” button is hidden if Mercy user has not set up MFA (no Day phone number).
    ...    Precondition:
    ...    - Admin is viewing a Mercy user profile.
    ...    - User has no Day phone number.
    ...
    ...    Test Steps:
    ...    1. Navigate to the user profile of a Mercy user without Day phone number.
    ...    2. Locate Day phone number field area.
    ...    3. Verify absence of the “Reset MFA” button.
    ...
    ...    Expected Results:
    ...    1. “Reset MFA” button is not shown if no Day phone number is set.

    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-02    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-03: Perform Reset MFA successfully
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify the Reset MFA modal and successful reset flow.
    ...    Precondition:
    ...    - Admin is viewing a Mercy user profile.
    ...    - User has valid Day phone number (MFA set).
    ...
    ...    Test Steps:
    ...    1. Click on the “Reset MFA” button.
    ...    2. Verify a modal appears with “Reset MFA” and “Cancel” buttons.
    ...    3. Click “Reset MFA” in the modal.
    ...    4. Observe confirmation message and Day phone number field.
    ...
    ...    Expected Results:
    ...    1. Confirmation modal is displayed.
    ...    2. After clicking “Reset MFA”:
    ...       - Success message is shown: “MFA has been successfully reset!”
    ...       - Day phone number field is cleared.

    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-03    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-04: MFA setup required on next login
    [Documentation]    Author: Thanh Tieu
    ...    Description: Ensure user must set up MFA again on next login after successful reset.
    ...    Precondition:
    ...    - Admin has successfully reset MFA for a Mercy user.
    ...
    ...    Test Steps:
    ...    1. Logout from current session (optional).
    ...    2. Log in again with username and password.
    ...    3. Observe behavior after login.
    ...
    ...    Expected Results:
    ...    1. User is prompted to set up MFA again.
    ...    2. The previous session (before reset) remains active and unaffected.

    [Tags]    AP-USERS-BIOCARE-USERS-EDIT-RESET-MFA-04    manual    CP-2.31.0    R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}




















*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_admin_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${VERSION}      Navigate To Admin Sign In Page
    Set Suite Metadata  version   ${VERSION}
    Set Suite Metadata  browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
