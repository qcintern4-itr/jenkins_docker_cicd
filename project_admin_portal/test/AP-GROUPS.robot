*** Settings ***
Documentation   Test Suite - Admin Portal - Groups page
Metadata    sid     AP-GROUPS
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_admin_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      AP-GROUPS       web
Test Timeout    1h

*** Test Cases ***
AP-GROUPS-CC-VIEW-01: View list of Call Center group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view list of Call Center group
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Groups] page on the navigation bar
    ...     - 2. Click [Call Center] tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following information:
    ...     - - Group Name
    ... 	- - Create Date
    ...     - - Group Type
    ...     - - Assigned Facility Group
    ...     - 2. There shall be a [Edit], [Delete] button when hover over at the end of the row
    ...     - 3. There shall be a search bar
    ...     - 4. There shall be an orange tag labeled: “Test group” displayed next to the call center group’s name for
    ...     - call center groups that were created for testing purposes
    ...     - 5. There shall be a sort button on Create Date column (By default, the list is sorted by Create Date in descending order)
    ...     - 6. The list is divided into several pages
    ...
    [Tags]      AP-GROUPS-CC-VIEW-01              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-VIEW-02: Navigate between the pages of the CC group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the CC group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Groups page
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
    [Tags]      AP-GROUPS-CC-VIEW-02              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-VIEW-03: Sort the CC group list by Create Date
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the CC group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Groups page
    ...
    ...     Test Steps:
    ...     - 1. Click [Sort] button next to Create Date column
    ...     - 2. Click [Sort] button
    ...     - 3. Click a specific page number
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The list shall be sorted by Create Date in descending order
    ...     - 2. Step 2 - The list shall be sorted by Create Date in ascending order
    ...
    [Tags]      AP-GROUPS-CC-VIEW-03              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-VIEW-04: Search a Call Center group that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Call Center group that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Groups page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a Call Center group name that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by group name and the search placeholder shall say “Search by group name”
    ...     - 2.  Step 2 - The system shall be filtered and displayed accordingly with the entered Facility group name
    ...
    [Tags]      AP-GROUPS-CC-VIEW-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-VIEW-05: Search a Call Center group that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Call Center group that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Groups page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a Call Center group name that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by Call Center group name and the search placeholder shall say “Search by group name”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-GROUPS-CC-VIEW-05              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-VIEW-01: View list of Facility group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view list of Facility group
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Groups] page on the navigation bar
    ...     - 2. Click [Facility] tab
    ...
    ...     Expected Results:
    ...     - 1. The list shall display the following information:
    ...     - - Group Name
    ... 	- - Create Date
    ...     - - Assigned Group
    ...     - 2. There shall be a [Edit], [Delete] button when hover over at the end of the row
    ...     - 3. There shall be a search bar
    ...     - 4. There shall be an orange tag labeled: “ Test group” displayed next to the facility group’s name
    ...     - for facility groups that were created for testing purposes
    ...     - 5. There shall be a sort button on Create Date column (By default, the list is sorted by Create Date in descending order)
    ...     - 6. The list is divided into several pages
    ...
    [Tags]      AP-GROUPS-F-VIEW-01      manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-VIEW-02: Navigate between the pages of the Facility group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the Facility group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facility page
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
    [Tags]      AP-GROUPS-F-VIEW-02      manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-VIEW-03: Sort the Facility group list by Create Date
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the Facility group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facility page
    ...
    ...     Test Steps:
    ...     - 1. Click [Sort] button next to Create Date column
    ...     - 2. Click [Sort] button
    ...     - 3. Click a specific page number
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The list shall be sorted by Create Date in descending order
    ...     - 2. Step 2 - The list shall be sorted by Create Date in ascending order
    ...
    [Tags]      AP-GROUPS-F-VIEW-03      manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-VIEW-04: Search a Facility group that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Facility group that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facility page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a Facility group name that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by Facility group name and the search placeholder shall say “Search by group name”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered Facility group name
    ...
    [Tags]      AP-GROUPS-F-VIEW-04      manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-VIEW-05: Search a Facility group that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for Facility group that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facility page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a Facility group name that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by Facility group name and the search placeholder shall say “Search by group name”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-GROUPS-F-VIEW-05      manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-01: View all steps in Create New Call Center Group screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Create New Call Center Group screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center group page
    ...
    ...     Test Steps:
    ...     - 1. Click [Create New Group] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Create New Call Center group with the following steps:
    ...     - - Step 1-Group Information
    ...     - - Step 2-User Group Members
    ...
    [Tags]      AP-GROUPS-CC-CREATE-01                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP1-01: View all fields in step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group-step 1
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 1-Group Information
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Group Name (required)
    ...     - - Group Type (required)
    ...     - - Test Group
    ...     - - Assign To Facility Group
    ...     - - Contact Email
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-01                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP1-02: Enter Group Name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid group name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Group name field, leave empty value, then click [Next] button
    ...     - 2. In Group name field, enter a group name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid value" displayed under Group name field
    ...     - 2. Group name is displayed and there is no error message displayed under Group name field
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-02                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP1-03: Enter Group Type
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid group type
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Group type field, leave empty value, then click [Next] button
    ...     - 2. In Group type field, select Group type dropdown
    ...     - 3. Select a group type
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid value" displayed under Group type field
    ...     - 2. There shall be 2 options: Call Center QA, Call Center Technician
    ...     - 3. Group type is displayed
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-03                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP1-04: Check/uncheck Test group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can check/uncheck Test group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Test Group field, check or uncheck Test Group checkbox
    ...
    ...     Expected Results:
    ...     - 1. The checkbox status shall display properly. When checked, the group will be created for testing purposes
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-04                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP1-05: Select or leave empty Assign to facility group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter select or leave empty Assign to facility group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Observe Assign To Facility Group
    ...     - 2. In case of Test Group, click [Assign To Facility Group] dropdown
    ...     - -  2.1 Search or select one or multiple groups
    ...     - -  2.2 Uncheck the test group checkbox
    ...     - 3. Select a call center group type that has already been existed in the facility group
    ...     - 4. In case of Active Group, click [Assign To Facility Group] dropdown
    ...     - - 4.1 Search or select one or multiple groups
    ...     - - 4.2 Check the test group checkbox
    ...
    ...     Expected Results:
    ...     - 1. The field shall be disabled until the user has selected the group type
    ...     - 2. Available Facility group test shall be displayed
    ...     - 2.1 The selected group shall be displayed
    ...     - 2.2 An alert message stating: “The Call Center Group is no longer a test group.
    ...     Please select a correct Facility Group.” shall be displayed under the Assign to Group Facility field
    ...     - 3. An alert message stating: “This field has been updated.” shall be displayed under the Assign to Group
    ...     Facility field and all the incorrect facility groups shall be removed
    ...     - . Available Facility group test shall be displayed
    ...     - 4.1 The selected group shall be displayed
    ...     - 4.2 An alert message stating: “The Call Center Group is now a test group. Please select a correct
    ...     Facility group.” shall be displayed under the Assign to Group Facility field
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-05                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP1-06: Enter or leave empty Contact Email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Contact Email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Contact Email field, leave empty value, then click [Next] button
    ...     - 2. In Contact Email field, enter a valid email, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter email" displayed under Email field
    ...     - 2. The user is navigated to step 2-User Group Members
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-06                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
AP-GROUPS-CC-CREATE-STEP1-07: Cancel the creating new Call Center group when is on step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cancel the creating new Call Center group when is on step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Call Center Group page and all text input shall be dismissed
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-07                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP1-08: Move to step 2 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can move to step 2 if all valid information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 2-User Group Members
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP1-08                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-01: Can create Call Center Technician group with have no members
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Call Center Technician group with have no members
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Technician Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Leave empty Group members, click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1. The new Call Center Technician group is created with have no members
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-01                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-02: Can create Call Center QA group with have no members
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Call Center QA group with have no members
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center QA Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Leave empty Group members, click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1. The new Call Center group is created with have no members
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-02                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-03: Create Call Center Technician group in case of Test Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Call Center Technician group in case of Test Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...     - Select Group Type is Call Center Technician in step 1
    ...
    ...     Test Steps:
    ...     - 1. In case of Test Group , click [Add Members] button
    ...     - 1.1 Click [Search] bar
    ...     - 1.2 Search by username and select one or multiple members
    ...     - 1.3 Search by First/Last name and select one or multiple members
    ...     - 1.4 Search by email
    ...     - 1.5 Click [Add] button
    ...     - 2. Click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1. A modal "Add Member to Group" display with a search bar have place holder "Search by email and select name", [Cancel], [x] and [Add] button
    ...     - 1.1 A list of suggested members (Call Center Technician is Test account) shall be displayed in alphabetical order
    ...     - with the following message: “Displaying 5 users. Update search criteria for better results.”
    ...     - 1.2, 1.3, 1.4 The search result shall display the member’s name and username. The selected members shall display in each tag
    ...     - 1.5 The selected members shall be added to the group
    ...     - 2. A new Call Center Technician group is created successfully
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-03                        manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-04: Create Call Center Technician group in case of Not Test Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can Create Call Center Technician group in case of Not Test Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...     - Select Group Type is Call Center Technician in step 1
    ...
    ...     Test Steps:
    ...     - 1. In case of Not Test Group , click [Add Members] button
    ...     - 1.1 Click [Search] bar
    ...     - 1.2 Search by username and select one or multiple members
    ...     - 1.3 Search by First/Last name and select one or multiple members
    ...     - 1.4 Search by email
    ...     - 1.5 Click [Add] button
    ...     - ti2. Click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1. A modal "Add Member to Group" display with a search bar have place holder "Search by email and select name", [Cancel], [x] and [Add] button
    ...     - 1.1 A list of suggested members (Call Center Technician is Not Test account) shall be displayed in alphabetical order
    ...     - with the following message: “Displaying 5 users. Update search criteria for better results.”
    ...     - 1.2, 1.3, 1.4 The search result shall display the member’s name and username. The selected members shall display in each tag
    ...     - 1.5 The selected members shall be added to the group
    ...     - 2. A new Call Center Technician group is created successfully
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-04                manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-05: Create Call Center QA group in case of Test Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Call Center QA group in case of Test Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...     - Select Group Type is Call Center QA in step 1
    ...
    ...     Test Steps:
    ...     - 1. In case of Test Group , click [Add Members] button
    ...     - 1.1 Click [Search] bar
    ...     - 1.2 Search by username and select one or multiple members
    ...     - 1.3 Search by First/Last name and select one or multiple members
    ...     - 1.4 Search by email
    ...     - 1.5 Click [Add] button
    ...     - 2. Click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1.  A modal "Add Member to Group" display with a search bar have place holder "Search by email and select name", [Cancel], [x] and [Add] button
    ...     - 1.1 A list of suggested members (Call Center QA is Test account) shall be displayed in alphabetical order
    ...     - with the following message: “Displaying 5 users. Update search criteria for better results.”
    ...     - 1.2, 1.3, 1.4 The search result shall display the member’s name and username. The selected members shall display in each tag
    ...     - 1.5 The selected members shall be added to the group
    ...     - 2. A new Call Center Technician group is created successfully
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-05               manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-06: Create Call Center QA group in case of Not Test Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Call Center QA group in case of Not Test Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...     - Select Group Type is Call Center QA in step 1
    ...
    ...     Test Steps:
    ...     - 1. In case of Not Test Group , click [Add Members] button
    ...     - 1.1 Click [Search] bar
    ...     - 1.2 Search by username and select one or multiple members
    ...     - 1.3 Search by First/Last name and select one or multiple members
    ...     - 1.4 Search by email
    ...     - 1.5 Click [Add] button
    ...     - 2. Click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1.  A modal "Add Member to Group" display with a search bar have place holder "Search by email and select name", [Cancel], [x] and [Add] button
    ...     - 1.1 A list of suggested members (Call Center QA is Not Test account) shall be displayed in alphabetical order
    ...     - with the following message: “Displaying 5 users. Update search criteria for better results.”
    ...     -  1.2, 1.3, 1.4 The search result shall display the member’s name and username. The selected members shall display in each tag
    ...     - 1.5 The selected members shall be added to the group
    ...     - 2. A new Call Center Technician group is created successfully
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-06              manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-07: View User Group Members list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view User Group Members list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...     - Added some members to the group
    ...
    ...     Test Steps:
    ...     - 1. Observe the User Group Members list
    ...     - 2. Select one or multiple checkboxes
    ...     - 3. Click [Remove] button
    ...     - 4. On confirmation dialog, click [Remove Member] button
    ...     - 5. On confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. The following information shall be displayed:
    ...     - - Username
    ...     - - Full Name
    ...     - - Email
    ...     - - There shall be a checkbox in each member’s row. In order to delete one or multiple members at a time
    ...     - 2. There shall be a [Remove] button displayed
    ...     - 3. A confirmation dialog shall display a message "Are you sure you want to remove these members?" with
    ...     - - [Cancel] and [Remove Member] button
    ...     - 4. The member shall be removed from the group
    ...     - 5. Exit modal without the changes
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-07                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-08: Cancel the adding member to Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel the adding member to Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. On Add Member to Group modal, click [Cancel] or [x] button
    ...
    ...     Expected Results:
    ...     - Exit the modal and abort the adding member process
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-08                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-09: Back to step 1 when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 1-Group Information
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-09                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-10: Cancel the creating new Call Center group when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cancel the creating new Call Center group when is on step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Call Center Group page and all text input shall be dismissed
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-10                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-CREATE-STEP2-11: Change group type and test group status after adding member to the group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can change group type and test group status after adding member to the group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Call Center Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Add some members to the group
    ...     - 2. Back to step 1
    ...     - 2.1 Change Group Type, click [Next] button
    ...     - 2.2 Change Test Group status, click [Next] button
    ...     - 3. On confirmation dialog, click [Yes] button
    ...     - 4. On confirmation dialog, click [No] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2, a confirmation dialog with the following message shall be displayed:” Changing the group type and/or test
    ...     - group status will remove the selected facility group(s) and all the members that have been added to the
    ...     - group. Do you want to continue? “ with Yes, No button
    ...     - 2. Step 3, the user is navigated to step 2 and all added members shall be removed from the group
    ...     - 3. Step 4, exit modal and the user still be in step 1
    ...
    [Tags]      AP-GROUPS-CC-CREATE-STEP2-11                        manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-01: View all steps in Create New Facility Group screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Create New Facility Group screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facility group page
    ...
    ...    Test Steps:
    ...    - 1. Click [Create New Group] button
    ...
    ...

    Expected Results:
    ...     The user is navigated to the Create New Facility group with the following steps:
    ...     - Step 1-Group Information
    ...     - Step 2-User Group Members
    ...
    [Tags]      AP-GROUPS-F-CREATE-01   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP1-01: View all fields in step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group-step 1
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 1-Group Information
    ...
    ...     Expected Results:
    ...     The following fields displayed:
    ...     - Group Name (required)
    ...     - Test Group
    ...     - Assign Call Center Group
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP1-01   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP1-02: Enter Group Name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid group name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Group name field, leave empty value, then click [Next] button
    ...     - 2. In Group name field, enter a group name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid value" displayed under Group name field
    ...     - 2. Group name is displayed and there is no error message displayed under Group name field
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP1-02   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP1-03: Check/uncheck Test group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can check/uncheck Test group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Test Group field, check or uncheck Test Group checkbox
    ...
    ...     Expected Results:
    ...     - 1. The checkbox status shall display properly. When checked, the group will be created for testing purposes
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP1-03   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP1-04: Select or leave empty Assign Call Center group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter select or leave empty Assign Call Center group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In case of Test Group, click [Assign Call Center Group] dropdown
    ...     - 1.1 Search or select a Call Center Technician/QA group
    ...     - 1.2 Uncheck the test group checkbox
    ...     - 2. In case of Active Group, click [Assign Call Center Group] dropdown
    ...     - 2.1 Search or select a Call Center Technician/QA group
    ...     - 2.2 Check the test group checkbox
    ...
    ...     Expected Results:
    ...     - 1. A list of call center groups (Technician and QA) shall be displayed from the drop-down selection
    ...     - 1.1 The selected group shall be displayed
    ...     - 1.2 An alert message stating: “The Facility Group is no longer a test group. Please select the correct
    ...     Call Center Group." shall be displayed under the Assign Call Center Group field
    ...     - 2. A list of call center groups (Technician and QA) shall be displayed from the drop-down selection
    ...     - 2.1 The selected group shall be displayed
    ...     - 2.2 An alert message stating: “The Facility Group is now a test group. Please select a correct Call
    ...     - Center group.” shall be displayed under the Assign Call Center Group field
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP1-04   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP1-05: Cancel the creating new Facility group when is on step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cancel the creating new Facility group when is on step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Facility Group page and all text input shall be dismissed
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP1-05   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP1-06: Move to step 2 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can move to step 2 if all valid information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 2-User Group Members
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP1-06   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-01: Can create Facility group with have no members
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Facility group with have no members
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Leave empty Group members, click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1. The new Facility group is created with have no members
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-01   AP-SRS-07-FRS-04              manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-02: Create Facility group in case of Test Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Facility group in case of Test Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. In case of Test Group , click [Add Members] button
    ...     - 1.1 Click [Search] bar
    ...     - 1.2 Search by facility name and select one or multiple members
    ...     - 1.3 Click [Add] button
    ...     - 2. Click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1. A modal "Add Facility to Group" display with a search bar, [Cancel], [x] and [Add] button
    ...     - 1.1 A list of suggested members (Test facilities) shall be displayed in alphabetical order
    ...     - with the following message: “Displaying 5 users. Update search criteria for better results.”
    ...     - 1.2 The search result shall display the facility’s name and address. The selected members shall display in each tag
    ...     - 1.3 The selected members shall be added to the group
    ...     - 2. A new Facility group is created successfully
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-02   AP-SRS-07-FRS-04              manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-03: Create Facility group in case of Not Test Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create Facility group in case of Not Test Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. In case of Not Test Group , click [Add Members] button
    ...     - 1.1 Click [Search] bar
    ...     - 1.2 Search by facility name and select one or multiple members
    ...     - 1.3 Click [Add] button
    ...     - 2. Click [Create Group] button
    ...
    ...     Expected Results:
    ...     - 1. A modal "Add Facility to Group" display with a search bar, [Cancel], [x] and [Add] button
    ...     - 1.1 A list of suggested members (Active facilities) shall be displayed in alphabetical order
    ...     - with the following message: “Displaying 5 users. Update search criteria for better results.”
    ...     - 1.2 The search result shall display the facility’s name and address. The selected members shall display in each tag
    ...     - 1.3 The selected members shall be added to the group
    ...     - 2. A new Facility group is created successfully
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-03   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-04: View Facility Group Members list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Facility Group Members list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 2
    ...     - Added some members to the group
    ...
    ...     Test Steps:
    ...     - 1. Observe the Facility Group Members list
    ...     - 2. Select one or multiple checkboxes
    ...     - 3. Click [Remove] button
    ...     - 4. On confirmation dialog, click [Remove Member] button
    ...     - 5. On confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. The following information shall be displayed:
    ...     - - Facility Name
    ...     - - Facility ID
    ...     - - Facility Address
    ...     - There shall be a checkbox in each member’s row. In order to delete one or multiple members at a time
    ...     - 2. There shall be a [Remove] button displayed
    ...     - 3. A confirmation dialog shall display a message "Are you sure you want to remove these members?" with
    ...     - [Cancel] and [Remove Member] button
    ...     - 4. The member shall be removed from the group
    ...     - 5. Exit modal without the changes
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-04   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-05: Cancel the adding member to Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel the adding member to Group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create Facility Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. On Add Member to Group modal, click [Cancel] or [x] button
    ...
    ...     Expected Results:
    ...     - Exit the modal and abort the adding member process
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-05   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-06: Back to step 1 when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 1-Group Information
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-06   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-07: Cancel the creating new Facility group when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Cancel the creating new Facility group when is on step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Call Facility page and all text input shall be dismissed
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-07   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-CREATE-STEP2-08: Change test group status after adding member to the group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can change test group status after adding member to the group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility Group screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Add some members to the group
    ...     - 2. Back to step 1, change Test Group status, then click [Next] button
    ...     - 3. On confirmation dialog, click [Yes] button
    ...     - 4. On confirmation dialog, click [No] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2, a confirmation dialog with the following message shall be displayed:” Changing the test group
    ...     - status will remove the selected call center group(s) and all the members that have been added to the group.
    ...     - Do you want to continue? “  with Yes, No button
    ...     - 2. Step 3, the user is navigated to step 2 and all added members shall be removed from the group
    ...     - 3. Step 4, exit modal and the user still be in step 1
    ...
    [Tags]      AP-GROUPS-F-CREATE-STEP2-08   AP-SRS-07-FRS-04              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-EDIT-01: View Edit Call Center Group page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in Edit Call Center Group page
    ...
    ...     Precondition:
    ...     - The Admin user is on the Call Center Group page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the row and click [Edit] button
    ...
    ...     Expected Results:
    ...     - 1. The user is navigated to Edit Call Center group page with the following fields:
    ...     - - The group name and the orange tag labeled “Test group” shall be displayed on the header of the screen
    ...     - - Group information: There shall be an accordion for the user to expand or collapse the section, including
    ...     - - Group Name
    ...     - - Assign To Facility Group
    ...     - - Contact Email
    ...     - User Group Members: There shall be an accordion for the user to expand or collapse the section, the user can add/remove members
    ...
    [Tags]      AP-GROUPS-CC-EDIT-01   AP-SRS-07-FRS-05              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-EDIT-02: Edit Group Information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit Group Information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Call Center Group page
    ...
    ...     Test Steps:
    ...     - 1. Edit Group Name, then click [Save] button
    ...     - 2. Edit Assign to facility group, then click [Save] button
    ...     - 3. Edit Contact Email, then click [Save] button
    ...
    ...     Expected Results:
    ...     - The new changes shall be saved
    ...
    [Tags]      AP-GROUPS-CC-EDIT-02   AP-SRS-07-FRS-05              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-EDIT-03: Edit User Group Member
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit User Group Member
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Call Center Group page
    ...
    ...     Test Steps:
    ...     - 1. Add member
    ...     - 2. Delete member
    ...
    ...     Expected Results:
    ...     - 1. The new changes shall be auto-saved
    ...
    [Tags]      AP-GROUPS-CC-EDIT-03   AP-SRS-07-FRS-05              manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-EDIT-01: View Edit Facility Group page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in Edit Facility Group page
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facility Group page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the row and click [Edit] button
    ...
    ...     Expected Results:
    ...     - 1. The user is navigated to Edit Facility group page with the following fields:
    ...     - - The group name and the orange tag labeled “Test group” shall be displayed on the header of the screen
    ...     - - Group information: There shall be an accordion for the user to expand or collapse the section, including
    ...     - + Group Name
    ...     - +Assign To Call Center Group
    ...     - - Facility Group Members: There shall be an accordion for the user to expand or collapse the section, the user can add/remove members
    ...
    [Tags]      AP-GROUPS-F-EDIT-01   AP-SRS-07-FRS-06              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-EDIT-02: Edit Group Information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit Group Information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Facility Group page
    ...
    ...     Test Steps:
    ...     - 1. Edit Group Name, then click [Save] button
    ...     - 2. Edit Assign to facility group, then click [Save] button
    ...
    ...     Expected Results:
    ...     - The new changes shall be saved
    ...
    [Tags]      AP-GROUPS-F-EDIT-02   AP-SRS-07-FRS-06              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-EDIT-03: Edit Facility Group Member
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit User Group Member
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit Facility Group page
    ...
    ...     Test Steps:
    ...     - 1. Add member
    ...     - 2. Delete member
    ...
    ...     Expected Results:
    ...     - The new changes shall be auto-saved
    ...
    [Tags]      AP-GROUPS-F-EDIT-03   AP-SRS-07-FRS-06              manual      R1
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-DELETE-01: Delete Call Center Group in Group page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can delete Call Center Group in Group page
    ...
    ...     Precondition:
    ...     - The user is on the Call Center tab of the Group page
    ...
    ...     Test Steps:
    ...     - 1. Hover over at the end of the row, then click [Delete] button
    ...     - 2. In Confirmation dialog, click [Delete Group] button
    ...     - 3. In Confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. A confirmation dialog with the following message shall be displayed: “Are you sure you want to delete this group?”
    ...     - with [Delete Group] and [Cancel] button
    ...     - 2. The group shall be removed from the Call Center group list
    ...     - 3. The dialog shall be closed
    ...
    [Tags]      AP-GROUPS-CC-DELETE-01   AP-SRS-07-FRS-07              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-CC-DELETE-02: Delete Call Center Group in Edit Group page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can delete Call Center Group in Edit Group page
    ...
    ...     Precondition:
    ...     - The user is on the Group Editing page
    ...
    ...     Test Steps:
    ...     - 1. Click [Delete group] button, next to the [Save] button
    ...     - 2. In Confirmation dialog, click [Delete Group] button
    ...     - 3. In Confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. A confirmation dialog with the following message shall be displayed: “Are you sure you want to delete this group?”
    ...     - with [Delete Group] and [Cancel] button
    ...     - 2. The group shall be removed from the Call Center group list
    ...     - 3. The dialog shall be closed
    ...
    [Tags]      AP-GROUPS-CC-DELETE-02   AP-SRS-07-FRS-07              manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-DELETE-01: Delete Facility Group that has no assigned call center group from Group list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can delete Facility Group that has no assigned call center group
    ...
    ...     Precondition:
    ...     - The user is on the Facility tab of the Group page
    ...     - The facility group has no assigned call center group
    ...
    ...     Test Steps:
    ...     - 1. On Facility tab, hover over at the end of the row, then click [Delete] button
    ...     - 2. In Confirmation dialog, click [Delete Group] button
    ...     - 3. In Confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. A confirmation dialog with the following message shall be displayed: “Are you sure you want to delete this group?”
    ...     - with [Delete Group] and [Cancel] button
    ...     - 2. The group shall be removed from the Facility group list
    ...     - 3. The dialog shall be closed
    ...
    [Tags]      AP-GROUPS-F-DELETE-01                    manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-DELETE-02: Delete Facility Group that has no assigned call center group from Edit Facility group page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can delete Facility Group that has no assigned call center group
    ...
    ...     Precondition:
    ...     - The user is on the Edit Facility Group page
    ...     - The facility group has no assigned call center group
    ...
    ...     Test Steps:
    ...     - 1. On Edit Facility page, click [Delete] button
    ...     - 2. In Confirmation dialog, click [Delete Group] button
    ...     - 3. In Confirmation dialog, click [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. A confirmation dialog with the following message shall be displayed: “Are you sure you want to delete this group?”
    ...     - with [Delete Group] and [Cancel] button
    ...     - 2. The group shall be removed from the Call Center group list
    ...     - 3. The dialog shall be closed
    ...
    [Tags]      AP-GROUPS-F-DELETE-02                    manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-DELETE-03: Delete Facility Group that has at least one assigned call center group from Group list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can delete Facility Group that has at least one assigned call center group
    ...
    ...     Precondition:
    ...     - The user is on the Facility tab of the Group page
    ...     - The facility group has at least one assigned call center group
    ...
    ...     Test Steps:
    ...     - 1. On Facility tab, hover over at the end of the row, then click [Delete] button
    ...     - 2. Click [Back] button
    ...
    ...     Expected Results:
    ...     - 1. A modal with the following message shall be displayed: “To delete this facility group, please unassign the call center group(s) first.”
    ...     with [Back] button
    ...     - 2. The modal shall be closed
    ...
    [Tags]      AP-GROUPS-F-DELETE-03                    manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-GROUPS-F-DELETE-04: Delete Facility Group that has at least one assigned call center group from Edit Facility group page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can delete Facility Group that has at least one assigned call center group
    ...
    ...     Precondition:
    ...     - The user is on the Edit Facility Group page
    ...     - The facility group has at least one assigned call center group
    ...
    ...     Test Steps:
    ...     - 1. On Edit Facility page, click [Delete] button
    ...     - 2. Click [Back] button
    ...
    ...     Expected Results:
    ...     - 1. A confirmation dialog with the following message shall be displayed: “To delete this facility group,
    ...     please unassign the call center group(s) first and click Save"
    ...     - 2. The modal shall be closed
    ...
    [Tags]      AP-GROUPS-F-DELETE-04                    manual      R2
     Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_admin_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${VERSION}      Navigate To Admin Sign In Page
    Set Suite Metadata  version   ${VERSION}
    Set Suite Metadata  browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

