*** Settings ***
Documentation   Test Suite - Support Portal - RMA tickets page
Metadata    sid     BSP-SUPPORT-RMA
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_support_portal/lib/ConfigHandler.py    ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-SUPPORT-RMA     web
Test Timeout    1h

*** Test Cases ***

# * VIEW LIST - NEW
BSP-SUPPORT-RMA-VIEWLIST-NEW-01: Observe the RMA list section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the RMA list section
    ...
    ...     Precondition:
    ...     - 1. The SS is on RMA Request page
    ...
    ...     Test Steps:
    ...    - 1. Observe the RMA list section
    ...
    ...     Expected Results:
    ...    - 1. There should be a list with the following attributes:
    ...     - RMA ID
	...		- Requester
    ...     - Requester Role
    ...     - Inbound Devices: The user can view the inbound devices Information quick access panel by clicking on it
    ...     - Request Date

    [Tags]    BSP-SUPPORT-RMA-VIEWLIST-NEW-01   FRS-018-02    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEWLIST-NEW-02: The user hovers over on each row
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user hovers on each row
    ...
    ...     Precondition:
    ...     - 1. The SS is on the RMA request page
    ...
    ...     Test Steps:
    ...     - 1. The user hovers over on each row
	...		- 2. The user clicks on the [View] button
    ...
    ...     Expected Results:
    ...     - 1. There should a [Edit] button
	...		- 2. The user should navigated to the ticket detail page

    [Tags]    BSP-SUPPORT-RMA-VIEWLIST-NEW-02   FRS-018-02    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEWLIST-NEW-03: Sort the RMA ticket list by RMA ID
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort the RMA ticket list by RMA ID
    ...
    ...     Precondition:
    ...     - 1. The SS is on the RMA request page
    ...
    ...     Test Steps:
    ...     - 1. Observe the sort order of the list
    ...     - 2. The user selects the [Sort] button next to the RMA ID
    ...
    ...     Expected Results:
    ...     - 1. The list should be sorted by RMA ID in chronological order.
    ...     - 2. The list will switch the sorting order between descending and ascending order of the RMA ID

    [Tags]    BSP-SUPPORT-RMA-VIEWLIST-NEW-03   FRS-018-02    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEWLIST-NEW-04: Pagination-Move to other pages
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the pagination to move to other pages
    ...
    ...     Precondition:
    ...     - 1. The SS is on the RMA page
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

    [Tags]    BSP-SUPPORT-RMA-VIEWLIST-NEW-04   FRS-018-02    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEWLIST-NEW-05: Pagination-View quantity of tickets display per page
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View quantity of tickets display per page
    ...
    ...     Precondition:
    ...     - 1. The SS is on the RMA page
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

    [Tags]    BSP-SUPPORT-RMA-VIEWLIST-NEW-05   FRS-018-02    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#SEARCH
BSP-SUPPORT-RMA-SEARCH-NEW-01: Observe the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the search bar
    ...
    ...     Precondition:
    ...     - 1. A Support Staff is on the RMA request tab
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...
    ...     Expected Results:
    ...     - 1. The default search parameter for Device ID, with a string saying “Search by Device ID"

    [Tags]    BSP-SUPPORT-RMA-SEARCH-NEW-01    FRS-019-01    R1   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-SEARCH-NEW-02: Search options
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search options
    ...
    ...     Precondition:
    ...     - 1. A Support Staff is on the RMA request tab
    ...
    ...     Test Steps:
    ...     - 1. The user clicks on the [Search option] button
    ...
    ...     Expected Results:
    ...     - 1. The tickets should be able to be searched by the following criteria:
    ...     - Requester
    ...     - Device ID
    ...     - RMA ID
    ...     - Facility Name

    [Tags]    BSP-SUPPORT-RMA-SEARCH-NEW-02    FRS-019-01    R1   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-SEARCH-NEW-03: Enter a RMA ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a RMA ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. A Support Staff is on the RMA request tab
    ...
    ...     Test Steps:
    ...     - 1. The user selects "RMA ID" option
    ...     - 2. Enter a RMA ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered RMA ID

    [Tags]    BSP-SUPPORT-RMA-SEARCH-NEW-03       FRS-019-01    R1   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-SEARCH-NEW-05: Enter a Device ID into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Device ID into the search bar
    ...
    ...     Precondition:
    ...     - 1. A Support Staff is on the RMA request tab
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Device ID" option
    ...     - 2. Enter a Device ID into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered Device ID

    [Tags]    BSP-SUPPORT-RMA-SEARCH-NEW-05       FRS-019-01        R1      SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-SEARCH-NEW-07: Enter a Facility name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Facility name into the search bar
    ...
    ...     Precondition:
    ...     - 1. A Support Staff is on the RMA request tab
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Facility Name" option
    ...     - 2. Enter a Facility name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered name

    [Tags]    BSP-SUPPORT-RMA-SEARCH-NEW-07    FRS-019-01    R1   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-SEARCH-NEW-11: Enter a Requester name into the search bar
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter a Requester name into the search bar
    ...
    ...     Precondition:
    ...     - 1. A Support Staff is on the RMA request tab
    ...
    ...     Test Steps:
    ...     - 1. The user selects "Requester" option
    ...     - 2. Enter a "Requester" name into the search bar
    ...
    ...     Expected Results:
    ...     - 1. The list shall be filtered and displayed accordingly with the entered name

    [Tags]    BSP-SUPPORT-RMA-SEARCH-NEW-11      FRS-019-01    R1   SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE
BSP-SUPPORT-RMA-CREATE-01: Observe the Device type modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Device type to create RMA Request
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on New tab, RMA request is on the RMA request tab
    ...
    ...     Test Steps:
    ...    - 1. Click on [New RMA] button
    ...    - 2. Observe the modal prompting
    ...
    ...     Expected Results:
    ...    - 1.There shall be a modal prompting the user to select the device type:
    ...     There shall be 3 options: “Bioflux/Biotres”, “Bioheart”, “Biokit”
    ...    - 2.There shall be “Cancel” and “Next” buttons
    ...    - 3.“Cancel” button exits the modal
    ...    - 4.“Next” button proceeds into creating the RMA ticket page for the selected device type

    [Tags]    BSP-SUPPORT-RMA-CREATE-01    RS-20-01   SC-1.14.0    manual    R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#VIEW - QUICK ACCESS
BSP-SUPPORT-RMA-QA-01: Check that the RMA device are displayed correctly in Inbound Devices sidebar
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: RMA device are displayed correctly in Inbound Devices sidebar
    ...
    ...     Precondition:
    ...     - 1. The SS is on RMA Request page
    ...
    ...     Test Steps:
    ...     - 1. Click hyperlink for a Inbound RMA devices to open sidebar
    ...     - 2. Observe information sidebar
    ...
    ...     Expected Results:
    ...     - 1. RMA devices are displayed correctly in the format
    ...     + Device ID
    ...     + Reason for RMA
    ...     + Failure Analysis
    ...     + RMA Resolution
    ...     + RMA Billing Resolution

    [Tags]    BSP-SUPPORT-RMA-QA-01    RS-037-01    R1    manual    SC-1.14.0     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-QA-03: Check that Facility Information quick access is displayed when clicking hyperlink
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: Facility Information quick access is displayed when clicking hyperlink
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details
    ...     - 2. The SS is on RMA Request page
	...
	...     Test Steps:
	...     - 1. Click Facility name hyperlink on each row of the list
	...     - 2. Click Facility name hyperlink is on header
	...     - 3. Observe the quick access sidebar
	...
	...     Expected Results:
	...     - 1. User is able to click the hyperlink
	...     - 2. The quick access is displayed
	...     - 3. The Facility details in quick access match information in ticket

    [Tags]	BSP-SUPPORT-RMA-QA-03   manual    SC-1.14.0     R1
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-QA-04: Quick access to Patient Impact Information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Quick access to Patient Impact Information
    ...
    ...     Precondition:
	...		- 1.In the create ticket page. Next to the “Patient Impact” attribute on the lists should be a [Help] button.
	...		- 2.In the detail page of the new ticket, RMA request page. Next to the “Patient Impact” attribute on the lists should be a [Help] button.
    ...
    ...     Test Steps:
	...		- 1. Clicking on the [Help] button
    ...
    ...     Expected Results:
    ...     - 1. The Patient Impact quick access sidebar that displays the following:
    ...     - None: No impact from the use of the device.
    ...     - Patient Injury: The patient suffered injury or bodily impairment sustained from the use of the device (e.g., shock, burn, allergic reaction, choking, etc.).
    ...     - Medical Intervention: The patient required medical intervention to prevent injury or death from the use of the device.
    ...     - Patient Death: The patient suffered lethal damage from the use of the device.
    ...     - Unknown: The impact on the patient is undefined.

    [Tags]    BSP-SUPPORT-RMA-QA-04    RS-040-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-QA-05: Quick Access to Bioflux/Biotres Device details Information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick Access to Device details Information
    ...
    ...     Precondition:
	...		- 1. The SS is on create ticket page
	...		- 2. The SS is on New ticket details page
    ...
    ...     Test Steps:
    ...     -1. Click device's hyperlink to open sidebar
    ...
    ...     Expected Results:
    ...     - There should be a sidebar that displays the following device details:
    ...     - 1. General Information
    ...     - Facility
    ...     - Model
    ...     - Firmware version
    ...     - Timezone
    ...     -  SIM ICCID
    ...     - Operator
    ...     - Network mode
    ...     - Status
    ...     2. Last synced status
    ...     - RSSI o Lead on
    ...     - Battery level
    ...     - SD card free space
    ...     - Charging state
    ...     - Last connect

    [Tags]    BSP-SUPPORT-RMA-QA-05    FRS-039-01    manual     R1
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#COMMENT
BSP-SUPPORT-RMA-COMMENT-01: Check the "New Comment" icon in the list of new RMA
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: There is a "New Comment" icon next to the RMA ID in the case there is at least an unread comment
    ...
    ...     Precondition:
    ...    - 1. The user creates a RMA request from Clinic portal (add comment)
    ...    - 2. The user adds comment for the RMA ticket in the the new tab
    ...    - 3. This comment is unread
    ...
    ...     Test Steps:
    ...    - 1. Observe the list of new ticket
    ...
    ...     Expected Results:
    ...    - 1. There is a "New Comment" icon displayed when there is at least an unread comment

    [Tags]    BSP-SUPPORT-RMA-COMMENT-01    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-02: Check the "Comment" icon in the list of new RMA
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: There is a  "Comment" icon next to the RMA ID in the case there is an read comment
    ...
    ...     Precondition:
    ...    - 1. The user creates a RMA request from Clinic portal (add comment)
    ...     or The user adds comment for the RMA ticket in the the new tab
    ...    - 2. This comment is read
    ...
    ...     Test Steps:
    ...    - 1. Observe the list of new ticket
    ...
    ...     Expected Results:
    ...    - 1. There is a  "Comment" icon displayed

    [Tags]    BSP-SUPPORT-RMA-COMMENT-02    RS-044-01    R2    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-03: Check the comment icon the case the read comment is edited
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Display the read comment icon in the case the read comment is editted
    ...
    ...     Precondition:
    ...    - 1. The comment is read
    ...    - 2. The user edits the comment
    ...
    ...     Test Steps:
    ...    - 1. Observe the in the list
    ...
    ...     Expected Results:
    ...    - 1. Display read icon

    [Tags]    BSP-SUPPORT-RMA-COMMENT-03    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-04: Check the comment icon the case the unread comment is edited
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Display the unread icon in the case the unread comment is editted
    ...
    ...     Precondition:
    ...    - 1. The comment is unread
    ...    - 2. The comment ownwe edits the comment
    ...
    ...     Test Steps:
    ...    - 1. Observe the icon
    ...
    ...     Expected Results:
    ...    - 1. Display unread icon

    [Tags]    BSP-SUPPORT-RMA-COMMENT-04    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-05: Check the icon in the case all the comments (read) is deleted
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - 1. There are some read comments
    ...
    ...     Test Steps:
    ...    - 1. Delete all comments
    ...    - 2. Observe the icon
    ...
    ...     Expected Results:
    ...    - 1. Read icon displayed (no comment displayed in the comment sidebar)

    [Tags]    BSP-SUPPORT-RMA-COMMENT-05    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-06: Check the comment icon in the case all the unread comments is deleted
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - 1. There are some unread comments
    ...
    ...     Test Steps:
    ...    - 1. Delete all comments
    ...    - 2. Observe the icon
    ...
    ...     Expected Results:
    ...    - 1. Read icon displayed (no comment inside)

    [Tags]    BSP-SUPPORT-RMA-COMMENT-06    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-07: Check the comment icon in the case all the comments (read/unread) is deleted
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - 1. There are some unread/read comment
    ...
    ...     Test Steps:
    ...    - 1. Delete all comments
    ...    - 2. Observe the icon
    ...
    ...     Expected Results:
    ...    - 1. Read icon displayed (no comment inside)

    [Tags]  BSP-SUPPORT-RMA-COMMENT-07    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-08: View the comment sidebar in the case there is no comment yet
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the comment sidebar in the case there is no comment yet
    ...
    ...     Precondition:
    ...    - 1. The user is on the detail page of the new ticket
    ...
    ...     Test Steps:
    ...    - 1. Click on the comment button in the RMA ticket details page’s header
    ...    - 2. Observe the sidebar in the case there is no comment yet
    ...
    ...     Expected Results:
    ...    - 1. Comment textbox
    ...    - 2. “Add comment” button

    [Tags]    BSP-SUPPORT-RMA-COMMENT-08    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-09: View the comment sidebar in the case there is a/some read comments
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the comment sidebar in the case there is a/some read comments
    ...
    ...     Precondition:
    ...    - 1. The user is on the detail page of the new ticket
    ...    - 2. There is a/some comment (read)
    ...
    ...     Test Steps:
    ...    - 1. Click on the comment button in the RMA ticket details page’s header
    ...    - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...    - 2. Comments are separated by dates
    ...    - 3. Each comment shall display the following:
    ...     - Profile image
    ...     - Full Name
    ...     - Time – relative to the user
    ...     - Comment content
    ...    - 4. Comment textbox
    ...    - 5. “Add comment” button

    [Tags]    BSP-SUPPORT-RMA-COMMENT-09    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-10: View the comment sidebar in the case there is a new comment submitted by OM
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the comment sidebar in the case there is a new comment
    ...
    ...     Precondition:
    ...    - 1. The user is on the detail page of the new ticket
    ...    - 2. There is a/some new comment (unread)
    ...
    ...     Test Steps:
    ...    - 1. Click on the comment button in the RMA ticket details page’s header
    ...    - 2. Observe the sidebar (Not the submitter - another OM, OS, Support Staff)
    ...
    ...     Expected Results:
    ...     The following will happen for everyone but the comment submitter
    ...    - 1.The “Comment” button in the RMA ticket details shall have a notification
    ...     indicating there’s a new comment (red dot)
    ...    - 2.There shall be a “Last read” line that separates between read and unread comments
    ...    - 3. Comments are separated by dates
    ...    - 4. Each comment shall display the following:
    ...     - Profile image
    ...     - Full Name
    ...     - Time – relative to the user
    ...     - Comment content
    ...    - 5. Comment textbox
    ...    - 6. “Add comment” button

    [Tags]    BSP-SUPPORT-RMA-COMMENT-10    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-11: The user inputs their comment into comment textbox
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user inputs their comment into comment textbox
    ...
    ...     Precondition:
    ...    - 1. The user is on the detail page of the new ticket
    ...
    ...     Test Steps:
    ...    - 1. Click on the comment button in the RMA ticket details page’s header
    ...    - 2. Input their comment into the comment textbox (contains break line)
    ...    - 3. Click on "Add comment" button
    ...
    ...     Expected Results:
    ...    - 1. The comment shall be added to the list

    [Tags]    BSP-SUPPORT-RMA-COMMENT-11    RS-044-01    R2   SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-12: Click on “Add comment” button when the comment textbox is empty
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on “Add comment” button when the comment textbox is empty or only contains spaces
    ...
    ...     Precondition:
    ...    - 1. The user is on the detail page of the new ticket
    ...
    ...     Test Steps:
    ...    - 1. Click on the comment button in the RMA ticket details page’s header
    ...    - 2. Observe the "Add comment" button when the textbox is empty or only contains spaces
    ...
    ...     Expected Results:
    ...    - 1.The button shall be disabled

    [Tags]    BSP-SUPPORT-RMA-COMMENT-12    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-13: Check the option when the comment owner clicks on "More" button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the option when clicking on "More" button
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button
    ...
    ...     Expected Results:
    ...    - 1. "More" button shall be displayed
    ...    - 2. Containing 2 options: Edit and Delete

    [Tags]    BSP-SUPPORT-RMA-COMMENT-13    RS-044-01    R2   SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-14: The person who is not the comment owner hovering over the comment
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The person who is not the comment owner hovering over the comment
    ...
    ...     Precondition:
    ...    - 1. The OS is on the comment sidebar and there is a comment added by OM
    ...
    ...     Test Steps:
    ...    - 1. As an OS, hovering over the comment that is added by OM
    ...
    ...     Expected Results:
    ...    - 1. "More" button shall not be displayed

    [Tags]    BSP-SUPPORT-RMA-COMMENT-14    RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-15: The person who is not the comment owner hovering over the comment
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The person who is not the comment owner hovering over the comment
    ...
    ...     Precondition:
    ...    - 1. The OM is on the comment sidebar and there is a comment added by OS
    ...
    ...     Test Steps:
    ...    - 1. As an OM, hovering over the comment that is added by OS
    ...
    ...     Expected Results:
    ...    - 1. "More" button shall not be displayed

    [Tags]    BSP-SUPPORT-RMA-COMMENT-15     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-18: The person who is not the comment owner hovering over the comment
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The person who is not the comment owner hovering over the comment
    ...
    ...     Precondition:
    ...    - 1. The OM is on the comment sidebar and there is a comment added by Support Staff
    ...
    ...     Test Steps:
    ...    - 1. As an OM, hovering over the comment that is added by Support Staff
    ...
    ...     Expected Results:
    ...    - 1. "More" button shall not be displayed

    [Tags]    BSP-SUPPORT-RMA-COMMENT-18      RS-044-01    R2        SC-1.14.0         manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-19: The person who is not the comment owner hovering over the comment
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The person who is not the comment owner hovering over the comment
    ...
    ...     Precondition:
    ...    - 1. The OS is on the comment sidebar and there is a comment added by Support Staff
    ...
    ...     Test Steps:
    ...    - 1. As an OS, hovering over the comment that is added by Support Staff
    ...
    ...     Expected Results:
    ...    - 1. "More" button shall not be displayed

    [Tags]    BSP-SUPPORT-RMA-COMMENT-19     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-20: The comment owner edits the comment
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The comment owner clicks on the "Edit" button
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button
    ...    - 3. Click on the "Edit" button
    ...
    ...     Expected Results:
    ...    - 1. The user shall be allowed to edit the content of the comment
    ...    - 2. There is "Cancel" and "Save" button

    [Tags]    BSP-SUPPORT-RMA-COMMENT-20     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-21: The comment owner edits the comment
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The comment owner edits the comment
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button, then clicking on the "Edit" button
    ...    - 3. Edit the content of the comment
    ...    - 4. Clicks on "Save" button
    ...
    ...     Expected Results:
    ...    - 1. The “Save” shall save the comment changes and exit editing
    ...    - 2. The comment content shall have “(Edited)” the edit was saved

    [Tags]    BSP-SUPPORT-RMA-COMMENT-21     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-22: The comment owner edits the comment and clicks on "Cancel"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The comment owner edits the comment and cancels
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button, then clicking on the "Edit" button
    ...    - 3. Edit the content of the comment
    ...    - 4. Clicks on "Cancel" button
    ...
    ...     Expected Results:
    ...    - 1. The “Cancel” shall exit editing without making any changes

    [Tags]    BSP-SUPPORT-RMA-COMMENT-22     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-23: Observe the confirmation modal when clicks on "Delete" option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the confirmation modal when clicks on "Delete" option
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button, then clicking on the "Delete" button
    ...    - 3. Observe the modal
    ...
    ...     Expected Results:
    ...    - 1. There is a modal displayed with the message “This action cannot be undone.
    ...     Are you sure you want to delete this comment?”
    ...    - 2. There shall be “Delete” and “Cancel” button

    [Tags]    BSP-SUPPORT-RMA-COMMENT-23     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-24: The comment owner selects "Delete" option in the confirmation modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The comment owner selects "Delete" option in the confirmation modal
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button, then clicking on the "Delete" button
    ...    - 3. Edit the content of the comment
    ...    - 4. Clicks on "Delete" button
    ...
    ...     Expected Results:
    ...    - 1. “Delete” shall delete the comment and exit the modal

    [Tags]    BSP-SUPPORT-RMA-COMMENT-24     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-25: The comment owner selects "Cancel" option in the confirmation modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The comment owner selects "Cancel" option in the confirmation modal
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button, then clicking on the "Delete" button
    ...    - 3. Edit the content of the comment
    ...    - 4. Clicks on "Cancel" button
    ...
    ...     Expected Results:
    ...    - 1. "Cancel” shall exit the modal without deleting the comment

    [Tags]    BSP-SUPPORT-RMA-COMMENT-25     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-26: The comment owner selects "Cancel" option in the confirmation modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The comment owner selects "Cancel" option in the confirmation modal
    ...
    ...     Precondition:
    ...    - 1. The comment owner is on the comment sidebar and there is a comment added
    ...
    ...     Test Steps:
    ...    - 1. As the comment owner, hovering over the comment
    ...    - 2. Click on the "More" button, then clicking on the "Delete" button
    ...    - 3. Edit the content of the comment
    ...    - 4. Clicks on "Cancel" button
    ...
    ...     Expected Results:
    ...    - 1. "Cancel” shall exit the modal without deleting the comment

    [Tags]    BSP-SUPPORT-RMA-COMMENT-26     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-27: Check the "Last read" line
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the "Last read" line
    ...
    ...     Precondition:
    ...    - 1. The OM is on the detail page of the new ticket
    ...    - 2. The OM submits a comment
    ...
    ...     Test Steps:
    ...    - 1. The OS view the comment
    ...    - 3. The Support Staff view the ticket
    ...
    ...     Expected Results:
    ...    - 1. The Support Staff on Support Portal shall see the “New Comment” icon, red dot, "Last read" line

    [Tags]    BSP-SUPPORT-RMA-COMMENT-27     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-28: View the comment sidebar in the case there is a new comment
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the comment sidebar in the case there is a new comment
    ...
    ...     Precondition:
    ...    - 1. The user is on the detail page of the new ticket
    ...    - 2. There is a/some new comment (unread)
    ...
    ...     Test Steps:
    ...    - 1. Click on the comment button in the RMA ticket details page’s header
    ...    - 2. Observe the sidebar
    ...
    ...     Expected Results:
    ...    - 1.
    ...    - 2. Comments are separated by dates
    ...    - 3. Each comment shall display the following:
    ...     - Profile image
    ...     - Full Name
    ...     - Time – relative to the user
    ...     - Comment content
    ...    - 4. Comment textbox
    ...    - 5. “Add comment” button

    [Tags]    BSP-SUPPORT-RMA-COMMENT-28     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-29: View the “New Comment” icon, red dot by the owner (OM submit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The “New Comment” icon, red dot shall not change (Support-S&D)
    ...     when the comment owner view the their comment,
    ...
    ...     Precondition:
    ...    - 1. The OM is on the detail page of the new ticket
    ...    - 2. The OM submits a comment
    ...
    ...     Test Steps:
    ...    - 1. The OM clicks on the comment button in the RMA ticket details page’s header (view OM's comment)
    ...    - 2. Exist the sidebar
    ...    - 3. Check the “New Comment” icon, red dot with OS account
    ...    - 4. Check the “New Comment” icon, red dot with another OM account
    ...    - 5. Check the “New Comment” icon, red dot with Support staff, Support portal
    ...
    ...     Expected Results:
    ...    - 1. The Support Staff on Support Portal, The OS, another OM account
    ...     shall see the “New Comment” icon, red dot
    ...     (The owner view the comment after exsiting the sidebar shall not affect to notification of another user)

    [Tags]    BSP-SUPPORT-RMA-COMMENT-29     RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-30: View the “New Comment” icon, red dot by another OM (OM submit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - 1. The OM is on the detail page of the new ticket
    ...    - 2. The OM submits a comment
    ...
    ...     Test Steps:
    ...    - 1. The another OM clicks on the comment button in the RMA ticket details page’s header (view OM's comment)
    ...    - 2. Exist the sidebar
    ...    - 3. Check the “New Comment” icon, red dot with OS account
    ...    - 4. Check the “New Comment” icon, red dot with another OM account
    ...    - 5. Check the “New Comment” icon, red dot with Support staff, Support portal
    ...
    ...     Expected Results:
    ...    - 1. The Support Staff on Support Portal shall see the “New Comment” icon, red dot,
    ...    - 2. Another OM shall not see the “New Comment” icon, red dot,
    ...    - 2.The OS shall not see “New Comment” icon, red dot,

    [Tags]    BSP-SUPPORT-RMA-COMMENT-30    RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-31: View the “New Comment” icon, red dot by OS (OM submit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - 1. The OM is on the detail page of the new ticket
    ...    - 2. The OM submits a comment
    ...
    ...     Test Steps:
    ...    - 1. The OS clicks on the comment button in the RMA ticket details page’s header (view OM's comment)
    ...    - 2. Exist the sidebar
    ...    - 4. Check the “New Comment” icon, red dot with OM account, another OM account
    ...    - 5. Check the “New Comment” icon, red dot with Support staff, Support portal
    ...
    ...     Expected Results:
    ...    - 1. The Support Staff on Support Portal shall see the “New Comment” icon, red dot,
    ...    - 2. Another OM shall not see the “New Comment” icon, red dot,
    ...    - 2.The OM account, another OM account shall not see “New Comment” icon, red dot,

    [Tags]    BSP-SUPPORT-RMA-COMMENT-31    RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-32: View the “New Comment” icon, red dot by Support Staff (OM submit)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...    - 1. The OM is on the detail page of the new ticket
    ...    - 2. The OM submits a comment
    ...
    ...     Test Steps:
    ...    - 1. The Support Staff clicks on the comment button in the RMA ticket details page’s header (view OM's comment)
    ...    - 2. Exist the sidebar
    ...    - 4. Check the “New Comment” icon, red dot with another OM account
    ...    - 5. Check the “New Comment” icon, red dot with OS account
    ...
    ...     Expected Results:
    ...    - 1. The OS account shall see the “New Comment” icon, red dot,
    ...    - 2. Another OM account shall not see the “New Comment” icon, red dot,

    [Tags]    BSP-SUPPORT-RMA-COMMENT-32      RS-044-01    R2    SC-1.14.0      manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-COMMENT-33: Click on “Add comment” button when the comment textbox only contains spaces
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on “Add comment” button when the comment textbox only contains spaces
    ...  (Update SRS)
    ...     Precondition:
    ...    - 1. The user is on the detail page of the new ticket
    ...
    ...     Test Steps:
    ...    - 1. Click on the comment button in the RMA ticket details page’s header
    ...    - 2. Observe the "Add comment" button when the textbox only contains spaces
    ...
    ...     Expected Results:
    ...    - 1.The button shall be disabled

    [Tags]    BSP-SUPPORT-RMA-COMMENT-33      RS-044-01    R2    SC-1.14.0       manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BIOFT - CREATE NEW
BSP-SUPPORT-RMA-CREATE-BIOFT-01: Select device type "Bioflux/Biotres" in the Device type modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select Bioflux/Biotres in the modal to create RMA Request
    ...
    ...     Precondition:
    ...    - 1.. The user is on the RMA request tab, Support potal
    ...
    ...     Test Steps:
    ...    - 1. Click on [New RMA] button
    ...    - 2. Select "Bioflux/Biotres" option in the modal, click [Next button]
    ...    - 3. Observe the Detail page
    ...
    ...     Expected Results:
    ...    - 1.There shall be:
    ...     - Device type: Bioflux/Biotres in the header
    ...     - Customer information section
    ...     - Shipping Information section
    ...     - RMA Details section
    ...     - Other Information section

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-01    FRS-20-01       R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-01: Check that user can select Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, user can select Ship from Facility
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select "Facility" option in the Inbound tab
	...     - 2. Observe this option
	...
	...     Expected Results:
	...     - 1. "Facility" option is selected.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-01   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-02: Check that hint text of sender name when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check the hint of Sender name textbox
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select "Facility" option in the Inbound tab
	...     - 2. Observe Sender name textbox
	...
	...     Expected Results:
	...     - 1. Hint text is "Enter Facility name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-02   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-03: Check that shipping information must be automatically filled in when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check shipping information must be automatically filled in based on Facility Information
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Observe shipping information.
	...
	...     Expected Results:
	...     - 1. Sender name and address information is automatically filled in based on Facility Information
	...     - 2. This information match Facility information.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-03   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-04: Check that shipping information can be edited when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check shipping information can be edited
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
    ...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
	...
	...     Expected Results:
	...     - 1. Address is recommended based on the input of user
	...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-04   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-05: Check that Country can be selected when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check country information can be selected in dropdown menu
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Select the country in dropdown menu
	...
	...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-05   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-06: Check that default Country is United States when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check that default Country is United States
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Observe the country in dropdown menu.
	...
	...     Expected Results:
	...     - 1. Default Country is United States.
    [Tags]	BSP-SUPPORT-RMA-CREATE-BIOFT-F-06   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-07: Check that Shipping information has Secondary Address (optional) when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, should has Secondary Address (optional) field
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Observe the Shipping information section.
	...
	...     Expected Results:
	...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-07   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-08: Check that Secondary Address can be empty when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, Secondary Address can be empty
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Leave Secondary Address blank.
	...     - 4. Enter required fields.
	...     - 5. Create ticket.
	...
	...     Expected Results:
	...     - 1. Create ticket successfully.
	...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-08   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-F-09: Check that required fields must not be empty when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check required fields must not be empty
	...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
	...     - 4. Create ticket.
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not create ticket.

	[Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-F-09   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-01: Check that user can select Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, user can select Ship from Patient
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select " Patient" option in the Inbound tab
	...     - 2. Observe this option
	...
	...     Expected Results:
	...     - 1. " Patient" option is selected

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-01   FRS-20-02    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-02: Check that hint text of sender name when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check the hint of Sender name textbox
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select "Patient" option in the Inbound tab
	...     - 2. Observe Sender name textbox
	...
	...     Expected Results:
	...     - 1. Hint text is "Enter Patient name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-02   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-03: Check that user can search Patient name when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check that patient can be searched in Sender name textbox
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search Patient name in Sender name textbox.
	...
	...     Expected Results:
	...     - 1. Recommended patient list is displayed.
	...     - 2. These patients belong to the facility using the device.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-03   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-04: Check that Patient address must be automatically filled in when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check Patient address is displayed correctly
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name textbox.
	...     - 4. After the patient address is automatically fill in, observe address information.
	...
	...     Expected Results:
	...     - 1. Address information is automatically filled in based on Patient Information
	...     - 2. This information match Patient information of this facility.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-04   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-05: Check that address information can be edited when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check address information can be edited
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name textbox.
	...     - 3. Edit the address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
	...
	...     Expected Results:
	...     - 1. Address is recommended based on the input of user
	...     - 2. Address information (address, city, state, zip code) is automatically filled in based on address input.


    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-05   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-06: Check that Country can be selected when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check country information can be selected in dropdown menu
	...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name textbox.
	...     - 4. Select the country in dropdown menu.
	...
	...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-06   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-07: Check that default Country is United States when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check that default Country is United States
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name textbox.
	...     - 4. Observe the country in dropdown menu.
	...
	...     Expected Results:
	...     - 1. Default Country is United States.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-07   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-08: Check that Shipping information has Secondary Address (optional) when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, should has Secondary Address (optional) field
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Observe the Shipping information section.
	...
	...     Expected Results:
	...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-08   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-09: Check that Secondary Address can be empty when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, Secondary Address can be empty
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name textbox.
	...     - 4. Leave Secondary Address blank.
	...     - 5. Enter required fields.
	...     - 6. Create ticket.
	...
	...     Expected Results:
	...     - 1. Create ticket successfully.
	...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-09   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-P-10: Check that required fields must not be empty when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check required fields must not be empty
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Leave address/city/state/zipcode/contact phone number/contact email blank.
	...     - 3. Create ticket.
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid..."
	...     - 2. Can not create ticket.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-P-10   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-01: Check that user can select Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, user can select Ship from Sales Rep
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select "Sales Rep" option in the Inbound tab
	...     - 2. Observe this option
	...
	...     Expected Results:
	...     - 1. " Sales Rep" option is selected

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-01   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-02: Check that hint text of sender name when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales Rep, check the hint of Sender name textbox
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select " Sales Rep" option in the Inbound tab
	...     - 2. Observe Sender name textbox
	...
	...     Expected Results:
	...     - 1. Hint text is "Enter Sales Rep name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-02   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-03: Check that shipping information must be automatically filled in when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales Rep, check shipping information must be automatically filled in based on Facility Information
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select " Sales Rep" option in the Inbound tab
	...     - 3. Observe shipping information.
	...
	...     Expected Results:
	...     - 1. Shipping information is automatically filled in based on Facility Information
	...     - 2. This information match Sales Rep information of this Facility.
    [Tags]	BSP-SUPPORT-RMA-CREATE-BIOFT-S-03   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-04: Check that shipping information can be edited when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales Rep, check shipping information can be edited
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select " Sales Rep" option in the Inbound tab
	...     - 3. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
	...
	...     Expected Results:
	...     - 1. Address is recommended based on the input of user.
	...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-04   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-05: Check that Country can be selected when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales Rep, check country information can be selected in dropdown menu
	...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Sales Rep" option in the Inbound tab
	...     - 3. Select the country in dropdown menu
	...
	...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-05   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-06: Check that default Country is United States when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales Rep, check that default Country is United States
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Sales Rep" option in the Inbound tab
	...     - 3. Observe the country in dropdown menu.
	...
	...     Expected Results:
	...     - 1. Default Country is United States.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-06   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-07: Check that Shipping information has Secondary Address (optional) when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales Rep, should has Secondary Address (optional) field
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Sales Rep" option in the Inbound tab
	...     - 3. Observe the Shipping information section.
	...
	...     Expected Results:
	...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-07   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-08: Check that Secondary Address can be empty when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales Rep, Secondary Address can be empty
	...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Sales Rep" option in the Inbound tab
	...     - 3.  Leave Secondary Address blank.
	...     - 4. Enter required fields.
	...     - 5. Create ticket.
	...
	...     Expected Results:
	...     - 1. Create ticket successfully.
	...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-08   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOFT-S-09: Check that required fields must not be empty when Ship from Sales Rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check required fields must not be empty
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Select Facility name in Facility Information section.
	...     - 2. Select "Sales Rep" option in the Inbound tab
	...     - 3. Leave sender name/address/city/state/zipcode/contact phone number/contact email blank.
	...     - 3. Create ticket.
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid..."
	...     - 2. Can not create ticket.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOFT-S-09   FRS-20-02    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#VIEW NEW - BIOFT
BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-01: Check that New RMA Request ticket details must be fully displayed.
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, should be displayed fully information
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
    ...     Test Steps:
	...     - 1. Observe the page.
	...
	...     Expected Results:
	...     - 1. The page must be displayed fully information:
	...     - + Header (RMA ID, Device type, Request Date, Customer)
	...     - + RMA Details (Device ID, Reason for RMA, Date of Event, Patient Impact)
	...     - + Shipping/Returning Address (Sender/Recipient Name, Country, City, Address, State, Zip code, Contact Phone Number, Contact Email)
	...     - + Notification email
	...     - + Notes
	...     - + Clinic notes: display the note from the clinic portal
	...     - + If there is no Clinic notes there shall be a message "There is are Clinic notes"

    [Tags]    BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-01    FRS-021-01    R1     manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-02: Check that sender information must have Sender name field
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, sender information must have Sender name field
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Observe the sender information
	...
	...     Expected Results:
	...     - 1. Sender information has Sender name field
	...     - 2. Sender name match Sender name in ticket details

    [Tags]    BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-02    FRS-021-01    R1     manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-03: Check that sender information must have Secondary Address field (optional)
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, sender information must have Secondary Address field
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Observe the sender information
	...
	...     Expected Results:
	...     - 1. Sender information has Secondary Address field.
	...     - 2. Secondary Address field is optional.

    [Tags]    BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-03     FRS-021-01    R1     manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-04: Check that recipient information must have Sender name field
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, recipient information must have recipient name field
	...
    ...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Observe the recipient information
	...
	...     Expected Results:
	...     - 1. Recipient information has recipient name field
	...     - 2. Recipient name match recipient name in ticket details

	[Tags]    BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-04     FRS-021-01    R1     manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-05: Check that recipient information must have Secondary Address field (optional)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, recipient information must have Secondary Address field
	...
    ...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Observe the recipient information
	...
	...     Expected Results:
	...     - 1. Recipient information has Secondary Address field.
	...     - 2. Secondary Address field is optional.

	[Tags]    BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-05     FRS-021-01    R1     manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-06: Check that header of ticket details has Approve Request and Reject button
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, the header has Approve/Reject button
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Observe the header
	...
	...     Expected Results:
	...     - 1. The header has Approve/Reject button

    [Tags]	BSP-SUPPORT-RMA-VIEW-NEW-BIOFT-06  FRS-021-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#EDIT NEW - BIOFT
BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-01: Check that other information can be edited
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, other information can be edited
	...
	...     Precondition:
	...     - 1. The OM/OS is on New RMA tiket details 
	...     - 2. The SS is on New RMA tiket details (Support portal)
	...     - 3. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Add/Remove notification email.
	...     - 2. Edit notes and click Save button.
	...
	...     Expected Results:
	...     - 1. Notification email and notes are saved and displayed new value.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-01   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-02: Check that notification emails can not be empty
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, notification emails can not be empty
	...
    ...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Delete button at the end of each email to remove it.
	...     - 2. Remove all the email.
	...     - 3. Approve/Cancel the ticket.
	...
	...     Expected Results:
	...     - 1. Notification email field is not empty.
	...     - 2. Last notification email is saved.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-02   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-03: Check that notification emails can be entered using Space bar or [,] key
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, notification emails can be entered using Space bar or [,] key
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Press the [Space bar] or [,] key to complete an email.
	...
	...     Expected Results:
	...     - 1. The emails are entered.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-03   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-04: Check that sender address can be edited.
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, sender address can be edited
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Sender Address section
	...     - 2. Edit valid Sender name/country/address/secondary address/city/state/zip code/contact phone number/contact email.
	...     - 3. Click Save button.
	...     - 4. Observe the changes.
	...
	...     Expected Results:
	...     - 1. Edited information can be saved and displayed.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-04   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-05: Check that sender address edit mode must be exited when clicking Cancel button
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, sender address edit mode must be exited when clicking Cancel button
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Sender Address section
	...     - 2. Edit Sender name/country/address/secondary address/city/state/zip code/contact phone number/contact email.
	...     - 3. Click Cancel button.
	...     - 4. Observe the changes.
	...
	...     Expected Results:
	...     - 1. Exit the edit mode.
	...     - 1. The information is not changed.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-05   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-06: Check that sender address information is automatically filled in.
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, sender address information is automatically filled in based on address input
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Sender Address section
	...     - 2. Edit address field.
	...     - 3. Observe the address information.
	...
	...     Expected Results:
	...     - 1. The information is automatically filled in 3 fields namely City, State and Zip code based on address.
	...     - 2. The secondary address is blank.

	[Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-06   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-07: Check that Country in sender address can be selected
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check country information in sender address can be selected in dropdown menu
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Sender Address section
	...     - 2. Select the country in dropdown menu
	...
    ...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.
	...     - 2. Address, City, State, Zip code are blank and the suggested address changed based on country

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-07   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-08: Check that required fields in sender address must not be empty.
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check required fields in sender address must not be empty
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Sender Address section.
	...     - 2. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
	...     - 3. Click Save button and observe.
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not save the changes.

	[Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-08   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-09: Check that contact phone number in sender address is valid
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check contact phone number in sender address is valid
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
    ...     Test Steps:
	...     - 1. Click Edit button in Sender Address section
	...     - 2. Enter invalid phone number
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not save the changes.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-09   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-10: Check that contact email in sender address is valid
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check email in sender address is valid
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Sender Address section
	...     - 2. Enter invalid email
	...
    ...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not save the changes.

	[Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-10   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-11: Check that recipient address can be edited.
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, recipient address can be edited
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Sender Address section
	...     - 2. Edit valid recipient name/country/address/secondary address/city/state/zip code/contact phone number/contact email.
	...     - 3. Click Save button.
	...     - 4. Observe the changes.
	...
	...     Expected Results:
	...     - 1. Edited information can be saved and displayed.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-11   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-12: Check that recipient address edit mode must be exited when clicking Cancel button
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, recipient address edit mode must be exited when clicking Cancel button
	...
    ...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
    ...     Test Steps:
	...     - 1. Click Edit button in Recipient Address section
	...     - 2. Edit recipient name/country/address/secondary address/city/state/zip code/contact phone number/contact email.
	...     - 3. Click Cancel button.
	...     - 4. Observe the changes.
	...
	...     Expected Results:
	...     - 1. Exit the edit mode.
	...     - 1. The information is not changed.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-12   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-13: Check that recipient address information is automatically filled in.
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, recipient address information is automatically filled in based on address input
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Recipient Address section
	...     - 2. Edit address field.
	...     - 3. Observe the address information.
	...
	...     Expected Results:
	...     - 1. The information is automatically filled in 3 fields namely City, State and Zip code based on address.
	...     - 2. The secondary address is blank.

    [Tags]    BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-13   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-14: Check that Country in recipient address can be selected
	[Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In New RMA ticket detail page, check country information in recipient address can be selected in dropdown menu
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Recipient Address section
	...     - 2. Select the country in dropdown menu
	...
	...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.
	...     - 2. Address, City, State, Zip code are blank and the suggested address changed based on country

    [Tags]	BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-14   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-15: Check that required fields in recipient address must not be empty.
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check required fields in recipient address must not be empty
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Recipient Address section.
	...     - 2. Leave recipient name/address/city/state/zip code/contact phone number/contact email blank.
	...     - 3. Click Save button and observe.
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not save the changes.

    [Tags]	BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-15   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-16: Check that contact phone number in sender address is valid
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check contact phone number in recipient address is valid
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Recipient Address section
	...     - 2. Enter invalid phone number
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not save the changes.

    [Tags]	BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-16   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-17: Check that contact email in recipient address is valid
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check email in recipient address is valid
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Edit button in Recipient Address section
	...     - 2. Enter invalid email
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not save the changes.

    [Tags]	BSP-SUPPORT-RMA-EDIT-NEW-BIOFT-17   FRS-022-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#APPROVE/REJECT NEW - BIOFT
BSP-SUPPORT-RMA-APPROVE-BIOFT-01: Check that the confirmation modal must be displayed correctly when clicking Approve button
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, confirmation modal must be displayed correctly when clicking Approve button
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Aprrove button
	...     - 2. Observe the modal
	...
	...     Expected Results:
	...     - 1. The confirmation modal is displayed.
	...     - 2. The message is "You are going to approve this RMA request. If you are sure you want to move forward with the action, please confirm below."
	...     - 3. There are Back and Confirm button.

    [Tags]	BSP-SUPPORT-RMA-APPROVE-BIOFT-01    FRS-023-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-APPROVE-BIOFT-02: Check that the ticket can be approved after confirming.
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, the ticket can be approved after confirming
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Aprrove button.
	...     - 2. Click Confirm button in the modal.
	...     - 3. Observe the result.
	...
	...     Expected Results:
	...     - 1. The ticket is changed status to "In Process" and moved to In Process tab.
	...     - 2. The user is redirected to In process ticket details page.

    [Tags]	BSP-SUPPORT-RMA-APPROVE-BIOFT-02   FRS-023-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-APPROVE-BIOFT-03: Check that the ticket the modal must be exited when clicking Cancel button
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, the ticket the modal must be exited when clicking Cancel button
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Aprrove button.
	...     - 2. Click Cancel button in the modal.
	...
	...     Expected Results:
	...     - 1. Exit the modal.

    [Tags]	BSP-SUPPORT-RMA-APPROVE-BIOFT-03   FRS-023-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-APPROVE-BIOFT-04: Check that email must be sent when the reason is "Return to Stock"
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: When the ticket is approved, if the it has “Return to Stock” reason, there shall be an email sent to billing@biotricity.com
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Check the email content
	...
	...     Expected Results:
	...     - 1. The email is sent
	...     - 2. Email content in correct format:
	...     The email subject: [Facility_Name]: RMA request – [RMA_ID]
	...     A new RMA request by [Clinic_Username], [Clinic_Role] has been sent to you with the following message:
	...
	...     Device ID	Reason for RMA	Patient impact	Date of event
	...     [Device_ID]	[Reason_for_RMA]	[Patient_impact]	[Date of event]
	...
	...     Clinic Notes (optional):
	...     [Notes]
	...     Clinic Information:
	...     [Clinic_Email]
	...     [Clinic_PhoneNumber]
	...     [Clinic Shipping Address]
	...     Thank you,
	...     Biotricity RMA Service Team

    [Tags]	BSP-SUPPORT-RMA-APPROVE-BIOFT-04   FRS-023-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-APPROVE-BIOFT-05: Check that message must be displayed when ticket is being updated by another user
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: If the ticket is being updated by another user, there shall be a message.
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Access the ticket details with one account and edit the information.
	...     - 2. Go to the same page but with a different account in a different tab.
	...
	...     Expected Results:
	...     - 1. Display message: “Please reload the page to view the most recent data since it is being modified by another account.”

    [Tags]	BSP-SUPPORT-RMA-APPROVE-BIOFT-05   FRS-023-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-REJECT-BIOFT-01: Check that the confirmation modal must be displayed correctly when clicking Reject button
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, confirmation modal must be displayed correctly when clicking Reject button
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Reject button
	...     - 2. Observe the modal
	...
	...     Expected Results:
	...     - 1. The confirmation modal is displayed.
	...     - 2. The message is "You are going to reject this RMA request. If you are sure you want to move forward with the action, please confirm below."
	...     - 3. There are Back and Confirm button.

    [Tags]	BSP-SUPPORT-RMA-REJECT-BIOFT-01   FRS-024-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-REJECT-BIOFT-02: Check that the ticket can be rejected after confirming.
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, the ticket can be rejected after confirming the Reject modal
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Rejected button.
	...     - 2. Click Confirm button in the modal.
	...     - 3. Observe the result.
	...
	...     Expected Results:
	...     - 1. The ticket is changed status to "Rejected" and moved to Done tab.
	...     - 2. The user is redirected to Done ticket details page.

    [Tags]	BSP-SUPPORT-RMA-REJECT-BIOFT-02   FRS-024-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-REJECT-BIOFT-03: Check that Cancel confirm modal must be exited when clicking Cancel button
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, the ticket the modal must be exited when clicking Cancel button
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details 
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click Reject button.
	...     - 2. Click Cancel button in the modal.
	...
	...     Expected Results:
	...     - 1. Exit the modal.

    [Tags]	BSP-SUPPORT-RMA-REJECT-BIOFT-03   FRS-024-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-REJECT-BIOFT-04: Check that devices status included in the RMA ticket changed to “Active” after being rejected
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: After rejecting the ticket, the devices included in the RMA ticket should have their status changed to “Active”
	...
	...     Precondition:
	...     - 1. The SS is on Reject RMA ticket details
	...     - 2. The device type is Bioflux/Biotres
	...
	...     Test Steps:
	...     - 1. Click on device ID to open device information sidebar
	...     - 2. Observe the status of device
	...
	...     Expected Results:
	...     - 1. Device status is Active

    [Tags]	BSP-SUPPORT-RMA-REJECT-BIOFT-04   FRS-024-01    R1    manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#CREATE - BIOH
BSP-SUPPORT-RMA-CREATE-BIOH-01: Select device type "Bioheart" in the Device type modal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select device type "Bioheart" to create RMA Request
    ...
    ...     Precondition:
    ...    - 1.. The user is on the RMA request tab, Support potal
    ...
    ...     Test Steps:
    ...    - 1. Click on [New RMA] button
    ...    - 2. Select "Bioheart option" in the modal, click [Next] button
    ...    - 3. Observe the Detail page
    ...
    ...     Expected Results:
    ...    - 1.There shall be:
    ...     - Device type: Bioheart in the header
    ...     - Customer information section
    ...     - Shipping Information section
    ...     - RMA Details section
    ...     - Other Information section

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-01    FRS-20-01       R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-02: Select “Facility” customer type
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select “Facility” customer type
    ...
    ...     Precondition:
    ...    - 1. The user is on the RMA request page
    ...    - 2. The user select device type is Bioheart
    ...
    ...     Test Steps:
    ...    - 1. In the customer type, select “Facility”
    ...    - 2. Observe the section, select facility name
    ...
    ...     Expected Results:
    ...    - 1.There shall be a “Facility” dropdown menu
    ...     - It shall feature all Biotricity’s Active, non-Test facilities
    ...     - The dropdown shall narrow down suggestions on user input
    ...     - The suggestion displays the email of the Facility, as well as Facility ID and Status

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-02     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-03: Observe the Shipping Information section (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information section in the case the customer type is “Facility”
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart, customer type is “Facility”
    ...
    ...     Test Steps:
    ...    - 1. Observe the Shipping Information section
    ...
    ...     Expected Results:
    ...    - 1. There shall be a “Ship from” (for Inbound)/”Ship to” (for Outbound)
    ...     - There should be 3 options Facility, Patient, and Sales representative on each tab

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-03     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-04: Select "Facility" option in the inbound tab (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Facility" option in the inbound tab
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Facility" option in the inbound tab
    ...    - 2. Observe the Shipping information section
    ...
    ...     Expected Results:
    ...    - 1.There should be a box that displays the Facility Name in the
    ...     - Sender name (for Inbound) / Recipient name (for Outbound)
    ...    - 2.The web app should get the facility’s address.
    ...      - All the information in the address should be automatically filled in

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-04     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-05: Select "Patient" option in the inbound tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Patient" option in the inbound tab
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Patient" option in the Inbound tab
    ...    - 2. Observe the Shipping information section
    ...
    ...     Expected Results:
    ...    - 1.There shall be a box that the user can search and select the patient in the Sender name
    ...    - 2.The patient list should include the patients who belong to the facility using the device

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-05     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-06: Select a patient name in the sender name field (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select a patient name in the sender name field
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...    - 3. Select "Patient" option in the Inbound tab
    ...
    ...     Test Steps:
    ...    - 1. On the Sender name field, search and select a patient name
    ...
    ...     Expected Results:
    ...    - 1. The web app shall get the patient’s address.
    ...    - 2. All the information in the address shall be automatically filled in

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-06     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-07: Select "Sale rep" option in the inbound tab (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Sale rep" option in the inbound tab
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Sales rep" option in the Inbound tab
    ...
    ...     Expected Results:
    ...    - 1. There shall be a text box that displays the Sale representative name of the facility in the Sender name.
    ...    - 2. The web app shall get the sale rep’s address.
    ...    - 3. All the information in the address shall be automatically filled in.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-07     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-08: Select "Facility" option in the Outbound tab (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Facility" option in the Outbound tab
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Facility" option in the Outbound tab
    ...    - 2. Observe the Shipping information section
    ...
    ...     Expected Results:
    ...    - 1.There should be a box that displays the Facility Name in the
    ...     Sender name (for Inbound) / Recipient name (for Outbound)
    ...    - 2.The web app should get the facility’s address.
    ...      All the information in the address should be automatically filled in

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-08     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-09: Select "Patient" option in the Outbound tab (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Patient" option in the Outbound tab
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Patient" option in the outbound tab
    ...    - 2. Observe the Shipping information section
    ...
    ...     Expected Results:
    ...    - 1.There shall be a box that the user can search and select the patient in the Sender name
    ...    - 2.The patient list should include the patients who belong to the facility using the device

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-09     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-10: Select a patient name in the sender name field (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select a patient name in the sender name field
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...    - 3. Select "Patient" option in the Outbound tab
    ...
    ...     Test Steps:
    ...    - 1. On the Sender name field, search and select a patient
    ...
    ...     Expected Results:
    ...    - 1. The web app shall get the patient’s address.
    ...    - 2. All the information in the address shall be automatically filled in

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-10     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-11: Select "Sale rep" option in the Outbound tab (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select "Sale rep" option in the Outbound tab
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Sales rep" option in the Outbound tab
    ...    - 2. Observe the Shipping information section
    ...
    ...     Expected Results:
    ...    - 1. There shall be a text box that displays the Sale representative name of the facility in the Sender name.
    ...    - 2. The web app shall get the sale rep’s address.
    ...    - 3. All the information in the address shall be automatically filled in.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-11     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-12: The user edits the address (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits the address
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Facility" option in the Outbound tab
    ...    - 2. Edit the address, Country, Address, City, State, Zipcode, Contact phone number, Contact Email
    ...
    ...     Expected Results:
    ...    - 1.The web app should suggest addresses based on the inputs of the user.
    ...    - 2. The user should be able to select a suggestion and the web app should automatically fill the information in the corresponding input fields.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-12     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-13: The user edits the address (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits the address
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Patient" option in the Outbound tab
    ...    - 2. Edit the address, Country, Address, City, State, Zipcode, Contact phone number, Contact Email
    ...
    ...     Expected Results:
    ...    - 1.The web app should suggest addresses based on the inputs of the user.
    ...    - 2. The user should be able to select a suggestion and the web app should automatically fill the information in the corresponding input fields.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-13     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-14: The user edits the address of the Sales representative (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: The user edits the address
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The user select device type is Bioheart, Customer type is "Facility",
    ...
    ...     Test Steps:
    ...    - 1. Select "Sales representative" option in the Outbound tab
    ...    - 2. Edit the address, Country, Address, City, State, Zipcode, Contact phone number, Contact Email
    ...
    ...     Expected Results:
    ...    - 1.The web app should suggest addresses based on the inputs of the user.
    ...    - 2. The user should be able to select a suggestion and the web app should automatically fill the information in the corresponding input fields.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-14     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-15: Search and select Device ID in the RMA Details section (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search and select Device ID in the RMA Details section
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, enter a device ID and select it from the drop down list
    ...    - 2. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. The user can search and select from the RMA ticket facility’s list of Bioheart devices
    ...    - 2. Devices that have the “RMA” status shall be displayed with an “RMA” tag and cannot be selected
    ...    - 3. The maintenance device cannot be selected, there shall be a message to notify the user
    ...    - 4. The device ID should only be selected once.
    ...    - 5. The Renewal device shall not be displayed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-15     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-16: Search an invalid Device ID in the RMA Details section (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search an invalid Device ID in the RMA Details section (belongs to another faility)
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, enter an invalid Device ID (belongs to another faility)
    ...    - 2. Enter character, special character
    ...    - 3. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 3. There is no suggestion to select

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-16     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-17: Select the reason for RMA in the RMA Details section (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the reason for RMA in the RMA Details section
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, click the Reason for RMA field
    ...    - 2. Observe the Reason for RMA field
    ...    - 3. Click on the Reason for RMA field
    ...
    ...     Expected Results:
    ...    - 1. The “Reason for RMA” shall be disabled when the device ID is empty
    ...    - 2. There shall be a list of reason in the drop down list for the user to select the reason, including:
    ...    - Charging Issue
    ...    - Device Errors
    ...    - ECG Issue
    ...    - No Cell Connection
    ...    - Screen Issue
    ...    - Broken Charger
    ...    - Closed Account
    ...    - Courtesy RMA
    ...    - Return to Stock
    ...    - Other

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-17     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-18: Select options from the Reason for RMA drop down list (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select options from the Reason for RMA drop down list
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1.Select one or multiple options from the Reason for RMA drop down list
    ...
    ...     Expected Results:
    ...    - 1. The selected option shall be displayed.
    ...    - 2. If the user selects “Other” or “Damage (describe)”, there shall be a text box for the user to enter the other reason.
    ...    - 3. For each reason, there shall be a [Delete] button to remove it.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-18     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-19: Remove selected "Reason for RMA" option (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove selected "Reason for RMA" option
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1. Select one or multiple options from the Reason for RMA drop down list
    ...    - 2. Click on  [Delete] button on each reason
    ...
    ...     Expected Results:
    ...    - 1. The options shall be removed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-19     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-20: Check the "Add device" button (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the "Add device" button
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1.Observe the "Add device" button
    ...
    ...     Expected Results:
    ...    - 1. The [Add device] button is disabled when the user hasn't selected any device ID
    ...    - 2. The [Add device] button is enabled when the user selects a device ID

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-20     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-21: Check the [Delete] button on each row (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the [Delete] button on each row
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1. Add 2 rows on the table, observe the [Delete] button
    ...    - 2. Click on the [Delete] button
    ...
    ...     Expected Results:
    ...    - 1. At the end of each row, there should be a [Delete] button to remove the device ID from the list.
    ...    - 2. The row shall be removed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-21     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-22: Check the "Add device" button (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the "Add device" button
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “Facility”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1.Observe the "Add device" button
    ...
    ...     Expected Results:
    ...    - 1. The [Add device] button is disabled when the user hasn't selected any device ID
    ...    - 2. The [Add device] button is enabled when the user selects a device ID

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-22      FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-23: Check the [Delete] button on each row (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the [Delete] button on each row
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “End User”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1. Add 2 rows on the table, observe the [Delete] button
    ...    - 2. Click on the [Delete] button
    ...
    ...     Expected Results:
    ...    - 1. At the end of each row, there should be a [Delete] button to remove the device ID from the list.
    ...    - 2. The row shall be removed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-23     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-27: Enter emails into Notification Email textbox (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter emails into Notification Email textbox
    ...
    ...     Precondition: The SS is on the "NEW RMA TICKET" page 
    ...
    ...     Test Steps:
    ...    - 1. Enter one or multiple emails in the Notification email text box
    ...    - 2. Each email is separated by space bar
    ...
    ...     Expected Results:
    ...    - 1. The system shall automatically fill the following email: service@biotricity.com
    ...    - 2. The entered emails shall displayed
    ...    - 3. For each email, there shall be a [Delete] button to remove it.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-27     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-28: Remove emails in the Notification Email textbox (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove emails in the Notification Email textbox
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. There is an email in the Notification Email textbox
    ...
    ...     Test Steps:
    ...    - 1. Click on [Delete] button on each email
    ...
    ...     Expected Results:
    ...    - 1. The email shall be removed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-28     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-29: Enter text in the Notes textbox (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter text in the Notes textbox
    ...
    ...     Precondition: The SS is on the "NEW RMA TICKET" page 
    ...
    ...     Test Steps:
    ...    - 1. Enter text in the Notes textbox
    ...
    ...     Expected Results:
    ...    - 1. The entered text shall be displayed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-29     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-31: Check the message when the ticket is created by Support Staff (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the message when the ticket is created by Support Staff
    ...
    ...     Precondition: The SS is on the "NEW RMA TICKET" page
    ...
    ...     Test Steps:
    ...    - 1. The OM or OS creates a RMA ticket on Support portal
    ...    - 2. Observe the message after clicking on the [Create Ticket] button
    ...
    ...     Expected Results:
    ...    - 1. There shall be a message: “You are going to create this RMA request.
    ...     The Service team will get it to handle on the Service portal.
    ...     If you are sure you want to move forward with the action, please confirm below”.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-31     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-32: Select "Confirm" button in the confirmation pop-up (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Select "Confirm" button in the confirmation pop-up
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 2. The user clicks on [Create Ticket] button
    ...
    ...     Test Steps:
    ...    - 1. On the confirmation pop-up, select the Confirm button
    ...
    ...     Expected Results:
    ...    - 1. The new RMA shall be created successfully,
    ...     and the user shall be returned to the Facility support ticket details page
    ...    - 2. The web app should create a complaint ticket for each device if the user creates an RMA request on the RMA tab.
    ...    - 3. There shall be an email send to Service@biotricity.com and the people who are in the noticication email

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-32     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-33: Select "Back" button in the confirmation pop-up (the customer type is “Facility”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Select "Back" button in the confirmation pop-up
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 2. The user clicks on [Create Ticket] button
    ...
    ...     Test Steps:
    ...    - 1. On the confirmation pop-up, select the Back button
    ...
    ...     Expected Results:
    ...    - 1. The confirmation pop-up shall disappear

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-33     FRS-020-03    R1     SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-34: Check the email content sent to service@biotricity.com and the people who are in the “Notification email”
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Check the email content
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 2. The user clicks on [Create Ticket] button
    ...    - 4. The customer type is “Facility”
    ...
    ...     Test Steps:
    ...    - 1. Check the email content
    ...
    ...     Expected Results:
    ...    - 1. The email subject: [Facility_Name]: RMA request – [RMA_ID]
    ...    - 2. A new RMA request by [Clinic_Username], [Clinic_Role] has been sent to you with the following message:
    ...     - Device ID, Reason for RMA, Patient Inpact, Date of event
    ...    - 3. Clinic note
    ...    - 4. Clinic Information
    ...     - [Clinic email]
    ...     - [Clinic phone number]
    ...     - [Clinic Shipping address]
    ...    - 5. Thank you, Biotricity RMA Service Team

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-34     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-35: There is an email send to Billing and Service in the case the ticket has “Return to Stock” reason
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  There is an email send to Billing and Service in the case the ticket has “Return to Stock” reason
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 2. The user clicks on [Create Ticket] button
    ...    - 4. The reason for RMA is “Return to Stock”
    ...
    ...     Test Steps:
    ...    - 1. Create ticket that has “Return to Stock” reason
    ...
    ...     Expected Results:
    ...    - 1. It will be sent to service@biotricity.com. billing@biotricity.com
    ...      and the people who are in the “Notification email”

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-35     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-F-36: Click on [Return] button when the user makes changes in the "New RMA ticket"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on [Return] button when the user makes changes in the "New RMA ticket"
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...
    ...     Test Steps:
    ...    - 1. The user makes changes in the "New RMA ticket"
    ...    - 2. Click on the "Return" button
    ...    - 3. Click on"Leave" button on the pop-up
    ...    - 4. CLick on "Stay" button on the pop-up
    ...
    ...     Expected Results:
    ...    - 2. There shall be a confirmation with the message “You have unsaved changes.
    ...     Are you sure you want to leave this page?” with “Leave” and “Stay” buttons
    ...    - 3. The “Leave” button shall redirect the user to the previous page, discarding any changes made to the page.
    ...    - 4. The “Stay” button shall exit the confirmation.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-F-36     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-01: Customer type is "End User", valid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Customer type is "End User"
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart
    ...
    ...     Test Steps:
    ...    - 1. In the customer type, select “End User”
    ...    - 2. Observe the section, imput email into textbox
    ...
    ...     Expected Results:
    ...    - 1.There shall be a “User Email” dropdown menu
    ...     - It shall feature all registered Biocare user accounts
    ...     - The dropdown shall narrow down suggestions on user input
    ...     - The suggestion displays the email of the account, as well as the account user’s Full name and Phone number

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-01     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-02: Customer type is "End User", invalid value
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Customer type is "End User"
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart
    ...
    ...     Test Steps:
    ...    - 1. In the customer type, select “End User”
    ...    - 2. Input an email that does not existed in the systerm
    ...    - 3. Input Phone number/Name/special charaters
    ...
    ...     Expected Results:
    ...    - 1.There is no suggestions

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-02      FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-03: Observe the Shipping Information section (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information section in the case the customer type is" End User"
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart,  customer type is "End User"
    ...
    ...     Test Steps:
    ...    - 1. Observe the Shipping Information section
    ...
    ...     Expected Results:
    ...    - 1. By default, the section should be expanded.
    ...    - 2. There should be 2 tabs, Inbound and Outbound, with the same content.
    ...    - 3. The Shipping information shall be automatically filled in using the user’s registered address

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-03     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-04: Change the Shipping Information section (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Observe the Shipping Information section in the case the customer type is" End User"
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart,  customer type is " End User"
    ...
    ...     Test Steps:
    ...    - 1. Change the user address (biocare account)
    ...    - 2. Observe the Shipping Information section
    ...
    ...     Expected Results:
    ...    - 1. Should displayed the new address inforamation

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-04     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-05: Change the Shipping Information (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Change the Shipping Information in the case the customer type is" End User"
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request page
    ...    - 2. The user select device type is Bioheart,  customer type is " End User"
    ...
    ...     Test Steps:
    ...    - 1. Select another address in the Shipping Information section (valid address)
    ...
    ...     Expected Results:
    ...    - 1. The user can search and select a address

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-05     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-06: Search and select Device ID in the RMA Details section (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search and select Device ID in the RMA Details section
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “End user”
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, enter a device ID and select it from the drop down list
    ...    - 2. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. If the RMA ticket’s customer type is “End User”,
    ...     the user can search and select from all Bioheart devices that was last paired to the RMA ticket Biocare user

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-06     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-07: Search an invalid Device ID in the RMA Details section (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search an invalid Device ID in the RMA Details section
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “End user”
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, enter an invalid Device ID ("last user pair" is not the ticket's user)
    ...    - 2. Enter device ID that has no "last user pair", Enter character, special character
    ...    - 2. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. There is no suggestion to select

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-07     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-08: Select the reason for RMA in the RMA Details section (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the reason for RMA in the RMA Details section
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “End user”
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, click the Reason for RMA field
    ...    - 2. Observe the Reason for RMA field
    ...    - 3. Click on the Reason for RMA field
    ...
    ...     Expected Results:
    ...    - 1. The “Reason for RMA” shall be disabled when the device ID is empty
    ...    - 2. There shall be a list of reason in the drop down list for the user to select the reason, including:
    ...    - Charging Issue
    ...    - Account Pairing Issue
    ...    - Device Errors
    ...    - Device Dead On Arrival
    ...    - Bluetooth Connection Issue
    ...    - Damaged (describe)
    ...    - Courtesy RMA
    ...    - Return to Stock
    ...    - Other

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-08     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-09: Select options from the Reason for RMA drop down list (End User)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select options from the Reason for RMA drop down list
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “End User”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1. Select one or multiple options from the Reason for RMA drop down list
    ...
    ...     Expected Results:
    ...    - 1. The selected option shall be displayed.
    ...    - 2. If the user selects “Other” or “Damage (describe)”, there shall be a text box for the user to enter the other reason.
    ...    - 3. For each reason, there shall be a [Delete] button to remove it.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-09     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-10: Remove selected "Reason for RMA" option (End User)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove selected "Reason for RMA" option
    ...
    ...     Precondition:
    ...    - 1. The SS is on the "NEW RMA TICKET" page 
    ...    - 2. The RMA ticket’s customer type is “End User”
    ...    - 3. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1. Select one or multiple options from the Reason for RMA drop down list
    ...    - 2. Click on  [Delete] button on each reason
    ...
    ...     Expected Results:
    ...    - 1. The options shall be removed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-10     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-11: Enter text in the Notes textbox (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Enter text in the Notes textbox
    ...
    ...     Precondition: The SS is on the "NEW RMA TICKET" page 
    ...
    ...     Test Steps:
    ...    - 1. Enter text in the Notes textbox
    ...
    ...     Expected Results:
    ...    - 1. The entered text shall be displayed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-11     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-13: Check the message when the ticket is created by Support Staff (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the message when the ticket is created by Support Staff
    ...
    ...     Precondition: The SS is on the "NEW RMA TICKET" page in the Support portal
    ...
    ...     Test Steps:
    ...    - 1. The SS creates a RMA ticket on Support portal
    ...    - 2. Observe the message after clicking on the [Create Ticket] button
    ...
    ...     Expected Results:
    ...    - 1. There shall be a message: “You are going to create this RMA request.
    ...     The Service team will get it to handle on the Service portal.
    ...     If you are sure you want to move forward with the action, please confirm below”.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-13     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-14: Select "Confirm" button in the confirmation pop-up (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Select "Confirm" button in the confirmation pop-up
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 2. The user clicks on [Create Ticket] button
    ...
    ...     Test Steps:
    ...    - 1. On the confirmation pop-up, select the Confirm button
    ...
    ...     Expected Results:
    ...    - 1. The new RMA shall be created successfully,
    ...     and the user shall be returned to the Facility support ticket details page
    ...    - 2. The web app should create a complaint ticket for each device if the user creates an RMA request on the RMA tab.
    ...    - 3. There shall be an email send to Service@biotricity.com and the people who are in the noticication email

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-14     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-15: Select "Back" button in the confirmation pop-up (the customer type is “End User”)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Select "Back" button in the confirmation pop-up
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 2. The user clicks on [Create Ticket] button
    ...
    ...     Test Steps:
    ...    - 1. On the confirmation pop-up, select the Back button
    ...
    ...     Expected Results:
    ...    - 1. The confirmation pop-up shall disappear

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-15     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-16: Check the email content sent to service@biotricity.com and the people who are in the “Notification email”
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Check the email content
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 2. The user clicks on [Create Ticket] button
    ...    - 4. The customer type is “End User”
    ...
    ...     Test Steps:
    ...    - 1. Check the email content
    ...
    ...     Expected Results:
    ...    - 1. The email subject: [Facility_Name]: RMA request – [RMA_ID]
    ...    - 2. A new RMA request by [Clinic_Username], [Clinic_Role] has been sent to you with the following message:
    ...     - Device ID, Reason for RMA, Patient Inpact, Date of event
    ...    - 3. Clinic note
    ...    - 4. Clinic Information
    ...     - [Clinic email]
    ...     - [Clinic phone number]
    ...     - [Clinic Shipping address]
    ...    - 5. Thank you, Biotricity RMA Service Team

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-16     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-17: There is an email send to Billing and Service in the case the ticket has “Return to Stock” reason
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  There is an email send to Billing and Service in the case the ticket has “Return to Stock” reason
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 3. The customer type is “End User”, the user clicks on [Create Ticket] button
    ...    - 4. The reason for RMA is “Return to Stock”
    ...
    ...     Test Steps:
    ...    - 1. Create ticket that has “Return to Stock” reason
    ...
    ...     Expected Results:
    ...    - 1. It will be sent to service@biotricity.com. billing@biotricity.com
    ...      and the people who are in the “Notification email”

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-17     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOH-E-18: Click on [Return] button when the user makes changes in the "New RMA ticket"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on [Return] button when the user makes changes in the "New RMA ticket"
    ...
    ...     Precondition:
    ...    - 1. The Support Staff is on the "NEW RMA TICKET" page
    ...    - 3. The customer type is “End User”
    ...
    ...     Test Steps:
    ...    - 1. The user makes changes in the "New RMA ticket"
    ...    - 2. Click on the "Return" button
    ...    - 3. Click on"Leave" button on the pop-up
    ...    - 4. CLick on "Stay" button on the pop-up
    ...
    ...     Expected Results:
    ...    - 2. There shall be a confirmation with the message “You have unsaved changes.
    ...     Are you sure you want to leave this page?” with “Leave” and “Stay” buttons
    ...    - 3.The “Leave” button shall redirect the user to the previous page, discarding any changes made to the page.
    ...    - 4.The “Stay” button shall exit the confirmation.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOH-E-18     FRS-020-03    R1    SC-1.10.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}


#CREATE BIOK
BSP-SUPPORT-RMA-CREATE-BIOK-01: Select device type "Biokit" in the Device type modal
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Select Biokit in the modal to create RMA Request
    ...
    ...     Precondition:
    ...    - 1. The SS is on the RMA request tab
    ...
    ...     Test Steps:
    ...    - 1. Click on [New RMA] button
    ...    - 2. Select "Biokit" option in the modal, click [Next button]
    ...    - 3. Observe the Detail page
    ...
    ...     Expected Results:
    ...    - 1.There shall be:
    ...     - Device type: Biokit in the header
    ...     - Customer information section
    ...     - Shipping Information section
    ...     - RMA Details section
    ...     - Other Information section

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-01    RS-20-01   SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-02: Check that Create Biokit RMA Requests ticket page must be displayed same as designed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Create Biokit RMA Request page must be displayed same as designed
    ...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
    ...
    ...     Test Steps:
    ...     - 1. Observe page
    ...
    ...     Expected Results:
    ...     - 1. Create Biokit RMA Request page is displayed same as designed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-02    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-03: Check that Create Biokit RMA Request ticket page must be displayed all sections
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Create Biokit RMA Request ticket page must be displayed all sections
    ...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
    ...
    ...     Test Steps:
    ...     - 1. Observe page
    ...
    ...     Expected Results:
    ...     - 1. All sections are displayed
    ...     + Header (RMA ID, Device type, Request Date, Customer)
    ...     + RMA Details (Device ID, Device type, Reason for RMA, Delete button)
    ...     + Inbound/Outbound tab: Shipping information (Sender/Recipient address)
    ...     + Other information (Clinic Notes, Notification email, Notes)
    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-03    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#OTHER INFORMATION
BSP-SUPPORT-RMA-CREATE-BIOK-04: Check that notification emails can not be empty
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Biokit RMA Request page, notification emails can not be empty
    ...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
    ...
    ...     Test Steps:
    ...     - 1. Click Delete button at the end of each email to remove it.
    ...     - 2. Remove all the email.
    ...     - 3. Create the ticket.
    ...
    ...     Expected Results:
    ...     - 1. Notification email field is not empty.
    ...     - 2. Last notification email is saved.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-04	RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-05: Check that notification emails can be entered using Space bar or [,] key
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Biokit RMA Request page, notification emails can be entered using Space bar or [,] key
    ...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
    ...
    ...     Test Steps:
    ...     - 1. Press the [Space bar] or [,] key to complete an email.
    ...
    ...     Expected Results:
    ...     - 1. The emails are entered

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-05    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-06: Check that Notes field is optional
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Create Biokit RMA Request page, Notes field is optional
    ...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
    ...
    ...     Test Steps:
    ...     - 1. Observe Notes field
    ...     - 2. Leave the Notes blank
    ...     - 3. Enter required fields and create ticket
    ...
    ...     Expected Results:
    ...     - 1. The Notes field contains "Optional"
    ...     - 2. The ticket can be created

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-06    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#SHIP INFORMATION
# FACILITY - INBOUND
BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-01: Check that user can select Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, user can select Ship from Facility
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Facility" option in the Inbound tab (default)
	...     - 3. Observe this option
	...
	...     Expected Results:
	...     - 1. "Facility" option is selected.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-01   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-02: Check that hint text of sender name when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check the hint of Sender name textbox
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Facility" option in the Inbound tab
	...     - 3. Observe Sender name textbox
	...
	...     Expected Results:
	...     - 1. Hint text is "Enter Facility name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-02   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-03: Check that shipping information must be automatically filled in when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check shipping information must be automatically filled in based on Facility Information
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Observe shipping information.
	...
	...     Expected Results:
	...     - 1. Sender name and address information is automatically filled in based on Facility Information
	...     - 2. This information match Customer information.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-03   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-04: Check that shipping information can be edited when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check shipping information can be edited
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
   	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
	...
	...     Expected Results:
	...     - 1. Address is recommended based on the input of user
	...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-04   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-05: Check that Country can be selected when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check country information can be selected in dropdown menu
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Select the country in dropdown menu
	...
	...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-05   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-06: Check that default Country is United States when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check that default Country is United States
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Observe the country in dropdown menu.
	...
	...     Expected Results:
	...     - 1. Default Country is United States.

    [Tags]		BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-06   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-07: Check that Shipping information has Secondary Address (optional) when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, should has Secondary Address (optional) field
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Observe the Shipping information section.
	...
	...     Expected Results:
	...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-07   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-08: Check that Secondary Address can be empty when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, Secondary Address can be empty
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Leave Secondary Address blank.
	...     - 4. Enter required fields.
	...     - 5. Create ticket.
	...
	...     Expected Results:
	...     - 1. Create ticket successfully.
	...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-08   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-09: Check that required fields must not be empty when Ship from Facility (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Facility, check required fields must not be empty
	...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Facility" option in the Inbound tab (by default)
	...     - 3. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
	...     - 4. Create ticket.
	...
	...     Expected Results:
	...     - 1. Display error message
	...     - 2. Can not create ticket.

	[Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-09   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-10: Check that user can select Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, user can select Ship from Patient
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 2. Observe this option
	...
	...     Expected Results:
	...     - 1. "Patient" option is selected.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-10   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-11: Check that hint text of sender name when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check the hint of Sender name textbox
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Observe Sender name textbox
	...
	...     Expected Results:
	...     - 1. Hint text is "Enter Patient name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-11   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-12: Check that Patient can be searched and selected in Sender name (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check Patient can be searched and selected in Sender name
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name dropdown menu
	...
	...     Expected Results:
	...     - 1. Patient list is displayed
	...     - 2. The patient list should include the patients who belong to the facility using the device

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-12   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-13: Check that shipping information must be automatically filled in when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check shipping information must be automatically filled in based on Patient Information
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name dropdown menu
	...     - 4. Observe shipping information.
	...
	...     Expected Results:
	...     - 1. Sender name and address information is automatically filled in based on Patient Information

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-13   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-14: Check that shipping information can be edited when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check shipping information can be edited
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
   	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name dropdown menu
	...     - 4. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
	...
	...     Expected Results:
	...     - 1. Address is recommended based on the input of user
	...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-14   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-15: Check that Country can be selected when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check country information can be selected in dropdown menu
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name dropdown menu
	...     - 4. Select the country in dropdown menu
	...
	...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-15   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-16: Check that default Country is United States when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check that default Country is United States
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name dropdown menu
	...     - 4. Observe the country in dropdown menu.
	...
	...     Expected Results:
	...     - 1. Default Country is United States.

    [Tags]		BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-16   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-17: Check that Shipping information has Secondary Address (optional) when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, should has Secondary Address (optional) field
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Observe the Shipping information section.
	...
	...     Expected Results:
	...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-17   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-18: Check that Secondary Address can be empty when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, Secondary Address can be empty
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name dropdown menu
	...     - 4. Leave Secondary Address blank.
	...     - 5. Enter required fields.
	...     - 6. Create ticket.
	...
	...     Expected Results:
	...     - 1. Create ticket successfully.
	...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-18   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-19: Check that required fields must not be empty when Ship from Patient (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Patient, check required fields must not be empty
	...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Patient" option in the Inbound tab
	...     - 3. Search and select Patient name in Sender name dropdown menu
	...     - 4. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
	...     - 5. Create ticket.
	...
	...     Expected Results:
	...     - 1. Display error message
	...     - 2. Can not create ticket.

	[Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-19   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-20: Check that user can select Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, user can select Ship from Sales rep
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Observe this option
	...
	...     Expected Results:
	...     - 1. "Sales rep" option is selected.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-20   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-21: Check that hint text of sender name when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, check the hint of Sender name textbox
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Observe Sender name textbox
	...
	...     Expected Results:
	...     - 1. Hint text is "Enter Sales rep name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-21   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-22: Check that shipping information must be automatically filled in when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, check shipping information must be automatically filled in based on Sales rep Information
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Observe shipping information.
	...
	...     Expected Results:
	...     - 1. Sender name and address information is automatically filled in based on Sales rep Information
	...     - 2. This information match Customer information.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-22   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-23: Check that shipping information can be edited when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, check shipping information can be edited
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
   	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
	...
	...     Expected Results:
	...     - 1. Address is recommended based on the input of user
	...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-23   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-24: Check that Country can be selected when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, check country information can be selected in dropdown menu
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Select the country in dropdown menu
	...
	...     Expected Results:
	...     - 1. All the required countries are displayed.
	...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-24   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-25: Check that default Country is United States when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, check that default Country is United States
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Observe the country in dropdown menu.
	...
	...     Expected Results:
	...     - 1. Default Country is United States.

    [Tags]		BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-25   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-26: Check that Shipping information has Secondary Address (optional) when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, should has Secondary Address (optional) field
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Observe the Shipping information section.
	...
	...     Expected Results:
	...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-26   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-27: Check that Secondary Address can be empty when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, Secondary Address can be empty
	...
	...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Leave Secondary Address blank.
	...     - 4. Enter required fields.
	...     - 5. Create ticket.
	...
	...     Expected Results:
	...     - 1. Create ticket successfully.
	...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-27   RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-28: Check that required fields must not be empty when Ship from Sales rep (Inbound)
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In Shipping Information section, with ticket Ship from Sales rep, check required fields must not be empty
	...
    ...     Precondition:
	...     - 1. The SS is on Create new RMA request page
	...     - 3. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
	...     - 2. Select "Sales rep" option in the Inbound tab
	...     - 3. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
	...     - 4. Create ticket.
	...
	...     Expected Results:
	...     - 1. Display error message "Invalid value"
	...     - 2. Can not create ticket.

	[Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-28  RS-020-04   R1    SC-1.14.0	manual
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

# FACILITY - OUTBOUND
BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-29: Check that user can select Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, user can select Ship from Facility
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Facility" option in the Outbound tab (default)
    ...     - 3. Observe this option
    ...
    ...     Expected Results:
    ...     - 1. "Facility" option is selected.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-29   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-30: Check that hint text of sender name when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, check the hint of Sender name textbox
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Facility" option in the Outbound tab
    ...     - 3. Observe Sender name textbox
    ...
    ...     Expected Results:
    ...     - 1. Hint text is "Enter Facility name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-30   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-31: Check that shipping information must be automatically filled in when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, check shipping information must be automatically filled in based on Facility Information
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Facility" option in the Outbound tab (by default)
    ...     - 3. Observe shipping information.
    ...
    ...     Expected Results:
    ...     - 1. Sender name and address information is automatically filled in based on Facility Information
    ...     - 2. This information match Customer information.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-31   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-32: Check that shipping information can be edited when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, check shipping information can be edited
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Facility" option in the Outbound tab (by default)
    ...     - 3. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
    ...
    ...     Expected Results:
    ...     - 1. Address is recommended based on the input of user
    ...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-32   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-33: Check that Country can be selected when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, check country information can be selected in dropdown menu
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Facility" option in the Outbound tab (by default)
    ...     - 3. Select the country in dropdown menu
    ...
    ...     Expected Results:
    ...     - 1. All the required countries are displayed.
    ...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-33   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-34: Check that default Country is United States when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, check that default Country is United States
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Facility" option in the Outbound tab (by default)
    ...     - 3. Observe the country in dropdown menu.
    ...
    ...     Expected Results:
    ...     - 1. Default Country is United States.

    [Tags]     BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-34   RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-35: Check that Shipping information has Secondary Address (optional) when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, should has Secondary Address (optional) field
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Facility" option in the Outbound tab (by default)
    ...     - 3. Observe the Shipping information section.
    ...
    ...     Expected Results:
    ...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-35   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-36: Check that Secondary Address can be empty when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, Secondary Address can be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Facility" option in the Outbound tab (by default)
    ...     - 3. Leave Secondary Address blank.
    ...     - 4. Enter required fields.
    ...     - 5. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Create ticket successfully.
    ...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-36   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-37: Check that required fields must not be empty when Ship from Facility (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Facility, check required fields must not be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Facility" option in the Outbound tab (by default)
    ...     - 3. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
    ...     - 4. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Display error message
    ...     - 2. Can not create ticket.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-37   RS-020-04   R1    SC-1.14.0  manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-38: Check that user can select Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, user can select Ship from Patient
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 2. Observe this option
    ...
    ...     Expected Results:
    ...     - 1. "Patient" option is selected.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-38   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-39: Check that hint text of sender name when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, check the hint of Sender name textbox
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Observe Sender name textbox
    ...
    ...     Expected Results:
    ...     - 1. Hint text is "Enter Patient name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-39   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-40: Check that Patient can be searched and selected in Sender name (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, check Patient can be searched and selected in Sender name
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Search and select Patient name in Sender name dropdown menu
    ...
    ...     Expected Results:
    ...     - 1. Patient list is displayed
    ...     - 2. The patient list should include the patients who belong to the facility using the device

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-40   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-41: Check that shipping information must be automatically filled in when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, check shipping information must be automatically filled in based on Patient Information
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Search and select Patient name in Sender name dropdown menu
    ...     - 4. Observe shipping information.
    ...
    ...     Expected Results:
    ...     - 1. Sender name and address information is automatically filled in based on Patient Information

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-41   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-42: Check that shipping information can be edited when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, check shipping information can be edited
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Search and select Patient name in Sender name dropdown menu
    ...     - 4. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
    ...
    ...     Expected Results:
    ...     - 1. Address is recommended based on the input of user
    ...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-42   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-43: Check that Country can be selected when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, check country information can be selected in dropdown menu
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Search and select Patient name in Sender name dropdown menu
    ...     - 4. Select the country in dropdown menu
    ...
    ...     Expected Results:
    ...     - 1. All the required countries are displayed.
    ...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-43   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-44: Check that default Country is United States when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, check that default Country is United States
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Search and select Patient name in Sender name dropdown menu
    ...     - 4. Observe the country in dropdown menu.
    ...
    ...     Expected Results:
    ...     - 1. Default Country is United States.

    [Tags]     BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-44   RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-45: Check that Shipping information has Secondary Address (optional) when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, should has Secondary Address (optional) field
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Observe the Shipping information section.
    ...
    ...     Expected Results:
    ...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-45   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-46: Check that Secondary Address can be empty when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, Secondary Address can be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Search and select Patient name in Sender name dropdown menu
    ...     - 4. Leave Secondary Address blank.
    ...     - 5. Enter required fields.
    ...     - 6. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Create ticket successfully.
    ...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-46   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-47: Check that required fields must not be empty when Ship from Patient (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Patient, check required fields must not be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Patient" option in the Outbound tab
    ...     - 3. Search and select Patient name in Sender name dropdown menu
    ...     - 4. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
    ...     - 5. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Display error message
    ...     - 2. Can not create ticket.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-47   RS-020-04   R1    SC-1.14.0  manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-48: Check that user can select Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, user can select Ship from Sales rep
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Observe this option
    ...
    ...     Expected Results:
    ...     - 1. "Sales rep" option is selected.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-48   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-49: Check that hint text of sender name when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, check the hint of Sender name textbox
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Observe Sender name textbox
    ...
    ...     Expected Results:
    ...     - 1. Hint text is "Enter Sales rep name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-49   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-50: Check that shipping information must be automatically filled in when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, check shipping information must be automatically filled in based on Sales rep Information
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Observe shipping information.
    ...
    ...     Expected Results:
    ...     - 1. Sender name and address information is automatically filled in based on Sales rep Information
    ...     - 2. This information match Customer information.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-50   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-51: Check that shipping information can be edited when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, check shipping information can be edited
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Edit the sender name/address information (address, secondary address, city, state, zipcode, contact phone number, contact email)
    ...
    ...     Expected Results:
    ...     - 1. Address is recommended based on the input of user
    ...     - 2. Address information (address, city, state, zipcode) is automatically filled in based on address input.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-51   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-52: Check that Country can be selected when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, check country information can be selected in dropdown menu
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Select the country in dropdown menu
    ...
    ...     Expected Results:
    ...     - 1. All the required countries are displayed.
    ...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-52   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-53: Check that default Country is United States when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, check that default Country is United States
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Observe the country in dropdown menu.
    ...
    ...     Expected Results:
    ...     - 1. Default Country is United States.

    [Tags]     BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-53   RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-54: Check that Shipping information has Secondary Address (optional) when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, should has Secondary Address (optional) field
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Observe the Shipping information section.
    ...
    ...     Expected Results:
    ...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-54   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-55: Check that Secondary Address can be empty when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, Secondary Address can be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Leave Secondary Address blank.
    ...     - 4. Enter required fields.
    ...     - 5. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Create ticket successfully.
    ...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-55   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-56: Check that required fields must not be empty when Ship from Sales rep (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with ticket Ship from Sales rep, check required fields must not be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...     - 2. Select "Sales rep" option in the Outbound tab
    ...     - 3. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
    ...     - 4. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Display error message "Invalid value"
    ...     - 2. Can not create ticket.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-56  RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

# END USER - INBOUND
BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-57: Check that hint text of sender name when customer type is End User (Inbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check the hint of Sender name textbox
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Select "Facility" option in the Inbound tab
    ...     - 3. Observe Sender name textbox
    ...
    ...     Expected Results:
    ...     - 1. Hint text is "Enter Sender name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-57   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-58: Check that shipping information must be automatically filled in when customer type is End User (Inbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check shipping information must be automatically filled in based on Facility Information
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Observe shipping information.
    ...
    ...     Expected Results:
    ...     - 1. Sender name and address information is automatically filled in based on Facility Information
    ...     - 2. This information match Customer information.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-58   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-59: Check that Country can be selected when customer type is End User (Inbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check country information can be selected in dropdown menu
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Select the country in dropdown menu
    ...
    ...     Expected Results:
    ...     - 1. All the required countries are displayed.
    ...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-59   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-60: Check that default Country is United States when customer type is End User (Inbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check that default Country is United States
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Observe the country in dropdown menu.
    ...
    ...     Expected Results:
    ...     - 1. Default Country is United States.

    [Tags]     BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-60   RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-61: Check that Shipping information has Secondary Address (optional) when customer type is End User (Inbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, should has Secondary Address (optional) field
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Observe the Shipping information section.
    ...
    ...     Expected Results:
    ...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-61   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-62: Check that Secondary Address can be empty when customer type is End User (Inbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, Secondary Address can be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Leave Secondary Address blank.
    ...     - 3. Enter required fields.
    ...     - 4. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Create ticket successfully.
    ...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-62   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-63: Check that required fields must not be empty when customer type is End User (Inbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check required fields must not be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     – 2. Enter required fields
    ...     - 3. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
    ...     - 4. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Display error message
    ...     - 2. Can not create ticket.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-63   RS-020-04   R1    SC-1.14.0  manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-71: Check that Inbound shipping information is automatically filled when toggle "Use Customer Information" is on (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Inbound shipping information is automatically filled when toggle "Use Customer Information" is on
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...     - 4. The customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     – 2. Enter customer information
    ...     - 3. Turn on "use customer information" toggle
    ...
    ...     Expected Results:
    ...     - 1. Inbound/Outbound information is automatically filled
    ...     - 1. Copy the name, address, phone number, and contact email from the “Customer Information” section

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-71   RS-020-04   R1    SC-1.14.0  manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#END USER - OUTBOUND
BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-64: Check that hint text of sender name when customer type is End User (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check the hint of Sender name textbox
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Select "Facility" option in the Outbound tab
    ...     - 3. Observe Sender name textbox
    ...
    ...     Expected Results:
    ...     - 1. Hint text is "Enter Sender name"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-64   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-65: Check that shipping information must be automatically filled in when customer type is End User (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check shipping information must be automatically filled in based on Facility Information
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Switch to Outbound tab in Shipping Information section
    ...     - 3. Observe shipping information.
    ...
    ...     Expected Results:
    ...     - 1. Sender name and address information is automatically filled in based on Facility Information
    ...     - 2. This information match Customer information.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-65   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-66: Check that Country can be selected when customer type is End User (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check country information can be selected in dropdown menu
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Switch to Outbound tab in Shipping Information section
    ...     - 3. Select the country in dropdown menu
    ...
    ...     Expected Results:
    ...     - 1. All the required countries are displayed.
    ...     - 2. Can select the country in dropdown menu.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-66   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-67: Check that default Country is United States when customer type is End User (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check that default Country is United States
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Switch to Outbound tab in Shipping Information section
    ...     - 3. Observe the country in dropdown menu.
    ...
    ...     Expected Results:
    ...     - 1. Default Country is United States.

    [Tags]     BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-67   RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-68: Check that Shipping information has Secondary Address (optional) when customer type is End User (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, should has Secondary Address (optional) field
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Switch to Outbound tab in Shipping Information section
    ...     - 3. Observe the Shipping information section.
    ...
    ...     Expected Results:
    ...     - 1. There shall be Secondary Address field.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-68   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-69: Check that Secondary Address can be empty when customer type is End User (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, Secondary Address can be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Switch to Outbound tab in Shipping Information section
    ...     - 3. Leave Secondary Address blank.
    ...     - 4. Enter required fields.
    ...     - 5. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Create ticket successfully.
    ...     - 2. No error message is displayed.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-69   RS-020-04   R1    SC-1.14.0   manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-70: Check that required fields must not be empty when customer type is End User (Outbound)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: In Shipping Information section, with customer type is End User, check required fields must not be empty
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Select customer type is End User
    ...     - 2. Switch to Outbound tab in Shipping Information section
    ...     - 3. Enter required fields
    ...     - 4. Leave sender name/address/city/state/zip code/contact phone number/contact email blank.
    ...     - 5. Create ticket.
    ...
    ...     Expected Results:
    ...     - 1. Display error message
    ...     - 2. Can not create ticket.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-SHIPINFO-70   RS-020-04   R1    SC-1.14.0  manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#Customer Information
BSP-SUPPORT-RMA-CREATE-BIOK-CUS-01: Check that Customer type must have 2 options End User and Facility
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Customer type must have 2 options End User and Facility
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create Biokit RMA Request ticket page
    ...
    ...     Test Steps:
    ...     - 1. Observe Customer type section
    ...
    ...     Expected Results:
    ...     - 1. Customer type must have 2 options End User and Facility

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-01    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-CUS-02: Check that additional fields are displayed when user select customer type is End User
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: When user select customer type is End User, additional fields are displayed
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create Biokit RMA Request page
    ...
    ...     Test Steps:
    ...     - 1. Select Customer type is End User
    ...     - 2. Observe Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Additional fields are displayed (Customer first name, Customer last name, Country, Address, Secondary Address, City, State, Zipcode, Contact phone number, Contact email)

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-02    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-CUS-03: Check that Secondary Address field must be optional (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Secondary Address field must be optional (End User)
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create Biokit RMA Request page
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

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-03	RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-CUS-04: Check that Address information can be automatically filled in based on user entered address (End User)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Address information can be automatically filled in based on user entered address (End User)
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create Biokit RMA Request page
    ...     - 2. Customer type is End User
    ...
    ...     Test Steps:
    ...     - 1. Enter and select the address suggested by the system in the address field
    ...     - 2. Observe fields
    ...
    ...     Expected Results:
    ...     - 1. Address information (City, State, Zipcode) is automatically filled in

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-04    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-CUS-05: Check that contact email must be valid in End User information
	[Documentation]  Author: Linh Nguyen
    ...
	...     Description: In New RMA ticket detail page, check email in sender address is valid
	...
	...     Precondition:
	...     - 1. The SS is on New RMA ticket details
	...     - 2. The device type is Biokit
	...
	...     Test Steps:
	...     - 1. Enter invalid email in customer information
	...     – 2. Enter required fields and click [Create ticket]
	...     – 3. Observe the page
	...
    ...     Expected Results:
	...     - 1. Display error message "Invalid email"
	...     - 2. Can not create ticket.

	[Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-05   RS-020-04   R1    manual       SC-1.14.0
	Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-CUS-06: Check that additional fields are displayed when user select customer type is Facility
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: When user select customer type is Facility, additional fields are displayed
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create Biokit RMA Request page
    ...
    ...     Test Steps:
    ...     - 1. Select Customer type is Facility
    ...     - 2. Observe Customer information section
    ...
    ...     Expected Results:
    ...     - 1. Additional fields are displayed (Facility name)

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-06    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-CUS-07: Check that Facility name can be suggested when user type in dropdown menu (Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Facility name can be suggested when user type in dropdown menu (Facility)
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create Biokit RMA Request page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. In Facility name dropdown menu, enter facility name
    ...     - 2. Observe the field
    ...
    ...     Expected Results:
    ...     - 1. Suggested facility names are displayed
    ...     - 2. Suggested names corresponding to the entered keyword

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-07    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-CUS-08: Check that suggested Facility name information must be correct (Facility)
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Suggested Facility name information must be correct (Facility)
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create Biokit RMA Request page
    ...     - 2. Customer type is Facility
    ...
    ...     Test Steps:
    ...     - 1. In Facility name dropdown menu, enter facility name
    ...     - 2. Observe the field
    ...
    ...     Expected Results:
    ...     - 1. The suggested facility name information matches with information of facility (Facility name, Facility ID, Facility status)
    ...     - 2. If any information is null, display "--"

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-CUS-08    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#RMA DETAIL
BSP-SUPPORT-RMA-CREATE-BIOK-RD-01: Search and select Kit device in the RMA Details section (Facility)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In Create Biokit RMA Request page, and select Kit Device in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...    - 2. On the RMA Detail section, search a Kit device (Blood Pressure, Digital Thermometer, Pulse Oximeter)
    ...    - 3. Select device from the drop down list
    ...    - 4. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. The user can search and select from the RMA ticket facility’s list of Biokit devices
    ...    - 2. Devices that have the “RMA” status shall be displayed with an “RMA” tag and cannot be selected
    ...    - 3. The maintenance device cannot be selected, there shall be a message to notify the user
    ...    - 4. The device ID should only be selected once.
    ...    - 5. The Renewal device shall not be displayed
    ...    - 6. The device type of this device is displayed in Device type field

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-01     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-02: Search and select standalone device in the RMA Details section (Facility)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In Create Biokit RMA Request page, and select standalone device in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...    - 2. On the RMA Detail section, search a standalone device (Blood Pressure, Digital Thermometer, Pulse Oximeter)
    ...    - 3. Select device from the drop down list
    ...    - 4. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. The user can search and select from the RMA ticket facility’s list of Biokit devices
    ...    - 2. Devices that have the “RMA” status shall be displayed with an “RMA” tag and cannot be selected
    ...    - 3. The maintenance device cannot be selected, there shall be a message to notify the user
    ...    - 4. The device ID should only be selected once.
    ...    - 5. The Renewal device shall not be displayed
    ...    - 6. The device type of this device is displayed in Device type field

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-02     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-03: Search and select Kit device in the RMA Details section (End User)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In Create Biokit RMA Request page, and select Kit Device in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. Select customer type is End User.
    ...    - 1. On the RMA Detail section, search a Kit device (Blood Pressure, Digital Thermometer, Pulse Oximeter)
    ...    - 2. Select device from the drop down list
    ...    - 2. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. The user can search and select any individual Biokit device ID that has location “User”
    ...    - 2. Devices that have the “RMA” status shall be displayed with an “RMA” tag and cannot be selected
    ...    - 3. The maintenance device cannot be selected, there shall be a message to notify the user
    ...    - 4. The device ID should only be selected once.
    ...    - 5. The Renewal device shall not be displayed
    ...    - 6. The device type of this device is displayed in Device type field

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-03     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-04: Search and select standalone device in the RMA Details section (End User)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In Create Biokit RMA Request page, and select standalone device in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. Select customer type is End User.
    ...    - 2. On the RMA Detail section, search a standalone device (Blood Pressure, Digital Thermometer, Pulse Oximeter)
    ...    - 3. Select device from the drop down list
    ...    - 4. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. The user can search and select any individual Biokit device ID that has location “User”
    ...    - 2. Devices that have the “RMA” status shall be displayed with an “RMA” tag and cannot be selected
    ...    - 3. The maintenance device cannot be selected, there shall be a message to notify the user
    ...    - 4. The device ID should only be selected once.
    ...    - 5. The Renewal device shall not be displayed
    ...    - 6. The device type of this device is displayed in Device type field

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-04     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-05: Search an invalid Device ID in the RMA Details section (Facility)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search an invalid Device ID in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. Select customer type is Facility, and Facility name in Customer Information section.
    ...    - 2. On the RMA Details section, enter an invalid Device ID
    ...    + Device ID does not exist
    ...    + Device is in another facility
    ...    + Device has location is Inventory
    ...    + Device has location is End User
    ...    - 3. Enter character, special character
    ...    - 4. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. There is no suggestion to select

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-05     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-06: Search an invalid Device ID in the RMA Details section (End User)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search an invalid Device ID in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. Select customer type is End User.
    ...    - 2. On the RMA Details section, enter an invalid Device ID
    ...    + Device ID does not exist
    ...    + Device has location is Inventory
    ...    + Device has location is Facility
    ...    - 3. Enter character, special character
    ...    - 4. Observe the list device ID
    ...
    ...     Expected Results:
    ...    - 1. There is no suggestion to select

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-06     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-08: Select options from the Reason for RMA drop down list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select options from the Reason for RMA drop down list
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1.Select one or multiple options from the Reason for RMA drop down list
    ...
    ...     Expected Results:
    ...    - 1. The selected option shall be displayed.
    ...    - 2. If the user selects “Other” or “Damage (describe)”, there shall be a text box for the user to enter the other reason.
    ...    - 3. For each reason, there shall be a [Delete] button to remove it.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-08     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-10: Remove selected "Reason for RMA" option
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Remove selected "Reason for RMA" option
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...     - 4. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1.Select one or multiple options from the Reason for RMA drop down list
    ...    - 2.Click on [Delete] button on each reason
    ...
    ...     Expected Results:
    ...    - 1. The options shall be removed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-10     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-11: Check the "Add device" button
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the "Add device" button
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...     - 4. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1.Observe the "Add device" button
    ...
    ...     Expected Results:
    ...    - 1. The [Add device] button is disabled when the user hasn't selected any device ID
    ...    - 2. The [Add device] button is enabled when the user selects a device ID

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-11     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-12: Check the [Delete] button on each row
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the [Delete] button on each row
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...     - 4. There is a device ID selected
    ...
    ...     Test Steps:
    ...    - 1. Add 2 rows on the table, observe the [Delete] button
    ...    - 2. Click on the [Delete] button
    ...
    ...     Expected Results:
    ...    - 1. At the end of each row, there should be a [Delete] button to remove the device ID from the list.
    ...    - 2. The row shall be removed

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-12     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-13: The reason for RMA must be reset when device ID is changed to the other model
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: In Create Biokit RMA Request page, and select Kit Device in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. Select customer type.
    ...    - 2. On the RMA Detail section, search a Kit device and select Reason for RMA
    ...    - 3. Change to the other device ID
    ...
    ...     Expected Results:
    ...    - 1. The reason for RMA must be reset

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-13     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-07: Select the reason for RMA (Blood Pressure Cuff) in the RMA Details section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the reason for RMA in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, click the Reason for RMA field
    ...    - 2. Observe the Reason for RMA field
    ...    - 3. Click on the Reason for RMA field
    ...
    ...     Expected Results:
    ...    - 1. The “Reason for RMA” shall be disabled when the device ID is empty
    ...    - 2. There shall be a list of reason in the drop down list for the user to select the reason, including:
    ...    + Charging Issue
    ...    + Account Pairing Issue
    ...    + Device Errors (describe)
    ...    + Device Dead on Arrival
    ...    + Bluetooth Connection Issue
    ...    + Damaged (describe)
    ...    + Courtesy RMA
    ...    + Return to Stock
    ...    + Other (describe)

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-07     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-14: Select the reason for RMA (Digital Thermometer) in the RMA Details section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the reason for RMA in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, click the Reason for RMA field
    ...    - 2. Observe the Reason for RMA field
    ...    - 3. Click on the Reason for RMA field
    ...
    ...     Expected Results:
    ...    - 1. The “Reason for RMA” shall be disabled when the device ID is empty
    ...    - 2. There shall be a list of reason in the drop down list for the user to select the reason, including:
    ...    + Charging Issue
    ...    + Device Dead on Arrival
    ...    + Bluetooth Connection Issue
    ...    + Damaged (describe)
    ...    + Courtesy RMA
    ...    + Return to Stock
    ...    + Other (describe)

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-14     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-RD-15: Select the reason for RMA (Pulse Oximeter) in the RMA Details section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Select the reason for RMA in the RMA Details section
    ...
    ...     Precondition:
    ...     - 1. The OM/OS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. On the RMA Details section, click the Reason for RMA field
    ...    - 2. Observe the Reason for RMA field
    ...    - 3. Click on the Reason for RMA field
    ...
    ...     Expected Results:
    ...    - 1. The “Reason for RMA” shall be disabled when the device ID is empty
    ...    - 2. There shall be a list of reason in the drop down list for the user to select the reason, including:
    ...    + Charging Issue
    ...    + Device Dead on Arrival
    ...    + Bluetooth Connection Issue
    ...    + Damaged (describe)
    ...    + Courtesy RMA
    ...    + Return to Stock
    ...    + Other (describe)

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-RD-15     RS-020-04   R1    SC-1.14.0     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
#CREATE
BSP-SUPPORT-RMA-CREATE-BIOK-08: Check the message when the ticket is created by Support Staff
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the message when the ticket is created by Support Staff
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page 
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...    - 1. The SS creates a RMA ticket on Support portal
    ...    - 2. Observe the message after clicking on the [Create Ticket] button
    ...
    ...     Expected Results:
    ...    - 1. There shall be a message: “You are going to create this RMA request.
    ...     The Service team will get it to handle on the Service portal.
    ...     If you are sure you want to move forward with the action, please confirm below”.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-08     RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-10: Check that the ticket can be created after confirming
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: RMA ticket can be created after confirming
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...
    ...     Test Steps:
    ...     - 1. Click [Create ticket] button.
    ...     - 2. Click [Confirm] button in the modal.
    ...     - 3. Observe the result.
    ...
    ...     Expected Results:
    ...     - 1. The ticket is changed status to "In Process" and moved to In Process tab in Service portal.
    ...     - 2. The user is redirected to the list of RMA requests.
    ...     - 3. Included devices' status changed to "RMA"
    ...     - 4. There shall be an email send to Service@biotricity.com and the people who are in the noticication email

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-10    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-11: Check that the ticket the modal must be exited when clicking Back button
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: ticket the modal must be exited when clicking Cancel button
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 2. The device type is Biokit
    ...     - 4. There shall be an email send to Service@biotricity.com and the people who are in the noticication email
    ...
    ...     Test Steps:
    ...     - 1. Click [Create ticket] button.
    ...     - 2. Click [Back] button in the modal.
    ...
    ...     Expected Results:
    ...     - 1. Exit the modal.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-11    RS-020-04   R1    manual    SC-1.14.0
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-12: Check the email content sent to service@biotricity.com and the people who are in the “Notification email”
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Check the email content
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 3. The user clicks on [Create Ticket] button
    ...     - 4. The customer type is “End User”
    ...
    ...     Test Steps:
    ...     - 1. Check the email content
    ...
    ...     Expected Results:
    ...     - 1. The email subject: [Facility_Name]: RMA request – [RMA_ID]
    ...     - 2. A new RMA request by [Clinic_Username], [Clinic_Role] has been sent to you with the following message:
    ...     - Device ID, Reason for RMA, Patient Inpact, Date of event
    ...     - 3. Clinic note
    ...     - 4. Clinic Information
    ...     + [Clinic email]
    ...     + [Clinic phone number]
    ...     + [Clinic Shipping address]
    ...     - 5. Thank you, Biotricity RMA Service Team

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-12     RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-13: There is an email send to Billing and Service in the case the ticket has “Return to Stock” reason
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  There is an email send to Billing and Service in the case the ticket has “Return to Stock” reason
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 3. The customer type is “End User”, the user clicks on [Create Ticket] button
    ...     - 4. The reason for RMA is “Return to Stock”
    ...
    ...     Test Steps:
    ...     - 1. Create ticket that has “Return to Stock” reason
    ...
    ...     Expected Results:
    ...     - 1. It will be sent to service@biotricity.com. billing@biotricity.com and the people who are in the “Notification email”

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-13     RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-CREATE-BIOK-14: Click on [Cancel]/[Return] button when the user makes changes in the "New RMA ticket"
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Click on [Cancel]/[Return] button when the user makes changes in the "New RMA ticket"
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create new RMA request page
    ...     - 3. The customer type is “End User”
    ...
    ...     Test Steps:
    ...     - 1. The user makes changes in the "New RMA ticket"
    ...     - 2. Click on the "Cancel" button / "Return" button
    ...     - 3. Click on "Leave" button on the pop-up
    ...     - 4. CLick on "Stay" button on the pop-up
    ...
    ...     Expected Results:
    ...     - 1. There shall be a confirmation with the message “You have unsaved changes.
    ...     Are you sure you want to leave this page?” with “Leave” and “Stay” buttons
    ...     - 2.The “Leave” button shall redirect the user to the previous page, discarding any changes made to the page.
    ...     - 3.The “Stay” button shall exit the confirmation.

    [Tags]    BSP-SUPPORT-RMA-CREATE-BIOK-14     RS-020-04   R1    SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

#TODO: WARNING
BSP-SUPPORT-RMA-WARNING-01: Unusual RMA activity warning
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Unusual RMA activity warning
    ...
    ...     Precondition:
    ...     - 1. The sum of current Bioflux/Biotres RMA devices and the Inbound devices
    ...     of Completed RMA tickets for the facility in the past 30 days from the current date,
    ...     both with the reasons for RMA “Protect+” and “Return for Maintenance”,
    ...     exceeds 20% of the facility’s current “Usable” Bioflux/Biotres devices
    ...     - 2. The sum of current Bioflux/Biotres RMA devices and the Inbound devices
    ...     of Completed RMA tickets for the facility in the past 30 days from the current date,
    ...     both with the reasons for RMA other than “Protect+” and “Return for Maintenance”,
    ...     exceeds 20% of the facility’s current “Usable” Bioflux/Biotres devices
    ...
    ...     Test Steps:
	...		- 1. Observe the facility name in RMA list in Support Portal
	...		- 2. Observe the header of the New ticket details in Support Portal
	...		- 3. Observe the facility information section in Create ticket page in Support Portal
	...     Expected Results:
    ...     - 1. There shall be the sidebar to display the unusual RMA warning information message.
    ...     If both conditions apply, the messages shall be displayed separately
    ...     + “Usable” devices are defined as the total assigned devices for the facility minus RMA devices, Renewal devices, and End of Service devices.
    ...     + End of Service devices are devices that haven’t connected to the system in over 6 months.
    ...     - 2. The calculations are redone every day
    ...     - 3. There shall be the icon next to the facility name to indicate the Unusual RMA warning

    [Tags]    BSP-SUPPORT-RMA-WARNING-01  RS-100-01   R1     SC-1.14.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

# * RMA LIMIT
BSP-SUPPORT-RMA-LIMIT-CREATE-01: The message indicating the device limit per RMA ticket is displayed
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: The message indicating the device limit per RMA ticket is displayed
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...
    ...     Test Steps:
    ...    - 1. Observe the page
    ...
    ...     Expected Results:
    ...    - 1. The message indicating the device limit per RMA ticket is displayed “Please note that you can only add a
    ...  maximum of [limit number] devices per ticket, except for 'Return to Stock' and 'Lost Device' reasons.”

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-01   RS-020    SC-1.15.0    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-CREATE-02: Check when clicking Add device button, if reasons other than Lost Device/Return to Stock then user cannot add more than the device limit number
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: when clicking Add device button, if reasons other than Lost Device/Return to Stock, then user cannot add more than the device limit number
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...     - 2. The device type is Bioflux/Biotres
    ...
    ...     Test Steps:
    ...    - 1. Select the facility/end user and enter required fields of customer information
    ...    - 2. In RMA details section, select RMA devices that have reason in Device Issues. The number of devices selected is larger the limited number
    ...    - 3. Click [Create Ticket] button
    ...
    ...     Expected Results:
    ...    - 1. Error message “Number of RMA devices per ticket exceeded.” is displayed

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-02   RS-020   R1    SC-1.15.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-CREATE-03: Check that RMA ticket can be created
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: RMA ticket can be created
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...     - 2. The device type is Bioflux/Biotres
    ...
    ...     Test Steps:
    ...    - 1. Select the facility/end user and enter required fields of customer information
    ...    - 2. In the RMA details section, select the RMA devices and reason for RMA
    ...    + Each RMA ticket can only have a maximum number of devices that have Reason for RMAs other than “Lost Device” and “Return to Stock”
    ...    - 3. Enter required fields
    ...    - 4. Click [Create ticket] button
    ...    - 5. The confirmation pop-up is displayed, click Confirm to create the ticket
    ...
    ...     Expected Results:
    ...    - 1. Confirmation pop-up “You are going to create this RMA request. The Service team will get it to handle on the Service portal. If you are sure you want to move forward with the action, please confirm below” is displayed
    ...    - 2. The ticket should be created in the ‘In Process’ tab on S&D portal, and the user should be redirected to the list of RMA requests.

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-03   RS-020    SC-1.15.0    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-CREATE-04: Check that error message is displayed when clicking Create ticket button if the number of devices exceed the daily RMA devices for the facility
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: error message is displayed when clicking Create ticket button if the number of devices exceed the daily RMA devices for the facility
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...     - 2. The device type is Bioflux/Biotres
    ...     - 3. Total of daily RMA devices of selected facility reached the limit of daily RMA devices
    ...
    ...     Test Steps:
    ...    - 1. Select the facility/end user and enter required fields of customer information
    ...    - 2. In the RMA details section, select the RMA devices
    ...    - 3. Enter required fields
    ...    – 4. Click [Create ticket] button
    ...    - 5. The confirmation pop-up is displayed, click Confirm to create the ticket
    ...
    ...     Expected Results:
    ...    - 1. Display error message “[limit number] daily RMA devices for facility exceeded”
    ...    - 2. The Support team can only approve a maximum number of RMA devices per day for a facility

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-04   RS-020    SC-1.15.0    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-CREATE-05: Check that error message is displayed when clicking Create ticket button if the ticket were to exceed the daily RMA tickets approval limit set for Support Team
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: error message is displayed when clicking Create ticket button if the ticket were to exceed the daily RMA tickets approval limit set for Support Team
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...     - 2. The device type is Bioflux/Biotres
    ...     - 3. Total of daily approval RMA tickets reached the daily RMA tickets approval limit set for Support Team
    ...
    ...     Test Steps:
    ...    - 1. Select the facility/end user and enter required fields of customer information
    ...    - 2. In the RMA details section, select the RMA
    ...    - 3. Enter required fields
    ...    - 4. Click [Create ticket] button
    ...    - 5. The confirmation pop-up is displayed, click Confirm to create the ticket
    ...
    ...     Expected Results:
    ...    - 1. Display error message “[limit number] RMA tickets approval per day limit exceeded”
    ...    - 2. The Support team can only approve a maximum number of RMA tickets per day

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-05   RS-020    SC-1.15.0    R1     manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-CREATE-06: Check that Reason for RMA must be displayed correctly
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: Reason for RMA must be displayed correctly
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...     - 2. The device type is Bioflux/Biotres
    ...
    ...     Test Steps:
    ...    - 1. Select the facility/end user
    ...    - 2. In RMA details section, select RMA device, click on reason for RMA and observe
    ...
    ...     Expected Results:
    ...    - 1. There are 2 reason type
    ...    a. For Bioflux
    ...    + Device Issues (select all that apply): Charging Issue, Device Errors (describe), ECG Issue, No Cell Connection, Screen Issue, Broken Charger, Closed Account, Courtesy RMA, Other (describe)
    ...    + Other Issues (select one, cannot combine with device issues): Return to Stock, Lost Device
    ...    b. For Biotres
    ...    + Device Issues (select all that apply): Charging Issue, Device Errors (describe), Device Dead on Arrival, Connection Issue, ECG Leads, Damaged (describe), Closed Account, Courtesy RMA, Other (describe)
    ...    + Other Issues (select one, cannot combine with device issues): Return to Stock, Lost Device
    ...    - 2. Each reason is displayed with checkbox

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-06   RS-020    SC-1.15.0    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-CREATE-07: Check that select Reason for RMA is “Device Issues” then cannot select “Lost Device” or “Return to Stock”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: select Reason for RMA is “Device Issues” then cannot select “Lost Device” or “Return to Stock”
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...     - 2. The device type is Bioflux/Biotres
    ...
    ...     Test Steps:
    ...    - 1. Select the facility/end user and enter required fields of customer information
    ...    - 2. In RMA details section, select RMA device, reason for RMA is Device Issues reason
    ...    - 3. Observe the reason for RMA section
    ...
    ...     Expected Results:
    ...    - 1. The selected options are displayed on Reason for RMA field
    ...    - 2. Multi options can be selected
    ...    - 3. Other reasons field (Lost Device, Return to Stock) is hidden

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-07   RS-020    SC-1.15.0    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-CREATE-08: Check that select Reason for RMA is “Lost Device” or “Return to Stock” then cannot select “Device Issues”
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: select Reason for RMA is “Lost Device” or “Return to Stock” then cannot select “Device Issues”
    ...
    ...     Precondition:
    ...     - 1. The SS is on Create RMA Request page
    ...     - 2. The device type is Bioflux/Biotres
    ...
    ...     Test Steps:
    ...    - 1. Select the facility/end user and enter required fields of customer information
    ...    - 2. In RMA details section, select RMA device, reason for RMA is Other reasons (Lost Device, Return to Stock)
    ...    - 3. Observe the reason for RMA section
    ...
    ...     Expected Results:
    ...    - 1. The selected options are displayed on Reason for RMA field
    ...    - 2. Device Issues field is hidden

    [Tags]    BSP-SUPPORT-RMA-LIMIT-CREATE-08   RS-020    SC-1.15.0    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-APPROVE-01: Check that error message is displayed when clicking Create ticket button if the number of devices exceed the daily RMA devices for the facility
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: error message is displayed when clicking Create ticket button if the number of devices exceed the daily RMA devices for the facility
    ...
    ...     Precondition:
    ...     - 1. The SS is on New RMA details page
    ...     - 2. The device type is Bioflux/Biotres
    ...     - 3. Total of daily RMA devices of selected facility reached the limit of daily RMA devices
    ...
    ...     Test Steps:
    ...    - 1. Click [Approve] button
    ...    - 2. The confirmation pop-up is displayed, click Confirm to approve the ticket
    ...
    ...     Expected Results:
    ...    - 1. Display error message “[limit number] daily RMA devices for facility exceeded”
    ...    - 2. The Support team can only approve a maximum number of RMA devices per day for a facility
    
    [Tags]    BSP-SUPPORT-RMA-LIMIT-APPROVE-01   RS-020    SC-1.15.0    R1    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-APPROVE-02: Check that error message is displayed when clicking Create ticket button if the ticket were to exceed the daily RMA tickets approval limit set for Support Team
    [Documentation]  Author: Linh Nguyen
    ...
    ...     Description: error message is displayed when clicking Create ticket button if the ticket were to exceed the daily RMA tickets approval limit set for Support Team
    ...
    ...     Precondition:
    ...     - 1. The SS is on New RMA details page
    ...     - 2. The device type is Bioflux/Biotres
    ...     - 3. Total of daily approval RMA tickets reached the daily RMA tickets approval limit set for Support Team
    ...
    ...     Test Steps:
    ...    - 1. Click [Approve] button
    ...    - 2. The confirmation pop-up is displayed, click Confirm to approve the ticket
    ...
    ...     Expected Results:
    ...    - 1. Display error message “[limit number] RMA tickets approval per day limit exceeded”
    ...    – 2. The Support team can only approve a maximum number of RMA tickets per day

    [Tags]    BSP-SUPPORT-RMA-LIMIT-APPROVE-02   RS-020  R1    SC-1.15.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-APPROVE-03: Check Bioheart, Biokit should not be limited (exceed the daily RMA tickets approval limit set for Support Team)
    [Documentation]  Author: Linh Phan
    ...

    [Tags]    BSP-SUPPORT-RMA-LIMIT-APPROVE-03  RS-020  R1    SC-1.15.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-APPROVE-04: Check Bioheart, Biokit should not be limited (exceed the daily RMA tickets approval limit set for a facility)
    [Documentation]  Author: Linh Phan
    ...

    [Tags]    BSP-SUPPORT-RMA-LIMIT-APPROVE-04  RS-020  R1    SC-1.15.0    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SUPPORT-RMA-LIMIT-APPROVE-05: Check Bioheart, Biokit should not be limited (exceed the devices in a ticket)
    [Documentation]  Author: Linh Phan
    ...

    [Tags]    BSP-SUPPORT-RMA-LIMIT-APPROVE-05  RS-020  R1    SC-1.15.0    manual
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
