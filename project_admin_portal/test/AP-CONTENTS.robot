*** Settings ***
Documentation   Test Suite - Admin Portal - Contents page
Metadata    sid     AP-CONTENTS
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_admin_portal/lib/ConfigHandler.py     ${ENV}
#Library     project_admin_portal/lib/web/Common.py

Suite Setup     Suite Setup
Suite Teardown  Suite Teardown

Force Tags      AP-CONTENTS     web
Test Timeout    1h

*** Test Cases ***
AP-CONTENTS-VIEW-01: View all subtabs displayed on the Content page
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view all subtabs displayed on the Content page properly
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. View all subtabs displayed on the screen
    ...
    ...     Expected Results:
    ...     - 1. There shall be 2 tabs:
    ...         - Biocare Diagnostics
    ...         - Biocare Disease Management
    [Tags]      AP-CONTENTS-VIEW-01              manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-VIEW-02: View all subtabs displayed on the Biocare Diagnostics page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all subtabs displayed on the Content page properly
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. View all subtabs displayed on the screen
    ...
    ...     Expected Results:
    ...     - 1. There shall be 4 subtabs displayed on the screen including:
	...         - What's New Video
    ...         - How to Videos
    ...         - Billing Codes
	...			- Support Materials
    ...         - + Onboarding Guide
    ...         - + Features Manual
    ...         - + Instructions for Use
    ...         - + Patient Manual
    ...         - + Patient Quick Guide

    [Tags]      AP-CONTENTS-VIEW-02               manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-01: What's New Video - Click the Save button when that page empty (Delete all information in that page)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can click the Save button when that page empty
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
    ...     - 3. Delete all information in that page
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video screen shall be displayed
	...		- Step 3 - That page will become a empty page
	...		- Step 4 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-01              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-02: What's New Video - Empty the Youtube link field then Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the value into the Link Name field then Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
    ...     - 3. Enter the value into the Link Name field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter Youtube link" under the Youtube field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-02             manual      R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-03: What's New Video - Empty the Link name field field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the youtube link  into the  Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
    ...     - 3. Enter the youtube link  into the  Youtube Link field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter link name" under the Link name field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-03              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-04: What's New Video - Enter the other youtube links into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the other youtube links into the  Youtube Link field
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
	...		- 3. Enter valid link name in the Link name field
    ...     - 4. Enter the other youtube links into the Youtube Link field
	...		- 5. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - The entered youtube link shall be displayed.
	...		- Step 5 - Display the error message "Please check youtube link format!" under the Youtube link field  and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-04              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-05: What's New Video - Change new information in the What's New Viddeo
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the What's New Viddeo
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
    ...     - 3. Change the new link name then click Save button
	...		- 4. Change the new youtube link then click Save button
    ...     - 5. Change the new link name and youtube link then click Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video shall be displayed
	...		- Step 3,4,5 - The message "Update successfully!" shall be displayed and the new change shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-05              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-06: What's New Video - Change any information in the What's New Video then click the other section
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the What's New Viddeo
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
    ...     - 3. Change the new link name then click the other section
	...		- 4. Change the new youtube link then click the other section
    ...     - 5. Change the new link name and youtube link then click the other section
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video shall be displayed
	...		- Step 3,4,5 - The Leave without Saving shall be displed with Keep editing and Leave button
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-06              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-07: What's New Video - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the What's New Viddeo
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video shall be displayed
	...		- Step 3 - The new information shall be displayed in that page
	...		- Step 4 - The Leave without Saving pop-up shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-07              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-08: What's New Video - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can change new information in the What's New Viddeo
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [What's New Video] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The What's New Video shall be displayed
	...		- Step 3 - The new information shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-08              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-09: How to Videos/ Bioflux section - Enter the value into the Link Name field and the youtube link into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the value into the Link Name field and the youtube link into the Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter valid value into the required fields
    ...     - 4. Click the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - Display the message "Update successfully!"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-09              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-10: How to Videos/ Bioflux section - Empty all field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can empty all field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Empty all field
    ...     - 4. Click the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter  link name/ Youtube link" under the  link name/ Youtube field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-10              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-11: How to Videos/ Bioflux section - Empty the Youtube link field then Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can empty the Youtube link field then Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter the value into the Link Name field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter Youtube link" under the Youtube field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-11              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-12: How to Videos/ Bioflux section - Empty the Link name field field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can empty the Link name field field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter the youtube link  into the  Youtube Link field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter link name" under the Link name field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-12               manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-13: How to Videos/ Bioflux section - Enter the other youtube links into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the other youtube links into the Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
	...		- 3. Enter valid link name in the Link name field
    ...     - 4. Enter the other youtube links into the Youtube Link field
	...		- 5. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - The entered youtube link shall be displayed.
	...		- Step 5 - Display the error message "Please check youtube link format!" under the Youtube link field  and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-13               manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-14: How to Videos/ Bioflux section - Enter the value into the Link Name field and the other youtube link into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the value into the Link Name field and the other youtube link into the Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter the valid value into the link name field and invalid into the Youtube link
    ...     - 4. Click the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - Display the error message "Please check youtube link format!" under the Youtube link field  and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-14              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-15: How to Videos/ Bioflux section - Add a new row when all rows have data
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can add a new row when all rows have data
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Click the Add row button- Fill in all field
    ...     - 4. Click the Add row button

    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The new row shall displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-15              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-16: How to Videos/ Bioflux section - Add a new row when there’s a row that has no data in the Link name or Youtube link field
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can' t add a new row when there’s a row that has no data in the Link name or Youtube link field
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Click the Add row button - Fill in any field or leave it blank
    ...     - 4. Click the Add row button
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The Add row button shall be disabled.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-16              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-17: How to Videos/ Bioflux section - Delete a row when all rows have data
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can delete a row when all rows have data
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 4. Click the Delete button in the row you want to delete

    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The row shall be deleted.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-17             manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-18: How to Videos/ Bioflux section - Delete a row when there’s a row that has no data in the Link name or Youtube link field
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cann't  delete a row when there’s a row that has no data in the Link name or Youtube link field
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Click the Add row button - Fill in any field or leave it blank
    ...     - 4. Click the Remove button
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The Remove button shall be disabled.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-18              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-19: How to Videos/ Bioflux section - Change new information in the How to Videos
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Change the new link name then click Save button
	...		- 4. Change the new youtube link then click Save button
    ...     - 5. Change the new link name and youtube link then click Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos shall be displayed
	...		- Step 3,4,5 - The message "Update successfully!" shall be displayed and the new change shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-19               manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-20: How to Videos/ Biotres section - Enter the value into the Link Name field and the youtube link into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the value into the Link Name field and the youtube link into the Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter valid value into the required fields
    ...     - 4. Click the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - Display the message "Update successfully!"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-20              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-21: How to Videos/ Biotres section - Empty all field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can empty all field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Empty all field
    ...     - 4. Click the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter  link name/ Youtube link" under the  link name/ Youtube field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-21              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-22: How to Videos/ Biotres section - Empty the Youtube link field then Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can empty the Youtube link field then Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter the value into the Link Name field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter Youtube link" under the Youtube field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-22              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-23: How to Videos/ Biotres section - Empty the Link name field field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can empty the Link name field field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter the youtube link  into the  Youtube Link field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter link name" under the Link name field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-23               manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-24: How to Videos/ Biotres section - Enter the other youtube links into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the other youtube links into the Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
	...		- 3. Enter valid link name in the Link name field
    ...     - 4. Enter the other youtube links into the Youtube Link field
	...		- 5. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - The entered youtube link shall be displayed.
	...		- Step 5 - Display the error message "Please check youtube link format!" under the Youtube link field  and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-24               manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-25: How to Videos/ Biotres section - Enter the value into the Link Name field and the other youtube link into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the value into the Link Name field and the other youtube link into the Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Enter the valid value into the link name field and invalid into the Youtube link
    ...     - 4. Click the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - Display the error message "Please check youtube link format!" under the Youtube link field  and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-25              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-26: How to Videos/ Bioflux section - Add a new row when all rows have data
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can add a new row when all rows have data
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Click the Add row button- Fill in all field
    ...     - 4. Click the Add row button

    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The new row shall displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-26              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-27: How to Videos/ Biotres section - Add a new row when there’s a row that has no data in the Link name or Youtube link field
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can' t add a new row when there’s a row that has no data in the Link name or Youtube link field
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Click the Add row button - Fill in any field or leave it blank
    ...     - 4. Click the Add row button
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The Add row button shall be disabled.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-27              manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-28: How to Videos/ Biotres section - Delete a row when all rows have data
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can delete a row when all rows have data
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 4. Click the Delete button in the row you want to delete

    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The row shall be deleted.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-28             manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-29: How to Videos/ Biotres section - Delete a row when there’s a row that has no data in the Link name or Youtube link field
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cann't  delete a row when there’s a row that has no data in the Link name or Youtube link field
    ...     Precondition: - The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Click the Add row button - Fill in any field or leave it blank
    ...     - 4. Click the Remove button
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - The entered fields shall be displayed.
	...		- Step 4 - The Remove button shall be disabled.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-29              manual   AP-1.15.0
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-30: How to Videos/ Biotres section - Change new information in the How to Videos
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Change the new link name then click Save button
	...		- 4. Change the new youtube link then click Save button
    ...     - 5. Change the new link name and youtube link then click Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos shall be displayed
	...		- Step 3,4,5 - The message "Update successfully!" shall be displayed and the new change shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-30               manual   AP-1.15.0     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-31: How to Videos - Change any information in the How to Videos then click the other section
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Change the new link name then click the other section
	...		- 4. Change the new youtube link then click the other section
    ...     - 5. Change the new link name and youtube link then click the other section
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - How to Videos shall be displayed
	...		- Step 3,4,5 - The Leave without Saving shall be displed with Keep editing and Leave button
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-31              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-32: How to Videos - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos shall be displayed
	...		- Step 3 - The new information shall be displayed in that page
	...		- Step 4 - The Leave without Saving pop-up shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-32              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-33: How to Videos - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos shall be displayed
	...		- Step 3 - The new information shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-33              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-34: How to Videos - Click the Save button when that page empty (Delete all information in that page)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can click the Save button when that page empty
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Videos] subtab
    ...     - 3. Delete all information in that page
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Videos screen shall be displayed
	...		- Step 3 - That page will become a empty page
	...		- Step 4 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-34              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-35: Billing Reference - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-35               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-36: Billing Reference - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-36               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-37: Billing Reference - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-37               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-38: Billing Reference - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-38               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-39: Billing Reference - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-39               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-40: Billing Reference - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-40               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-41: Billing Reference - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Billing Reference sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-41    manual    R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-42: Billing Reference - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Billing Reference
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Billing Reference shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-42              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-43: Billing Reference - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Billing Reference
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Billing Reference shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-43       manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-44: Onboarding Guide - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Onboarding Guide] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-44      manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-45: Onboarding Guide - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Onboarding Guide] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-45               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-46: Onboarding Guide - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Onboarding Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
	...		- 4. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Onboarding Guide] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-46               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-47: Onboarding Guide - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Onboarding Guidee by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
    ...     - 4. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Onboarding Guide] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-47               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-48: Onboarding Guide - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Onboarding Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Onboarding Guide] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-48               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-49: Onboarding Guide - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Onboarding Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a not PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Onboarding Guide] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-49               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-50: Onboarding Guide - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Clinic Onboarding Guide sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] in any section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Onboarding Guide] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-50               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-51: Onboarding Guide - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Onboarding Guide
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Onboarding Guide shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-51              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-52: Onboarding Guide - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Onboarding Guide
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Onboarding Guide] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Onboarding Guide shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-52              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-53: Features Manual - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Features Manual] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-53               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-54: Features Manual - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Features Manual] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-54               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-55: Features Manual - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Features Manual by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Features Manual] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-55               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-56: Features Manual - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Features Manual by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Features Manual] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-56               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-57: Features Manual - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-57               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-58: Features Manual - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Features Manual by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Features Manual] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-58               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-59: Features Manual - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Features Manual sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Features Manual] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-59               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-60: Features Manual - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Billing Reference
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Features Manual shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-60              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-61: Features Manual - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Billing Reference
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Features Manual] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Features Manual shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-61              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-62: Instructions for Use - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Instructions for Use] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-62               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-63: Instructions for Use - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Instructions for Use] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-63               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-64: Instructions for Use - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Instructions for Use by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
	...		- 4. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Instructions for Use] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-64               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-65: Instructions for Use - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Instructions for Use by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
    ...     - 4. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Instructions for Use] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-65               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-66: Instructions for Use - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Instructions for Use by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Instructions for Use] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-66               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-67: Instructions for Use - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Instructions for Use by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a not PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Instructions for Use] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-67               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-68: Instructions for Use - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Clinic Instructions for Use sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] in any section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Instructions for Use] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-68               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-69: Instructions for Use - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Instructions for Use
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Instructions for Use shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-69              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-70: Instructions for Use - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Instructions for Use
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Instructions for Use] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - Instructions for Use shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-70              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-71: Patient Manual - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Manual] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-71               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-72: Patient Manual - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Manual] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-72               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-73: Patient Manual - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Manual by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
	...		- 4. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Manual] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-73              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-74: Patient Manual - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Manual by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
    ...     - 4. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Manual] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-74               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-75: Patient Manual - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Manual by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Manual] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-75               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-76: Patient Manual - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Manual by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a not PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Manual] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-76               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-77: Patient Manual - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Clinic Patient Manual sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] in any section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Manual] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-77               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-78: Patient Manual - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Patient Manual
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Patient Manual shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-78              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-79: Patient Manual - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Patient Manual
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Manual] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Patient Manual shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-79              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-80: Patient Quick Guide - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Quick Guide] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-80               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-81: Patient Quick Guide - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Quick Guide] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-81               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-82: Patient Quick Guide - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Quick Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
	...		- 4. Drag and drop a PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Quick Guide] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-82               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-83: Patient Quick Guide - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Quick Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Bioflux section
    ...     - 4. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] in the Biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Quick Guide] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-83               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-84: Patient Quick Guide - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Quick Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Quick Guide] screen shall be displayed
    ...     - Step 3,4 - The new PDF file shall be displayed.
	...		- Step 5 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-84               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-85: Patient Quick Guide - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Patient Quick Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] in the bioflux section
	...		- 4. Upload a not PDF file on [Please drag PDF file or click here to upload] in the biotres section
    ...     - 5. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Quick Guide] screen shall be displayed
    ...     - Step 3,4 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-85               manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-86: Patient Quick Guide - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Patient Quick Guide sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] in any section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Patient Quick Guide] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-86               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-87: Patient Quick Guide - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Patient Quick Guide
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Patient Quick Guide shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-87              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-88: Patient Quick Guide - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Patient Quick Guide
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Patient Quick Guide] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Patient Quick Guide shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DIAGNOTICS-88              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-01: Clinic Onboarding Guide - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Clinic Onboarding Guide] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-01               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-02: Clinic Onboarding Guide - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Clinic Onboarding Guide] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-02               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-03: Clinic Onboarding Guide - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Clinic Onboarding Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Clinic Onboarding Guide] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-03               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-04: Clinic Onboarding Guide - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Clinic Onboarding Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Clinic Onboarding Guide] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-04               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-05: Clinic Onboarding Guide - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Clinic Onboarding Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Clinic Onboarding Guide] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-05               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-06: Clinic Onboarding Guide - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Clinic Onboarding Guide by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Clinic Onboarding Guide] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-06               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-07: Clinic Onboarding Guide - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Clinic Onboarding Guide sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Clinic Onboarding Guide] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-07               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-08: Clinic Onboarding Guide - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Clinic Onboarding Guide
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Clinic Onboarding Guide shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-08              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-09: Clinic Onboarding Guide - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Clinic Onboarding Guide
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Clinic Onboarding Guide] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Clinic Onboarding Guide shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-09              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-10: How to Onboard Patient - Empty the Youtube link field then Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the value into the Link Name field then Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
    ...     - 3. Enter the value into the Link Name field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Onboard Patient screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter Youtube link" under the Youtube field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-10            manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-11: How to Onboard Patient - Empty the Link name field field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the youtube link  into the  Youtube Link field then click the Save button
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
    ...     - 3. Enter the youtube link  into the  Youtube Link field
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Onboard Patients screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - Display the error message "Please enter link name" under the Link name field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-11             manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-12: How to Onboard Patient - Enter the other youtube links into the Youtube Link field then click the Save button
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can enter the other youtube links into the  Youtube Link field
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
	...		- 3. Enter valid link name in the Link name field
    ...     - 4. Enter the other youtube links into the Youtube Link field
	...		- 5. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Onboard Patient screen shall be displayed
	...		- Step 3 - The entered Link name shall be displayed.
	...		- Step 4 - The entered youtube link shall be displayed.
	...		- Step 5 - Display the error message "Please check youtube link format!" under the Youtube link field  and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-12              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-13: How to Onboard Patient - Change new information in the How to Onboard Patient
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
    ...     - 3. Change the new link name then click Save button
	...		- 4. Change the new youtube link then click Save button
    ...     - 5. Change the new link name and youtube link then click Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Onboard Patient shall be displayed
	...		- Step 3,4,5 - The message "Update successfully!" shall be displayed and the new change shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-13             manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-14: How to Videos - Change any information in the How to Onboard Patient then click the other section
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the How to Onboard Patient
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
    ...     - 3. Change the new link name then click the other section
	...		- 4. Change the new youtube link then click the other section
    ...     - 5. Change the new link name and youtube link then click the other section
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - How to Onboard Patient shall be displayed
	...		- Step 3,4,5 - The Leave without Saving shall be displed with Keep editing and Leave button
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-14              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-15: How to Onboard Patient - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Onboard Patient shall be displayed
	...		- Step 3 - The new information shall be displayed in that page
	...		- Step 4 - The Leave without Saving pop-up shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-15              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-16: How to Onboard Patient - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can change new information in the How to Videos
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Onboard Patient shall be displayed
	...		- Step 3 - The new information shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-16              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-17: How to Onboard Patient - Click the Save button when that page empty (Delete all information in that page)
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can click the Save button when that page empty
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [How to Onboard Patient] subtab
    ...     - 3. Delete all information in that page
	...		- 4. Cick the Save button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The How to Onboard Patient screen shall be displayed
	...		- Step 3 - That page will become a empty page
	...		- Step 4 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-17              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-18: Billing Reference - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-18              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-19: Billing Reference - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-19              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-20: Billing Reference - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-20               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-21: Billing Reference - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-21               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-22: Billing Reference - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-22              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-23: Billing Reference - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Billing Reference by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-23              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-24: Billing Reference - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Billing Reference sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Billing Reference] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-24               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-25: Billing Reference - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Billing Reference
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Billing Reference shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-25              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-26: Billing Reference - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Billing Reference
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Billing Reference] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Billing Reference shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-26              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-27: Blood Pressure Cuff Instructions - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Blood Pressure Cuff Instructions] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-27              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-28: Blood Pressure Cuff Instructions - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Blood Pressure Cuff Instructions] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-28               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-29: Blood Pressure Cuff Instructions - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Blood Pressure Cuff Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Blood Pressure Cuff Instructions] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-29              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-30: Blood Pressure Cuff Instructions - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Blood Pressure Cuff Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Blood Pressure Cuff Instructions] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-30              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-31: Blood Pressure Cuff Instructions - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Blood Pressure Cuff Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Blood Pressure Cuff Instructions] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-31               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-32: Blood Pressure Cuff Instructions - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Blood Pressure Cuff Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Blood Pressure Cuff Instructions] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-32              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-33: Blood Pressure Cuff Instructions - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Blood Pressure Cuff Instructions sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Blood Pressure Cuff Instructions] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-33               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-34: Blood Pressure Cuff Instructions - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Blood Pressure Cuff Instructions
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Blood Pressure Cuff Instructions shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-34             manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-35: Blood Pressure Cuff Instructions - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Blood Pressure Cuff Instructions
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Blood Pressure Cuff Instructions] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Blood Pressure Cuff Instructions shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-35              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-36: Digital Thermometer Instructions - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Digital Thermometer Instructions] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-36              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-37: Digital Thermometer Instructions - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Digital Thermometer Instructions] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-37               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-38: Digital Thermometer Instructions - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Digital Thermometer Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Digital Thermometer Instructions] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-38               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-39: Digital Thermometer Instructions - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Digital Thermometer Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Digital Thermometer Instructions] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-39               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-40: Digital Thermometer Instructions - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Blood Pressure Cuff Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Digital Thermometer Instructions] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-40               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-41: Digital Thermometer Instructions - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Digital Thermometer Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Digital Thermometer Instructions] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-41               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-42: Digital Thermometer Instructions - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Digital Thermometer Instructions sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Digital Thermometer Instructions] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-42               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-43: Digital Thermometer Instructions - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Digital Thermometer Instructions
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Digital Thermometer Instructions shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-43             manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-44: Digital Thermometer Instructions - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Blood Pressure Cuff Instructions
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Digital Thermometer Instructions] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Digital Thermometer Instructions shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-44              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-45: Pulse Oximeter Instructions - Click the Save button when that page empty
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when that page empty
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Click the Save button
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Pulse Oximeter Instructions] screen shall be displayed (That page will become a empty page)
	...		- Step 3 - Display the error message under the field and a toast "Please check all required field"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-45              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-46: Pulse Oximeter Instructions - Click the Save button when there are no changes
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Click the Save button when there are no changes
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Click the Save button - no change
    ...     - 4. Observe
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Pulse Oximeter Instructions] screen shall be displayed
	...		- Step 3 - Display the error message under the field and a toast "You did not make any change"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-46               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-47: Pulse Oximeter Instructions - Drag a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Pulse Oximeter Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Drag and drop a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Pulse Oximeter Instructions] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-47               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-48: Pulse Oximeter Instructions - Drag a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Pulse Oximeter Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Drag and drop a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Pulse Oximeter Instructions] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-48               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-49: Pulse Oximeter Instructions - Upload a PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Pulse Oximeter Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Upload a PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Pulse Oximeter Instructions] screen shall be displayed
    ...     - Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The new PFD file shall be updated.
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-49              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-50: Pulse Oximeter Instructions - Upload a not PDF file
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change content of Pulse Oximeter Instructions by dragging a PDF file
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Upload a not PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click [Save] button and check new changes
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The [Pulse Oximeter Instructions] screen shall be displayed
    ...     - Step 3 - Display the error message "Please upload PDF file only"
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-50               manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-51: Pulse Oximeter Instructions - Change the PDF file then click the other sub-tab
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: Change the PDF in the Pulse Oximeter Instructions sub-tab then click the other sub-tab
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Upload a  PDF file on [Please drag PDF file or click here to upload] section
    ...     - 4. Click the other sub-tab
    ...
    ...     Expected Results:
    ...     - Step 1 - Navigated to the Content page
	...		- Step 2 - The [Pulse Oximeter Instructions] screen shall be displayed
	...		- Step 3 - The new PDF file shall be displayed.
	...		- Step 4 - The Leave without Saving shall be displayed
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-51              manual     R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-52: Pulse Oximeter Instructions - Click the Keep editing button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Pulse Oximeter Instructions
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Change the PDF file
	...		- 4. Click the other section
	...		- 5. Click the Keep editing button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Pulse Oximeter Instructions shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - That pop-up will be closed and the user remains on that page with the new information
    [Tags]      AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-52              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-53: Pulse Oximeter Instructions - Click the Leave button in the Leave without Saving pop-up
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can change new information in the Blood Pressure Cuff Instructions
    ...
    ...     Precondition: The user has signed in to the portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Contents] button on the navigation menu
    ...     - 2. Click [Pulse Oximeter Instructions] subtab
    ...     - 3. Change any information in that page
	...		- 4. Click the other sub-tab/ tab
	...		- 5. Click the Leave button
    ...
    ...     Expected Results:
	...		- Step 1 - Navigated to the Content page
	...		- Step 2 - The Pulse Oximeter Instructions shall be displayed
	...		- Step 3 - The new PDF field shall be displayed in that page
	...		- Step 4 - The Leave without Saving shall be displayed.
	...		- Step 5 - The user shall be navigated to the desired page without changing any information
    [Tags]     AP-CONTENTS-EDIT-BIOCARE-DISEASE-MANAGEMENT-53              manual     R2
       Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_admin_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${VERSION}      Navigate To Admin Sign In Page
    Set Suite Metadata  version   ${VERSION}
    Set Suite Metadata  browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser

