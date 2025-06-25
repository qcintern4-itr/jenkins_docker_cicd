*** Settings ***
Documentation   Test Suite - Sales Portal - Authentication
Metadata    sid    SA-FAC
Metadata    owner   Linh Phan
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py   ${ENV}

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags     SA-FAC     web
Test Timeout    1h

*** Test Cases ***

SA-FAC-VIEWLIST-01: View list facility in the All facilities tab and New facilities tab
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  View list facility in the All facilities tab and New facilities tab
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Facilities page.
    ...
    ...     Test Steps:
    ...     1. Create a new facility on admin, search for the new facility in the
    ...     2. Edit the data, check the ranking table
    ...
    ...     Expected Results:
    ...     1. All facilities
    ...     2. New facilities includes:
    ...     - Eval facilities are in evaluation duration.
    ...     - Active facilities are in the first 60 days of creating.

    [Tags]  SA-FAC-VIEWLIST-01      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-SEARCH-01: Search facilities by facility name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Search facilities by facility name
    ...
    ...     Precondition:
    ...     - The sales manager/admin/sales rep is on the Facilities page.
    ...
    ...     Test Steps:
    ...     1.Observe the placeholder,
    ...     2.Input the facility name, observe the list
    ...
    ...     Expected Results:
    ...     1. "Search by facility"
    ...     2. Display the searched facility

    [Tags]  SA-FAC-SEARCH-01      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-SEARCH-02: Search facilities by sales account name
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:  Search facilities by sales account name
    ...
    ...     Precondition:
    ...     - The sales manager/admin is on the Facilities page.
    ...
    ...     Test Steps:
    ...     1.Select "search by sales account" option,
    ...     2.Input the sales account name, observe the list
    ...
    ...     Expected Results:
    ...     1. The facility should be searched by Sales account

    [Tags]  SA-FAC-SEARCH-02      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-01: View infor of an SO in the device sale list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View infor of an SO in the device sale list
    ...
    ...     Precondition:
    ...     - As a sales admin, I want to view the device sales list of a facility.
    ...     - As a sales manager/representative, I want to view the device sales list of a facility that is assigned to me.
    ...
    ...     Test Steps:
    ...     1.Create Sales order
    ...     2.Check the information of the SO displayed in the list
    ...
    ...     Expected Results:
    ...     2. Fulfillment date: the expected receiving date
    ...     3. Sales Order ID: generated when SO is created,
    ...     4. Online purchase (if any)
    ...     5. Status of Sales order: completed/in-process/cancelled
    ...     6. Device model
    ...     7.Purchase devices: the number of purchased devices of the SO
    ...     ----Total of devices: The cumulative number of devices of all sales orders of the specific facility
    ...     8. Assigned Devices-hyperlink: number of assigned devices for the specific sales order
    ...     9. Protection plan
    ...     10. Purchase type
    ...     11. Charge type
    ...     12. Unit price
    ...     13. No. of charges
    ...     14. Study pricing: Study code, Per device, Per device/Study code with Auto-event detection, flat rate
    ...     15. Notes

    [Tags]  SA-FAC-DS-01      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-02: Sort list SO
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sort list SO
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. The device sales list is sorted by all items, excluding the index number, fulfillment date,
    ...     assigned devices, device model, Protection plan, and Notes.
    ...
    ...     Expected Results:
    ...     1. The list should be sorted

    [Tags]  SA-FAC-DS-02      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-03: Filtering the view mode
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Filtering the view mode
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. Filter by All orders/ completed orders/In-process/cancelled orders
    ...     2. By default, the view list will display “all orders”.
    ...
    ...     Expected Results:
    ...     1. The list should be filtered

    [Tags]  SA-FAC-DS-03      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-04: Search for SO
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Search for SO
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. All orders/ completed orders/In-process/cancelled orders
    ...     2. By default, the view list will display “all orders”.
    ...     - User could search by the below attributes:
    ...     - Sales order ID
    ...     - Device ID
    ...     - Fulfillment date
    ...     - By default, “Sales order ID” is selected
    ...
    ...     Expected Results:
    ...     1. Display the result

    [Tags]  SA-FAC-DS-04      SA-FRS-8-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-05: Add new device sales, check step 1
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add new device sales
    ...
    ...     Precondition:
    ...     - The sales admin is on the Device Sales tab of the Sales facility details page.
    ...
    ...     Test Steps:
    ...     1.Click on the [New devices sales] button
    ...     2.Observe step 1: Sale information
    ..      3. Check the default value and allowed values on each fields
    ...
    ...     Expected Results:
    ...     1. The user is navigated to a new page to add new device sales.
    ...     2.
    ...     -- Online purchase toggle
    ...     -- Fulfillment Date (required): The expected receiving date. By default, it is displayed the current day.
    ...     -- Device Model (required): 2 types of devices
    ...     -- Number of devices (required): the number of new devices at that time, it is a positive integer.
    ...     -- Protection plan:  the value can be Not Apply (Default) or Apply.
    ...     -- Purchased type: the value can be Installment (Default) or Purchase.
    ...     -- Charge type: the value can be Immediate (Default) or Deferred
    ...     -- Unit Price (required): the price of each device. It is a positive integer or “0”.
    ...     -- Number of charges (required): the number of times to charge, it is a natural number.

    [Tags]  SA-FAC-DS-05     SA-FRS-15-01-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-06: Add new device sales, check step 2
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add new device sales
    ...
    ...     Precondition:
    ...     - The sales admin is on the Device Sales tab of the Sales facility details page.
    ...     - The SA is on step 1 of an SO
    ...
    ...     Test Steps:
    ...     1.Click on Cancel button,
    ...     2.Click on Next button
    ...     3.Observe step 2: Study pricing
    ...     4.Check the default value and allowed values on each fields
    ...
    ...     Expected Results:
    ...     1. The user are back to the Device sales page.
    ...     2. The user moves to the step 2 screen.
    ...     3.
    ...     -- Effective month: the month-time to apply the study pricing to the device sales. It is autofilled by the month of the set Fulfillment date on step 1.
    ...     ---- User could select the month after the “Fulfillment date”
    ...     -- Device Model: autofilled by the selected device model on step 1. This field is disable.
    ...     -- Device Model (required): 2 types of devices
    ...     -- Study Pricing Type: There are 3 options: Study Code, Flat Rate, and Per Device.
    ...     ----- If device model is “Bioflux”, the “Study code” is selected by default.
    ...     ----- If device model is “Biotres”, the “Per device” is selected by default.
    ...     -- Study code: check the pricing base on the device modal Bioflux/Biotres
    ...     -- Flat rate: check the fields
    ...     -- Per device: check the fields
    ...     -- In the case Device model is "Biotres", there shall be “Enable Auto Event Detection.”.

    [Tags]  SA-FAC-DS-06      SA-FRS-15-01-02    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-07: Add new device sales, create
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add new device sales
    ...
    ...     Precondition:
    ...     - The sales admin is on the Device Sales tab of the Sales facility details page.
    ...     - The SA completes all fields on step 2 of an SO
    ...
    ...     Test Steps:
    ...     1.Click on Cancel button,
    ...     2.Click on Previous button
    ...     3.Click on Create button
    ...
    ...     Expected Results:
    ...     1. The user is back to the Device sales list
    ...     2. The user is back to the step 1
    ...     3. The new Device sales is added. The user is redirected to the device sales list.
    ...     -- a Sale order ID auto defined
    ...     -- A SO ticket created on Service portal, check infor of the SO in the transfer ticket
    ...     -- The default status when a sales order is placed is “In-Process”.
    ...     -- Error message on the uncompleted field(s).
    ...     -- If user select device model “Biotres” and select option “Enable Auto Event Detection.”, a confirmation pop-up
    ...     ---- Check auto tag on Clinic portal

    [Tags]  SA-FAC-DS-07      SA-FRS-15-01-02    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-08: Edit Device sale information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add new device sales
    ...
    ...     Precondition:
    ...     - The sales admin is on the “view devices sales” screen.
    ...     - The Device sales is having status “In-process” or “Completed.”
    ...
    ...     Test Steps:
    ...     1.Click on [Edit] button in the Order Information section
    ...     2.View the information of the SO
    ...     3.Check the default value and allowed values on each fields
    ...     4.Check the information after edit
    ...
    ...     Expected Results:
    ...     2. Display correct inputted information
    ...     3. The user can edit:
    ...     -- Online purchase toggle, display confirmation pop-up
    ...     -- Fulfillment Date: User can select the fulfillment date which is before the effective date of study pricing
    ...     -- Number of devices: This field cannot be edited for device sales has status “completed” or has shipment label.
    ...     ---- In the case NOD is negative number: user can edit but not adjust to positive
    ...     -- Protection plan:
    ...     -- Purchased type:
    ...     -- Charge type:
    ...     -- Unit Price (required): the price of each device. It is a positive integer or “0”.
    ...     -- Number of charges (required): the number of times to charge, it is a natural number.
    ...     -- 4. The edit infor shall be displayed

    [Tags]  SA-FAC-DS-08      SA-FRS-15-01-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-09: Edit Device sale information
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add new device sales
    ...
    ...     Precondition:
    ...     - The sales admin is on the “view devices sales” screen.
    ...     - The Device sales is having status “In-process” or “Completed.”
    ...
    ...     Test Steps:
    ...     1.Click on [Edit] button in the Order Information section
    ...     2.View the information of the SO
    ...     3.Check the default value and allowed values on each fields
    ...     4.Check the information after edit
    ...
    ...     Expected Results:
    ...     2. Display correct inputted information
    ...     3. The user can edit:
    ...     -- Online purchase toggle, display confirmation pop-up
    ...     -- Fulfillment Date: User can select the fulfillment date which is before the effective date of study pricing
    ...     -- Number of devices: This field cannot be edited for device sales has status “completed” or has shipment label.
    ...     ---- In the case NOD is negative number: user can edit but not adjust to positive
    ...     -- Protection plan:
    ...     -- Purchased type:
    ...     -- Charge type:
    ...     -- Unit Price (required): the price of each device. It is a positive integer or “0”.
    ...     -- Number of charges (required): the number of times to charge, it is a natural number.
    ...     -- 4. The edit infor shall be displayed

    [Tags]  SA-FAC-DS-09      SA-FRS-15-01-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-10: Edit Note
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit Note

    [Tags]  SA-FAC-DS-10      SA-FRS-15-01-01    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-11: View and edit the created pricing
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View and edit the created pricing
    ...
    ...     Precondition:
    ...     - The sales admin is on the “view devices sales” screen.
    ...
    ...     Test Steps:
    ...     1.Click on [View] button in the Study pricing section
    ...     2.Check the information
    ...     3.Click on [Edit] button in the side bar, Select/Deselect Auto event toggle,
    ...     4.Check the information after edit
    ...
    ...     Expected Results:
    ...     2. Dislay correct information of the SO
    ...     3. The user can select/deselect Auto event toggle,
    ...     --- Edit fulfilment date
    ...     4. Check the information display in the Study pricing section
    ...     --- check the auto tag on clinic portal

    [Tags]  SA-FAC-DS-11      SA-FRS-17    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-12: Add new pricing
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add new pricing
    ...
    ...     Precondition:
    ...     - The sales admin is on the “view devices sales” screen.
    ...
    ...     Test Steps:
    ...     1.Click on [New] button in the Study pricing section
    ...     2.Fill in infor
    ...
    ...     Expected Results:
    ...     1. Effective month: the month-time of the effective month for new study pricing.
    ...     -- Add new pricing for Legacy study pricing: Valid effective month is after the effective month of the latest study pricing of the facility.
    ...     -- Add new pricing for Device sales: If there are study pricing(s) on the list: Valid effective month is after the fulfillment date of the device sales.
    ...     --- Check the auto tag on clinic portal
    ...     2. Study Pricing Type, there are 3 options: Study Code, Flat Rate, and Per Device.
    ...     --- Check study code when the device modal is Bioflux/Biotres
    ...     --- Check the Flat Rate

    [Tags]  SA-FAC-DS-12      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-13: Add new pricing
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Add new pricing
    ...
    ...     Precondition:
    ...     - The sales admin is on the “view devices sales” screen.
    ...     - On Create Pricing model
    ...
    ...     Test Steps:
    ...     1.Click on [Cancel] button
    ...     2.Click on [Create] button
    ...
    ...     Expected Results:
     ...    1. Once the user presses the Cancel button, the add new pricing process is canceled. The user is redirected to the study pricing list.
    ...     2. Once the user presses the Create button, the new pricing is added to the study pricing list.
    ...     -- When user add new legacy study pricing, the device sales that are being applied the legacy study pricing shall be updated accordingly.
    ...     The user is redirected to the study pricing list.
    ...     -- If the selected effective month is the same month with the exist study pricing, there shall be a pop-up with message
    ...     -- If user select device model “Biotres” and select option “Enable Auto Event Detection.”, a confirmation pop-up shall appear with messagegit
    ...     3. When user add new legacy study pricing, the device sales that are being applied the legacy study pricing shall be updated accordingly.
    ...     -- The user is redirected to the study pricing list.

    [Tags]  SA-FAC-DS-13      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-14: Check case cannot add new pricing
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check case cannot add new pricing
    ...
    ...     Precondition:
    ...     - The sales admin is on the “view devices sales” screen.
    ...     - On SO detail
    ...
    ...     Test Steps:
    ...     1. For the device sales that have status “Completed” and haven’t had any assigned device
    ...
    ...     Expected Results:
     ...    1. The add new button is disable
    ...     2. When user hover to the button, there shall be a message: “Could not add new study pricing to this device sales. Kindly update pricing on the Legacy Study Pricing section.”

    [Tags]  SA-FAC-DS-14      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-15: Send notification email when an order placed
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Send notification email when an order placed
    ...
    ...     Precondition:
    ...     - A new order is added successfully by the sales admin.
    ...
    ...     Test Steps:
    ...     1. Check the email content
    ...
    ...     Expected Results:
     ...    1. When the order is created successfully, there is an email sent to the Service team in the [Notification email].

    [Tags]  SA-FAC-DS-15      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-16: Cancel Device Sales
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Cancel Device Sales
    ...
    ...     Precondition:
    ...     - A new order is added successfully by the sales admin
    ...
    ...     Test Steps:
    ...     1. In the case there is no shipment label created for this sales order.
    ...     2. In the case there is shipment label created for this sales order.
    ...     3. The assigned devices are marked received on any Transfer tickets.
    ...
    ...     Expected Results:
    ...     1. The user can cancel the order
    ...     2. If there is a shipment label created for this order, the cancel button is disabled,
    ...     when user hovers the cancel button, there is a message “Cannot cancel because a shipment order has already been created”
    ...     3. when user hovers the cancel button, there is a message “Cannot cancel because assigned device(s) have been marked as completed.”
    ...     The Assigned device shall shall take precedence if both conditions meet

    [Tags]  SA-FAC-DS-16      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-17: View Program log
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View Program log
    ...
    ...     Precondition:
    ...     - User is on the Protect+ sub-tab of the Facilities page
    ...
    ...     Test Steps:
    ...     1. Subscribe/ unsubscribe Protect+
    ...     2. Subscribe/ unsubscribe Renewal Stock
    ...
    ...     Expected Results:
    ...    1.Date: MM/YYYY
    ...    2.Activity: Renewal Stock/Protect + subscribed/unsubscribed
    ...    3.Check toast message

    [Tags]  SA-FAC-DS-17      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-18: View Program log
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View Program log
    ...
    ...     Precondition:
    ...     - User is on the Protect+ sub-tab of the Facilities page
    ...
    ...     Test Steps:
    ...     1. Subscribe/ unsubscribe Protect+
    ...     2. Subscribe/ unsubscribe Renewal Stock
    ...
    ...     Expected Results:
    ...    1.Date: MM/YYYY
    ...    2.Activity: Renewal Stock/Protect + subscribed/unsubscribed

    [Tags]  SA-FAC-DS-18      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-19: Subscribe Protect+ for Facility
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Subscribe Protect+ for Facility
    ...
    ...     Precondition:
    ...     - User is on the Protect+ sub-tab of the Facility page
    ...
    ...     Test Steps:
    ...     1. Subscribe Protect+
    ...     2. Unsubscribe Protect+
    ...
    ...     Expected Results:
    ...    1. There shall be a confirmation pop-up when the button is clicked.
    ...    2. Check the log
    ...    3. Check the reason in the maintenance tab (Protect+ / Return for maintenance)

    [Tags]  SA-FAC-DS-19      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-20: Subscribe Renewal stock for Facility
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Subscribe Renewal stock+ for Facility
    ...
    ...     Precondition:
    ...     - User is on the Protect+ sub-tab of the Facility page
    ...
    ...     Test Steps:
    ...     1. Subscribe Renewal stock
    ...     2. Unsubscribe Renewal stock
    ...
    ...     Expected Results:
    ...    1. There shall be a confirmation pop-up when the button is clicked.
    ...     -- Check the log
    ...     -- Check "Renewal section" in the Device Sale ticket on Service portal
    ...     -- Check "Renewal section" in the Device Transfer of the Active facility (shall be updated)
    ...     -- Check the renewal section in the RMA request
    ...    2. There shall be "Return renewal device" ticket generated on Service portal
    ...     --  Check the log
    ...     -- Check no "Renewal section" in the Device Sale ticket on Service portal
    ...     -- Can not create transfer ticket for the Active facility (shall be updated)
    ...     -- Check no renewal section in the RMA request

    [Tags]  SA-FAC-DS-20      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-21: Returning email to ship back Renewal Devices to Biotricity
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Returning email to ship back Renewal Devices to Biotricity
    ...
    ...     Precondition:
    ...     - The facility still has devices in renewal stock
    ...
    ...     Test Steps:
    ...     1. Sales admin unsubscribe Renewal Stock
    ...     2. Check the email content
    ...
    ...     Expected Results:
    ...    1. An email will be sent to cs@biotricity.com; service@biotricity.com; and email of the sales rep associated
    ...     with that facility to inform them that an RMA ticket is waiting to proceed.

    [Tags]  SA-FAC-DS-21      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-22: Returning email to ship back Renewal Devices to Biotricity
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Returning email to ship back Renewal Devices to Biotricity
    ...
    ...     Precondition:
    ...     - The facility still has devices in renewal stock
    ...
    ...     Test Steps:
    ...     1. Sales admin unsubscribe Renewal Stock
    ...     2. Check the email content
    ...
    ...     Expected Results:
    ...    1. An email will be sent to cs@biotricity.com; service@biotricity.com; and email of the sales rep associated
    ...     with that facility to inform them that an RMA ticket is waiting to proceed.

    [Tags]  SA-FAC-DS-22      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-23: Sign in the Clinic portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sign in the Clinic portal
    ...
    ...     Precondition:
    ...     - The user log in SSO
    ...     - The user is on the details of Facility page.
    ...
    ...     Test Steps:
    ...     1. Clicking on the button,
    ...     2. Select an option, check the message
    ...     3. Then click on [Continue] button
    ...
    ...     Expected Results:
    ...     1. There is a modal 'Clinic Portal’ and ‘Billing Portal’, default selecting ‘Clinic Portal’.
    ...     2. Check content of the message in the modal
    ...     3.  -- The user shall go to the Clinic portal (on a new tab) with the selected facility as Clinic technician role – ‘Clinic portal’ is selected.
    ...         -- The user shall go to the Billing portal (on a new tab) with the selected facility as Billing user role - ‘Billing portal’ is selected.

    [Tags]  SA-FAC-DS-23      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-24: Notification email to transfer renewal devices (fulfillment)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Notification email to transfer renewal devices (fulfillment)
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1. A facility is checked for both Protect+ and Renewal stock
    ...     2. Check the email content
    ...
    ...     Expected Results:
    ...     1. There shall be an automated email prompting the Service team (service@biotricity.com) to fulfill the renewal devices for the facility.
    ...     -- If the needed number of renewal devices is 0, there shall not be an automated email prompting the Service team.

    [Tags]  SA-FAC-DS-24      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-25: View legacy study pricing list
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View legacy study pricing list
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. Observe the attributes
    ...     2. Check the information
    ...
    ...     Expected Results:
    ...     1. Device model:
    ...     -- Efective since: the month of the created pricing
    ...     -- Study pricing type: the lasted pricing
    ...     -- Purchase devices: ??
    ...     -- Assigned dveices: total of devices belong to the facility
    ...     2. Same as detail

    [Tags]  SA-FAC-DS-25      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-26: Edit a study pricing of a Legacy study pricing (Biotres)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit a study pricing of a Legacy study pricing
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. The sales admin is on the detail page of a Legacy study pricing
    ...     2. The sales admin presses the [view] button on each row of the legacy study pricing (BIoflux/Biotres)
    ...     3. Edit the latest study pricing: Effective month, and Notes
    ...
    ...     Expected Results:
    ...     1. Only the latest study pricing can be edited.
    ...     3.-- The device sales that are being applied the legacy study pricing shall be updated accordingly.
    ...     -- Check the Auto tag on clinic for Biotres after select/deselect
    ...     -- The valid effective month to select is after the previous effective month on the list of study pricing.
    ...     -- If the study pricing is not the latest study pricing, there shall be a message “You only can edit the latest study pricing.”

    [Tags]  SA-FAC-DS-26      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-27: Edit a study pricing of a Legacy study pricing (Bioflux)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit a study pricing of a Legacy study pricing
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. The sales admin is on the detail page of a Legacy study pricing
    ...     2. The sales admin presses the [view] button on each row of the legacy study pricing (BIoflux/Biotres)
    ...     3. Edit the latest study pricing: Effective month, and Notes
    ...
    ...     Expected Results:
    ...     1. Only the latest study pricing can be edited.
    ...     3.-- The device sales that are being applied the legacy study pricing shall be updated accordingly.
    ...     -- The valid effective month to select is after the previous effective month on the list of study pricing.
    ...     -- If the study pricing is not the latest study pricing, there shall be a message “You only can edit the latest study pricing.”

    [Tags]  SA-FAC-DS-27      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-28: Edit a study pricing of a Device sales (Bioflux/Biotres)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Edit a study pricing of a Device sales (Bioflux/Biotres)
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. The sales admin is on the detail page of a device sales that does not have status “complete” and have assigned device
    ...     2. The sales admin press the [view] button on each row of the study pricing on [study pricing section]
    ...
    ...     Expected Results:
    ...     1. User clicks [Edit] to edit the Effective month, Enable Auto-event for Biotres
    ...     -- The device sales that are being applied the current study pricing shall be updated accordingly.
    ...     -- Check the Auto tag on clinic for Biotres after select/deselect
    ...     -- The valid effective month to select is after the fulfillment date of the Device Sales
    ...     -- For the device sales that have status “Completed” and haven’t had any assigned device,
    ...     the edit button is disable. When user hover to the button, there shall be a message:
    ...     “Could not edit study pricing to this device sales. Kindly update pricing on the Legacy Study Pricing section.”

    [Tags]  SA-FAC-DS-28      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-29: View device sales log - Replace device by active device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View device sales log - Replace device by active device
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. Check completed/ complete ticket in RMA Outbound
    ...     2. Uncheck complete outbound
    ...
    ...     Expected Results:
    ...     1. Device <Device ID> was replaced by <Device ID>; Completed Outbound RMA <RMA ID>
    ...     2. Device <Device ID> was re-assigned to facility, Unchecked complete Outbound RMA <RMA ID>

    [Tags]  SA-FAC-DS-29      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-30: View device sales log - Device is added to an RMA ticket without being repaired/ replaced and user complete the ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View device sales log
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. Device is added to an RMA ticket without being repaired/ replaced and user complete the ticket
    ...
    ...     Expected Results:
    ...     1. Device <Device ID> was unassigned from facility; Completed Ticket RMA <RMA ID>

    [Tags]  SA-FAC-DS-30      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-31: View device sales log - Device is transferred from active to test facility.
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View device sales log - Device is transferred from active to test facility.
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. Check completed/ completed ticket
    ...     2. Uncheck completed
    ...
    ...     Expected Results:
    ...     1. Device <Device ID> was unassigned from facility; Completed Transfer <Transfer ID>
    ...     2. Device <Device ID> was re-assigned to facility; Transfer <Transfer ID>

    [Tags]  SA-FAC-DS-31      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-32: View device sales log - Device is replaced by renewal device
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View device sales log -Device is replaced by renewal device
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. When RMA ticket contains renewal devices is created
    ...     2. When the RMA ticket is canceled
    ...     3. When ticket is marked completed
    ...
    ...     Expected Results:
    ...     1. Renewal device [Device ID] is being used; Added Inbound RMA <RMA ID>
    ...     2. Device <Device ID> is returned to Renewal; Canceled Inbound RMA <RMA ID>
    ...     3. Device <Device ID> was unassigned from facility; Completed RMA <RMA ID>
    ...     --     If the device does not have any logs, it shall display the text “There is no data to display.”

    [Tags]  SA-FAC-DS-32      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-33: View the assigned devices section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the assigned devices section
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. Assign device to the SO ticket on service portal, Observe the section
    ...
    ...     Expected Results:
    ...     1. Total of assigned devices for this device sales
    ...     2. A table with the below attributes:
    ...     --   Device ID
    ...     --   Device status, could be: Active or RMA
    ...     --   Location, could be: Inventory or Facility
    ...     --   If there is no device, message “There is no data to display” shall be displayed on the field.

    [Tags]  SA-FAC-DS-33      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

SA-FAC-DS-34: View the assigned devices section
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View the assigned devices section
    ...
    ...     Precondition:
    ...     - The sales manager/admin/representative is on the Device Sales tab of the Facility details page.
    ...
    ...     Test Steps:
    ...     1. Assign device to the SO ticket on service portal, Observe the section
    ...
    ...     Expected Results:
    ...     1. Total of assigned devices for this device sales
    ...     2. A table with the below attributes:
    ...     --   Device ID
    ...     --   Device status, could be: Active or RMA
    ...     --   Location, could be: Inventory or Facility
    ...     --   If there is no device, message “There is no data to display” shall be displayed on the field.

    [Tags]  SA-FAC-DS-34      SA-FRS-18    manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#update cac case giữa service và list assigned device



*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_services_and_distribution_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To SD Portal Page
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser