*** Settings ***
Documentation   Cardiac Fleet management page test suite
Metadata    sid     BCP-CLINIC-FLEETMNG
Metadata    owner   Hoang Le
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     corelib/AssertionExtension.py
Library     project_cardiac_portal/lib/ConfigHandler.py   ${ENV}
#Library      project_cardiac_portal/lib/web/Common.py
#Library      project_cardiac_portal/lib/web/Support.py

#Suite Setup     #Suite Setup
#Suite Teardown  #Suite Teardown
Force Tags      BCP-CLINIC-FLEETMNG       web
Test Timeout    1h

*** Test Cases ***
BCP-CLINIC-FLEETMNG-01: Devices page - Filter the Device page by "All facilities"
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the Bioheart/Biokit device tab
    ...  Test steps:
    ...  Expected result:
    ...  All the devices of the facilities that the user works for shall be displayed.
    [Tags]    BCP-CLINIC-FLEETMNG-01     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-02: Devices page - Filter the Device page by a specific facility
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The user is on the Bioheart/Biokit device tab
    ...  Test steps:

    ...  Expected result:
    ...  All the devices of the selected facility that the user works for shall be displayed.
    [Tags]    BCP-CLINIC-FLEETMNG-02     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-03: Devices page - Search the Device ID by input manually
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the Bioheart/Biokit device tab

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-03     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-04: Devices page - Search the Device ID by copy - paste
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the Bioheart/Biokit device tab

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-04     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-05: Devices page - Search Bioheart device on Biokit tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the Biokit device tab
    ...  Test steps:

    ...  Expected result:
    ...  The Bioheart device shall not be found on Biokit tab.
    [Tags]    BCP-CLINIC-FLEETMNG-05     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-06: Devices page - Search Biokit device on Bioheart tab
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the Bioheart device tab
    ...  Test steps:

    ...  Expected result:
    ...  The Biokit device shall not be found on Bioheart tab.
    [Tags]    BCP-CLINIC-FLEETMNG-06     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-07: Devices page - Search device ID on the registerd facility of patient
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the Device page

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-07     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-08: Devices page - Search device ID on the facility which is not registered facility of patient
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device not belong to the registered facility of patient
    ...  The user is on the Device page

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall not be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-08     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-09: Patient details - Search the Device ID by input manually
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the patient details

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-09     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-10: Patient details - Search the Device ID by copy - paste
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the patient details

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-10     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-11: Patient details - Search Bioheart device on Biokit fields
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the patient details
    ...  Test steps:

    ...  Expected result:
    ...  The Bioheart device shall not be found on Biokit fields.
    [Tags]    BCP-CLINIC-FLEETMNG-11     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-12: Patient details - Search Biokit device on Bioheart field
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the patient details
    ...  Test steps:

    ...  Expected result:
    ...  The Biokit device shall not be found on Bioheart field.
    [Tags]    BCP-CLINIC-FLEETMNG-12     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-13: Patient details - Search device ID on the registerd facility of patient
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device must belong to the searching facility
    ...  The user is on the Patient details

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-13     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-14: Patient details - Search device ID on the facility which is not registered facility of patient
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  The device not belong to the registered facility of patient
    ...  The user is on the Patient details

    ...  Test steps:

    ...  Expected result:
    ...  The inputted device shall not be displayed on the device list.
    [Tags]    BCP-CLINIC-FLEETMNG-14     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-15: Filter the list by 'Inventory'
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  All devices have the Inventory status shall be displayed.
    [Tags]    BCP-CLINIC-FLEETMNG-15     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-16: Filter the list by 'Assigned'
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  All devices have the Assigned status shall be displayed.
    [Tags]    BCP-CLINIC-FLEETMNG-16     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-17: Filter the list by both 'Inventory' and 'Assigned'
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  All devices have the Inventory and Assigned statuses shall be displayed.
    [Tags]    BCP-CLINIC-FLEETMNG-17     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-18: Clear the filter
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  All devices have the Inventory and Assigned statuses shall be displayed.
    [Tags]    BCP-CLINIC-FLEETMNG-18     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-19: Choose the items selection
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The number of selected items shall be displayed as the device row on the list
    [Tags]    BCP-CLINIC-FLEETMNG-19     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-20: Navigate between the devices list
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The user shall be able to navigate between the devices list by checking the pagination.
    [Tags]    BCP-CLINIC-FLEETMNG-20     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-21: Bioheart tab - Check the device ID
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID is required to show on the Device page.
    [Tags]    BCP-CLINIC-FLEETMNG-21     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-22: Bioheart tab - Check the device ID has RMA status
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID is displayed with the RMA tag flagged.
    [Tags]    BCP-CLINIC-FLEETMNG-22     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-23: Bioheart tab - Check the device's Firmware version
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device's Firmware version is required to show on the Device page.
    [Tags]    BCP-CLINIC-FLEETMNG-23     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-24: Bioheart tab - Check the device's Firmware version if any updates
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device's Firmware version shall be updated.
    [Tags]    BCP-CLINIC-FLEETMNG-24     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-25: Bioheart tab - Check the device status is Inventory
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device status shall be 'Inventory' when there is no program assigned to it.
    [Tags]    BCP-CLINIC-FLEETMNG-25     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-26: Bioheart tab - Check the device status is Assigned
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device status shall be 'Assigned' when there is a program assigned to it.
    [Tags]    BCP-CLINIC-FLEETMNG-26     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-27: Bioheart tab - Check the program ID on the device row
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The assigned program of the device shall be displayed on this column.
    [Tags]    BCP-CLINIC-FLEETMNG-27     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-28: Bioheart tab - Check the last user paired on the device row
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The last user paired of the device shall be the one who connects with the device at the lastest time.
    [Tags]    BCP-CLINIC-FLEETMNG-28     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-29: Bioheart tab - Check the last use info on the device row
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The last use of the device shall be the lastest time the device is connected to the app and data is synced.
    [Tags]    BCP-CLINIC-FLEETMNG-29     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-30: Bioheart tab - Check the facility column on the Device page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The facility column shall be displayed when the filter is 'All facilities' and hidden when the filter is any facility.
    [Tags]    BCP-CLINIC-FLEETMNG-30    manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-31: Biokit tab - Check the device ID
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID is required to show on the Device page.
    [Tags]    BCP-CLINIC-FLEETMNG-31    manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-32: Biokit tab - Check the device type is Blood pressure
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device type shall be displayed as Blood pressure.
    [Tags]    BCP-CLINIC-FLEETMNG-32    manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-33: Biokit tab - Check the device type is Pulse oximeter
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device type shall be displayed as Pulse oximeter.
    [Tags]    BCP-CLINIC-FLEETMNG-33    manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-34: Biokit tab - Check the device type is Thermometer
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device type shall be displayed as Thermometer.
    [Tags]    BCP-CLINIC-FLEETMNG-34    manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-35: Biokit tab - Check the Kit ID
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The Kit ID of (BP & SPO2 & Thermo) is required to show on the device row.
    [Tags]    BCP-CLINIC-FLEETMNG-35    manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-36: Biokit tab - Check the device status is Inventory
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device status shall be 'Inventory' when there is no program assigned to it.
    [Tags]    BCP-CLINIC-FLEETMNG-36     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-37: Biokit tab - Check the device status is Assigned
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device status shall be 'Assigned' when there is a program assigned to it.
    [Tags]    BCP-CLINIC-FLEETMNG-37     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-38: Biokit tab - Check the program ID on the device row
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The assigned program of the device shall be displayed on this column.
    [Tags]    BCP-CLINIC-FLEETMNG-38     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-39: Biokit tab - Check the last user paired on the device row
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The last user paired of the device shall be the one who connects with the device at the lastest time.
    [Tags]    BCP-CLINIC-FLEETMNG-39     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-40: Biokit tab - Check the last use info on the device row
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The last use of the device shall be the lastest time the device is connected to the app and data is record.
    [Tags]    BCP-CLINIC-FLEETMNG-40     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-41: Biokit tab - Check the facility column on the Device page
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The facility column shall be displayed when the filter is 'All facilities' and hidden when the filter is any facility.
    [Tags]    BCP-CLINIC-FLEETMNG-41    manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-42: Set up process - Scan device code
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID shall be detected if the device code is scanned successfully.
    [Tags]    BCP-CLINIC-FLEETMNG-42     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-43: Set up process - Check if the camera can not be accessed
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The pop-up shall be displayed to notify user that the camera can not be accessed.
    [Tags]    BCP-CLINIC-FLEETMNG-43     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-44: Set up process - Check if an invalid QR code is encountered
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-44     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-45: Set up process - Check if the scanned device has RMA tag
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be filled on the device ID field.
    [Tags]    BCP-CLINIC-FLEETMNG-45     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-46: Set up process - Check if the device is included on the patient registered facility
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can be scanned and auto-filled on the device ID field successfully.
    [Tags]    BCP-CLINIC-FLEETMNG-46     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-47: Set up process - Check if the device is not included on the patient registered facility
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-47     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-48: Set up process - Check if the device is not included on the system
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-48     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-49: Set up process - Check if the Bioheart device is scanned on the Biokit fields
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-49     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-50: Set up process - Check if the Biokit device is scanned on the Bioheart field
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-50     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-51: Equipment tab - Scan device code
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID shall be detected if the device code is scanned successfully.
    [Tags]    BCP-CLINIC-FLEETMNG-51     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-52: Equipment tab - Check if the camera can not be accessed
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The pop-up shall be displayed to notify user that the camera can not be accessed.
    [Tags]    BCP-CLINIC-FLEETMNG-52     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-53: Equipment tab - Check if an invalid QR code is encountered
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-53     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-54: Equipment tab - Check if the scanned device has RMA tag
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be filled on the device ID field.
    [Tags]    BCP-CLINIC-FLEETMNG-54     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-55: Equipment tab - Check if the device is included on the patient registered facility
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can be scanned and auto-filled on the device ID field successfully.
    [Tags]    BCP-CLINIC-FLEETMNG-55     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-56: Equipment tab - Check if the device is not included on the patient registered facility
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-56     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-57: Equipment tab - Check if the device is not included on the system
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-57     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-58: Equipment tab - Check if the Bioheart device is scanned on the Biokit fields
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-58     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-59: Equipment tab - Check if the Biokit device is scanned on the Bioheart field
    [Documentation]    Author: Hoang Le
    ...  Pre-condition:
    ...  Test steps:
    ...  Expected result:
    ...  The device ID can not be scanned.
    [Tags]    BCP-CLINIC-FLEETMNG-59     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-60: Select the Set up date of the device
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The set up date shall be pre-filled as today
    ...  Test steps:
    ...  Expected result:
    ...  The set up date shall be updated or kept the same according to user input.
    [Tags]    BCP-CLINIC-FLEETMNG-60     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

BCP-CLINIC-FLEETMNG-61: Stop the assigned program of the device
    [Documentation]    Author: Hoang Le
    ...  Pre-condition: The device is assigned to the program
    ...  Test steps:
    ...  Expected result:
    ...  All the devices of the stopped program shall be removed
    ...  The device(s) status shall be updated from Assigned to Inventory.
    [Tags]    BCP-CLINIC-FLEETMNG-61     manual      [BCP-2.18.0]
    Manual Should Be Passed    ${TEST NAME}     ${TEST DOCUMENTATION}

*** Keywords ***
#Suite Setup
    ${BROWSER_NODE}      Start Browser
    Import Library       project_cardiac_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${NURSES}            Get Config Param    USER > nurse
    ${TOKEN}             Sign In Cardiac     username=${NURSES}[0][username]     password=${NURSES}[0][password]
    ${VERSION}           Get Release Version
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

#Suite Teardown
    Quit Browser



