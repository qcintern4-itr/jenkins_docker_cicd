*** Settings ***
Documentation   Test Suite - Admin Portal - Devices page
Metadata    sid     AP-DEVICES
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_admin_portal/lib/ConfigHandler.py     ${ENV}

Suite Setup         SUITE SETUP
Suite Teardown      SUITE TEARDOWN
Force Tags          AP-DEVICES      web
Test Timeout        1h

*** Test Cases ***
AP-DEVICES-VIEW-01: View Devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The Admin user can view Devices page
    ...
    ...     Precondition: The Admin user is on Admin portal
    ...
    ...     Test Steps:
    ...     - 1. Click [Devices] tab on the navigation bar
    ...     - 2. View all tabs on the page
    ...
    ...     Expected Results:
    ...     - There shall be 3 tabs dipslayed, including: Bioflux/ Biotres, Bioheart, Biokit
    ...
    [Tags]     AP-DEVICES-VIEW-01              AP-1.11.0    manual      R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-01: View BIOFLUX/ BIOTRES list of devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the list of BIOFLUX/ BIOTRES devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “BIOFLUX/ BIOTRES” tab
    ...     - 2. Observe device’s information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1. The device’s information shall be displayed, including:
    ...     - - Device ID (a hyperlink)
    ...     - - Facility
    ...     - - Model (Bioflux, Biotres)
    ...     - - Firmware Version
    ...     - - Operation Status
    ...     - - Status
    ...     - - Last Connect
    ...     - 2. There shall be a search bar
    ...     - 3. There shall be a "Filter" button
    ...     - 4. There shall be an “Edit multiple devices” button
    ...     - 5. There shall be a “New device” button
    ...     - 6. The list is divided into several pages
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-01             manual      R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-02: BIOFLUX/ BIOTRES devices list - View an BIOFLUX/ BIOTRES device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Maintenance tag of a device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - There are Maintenance devices in the list
    ...
    ...     Test Steps:
    ...     - 1. Click “BIOFLUX/ BIOTRES” tab
    ...     - 2. Observe Device ID column
    ...
    ...     Expected Results:
    ...     - There shall be a tag "Maintenance" displayed next to the device ID
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-02             manual      R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-03: BIOFLUX/ BIOTRES devices list - View a renewal device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Renewal tag of a device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - There are Renewal devices in the list
    ...
    ...     Test Steps:
    ...     - 1. Click “BIOFLUX/ BIOTRES” tab
    ...     - 2. Observe Device ID column
    ...
    ...     Expected Results:
    ...     - There shall be a tag “Renewal” displayed next to the device ID
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-03             manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-04: BIOFLUX/ BIOTRES devices list - View a maintance device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Renewal tag of a device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - There are maintance devices in the list
    ...
    ...     Test Steps:
    ...     - 1. Click “BIOFLUX/ BIOTRES” tab
    ...     - 2. Observe Device ID column
    ...
    ...     Expected Results:
    ...     - There shall be a tag “Maintance” displayed next to the device ID
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-04             manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-05: BIOFLUX/ BIOTRES devices list - view a device fulfills both renewal and maintenance device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Renewal tag of a device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - There are a device fulfills both renewal and maintenance device
    ...
    ...     Test Steps:
    ...     - 1. Click “BIOFLUX/ BIOTRES” tab
    ...     - 2. Observe Device ID column
    ...
    ...     Expected Results:
    ...     - There shall be a tag “Renewal” displayed next to the device ID
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-05             manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}
AP-DEVICES-BIOFLUX-BIOTRES-06: BIOFLUX/ BIOTRES devices list - View actions when hover over the row of each device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view actions when hover over the row of each device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of each device
    ...
    ...     Expected Results:
    ...     - There shall be a “Device logs” and “Edit” button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-06             manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-07: BIOFLUX/ BIOTRES devices list - Edit button is disabled for renewal devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot edit a renewal device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of each device
    ...     - 2. Hover over the Edit button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - “Edit” button shall be disabled
    ...     - 2. Step 2 - Display a message "Renewal devices cannot be edited."
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-07             manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-08: BIOFLUX/ BIOTRES devices list - Navigate between the page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate to between the pages by using pagination tool
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
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
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-08             manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-09: BIOFLUX/ BIOTRES devices list - Search a device ID that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for devices on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a device ID that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by device ID and the search placeholder shBIOFLUX/ BIOTRES say “Search by Device ID…”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered device ID
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-09  AP-SRS-02-FRS-06    manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-10: BIOFLUX/ BIOTRES devices list - Search a device ID that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for devices on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a device ID that not existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by device ID and the search placeholder shall say “Search by Device ID…”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-10    AP-SRS-02-FRS-06    manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-11: BIOFLUX/ BIOTRES devices list - Filter feature
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter the devices on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [Filter] button
    ...
    ...     Expected Results:
    ...     - The Filter modal shall be displayed
    ...     - The user can filter the following information: Facility, Device model, Device marker (None specified, Renewal, Maintenance)
    ...     - There shall be a "Clear all" button, "Cancel" buton and "Filter" button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-11                manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-12: BIOFLUX/ BIOTRES devices list - Filter by facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter the devices by facility on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. In the Facility field, enter and select one or multiple facilities in the dropdown list
    ...     - 2. Click [Filter] button
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected Facilities
    ...     - There shall be an icon displaying the number (1) next to the Filter button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-12                  manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-13: BIOFLUX/ BIOTRES devices list - Filter by Bioflux device model
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter the devices by device model on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. In the Device model field, observe the dropdown list
    ...     - 2. Select "Bioflux" option, then click [Filter] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user shall be able to filter the Devices list by: BIOFLUX/ BIOTRES models (default value), Bioflux, Biotres
    ...     - 2. Step 2 - The device list shall be filtered and displayed accordingly with the selected Bioflux model
    ...     - -There shall be an icon displaying the number (1) next to the Filter button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-13                  manual     1.11.2        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-14: BIOFLUX/ BIOTRES devices list - Filter by Biotres device model
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter the devices by device model on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. Select "Biotres" option, then click [Filter] button
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected Biotres model
    ...     - There shall be an icon displaying the number (1) next to the Filter button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-14                  manual     1.11.2        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-15: BIOFLUX/ BIOTRES devices list - Filter by All models
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "All models" option from the dropdown list
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected All models
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-15                 manual     1.11.2        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-16: BIOFLUX/ BIOTRES devices list - Filter by Device marker with None specified option
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter by None specified on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. Select None specified option in the Device marker dropdown, then click [Filter] button
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed None specified devices
    ...     - There shall be an icon displaying the number (1) next to the Filter button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-16                  manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-17: BIOFLUX/ BIOTRES devices list - Filter by Device marker with Renewal option
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter by renewal devices on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. Select Renewal option in the Device marker dropdown, then click [Filter] button
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed Renewal devices
    ...     - There shall be an icon displaying the number (1) next to the Filter button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-17                  manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-18: BIOFLUX/ BIOTRES devices list - Filter by Device marker with Maintenance option
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter by Maintenance devices on BIOFLUX/ BIOTRES tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. Select Maintenance option in the Device marker dropdown, then click [Filter] button
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed Maintenance devices
    ...     - There shall be an icon displaying the number (1) next to the Filter button
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-18                  manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-19: BIOFLUX/ BIOTRES devices list - Clear all the filtered criteria
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can clear all the filtered criteria
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - The user has filtered the list by facility/device model/renewal devices
    ...
    ...     Test Steps:
    ...     - 1. Click [Clear all] button
    ...
    ...     Expected Results:
    ...     -  Exit the Filter modal
    ...     - The system shall clear all filtered criteria and display all devices as by default
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-19                  manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-20: BIOFLUX/ BIOTRES devices list - Cancel filtering for device list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel filtering for device list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - Exit the Filter modal without any changes
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-20                  manual        R1
  Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOFLUX-BIOTRES-21: BIOFLUX/ BIOTRES devices list - Filter by combining multiple criterias
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cilter by combining multiple criterias
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. In the Facility field, enter and select one or multiple facilities in the dropdown list
    ...     - 2. In the Device model field, select any model option
    ...     - 3. In the Device marker field, select any option
    ...     - 4. Click [Filter] button
    ...
    ...     Expected Results:
    ...     - There shall be an icon displaying the number of applied filters
    ...     - The device list shall be filtered and displayed accordingly with all criterias
    ...
    [Tags]      AP-DEVICES-BIOFLUX-BIOTRES-21                 manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-01: View BIOHEART list of devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the list of Bioheart devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Bioheart” tab
    ...     - 2. Observe device’s information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1. The device’s information shall be displayed, including:
    ...     - - Device ID - Device ID is unique
    ...     - - Firmware Version
    ...     - - Lot Received Date
    ...     - - Date Added
    ...     - - Status
    ...     - - Location
    ...     - - Facility
    ...     - - User
    ...     - -Last Connect
    ...     - 2. There shall be a search bar for the user to look up specific devices
    ...     - 3.  There shall be a "Filter" button
    ...     - 4. There shall be a “New device” button
    ...     - 5. The list is divided into several pages
    ...
    [Tags]      AP-DEVICES-BIOHEART-01           AP-1.11.0    manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-BIOHEART-02: BIOHEART devices list - Navigate between the page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can navigate to between the pages by using pagination tool
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
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
    [Tags]      AP-DEVICES-BIOHEART-02         manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-03: BIOHEART devices list - Search a device ID that existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for devices on BIOHEART tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a device ID that existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by device ID and the search placeholder shall say “Search by Device ID…”
    ...     - 2. Step 2 - The system shall be filtered and displayed accordingly with the entered device ID
    ...
    [Tags]     AP-DEVICES-BIOHEART-03              AP-SRS-02-FRS-06    manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-04: BIOHEART devices list - Search a device ID that not existing in the system
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can search for devices on BIOHEART tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Observe the search bar
    ...     - 2. In the search bar, enter a device ID that not existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user can search by device ID and the search placeholder shall say “Search by Device ID…”
    ...     - 2. Step 2 - The system shall be display the following message "There is no data to display"
    ...
    [Tags]      AP-DEVICES-BIOHEART-04             AP-SRS-02-FRS-06      manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-05: BIOHEART devices list - sort list by Device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sort list by Device ID on BIOHEART tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. sort list by Device ID
    ...     - 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. The Bioheart list shall be sorted from newest to oldest by default
    ...
    [Tags]      AP-DEVICES-BIOHEART-05             AP-SRS-02-FRS-06      manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-06: BIOHEART devices list - sort list by Date Added
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can sort list by Device ID on BIOHEART tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. sort list by Date Added
    ...     - 2. Observe
    ...
    ...     Expected Results:
    ...     - 1. The Bioheart list shall be sorted from newest to oldest by default
    ...
    [Tags]      AP-DEVICES-BIOHEART-06             AP-SRS-02-FRS-06      manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-BIOHEART-07: BIOHEART devices list - Filter by facility
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter the devices by facility on Bioheart tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and Bioheart tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. In the Facility field, enter and select one or multiple facilities in the dropdown list
    ...     - 2. Click [Filter] button
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected Facilities
    ...     - There shall be an icon displaying the number (1) next to the Filter button
    ...
    ...
    [Tags]      AP-DEVICES-BIOHEART-07                  manual       1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-08: BIOHEART devices list - Filter by All status
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "All" option from the dropdown list
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected All option in the Status
    ...
    [Tags]      AP-DEVICES-BIOHEART-08                 manual     1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-09: BIOHEART devices list - Filter by RMA status
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "RMA" option from the Status field
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected RMA option in the Status
    ...
    [Tags]      AP-DEVICES-BIOHEART-09                 manual     1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-10: BIOHEART devices list - Filter by Acitve status
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "Acitve" option from the Status field
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected Active option in the Status
    ...
    [Tags]      AP-DEVICES-BIOHEART-10                 manual     1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-BIOHEART-11: BIOHEART devices list - Filter by Location with All option
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "All" option from the Location field
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected All option in the Location field
    ...
    [Tags]      AP-DEVICES-BIOHEART-11                 manual     1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-12: BIOHEART devices list - Filter by Location with Inventory option
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "Inventory" option from the Location field
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected Inventory option in the Location field
    ...
    [Tags]      AP-DEVICES-BIOHEART-12                 manual     1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-13: BIOHEART devices list - Filter by Location with Clinic option
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "Clinic" option from the Location field
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected Clinic option in the Location field
    ...
    [Tags]      AP-DEVICES-BIOHEART-13                 manual     1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-BIOHEART-14: BIOHEART devices list - Filter by Location with User option
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can filter by device model
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOHEART tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Select "User" option from the Location field
    ...
    ...     Expected Results:
    ...     - The device list shall be filtered and displayed accordingly with the selected User option in the Location field
    ...
    [Tags]      AP-DEVICES-BIOHEART-14                 manual     1.11.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-BIOHEART-15: BIOHEART devices list - Clear all the filtered criteria
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can clear all the filtered criteria
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - The user has filtered the list by facility/device model/renewal devices
    ...
    ...     Test Steps:
    ...     - 1. Click [Clear all] button
    ...
    ...     Expected Results:
    ...     -  Exit the Filter modal
    ...     - The system shall clear all filtered criteria and display all devices as by default
    ...
    [Tags]      AP-DEVICES-BIOHEART-15                  manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-16: BIOHEART devices list - Cancel filtering for device list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel filtering for device list
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. Click [Cancel] button
    ...
    ...     Expected Results:
    ...     - Exit the Filter modal without any changes
    ...
    [Tags]      AP-DEVICES-BIOHEART-16                  manual        R1
  Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOHEART-17:BIOHEART devices list - Filter by combining multiple criterias
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cilter by combining multiple criterias
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     - Open Filter modal
    ...
    ...     Test Steps:
    ...     - 1. In the Facility field, enter and select one or multiple facilities in the dropdown list
    ...     - 2. In the Device model field, select any model option
    ...     - 3. In the Device marker field, select any option
    ...     - 4. Click [Filter] button
    ...
    ...     Expected Results:
    ...     - There shall be an icon displaying the number of applied filters
    ...     - The device list shall be filtered and displayed accordingly with all criterias
    ...
    [Tags]      AP-DEVICES-BIOHEART-17                 manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-01: Firmware version - View tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view Firmware version tab
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Select [Firmware version] tab
    ...
    ...     Expected Results:
    ...     - The following information displayed:
    ...     - - Latest Firmware Version - with an [Edit] button
    ...     - - Bioflux version
    ...     - - Biotres version
    ...
    [Tags]      AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-01                   manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-02: Firmware version - Edit latest Bioflux device firmware version
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit latest device firmware version
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Firmware version] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button
    ...     - 2. Edit Bioflux device firmware version, then click [Update] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - There shall be a pop-up window with a text field for each Bioflux and Biotres device
    ...     - 2. There shall be a pop-up message that says
    ...     - - "Updated successfully!" if it’s successful
    ...     - - "Update failed. Please try again!" if it’s failed to update
    ...
    [Tags]      AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-02      manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-03: Firmware version - Edit latest Biotres device firmware version
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit latest device firmware version
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Firmware version] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button
    ...     - 2. Edit Biotres device firmware version, then click [Update] button
    ...
    ...     Expected Results:
    ...     - There shall be a pop-up message that says
    ...     - - "Updated successfully!" if it’s successful
    ...     - - "Update failed. Please try again!" if it’s failed to update
    ...
    [Tags]      AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-03      manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-04: Firmware version - Update button is disabled unless any of the firmware text fields are edited
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Update button is disabled unless any of the firmware text fields are edited
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Firmware version] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button
    ...     - 2. Do not make changes in Bioflux or Biotres device text field, observe the Update button
    ...
    ...     Expected Results:
    ...     - The Update button shall be disabled
    ...
    [Tags]      AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-04      manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-05: Firmware version - Update button is disabled if one of the fields is empty
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Update button is disabled unless any of the firmware text fields are edited
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Firmware version] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit] button
    ...     - 2. Clear all text input in Bioflux or Biotres device text field, observe the Update button
    ...
    ...     Expected Results:
    ...     - The Update button shall be disabled
    ...
    [Tags]      AP-DEVICES-FW-VER-BIOFLUX-BIOTRES-05      manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-01: Create single device - View screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the Create single device screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Observe all fields in the screen
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Device ID
    ...     - - Device model (disabled)
    ...     - - Facility (default value: Bioflux Production)
    ...     - - Status (disabled)
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-01        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}



AP-DEVICES-CREATE-BIOFLUX-BIOTRES-02: Create single Bioflux device
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create single Bioflux device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Enter a device ID with starting number is "33" that not existing in the system (10 digits)
    ...     - 3. Leave default facility is Bioflux Production or enter and select a Test/Stock facility
    ...     - 4. Click [Create] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user shall be navigated to the "Create Single Device" screen.
    ...     - 2. Step 2 - The entered device shall be displayed in the device ID and the device model shall be detected by the starting number of the Device ID
    ...     - 3. Step 3 - The entered and selected Test/Stock facility shall be displayed. (if not)
    ...     - 4. Step 4 - The new devices shall be created successfully with device status is "Active" and device model is "Bioflux".
    ...                 - The new devices shall be displayed on the “BIOFLUX/ BIOTRES” devices list.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-02     manual     AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-03: Create single Biotres device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create single Biotres device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Enter a device ID with starting number is "12 or 13" that not existing in the system (10 digits)
    ...     - 3. Leave fault facility is Bioflux Production or enter and select a Test/Stock facility
    ...     - 4. Click [Create] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user shall be navigated to the "Create Single Device" screen.
    ...     - 2. Step 2 - The entered device shall be displayed in the device ID and the device model shall be detected by the starting number of the Device ID
    ...     - 3. Step 3 - The entered and selected Test/Stock facility shall be displayed. (if not)
    ...     - 4. Step 4 - The new devices shall be created successfully with device status is "Active" and device model is "Biotres".
    ...                 - The new devices shall be displayed on the “BIOFLUX/ BIOTRES” devices list.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-03        manual     AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}
AP-DEVICES-CREATE-BIOFLUX-BIOTRES-04: Create single device - Create an invalid Device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Leave empty device ID, then click [Create] button
    ...     - 3. Enter a device ID less than 10 digits, then click [Create] button
    ...     - 4. Enter a device ID more than 10 digits, then click [Create] button
    ...     - 5. Enter an existing device ID in the system, then click [Create] button
    ...     - 6. Enter the device ID with a different starting number than the biotres/ bioflux device starting number, then click [Create] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - There shall be an error message displayed "Please enter device ID" under device ID field
    ...     - 3. Step 3 - There shall be an error message displayed "Require 10 digits" under device ID field
    ...     - 4. Step 4 - There shall be an error message displayed "Require 10 digits" under device ID field
    ...     - 5. Step 5 - There shall be an error message displayed "The entered Device ID already exists" under device ID field
    ...     - 6. Step 6 - There shall be an error message displayed "Invalid Device ID" under device ID field
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-04        manual       AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-05: Create single device - Facility list display only Test/Stock facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Facility list display only Test/Stock facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Enter a facility that not be Test/Stock facility
    ...
    ...     Expected Results:
    ...     - - The suggestion drop-down list shall display all only Stock/Test Biotricity facilities
    ...     - - Message "No options" displayed
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-05        manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-06: Create single device - Cannot create device if empty facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot create device if empty facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Enter a device ID that not existing in the system (10 digits)
    ...     - 3. Delete the selected facility
    ...     - 4. Click [Create] button
    ...
    ...     Expected Results:
    ...     - - There shall be an error message “Please select a facility”
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-06        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-07: Create single devices - Canceling Create single device process
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel Create signle device process
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single device] button
    ...     - 2. Clicks the Cancel button
    ...
    ...     Expected Results:
    ...     - The user shall be redirected to the Devices page with the tab that the user has selected, and the list/table of devices displayed accordingly
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-07        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOFLUX-BIOTRES-08: Create single device - Scan the valid Device ID by scanner and check device model when focusing on the input textbox
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create a device if scan valid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [BIOFLUX/ BIOTRES] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Focusing on the input textbox
    ...     - 3. Scan the valid Biotres (12, 13) Device ID by scanner and check device model
    ...     - 4. Scan the valid Bioflux (33) Device ID by scanner and check device model
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 3. Step 3,4 - The device ID data scanned shall be entered in the Device ID textbox.
    ...     -             - The device model shall be deteted and displayed in the Device model field
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-08       manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-09: Create single device - Scan the valid Device ID by scanner and check device model when don't focus on input
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create a device if scan valid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [BIOFLUX/ BIOTRES] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Scan the valid Biotres (12, 13) Device ID by scanner and check device model
    ...     - 3. Scan the valid Bioflux (33) Device ID by scanner and check device model
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2,3 - The device ID data scanned shall be entered in the Device ID textbox.
    ...     -             - The device model shall be deteted and displayed in the Device model field
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-09        manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-10: Create single device - Scan the invalid Device ID by scanner and check device model when focusing on the input textbox
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [BIOFLUX/ BIOTRES] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Focusing on the input textbox
    ...     - 3. Scan invalid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 3 - The device ID data scanned shall be entered in the Device ID textbox. (data not include character)
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-10       manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOFLUX-BIOTRES-11: Create single device - Scan the invalid Device ID by scanner and check device model when don't focus on input
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [BIOFLUX/ BIOTRES] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Scan invalid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 3 - Text box unchanged
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-11         manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-12: Create single device - Scan the valid Device ID by camera and check device model
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create a device if scan valid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [BIOFLUX/ BIOTRES] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...     - 2. Scan the valid Biotres (12, 13) Device ID by scanner and check device model
    ...     - 3. Scan the valid Bioflux (33) Device ID by scanner and check device model
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened.
    ...     - 3. Step 3 - The Device ID is successfully scanned , there shall be a success message “Device ID <device ID> scanned successfully”, the camera is closed.
    ...                 - The device ID data scanned shall be entered in the Device ID textbox.
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-12        manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}




AP-DEVICES-CREATE-BIOFLUX-BIOTRES-14: Create single device - Scan the invalid Device ID by camera and check device model
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [BIOFLUX/ BIOTRES] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...     - 3. Scan invalid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened.
    ...     - 3. Step 3 - There shall be an error message: “The Code is not valid, please try another code!”
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-14       manual       AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-15: : Create single device - Scan the existed device by scanner and check device model
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan he existed device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...     - 3. Scan the existed device
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened.
    ...     - 3. Step 3 - There shall be a toast ”Device <Device ID> is existed"
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-15        manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOFLUX-BIOTRES-16: Create multiple devices - View screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the Create multiple devices screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Observe all fields in the screen
    ...
    ...     Expected Results:
    ...     - The following fields displayed:
    ...     - - Device ID: Start device ID and Stop device ID
    ...     - - Device model (disabled)
    ...     - - Facility (default value: Bioflux Productions)
    ...     - - Status (disabled)
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-16       manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}




AP-DEVICES-CREATE-BIOFLUX-BIOTRES-17: Create multiple Bioflux devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create multiple Bioflux device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Enter a device ID with starting number is "33" that not existing in the system (10 digits) in Start and Stop device ID field
    ...     - 3. Leave fault facility is Bioflux Production or enter and select a Test/Stock facility
    ...     - 4. Click [Create] button
    ...     - 5. Select "Yes" option
    ...     - 6. Select "No" option
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user shall be navigated to the [Create Multiple Devices] screen.
    ...     - 2. Step 2 - The entered device shall be displayed in the device ID and the device model shall be detected by the starting number of the Device ID
    ...     - 3. Step 3 - The entered and selected Test/Stock facility shall be displayed. (if not)
    ...     - 4. Step 4 - The confirmation pop-up shall display the message: “Are you sure you want to create new devices with IDs
    ...     - - [Start device ID] to [Stop device ID] as [Device model] devices?” and Yes, No button
    ...     - 5. Step 5:
    ...     - - The user shall be navigated to the "Devices" page.
    ...     - - The new devices shall be created successfully with device status is "Active" and device model is "Bioflux”.
    ...     - - The new devices shall be displayed on the “BIOFLUX/ BIOTRES” devices list
    ...     - 6. Step 6 - The confirmation dialog shall be closed, and the user remains on the "Create New Device" screen.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-17        manual      AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-18: Create multiple Biotress devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create multiple Biotress devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Enter a device ID with starting number is "12, 13" that not existing in the system (10 digits) in Start and Stop device ID field
    ...     - 3. Leave fault facility is Bioflux Production or enter and select a Test/Stock facility
    ...     - 4. Click [Create] button
    ...     - 5. Select "Yes" option
    ...     - 6. Select "No" option
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user shall be navigated to the [Create Multiple Devices] screen.
    ...     - 2. Step 2 - The entered device shall be displayed in the device ID and the device model shall be detected by the starting number of the Device ID
    ...     - 3. Step 3 - The entered and selected Test/Stock facility shall be displayed. (if not)
    ...     - 4. Step 4 - The confirmation pop-up shall display the message: “Are you sure you want to create new devices with IDs
    ...     - - [Start device ID] to [Stop device ID] as [Device model] devices?” and Yes, No button
    ...     - 5. Step 5:
    ...     - - The user shall be navigated to the "Devices" page.
    ...     - - The new devices shall be created successfully with device status is "Active" and device model is "Biotres”.
    ...     - - The new devices shall be displayed on the “BIOFLUX/ BIOTRES” devices list
    ...     - 6. Step 6 - The confirmation dialog shall be closed, and the user remains on the "Create New Device" screen.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-18       manual       AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOFLUX-BIOTRES-19: Create multiple device - Cannot create device if invalid Start and Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Leave empty value in Start and Stop device ID, then click [Create] button
    ...     - 3. Enter a Start and Stop device ID with a different starting number than the biotres/ bioflux (12,13, 33) device starting number, then click [Create] button
    ...     - 4. Enter a device ID less than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 5. Enter a device ID more than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 6. Enter an existing device ID in the system, then click [Create] button
    ...     - 7. Enter Stop device ID more than 500 times device ID in Start device ID then click [Create] button
    ...     - 8. Enter a Stop device ID <= Stop device ID device ID then click [Create] button

    ...
    ...     Expected Results:
    ...     - 1. Step 2 - There shall be an error message displayed "Please enter start device ID" and
    ...     - - "Please enter stop device ID" under device ID field
    ...     - 3. Step 3 - There shall be an error message displayed "Invalid Device ID" under Star/ Stop device ID field
    ...     - 2. Step 4 - There shall be an error message displayed "Require 10 digits" under Start and Stop device ID field
    ...     - 3. Step 5 - There shall be an error message displayed "Require 10 digits" under Start and Stop device ID field
    ...     - 4. Step 6 - Display the toast "Device <Device ID> existed"
    ...     - 5. Step 7 - There shall be an error message displayed "Cannot add more than 500 devices at once"
    ...     - 6. Step 8 - There shall be an error message displayed "Start ID must be lower than Stop ID"
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-19        manual      AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-20: Create multiple device - Cannot create device if invalid Start/ Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Leave empty value in Start or Stop device ID, then click [Create] button
    ...     - 3. Enter a Start/ Stop device ID with a different starting number than the biotres/ bioflux (12,13, 33) device starting number, then click [Create] button
    ...     - 4. Enter a Start/ Stop device ID less than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 5. Enter a Start/ Stop device ID more than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 6. Enter an existing Start/ Stop device ID in the system, then click [Create] button
    ...
    ...     Expected Results:
    ...     - 2. Step 2 - There shall be an error message displayed "Please enter start device ID" or
    ...     - - "Please enter stop device ID" under device ID field
    ...     - 3. Step 3 - There shall be an error message displayed "Invalid Device ID" under Star/ Stop device ID field
    ...     - 2. Step 4 - There shall be an error message displayed "Require 10 digits" under Star/ Stop device ID field
    ...     - 3. Step 5 - There shall be an error message displayed "Require 10 digits" under Start/ Stop device ID field
    ...     - 4. Step 6 - Display the toast "Device <Device ID> existed"
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-20       manual       AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-21: Create mutipple devices - Scan the valid device ID by camera in the Start/ Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Click the Camera button in the Start/ Stop device ID
    ...     - 3. Scan device ID
    ...     - 4. Fill in the required fields in the Create screen
    ...     - 5. Click [Create] button
    ...     - 6. Select "Yes" option
    ...     - 7. Select "No" option
    ...     Expected Results:
    ...     - 1. Step 2 - The camera is opened
    ...     - 2. Step 3 - The scanned Device ID shall be displayed in the Start/ Stop device ID
    ...     - 3. Step 5 - The confirmation pop-up shall display the message: “Are you sure you want to create new devices with IDs
    ...     - - [Start device ID] to [Stop device ID] as [Device model] devices?” and Yes, No button
    ...     - 4. Step 6:
    ...     - - The user shall be navigated to the "Devices" page.
    ...     - - The new devices shall be created successfully and displayed on the “Bioheart” devices list
    ...     - 5. Step 7 - The confirmation dialog shall be closed, and the user remains on the "Create New Device" screen.
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-21        manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-22: Create mutipple devices- Scan the invalid device ID by camera in the Start/ Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Click the [Camera] button
    ...     - 3. Enter a Start/ Stop device ID with a different starting number than the bioflux/ biotres (12, 13, 33) device starting number
    ...     - 4. Scan a device ID less than 10 digits in Start and Stop device ID
    ...     - 5. Scan a device ID more than 10 digits in Start and Stop device ID
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - The camera shall be opened.
    ...     - 2. Step 3 - There shall be a toast: “The Code is not valid, please try another code!”
    ...     - 3. Step 4 - There shall be a toast: “The Code is not valid, please try another code!”
    ...     - 4. Step 5 - There shall be a toast: “The Code is not valid, please try another code!”
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-22        manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}



AP-DEVICES-CREATE-BIOFLUX-BIOTRES-23: Create multiple devices - Facility list display only Test/Stock facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Facility list display only Test/Stock facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Enter a facility that not be Test/Stock facility
    ...
    ...     Expected Results:
    ...     - The suggestion drop-down list shall display all only Stock/Test Biotricity facilities
    ...     - Message "No options" displayed
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-23        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-24: Create multiple devices - Cannot create devices if empty facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot create devices if empty facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Enter a device ID that not existing in the system (10 digits) in Start and Stop device ID field
    ...     - 3. Delete the selected facility
    ...     - 4. Click [Create] button
    ...
    ...     Expected Results:
    ...     - There shall be an error message “Please select a facility”
    ...
    [Tags]      AP-DEVICES-CREATE-BIOFLUX-BIOTRES-24        manual        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-25: Create mutipple devices - Canceling Create signle device process
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can cancel Create signle device process
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Mutiple device] button
    ...     - 2. Clicks the Cancel button
    ...
    ...     Expected Results:
    ...     - The user shall be redirected to the Devices page with the tab that the user has selected, and the list/table of devices displayed accordingly
    ...
    [Tags]     AP-DEVICES-CREATE-BIOFLUX-BIOTRES-25       manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOFLUX-BIOTRES-26: Create mutipple/ single devices - Back to the previously screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can back to the previously screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single/Mutiple device] button
    ...     - 2. Clicks the Back button
    ...
    ...     Expected Results:
    ...     - The user shall be redirected to the previously screen.
    ...
    [Tags]    AP-DEVICES-CREATE-BIOFLUX-BIOTRES-26        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOHEART-01: Create single device - View screen
    [Documentation]     Author: Phuong Tran
    ...     Description: The user can view the Create single device screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Observe all fields in the screen
    ...
    ...     Expected Results:
    ...     The following fields displayed:
    ...     - - Device ID
    ...     - - Lot received date
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-01      manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}
AP-DEVICES-CREATE-BIOHEART-02: Create single device - Enter the valid device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create valid device ID by entering it manually
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Enter a device ID with starting number is "15" that not existing in the system (10 digits)
    ...     - 3. Fill in the required fields in the Create screen
    ...     - 4. Click the [Create] button
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The entered Device Id shall be displayed in the Device ID field
    ...     - 3. Step 3 - The required fields entered shall displayed in that field
    ...     - 4. Step 4 - New devices will be successfully created and displayed on the “Bioheart” device list.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-02           manual      AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}
AP-DEVICES-CREATE-BIOHEART-03: Create single device - Enter the invalid device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Leave empty device ID, then click [Create] button
    ...     - 3. Enter a device ID less than 10 digits, then click [Create] button
    ...     - 4. Enter a device ID more than 10 digits, then click [Create] button
    ...     - 5. Enter an existing device ID in the system, then click [Create] button
    ...     - 6. Enter the device ID with a different starting number than the biotres/ bioflux device starting number, then click [Create] button
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - There shall be an error message displayed "Please enter device ID" under device ID field
    ...     - 3. Step 3 - There shall be an error message displayed "Require 10 digits" under device ID field
    ...     - 4. Step 4 - There shall be an error message displayed "Require 10 digits" under device ID field
    ...     - 5. Step 5 - There shall be an error message displayed "The entered Device ID already exists" under device ID field
    ...     - 6. Step 6 - There shall be an error message displayed "Invalid Device ID" under device ID field
    [Tags]      AP-DEVICES-CREATE-BIOHEART-03        manual     AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}



AP-DEVICES-CREATE-BIOHEART-04: Create single device - Scan the valid Bioheart by scanner and check device model when focusing on the input textbox
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create a device if valid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [ Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Focusing on the input textbox
    ...     - 3. Scan the valid Biotres (12, 13) Device ID by scanner and check device model

    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 3. Step 3 - The device ID data scanned shall be entered in the Device ID textbox.
    [Tags]     AP-DEVICES-CREATE-BIOHEART-04          manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOHEART-05: Create single device - Scan the valid Bioheart by scanner and check device model when don't focus on input
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create a device if scan valid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [ Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Scan the valid Bioheart (15) Device ID by scanner and check device model
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The device ID data scanned shall be entered in the Device ID textbox.
    [Tags]      AP-DEVICES-CREATE-BIOHEART-05        manual      AP-1.14.0
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-06: Create single device - Scan the invalid Device ID by scanner and check device model when focusing on the input textbox
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Focusing on the input textbox
    ...     - 3. Scan invalid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 3 - The device ID data scanned shall be entered in the Device ID textbox. (data not include character)
    [Tags]      AP-DEVICES-CREATE-BIOHEART-06       manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOHEART-07: Create single device - Scan the invalid Device ID by scanner and check device model when don't focus on input
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Scan invalid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 3 - Text box unchanged
    [Tags]      AP-DEVICES-CREATE-BIOHEART-07       manual      AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-08: Create single device - Scan the valid Device ID by camera and check device model
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can create a device if scan valid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...     - 3. Scan the valid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened.
    ...     - 3. Step 3 - The Device ID is successfully scanned , there shall be a success message “Device ID <device ID> scanned successfully”, the camera is closed.
    ...                 - The device ID data scanned shall be entered in the Device ID textbox.
    [Tags]      AP-DEVICES-CREATE-BIOHEART-08          manual       AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-CREATE-BIOHEART-09: Create single device - Scan the invalid Device ID by camera and check device model
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...     - 3. Scan invalid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened.
    ...     - 3. Step 3 - There shall be an error message: “The Code is not valid, please try another code!”
    [Tags]      AP-DEVICES-CREATE-BIOHEART-09         manual        AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-10: : Create single device - Scan the existed device and check device model
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if scan invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...     - 3. Scan invalid QR code
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened.
    ...     - 3. Step 3 - There shall be a toast ”Device <Device ID> is existed"
    [Tags]      AP-DEVICES-CREATE-BIOHEART-10        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-11: Create single device - Close the camera after it opens
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can close the camera after it opens
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...     - 3. Click [Close camera] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened, there shall be a [close camera] button
    ...     - 3. Step 3 - Turn off the camera and bring back the scan code button.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-11        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-12: Create single device - The app won't be able to access the camera
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The app won't be able to access the camera
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...     - The app has not granted permission to access the camera
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - There shall be an error message: “Unable to access the camera. Please check and try again”
    [Tags]      AP-DEVICES-CREATE-BIOHEART-12        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-13: Create single device - Cannot select the future date in the Lot received date
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot select the future date in the Lot received date
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Select the future date in the Lot received date
    ...     - 3. Select the previous date in the Lot received date
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The future date in Calendar shall be disabled.
    ...     - 3. Step 3 - The selected date shall be displayed in the Lot received date field
    [Tags]      AP-DEVICES-CREATE-BIOHEART-13        manual      R2
    Manual Should Be Passed     ${TEST_NAME}     ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-14: Create single device - Cancelling the Create new device process
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can canceling the Create new device process
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Enter valid required fields
    ...     - 3. Click the [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The required fields entered shall displayed in that field
    ...     - 3. Step 3 - The user shall be navigated to the previous page
    [Tags]      AP-DEVICES-CREATE-BIOHEART-14        manual      R2
    Manual Should Be Passed     ${TEST_NAME}     ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-15: Create mutipple devices - View screen
    [Documentation]     Author: Phuong Tran
    ...     Description: The user can view the Create mutipple devices screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create mutipple devices] button
    ...     - 2. Observe all fields in the screen
    ...
    ...     Expected Results:
    ...     The following fields displayed:
    ...     - - Device ID: Start device ID and Stop device ID
    ...     - - Lot received date
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-15      manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}
AP-DEVICES-CREATE-BIOHEART-16: Create multiple Bioheart devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can create multiple Bioflux device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and Bioheart tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Enter a device ID with starting number is "15" that not existing in the system (10 digits) in Start and Stop device ID field
    ...     - 3. Select the Lot received date (if not)
    ...     - 4. Click [Create] button
    ...     - 5. Select "Yes" option
    ...     - 6. Select "No" option
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The user shall be navigated to the [Create Multiple Devices] screen.
    ...     - 2. Step 2 - The entered device shall be displayed in the device ID and the device model shall be detected by the starting number of the Device ID
    ...     - 3. Step 3 - The  selected Lot received date shall be displayed. (if not)
    ...     - 4. Step 4 - The confirmation pop-up shall display the message: “Are you sure you want to create new devices with IDs
    ...     - - [Start device ID] to [Stop device ID] as [Device model] devices?” and Yes, No button
    ...     - 5. Step 5:
    ...     - - The user shall be navigated to the "Devices" page.
    ...     - - The new devices shall be created successfully with device status is "Active" and device model is "Bioflux”.
    ...     - - The new devices shall be displayed on the “BIOFLUX/ BIOTRES” devices list
    ...     - 6. Step 6 - The confirmation dialog shall be closed, and the user remains on the "Create New Device" screen.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-16       manual      AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}
AP-DEVICES-CREATE-BIOHEART-17: Create multiple device - Cannot create device if invalid Start/ Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...     Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Leave empty value in Start or Stop device ID, then click [Create] button
    ...     - 3. Enter a Start/ Stop device ID with a different starting number than the biotres/ bioflux (12,13, 33) device starting number, then click [Create] button
    ...     - 4. Enter a Start/ Stop device ID less than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 5. Enter a Start/ Stop device ID more than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 6. Enter an existing Start/ Stop device ID in the system, then click [Create] button
    ...
    ...     Expected Results:
    ...     - 2. Step 2 - There shall be an error message displayed "Please enter start device ID" or
    ...     - - "Please enter stop device ID" under device ID field
    ...     - 3. Step 3 - There shall be an error message displayed "Invalid Device ID" under Star/ Stop device ID field
    ...     - 2. Step 4 - There shall be an error message displayed "Require 10 digits" under Star/ Stop device ID field
    ...     - 3. Step 5 - There shall be an error message displayed "Require 10 digits" under Start/ Stop device ID field
    ...     - 4. Step 6 - Display the toast "Device <Device ID> existed"
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-17       manual      AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}
    ...     Test


AP-DEVICES-CREATE-BIOHEART-18: Create multiple device - Cannot create device if invalid Start and Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Leave empty value in Start and Stop device ID, then click [Create] button
    ...     - 3. Enter a Start and Stop device ID with a different starting number than the biotres/ bioflux (12,13, 33) device starting number, then click [Create] button
    ...     - 4. Enter a device ID less than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 5. Enter a device ID more than 10 digits in Start and Stop device ID, then click [Create] button
    ...     - 6. Enter an existing device ID in the system, then click [Create] button
    ...     - 7. Enter Stop device ID more than 500 times device ID in Start device ID then click [Create] button
    ...     - 8. Enter a Stop device ID <= Stop device ID device ID then click [Create] button

    ...
    ...     Expected Results:
    ...     - 1. Step 2 - There shall be an error message displayed "Please enter start device ID" and
    ...     - - "Please enter stop device ID" under device ID field
    ...     - 3. Step 3 - There shall be an error message displayed "Invalid Device ID" under Star/ Stop device ID field
    ...     - 2. Step 4 - There shall be an error message displayed "Require 10 digits" under Start and Stop device ID field
    ...     - 3. Step 5 - There shall be an error message displayed "Require 10 digits" under Start and Stop device ID field
    ...     - 4. Step 6 - Display the toast "Device <Device ID> existed"
    ...     - 5. Step 7 - There shall be an error message displayed "Cannot add more than 500 devices at once"
    ...     - 6. Step 8 - There shall be an error message displayed "Start ID must be lower than Stop ID"
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-18        manual     AP-1.14.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-19: Create mutipple devices - Scan the valid device ID by camera in the Start/ Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Click the Camera button in the Start/ Stop device ID
    ...     - 3. Scan device ID
    ...     - 4. Fill in the required fields in the Create screen
    ...     - 5. Click [Create] button
    ...     - 6. Select "Yes" option
    ...     - 7. Select "No" option
    ...     Expected Results:
    ...     - 1. Step 2 - The camera is opened
    ...     - 2. Step 3 - The scanned Device ID shall be displayed in the Start/ Stop device ID
    ...     - 3. Step 5 - The confirmation pop-up shall display the message: “Are you sure you want to create new devices with IDs
    ...     - - [Start device ID] to [Stop device ID] as [Device model] devices?” and Yes, No button
    ...     - 4. Step 6:
    ...     - - The user shall be navigated to the "Devices" page.
    ...     - - The new devices shall be created successfully and displayed on the “Bioheart” devices list
    ...     - 5. Step 7 - The confirmation dialog shall be closed, and the user remains on the "Create New Device" screen.
    [Tags]      AP-DEVICES-CREATE-BIOHEART-19        manual     AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-20: Create mutipple devices- Scan the invalid device ID by camera in the Start/ Stop device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot create a device if invalid device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Multiple Devices] button
    ...     - 2. Click the [Camera] button
    ...     - 3. Enter a Start/ Stop device ID with a different starting number than the bioheart (15) device starting number
    ...     - 4. Scan a device ID less than 10 digits in Start and Stop device ID
    ...     - 5. Scan a device ID more than 10 digits in Start and Stop device ID
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - The camera shall be opened.
    ...     - 2. Step 3 - There shall be a toast: “The Code is not valid, please try another code!”
    ...     - 3. Step 4 - There shall be a toast: “The Code is not valid, please try another code!”
    ...     - 4. Step 5 - There shall be a toast: “The Code is not valid, please try another code!”
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-20        manual     AP-1.14.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}




AP-DEVICES-CREATE-BIOHEART-21: Create mutipple devices - Close the camera after it opens
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can Close the camera after it opens
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create Single Device] button
    ...     - 2. Click [Scan code] button in Start and Stop device ID
    ...     - 3. Click [Close camera] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The camera is successfully opened, there shall be a [close camera] button
    ...     - 3. Step 3 - Turn off the camera and bring back the scan code button.
    ...
    [Tags]      AP-DEVICES-CREATE-BIOHEART-21        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-22: Create mutipple devices - The app won't be able to access the camera
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can scan the device id
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...     - The app has not granted permission to access the camera
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create mutipple devices] button
    ...     - 2. Click [Scan code] button in Start and Stop device ID
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - There shall be an error message: “Unable to access the camera. Please check and try again”
    [Tags]      AP-DEVICES-CREATE-BIOHEART-22        manual      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-23: Create mutipple devices - Cannot select the future date in the Lot received date
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can scan the device id
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [Create mutipple devices] button
    ...     - 2. Select the future date in the Lot received date
    ...     - 3. Select the previous date in the Lot received date
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The future date in Calendar shall be disabled.
    ...     - 3. Step 3 - The selected date shall be displayed in the Lot received date field
    [Tags]      AP-DEVICES-CREATE-BIOHEART-23        manual      R2
    Manual Should Be Passed     ${TEST_NAME}     ${TEST_DOCUMENTATION}

AP-DEVICES-CREATE-BIOHEART-24: Create mutipple devices - Canceling the Create new device process
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can scan the device id
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [New device] button and select [ Create mutipple devices] button
    ...     - 2. Enter valid required fields
    ...     - 3. Click the [Cancel] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Create New Device screen
    ...     - 2. Step 2 - The required fields entered shall displayed in that field
    ...     - 3. Step 3 - The user shall be navigated to the previous page
    [Tags]      AP-DEVICES-CREATE-BIOHEART-24        manual      R2
    Manual Should Be Passed     ${TEST_NAME}     ${TEST_DOCUMENTATION}
AP-DEVICES-BIOKIT-01: View the list of Blood pressure cuff devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Blood pressure cuff devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the Blood pressure cuff sub-tab
    ...     - 3. Observe device’s information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1. There shall be a list table of Biokit devices corresponding to the selected device type on the subtab with the following attributes:
    ...     - - Device ID
    ...     - - Date Added
    ...     - - Status
    ...     - - Lot Received Date
    ...     - - Location
    ...     - - Facility
    ...     - - Kit No.
	...		- 2. There shall be a view device log button when hovering over the row of each device
    ...     - 3. There shall be a search bar
    ...     - 4. There shall be a "Filter" button
    ...     - 5. There shall be a “New device/ Biokit” button
    ...     - 6. The list is divided into several pages
    ...
    [Tags]      AP-DEVICES-BIOKIT-01  RS-003-03    manual		1.13.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-02: View the list of Digital thermometer devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Blood pressure cuff devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the Digital thermometer sub-tab
    ...     - 3. Observe device’s information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1. There shall be a list table of Biokit devices corresponding to the selected device type on the subtab with the following attributes:
    ...     - - Device ID
    ...     - - Date Added
    ...     - - Status
    ...     - - Lot Received Date
    ...     - - Location
    ...     - - Facility
    ...     - - Kit No.
	...		- 2. There shall be a view device log button when hovering over the row of each device
    ...     - 3. There shall be a search bar
    ...     - 4. There shall be a "Filter" button
    ...     - 5. There shall be a “New device/ Biokit” button
    ...     - 6. The list is divided into several pages
    ...
    [Tags]      AP-DEVICES-BIOKIT-02  RS-003-03    manual		1.13.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}


AP-DEVICES-BIOKIT-03: View the list of Pulse oximeter devices
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Blood pressure cuff devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the Pulse oximeter sub-tab
    ...     - 3. Observe device’s information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1. There shall be a list table of Biokit devices corresponding to the selected device type on the subtab with the following attributes:
    ...     - - Device ID
    ...     - - Date Added
    ...     - - Status
    ...     - - Lot Received Date
    ...     - - Location
    ...     - - Facility
    ...     - - Kit No.
	...		- 2. There shall be a view device log button when hovering over the row of each device
    ...     - 3. There shall be a search bar
    ...     - 4. There shall be a "Filter" button
    ...     - 5. There shall be a “New device/ Biokit” button
    ...     - 6. The list is divided into several pages
    ...
    [Tags]      AP-DEVICES-BIOKIT-03  RS-003-03    manual		1.12.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-04: View the list of Biokit
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Biokit
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the Biokit sub-tab
    ...     - 3. Observe device’s information displayed in the list
    ...
    ...     Expected Results:
    ...     - 1. There shall be a list table of Biokit devices corresponding to the selected device type on the subtab with the following attributes:
    ...     - - Kit No.
    ...     - - BP ID
    ...     - - TP ID
    ...     - - O2 ID
    ...     - - Location
    ...     - - Facility
    ...     - 3. There shall be a search bar
    ...     - 4. There shall be a "Filter" button
    ...     - 5. There shall be a “New device/ Biokit” button
    ...     - 6. The list is divided into several pages
    ...
    [Tags]      AP-DEVICES-BIOKIT-04  RS-003-03    manual		1.13.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-05: Create Individual device - View screen
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the Create Individual device screen
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. View the Input section
    ...     - 5. View the List of inputted devices section
    ...     - 6. View the [Create] button
    ...     Expected Results:
    ...     - 1. Step 1 - Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2. Step 2 - There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3. Step 3 -  Navigated to the New individual device screen and there shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 - there shall be 2 field on the the Input section: Scan device label ( default - turn on) and the Lot received date field
    ...     - 5. Step 5 - there shall be bellow attributes:
    ...     - + Index number
    ...     - + Lot received date.
    ...     - + Device ID
    ...     - + Device type
    ...     - + There are no device added on the list, the list shall display “There is no device yet”
    ...     - 6. Step 6 - The [Create] button shall be disabled when no device added on the list
    [Tags]      AP-DEVICES-BIOKIT-05  RS-003-03    manual		1.13.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-06: Create Individual device - View the input section when the “Scan device label” is turned on
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the input section when the “Scan device label” is turned on
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned on
    ...
    ...     Expected Results:
    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - There shall be a message “Scan the Biokit device codes and the device will be added to the list with their appropriate ID, model, and lot received date.”
    ...     - - The Lot Received Date field
    [Tags]      AP-DEVICES-BIOKIT-06  RS-003-03    manual		1.13.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-07: Create Individual device - Scan the invalid Device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot scan the invalid Device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned on
    ...     - 5. Scan QR code which QR code contains letters
    ...     - 6. Scan QR code which QR code contains special characters
    ...     - 7. Scan QR code which QR code has less than 10 numbers
    ...     - 8. Scan QR code which QR code has more than 10 numbers
    ...     - 9. Scan QR code which QR code not in any of the format : 10xxxxxxxx, 20xxxxxxxx, 30xxxxxxxx
    ...     - 10. Scan QR code which QR code (Device ID) exist on the List of inputted devices
    ...
    ...     Expected Results:
    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - There shall be a message “Scan the Biokit device codes and the device will be added to the list with their appropriate ID, model, and lot received date.”
    ...     - - The Lot Received Date field
    ...     - 5. Step 5, 6, 7, 8, 9 - There shall be an error toast “Invalid ID”
    ...     - 6. Step 10 - There shall be an error toast “Duplicate Device ID [device ID]”

    [Tags]      AP-DEVICES-BIOKIT-07  RS-003-03    manual		1.13.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-08: Create Individual device - Scan the valid Device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can scan the valid Device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned on
    ...     - 5. Scan QR code which QR code with format: 10xxxxxxxx
    ...     - 6. Scan QR code which QR code with format: 20xxxxxxxx
    ...     - 7. Scan QR code which QR code with format: 30xxxxxxxx

    ...
    ...     Expected Results:
    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - There shall be a message “Scan the Biokit device codes and the device will be added to the list with their appropriate ID, model, and lot received date.”
    ...     - - The Lot Received Date field
    ...     - 5. Step 5, 6, 7 - There shall be added to the list with the detected device model and the inputted Lot Received Date

    [Tags]      AP-DEVICES-BIOKIT-08  RS-003-03    manual		1.13.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-09: Create Individual device - View the input section when the “Scan device label” is turned off
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can view the input section when the “Scan device label” is turned off
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned off
    ...
    ...     Expected Results:
    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - Device ID
    ...     - - Lot Received Date
    ...     - - [Add] button
    [Tags]      AP-DEVICES-BIOKIT-09  RS-003-03    manual		1.13.0      R2
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-10: Create Individual device - Enter the invalid Device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user enter the invalid Device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned off
    ...     - 5. Enter the Device ID contains letters
    ...     - 6. Enter the Device ID contains spick [Add] button
    ...     - 8. Enter the Device ID has more than 10 numbers then click [Add] button
    ...     - 9. Enter the Device ID not in any of the format : 10xxxxxxxx, 20xxxxxxxx, 30xxxxxxxx then click [Add] button
    ...     - 10. Enter the Device ID exist on the List of inputted devices then click [Add] buttoecial characters
    ...     - 7. Enter the Device ID has less than 10 numbers then cln
    ...
    ...     Expected Results:
    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - There shall be a message “Scan the Biokit device codes and the device will be added to the list with their appropriate ID, model, and lot received date.”
    ...     - - The Lot Received Date field
    ...     - 5. Step 5, 6, 7, 8, 9 - There shall be an error message “Invalid ID” under the Device ID field
    ...     - 6. Step 10 - There shall be an error toast “Duplicate Device ID [device ID]”

    [Tags]      AP-DEVICES-BIOKIT-10  RS-003-03    manual		1.13.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-11: Create Individual device - Enter the valid Device ID
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user can scan the valid Device ID
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page
    ...
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned off
    ...     - 5. Enter the Device ID with format: 10xxxxxxxx then click [Add] button
    ...     - 6. Enter the Device ID with format: 20xxxxxxxx then click [Add] button
    ...     - 7. Enter the Device ID with format: 30xxxxxxxx then click [Add] button

    ...
    ...     Expected Results:
    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - There shall be a message “Scan the Biokit device codes and the device will be added to the list with their appropriate ID, model, and lot received date.”
    ...     - - The Lot Received Date field
    ...     - 5. Step 5, 6, 7 - There shall be added to the list with the detected device model and the inputted Lot Received Date

    [Tags]      AP-DEVICES-BIOKIT-11  RS-003-03    manual		1.13.0        R1
    Manual Should Be Passed     ${TEST_NAME}      ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-12: Create Individual device - Cannot select the future date in the Lot received date when the “Scan device label” is turned on
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot select the future date in the Lot received date
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned on
    ...     - 5. Select the future date in the Lot received date
    ...     - 6. Select the previous date in the Lot received date
    ...
    ...     Expected Results:

    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - There shall be a message “Scan the Biokit device codes and the device will be added to the list with their appropriate ID, model, and lot received date.”
    ...     - - The Lot Received Date field
    ...     - 5. Step 5 - The future date in Calendar shall be disabled.
    ...     - 6. Step 6 - The selected date shall be displayed in the Lot received date field
    [Tags]      AP-DEVICES-BIOKIT-12        manual      R2
    Manual Should Be Passed     ${TEST_NAME}       ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-13: Create Individual device - Cannot select the future date in the Lot received date when the “Scan device label” is turned off
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot select the future date in the Lot received date
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned off
    ...     - 5. Select the future date in the Lot received date
    ...     - 6. Select the previous date in the Lot received date
    ...
    ...     Expected Results:

    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - - Device ID
    ...     - - The Lot Received Date field
    ...     - - [Add] button
    ...     - 5. Step 5 - The future date in Calendar shall be disabled.
    ...     - 6. Step 6 - The selected date shall be displayed in the Lot received date field
    [Tags]      AP-DEVICES-BIOKIT-13        manual      R1
    Manual Should Be Passed     ${TEST_NAME}     ${TEST_DOCUMENTATION}

AP-DEVICES-BIOKIT-14: Create Individual device - The value in the the Lot received date shall kept when switch between input and scan
    [Documentation]     Author: Phuong Tran
    ...
    ...     Description: The user cannot select the future date in the Lot received date
    ...     Precondition:
    ...     - The Admin user is on the Devices page and [Bioheart] tab is selected
    ...     Test Steps:
    ...     - 1. Click “Biokit” tab
	...		- 2. Click the [New device/Biokit] button
    ...     - 3. Select the Individual device option then click [Next] button
    ...     - 4. In the Input section - the “Scan device label” is turned off
    ...     - 5. Select the previous date in the Lot received date
    ...     - 6. In the Input section - the “Scan device label” is turned on
    ...     - 7. In the Input section - the “Scan device label” is turned off
    ...
    ...     Expected Results:

    ...     - 1.Step 1 -  Navigated to the Biokit tab and stay in the Blood pressure cuff sub-tab
    ...     - 2.Step 2 -  There shall be a pop-up with 2 options:  Individual device ,Biokit
    ...     - 3.Step 3 -  Navigated to the New individual device screen: There shall be 2 sections on the create device screen:
    ...     - - Input section
    ...     - - List of inputted devices
    ...     - 4. Step 4 -  The Input section shall be dispayed:
    ...     - - - Device ID
    ...     - - The Lot Received Date field
    ...     - - [Add] button.
    ...     - 5. Step 5 - The selected date shall be displayed in the Lot received date field
    ...     - 6. Step 6, 7 - The value in the the Lot received date shall kept
    [Tags]      AP-DEVICES-BIOKIT-14        manual      R2
    Manual Should Be Passed     ${TEST_NAME}     ${TEST_DOCUMENTATION}





AP-DEVICES-EDIT-BIOFLUX-BIOTRES-01: Cannot edit Renewal devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot edit Renewal devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of a Renewal device
    ...
    ...     Expected Results:
    ...     - There shall be tooltip with a message "Renewal devices cannot be edited." displayed
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-01      manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-02: Edit single device - View screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view screen of Edit single device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of a not Renewal device and click [Edit] button
    ...
    ...     Expected Results:
    ...     - The Edit Device screen displayed with the following fields:
    ...     - - Header: Device ID, Status
    ...     - - Device information: Device ID, Device model, Facility, Device Lifetime\
    ...     - - Button: View device log, Save
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-02      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-03: Edit single device - Cannot edit device ID and facility of a device is All to a clinic
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user cannot edit device ID and facility of a device is All to a clinic
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of a device is All to a clinic and click [Edit] button
    ...     - 2. Observe Device ID and Facility field
    ...
    ...     Expected Results:
    ...     - Device ID and Facility field are disabled
    ...     - There shall be a message "Device ID cannot be edited when the device is All to a clinic" displayed
    ...     under Device ID field
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-03      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-04: Edit single device - Edit an invalid device ID/ Enter
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit device model of a device
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of a not Renewal device and click [Edit] button
    ...     - 2. Leave empty device ID, then click [Save] button
    ...     - 3. Enter a device ID less than 10 digits, then click [Save] button
    ...     - 4. Enter a device ID more than 10 digits, then click [Save] button
    ...     - 5. Enter an existing device ID in the system, then click [Save] button
    ...     - 6. Enter a device that are running an ongoing study, then clicks the Save button
    ...     - 7. Enter a device that is not online
    ...     - 8. Enter device ID have the difference model as the previous device ID
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Navigate the user to Edit Device screen
    ...     - 2. Step 2 - There shall be an error message displayed "Please enter device ID" under device ID field
    ...     - 3. Step 3 - There shall be an error message displayed "Require 10 digits" under device ID field
    ...     - 4. Step 4 - There shall be an error message displayed "Require 10 digits" under device ID field
    ...     - 5. Step 5 - There shall be an error message displayed "The entered Device ID already exists" under device ID field
    ...     - 6. Step 6 - There shall be an  error message displayed “ Device <ID> currently has a working study.”
    ...     - 7. Step 7 - There shall be an  error message displayed ”Device is offline. Please turn on the device to proceed.”
    ...     - 7. Step 7 - There shall be an  error message displayed ”Invalid ID"
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-04      manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}



AP-DEVICES-EDIT-BIOFLUX-BIOTRES-05: Edit single device - Edit facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit facility of a device associated with Test/Stock facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of a not Renewal device and click [Edit] button
    ...     - 2. Enter a facility that not be Test/Stock facility
    ...     - 3. Enter and select a Test/Stock facility, then click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2:
    ...     - - The suggestion drop-down list shall display all only Stock/Test Biotricity facilities
    ...     - - Message "No options" displayed
    ...     - 2. Step 3 - New changes are updated
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-05      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-06: Edit single device - Scan device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit device ID by scanning
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of a not Renewal device and click [Edit] button
    ...     - 2. In the Device ID field, click on the “Scan Data Matrix code” button
    ...     - 3. Make sure camera permission is turned on, scan for Data Matrix code on the devices
    ...     - 4. Click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2:
    ...     - - "Scan Data Matrix code" modal shall display
    ...     - - If the camera cannot be opened, there shall be a message “Unable to access the camera. Please check and try again”
    ...     - 2. Step 3:
    ...     - - There shall be an error message upon saving “The entered Device ID already exists” if the device ID matches with an existing device
    ...     - - There shall be a success message stating “Device ID <device ID> scanned successfully
    ...     - - The scanned Device ID shall be displayed.
    ...     - 3. Step 4:
    ...     - The old Device ID:
    ...     - -  The device’s facility shall be changed to “Retired Device Stock” tab and have its status changed to "Retired”,
    ...     - - The user shall be redirected to the new device ID’s edit page
    ...     - The new Device ID
    ...     - - The new device ID’s status shall be changed to “Active”
    ...     - - The new device ID’s lifetime shall be reset
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-06      manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-07: Edit single device - Edit a valid device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit device ID by scanning
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Hover over the row of a not Renewal device and click [Edit] button
    ...     - 2. In the Device ID field, enter a valid device ID that not existing in the system
    ...     - 3. Click [Save] button
    ...
    ...     Expected Results:
    ...     - The old Device ID:
    ...     - -  The device’s facility shall be changed to “Retired Device Stock” tab and have its status changed to "Retired”,
    ...     - - The user shall be redirected to the new device ID’s edit page
    ...     - The new Device ID
    ...     - - The new device ID’s status shall be changed to “Active”
    ...     - - The new device ID’s lifetime shall be reset
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-07      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-08: Edit single device - Reset device lifetime
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can reset device lifetime
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Go to Edit Device page of a device that has a specific lifetime
    ...     - 2. Click [Reset lifetime] button
    ...     - 3. Click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Step 2:
    ...     - - Device lifetime display as "--"
    ...     - - There shall be a message “Device lifetime will be reset after the changes are saved” and the button shall be disabled
    ...     - 2. Step 3:
    ...     - - There shall be a message "Device has not started its first study yet"
    ...     - - The [Reset lifetime] is disabled
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-08      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-09: Edit multiple devices - View screen
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user view screen of Edit multiple devices
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit multiple devices] button

    ...
    ...     Expected Results:
    ...     - The Edit Device screen displayed with the following fields:
    ...     - - Header: Status
    ...     - - Device information: Device field and device dropdown.
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-09      manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-10: Edit multiple devices - Search for invalid devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user search devices to edit
    ...
    ...     Precondition:
    ...     - The Admin user is on the Devices page and BIOFLUX/ BIOTRES tab is selected
    ...
    ...     Test Steps:
    ...     - 1. Click [Edit multiple devices] button
    ...     - 2. On the Device field, enter a device ID that is Renewal/ Retired/ Faulty device device
    ...     - 3. On the Device field, enter a device ID that is BIOHEART device
    ...     - 4. On the Device field, enter a device ID that not existing in the system
    ...
    ...     Expected Results:
    ...     - 1. Step 2 - The Renewal/ Retired/ Faulty devices shall display in the Unselectable device and the user cannot select that device
    ...     - 2. Step 3 - There shall be a message "No options" in the list
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-10      manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}




AP-DEVICES-EDIT-BIOFLUX-BIOTRES-11: Edit multiple devices - Edit facility if the user selected multiple devices with the same All facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit multiple devices screen
    ...     - The current facility of selected devices is Test/Stock facility
    ...
    ...     Test Steps:
    ...     - 1. Search and select multiple devices with the same All facility
    ...     - 2. Observe Facility field
    ...     - 3. Enter and select a Test/Stock facility, then click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - The selected devices' device model shall be displayed
    ...     - 2. Step 2 - New changes are updated for all devices
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-11      manual      R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

AP-DEVICES-EDIT-BIOFLUX-BIOTRES-12: Edit multiple devices - Edit facility if the user selected multiple devices with the different All facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can edit facility
    ...
    ...     Precondition:
    ...     - The Admin user is on the Edit multiple devices screen
    ...     - The current facility of selected devices is Test/Stock facility
    ...
    ...     Test Steps:
    ...     - 1. Search and select multiple devices with the different All facility
    ...     - 2. Observe Facility field
    ...     - 3. Enter and select a Test/Stock facility, then click [Save] button
    ...
    ...     Expected Results:
    ...     - 1. Step 1 - Display "Multiple"
    ...     - 2. Step 2 - New changes are updated for all devices
    ...
    [Tags]      AP-DEVICES-EDIT-BIOFLUX-BIOTRES-12      manual      R2
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