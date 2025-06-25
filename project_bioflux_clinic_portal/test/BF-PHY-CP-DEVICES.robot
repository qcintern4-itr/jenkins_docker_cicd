*** Settings ***
Documentation   Test Suite - Clinic Portal - Devices page
Metadata    sid     BF-PHY-CP-DEVICES
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py                                 ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Clinic.py       ${ENV}
Library     project_bioflux_clinic_portal/lib/api/Auth.py         ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Devices.py
Variables    project_bioflux_clinic_portal/lib/web/Variable.py

Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BF-PHY-CP-DEVICES       web
Test Timeout    1h

*** Test Cases ***
BF-PHY-CP-DEVICES-VIEW-ALL-01: View all subtabs in All Devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view all subtabs in All Devices page
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on In Study tab
    ...     2. Observe the subtabs displayed in the All Devices page
    ...
    ...     Expected Results:
    ...     There are 5 subtabs displayed, including:
    ...     -   In Study
    ...     -   Awaiting Upload
    ...     -   Not In Study
    ...     -   RMA
    ...     -   All

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-01       auto    R1
    Navigate To Devices
    ${sub_tabs}     Get Devices Subtabs
    ${expected}     Create List    In Study   Awaiting upload   Not in study   RMA   All devices
    Run Keyword And Continue On Failure    Should Be Equal    ${sub_tabs}     ${expected}

BF-PHY-CP-DEVICES-VIEW-ALL-02: View In study subtab in All Devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the In study devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on In Study tab
    ...     2. Observe the information displayed in the In Study list
    ...
    ...     Expected Results:
    ...     1. The In-study sub-tab displays devices that are currently being used for running studies, uploading study
    ...     data, and those whose studies already reached their end of duration. (“awaiting upload” devices included)
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Current study
    ...     -   Firmware Version
    ...     -   Status
    ...     -   Network
    ...     -   Charging State
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-02       auto
    ${study_id}     ${friendly_id}      Api Study - Create
    Navigate To Devices
    Filter Devices    devices_tab=All Devices       devices_subtab=In Study
    Select Facility   All facilities
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}     No In Study Devices found
    ${current_values}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Device Type]        All devices
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Device State]       In Study
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Sort]               descending
    ${device_info}          Evaluate       [key for key, value in ${devices}[0].items()]
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    Run Keyword And Continue On Failure    List Should Contain Value    ${expected_models}      ${devices}[0][Model]
    ${expected_info}        Create List    Device ID     Model    Current study     Firmware version     Status     Network    Charging state     Facility
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_info}      ${expected_info}
    # Verify device info in case facility filter is not “All facilities”
    Select Facility   ${FACILITIES}[0][name]
    ${devices}        Get All Devices
    ${device_info}    Evaluate       [key for key, value in ${devices}[0].items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${device_info}        Facility      The header 'Facility' is found from ${device_info}
    Select Facility   All facilities
    [Teardown]      Run Keywords     Api Stop Study          ${AWS_TOKEN}     study_id=${friendly_id}
    ...             AND              Api Delete Studies      ${AWS_TOKEN}     studyIds=${study_id}

BF-PHY-CP-DEVICES-VIEW-ALL-03: Sort the In study devices running studies by Device ID
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-03       auto
    Navigate To Devices
    Filter Devices    devices_tab=All Devices       devices_subtab=In Study
    Select Facility    All facilities
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${device_id_asc}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Should Be Equal    ${device_id}    ${device_id_asc}
    # sort descending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${device_id_des}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Should Be Equal    ${device_id}    ${device_id_des}

BF-PHY-CP-DEVICES-VIEW-ALL-04: Check pagination tool works properly in In Study tab
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-04       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-DEVICES-VIEW-ALL-05: View Awaiting Upload subtab in All Devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the Awaiting Upload devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on Awaiting Upload tab
    ...     2. Observe the information displayed in the Awaiting Upload list
    ...
    ...     Expected Results:
    ...     1. The Awaiting Upload sub-tab displays offline devices whose studies already reached their end of duration
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Current study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-05       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-DEVICES-VIEW-ALL-06: Sort the Awaiting Upload devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on Awaiting Upload tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-06       auto
    Navigate To Devices
    Filter Devices    devices_tab=All Devices       devices_subtab=Awaiting upload
    Select Facility    All facilities
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${device_id_asc}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Should Be Equal    ${device_id}    ${device_id_asc}
    # sort descending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${device_id_des}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Should Be Equal    ${device_id}    ${device_id_des}

BF-PHY-CP-DEVICES-VIEW-ALL-07: Check pagination tool works properly in Awaiting Upload tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on Awaiting Upload tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-07       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-DEVICES-VIEW-ALL-08: View Not In Study subtab in All Devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the Not In Study devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on Not In Study tab
    ...     2. Observe the information displayed in the Not In Study list
    ...
    ...     Expected Results:
    ...     1. The Not In Study sub-tab displays devices that are not in any studies and were connected to the server
    ...     at least once in the last 6 months
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-08       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices    devices_subtab=Not in study
    Select Facility    All facilities
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    Run Keyword And Continue On Failure    List Should Contain Value    ${expected_models}      ${devices}[0][Model]
    ${expected_headers}     Create List    Device ID      Model     Last study    Last connect      Firmware version     Facility
    ${headers}              Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_headers}     ${headers}
    Select Facility    ${FACILITIES}[1][name]
    ${devices}        Get All Devices
    ${headers}        Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${headers}      Facility    The header 'Facility' is found from ${headers}
    [Teardown]    Select Facility    All facilities

BF-PHY-CP-DEVICES-VIEW-ALL-09: Sort the Not In Study devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on Not In Study tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-09       auto
    Navigate To Devices
    Filter Devices    devices_tab=All Devices       devices_subtab=Not In Study
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-ALL-10: Check pagination tool works properly in Not In Study tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on Not In Study tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-10       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-DEVICES-VIEW-ALL-11: View RMA subtab in All Devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the RMA devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on RMA tab
    ...     2. Observe the information displayed in the RMA list
    ...
    ...     Expected Results:
#    Break to new case
#    ...     1. The RMA sub-tab displays all RMA devices. When the support staff finishes processing the RMA request,
#    ...     the device will be removed from the list (as it is no longer assigned to the clinic)
    ...     1. By default, the list is sorted by Device ID in descending order
    ...     2. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-11       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices       devices_subtab=RMA
    Select Facility    All facilities
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No RMA Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${actual_headers}        Evaluate    [k for k, v in ${devices}[0].items()]
    ${expected_headers}      Create List    Device ID     Model      Last study      Last connect     Firmware version      Facility
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_headers}        ${expected_headers}
    ${expected_model}        Create List   Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_model}          Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List   ${expected_model}     ${actual_model}
    Select Facility    ${FACILITIES}[0][name]
    ${devices}         Get All Devices
    ${actual_headers}        Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${actual_headers}       Facility
    [Teardown]    Select Facility    All facilities

BF-PHY-CP-DEVICES-VIEW-ALL-12: Sort the RMA devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on RMA tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-12       auto
    Navigate To Devices
    Filter Devices    devices_tab=All Devices       devices_subtab=RMA
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-ALL-13: Check pagination tool works properly in RMA tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on RMA tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-13       manual    R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-PHY-CP-DEVICES-VIEW-ALL-14: View All devices subtab in All Devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the All devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on All tab
    ...     2. Observe the information displayed in the All list
    ...
    ...     Expected Results:
    ...     1. By default, the list is sorted by Device ID in descending order
    ...     2. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Firmware version
    ...     -   Status
    ...     -   Network
    ...     -   Charging State
    ...     -   Last connect
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-14       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices       devices_subtab=All devices
    ${devices}      Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${devices_id}   Evaluate    [id['Device ID'].replace('| RMA', '').strip() for id in ${devices}]
    ${expected_devices_id}   Evaluate       sorted(${devices_id}, reverse=True)   # Device ID in descending order
    Run Keyword And Continue On Failure     Lists Should Be Equal    ${devices_id}      ${expected_devices_id}
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List   ${expected_models}      ${actual_models}
    ${device_headers}        Evaluate       [k for k, v in ${devices}[0].items()]
    ${expected_headers}      Create List    Device ID    Model   Firmware version    Status    Network   Charging state   Last connect   Facility
    Run Keyword And Continue On Failure     Lists Should Be Equal    ${device_headers}      ${expected_headers}
    Select Facility    ${FACILITIES}[1][name]
    ${devices}        Get All Devices
    ${headers}        Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${headers}      Facility    The header 'Facility' is found from ${headers}
    [Teardown]    Select Facility    All facilities

BF-PHY-CP-DEVICES-VIEW-ALL-15: Sort the All devices by Device ID
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-15       auto
    Navigate To Devices
    Filter Devices    devices_tab=All Devices       devices_subtab=All devices
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-ALL-16: Check pagination tool works properly in All tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on All tab of the Devices page
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
# Break to new case
#    ...     -   If the device list is less than 10 then the pagination tool shall be hidden
    ...     2. In step 2:
    ...     -   The list shall displays a maximum of 30 items per page
    ...     3. In step 3:
    ...     -   The list shall displays a maximum of 50 items per page
    ...     4. In step 4:
    ...     -   The user shall be able to navigate between loaded pages

    [Tags]      BF-PHY-CP-DEVICES-VIEW-ALL-16       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices       devices_subtab=All devices
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Devices found
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Devices    next_or_previous=next
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Devices    next_or_previous=previous
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=30 per page
    ${current_pagination}     Get Devices Current Pagination
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      30
    Custom Devices Size Per Page    rows=50 per page
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-VIEW-INACTIVE-01: View Lost/Inactive devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the Lost/Inactive devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on Lost/Inactive tab
    ...     2. Observe the information displayed in the Lost/Inactive list
    ...
    ...     Expected Results:
    ...     1. The Lost/Inactive displays all devices that have not been connected to the server within
    ...     the last 6 months
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-INACTIVE-01       auto
    Navigate To Devices
    Navigate To Devices Tab    Lost/Inactive
    ${devices}      Get All Devices On Lost Tab
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${devices_id}   Evaluate    [id['Device ID'].replace('| RMA', '').strip() for id in ${devices}]
    ${expected_devices_id}   Evaluate       sorted(${devices_id}, reverse=True)   # Device ID in descending order
    Run Keyword And Continue On Failure     Lists Should Be Equal    ${devices_id}      ${expected_devices_id}
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List   ${expected_models}      ${actual_models}
    ${device_headers}        Evaluate       [k for k, v in ${devices}[0].items()]
    ${expected_headers}      Create List    Device ID    Model   Last study     Last connect    Firmware version    Facility
    Run Keyword And Continue On Failure     Lists Should Be Equal    ${device_headers}      ${expected_headers}
    Select Facility     ${FACILITIES}[0][name]
    ${devices}        Get All Devices On Lost Tab
    ${headers}        Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${headers}      Facility        The header 'Facility' is found from ${headers}
    [Teardown]    Select Facility    All facilities

BF-PHY-CP-DEVICES-VIEW-INACTIVE-02: Sort the Lost/Inactive devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on Lost/Inactive tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-INACTIVE-02       auto
    Navigate To Devices
    Filter Devices    devices_tab=Lost/Inactive
    Select Facility   All facilities
    # sort descending
    ${devices}        Get All Devices On Lost Tab
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices On Lost Tab
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-INACTIVE-03: Check pagination tool works properly in Lost/Inactive tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on Lost/Inactive tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-INACTIVE-03       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=Lost/Inactive
    Select Facility    All facilities
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Devices found
    ${current_pagination}     Get Current Pagination On Lost Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Devices    next_or_previous=next_lost
    ${current_pagination}     Get Current Pagination On Lost Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Devices    next_or_previous=previous_lost
    ${current_pagination}     Get Current Pagination On Lost Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page On Lost Tab   rows=30 per page
    ${current_pagination}     Get Current Pagination On Lost Tab
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page On Lost Tab    rows=50 per page
    ${current_pagination}     Get Current Pagination On Lost Tab
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-VIEW-UNUSED-01: View All/Unused devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the All/Unused devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on All/Unused tab
    ...     2. Observe the information displayed in the All/Unused list
    ...
    ...     Expected Results:
    ...     1. The All/Unused displays all unused devices
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-01        auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=All time
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Device Type]        Unused
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Last Used]          All time
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_models}      ${actual_models}
    ${expected_headers}     Create List    Device ID    Model    Last study     Last used      Last connect     Firmware version
    ${headers}              Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_headers}     ${headers}

BF-PHY-CP-DEVICES-VIEW-UNUSED-02: Sort the All/Unused devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on All/Unused tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-02       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=All time
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-UNUSED-03: Check pagination tool works properly in All/Unused tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on All/Unused tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-03       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=Unused       devices_subtab=All time
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Unused Devices found
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Devices    next_or_previous=next
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Devices    next_or_previous=previous
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=30 per page
    ${current_pagination}     Get Devices Current Pagination
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      30
    Custom Devices Size Per Page    rows=50 per page
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-VIEW-UNUSED-04: View 1month/Unused devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the 1month/Unused devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on 1month/Unused tab
    ...     2. Observe the information displayed in the 1month/Unused list
    ...
    ...     Expected Results:
    ...     1. The All/Unused displays devices that has not been used in a study  (greater than 29 days and less than
    ...     or equal 60 days
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-04       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=1 month
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Device Type]        Unused
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Last Used]          1 month
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_models}      ${actual_models}
    ${expected_headers}     Create List    Device ID    Model    Last study     Last used      Last connect     Firmware version
    ${headers}              Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_headers}     ${headers}

BF-PHY-CP-DEVICES-VIEW-UNUSED-05: Sort the 1month/Unused devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on 1month/Unused tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-05        auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=1 month
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-UNUSED-06: Check pagination tool works properly in 1month/Unused tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on 1month/Unused tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-06       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=1 month
    Select Facility    All facilities
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Unused Devices found
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Devices    next_or_previous=next
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Devices    next_or_previous=previous
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=30 per page
    ${current_pagination}     Get Devices Current Pagination
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=50 per page
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-VIEW-UNUSED-07: View 2months/Unused devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the 2months/Unused devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on 2months/Unused tab
    ...     2. Observe the information displayed in the 2months/Unused list
    ...
    ...     Expected Results:
    ...     1. The 2months/Unused displays devices that has not been used in a study  ( greater than 60 days and less than
    ...     or equal 90 days)
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-07       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=2 months
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Device Type]        Unused
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Last Used]          2 months
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_models}      ${actual_models}
    ${expected_headers}     Create List    Device ID    Model    Last study     Last used      Last connect     Firmware version
    ${headers}              Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_headers}     ${headers}

BF-PHY-CP-DEVICES-VIEW-UNUSED-08: Sort the 2months/Unused devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on 2months/Unused tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-08       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=2 months
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-UNUSED-09: Check pagination tool works properly in 2months/Unused tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on 2months/Unused tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-09       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=2 months
    Select Facility    All facilities
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Unused Devices found
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Devices    next_or_previous=next
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Devices    next_or_previous=previous
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=30 per page
    ${current_pagination}     Get Devices Current Pagination
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=50 per page
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-VIEW-UNUSED-10: View 3months/Unused devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the 3months/Unused devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on 3months/Unused tab
    ...     2. Observe the information displayed in the 3months/Unused list
    ...
    ...     Expected Results:
    ...     1. The 3months/Unused displays devices that has not been used in a study  ( greater than 90 days and less than
    ...     or equal 180 days)
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
#    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-10       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=3 months
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Device Type]        Unused
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Last Used]          3 months
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_models}      ${actual_models}
    ${expected_headers}     Create List    Device ID    Model    Last study     Last used      Last connect     Firmware version
    ${headers}              Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_headers}     ${headers}

BF-PHY-CP-DEVICES-VIEW-UNUSED-11: Sort the 3months/Unused devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on 3months/Unused tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-11       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=3 months
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-UNUSED-12: Check pagination tool works properly in 3months/Unused tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on 3months/Unused tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-12       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=Unused       devices_subtab=3 months
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Unused Devices found
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=30 per page
    ${current_pagination}     Get Devices Current Pagination
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=50 per page
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-VIEW-UNUSED-13: View 6months/Unused devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the 6months/Unused devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on 6months/Unused tab
    ...     2. Observe the information displayed in the 6months/Unused list
    ...
    ...     Expected Results:
    ...     1. The 6months/Unused displays devices that has not been used in a study  ( greater than 90 days and less than
    ...     or equal 180 days)
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-13       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=6 months
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Device Type]        Unused
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Last Used]          6 months
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_models}      ${actual_models}
    ${expected_headers}     Create List    Device ID    Model    Last study     Last used      Last connect     Firmware version
    ${headers}              Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_headers}     ${headers}

BF-PHY-CP-DEVICES-VIEW-UNUSED-14: Sort the 6months/Unused devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on 6months/Unused tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-14       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=3 months
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-UNUSED-15: Check pagination tool works properly in 6months/Unused tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on 6months/Unused tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-15       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=Unused       devices_subtab=6 months
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Unused Devices found
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Devices    next_or_previous=next
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Devices    next_or_previous=previous
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=30 per page
    ${current_pagination}     Get Devices Current Pagination
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
#    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      30
    Custom Devices Size Per Page    rows=50 per page
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-VIEW-UNUSED-16: View 1year/Unused devices page
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can view the 1year/Unused devices assigned to the facilities
    ...
    ...     Precondition: The user has logged in to the Clinic portal
    ...
    ...     Test Steps:
    ...     1. Click Devices page and land on 1year/Unused tab
    ...     2. Observe the information displayed in the 1year/Unused list
    ...
    ...     Expected Results:
    ...     1. The 1year/Unused displays devices that has not been used in a study  ( greater than 364 days)
    ...     2. By default, the list is sorted by Device ID in descending order
    ...     3. The device list displays the following information:
    ...     -   Device ID
    ...     -   Model, it can be: Bioflux, Biocore/Biotres, BiotresRT, BiotresRTL
    ...     -   Last study
    ...     -   Last connect
    ...     -   Firmware version
    ...     -   Facility: Only available when facility filter is “All facilities”

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-16       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=1 year
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}      No not in study Devices found
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Device Type]        Unused
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Last Used]          1 year
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Sort]               descending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]          Device ID
    ${expected_models}      Create List    Bioflux      Biocore/Biotres     BiotresRT       BiotresRTL
    ${actual_models}        Evaluate    [item['Model'].replace('| Auto','').strip() for item in ${devices}]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${expected_models}      ${actual_models}
    ${expected_headers}     Create List    Device ID    Model    Last study     Last used      Last connect     Firmware version
    ${headers}              Evaluate    [k for k, v in ${devices}[0].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_headers}     ${headers}

BF-PHY-CP-DEVICES-VIEW-UNUSED-17: Sort the 1year/Unused devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on 1year/Unused tab of the Devices page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Device ID
    ...     2. Click the [Sort] button next to the Device ID again
    ...
    ...     Expected Results:
    ...     1. The device list shall sort in descending order
    ...     2. The device list shall sort in ascending order

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-17       auto
    Navigate To Devices
    Filter Devices    devices_tab=Unused     devices_subtab=1 year
    Select Facility    All facilities
    # sort descending
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${descending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=True)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${descending_device_id}
    # sort ascending
    Check Sort Reports
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No All devices found
    ${device_id}        Evaluate    [item['Device ID'].replace('| RMA', '').strip() for item in ${devices}]
    ${ascending_device_id}      Evaluate    sorted(${device_id}, key=int, reverse=False)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_id}        ${ascending_device_id}

BF-PHY-CP-DEVICES-VIEW-UNUSED-18: Check pagination tool works properly in 1year/Unused tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description: The device’s table is divided into pages
    ...
    ...     Precondition: The user is on 1year/Unused tab of the Devices page
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

    [Tags]      BF-PHY-CP-DEVICES-VIEW-UNUSED-18       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=Unused       devices_subtab=1 year
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}       No Unused Devices found
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Run Keyword And Continue On Failure    Length Should Be   ${devices}                      10
    Pagination Devices    next_or_previous=next
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     2
    Pagination Devices    next_or_previous=previous
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=30 per page
    ${current_pagination}     Get Devices Current Pagination
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1
    Custom Devices Size Per Page    rows=50 per page
    ${current_pagination}     Get Devices Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]     50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]     1

BF-PHY-CP-DEVICES-SEARCH-01: Search on device list
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

    [Tags]      BF-PHY-CP-DEVICES-SEARCH-01     auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices    devices_subtab=All devices
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    Search by ${current_filter}[Search By]      Search by Device ID  # Verify placehoder at search field
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No device found - with text search without string
    ${device_id}      Set Variable    ${devices}[0][Device ID]
    Filter Devices     devices_tab=All Devices    devices_subtab=All devices     text_search=${device_id}
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty            ${devices}        No device found - with text search ${device_id}
    Run Keyword And Continue On Failure    Length Should Be               ${devices}        1
    Run Keyword And Continue On Failure    Should Be Equal      ${devices}[0][Device ID]      ${device_id}
    Filter Devices      devices_subtab=In Study
    ${current_study_id}       Get Current Filter
    Run Keyword And Continue On Failure    Should Be Equal      ${device_id}      ${current_study_id}[Text Search]
    Filter Devices      devices_subtab=Awaiting upload
    ${current_study_id}       Get Current Filter
    Run Keyword And Continue On Failure    Should Be Equal      ${device_id}      ${current_study_id}[Text Search]
    Filter Devices      devices_subtab=Not in study
    ${current_study_id}       Get Current Filter
    Run Keyword And Continue On Failure    Should Be Equal      ${device_id}      ${current_study_id}[Text Search]
    Filter Devices      devices_subtab=RMA
    ${current_study_id}       Get Current Filter
    Run Keyword And Continue On Failure    Should Be Equal      ${device_id}      ${current_study_id}[Text Search]
    Clear Devices Text Search
    ${current_filter}       Get Current Filter
    Run Keyword And Continue On Failure    Should Be Empty    ${current_filter}[Text Search]

BF-PHY-CP-DEVICES-SEARCH-02: No result found on device list
    [Documentation]     Author: Thang Tran
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
    ...     -   The system shall filter and display the the message "No result found"
    ...     3. In step 3:
    ...     -   The search value and its result shall be applied until it is cleared out

    [Tags]      BF-PHY-CP-DEVICES-SEARCH-02         auto
    Navigate To Devices
    Filter Devices    devices_tab=All devices    devices_subtab=All devices
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    Search by ${current_filter}[Search By]      Search by Device ID  # Verify placehoder at search field
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}
    Filter Devices     devices_tab=All Devices    devices_subtab=All devices     text_search=0123456789
    ${devices}        Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Empty            ${devices}        No result found
    Filter Devices      devices_subtab=In Study
    ${current_study_id}       Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Empty            ${current_study_id}        No result found
    Filter Devices      devices_subtab=Awaiting upload
    ${current_study_id}       Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Empty      ${current_study_id}     No result found
    Filter Devices      devices_subtab=Not in study
    ${current_study_id}       Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Empty      ${current_study_id}     No result found
    Filter Devices      devices_subtab=RMA
    ${current_study_id}       Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Empty      ${current_study_id}     No result found
    Clear Devices Text Search
    ${current_filter}       Get Current Filter
    Run Keyword And Continue On Failure    Should Be Empty    ${current_filter}[Text Search]

BF-PHY-CP-DEVICES-FILTER-FACILITY-01: Filter by facility
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

    [Tags]      BF-PHY-CP-DEVICES-FILTER-FACILITY-01        auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices    devices_subtab=All devices
    # Default
    ${current_filter}       Get Devices Current Filter
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Facility]       All facilities
    ${filter_options}       Get Devices Filter Options
    ${actual_facilities}    Set Variable    ${filter_options}[Facilities]
    ${expected_order}       Evaluate    sorted(${actual_facilities}, reverse=False)        # alphabet order
    # Verify facilities order
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_facilities}       ${expected_order}
    Select Facility    ${FACILITIES}[0][name]
    ${all_devices}      Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${all_devices}     No devices found - with facility ${FACILITIES}[0][name]
    ${current_filter_devices}       Get Devices Current Filter
    # The filtered and selected facility shall be applied to other pages
    Navigate To Other Page    page=Fleet
    ${current_filter_studies}       Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter_studies}       ${current_filter_devices}[Facility]
    Navigate To Other Page    page=Inbox
    ${current_filter_studies}       Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter_studies}       ${current_filter_devices}[Facility]
    Navigate To Other Page    page=Studies
    ${current_filter_studies}       Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter_studies}       ${current_filter_devices}[Facility]
    Navigate To Other Page    page=Support
    ${current_filter_studies}       Get Current Facility
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter_studies}       ${current_filter_devices}[Facility]
    [Teardown]    Select Facility    All facilities

BF-PHY-CP-DEVICES-FILTER-MODEL-01: Filter by model
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
    ...     4. Select "Biocore/Biotres" option
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   By default, the default value is All models
    ...     2. In step 2:
    ...     -   The following options displayed: Bioflux, Biocore/Biotres
    ...     -   The “All models” option is always on the top of the list
    ...     3. In step 3:
    ...     -   The page shall filter the data on the portal according to the Bioflux devices
    ...     4. In step 4:
    ...     -   The page shall filter the data on the portal according to the Biocore/Biotres devices

    [Tags]      BF-PHY-CP-DEVICES-FILTER-MODEL-01       auto    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices    devices_subtab=All devices
    ${default_model}        Get Devices Current Filter
    ${default_model}        Set Variable     ${default_model}[Model]
    Run Keyword And Continue On Failure    Should Be Equal    ${default_model}      All models
    ${filter_options}       Get Devices Filter Options
    Run Keyword And Continue On Failure    Should Be Equal        ${filter_options}[Model][0]       ${Model.All_models}
    Run Keyword And Continue On Failure    Should Be Equal        ${filter_options}[Model][1]       ${Model.Bioflux}
    Run Keyword And Continue On Failure    Should Be Equal        ${filter_options}[Model][2]       ${Model.Biocore}
    # filter
    Filter Devices    by_model=Bioflux
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Be True    all('${Model.Bioflux}' == model['Model'] for model in ${devices})
    Filter Devices    by_model=Biocore/Biotres
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Be True    all('${Model.Biocore}' in model['Model'] for model in ${devices})
    Filter Devices    by_model=All models
    ${devices}        Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${devices}        No device found - with model All models

BF-PHY-CP-DEVICES-QUICKACCESS-01: Quick access to device information
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
    ...     -   General info: Model, Timezone, Firmware version, Operator, Network mode, Device lifetime
    ...     -   Last sync status: RSSI, Lead On, Battery level, SD card free space, Charging state, Last connect
    ...
    ...     **Others
    ...     Update date: 5/27/2024 - Trinh Nguyen
    ...
    [Tags]      BF-PHY-CP-DEVICES-QUICKACCESS-01        auto    CP-2.23.0    R1
    Navigate To Devices
    Filter Devices    devices_tab=All devices       devices_subtab=All devices
    ${devices}      Get Devices On Page
    View All Devices Device Information On    row=1
    ${device_info_view}     Get Device Info View
    ${expect_general_info}  Create List    Facility     Model    Firmware version   Timezone    Operator    Network mode    Device lifetime
    ${expect_last_sync}     Create List    RSSI     Lead on     Battery level   SD card free space      Charging state     Last connect
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_info_view}[General information]           ${expect_general_info}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${device_info_view}[Last synced status]     ${expect_last_sync}
    Run Keyword And Continue On Failure    Should Be Equal    ${devices}[0][Model]          ${device_info_view}[General information][Model]
    Run Keyword And Continue On Failure    Should Be Equal    ${devices}[0][Network]        ${device_info_view}[General information][Network mode]
    Run Keyword And Continue On Failure    Should Be Equal    ${devices}[0][Last connect]   ${device_info_view}[Last synced status][Last connect]

BF-PHY-CP-DEVICES-QUICKACCESS-02: Quick access to device information for Biocore/Biocore Pro with FW HSR
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Results:
    ...

    [Tags]      BF-PHY-CP-DEVICES-QUICKACCESS-02       manual    R1     CP-2.23.2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py    ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Devices.py   ${BROWSER_NODE}  ${ENV}
    ${PHY_USER}           Get Config Param       NEW_USER > clinic_physician
    ${FACILITIES}         Get Config Param       FACILITY
    ${DEVICES}            Get Config Param       DEVICE
    ${AWS_AUTH}           Get Config Param       AWS_AUTH
    Set Suite Variable    ${DEVICES}
    Set Suite Variable    ${PHY_USER}
    Set Suite Variable    ${FACILITIES}
    Set Suite Variable    ${AWS_AUTH}
    ${TOKEN}              Sign In Bioflux       username=${PHY_USER}[0][username]       password=${PHY_USER}[0][password]
    ${AWS_RPS}            Initiate Auth         username=${AWS_AUTH}[users][0][username]        password=${AWS_AUTH}[users][0][password]        client_id=${AWS_AUTH}[client_id]
    Set Suite Variable    ${AWS_TOKEN}      ${AWS_RPS}[AuthenticationResult][AccessToken]
    ${VERSION}            Get Release Version
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    Set Suite Variable    ${TOKEN}

SUITE TEARDOWN
    Quit Browser

Devices - Filter
    [Arguments]    ${device_tab}    ${device_subtab}     ${model}
    Navigate To Devices
    Filter Devices    devices_tab=${device_tab}    devices_subtab=${device_subtab}     by_model=${model}
    ${all_devices}      Get All Devices
    ${text}             Set Variable    ${all_devices}[0][Device ID]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${all_devices}    No devices found - text search without text string
    Filter Devices    devices_tab=${device_tab}    devices_subtab=${device_subtab}     by_model=${model}      text_search=${text}
    ${all_devices}      Get All Devices
    Run Keyword And Continue On Failure    Should Not Be Empty    ${all_devices}                    No devices found - with text search ${text}
    Run Keyword And Continue On Failure    Should Be Equal        ${all_devices}[0][Device ID]      ${text}
    Run Keyword If    '${model}' != 'All models'
    ...  Run Keyword And Continue On Failure    Should Be True      all('${model}'.lower() in d['Model'].lower() for d in ${all_devices})       Invalid results are showing - with model `${model}`

Api Study - Create
    Api Create Study On    token=${AWS_TOKEN}    facility=${FACILITIES}[0][id]   device_id=${DEVICES}[bioflux_device][0][id]   study_type=CARDIAC EVENT   device_type=Bioflux
    ${filter}          Create Dictionary     status=Ongoing        deviceId=${DEVICES}[bioflux_device][0][id]
    ${filter}          Create Dictionary     filter=${filter}
    ${studies}         Api Clinic Studies    ${AWS_TOKEN}      ${filter}
    ${study_id}        Set Variable     ${studies}[body][data][clinicStudies][0][id]
    ${friendly_id}     Set Variable     ${studies}[body][data][clinicStudies][0][friendlyId]
    Set Global Variable    ${study_id}
    Set Global Variable    ${friendly_id}
    RETURN    ${study_id}     ${friendly_id}
