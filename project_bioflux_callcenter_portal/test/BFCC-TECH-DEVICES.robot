*** Settings ***
Documentation   Test Suite - Call Center Technician Portal - Devices page
Metadata    sid     BFCC-TECH-DEVICES
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_callcenter_portal/lib/ConfigHandler.py   ${ENV}
#Library     project_bioflux_callcenter_portal/lib/web/Common.py
#Library     project_bioflux_callcenter_portal/lib/web/Devices.py
Library     Collections

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BFCC-TECH-DEVICES     web
Test Timeout    1h

*** Test Cases ***
BFCC-TECH-DEVICES-VIEW-INSTUDY-01: View the information displays in the devices running studies
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center user can view the running devices assigned to the facilities which they support
    ...
    ...     Precondition: The user has logged in to the Call Center portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on In Study tab
    ...     2. Observe the information displayed in the In Study list
    ...
    ...     Expected Results:
    ...     1. By default, the device list is sort by the date-time when it was assigned to the Bioflux portal,
    ...     from oldest to latest
    ...     2. The device list displays the following information:
    ...     -   Device ID. If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...     -   Model, it can be: Bioflux, Biocore (if the device is enabled for auto-event detection, there shall be an Auto tag next to the device model),
    ...     BiotresRT, BiotresRTL
    ...     -   Firmware Version
    ...     -   Battery Level
    ...     -   Operation Status, it can be: Offline, Online, Starting, Started, Paused, Resumed, Uploading
    ...     -   Last Connect
    ...     -   Artifact Reports
    ...
    ...     **Others**
    ...     Update date: 8/18/2023 - Nhan Nguyen

    [Tags]      BFCC-TECH-DEVICES-VIEW-INSTUDY-01        manual     R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-INSTUDY-02: Sort the devices running studies by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on In Study tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BFCC-TECH-DEVICES-VIEW-INSTUDY-02        manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-INSTUDY-02-1: Sort the devices running studies by Artifact Reports
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on In Study tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Artifact Reports
    ...     2. Click the [Sort] button next to the Artifact Reports again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BFCC-TECH-DEVICES-VIEW-INSTUDY-02-1        manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-INSTUDY-03: Check pagination tool works properly
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on In Study tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Observe the pagination tool displays at the bottom of the table
    ...     2. Select value "30" from the dropdown box
    ...     3. Select value "50" from the dropdown box
    ...     4. Click [>]/[<] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   There shall be a dropdown box with values (10 - 30 - 50) to be selected
    ...     -   The default value of the dropdown box is 10
    ...     -   If the device list is less than 10 then the pagination tool shall be hidden
    ...     2. In step 2:
    ...     -   The list shall displays a maximum of 30 items per page
    ...     3. In step 3:
    ...     -   The list shall displays a maximum of 50 items per page
    ...     4. In step 4:
    ...     -   The user shall be able to navigate between loaded pages

    [Tags]      BFCC-TECH-DEVICES-VIEW-INSTUDY-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-INSTUDY-QUICK-ACCESS-01-CP-2.23.0: Quick access to device info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. General info: Model - it can be
    ...     - Bioflux
    ...     - Biocore: if the Auto-events detection for the device, there shall be a message displayed next to the device model – (Auto-events detection enabled).
    ...     - Biocore Pro
    ...     - Time zone
    ...     - Firmware version
    ...     - Operator
    ...     - Network mode
    ...     - Device lifetime - the total time of the device in use since the first study and it is counted by day and month
    ...     if its lifetime is less than 1 year- ex: 1 month 3 days or month and year if its lifetime is equal to or greater
    ...     than 1 year - ex: 1 year 3 months
    ...     2. Last Synced Status
    ...     - RSSI
    ...     - Lead on
    ...     - Battery level
    ...     - SD card free space
    ...     - Charging state
    ...     - Last connect
    ...
    ...     **Others
    ...     Update date: 5/28/2024 - Trinh Nguyen

    [Tags]      BFCC-TECH-DEVICES-VIEW-INSTUDY-QUICK-ACCESS-01-CP-2.23.0        manual    CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BFCC-TECH-DEVICES-VIEW-EOL-01: View the information displays in the EOL devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center user can view the EOL devices assigned to the facilities which they support
    ...
    ...     Precondition: The user has logged in to the Call Center portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on End of life tab
    ...     2. Observe the information displayed in the EOL list
    ...
    ...     Expected Results:
    ...     1. By default, the device list is sort by the date-time when it was assigned to the Bioflux portal,
    ...     from oldest to latest
    ...     2. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore, BiotresRT, BiotresRTL
    ...     -   Firmware Version
    ...     -   Battery Level
    ...     -   Operation Status, it can be: Offline, Online, Starting, Started, Paused, Resumed, Uploading
    ...     -   Last Connect

    [Tags]      BFCC-TECH-DEVICES-VIEW-EOL-01        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-EOL-02: Sort the EOL devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on End of life tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BFCC-TECH-DEVICES-VIEW-EOL-02        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-EOL-03: Check pagination tool works properly
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on End of life tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Observe the pagination tool displays at the bottom of the table
    ...     2. Select value "30" from the dropdown box
    ...     3. Select value "50" from the dropdown box
    ...     4. Click [>]/[<] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   There shall be a dropdown box with values (10 - 30 - 50) to be selected
    ...     -   The default value of the dropdown box is 10
    ...     -   If the device list is less than 10 then the pagination tool shall be hidden
    ...     2. In step 2:
    ...     -   The list shall displays a maximum of 30 items per page
    ...     3. In step 3:
    ...     -   The list shall displays a maximum of 50 items per page
    ...     4. In step 4:
    ...     -   The user shall be able to navigate between loaded pages

    [Tags]      BFCC-TECH-DEVICES-VIEW-EOL-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-EOL-QUICK-ACCESS-01-CP-2.23.0: Quick access to device info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. General info: Model - it can be
    ...     - Bioflux
    ...     - Biocore: if the Auto-events detection for the device, there shall be a message displayed next to the device model – (Auto-events detection enabled).
    ...     - Biocore Pro
    ...     - Time zone
    ...     - Firmware version
    ...     - Operator
    ...     - Network mode
    ...     - Device lifetime - the total time of the device in use since the first study and it is counted by day and month
    ...     if its lifetime is less than 1 year- ex: 1 month 3 days or month and year if its lifetime is equal to or greater
    ...     than 1 year - ex: 1 year 3 months
    ...     2. Last Synced Status
    ...     - RSSI
    ...     - Lead on
    ...     - Battery level
    ...     - SD card free space
    ...     - Charging state
    ...     - Last connect
    ...
    ...     **Others
    ...     Update date: 5/28/2024 - Trinh Nguyen

    [Tags]      BFCC-TECH-DEVICES-VIEW-EOL-QUICK-ACCESS-01-CP-2.23.0        manual    CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-ALL-01: View the information displays in the all devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: Call Center user can view the all devices assigned to the facilities which they support
    ...
    ...     Precondition: The user has logged in to the Call Center portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on All tab
    ...     2. Observe the information displayed in the All devices list
    ...
    ...     Expected Results:
    ...     1. By default, the device list is sort by the date-time when it was assigned to the Bioflux portal,
    ...     from oldest to latest
    ...     2. The device list displays the following information:
    ...     -   Device ID. If the device is an End-of-life device, there shall be an EOL tag next to the device ID
    ...     -   Model, it can be: Bioflux, Biocore, BiotresRT, BiotresRTL
    ...     -   Firmware Version
    ...     -   Battery Level
    ...     -   Operation Status, it can be: Offline, Online, Starting, Started, Paused, Resumed, Uploading
    ...     -   Last Connect

    [Tags]      BFCC-TECH-DEVICES-VIEW-ALL-01       auto
    # Just handle expected > 2
    Navigate To Devices
    Navigate To Devices Menu    All devices
    ${devices}      Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}     The All Devices not found
    ${expected_models}      Create List    Bioflux      Biocore     BiotresRT       BiotresRTL      BiocoreAuto
    ${actual_models}        Evaluate        [item['Model'] for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List       ${expected_models}      ${actual_models}
    ${expec_headers}        Create List    Device ID     Model     Firmware Version     Battery Level     Operation Status      Last Connect      Artifact Reports
    ${device_headers}       Evaluate        [key for key, value in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expec_headers}    ${device_headers}
    ${expected_status}      Create List    Offline      Online     Starting       Started       Paused      Resumed    Uploading        Ready for new study
    ${actual_status}        Evaluate        [item['Operation Status'] for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${expected_status}      ${actual_status}

BFCC-TECH-DEVICES-VIEW-ALL-02: Sort the all devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on All tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BFCC-TECH-DEVICES-VIEW-ALL-02       auto
    Navigate To Devices
    Navigate To Devices Menu    All devices
    Filter Devices        facility=All facilities       by_model=All models
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Sort On Device Id
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BFCC-TECH-DEVICES-VIEW-ALL-03: Check pagination tool works properly
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on End of life tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Observe the pagination tool displays at the bottom of the table
    ...     2. Select value "30" from the dropdown box
    ...     3. Select value "50" from the dropdown box
    ...     4. Click [>]/[<] button
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   There shall be a dropdown box with values (10 - 30 - 50) to be selected
    ...     -   The default value of the dropdown box is 10
    ...     -   If the device list is less than 10 then the pagination tool shall be hidden
    ...     2. In step 2:
    ...     -   The list shall displays a maximum of 30 items per page
    ...     3. In step 3:
    ...     -   The list shall displays a maximum of 50 items per page
    ...     4. In step 4:
    ...     -   The user shall be able to navigate between loaded pages

    [Tags]      BFCC-TECH-DEVICES-VIEW-ALL-03        manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-VIEW-ALL-QUICK-ACCESS-01-CP-2.23.0: Quick access to device info
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.
    ...
    ...     Expected Results:
    ...     1. General info: Model - it can be
    ...     - Bioflux
    ...     - Biocore: if the Auto-events detection for the device, there shall be a message displayed next to the device model – (Auto-events detection enabled).
    ...     - Biocore Pro
    ...     - Time zone
    ...     - Firmware version
    ...     - Operator
    ...     - Network mode
    ...     - Device lifetime - the total time of the device in use since the first study and it is counted by day and month
    ...     if its lifetime is less than 1 year- ex: 1 month 3 days or month and year if its lifetime is equal to or greater
    ...     than 1 year - ex: 1 year 3 months
    ...     2. Last Synced Status
    ...     - RSSI
    ...     - Lead on
    ...     - Battery level
    ...     - SD card free space
    ...     - Charging state
    ...     - Last connect
    ...
    ...     **Others
    ...     Update date: 5/28/2024 - Trinh Nguyen

    [Tags]      BFCC-TECH-DEVICES-VIEW-ALL-QUICK-ACCESS-01-CP-2.23.0        manual    CP-2.23.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-SEARCH-01: Search on device list
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can globally search for devices on the devices list via a search bar and the
    ...     search field on the header of the DEVICES page
    ...
    ...     Precondition: The user is on the Devices page
    ...
    ...     Test Steps:
    ...     1. Observe the search bar
    ...     2. Enter a value of device ID
    ...     3. Switch to tabs on the page and observe
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   By default, the search field shall have a string saying "Search by Device ID"
    ...     2. In step 2:
    ...     -   The system shall filter and display the search result accordingly with the search value
    ...     3. In step 3:
    ...     -   The search value and its result shall be applied until it is cleared out

    [Tags]      BFCC-TECH-DEVICES-SEARCH-01     auto
    Navigate To Devices
    Navigate To Devices Menu    All devices
    # Default text seach
    ${filter_values}       Get Devices Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    Search by${filter_values}[Search By]   Search by Device ID
    # Filter
    Filter Devices    by_model=Bioflux
    ${devices}      Get All Devices
    ${text}         Set Variable    ${devices}[0][Device ID]
    ${text}         Evaluate    '${text}'.split(' | ')[0]       # Handle removing RMA tag incase of RMA device
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No devices found
    Run Keyword And Continue On Failure    Should Be True    all('Bioflux'.lower() == d['Model'].lower() for d in ${devices})
    Filter Devices    text_search=${text}
    ${devices}      Get Devices On Page
    ${device_id}    Evaluate    '${devices}[0][Device ID]'.split(' | ')[0]    # Handle removing RMA tag incase of RMA device
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}                No devices found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be Equal        ${device_id}              ${text}
    Run Keyword And Continue On Failure    Should Be Equal        ${devices}[0][Model]      Bioflux
    Navigate To Devices Menu    End of life
    ${filter_values}      Get Devices Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Text Search]     ${device_id}
    Navigate To Devices Menu    All devices
    ${filter_values}      Get Devices Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Text Search]     ${device_id}
    # Clear text search
    Clear Devices Text Search
    ${filter_values}      Get Devices Current Filter Values
    Run Keyword And Continue On Failure    Should Be Empty    ${filter_values}[Text Search]

BFCC-TECH-DEVICES-FILTER-FACILITY-01: Filter by facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter data on the devices page according to a facility
    ...
    ...     Precondition:
    ...     - The user is on the Devices page
    ...     - The user is assigned to a group that contains multiple facilities
    ...
    ...     Test Steps:
    ...     1. Observe the facility dropdown list
    ...     2. Click [Facility] dropdown and observe
    ...     3. Search or select a specific facility
    ...     4. Switch to other page
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   By default, the default value is All facilities
    ...     2. In step 2:
    ...     -   The list of facilities is sorted by alphabet order to display
    ...     -   The “All facilities” option is always on the top of the list
    ...     3. In step 3:
    ...     -   The page shall filter the data on the portal according to the selected facility
    ...     4. In step 4:
    ...     -   The filtered and selected facility shall be applied to other pages

    [Tags]      BFCC-TECH-DEVICES-FILTER-FACILITY-01        auto
    Navigate To Devices
    # All tab
    Navigate To Devices Menu    All devices
    ${filter_values}        Get Devices Current Filter Values
    ${filter_options}       Get Devices Filter Options
    # Verify default facility
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Facility]        All facilities  # default
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_options}[Facilities][0]      All facilities         # top of the list
    ${filter_options}       Get Devices Filter Options
    ${actual_facilities}           Set Variable    ${filter_options}[Facilities]
    ${expected_facilities}  Evaluate    sorted(${actual_facilities})   # asc sorted
    # Verify facilities sorted by alphabet
    Run Keyword And Continue On Failure    Should Be Equal        ${actual_facilities}     ${expected_facilities}
    # Check data when filter facility
    Filter Devices    facility=Facility_QA_01
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No device found
    # End of life tab
    Navigate To Devices Menu    End of life
    # Get current filter and compare with 'all' tab
    ${filter_values}        Get Devices Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Facility]        Facility_QA_01
    # In study tab
    Navigate To Devices Menu    In Study
    ${filter_values}        Get Devices Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Facility]        Facility_QA_01

BFCC-TECH-DEVICES-FILTER-FACILITY-02: The user is removed from the Call Center Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user shall be logged out of the portal in the case the user is removed from the Call
    ...     Center group
    ...
    ...     Precondition:
    ...     - The user is on the Devices page
    ...
    ...     Test Steps:
    ...     1. Admin Portal - Admin user remove the user from the Call Center group
    ...     2. CCP - The user observe the behavior
    ...
    ...     Expected Results:
    ...     -   The user shall automatically be logged out of the portal.
    ...     -   When he or she logs in again, all the data are clear and a message stating: “ There is no data to
    ...     display” shall be displayed

    [Tags]      BFCC-TECH-DEVICES-FILTER-FACILITY-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-FILTER-FACILITY-03: The facility is removed from the Facility Group
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: There is a modal alert to the user in the case the facility list has just been updated
    ...
    ...     Precondition:
    ...     - The user is on the Devices page
    ...
    ...     Test Steps:
    ...     1. Admin Portal - Admin user remove the facility from the Facility group or edit to another group
    ...     2. CCP - The user observe the behavior
    ...     3. CCP - Click [Reload] option from the modal
    ...     4. CCP - Click [Cancel] option from the modal
    ...
    ...     Expected Results:
    ...     1. In step 2:
    ...     -   A modal with the following message shall be displayed: "The facility list has just been updated.
    ...     Please reload the page to ensure proper workflow" with the [Reload] and [Cancel] option
    ...     2. In step 3:
    ...     -   The user shall be navigated back to the main page that he or she was working on
    ...     3. In step 4:
    ...     -   The user shall remain on the current page

    [Tags]      BFCC-TECH-DEVICES-FILTER-FACILITY-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BFCC-TECH-DEVICES-FILTER-MODEL-01: Filter by model
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can filter data on the devices page according to a model
    ...
    ...     Precondition:
    ...     - The user is on the Devices page
    ...
    ...     Test Steps:
    ...     1. Observe the model dropdown list
    ...     2. Click [Model] dropdown and observe
    ...     3. Select "Bioflux" option
    ...     4. Select "Biocore" option
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   By default, the default value is All models
    ...     2. In step 2:
    ...     -   The following options displayed: Bioflux, Biocore
    ...     -   The “All models” option is always on the top of the list
    ...     3. In step 3:
    ...     -   The page shall filter the data on the portal according to the Bioflux devices
    ...     4. In step 4:
    ...     -   The page shall filter the data on the portal according to the Biocore devices

    [Tags]      BFCC-TECH-DEVICES-FILTER-MODEL-01       auto
    # Run on 'all' tab
    Navigate To Devices
    Navigate To Devices Menu    All devices
    ${filter_values}        Get Devices Current Filter Values   # default filter values
    ${filter_options}       Get Devices Filter Options
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_values}[Model]         All models
    Run Keyword And Continue On Failure    Should Be Equal    ${filter_options}[Models][0]    All models
    Filter Devices    facility=All facilities   by_model=Bioflux
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Be True    ('Bioflux' == device['Model'] for device in ${devices})
    Filter Devices    by_model=Biocore
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Be True    ('Biocore' == device['Model'] for device in ${devices})

BFCC-TECH-DEVICES-QUICKACCESS-01: Quick access to device information
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can quick access to device information
    ...
    ...     Precondition:
    ...     - The user is on the Devices page
    ...
    ...     Test Steps:
    ...     1. Click [Device ID] hyperlink
    ...
    ...     Expected Results:
    ...     The Device information shall be displayed, including:
    ...     -   If the device is an End-of-life device, there shall be a message: “The device has reached its end of life”
    ...     -   General info: Model, Timezone, Operator, Network mode, Device lifetime
    ...     -   Last sync status: RSSI, Lead On, Battery level, SD card free space, Charging state, Last connect
    ...

    [Tags]      BFCC-TECH-DEVICES-QUICKACCESS-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_bioflux_callcenter_portal/lib/web/Common.py       ${BROWSER_NODE}     ${ENV}
    Import Library       project_bioflux_callcenter_portal/lib/web/Devices.py      ${BROWSER_NODE}     ${ENV}
    ${USERS}             Get Config Param    NEW_USERS
    ${CURRENT_USER}      Set Variable        ${USERS}[callcenter_technician]
    ${RELEASE_VERSION}   Navigate To Callcenter Sign In Page
    ${TOKEN}             Sign In Callcenter  ${CURRENT_USER}[username]      ${CURRENT_USER}[password]
    Set Suite Metadata   version   ${RELEASE_VERSION}
    Set Suite Metadata   browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
