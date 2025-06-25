*** Settings ***
Documentation   Test Suite - Admin Portal - Others
Metadata    sid     AP-OTHER
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_admin_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      AP-OTHER    web
Test Timeout    1h

*** Test Cases ***
AP-OTHER-DEVICE-INFO-01: Quick access to device information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quickly view the device’s information
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  On Devices page, click [Device ID] hyperlink
    ...     - 2. On Edit Facility page >> Assigned Devices tab, click [Device ID] hyperlink
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 1,2 - Devices information shall be displayed to the user on the right sidebar, including:
    ...     - - Device <Device ID>
    ...     - - General Info
    ...     - + Facility
    ...     - + Model
    ...     - + Firmware Version
    ...     - + Timezone
    ...     - + SIM ICCID
    ...     - + Operator
    ...     - + Network Mode
    ...     - + Device lifetime
    ...     - + Status
    ...     - - Last Synced Status
    ...     - + RSSI
    ...     - + Lead On
    ...     - + Battery Level
    ...     - + SD Card Free Space
    ...     - + Charging State
    ...     - + Last Connect
    ...     - - For the End of life devices, there shall be a message at the bottom of the sidebar: “This device has reached its end of life.”
    ...     - - For the Renewal devices, there shall be a message at the bottom of the sidebar: “This device is marked as renewal device.”
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-INFO-01            manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-01: View Devices log in case of creating new device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case of creating new device
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Create new device
    ...     - 2. On Devices page, click [View Device Logs] button
    ...     - 3. On Edit Device page, click [View Device Logs] button
    ...     - 4. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 5. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2, 3, 4 - The device logs shall be displayed:
    ...     - - Device created with Device ID <Device ID>, model <model>, and assigned to <facility> (facility ID)
    ...     - 2. Step 5- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-01    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-02: View Devices log in case of changing [Device [ID/ model]
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case of changing [Device [ID/ model]
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Edit Device ID/ model
    ...     - 2. On Devices page, click [View Device Logs] button
    ...     - 3. On Edit Device page, click [View Device Logs] button
    ...     - 4. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 5. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2, 3, 4 - The device logs shall be displayed:
    ...     - - Device [ID/model] changed to <new data>: was <old data>
    ...     - 2. Step 5- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-02    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-03: View Devices log in case of adding device in the Inbound/Outbound of RMA ticket or Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case of adding device in the Inbound/Outbound of RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Support portal - Add device in Inbound/Outbound of RMA ticket or Transfer ticket
    ...     - 2. On Devices page, click [View Device Logs] button
    ...     - 3. On Edit Device page, click [View Device Logs] button
    ...     - 4. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 5. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2, 3, 4 - The device logs shall be displayed:
    ...     - - Device added [Inbound/Outbound] RMA <RMA ID> or Transfer <Transfer ID>
    ...     - 2. Step 5- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-03    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-04: View Devices log in case of restarting device lifetime
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case of restarting device lifetime
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Reset device lifetime
    ...     - 2. On Devices page, click [View Device Logs] button
    ...     - 3. On Edit Device page, click [View Device Logs] button
    ...     - 4. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 5. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2, 3, 4 - The device logs shall be displayed:
    ...     - - Device lifetime is restarted: was <old device lifetime>
    ...     - 2. Step 5- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-04    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-05: View Devices log in case of changing facility of device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case of changing facility of device
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Admin - Edit Test facility of device
    ...     - 2. Support - Cancel ticket/Reject ticket/Received/unreceived Inbound/Completed/Uncompleted Outbound of RMA ticket
    ...     - 3. On Devices page, click [View Device Logs] button
    ...     - 4. On Edit Device page, click [View Device Logs] button
    ...     - 5. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 6. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2, 3, 4, 5 - The device logs shall be displayed:
    ...     - - Device facility changed to <new facility> (facility ID): was <old facility> (facility ID);
    ...     - + [Cancelled Ticket/Rejected Ticket/Received Inbound/Unreceived Inbound/Completed Outbound/Uncompleted Outbound] RMA <RMA ID>
    ...     - + [Completed/Uncompleted/Received/ Unreceived] Transfer <Transfer ID>
    ...     - 2. Step 6- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-05    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-06: View Devices log in case of changing status of device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case of changing status of device
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Support -
    ...     - + [added Inbound/added Outbound/removed Inbound/removed Outbound/Cancelled ticket/Rejected ticket/Completed ticket/Completed Outbound/Uncompleted Outbound] RMA <RMA ID>
    ...     - + [added/removed/Cancelled ticket] Transfer <Transfer ID>
    ...     - + Migrate data
    ...     - 2. Biodirect: added Biodirect <Biodirect ID>
    ...     - 3. On Devices page, click [View Device Logs] button
    ...     - 4. On Edit Device page, click [View Device Logs] button
    ...     - 5. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 6. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 1, 3, 4, 5 - The device logs shall be displayed:
    ...     - - Device status changed to <new data>: was <old data>;
    ...     - + [added Inbound/added Outbound/removed Inbound/
    ...     - removed Outbound/cancelled Ticket/rejected Ticket/completed Ticket/completed Outbound/uncompleted Outbound] RMA <RMA ID>
    ...     - + [added/removed/Cancelled ticket] Transfer <Transfer ID>
    ...     - 2. Step 2, 3, 4, 5 - Device status changed to <new data>: was <old data>; added Biodirect <Biodirect ID>
    ...     - 3. Step 6- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-06    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-07: View Devices log in case of creating new device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case of creating new device
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Create new device
    ...     - 2. On Devices page, click [View Device Logs] button
    ...     - 3. On Edit Device page, click [View Device Logs] button
    ...     - 4. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 5. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2, 3, 4 - The device logs shall be displayed:
    ...     - - Device created with Device ID <Device ID>, model <model>, and assigned to <facility> (facility ID)
    ...     - 2. Step 5- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-07    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-08: View Devices log in case Device is (not) Renewal
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Devices log in case Device is (not) Renewal
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Support - add device is (not) Renewal in Outbound/Renewal Replacement/received Inbound/
    ...     unreceived Inbound/added Outbound/removed Outbound/cancelled Ticket] or [added/removed/Received/Unreceived/ Cancelled ticket] Transfer <Transfer ID>
    ...     - 2. On Devices page, click [View Device Logs] button
    ...     - 3. On Edit Device page, click [View Device Logs] button
    ...     - 4. On Edit Facility page >> Assigned Devices tab, click [View Device Logs] button
    ...     - 5. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2, 3, 4 - The device logs shall be displayed:
    ...     - - Device is (not) Renewal;
    ...     - + (Renewal Replacement/Added Outbound/Removed Outbound/Cancelled Ticket) RMA <RMA ID>
    ...     - + [added/removed/Received/Unreceived/ Cancelled ticket] Transfer <Transfer ID>
    ...     - 2. Step 5- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOFLUX/BIOTRES-LOG-08    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-01: View logs in the case a new bioheart device is created
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in the case a new bioheart device is created
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Create new bioheart device
    ...     - 2. On Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2- The device logs shall be displayed:
    ...     - - Device created with ID <Device ID> with lot received date <lot date>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-01    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-02: View logs in the case bioheart firmware is updated
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in the case bioheart firmware is updated
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Update bioheart firmware by manual        R2 or via Bioheart/Biocare Health app
    ...     - 2. On Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2- The device logs shall be displayed:
    ...     - - Device firmware updated to [New firmware version]; was [previous firmware version]
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-02    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-03: View logs in the case bioheart device is paired with user
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in the case bioheart device is paired with user
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  Using Bioheart/Biocare Health app to pair the bioheart device
    ...     - 2. On Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2- The device logs shall be displayed:
    ...     - - Device paired with [User’s email address] on [user’s mobile phone model]
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-03    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-04: View logs in case of creating new Clinic RMA request for an active bioheart device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of creating new Clinic RMA request for an active bioheart device
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  SnD Portal- Create a Clinic RMA request for an active bioheart device
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2- The device logs shall be displayed:
    ...     - - Device added to Inbound RMA <RMA ID>
    ...     - - Device status changed to RMA: was Active; added Inbound ticket RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-04    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-05: View logs in case of creating new End User RMA request for an active bioheart device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of creating new End User RMA request for an active bioheart device
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  SnD Portal- Create an End User RMA request for an active bioheart device
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2- The device logs shall be displayed:
    ...     - - Device added to Inbound RMA <RMA ID>
    ...     - - Device status changed to RMA: was Active; added Inbound ticket RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-05    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-06: View logs in the case an active bioheart device is added to Inbound of Clinic RMA request
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in the case an active bioheart device is added to Inbound of Clinic RMA request
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart, then add an active bioheart device
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2- The device logs shall be displayed:
    ...     - - Device added to Inbound RMA <RMA ID>
    ...     - - Device status changed to RMA: was Active; added Inbound ticket RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-06       manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-07: View logs in the case an active bioheart device is added to Inbound of End User RMA request
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in the case an active bioheart device is added to Inbound of End User RMA request
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart, then add an active bioheart device
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1.  Step 2- The device logs shall be displayed:
    ...     - - Device added to Inbound RMA <RMA ID>
    ...     - - Device status changed to RMA: was Active; added Inbound ticket RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-07       manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-08: View logs in the case an active bioheart device is removed from Clinic RMA request
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in the case an active bioheart device is removed from Clinic RMA request
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1.  SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has an active bioheart device in Inbound, then remove this device from ticket
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - Device removed from Inbound RMA <RMA ID>
    ...     - Device status changed to Active: was RMA; removed Inbound ticket RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-08    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-09: View logs in the case an active bioheart device is removed from End User RMA request
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in the case an active bioheart device is removed from End User RMA request
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has an active bioheart device in Inbound, then remove this device from ticket
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - Device removed from Inbound RMA <RMA ID>
    ...     - Device status changed to Active: was RMA; removed Inbound ticket RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-09    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-10: View logs in case of marking receive a bioheart device in Inbound for Clinic RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking receive a bioheart device in Inbound for Clinic RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a bioheart device in Inbound, then check [Receive]
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - Device location changed to Inventory: was Facility; Received Inbound RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-10    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-11: View logs in case of marking receive a bioheart device in Inbound for End User RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking receive a bioheart device in Inbound for End User RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a bioheart device in Inbound, then check [Receive]
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - Device location changed to Inventory: was End User; Received Inbound RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-11    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-12: View logs in case of unmarking receive a bioheart device in Inbound for Clinic RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of unmarking receive a bioheart device in Inbound for Clinic RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a bioheart device in Inbound, then uncheck [Receive]
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - Device location changed to Facility: was Inventory; Unreceived Inbound RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-12    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-13: View logs in case of unmarking receive a bioheart device in Inbound for End User RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of unmarking receive a bioheart device in Inbound for End User RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a bioheart device in Inbound, then uncheck [Receive]
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - - Device location changed to End User: was Inventory; Received Inbound RMA <RMA ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-13    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-14: View logs in case of marking completed Clinic RMA ticket and received device in Inbound before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed Clinic RMA ticket and received device before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a bioheart device in Inbound, then check [Receive]
    ...     - 2. SnD Portal: Click [Mark completed]
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- There is no log for marking completed ticket
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-14    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-15: View logs in case of marking completed End User RMA ticket and received device in Inbound before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed End User RMA ticket and received device in Inbound before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a bioheart device in Inbound, then check [Receive]
    ...     - 2. SnD Portal: Click [Mark completed]
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- There is no log for marking completed ticket
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-15    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-16: View logs in case of marking completed Clinic RMA ticket and unreceived device before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed End User RMA ticket and unreceived device before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a bioheart device in Inbound, then uncheck [Receive]
    ...     - 2. SnD Portal: Click [Mark completed]
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to Active: was RMA; Completed ticket RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-16    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-17: View logs in case of marking completed End User RMA ticket and unreceived device before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed End User RMA ticket and unreceived device before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a bioheart device in Inbound, then uncheck [Receive]
    ...     - 2. SnD Portal: Click [Mark completed]
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to Active: was RMA; Completed ticket RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-17    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-18: View logs in case of cancelling a Clinic RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of cancelling a Clinic RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a bioheart device in Inbound
    ...     - 2. SnD Portal: Click [Cancel Ticket]
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to Active: was RMA; Cancelled ticket RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-18    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-19: View logs in case of cancelling an End User RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of cancelling an End User RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a bioheart device in Inbound
    ...     - 2. SnD Portal: Click [Cancel Ticket]
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to Active: was RMA; Cancelled ticket RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-19    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-20: View logs in case of repairing a received bioheart device in Outbound for Clinic RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of repairing a received bioheart device in Outbound for Clinic RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Add new device by repairing device from Inbound
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device added to Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-20    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-21: View logs in case of repairing a received bioheart device in Outbound for End User RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of repairing a received bioheart device in Outbound for End User RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Add new device by repairing device from Inbound
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device added to Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-21    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-22: View logs in case of removing a repaired bioheart device in Outbound for Clinic RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing a repaired bioheart device in Outbound for Clinic RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Add new device by repairing device from Inbound, then remove this device
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device removed from Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-22    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-23: View logs in case of removing a repaired bioheart device in Outbound for End User RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing a repaired bioheart device in Outbound for End User RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Add new device by repairing device from Inbound, then remove this device
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device removed from Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-23    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-24: View logs in case of replacing a received bioheart device in Outbound for Clinic RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of replacing a received bioheart device in Outbound for Clinic RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Replace a received bioheart by a new device from Biotricity
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device added to Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-24    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-25: View logs in case of replacing a received bioheart device in Outbound for End User RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of replacing a received bioheart device in Outbound for End User RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Replace a received bioheart by a new device from Biotricity
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device added to Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-25    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-26: View logs in case of removing a replaced bioheart device in Outbound for Clinic RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing a replaced bioheart device in Outbound for Clinic RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Replace a received bioheart by a new device from Biotricity, then remove this device
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device removed from Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-26    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-27: View logs in case of removing a replaced bioheart device in Outbound for End User RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing a replaced bioheart device in Outbound for End User RMA ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Replace a received bioheart by a new device from Biotricity, then remove this device
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device removed from Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-27    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-28: View logs in case of marking completed Clinic RMA ticket after adding new device in Outbound
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed Clinic RMA ticket after adding new device in Outbound
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to Clinic RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Add new device by repairing or replacing device, then click [Mark Completed] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device location changed to Facility: was Inventory; Completed Outbound RMA <RMA ID>
    ...     - - Device facility changed to <Facility name>; Completed Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-28    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-29: View logs in case of marking completed End User RMA ticket after adding new device in Outbound
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed End User RMA ticket after adding new device in Outbound
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal >> In process: Go to End User RMA ticket detail of Bioheart that has a received bioheart device in Inbound
    ...     - 2. SnD Portal >> In Outbound tab: Add new device by repairing or replacing device, then click [Mark Completed] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device location changed to End User: was Inventory; Completed Outbound RMA <RMA ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-29    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-30: View logs in case of adding an active bioheart device to Clinic Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of adding an active bioheart device to Clinic Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Create a Clinic transfer ticket, then add an active single/bundle bioheart device or add an active bioheart device in Pending transfer ticket
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - - Device added to Transfer <Transfer ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-30    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-31: View logs in case of adding an active bioheart device to End User Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of adding an active bioheart device to End User Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Create an End User transfer ticket, then add an active single/bundle bioheart device or add an active bioheart device in Pending transfer ticket
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - - Device added to Transfer <Transfer ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-31    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-32: View logs in case of adding an RMA bioheart device to Clinic Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of adding an RMA bioheart device to Clinic Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Create a Clinic transfer ticket, then add an RMA single/bundle bioheart device or add an RMA bioheart device in Pending transfer ticket
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - - Device status changed to Active: was RMA; added Transfer <Transfer ID>
    ...     - - Device added to Transfer <Transfer ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-32    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-33: View logs in case of adding an RMA bioheart device to End User Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of adding an RMA bioheart device to End User Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Create an End User transfer ticket, then add an RMA single/bundle bioheart device or add an RMA bioheart device in Pending transfer ticket
    ...     - 2. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 3. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2- The device logs shall be displayed:
    ...     - - Device status changed to Active: was RMA; added Transfer <Transfer ID>
    ...     - - Device added to Transfer <Transfer ID>
    ...     - 2. Step 3- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-33    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-34: View logs in case of removing an added active bioheart device from Clinic Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing an added active bioheart device from Clinic Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an active bioheart device to Clinic Transfer ticket
    ...     - 2. SnD Portal: Remove device added in step 1
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device removed from Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-34    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-35: View logs in case of removing an added RMA bioheart device from Clinic Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing an added RMA bioheart device from Clinic Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an RMA bioheart device to Clinic Transfer ticket
    ...     - 2. SnD Portal: Remove device added in step 1
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to RMA: was Active; removed Transfer <Transfer ID>
    ...     - - Device removed from Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-35    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-36: View logs in case of removing a added active bioheart device from End User Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing a added active bioheart device from End User Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an active bioheart device to End User Transfer ticket
    ...     - 2. SnD Portal: Remove device added in step 1
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device removed from Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-36    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-37: View logs in case of removing a added RMA bioheart device from End User Transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of removing a added RMA bioheart device from End User Transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an RMA bioheart device to End User Transfer ticket
    ...     - 2. SnD Portal: Remove device added in step 1
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 2, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to RMA: was Active; removed Transfer <Transfer ID>
    ...     - - Device removed from Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-37    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-38: View logs in case of cancelling a Clinic transfer ticket added an active device before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of cancelling a Clinic transfer ticket added an active device before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an active bioheart device to Clinic Transfer ticket
    ...     - 2. SnD Portal: Click [Cancel Ticket] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- There is no log displayed
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-38    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-39: View logs in case of cancelling a Clinic transfer ticket added an RMA device before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of cancelling a Clinic transfer ticket added an RMA device before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an RMA bioheart device to Clinic Transfer ticket
    ...     - 2. SnD Portal: Click [Cancel Ticket] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to RMA: was Active; cancelled ticket Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-39    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-40: View logs in case of cancelling an End User transfer ticket added an active device before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of cancelling an End User transfer ticket added an active device before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an active bioheart device to End User Transfer ticket
    ...     - 2. SnD Portal: Click [Cancel Ticket] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- There is no log displayed
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-40    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-41: View logs in case of cancelling an End User transfer ticket added an RMA device before
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of cancelling an End User transfer ticket added an RMA device before
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an RMA bioheart device to End User Transfer ticket
    ...     - 2. SnD Portal: Click [Cancel Ticket] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device status changed to RMA: was Active; cancelled ticket Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-41    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-42: View logs in case of marking completed a Clinic transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed a Clinic transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an active/RMA bioheart device to Clinic Transfer ticket
    ...     - 2. SnD Portal: Click [Mark Completed] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device location is changed to Facility: was Inventory; Completed Transfer <Transfer ID>
    ...     - - Device facility is changed to <Facility name>; Completed Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-42    manual        R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-OTHER-DEVICE-BIOHEART-LOG-43: View logs in case of marking completed an End User transfer ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: View logs in case of marking completed an End User transfer ticket
    ...
    ...     Precondition:
    ...     - The Admin user is on the portal
    ...
    ...     Test Steps:
    ...     - 1. SnD Portal: Add an active/RMA bioheart device to End User Transfer ticket
    ...     - 2. SnD Portal: Click [Mark Completed] button
    ...     - 3. Admin Portal >> Bioheart Devices list: search for bioheart device mentioned in step 1, then click [View Device Logs] button
    ...     - 4. Click outside the sidebar or [x] button
    ...
    ...     Expected Results:
    ...     - 1. Step 3- The device logs shall be displayed:
    ...     - - Device location is changed to End User: was Inventory; Completed Transfer <Transfer ID>
    ...     - 2. Step 4- The sidebar is closed
    ...
    [Tags]      AP-OTHER-DEVICE-BIOHEART-LOG-43    manual        R2
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
