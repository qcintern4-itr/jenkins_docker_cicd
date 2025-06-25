*** Settings ***
Documentation   Test Suite - Admin Portal - Facilities page
Metadata    sid     AP-FACILITIES
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_admin_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      AP-FACILITIES       web
Test Timeout    1h

*** Test Cases ***
AP-FACILITIES-VIEW-01: View a list of facilities
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view a list of facilities
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to the portal
    ...
    ...     Test Steps:
    ...     1. Click [Facilities] tab on the navigation bar
    ...
    ...
    ...     Expected Results:
    ...     1. The Facility list/table shall display the following information and columns:
    ...     - Facility Name: name of the facility
    ...     - Facility ID: The ID of a facility
    ...     - Facility Address: address + city + state + zip code.
    ...     - Country: country of the facility.
    ...     - Facility Phone: phone number of the facility.
    ...     - Facility Status: the status can be Test, Eval, Active, or Closed.
    ...     - Service type: the type can be Standard or Code Red.
    ...     - Facility Fax: fax number of the facility.
    ...     - There shall be a [Edit] button when hover over the row of the facility
    ...     - There is a [Go to Clinic portal] button on each facility to be redirected to the Clinic portal.
    ...         + If the Facility has “Closed” status, the button shall be disabled.
    ...     2. The list is divided into several pages
    ...     3. There shall be a search bar for the user to look up specific facilities
    ...
    ...    **Others
    ...    
    ...
    [Tags]      AP-FACILITIES-VIEW-01       AP-1.10.0    manual         R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-VIEW-02: Navigate between the pages of the facilities list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate between the pages of the facilities list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facilities page
    ...
    ...     Test Steps:
    ...     1. Click ">" button
    ...     2. Click "<" button
    ...     3. Click a specific page number
    ...
    ...     Expected Results:
    ...     1. Step 1 - Navigate the user to the next page
    ...     2. Step 2 - Navigate the user to the previous page
    ...     3. Step 3 - Navigate the user to the selected page number
    ...
    [Tags]      AP-FACILITIES-VIEW-02       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-01: View all fields in step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all fields in step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility page-Step 1
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 1-Facility Information
    ...
    ...     Expected Results:
    ...     - 1. Facility Information section shall display with the following fields:
    ...     - - Organization (required): Single selection between the following options: 
    ...     - - - General (Selected by default) 
    ...     - - - Mercy
    ...     - - Facility Name (required)
    ...     - - Short name (optional)
    ...     - - Country (required)
    ...     - - Address (required)
    ...     - - City (required)
    ...     - - State (required)
    ...     - - Zip Code (required)
    ...     - - Phone Number
    ...     - - Fax Number
    ...     - - Sales rep
    ...     - - Clinic Support Contacts (required)
    ...     - - Facility Note
    ...     - 2. There shall be a [Cancel] and [Next] button
    ...    
    ...    ** Others
    ...    Update date: 6/19/2025 - Thanh Tieu
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-01       manual     R2      AP-1.10.0     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-02: Enter facility name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid facility name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Facility name field, leave empty value, then click [Next] button
    ...     - 2. In Facility name field, enter a facility, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter facility name" displayed under Facility name field
    ...     - 2. Facility name is displayed and there is no error message displayed under Facility name field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-02       manual    R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-03: Enter short name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty short name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Short name field, enter a text or leave empty, then click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under Short name field
    [Tags]      AP-FACILITIES-CREATE-STEP1-03      manual    R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-04: Enter Country, Address, City, State, Zipcode
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid address
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
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
    [Tags]      AP-FACILITIES-CREATE-STEP1-04       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-05: Enter phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under Phone number field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-05       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-06: Enter fax number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
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
    [Tags]      AP-FACILITIES-CREATE-STEP1-06       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-07: Enter Sales rep in the Sales rep field
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid sales rep
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Sales rep field, search and select a sales rep from the suggestion list
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The selected sales rep shall be displayed in the Sales rep field
    ...     - 2. There is no error message display under Country/Address/City/State/Zipcode field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-07      AP-1.10.0    manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-FACILITIES-CREATE-STEP1-08: Add Clinic Support Contact
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can add clinic support contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Add Clinic Support Contact] button
    ...     - 2. Leave empty or enter a text into Name field
    ...     - 3. Enter a valid phone number (10 digits)
    ...     - 4. Enter a valid email format
    ...     - 5. Enter a description (100 characters limit)
    ...     - 6. Click [Add Contact] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Display a modal with the following fields:
    ...     - - Name
    ...     - - Phone number (required)
    ...     - - Email (required)
    ...     - - Description
    ...     - 2. The Clinic Support contact shall be displayed in the form of a card
    ...     - - If the user enters more than the characters limit, an error text below shall be displayed:
    ...     - - “You have entered the maximum 100 characters limit.”
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-08      manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-09: Cancel adding Clinic Support Contact
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel adding clinic support contact
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Click [Add Clinic Support Contact] button
    ...     - 2. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - The modal shall close and all text input shall be dismissed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-09       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-10: Edit a Clinic Support Contact card
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit clinic support contact card
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Add a Clinic Support Contact card
    ...     - 2. Hover over the card, click [Edit] button
    ...     - 3. Edit any information, then click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - Display [Edit Clinic Support Contact] modal
    ...     - 2. Step 3 - All changes shall be saved
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-10       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-11: Delete a Clinic Support Contact card
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit clinic support contact card
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Add a Clinic Support Contact card
    ...     - 2. Hover over the card, click [Edit] button
    ...     - 3. Click [Delete] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - Display [Edit Clinic Support Contact] modal
    ...     - 2. Step 3 - The contact card shall be deleted from the Clinic Support Contact section
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-11       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-12: Enter facility note
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter facility note
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Enter or leave empty Facility note, then click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message displayed under Facility Note field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-12       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-13: Move to step 2 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can move to step 2 if all valid information
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 2
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-13      manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP1-14: Cancel the creating new facility when is on step 1
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new facility-Step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Facilities page and all text input shall be dismissed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP1-14       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-01: View all fields in step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select service type
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 2-Facility Setting
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Service Type (Standard is default value)
    ...     - - Facility Status (Active is default value)
    ...     - - Notification Email
    ...     - - Facility Group
    ...     - - Report Faxing
    ...     - - Other configurations
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-01       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-02: Select service type
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select service type
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Service Type] dropdown
    ...     - 2. Select one of 2 options from the dropdown list
    ...
    ...     Expected Results:
    ...     - 1. Step 1
    ...     - - There are 2 options displayed: Standard, Code Red
    ...     - - The default selected value shall be Standard
    ...     - 2. The selected option shall be saved
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-02       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-03: Select facility status
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select a facility status
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Click [Facility Status] dropdown
    ...     - 2. Select a facility status
    ...
    ...     Expected Results:
    ...     - 1. Step 1
    ...     - - There are the following status displayed: Active, Eval, Test, Closed
    ...     - - The default selected value shall be Active
    ...     - 2. Step 2
    ...     - - The selected facility status shall display
    ...     - - If status "Eval" is selected, the section "Eval Start-Stop Day" shall display
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-03       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-04: Enter or leave empty notification email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty notification email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Enter a notification email or leave empty
    ...
    ...     Expected Results:
    ...     - If enter an invalid email, after click [Next] button shall display an error message under Notification email field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-04       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-05: Select or leave empty Facility group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty Facility group
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. In the case Facility status is Active or Eval, click [Facility Group] dropdown, then select a facility group or leave empty
    ...     - 2. In the case Facility status is Test, click [Facility Group] dropdown, then select a facility group or leave empty
    ...     - 3. In case of having a selected Facility group, change to a different Facility Status, observe Facility Group
    ...     - 4. In the case Facility status is Closed, observe Facility Group
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - A list of Facility group shall display according to Facility Group is Active status
    ...     - 2. Step 2 - A list of Facility group shall display according to Facility Group is Test status
    ...     - 3. Step 3 - Display an error message “Please select another facility group accordingly to the facility status.” under the Facility Group filed.
    ...     - 4. Step 4 - The facility group field shall be disabled
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-05       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-06: Select Report faxing
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select option for report faxing
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Observe the Report Faxing section
    ...     - 2. Select checkbox "Auto-fax Facility", in this case the user did not fill in the fax number, then click [Next] button
    ...     - 3. On [Missing facility fax number] modal, enter one or multiple fax numbers (format xxx-xxx-xxxx), then click [Update & Next] button
    ...     - 4. On [Missing facility fax number] modal, click [Cancel] button
    ...     - 5. Select checkbox "Auto-fax Physician"
    ...     - 6. Select checkbox "manual     R2 Faxing"
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There are 3 following options: Auto-fax Facility, Auto-fax Physician, manual     R2 Faxing
    ...     - 2. Step 2 - There shall be a modal "Missing facility fax number" displayed
    ...     - 3. Step 3 - The user is navigated to next step
    ...     - 4. Step 4 - The modal shall be closed
    ...     - 5. Step 5,6 - The selected checkbox shall display
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-06       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-07: Turn on/off other configurations
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can turn on/off other configurations
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Observe Other configurations section
    ...     - 2. Turn on/off toggles
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There are 6 following options:
    ...     - - Email Report
    ...     - - Biodirect
    ...     - - Biocare cardiac Integration
    ...     - - Auto-Interim Report
    ...     - - Flagged studies screen
    ...     - - Auto-changing the diagnosis lead
    ...     - 2. Step 2 - The settings is displayed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-07       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-08: Move to step 3 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can turn on/off other configurations
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 2
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 3 - Account Payable
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-08       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-09: Cancel the creating new facility when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new facility-Step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Facilities page and all text input shall be dismissed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-09       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP2-10: Back to step 1 when is on step 2
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 1
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 1-Facility Information
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP2-10       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-01: View all fields in step 3
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select service type
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 3
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 3-Account Payable
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Name (required)
    ...     - - Email (required)
    ...     - - Country, Address, City, State, Zip code
    ...     - - Phone number
    ...     - - Financal Hold
    ...     - - Fax number
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-01       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-02: Enter Name
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter Name
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 3
    ...
    ...     Test Steps:
    ...     - 1. In Name field, leave empty value, then click [Next] button
    ...     - 2. In Name field, enter a name, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter name" displayed under Name field
    ...     - 2. Name is displayed and there is no error message displayed under Name field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-02       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-03: Enter Email
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter Email
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 3
    ...
    ...     Test Steps:
    ...     - 1. In Email field, leave empty value, then click [Next] button
    ...     - 2. In Email field, enter a valid email, then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Please enter email" displayed under Email field
    ...     - 2. Email is displayed and there is no error message displayed under Email field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-03       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-04: Enter Country, Address, City, State, Zipcode
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter valid address
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 3
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
    [Tags]      AP-FACILITIES-CREATE-STEP3-04       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-05: Enter phone number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 3
    ...
    ...     Test Steps:
    ...     - 1. In Phone number field, enter a phone (10 digits) or leave empty
    ...     - 2. Click [Next] button
    ...
    ...     Expected Results:
    ...     - There is no error message display under Phone number field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-05       manual     R2     
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-06: Select a Financial Hold (days)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 3
    ...
    ...     Test Steps:
    ...     - 1. Observe the Financial Hold section
    ...     - 2. Select one of radio buttons
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The following options shall display:
    ...     - - None (default option)
    ...     - - 60 days
    ...     - - 70 days
    ...     - - 80 days
    ...     - - 90 days
    ...     - 2. Step 2 - The selected option shall be displayed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-06       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-07: Enter fax number
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter or leave empty phone number
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 1
    ...
    ...     Test Steps:
    ...     - 1. In Fax number field, enter a valid fax number (format xxx-xxx-xxxx)
    ...
    ...     Expected Results:
    ...     - The entered fax number shall be displayed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-07       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-08: Move to step 4 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can turn on/off other configurations
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 3
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 4-Notification Protocol
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-08       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-09: Cancel the creating new facility when is on step 3
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new facility-Step 3
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 3
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Facilities page and all text input shall be dismissed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-09       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP3-10: Back to step 2 when is on step 3
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 2
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 3
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 2-Facility Setting
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP3-10       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP4-01: View all fields in step 4
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view information in step 4
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 4
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 4
    ...
    ...     Expected Results:
    ...     - By default, there shall be a PDF file is displayed, the user can change PDF file
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP4-01       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP4-02: Drag/drop a PDF file
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can upload another PDF file to Notification protocol
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 4
    ...
    ...     Test Steps:
    ...     - 1. Drag a PDF file into [Please drag PDF file or click here to upload] section
    ...     - 2. Click [Please drag PDF file or click here to upload] button and choose a PDF file from computer to upload
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - New PDF file is uploaded
    ...     - 2. Step 2 - New PDF file is uploaded
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP4-02       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP4-03: Move to step 5 if all valid fields
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can turn on/off other configurations
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-Step 4
    ...
    ...     Test Steps:
    ...     - 1. Enter all valid fields, then click [Next] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to step 5-Device Settings
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP4-03       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP4-04: Cancel the creating new facility when is on step 4
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new facility-Step 4
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 4
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Facilities page and all text input shall be dismissed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP4-04       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP4-05: Back to step 3 when is on step 4
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 3
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 4
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 3-Account Payable
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP4-05       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-01: View all fields in step 5
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view information in step 5
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. View all fields in step 5
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Study durations (required)
    ...     - - Pre-Event time (required)
    ...     - - Post-Event time (required)
    ...     - - Bradycardia Threshold (required)
    ...     - - Tachycardia Threshold (required)
    ...     - - Pause Level Duration (required)
    ...     - - AFIB detection (required)
    ...     - - Pause detection (required)
    ...     - - Diagnostic lead (required)
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-01       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-02: Enter study duration
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter a study duration
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Leave empty study duration, then click [Next] button
    ...     - 2. Enter a duration (out of 1-30), then click [Next] button
    ...     - 3. Enter a duration (1-30), then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There shall be an error message displayed under Study duration field
    ...     - 2. Step 2 - There shall be an error message displayed under Study duration field
    ...     - 3. Step 3 - There is no error message displayed under Study duration field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-02       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-03: Select Pre-Event time
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select a pre-event time
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Select pre-event time dropdown
    ...     - 2. Select a option from the dropdown list
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The following options are displayed:
    ...     - - 30 (default value)
    ...     - - 60
    ...     - - 90
    ...     - - 120
    ...     - - 150
    ...     - - 180
    ...     - 2. Step 2 - The selected option shall display
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-03       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-04: Select Post-Event time
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can select a Post-event time
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     1. Select Post-event time dropdown
    ...     2. Select a option from the dropdown list
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The following options are displayed:
    ...     - - 30 (default value)
    ...     - - 60
    ...     - - 90
    ...     - - 120
    ...     - - 150
    ...     - - 180
    ...     - 2. Step 2 - The selected option shall display
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-04       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-05: Enter Bradycardia Threshold
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter a Bradycardia Threshold
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Leave empty Bradycardia Threshold, then click [Next] button
    ...     - 2. Enter an invalid value (out of 0-300), then click [Next] button
    ...     - 3. Enter a valid value (1-30), then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There shall be an error message displayed under Bradycardia Threshold field
    ...     - 2. Step 2 - There shall be an error message displayed under Bradycardia Threshold field
    ...     - 3. Step 3 - There is no error message displayed under Bradycardia Threshold field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-05       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-06: Enter Tachycardia Threshold
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter a Tachycardia Threshold
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Leave empty Tachycardia Threshold, then click [Next] button
    ...     - 2. Enter an invalid value (out of 0-300), then click [Next] button
    ...     - 3. Enter a valid value (1-30), then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There shall be an error message displayed under Tachycardia Threshold field
    ...     - 2. Step 2 - There shall be an error message displayed under Tachycardia Threshold field
    ...     - 3. Step 3 - There is no error message displayed under Tachycardia Threshold field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-06       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-07: Enter Pause Level Duration
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can enter a Pause Level Duration
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Leave empty Pause Level Duration, then click [Next] button
    ...     - 2. Enter an invalid value (out of 0.001 - 60), then click [Next] button
    ...     - 3. Enter a valid value (0.001 - 60), then click [Next] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There shall be an error message displayed under Pause Level Duration field
    ...     - 2. Step 2 - There shall be an error message displayed under Pause Level Duration field
    ...     - 3. Step 3 - There is no error message displayed under Pause Level Duration field
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-07       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-08: Select AFIB detection
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can turn on/off AFIB detection
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Select a option (On/Off) on AFIB detection section
    ...
    ...     Expected Results:
    ...     - The selected option shall be saved
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-08       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-09: Select Pause detection
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can turn on/off Pause detection
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Select a option (On/Off) on Pause detection section
    ...
    ...     Expected Results:
    ...     - The selected option shall be saved
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-09       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-10: Select Diagnostic lead
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can turn on/off Diagnostic lead
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Select a option (I/II/III) on Diagnostic lead section
    ...
    ...     Expected Results:
    ...     - The selected option shall be saved
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-10       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-11: Cancel the creating new facility when is on step 5
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel creating new facility-Step 5
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Click [Back] button in the header
    ...     - 2. Click [Cancel] button at the end of the screen
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Facilities page and all text input shall be dismissed
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-11       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-STEP5-12: Back to step 4 when is on step 5
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate back to step 4
    ...
    ...     Precondition:
    ...     - The Admin user is on the Create New Facility screen-step 5
    ...
    ...     Test Steps:
    ...     - 1. Click [Previous] button
    ...
    ...     Expected Results:
    ...     - The user is navigated back to step 4-Notification Protocol
    ...
    [Tags]      AP-FACILITIES-CREATE-STEP5-12       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-13: Create a Active Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Create a Active Facility
    ...
    ...     Precondition:
    ...     - The Admin user is on  Facility page
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Create new facility button
	...		- 2. Change Facility Status
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-CREATE-13      AP-1.12.0    manual          R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-FACILITIES-CREATE-14: Create a Eval Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Create a Eval Facility
    ...
    ...     Precondition:
    ...     - The Admin user is on  Facility page
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Create new facility button -> Create facility successfully
	...		- 2. Change Facility Status
	...		- 3. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-CREATE-14      AP-1.12.0    manual          R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}




AP-FACILITIES-CREATE-15: Create a Test Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Create a Test Facility
    ...
    ...     Precondition:
    ...     - The Admin user is on  Facility page
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Create new facility button -> Create facility successfully
	...		- 2. Change Facility Status
	...		- 3. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-CREATE-15      AP-1.12.0    manual          R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-CREATE-16: Create a Closed Facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot Create a Test Facility
    ...
    ...     Precondition:
    ...     - The Admin user is on  Facility page
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Create new facility button -> Create facility successfully
	...		- 2. Change Facility Status
	...		- 3. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-CREATE-16      AP-1.12.0    manual          R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-01: View Edit Facility screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Edit Facility screen
    ...
    ...     Precondition:
    ...     - The Admin user is on Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the end of the row of a specific facility, then click [Edit] button
    ...
    ...     Expected Results:
    ...     - The user is navigated to the Edit Facility screen with the following sections:
    ...     - - The “Facility Name” displayed next to the page title.
    ...     - - Facility Details tab with the following subtabs: Facility Information, Facility Setting, Account Payable, Notification Protocol
    ...     - - Device Configuration tab
    ...     - - Assigned Devices tab
    ...
    [Tags]      AP-FACILITIES-EDIT-01       manual          R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-02: Edit Facility Information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit all information in Facility Information page
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Facility Information tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Edit the fields in the page, then click [Save] button
    ...     - 2. Edit the fields in the page, exit out of a tab/subtab without saving
    ...     - 3. Delete fax number when the auto-fax facility in the Facility Setting is selected/ unselect.
    ...     - 4. On "Leave without saving" modal, select option "Keep editing"
    ...     - 5. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1- All changes shall be saved but Organization (Cannot be edited)
    ...     - 2. Step 2- A modal "Leave without saving?" displayed with content "Your changes will not be saved. Are you sure you want to leave this page?”
    ...     - with 2 options, “Keep editing” and “Leave”
    ...     - 3. Step 3- There shall be an error message " Fax number cannot be empty because Auto-fax report to facility is enabled " is displayed.
    ...     - 4. Step 4- Exit the modal and keeps the user on the page
    ...     - 5. Step 5- Redirect the user to where they want to go without any edits saved
    ...
    [Tags]      AP-FACILITIES-EDIT-02       manual          R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-03: Edit Facility Settings
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit all information in Facility Settings page
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Facility Settings is selected
    ...
    ...     Test Steps:
    ...     - 1. Edit the fields in the page, then click [Save] button
    ...     - 2. Edit the fields in the page, exit out of a tab/subtab without saving
    ...     - 3. Check the Auto-fax number option in the Report Faxing fied while the Fax number in the Facility Information is leave
    ...     - 4. On "Leave without saving" modal, select option "Keep editing"
    ...     - 5. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1- All changes shall be saved
    ...     - 2. Step 2- A modal "Leave without saving?" displayed with content "Your changes will not be saved. Are you sure you want to leave this page?”
    ...     - with 2 options, “Keep editing” and “Leave”
    ...     - 3. The Missing facility fax number pop-up shall be displayed to the user add the fax number
    ...     - 4. Step 3- Exit the modal and keeps the user on the page
    ...     - 5. Step 4- Redirect the user to where they want to go without any edits saved
    ...
    [Tags]      AP-FACILITIES-EDIT-03       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-FACILITIES-EDIT-04: Edit Facility Setting- the Missing facility fax number pop-up
    [Documentation]     Author: Phuong Tran

    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Facility Setting is selected.
    ...
    ...     Test Steps:
    ...     - 1. The Fax number black then click "Update & Save" button
    ...     - 2. Enter valid the fax number then click "Update & Save" button
    ...     - 3. Enter invalid the fax number then click "Update & Save" button
    ...     - 4. Enter valid fax number then "Update & Save" button after enter invalid fax number
    ...     - 5. Clicks the "Cancel" button
    ...     - 6. On "Leave without saving" modal, select option "Keep editing"
    ...     - 7. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1- There is an error message "Invalid fax number" displayed.
    ...     - 2. Step 2- Update the fax number successfully
    ...     - 3. Step 3- There is an error message "Invalid fax number" displayed.
    ...     - 4. Step 4- Update the fax number successfully
    ...     - 5. Step 5- Close the dialog with no changes saved but retained.
    ...     - 6. Step 3- Exit the modal and keeps the user on the page
    ...     - 7. Step 4- Redirect the user to where they want to go without any edits saved
    ...
    [Tags]      AP-FACILITIES-EDIT-04       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-05: Edit Facility Setting - View the Facility Status field drop-down list when the current Facility status is "Active"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Facility Status field drop-down list when the current Facility status is "Active"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Facility Status field drop-down list
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. The user can only select between “Closed”, “Active”, and “Eval”.
    ...
    [Tags]      AP-FACILITIES-EDIT-05      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-06: Edit Facility Setting - View the Facility Status field drop-down list when the current Facility status is "Eval"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Facility Status field drop-down list when the current Facility status is "Eval"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Facility Status field drop-down list
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. The user can only select between “Closed”, “Active”, and “Eval”.
    ...
    [Tags]      AP-FACILITIES-EDIT-06      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-07: Edit Facility Setting - View the Facility Status field drop-down list when the current Facility status is "Test"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Facility Status field drop-down list when the current Facility status is "Test"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Facility Status field drop-down list
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. The user can only select between “Closed” and “Test”
    ...
    [Tags]      AP-FACILITIES-EDIT-07     AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-08: Edit Facility Setting -View the Facility Status field drop-down list when the current Facility status is "Closed"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Facility Status field drop-down list when the current Facility status is "Closed"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. Clicks the Facility Status field drop-down list
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. If the system has the data on its previous status
	...		- -  The user can only select between “Closed”, “Active”, and “Eval” if the previous status is either “Active” or “Eval”
    ...		- -  The user can only select between “Closed” and “Test” if the previous status is “Test
	...		- 2. If the system does not have data on its previous status
	...		- -  The user can only select between “Closed”, “Active”, and “Eval”
    [Tags]     AP-FACILITIES-EDIT-08      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-09: Edit Facility Setting -Switch Facility Status to Eval when current base state is "Active"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Eval when current base state is "Active"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Active Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Eval" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the error message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-09      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-FACILITIES-EDIT-10: Edit Facility Setting - Switch Facility Status to Closed when current base state is "Active" and not any ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Closed when current base state is "Active"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Active Facility page and the Facility Setting tab not any ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Closed" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the error message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-10      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-11: Edit Facility Setting -Switch Facility Status to Closed when current base state is "Active" and that Facility has ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Closed when current base state is "Active" that Facility has ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Active Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Closed" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. There shall be a message to notify the user
	...		- -" The facility cannot be closed since RMA tickets or Transfer tickets are being processed. Please check them over and finish them before closing." and "Okay" button
    [Tags]      AP-FACILITIES-EDIT-11      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-12: Edit Facility Setting - Switch Facility Status to Active when current base state is " Eval"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Active when current base state is " Eval"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Eval Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Active" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the error message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-12      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-FACILITIES-EDIT-13: Edit Facility Setting - Switch Facility Status to Closed when current base state is "Eval" and not any ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Closed when current base state is "Eval"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Eval Facility page and the Facility Setting tab not any ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Closed" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the error message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-13      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-14: Edit Facility Setting - Switch Facility Status to Closed when current base state is "Eval" and that Facility has ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Closed when current base state is "Eval" that Facility has ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Eval Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Closed" value
	...		- 2. Observe
    ...
   ...     Expected Results:
    ...     - 1. There shall be a message to notify the user
	...		- -" The facility cannot be closed since RMA tickets or Transfer tickets are being processed. Please check them over and finish them before closing." and "Okay" button
    [Tags]      AP-FACILITIES-EDIT-14      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-15: Edit Facility Setting - Switch Facility Status to Closed when current base state is "Test" and not any ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Closed when current base state is "Test"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Test Facility page and the Facility Setting tab not any ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Closed" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the error message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-15      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-16: Edit Facility Setting - Switch Facility Status to Closed when current base state is "Test" and that Facility has ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Closed when current base state is "Test" that Facility has ticket in [New and In-process] state of RMA ticket and [Pending] state of Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Test Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Closed" value
	...		- 2. Observe
    ...
   ...     Expected Results:
    ...     - 1. There shall be a message to notify the user
	...		- -" The facility cannot be closed since RMA tickets or Transfer tickets are being processed. Please check them over and finish them before closing." and "Okay" button
    [Tags]      AP-FACILITIES-EDIT-16      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-FACILITIES-EDIT-17: Edit Facility Setting - Switch Facility Status to Active when current base state is " Closed"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Active when current base state is " Closed"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Closed Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Active" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-17      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}




AP-FACILITIES-EDIT-18: Edit Facility Setting - Switch Facility Status to Eval when current base state is " Closed"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Eval when current base state is " Closed"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Closed Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Eval" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-18      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}




AP-FACILITIES-EDIT-19: Edit Facility Setting - Switch Facility Status to Test when current base state is " Closed"
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Switch Facility Status to Test when current base state is " Closed"
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Closed Facility page and the Facility Setting tab
    ...
    ...     Test Steps:
    ...     - 1. In the Facility Status field drop-down list - select the "Test" value
	...		- 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. Display the message " Facility updated successfully " and the new status facility shall be updated.
    [Tags]      AP-FACILITIES-EDIT-19      AP-1.12.0    manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-FACILITIES-EDIT-20: Edit Account Payable
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit all information in Account Payable page
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Account Payable is selected
    ...
    ...     Test Steps:
    ...     - 1. Edit the fields in the page, then click [Save] button
    ...     - 2. Edit the fields in the page, exit out of a tab/subtab without saving
    ...     - 3. On "Leave without saving" modal, select option "Keep editing"
    ...     - 4. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1- All changes shall be saved
    ...     - 2. Step 2- A modal "Leave without saving?" displayed with content "Your changes will not be saved. Are you sure you want to leave this page?”
    ...     with 2 options, “Keep editing” and “Leave”
    ...     - 3. Step 3- Exit the modal and keeps the user on the page
    ...     - 4. Step 4- Redirect the user to where they want to go without any edits saved
    ...
    [Tags]      AP-FACILITIES-EDIT-20       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-21: Edit Notification Protocol
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit all information in Notification Protocol page
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Notification Protocol is selected
    ...
    ...     Test Steps:
    ...     - 1. Edit the fields in the page, then click [Save] button
    ...     - 2. Edit the fields in the page, exit out of a tab/subtab without saving
    ...     - 3. On "Leave without saving" modal, select option "Keep editing"
    ...     - 4. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1- All changes shall be saved
    ...     - 2. Step 2- A modal "Leave without saving?" displayed with content "Your changes will not be saved. Are you sure you want to leave this page?”
    ...     - with 2 options, “Keep editing” and “Leave”
    ...     - 3. Step 3- Exit the modal and keeps the user on the page
    ...     - 4. Step 4- Redirect the user to where they want to go without any edits saved
    ...
    [Tags]      AP-FACILITIES-EDIT-21       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-22: Edit Device Configuration
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit all information in Device Configuration page
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Device Configuration is selected
    ...
    ...     Test Steps:
    ...     - 1. Edit the fields in the page, then click [Save] button
    ...     - 2. Edit the fields in the page, exit out of a tab/subtab without saving
    ...     - 3. On "Leave without saving" modal, select option "Keep editing"
    ...     - 4. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1- All changes shall be saved
    ...     - 2. Step 2- A modal "Leave without saving?" displayed with content "Your changes will not be saved. Are you sure you want to leave this page?”
    ...     - with 2 options, “Keep editing” and “Leave”
    ...     - 3. Step 3- Exit the modal and keeps the user on the page
    ...     - 4. Step 4- Redirect the user to where they want to go without any edits saved
    ...
    [Tags]      AP-FACILITIES-EDIT-22       manual     R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-23: View Assigned Devices tab - Bioflux/Biotres
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view Assigned Devices tab in Edit Facility page
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Assigned Devices is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe all fields in the screen
    ...     - 2. Edit the fields in the page, exit out of a tab/subtab without saving
    ...     - 3. On "Leave without saving" modal, select option "Keep editing"
    ...     - 4. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1:
    ...     - - There shall be 5 subtabs: All, Active, RMA, Renewal (only be visible if the facility is
    ...     - - subscribed to the “Renewal Stock” program on the Sales Portal), Maintenance
    ...     - - Each tab shall display the number of devices: Total devices, Bioflux, Biotres
    ...     - - The list shall display the following attributes:
    ...     - + Device ID (hyperlink to quick access Device information)
    ...     - + Model
    ...     - + Firmware Version
    ...     - + Operation Status
    ...     - + Status
    ...     - + Last Connect
    ...     - - At the end of each row, there shall be a “Device Logs” button for the user to view the device logs sidebar
    ...
    [Tags]      AP-FACILITIES-EDIT-23   SA-FSR-13-01      manual     R2     1.12.0

    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-EDIT-24: View Assigned Devices tab - Bioheart
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view Assigned Devices tab in Edit Facility page
    ...
    ...     Precondition:
    ...     - The Admin user is on Edit Facility page and Assigned Devices is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe all fields in the screen
    ...     - 2. Edit the fields in the page, exit out of a tab/subtab without saving
    ...     - 3. On "Leave without saving" modal, select option "Keep editing"
    ...     - 4. On "Leave without saving" modal, select option "Leave"
    ...
    ...     Expected Results:
    ...     - 1. Step 1:
    ...     - - There shall be 3 subtabs: All, Active, RMA
    ...     - - Each tab shall display the number of devices: Total devices
    ...     - - The list shall display the following attributes:
    ...     - + Device ID
    ...     - + Firmware Version
    ...     - + Status
    ...     - + Last Connect
    ...     - - At the end of each row, there shall be a “Device Logs” button for the user to view the device logs sidebar
    ...
    [Tags]      AP-FACILITIES-EDIT-24   SA-FSR-13-01      manual     R2     1.12.0

    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SEARCH-01: Search a facility that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for facilities that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a facility name that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by facility name and the search placeholder shall say “Search by facility name”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered facility name
    ...
    [Tags]      AP-FACILITIES-SEARCH-01       manual        1.11.2     R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SEARCH-02: Search a facility that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for facilities that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a facility name that not existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by facility name and the search placeholder shall say “Search by facility name”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-FACILITIES-SEARCH-02       manual       1.11.2     R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SEARCH-03: Search a facility ID that existing in the system
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search for facilities that existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, select and enter a facility ID that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by facility ID and the search placeholder shall say “Search by facility ID”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered facility ID
    ...
    [Tags]      AP-FACILITIES-SEARCH-03       manual        1.11.2     R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SEARCH-04: Search a facility ID that not existing in the system
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can search for facilities that not existing in the system
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, select and enter a facility ID that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by facility ID and the search placeholder shall say “Search by facility ID”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-FACILITIES-SEARCH-04       manual        1.11.2     R1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SEARCH-05: The facility list should be reset as by default when switching between search options
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The facility list should be reset as by default when switching between search options
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, select and enter a facility ID/ Facility name that existing in the system
    ...     - 3. Switching between search options
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by facility name/ ID and the search placeholder shall say “Search by facility ID/ name”
    ...     - 2. Step 2 -  The facility list shall be reseted as by default
    ...
    ...
    [Tags]      AP-FACILITIES-SEARCH-05       manual        1.11.2      R2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SEARCH-06: Search a facility ID/ name of the newly created facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The facility list should be reset as by default when switching between search options
    ...
    ...     Precondition:
    ...     - The Admin user is on the Facilities page
    ...     - Have a new created facility
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, select and enter that facility ID/ name
    ...     - 3. Observe the screen
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by facility ID/ name and the search placeholder shall say “Search by facility ID/ name”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered facility ID/ name
    [Tags]      AP-FACILITIES-SEARCH-06       manual     R2        1.11.2
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SIGNIN-CLINIC-01: Sign in Clinic Portal in the case the facility status is Closed
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in Clinic Portal of a closed facility
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to portal by SSO and is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the [Access Portal] button in the any facility that that's status is Closed.
    ...
    ...     Expected Results:
    ...     - 1. The [Access Portal] button shall be disabled and have tooltip "Not available for Closed facility"
    ...
    [Tags]     AP-FACILITIES-SIGNIN-CLINIC-01        R2    manual     R2      AP-1.11.1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SIGNIN-CLINIC-02: Sign in Clinic Portal of a Test facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to Clinic Portal of a Test facility
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to portal by SSO and is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the [Access Portal] button in the any facility that that's status is Test.
    ...     - 2. Clicks the [Access Portal] button
    ...     - 3. Clicks the "Continue" button in the modal
    ...     - 4. Clicks the "Cancel" button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Step 1- Display a tooltip "Access to portal"
    ...     - 2. Step 2- There shall be a confirmation modal with 2 options: ‘Clinic Portal’ and ‘Billing Portal’ and 2 buttons: 'Continue' and 'Cancel'
    ...     - - Default selecting ‘Clinic Portal’ with the message: “You are going to sign in to the Clinic portal with [Facility Name] facility. Are you sure you want to continue? ” and Cancel button, Continue button
    ...     - 3. Step 3- The user shall go to the Clinic portal (on a new tab) with the selected facility as Clinic technician role.
    ...     - 4. Step 4- Exit the modal.
    ...
    [Tags]     AP-FACILITIES-SIGNIN-CLINIC-02    manual     R2      AP-1.11.1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SIGNIN-CLINIC-03: Sign in Clinic Portal of an Active facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to Clinic Portal of an Active facility
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to portal by SSO and is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the [Access Portal] button in the any facility that that's status is Active.
    ...     - 2. Clicks the [Access Portal] button
    ...     - 3. Clicks the "Continue" button in the modal
    ...     - 4. Clicks the "Cancel" button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Step 1- Display a tooltip "Access to portal"
    ...     - 2. Step 2- There shall be a confirmation modal with 2 options: ‘Clinic Portal’ and ‘Billing Portal’ and 2 buttons: 'Continue' and 'Cancel'
    ...     - - Default selecting ‘Clinic Portal’ with the message: “You are going to sign in to the Clinic portal with [Facility Name] facility. Are you sure you want to continue? ”
    ...     - 3. Step 3- The user shall go to the Clinic portal (on a new tab) with the selected facility as Clinic technician role.
    ...     - 4. Step 4- Exit the modal.
    ...
    [Tags]     AP-FACILITIES-SIGNIN-CLINIC-03        R2    manual     R2      AP-1.11.1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SIGNIN-BILLING-01: Sign in Billing Portal in the case the facility status is Closed
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot sign in Billing Portal of a closed facility
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to portal by SSO and is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the [Access Portal] button in the any facility that that's status is Closed.
    ...
    ...     Expected Results:
    ...     - 1. The [Access Portal] button shall be disabled and have tooltip "Not available for Closed facility"
    ...
    [Tags]     AP-FACILITIES-SIGNIN-BILLING-01        R2    manual     R2      AP-1.11.1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SIGNIN-BILLING-02: Sign in Billing Portal of a Test facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to Billing Portal of a Test facility
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to portal by SSO and is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the [Access Portal] button in the any facility that that's status is Test.
    ...     - 2. Clicks the [Access Portal] button
    ...     - 3. Select "Billing Portal" option
    ...     - 4. Clicks the "Continue" button in the modal
    ...     - 5. Clicks the "Cancel" button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Step 1- Display a tooltip "Access to portal"
    ...     - 2. Step 2- There shall be a confirmation modal with 2 options: ‘Clinic Portal’ and ‘Billing Portal’ and 2 buttons: 'Continue' and 'Cancel'
    ...     - - Default selecting ‘Clinic Portal’
    ...     - 3. Step 3- Display the message: “You are going to sign in to the Billing portal with [Facility Name] facility. Are you sure you want to continue? ”
    ...     - 4. Step 4- The user shall go to the Billing portal (on a new tab) with the selected facility as Billing user role - ‘Billing portal’ is selected
    ...     - 5. Step 5- Exit the modal.
    ...
    [Tags]     AP-FACILITIES-SIGNIN-BILLING-02        R2    manual     R2      AP-1.11.1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-FACILITIES-SIGNIN-BILLING-03: Sign in Billing Portal of an Active facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sign in to Billing Portal of an Active facility
    ...
    ...     Precondition:
    ...     - The Admin user has logged in to portal by SSO and is on the Facilities page
    ...
    ...     Test Steps:
    ...     - 1. Hover over the [Access Portal] button in the any facility that that's status is Active.
    ...     - 2. Clicks the [Access Portal] button
    ...     - 3. Select "Billing Portal" option
    ...     - 4. Clicks the "Continue" button in the modal
    ...     - 5. Clicks the "Cancel" button in the modal
    ...
    ...     Expected Results:
    ...     - 1. Step 1- Display a tooltip "Access to portal"
    ...     - 2. Step 2- There shall be a confirmation modal with 2 options: ‘Clinic Portal’ and ‘Billing Portal’ and 2 buttons: 'Continue' and 'Cancel'
    ...     - - Default selecting ‘Clinic Portal’
    ...     - 3. Step 3- Display the message: “You are going to sign in to the Billing portal with [Facility Name] facility. Are you sure you want to continue? ”
    ...     - 4. Step 4- The user shall go to the Billing portal (on a new tab) with the selected facility as Billing user role - ‘Billing portal’ is selected
    ...     - 5. Step 5- Exit the modal.
    ...
    [Tags]     AP-FACILITIES-SIGNIN-BILLING-03        R2    manual     R2      AP-1.11.1
    Manual Should Be Passed      ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_admin_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${VERSION}      Navigate To Admin Sign In Page
    Set Suite Metadata  version   ${VERSION}
    Set Suite Metadata  browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

