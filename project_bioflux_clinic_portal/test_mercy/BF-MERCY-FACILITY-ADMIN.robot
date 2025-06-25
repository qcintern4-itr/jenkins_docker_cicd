*** Settings ***
Documentation   Test Suite - Clinic Portal - Mercy
Metadata    sid     BF-MERCY-FACILITY-ADMIN
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py                                     ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py        ${ENV}    WITH NAME   CpConfig
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py    ${ENV}    WITH NAME   CcConfig
Library     project_bioflux_clinic_portal/lib/api/Clinic.py           ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py             ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Support.py
Library     project_bioflux_clinic_portal/lib/web/Inbox.py
Library     project_bioflux_clinic_portal/lib/web/Studies.py
Library     project_bioflux_clinic_portal/lib/web/Devices.py
Library     project_bioflux_clinic_portal/lib/web/Fleet.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-MERCY-FACILITY-ADMIN     web
Test Timeout    1h

*** Test Cases ***
BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-01: Facility View List – Multiple Facilities Displayed in Scrollable Modal
   [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that the left modal displays scrollable facility list sorted by status and name when assigned to multiple facilities.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is logged into Biocare Home portal
    ...     - User is assigned to multiple facilities
    ...
    ...     Test Steps:
    ...     1. Navigate to Facility Admin portal
    ...     2. Observe the left modal
    ...
    ...     Expected Results:
    ...     1. A scrollable left modal displays facility list
    ...     2. List is sorted by status priority: Active > Trial > Test
    ...     3. Within each group, sorted alphabetically by name
    ...     4. Display label next to name:
    ...         - No label for Active
    ...         - “Trial” for Eval
    ...         - “Test” for Test
    ...     5. First facility on list is selected by default
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-01    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-02:Facility View List – No Modal for Single Facility
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that no facility list modal is displayed if user is assigned to only one facility.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is logged into Biocare Home portal
    ...     - User is assigned to only one facility
    ...
    ...     Test Steps:
    ...     1. Navigate to Facility Admin portal
    ...
    ...     Expected Results:
    ...     1. No left modal is displayed
    ...     2. Facility detail panel is shown immediately
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-02    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-03: Facility Detail – Display Facility Information Sections
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that when a facility is selected, its detail info is shown correctly.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is assigned to at least one facility
    ...
    ...     Test Steps:
    ...     1. Navigate to Facility Admin portal
    ...     2. Select any facility from the list
    ...
    ...     Expected Results:
    ...     1. Display facility detail section on right panel with:
    ...         - Facility Info: Name, Short name, Address, Phone, Fax, Sales rep, Notification email, Note
    ...         - Clinic Support Contacts (sorted oldest → newest): Title, Name, Phone, Email, Description
    ...         - Notification Protocol PDF (if uploaded)
    ...         - Referring Physician list
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-03    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-04: Facility Detail – Update Panel When Switching Facility
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that clicking another facility updates the detail panel accordingly.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - Assigned to multiple facilities
    ...
    ...     Test Steps:
    ...     1. Navigate to Facility Admin portal
    ...     2. Select Facility A, note detail shown
    ...     3. Select Facility B
    ...
    ...     Expected Results:
    ...     1. Detail panel updates with Facility B information
    ...     2. All sections update accordingly
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-VIEW-FACILITY-04    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-01: Add Clinic Support Contact – Valid Input Saves and Displays New Contact
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that Facility Admin can add a new clinic support contact with valid data and it is displayed in the contact list.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is on the "Your facilities" page with one or more assigned facilities
    ...     - A facility is selected with view details expanded
    ...
    ...     Test Steps:
    ...     1. In the “Clinic Support Contact” section, click on the “Add contact” button
    ...     2. Fill in valid values for required fields: phone number, email address (optional: name and description)
    ...     3. Click the “Add” button
    ...
    ...     Expected Results:
    ...     1. The side-tab form appears titled “Add clinic support contact”
    ...     2. After clicking “Add” with valid input:
    ...         - The contact is added to the list (at the bottom)
    ...         - Data is synced to ERP Admin
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-01    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-02: Add Clinic Support Contact – Show Error for Missing Required Fields
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that error messages are shown when required fields are left empty during add contact flow.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is on the "Your facilities" page with a selected facility
    ...
    ...     Test Steps:
    ...     1. Click on the “Add contact” button in Clinic Support Contact section
    ...     2. Leave required fields empty (Phone and/or Email)
    ...     3. Click the “Add” button
    ...
    ...     Expected Results:
    ...     1. Side-tab form appears
    ...     2. Corresponding error messages are shown below missing required fields
    ...     3. Contact is not saved or added to the list
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-02    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-03: Edit Clinic Support Contact – Valid Input Updates Contact Information
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that Facility Admin can edit an existing support contact and save valid changes successfully.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is on the "Your facilities" page with at least one existing support contact
    ...
    ...     Test Steps:
    ...     1. Click the “Edit” button on any support contact
    ...     2. Modify one or more fields with valid values
    ...     3. Click the “Save” or “Update” button
    ...
    ...     Expected Results:
    ...     1. “Edit clinic support contact” side-tab is displayed with pre-filled information
    ...     2. After clicking “Save”, the updated information is shown correctly in the list
    ...     3. Changes are synced to the ERP Admin portal
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-03    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-04: Edit Clinic Support Contact – Show Error When Required Fields Are Invalid or Empty
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that error messages appear when required fields are empty or invalid during editing a support contact.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is on the "Your facilities" page with at least one existing contact
    ...
    ...     Test Steps:
    ...     1. Click “Edit” button on a support contact
    ...     2. Clear the phone number or email fields
    ...     3. Click “Save” button
    ...
    ...     Expected Results:
    ...     1. Error messages appear for empty/invalid required fields
    ...     2. The contact is not updated
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-04    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-05: Delete Clinic Support Contact – Confirm Deletion Removes the Contact
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that a support contact is removed from the list when confirmed in the deletion modal.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is on the "Your facilities" page with one or more contacts
    ...
    ...     Test Steps:
    ...     1. Click the “Delete” icon on any contact card or from the edit screen
    ...     2. In the confirmation modal, click “Remove”
    ...
    ...     Expected Results:
    ...     1. Confirmation modal appears
    ...     2. After confirming, the contact is removed from the list
    ...     3. Removal is synced to ERP Admin portal
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-05    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-06: Delete Clinic Support Contact – Cancel Button Keeps the Contact
    [Documentation]     Author: Thanh Tieu
    ...
    ...     Description: Verify that clicking "Cancel" in the delete confirmation modal does not remove the support contact.
    ...
    ...     Precondition:
    ...     - User has Facility Admin role
    ...     - User is on the "Your facilities" page with a support contact
    ...
    ...     Test Steps:
    ...     1. Click the “Delete” icon on a contact card or from the edit screen
    ...     2. In the confirmation modal, click “Cancel”
    ...
    ...     Expected Results:
    ...     1. Confirmation modal appears
    ...     2. After clicking “Cancel”, the modal closes and the contact remains unchanged
    ...
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-EDIT-FACILITY-06    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-01: View Referring Physician list
    [Documentation]    Author: Thanh Tieu
    ...     Description: Verify that the user can view the Referring Physician list on the facility detail page
    ...     Precondition:
    ...     - User is logged into Biocare portal
    ...     - User is a Facility Admin assigned to a facility with existing referring physicians
    ...     Test Steps:
    ...     1. Navigate to "Your Facilities"
    ...     2. Select a facility from the list
    ...     3. Scroll down to the “Referring Physician” section
    ...     Expected Results:
    ...     1. The list of referring physicians is displayed
    ...     2. Each record shows full name, title, NPI, address, after-hours phone, email, fax, and status
    ...     3. Fields with missing data display "--"
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu
    [Tags]    BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-01    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-02: Search Referring Physician by Full Name (Case Insensitive)
    [Documentation]     Author: Thanh Tieu
    ...
    ...  Description:
    ...  - Verify that the Referring Physician list supports live search by full name (First name + Last name) in a case-insensitive manner.

    ...  Precondition:
    ...  - The user has logged into the Biocare Portal with Facility Admin role.
    ...  - The user is on the Facility Detail page with Referring Physician section.
    ...  - There are existing records with different name cases.

    ...  Test Steps:
    ...  1. Locate the Referring Physician search input.
    ...  2. Enter the full name in all uppercase (e.g., "JOHN DOE").
    ...  3. Observe the search results.
    ...  4. Enter the full name in all lowercase (e.g., "john doe").
    ...  5. Observe the search results.
    ...  6. Enter a partial name (e.g., "john").
    ...  7. Observe the search results.
    ...  8. Enter a full name that does not exist (e.g., "non exist").
    ...  9. Observe the system behavior.

    ...  Expected Results:
    ...  - Step 2, 4, 6. Matching results shall be returned regardless of letter case.
    ...  - Step 8. Display “No data” message if no matching result is found.
    ...  - Step 3, 5, 7. The results should update in real-time as the user types.

    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-02   manual    CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-03: Filter Referring Physician List by Status
    [Documentation]     Author: Thanh Tieu
    ...
    ...    Description:
    ...    Verify that the Referring Physician list can be filtered by status (All, Active, Deactivated).

    ...    Precondition:
    ...    - The user has logged into the Biocare Portal with Facility Admin role.
    ...    - The user is on the Facility Detail page with at least 1 physician in each status.

    ...    Test Steps:
    ...    1. Locate the status filter dropdown.
    ...    2. Select “All status”.
    ...    3. Observe the list.
    ...    4. Select “Active”.
    ...    5. Verify only physicians with status = Active are shown.
    ...    6. Select “Deactivated”.
    ...    7. Verify only physicians with status = Deactivated are shown.

    ...    Expected Results:
    ...    Step 2: All physician records are displayed.
    ...    Step 5: Only Active physicians are shown.
    ...    Step 7: Only Deactivated physicians are shown.

    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]      BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-03    manual    CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-04: Add Referring Physician - Manual entry

    [Documentation]    Author: Thanh Tieu
    ...     Description: Verify adding a new referring physician using manual entry
    ...     Precondition:
    ...     - User is on facility detail page
    ...     Test Steps:
    ...     1. Click “Add” in Referring Physician section
    ...     2. Select manual entry
    ...     3. Fill in all required fields with valid data
    ...     4. Click “Add new physician”
    ...     Expected Results:
    ...     1. New physician is added and shown in the list
    ...     2. Status is “Active” by default
    ...     3. A success message is shown
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu
    [Tags]    BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-04    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-05: Add Referring Physician - Search by NPI
    [Documentation]    Author: Thanh Tieu
    ...     Description: Verify adding a referring physician by searching NPI number
    ...     Precondition:
    ...     - User is on facility detail page
    ...     Test Steps:
    ...     1. Click “Add” in Referring Physician section
    ...     2. Enter 10-digit valid NPI and click “Search”
    ...     3. Verify auto-filled data is correct
    ...     4. Click “Add new physician”
    ...     Expected Results:
    ...     1. New physician is added and shown in the list
    ...     2. A success message is shown
    ...     3. Invalid NPI shows error message
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu
    [Tags]    BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-05    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-06: Edit Referring Physician
    [Documentation]    Author: Thanh Tieu
    ...     Description: Verify editing referring physician info
    ...     Precondition:
    ...     - Referring physician exists in list
    ...     Test Steps:
    ...     1. Click “Edit” button on a record
    ...     2. Change info with valid values
    ...     3. Click “Save”
    ...     Expected Results:
    ...     1. Changes are saved and reflected in list
    ...     2. A success message is shown
    ...     3. Invalid fields trigger validation error
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu
    [Tags]    BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-06    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-07: Toggle Referring Physician status (Activate/Deactivate)
    [Documentation]    Author: Thanh Tieu
    ...     Description: Verify that user can activate/deactivate a referring physician
    ...     Precondition:
    ...     - Referring physician list is displayed
    ...     Test Steps:
    ...     1. Locate a physician record
    ...     2. Toggle status button
    ...     Expected Results:
    ...     1. Status updates (Active <-> Deactivated)
    ...     2. Toast message shows success or failure
    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu
    [Tags]    BF-MERCY-FACILITY-ADMIN-REFERRING-PHYSICIAN-07    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-VIEW-01: View the list of Active and Deactivated Users
    [Documentation]     Author: Thanh Tieu
    ...     Description:
    ...     Verify that the Facility Admin user can view the list of Active and Deactivated users in separate tabs with correct information, sorting order, and pagination options.
    ...
    ...     Precondition:
    ...     - The user is logged into the Biocare Portal with Facility Admin role.
    ...     - The user is on the User Management page.

    ...     Test Steps:
    ...     1. Verify that two tabs are displayed: "Active users" and "Deactivated users".
    ...     2. Click on the "Active users" tab and review the list.
    ...     3. Click on the "Deactivated users" tab and review the list.
    ...     4. For both lists, verify that each user item displays the following:
    ...         - Full name (First name + Last name)
    ...         - Title
    ...         - Address (Address + City + State + Zip code)
    ...         - Email
    ...         - Phone number
    ...         - Role(s): Admin, Physician, or Technician
    ...         - Facility (Only active facilities that both the user and Admin are assigned to)
    ...     5. Verify that the list is sorted by creation date in descending order (newest first).
    ...     6. Scroll to the bottom of the list to check for pagination controls.
    ...     7. Verify default items per page is set to 10.
    ...     8. Change the items per page to 30 and verify the list updates.
    ...     9. Change the items per page to 50 and verify the list updates.
    ...     10. Observe the display of current viewing range and total number of items.

    ...     Expected Results:
    ...     - User Management shows 2 separate tabs for Active and Deactivated users.
    ...     - All user records display full required fields as specified.
    ...     - List is correctly sorted by newest to oldest.
    ...     - Pagination is present and works with 10, 30, 50 items per page options.
    ...     - Facility column only shows active facilities shared by Admin and the user.

    ...     **Others
    ...     Update date: 6/17/2025 - Thanh Tieu

    [Tags]     BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-VIEW-01    manual     CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}     ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-SEARCH-01: Search by Full Name on User List
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that Facility Admin can search for a user by full name on the User Management page.
    ...    Precondition:
    ...        - The user is logged in as Facility Admin.
    ...        - The user is on the User Management page (Active users tab or Deactivated users tab).
    ...
    ...    Test Steps:
    ...        1. Locate the Search input field.
    ...        2. Enter the full name (first name + last name) of a known user.
    ...        3. Press Enter to trigger the search.
    ...
    ...    Expected Results:
    ...        - The system displays a list of users matching the full name (case-insensitive).
    ...        - If no match is found, the system displays: "There is no data to display".
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-SEARCH-01    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-SEARCH-02: Search by Email on User List
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that Facility Admin can search for a user by email address on the User Management page.
    ...    Precondition:
    ...        - The user is logged in as Facility Admin.
    ...        - The user is on the User Management page.
    ...
    ...    Test Steps:
    ...        1. Locate the Search input field.
    ...        2. Enter the email address of a known user (any casing).
    ...        3. Press Enter to search.
    ...
    ...    Expected Results:
    ...        - The system returns matching user(s) whose email matches the input (case-insensitive).
    ...        - If no match is found, the message: "There is no data to display" is shown.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-SEARCH-02    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01: Filter users by role on User Management page
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify that Facility Admin user can filter the list of users by selecting one or multiple roles using the filter option.
    ...
    ...    Precondition:
    ...        - The user is logged in with the Facility Admin role.
    ...        - The user is on the User Management page.
    ...
    ...    Test Steps:
    ...        1. Locate and click the filter button on the User Management page.
    ...        2. Select one or more of the following roles:
    ...            - Admin
    ...            - Technician
    ...            - Physician
    ...        3. Confirm the filter selection.
    ...
    ...    Expected Results:
    ...        - The user list is updated to include only users with at least one of the selected roles.
    ...        - If no users match the selected filter(s), the message "There is no data to display" is shown.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01A: Filter only Admin users
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify that Facility Admin can filter the user list to only show Admin users.
    ...
    ...    Precondition:
    ...        - The user is logged in with the Facility Admin role.
    ...        - The user is on the User Management page.
    ...
    ...    Test Steps:
    ...        1. Click the filter button.
    ...        2. Select only the "Admin" role.
    ...        3. Confirm filter selection.
    ...
    ...    Expected Results:
    ...        - The user list displays only users with the Admin role.
    ...        - If no Admin user exists, display message: "There is no data to display".
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01A    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01B: Filter only Technician users
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify that Facility Admin can filter the user list to only show Technician users.
    ...
    ...    Precondition:
    ...        - Facility Admin is on the User Management page.
    ...
    ...    Test Steps:
    ...        1. Click filter.
    ...        2. Select only "Technician".
    ...
    ...    Expected Results:
    ...        - Only Technician users are shown.
    ...        - If none, message: "There is no data to display".
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01B    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01C: Filter only Physician users
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify filtering by Physician role.
    ...
    ...    Precondition:
    ...        - User is Facility Admin.
    ...        - On User Management page.
    ...
    ...    Test Steps:
    ...        1. Click filter.
    ...        2. Select only "Physician".
    ...
    ...    Expected Results:
    ...        - Only Physician users are listed.
    ...        - If no user matches, show "There is no data to display".
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-01C    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-02: Combine search and filter on the User Management list
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify that Facility Admin can use the search and filter features together to refine the user list.
    ...
    ...    Precondition:
    ...        - The user is logged in with the Facility Admin role.
    ...        - The user is on the User Management page.
    ...
    ...    Test Steps:
    ...        1. Enter a keyword (e.g., full name or email) into the search field and press Enter.
    ...        2. Click the filter button and select one or multiple roles (e.g., Admin, Physician).
    ...
    ...    Expected Results:
    ...        - The system displays the list of users matching BOTH:
    ...            a) The entered search keyword.
    ...            b) At least one of the selected roles.
    ...        - If no user matches both conditions, the message "There is no data to display" is shown.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-02    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-03: Search and filter match - should display correct users
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify that when both search keyword and selected filter match existing users, the system displays correct results.
    ...
    ...    Precondition:
    ...        - The user is logged in with Facility Admin role.
    ...        - The user is on the User Management page.
    ...        - At least one user exists with full name: “Dr. Alice” and role: Physician.
    ...
    ...    Test Steps:
    ...        1. Enter "Alice" into the search field and press Enter.
    ...        2. Select "Physician" from the filter options.
    ...
    ...    Expected Results:
    ...        - “Dr. Alice” is displayed in the result.
    ...        - The result shows users that match both search keyword **and** selected role.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-03    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-04: Search matches but filter does not - should show no data
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify that if the search keyword matches users, but the selected filter does not, the result is empty.
    ...
    ...    Precondition:
    ...        - The user is logged in with Facility Admin role.
    ...        - The user is on the User Management page.
    ...        - “Dr. Alice” exists with role Physician, but **not** an Admin.
    ...
    ...    Test Steps:
    ...        1. Enter "Alice" into the search field and press Enter.
    ...        2. Select "Admin" from the filter options.
    ...
    ...    Expected Results:
    ...        - No results are shown.
    ...        - The message “There is no data to display” is displayed.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-04    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-05: Filter matches but search does not - should show no data
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...        Verify that if the selected filter matches users, but the entered search keyword does not, the result is empty.
    ...
    ...    Precondition:
    ...        - The user is logged in with Facility Admin role.
    ...        - The user is on the User Management page.
    ...        - At least one user exists with role Technician.
    ...
    ...    Test Steps:
    ...        1. Enter a random string (e.g., "xyz") into the search field and press Enter.
    ...        2. Select "Technician" from the filter options.
    ...
    ...    Expected Results:
    ...        - No results are shown.
    ...        - The message “There is no data to display” is displayed.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-FILTER-05    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-01: Verify visibility and actions of 'New User' button
    [Documentation]    Author: Thanh Tieu
    ...
    ...    Description:
    ...    Verify that the “New User” button is visible and clickable on the User Management page.
    ...
    ...    Precondition:
    ...    - User is a Facility Admin.
    ...    - User is on the User Management page.
    ...
    ...    Test Steps:
    ...    1. Navigate to the User Management page.
    ...    2. Observe the presence of the “New User” button.
    ...    3. Click on the “New User” button.
    ...
    ...    Expected Results:
    ...    - “New User” button is visible.
    ...    - When clicked, a modal is shown with two options: “Manual Entry” and “Search by NPI Number”.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-01    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-02: Manual Entry - Verify step 1: User information
    [Documentation]    Author: Thanh Tieu
    ...
    ...    Description:
    ...    Verify that the Facility Admin user can proceed through Step 1 – User information, with validation logic applied.
    ...
    ...    Precondition:
    ...    - User has selected “Manual Entry” and clicked “Next”.
    ...
    ...    Test Steps:
    ...    1. Verify facility field:
    ...       - Disabled if admin is assigned to one facility.
    ...       - Multi-selectable if assigned to multiple.
    ...    2. Select different combinations of roles (Admin, Technician, Physician).
    ...       - Try selecting Technician then Physician and vice versa.
    ...    3. Enter text into Title, First name, Last name.
    ...    4. Enter email already in use and click “Next”.
    ...
    ...    Expected Results:
    ...    - Facility field behaves based on facility count.
    ...    - Selecting Technician disables Physician and vice versa.
    ...    - Duplicate email shows “The email already exists. Please try another.”
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-02    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-03: Manual Entry - Verify step 2: Contact information and phone number validation
    [Documentation]    Author: Thanh Tieu
    ...
    ...    Description:
    ...    Validate country-specific rules for phone number inputs.
    ...
    ...    Precondition:
    ...    - User is on Step 2 – Contact Information screen.
    ...
    ...    Test Steps:
    ...    1. Select Country as "United States" or "Canada"
    ...    2. Input Day phone/After hours phone/Fax number with:
    ...       - more than 10 digits
    ...       - invalid characters
    ...    3. Select other countries and input more than 15 digits.
    ...    4. Observe input behavior and format.
    ...
    ...    Expected Results:
    ...    - US/CA numbers limited to 10 digits, formatted as xxx-xxx-xxxx.
    ...    - Others limited to 15 numeric digits only.
    ...    - Invalid characters are not allowed.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-03    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-04: Verify toggling "Include physician contact" setting (Physician role only)
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Validate the appearance and effect of the "Include physician contact info in report" toggle for Physician users.
    ...    Precondition:
    ...    - Physician role is selected.
    ...    Test Steps:
    ...    1. Select “Physician” as the user role.
    ...    2. Verify that the toggle appears.
    ...    3. Enable and disable it.
    ...    Expected Results:
    ...    - Toggle appears only if Physician role is selected.
    ...    - When enabled, Physician info is used in reports.
    ...    - When disabled, Facility info is used instead.
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-04    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-05: Manual Entry - Verify successful user creation and Welcome email
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that a new user is successfully created and Welcome email is sent.
    ...    Precondition:
    ...    - Valid inputs in all required fields.
    ...    Test Steps:
    ...    1. Complete both steps of user creation with valid data.
    ...    2. Click “Create user” button.
    ...    Expected Results:
    ...    - Success toast message displayed.
    ...    - User appears in the list under appropriate status tab.
    ...    - Welcome email is sent to user’s email.
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-05    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-06: Search by NPI - Validate auto-filled fields after NPI lookup
    [Documentation]    Author: Thanh Tieu
    ...
    ...    Description:
    ...    Verify that the Facility Admin user can create a new user by searching with a valid NPI Number. Includes validation for NPI input, field auto-population, role assignment, and success behavior.
    ...
    ...    Precondition:
    ...    - The user is logged in and on the User Management page.
    ...    - The user has clicked the "New User" button and selected the "Search by NPI Number" option.
    ...
    ...    Test Steps:
    ...    1. Enter a 10-digit valid NPI number into the NPI input field.
    ...    2. Click the “Search” button.
    ...    3. Verify that the system returns and auto-fills the corresponding user information.
    ...    4. Verify the “Role” field is prefilled with Technician and editable (mutually exclusive with Physician).
    ...    5. Verify “NPI Number” field is disabled.
    ...    6. Edit editable fields if needed.
    ...    7. Click “Create user” button.
    ...
    ...    Expected Results:
    ...    - All fields are correctly auto-filled.
    ...    - Validation applies to edited fields (e.g., email format, phone number rule).
    ...    - Success message is displayed.
    ...    - New user appears in the correct user list.
    ...    - User receives a welcome email.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-06    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-07: Search by NPI - Search with invalid NPI number
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the system displays an error when a user enters a NPI Number that is not exactly 10 digits.
    ...
    ...    Precondition:
    ...    - User is on “Search by NPI Number” tab of Create User flow.
    ...
    ...    Test Steps:
    ...    1. Enter a NPI number less or more than 10 digits.
    ...    2. Click the “Search” button.
    ...
    ...    Expected Results:
    ...    - Error message is displayed: “Please enter a 10-digit NPI Number.”
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-07    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-08: Search by NPI - No matching NPI is found.
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the system displays an appropriate message if no match is found for the entered NPI number.
    ...    Precondition:
    ...    - User is on “Search by NPI Number” tab of Create User flow.
    ...
    ...    Test Steps:
    ...    1. Enter a valid-format NPI (10-digit) that does not exist in NPI database.
    ...    2. Click the “Search” button.
    ...
    ...    Expected Results:
    ...    - Message displayed: “No physician was found for the NPI number you entered. Please check the number and try again.”
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-08    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-09: Search by NPI - Quit and discard entered data
    [Documentation]    Author: Thanh Tieu
    ...    Description:
    ...    Verify that the user can quit the Create User by NPI flow, and the system prompts confirmation and clears all entered data.
    ...    Precondition:
    ...    - User is in step 2 of "Create User by NPI".
    ...
    ...    Test Steps:
    ...    1. At step 2 of the Create User form, click on the “Close” button.
    ...    2. Confirm close in the confirmation modal.
    ...    3. Reopen the "Create User" flow.
    ...
    ...    Expected Results:
    ...    - System displays confirmation modal with Cancel and Confirm buttons.
    ...    - On Confirm, system closes the modal and clears all entered data.
    ...    - When reopening, the form starts fresh without saved input.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-CREATE-USER-09    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-01: Display “Reset password” button for Active users
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that the "Reset password" button is displayed for Active users.
    ...    Precondition: User status = Active. Admin is on User details page.
    ...
    ...    Test Steps:
    ...    - Go to User Management.
    ...    - Select an Active user and open the User details page.
    ...
    ...    Expected Results:
    ...    - The "Reset password" button is visible.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]      BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-01    manual    CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-02: Reset password successfully when user has valid email
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify password reset email is sent when user has a valid email.
    ...    Precondition: Active user has valid email in profile.
    ...
    ...    Test Steps:
    ...    - Click "Reset password" for the Active user.
    ...
    ...    Expected Results:
    ...    - System sends system-generated password to user’s email.
    ...    - Success toast/message is shown.
    ...    - Email content matches format in ERP Admin SRS.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]      BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-02    manual    CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-03: Show error if no valid email exists
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify error handling when no email exists in user profile.
    ...    Precondition: Active user has no email.
    ...
    ...    Test Steps:
    ...    - Click "Reset password" for the Active user.
    ...
    ...    Expected Results:
    ...    - Error message displayed: prompting admin to add valid email.
    ...    - Email not sent.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]      BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-03    manual    CP-2.31.0        R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-04: Hide “Reset password” button for Deactivated users
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that the “Reset password” button is hidden when the user is deactivated.
    ...    Precondition: Facility Admin is on the User details page of a Deactivated user.
    ...
    ...    Test Steps:
    ...    - Login as Facility Admin.
    ...    - Go to User Management > Deactivated tab.
    ...    - Open User details page of a deactivated user.
    ...
    ...    Expected Results:
    ...    - “Reset password” button is not visible.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-MANAGEMENT-RESET-PASSWORD-04    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-PROFILE-AVATAR-01: Default avatar display
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that a default avatar is displayed when the user has not uploaded a custom avatar.
    ...    Precondition:
    ...    - Login as Facility Admin.
    ...    - Navigate to User Profile of a user without custom avatar uploaded.
    ...
    ...    Test Steps:
    ...    - Open the User Profile page.
    ...    - Observe the avatar section.
    ...
    ...    Expected Results:
    ...    - A default avatar (placeholder icon) is displayed.
    ...    - The default avatar should be consistent across users without custom avatars.

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-PROFILE-AVATAR-01    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-PROFILE-AVATAR-02: Custom avatar display
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that a custom avatar is displayed correctly when the user has uploaded one.
    ...    Precondition:
    ...    - Login as Facility Admin.
    ...    - Navigate to User Profile of a user with a custom avatar uploaded.
    ...
    ...    Test Steps:
    ...    - Open the User Profile page.
    ...    - Observe the avatar section.
    ...
    ...    Expected Results:
    ...    - The uploaded custom avatar image is displayed.
    ...    - The avatar image is rendered correctly (no distortion, broken link, or incorrect cropping).

    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-PROFILE-AVATAR-02    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-01: Show dynamic portal list based on user roles
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that the dropdown in the User Profile displays a list of accessible portals based on the roles assigned to the user.
    ...    Precondition: User is logged in and has one or more roles assigned.
    ...
    ...    Test Steps:
    ...    - Login as a user with known role-to-portal mapping.
    ...    - Click on the User Profile icon (top right).
    ...
    ...    Expected Results:
    ...    - Dropdown expands and shows a list of portals the user can access.
    ...    - Each portal is labeled clearly.
    ...    - Each label links to the correct portal URL.
    ...    - “Sign out” is always shown at the bottom of the dropdown.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-01    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-02: Show only “Sign out” if no accessible portal
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that if a user has no accessible portal (e.g., only Admin role), only the “Sign out” option is displayed.
    ...    Precondition: User has roles with no mapped portal access.
    ...
    ...    Test Steps:
    ...    - Login as a user with Admin role only (or equivalent).
    ...    - Open the User Profile dropdown.
    ...
    ...    Expected Results:
    ...    - The dropdown only contains the “Sign out” option.
    ...    - No other portal entries are shown.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-02    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-03: No duplicate portals for overlapping roles
    [Documentation]    Author: Thanh Tieu
    ...    Description: Ensure that no duplicate portal entries appear in the dropdown even if user gets access to the same portal via multiple roles.
    ...    Precondition: User has multiple roles that map to the same portal.
    ...
    ...    Test Steps:
    ...    - Login as a user with overlapping roles.
    ...    - Open the dropdown from the profile icon.
    ...
    ...    Expected Results:
    ...    - Portal A is listed only once, even if granted via multiple roles.
    ...    - All entries are unique.
    ...    - Sign out option is still displayed last.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-03    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-04: Navigation works correctly when clicking portal entry
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that clicking each portal link in the dropdown redirects user to the correct portal.
    ...    Precondition: User is logged in and has access to multiple portals.
    ...
    ...    Test Steps:
    ...    - Click User Profile.
    ...    - Click one of the portal entries.
    ...
    ...    Expected Results:
    ...    - User is navigated to the correct portal based on selection.
    ...    - URL is correct and user is logged in.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu
    
    [Tags]    BF-MERCY-FACILITY-ADMIN-USER-PROFILE-DROPDOWN-NAVIGATION-04    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-RESET-MFA-01: Display “Reset MFA” button conditionally
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that the “Reset MFA” button is displayed only when the Mercy user has already set up MFA (i.e., has Day phone number).
    ...    Precondition: Logged in as Mercy Admin, viewing User Details page.
    ...
    ...    Test Steps:
    ...    - Go to a Mercy user who has Day phone number set up (MFA enabled).
    ...    - Observe the Day phone number field.
    ...
    ...    Expected Results:
    ...    - The “Reset MFA” button is displayed next to Day phone number field.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-RESET-MFA-01    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-RESET-MFA-02: Hide “Reset MFA” button if user has not set up MFA
    [Documentation]    Author: Thanh Tieu
    ...    Description: Ensure that the “Reset MFA” button is hidden when the user has not set up MFA (Day phone number is empty).
    ...    Precondition: Mercy user without Day phone number.
    ...
    ...    Test Steps:
    ...    - Open User Detail page of a Mercy user without MFA set.
    ...
    ...    Expected Results:
    ...    - “Reset MFA” button is not visible next to Day phone number.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-RESET-MFA-02    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-RESET-MFA-03: Show confirmation modal when clicking “Reset MFA”
    [Documentation]    Author: Thanh Tieu
    ...    Description: Clicking on “Reset MFA” shall display a confirmation modal with “Reset MFA” and “Cancel” buttons.
    ...
    ...    Test Steps:
    ...    - Click on “Reset MFA” button.
    ...
    ...    Expected Results:
    ...    - A modal appears with text asking for confirmation.
    ...    - “Reset MFA” and “Cancel” buttons are displayed.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-RESET-MFA-03    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-RESET-MFA-04: Reset MFA successfully
    [Documentation]    Author: Thanh Tieu
    ...    Description: Confirm that clicking “Reset MFA” button in the modal resets MFA successfully and shows correct message.
    ...
    ...    Test Steps:
    ...    - Open the confirmation modal.
    ...    - Click “Reset MFA”.
    ...
    ...    Expected Results:
    ...    - MFA reset is successful.
    ...    - Show message: “MFA has been successfully reset. The user have to set it up again at next sign-in.”
    ...    - Day phone number field is cleared.
    ...    - User’s sessions are terminated.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-RESET-MFA-04    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-RESET-MFA-05: Handle failure when resetting MFA
    [Documentation]    Author: Thanh Tieu
    ...    Description: Ensure proper error handling and messaging when the reset MFA action fails.
    ...
    ...    Test Steps:
    ...    - Trigger MFA reset when backend service fails.
    ...
    ...    Expected Results:
    ...    - Show message: “Failed to reset MFA. Please try again or contact support if the issue persists.”
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-RESET-MFA-05    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-RESET-MFA-06: Cancel resetting MFA from modal
    [Documentation]    Author: Thanh Tieu
    ...    Description: Verify that clicking “Cancel” in the confirmation modal closes the modal without performing any action.
    ...
    ...    Test Steps:
    ...    - Open modal via “Reset MFA”.
    ...    - Click “Cancel”.
    ...
    ...    Expected Results:
    ...    - Modal is closed.
    ...    - No change to Day phone number.
    ...    - MFA is not reset.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu


    [Tags]    BF-MERCY-FACILITY-ADMIN-RESET-MFA-06    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-MERCY-FACILITY-ADMIN-RESET-MFA-07: User is prompted to set up MFA on next login
    [Documentation]    Author: Thanh Tieu
    ...    Description: After successful MFA reset, user is forced to set up MFA again at the next login.
    ...
    ...    Test Steps:
    ...    - Reset MFA for user.
    ...    - Logout.
    ...    - Login again as that user.
    ...
    ...    Expected Results:
    ...    - System prompts for MFA setup immediately after login.
    ...
    ...    **Others
    ...    Update date: 6/17/2025 - Thanh Tieu

    [Tags]    BF-MERCY-FACILITY-ADMIN-RESET-MFA-07    manual    CP-2.31.0        R1
    Manual Should Be Passed    ${TEST_NAME}    ${TEST_DOCUMENTATION}
















