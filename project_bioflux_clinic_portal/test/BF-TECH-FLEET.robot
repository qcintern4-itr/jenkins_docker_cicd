*** Settings ***
Documentation   Test Suite - Clinic Portal - Fleet page
Metadata    sid     BF-TECH-FLEET
Metadata    owner   Nhan Nguyen
Library     Collections
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioflux_clinic_portal/lib/ConfigHandler.py    ${ENV}
Library     project_bioflux_clinic_portal/lib/web/Common.py
Library     project_bioflux_clinic_portal/lib/web/Fleet.py
Library     project_bioflux_clinic_portal/lib/web/Devices.py

Suite Setup     SUITE SETUP
Suite Teardown  SUITE TEARDOWN
Force Tags      BF-TECH-FLEET     web
Test Timeout    1h

*** Test Cases ***
BF-TECH-FLEET-RMA-CREATE-01: Submit an RMA ticket to Biotricity in case user only associates with more than one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can submit an RMA ticket to the Biotricity
    ...
    ...     Precondition:
    ...     - The user is on the RMA Request page
    ...
    ...     Test Steps:
    ...     1. Click the New RMA button
    ...     2. Click the Facility information dropdown field
    ...     3. Select a specific facility
    ...     4. Click the Add more device button on the RMA device information section
    ...     5. Enter some digits on the Device ID dropdown box
    ...     6. Select a specific Device ID from the dropdown list
    ...     7. Click/search the Replacement Device ID from dropdown list and select the Device ID (if any)
    ...     8. Click the Reason for RMA dropdown list then select a/multiple reasons
    ...     9. Click the Patient impact dropdown list, then select a specific patient impact
    ...     10. Click the "What is patient impact?" hyperlink
    ...     11. Click the [X] button on sidebar
    ...     12. Click on the Date of event datepicker
    ...     13. Select a specific date on datepicker
    ...     14. Click the Add button
    ...     15. Click the delete button on the row
    ...     16. Click the edit button
    ...     17. Enter an/multiple valid email on the notification emails field
    ...     18. Enter valid digit on Contact phone number field (if empty) of Shipping address section
    ...     19. Enter valid email on the Contact email (if empty) of Shipping address section
    ...     20. Click the Submit Request button
    ...
    ...     Expected Results:
    ...     1. At step 1, the user shall be navigated to the New RMA Request screen
    ...     2. At step 2, there shall be a drop-down list of facilties . Re-selecting the facility shall clear the
    ...     below inputted data
    ...     3. At step 3, the selected facility shall be displayed
    ...     4. At step 4, the Add RMA Device modal shall be displayed with the following warning: "For issues related
    ...     to the ECG of the Bioflux device, check the cable wires to make sure they are not loose prior to requesting
    ...     an RMA for the device"
    ...     5. At step 5, A list of device ID that belongs to the selected faciliy shall be displayed and divided into 2 sections:
    ...     - Normal devices which are selectable
    ...     - Non-selectable devices-RMA & Renewal devices
    ...     6. At step 6, the selected device shall be displayed. The Device ID can only be selected one
    ...     7. At step 7, after clicking the Replacement ID, the list shall contain the devices that have a same type with the selected,
    ...     the searched/selected replacement device shall be displayed (if the facility applies the Renewal Stock)


    [Tags]  BF-TECH-FLEET-RMA-CREATE-01       auto
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    ${rma_device_info}      Create Dictionary    device_id=${DEVICE}[device_id]       reasons=Charging Issue      add_more=${True}
    ${rma_shipping_address}     Create Dictionary    contact_email=test@yopmail.com       contact_phone=484-351-2215
    Add New Rma Request     facility=Facility_QA_02     rma_device_info=${rma_device_info}      notification_email=test@yopmail.com       shipping_address=${rma_shipping_address}
    Navigate To Other Page    page=Devices
    Filter Devices    devices_tab=Devices       devices_subtab=RMA      text_search=${DEVICE}[device_id]
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${devices}[0][Device ID]         ${DEVICE}[device_id] | RMA
    Filter Devices    devices_subtab=All devices
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${devices}[0][Device ID]         ${DEVICE}[device_id] | RMA
    Clear RMA Request
    Navigate To Other Page    page=Devices
    Filter Devices    devices_tab=Devices       devices_subtab=All devices      text_search=${DEVICE}[device_id]
    ${devices}      Get Devices On Page
    Run Keyword And Continue On Failure    Should Be Equal    ${devices}[0][Device ID]         ${DEVICE}[device_id]

BF-TECH-FLEET-RMA-CREATE-02: View list of Reason for RMA of Bioflux
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the RMA Request page
    ...
    ...     Test Steps:
    ...     1. Click "Add more device" and select a bioflux device ID
    ...     2. Click "Reason for RMA" and view dropdown list
    ...
    ...     Expected Results:
    ...     1. The drop-down list is divided into two separate sections: Device issues and Other reasons
    ...     i. Device issues (select all that apply), including:
    ...         - 1.	Charging Issue
    ...         - 2.	Device Errors (describe)
    ...         - 3.	ECG Issue
    ...         - 4.	No Cell Connection
    ...         - 5.	Screen Issue
    ...         - 6.	Broken Charger
    ...         - 7.	Courtesy RMA
    ...         - 8.	Other (describe)
    ...     ii.	Other reasons (select one, cannot combine with device issues), including:
    ...         - 1.	Return to Stock
    ...         - 2.	Lost Device
    ...         - 3.	Closed Account

    ...     **Others**
    ...     - Updated date: 12/08/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-CREATE-02       manual       R1    CP-2.18.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-03: View list of Reason for RMA of Biocore/Biotres
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the RMA Request page
    ...
    ...     Test Steps:
    ...     1. Click "Add more device" and select a bioflux device ID
    ...     2. Click "Reason for RMA" and view dropdown list
    ...
    ...     Expected Results:
    ...     1. The drop-down list is divided into two separate sections: Device issues and Other reasons
    ...     i. Device issues (select all that apply), including:
    ...         - 1.	Charging Issue
    ...         - 2.	Device Errors (describe)
    ...         - 3.	Device Dead on Arrival
    ...         - 4.	Connection Issue
    ...         - 5.	ECG Leads
    ...         - 6.	Damaged (describe)
    ...         - 7.	Courtesy RMA
    ...         - 8.	Other (describe)

    ...     ii.	Other reasons (select one, cannot combine with device issues), including:
    ...         - 1.	Return to Stock
    ...         - 2.	Lost Device
    ...         - 3.	Closed Account

    ...     **Others**
    ...     - Updated date: 12/08/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-CREATE-03       manual       R1    CP-2.18.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-03-CP2.18.0: View list of Reason for RMA of Biocore/Biotres/Biotres Pro
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the RMA Request page
    ...
    ...     Test Steps:
    ...     1. Click "Add more device" and select a bioflux device ID
    ...     2. Click "Reason for RMA" and view dropdown list
    ...
    ...     Expected Results:
    ...     1. The drop-down list is divided into two separate sections: Device issues and Other reasons
    ...     i. Device issues (select all that apply), including:
    ...         - 1.	Charging Issue
    ...         - 2.	Device Errors (describe)
    ...         - 3.	ECG Issue
    ...         - 4.	No Cell Connection
    ...         - 5.	Broken Charger
    ...         - 6.	Damaged (describe)
    ...         - 7.	Courtesy RMA
    ...         - 8.	Other (describe)
    ...     ii.	Other reasons (select one, cannot combine with device issues), including:
    ...         - 1.	Return to Stock
    ...         - 2.	Lost Device
    ...         - 3.	Closed Account

    ...     **Others**
    ...     - Updated date: 12/08/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-CREATE-03-CP2.18.0       manual       R1   CP-2.18.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-04: View list of Patient impact
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on the RMA Request page
    ...
    ...     Test Steps:
    ...     1. Click "Add more device" and select a bioflux device ID
    ...     2. Click "Patient impact" and view dropdown list
    ...
    ...     Expected Results:
    ...     1. The drop-down list display the following options:
    ...         - 1.	None (default)
    ...         - 2.	Medical intervention
    ...         - 3.	Patient death
    ...         - 4.	Patient injury
    ...         - 5.	Unknown

    ...     **Others**
    ...     - Updated date: 12/05/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-CREATE-04       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-05: Cannot add a RMA devices if the number of devices in the device list with the reason "Device issues" reaches 5
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - SnD (Operation manager) configure maximum of 5 devices per ticket
    ...
    ...     Test Steps:
    ...     1. Add 5 devices with reason "Device issues"
    ...     2. Add more 1 device with reason "Device issues", click "Add Device" button
    ...
    ...     Expected Results:
    ...     1. Display an error message "The RMA device limit has been reached." under Reason for RMA

    ...     **Others**
    ...     - Updated date: 12/05/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-CREATE-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-01: Facility has not subscibed Protect+ program-Iinitiate an RMA request with reason "Return for Maintenance" for a device
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-01       manual    CP-2.26.0       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-02: Facility has subscibed Protect+ program-Iinitiate an RMA request with reason "Protect+ Program" for a device
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-02       manual    CP-2.26.0       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-03: Facility has not subscibed Protect+ program-Iinitiate an RMA request with reason "Return for Maintenance" for multiple devices
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-03       manual    CP-2.26.0       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-04: Facility has subscibed Protect+ program-Iinitiate an RMA request with reason "Protect+ Program" for multiple devices
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-04       manual    CP-2.26.0       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-05: Cannot initiate an RMA request with reason "Return for Maintenance" for multiple devices exceeded max RMA devices
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-05       manual    CP-2.26.0       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-06: Cannot initiate an RMA request with reason "Protect+ Program" for multiple devices exceeded max RMA devices
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-MAINTENANCE-06       manual    CP-2.26.0       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}


BF-TECH-FLEET-VIEW-01: View list of RMA tickets
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the list of RMA tickets
    ...
    ...     Precondition:
    ...     - The user is on the RMA Request tab of FLEET page
    ...
    ...     Test Steps:
    ...     1. Observe the RMA Request screen
    ...
    ...     Expected Results:
    ...     1. The RMA list contains below attributes:
    ...     - RMA ID
    ...     - Status: Display the RMA's status
    ...      + Pending: New RMA pending for approval, the default value shall be set to "Pending"
    ...      + Approved: . RMAs approved by support user
    ...                  . The support user has been created a RMA ticket
    ...      + Completed:. RMAs marked completed by support user
    ...                  . The clinic user has been selected the Replacement Device ID during create RMA request
    ...                  . The clinic user edit a pending ticket, then add the Replacement Device ID
    ...      + Canceled: . RMAs canceled by Clinic
    ...                  . RMAs rejected by support user
    ...     - Facility
    ...     - Outbound Devices
    ...     - Inbound Devices
    ...     - Request Date
    ...     - Returned Date: Follow the date on the shipping label created on Support portal (outbound)
    ...     - By default, the list of RMA tickets is sorted in chronological order based on the Request date
    ...     - There shall be a filter for user to filter the view list base on the RMA status, the default value shall
    ...     be set to “Pending”

    [Tags]  BF-TECH-FLEET-VIEW-01     auto
    ${expected_attribute}   Create List    RMA ID       Status      Facility     Outbound Devices     Inbound Devices     Request Date      Returned Date
    ${expected_status}      Create List    All statuses     Pending      Approved      Completed     Canceled
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    ${current_filter}        Get Fleet Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[RMA Type]     RMA Request
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[RMA State]    All statuses       # Pending by default
    Run Keyword And Continue On Failure    Should Be Equal    ${current_filter}[Search By]    by RMA ID
    Run Keyword And Continue On Failure    Should Be Empty    ${current_filter}[Text Search]
    Filter Fleet Rma Request      by_status=All statuses
    ${rma_requests}     Get All Fleet Rma
    Run Keyword And Continue On Failure    Should Not Be Empty    ${rma_requests}       No RMA Request found
    ${actual_attribute}     Evaluate       [k for k, v in ${rma_requests}[0].items()]
    ${request_date}         Evaluate       [date['Request Date'] for date in ${rma_requests}]
    ${expect_request_date}  Sort Asc And Desc Data    asc_or_desc=descending     data=${request_date}     # default reqest date is desc
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${request_date}             ${expect_request_date}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_attribute}       ${actual_attribute}
    ${status_options}       Get Fleet Rma Request Status Options
    Run Keyword And Continue On Failure    Should Not Be Empty    ${status_options}     No status options found
    Run Keyword And Continue On Failure    Lists Should Be Equal  ${expected_status}    ${status_options}

BF-TECH-FLEET-VIEW-02: View details of a Pending RMA
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the detail of a pending RMA ticket in the RMA list
    ...
    ...     Precondition: The user is on the RMA tab of Fleet page
    ...
    ...     Test Steps:
    ...     1. Observe the Header of a pending RMA screen
    ...     2. Observe the RMA information
    ...
    ...     Expected Results:
    ...     1. At step 1, there is the RMA ID, the Facility name
    ...     2. At step 2, RMA information include the following informaion below:
    ...     - RMA Device information:
    ...      + Device ID
    ...      + Replacement Device ID
    ...      + Reason for RMA
    ...      + Patient impact
    ...      + Date of event
    ...     - Other Information:
    ...      + Notification email
    ...      + Notes: The user is only allowed to view the most recent data that was entered when the request status is still pending
    ...     - Shipping information:
    ...      + Shipping address: Country, City, Address, State, Zipcode, Contact phone number, Contact email
    ...     - Returning address:
    ...      + Same as shipping address toggle
    ...      + Country
    ...      + Address
    ...      + City
    ...      + State
    ...      + Zipcode
    ...      + Contact phone number
    ...      + Contact email

    [Tags]  BF-TECH-FLEET-VIEW-02        auto
    Navigate To Fleet
    Filter Fleet Rma Request    by_status=Pending
    ${rma_requests}         Get Fleet Rma Request List Item
    Run Keyword And Continue On Failure    Should Not Be Empty    ${rma_requests}       No pending rma requests found
    View Rma Request Details On    row=1
    ${header}       Get Page Header Rma Detail
    ${overview_info}        Get Rma Details Overview
    Run Keyword And Continue On Failure    Should Be Equal    ${header}     RMA
    Run Keyword And Continue On Failure    Should Be Equal    ${overview_info}[RMA ID]      ${rma_requests}[0][RMA ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${overview_info}[Facility]    ${rma_requests}[0][Facility]
    # RMA Device information
    ${rma_device_info}      Get Pending Rma Details Device Info
    Run Keyword And Continue On Failure    Should Not Be Empty    ${rma_device_info}        No rma devices found
    ${expected_headers}     Create List    Device ID     Replacement device ID      Reason for RMA     Patient impact       Date of event
    ${actual_headers}       Evaluate       [k for k, v in ${rma_device_info}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List    ${actual_headers}        ${expected_headers}
    # Other Information
    ${other_info}        Get Pending Rma Other Info
    ${expected_other_info_headers}        Create List    Notification email       Notes
    ${actual_other_info_headers}          Evaluate    [k for k, v in ${other_info}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_other_info_headers}      ${actual_other_info_headers}
    # Shipping address
    ${shipping_addr}        Get Pending Rma Request Shipping Address
    ${expected_shipaddr_headers}        Create List    Country      Address     City      State     Zip code      Contact phone number      Contact Email
    ${actual_shipaddr_headers}          Evaluate    [k for k, v in ${shipping_addr}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_shipaddr_headers}      ${actual_shipaddr_headers}
    # Returning address
    ${returning_addr}       Get Pending Rma Request Returning Address
    ${expected_returning_headers}        Create List    Country      Address     City      State     Zip code      Contact phone number      Contact Email
    ${actual_returning_headers}          Evaluate    [k for k, v in ${returning_addr}.items()]
    Run Keyword And Continue On Failure    Should Be Equal    ${expected_returning_headers}      ${actual_returning_headers}

BF-TECH-FLEET-VIEW-03: View details of a Approved RMA
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the detail of a Approved RMA ticket in the RMA list
    ...
    ...     Precondition: The user is on the RMA tab of Fleet page
    ...
    ...     Test Steps:
    ...     2. Observe the header of the ticket
    ...     1. Click the Outbound tab of the Approved RMA screen
    ...     2. Click the Inbound tab of the Approved RMA screen
    ...
    ...     Expected Results:
    ...     1. At step 1, In the header, there is a RMA ID, the Facility name and the status of the ticket is Approved
    ...     2. At step 2, Outbound tab shall display the following information:
    ...     - RMA Device information:
    ...      + Device ID. If the device belongs to the shipment order, a serial label shall display.
    ...      + Device model: could be Bioflux or Biocore/Biotres
    ...      + Replacement Device ID
    ...      + Reason for RMA
    ...      + Patient impact
    ...      + Date of event
    ...      + Shipping status:
    ...       . Delivered: when the devices are marked received by Support Staff
    ...       . Pending: when the RMA ticket was approved and the devices are on the way to ship
    ...     - Other Information:
    ...      + Notification email
    ...      + Notes - The user is only allowed to view the most recent data that was entered when the request status is still pending
    ...     - Shipping information:
    ...      + Shipping address: Country, City, Address, State, Zipcode, Contact phone number, Contact email
    ...     - Returning address:
    ...      + Same as shipping address toggle
    ...      + Country
    ...      + Address
    ...      + City
    ...      + State
    ...      + Zipcode
    ...      + Contact phone number
    ...      + Contact email
    ...     - Tracking information
#   Break to new case
#    ...      + Tracking number - a hyperlink. When clicked on it shall navigate the user to the Order-Shipping on Shippo site
#    ...      + Shipped date
#    ...      + Estimated arrival
#    ...      + Label - a hyperlink. The user can download the label of the shipping
#    ...      + Carrier - total rates
#    ...      + Device (number of devices)
#    ...      + A list of devices
#    ...      + Timeline: date and status of shipping
#    ...      + After 120 days from the date of order creation, the timeline will no longer be visible
    ...     3. At step 3, Inbound tab shall display the following information:
    ...      - RMA Device information:
    ...      + Device ID. If the device belongs to the shipment order, a serial label shall display
    ...      + Device model: could be Bioflux or Biocore/Biotres
    ...      + Purpose
    ...      + RMA Resolution
    ...      + Returning status:
    ...       . Pending: when the devices are shipping
    ...       . Delivered: when the Support user marks completed
    ...     - Other Information:
    ...      + Notification email
    ...      + Notes - The user is only allowed to view the most recent data that was entered when the request status is still pending
    ...     - Shipping information:
    ...      + Shipping address: Country, City, Address, State, Zipcode, Contact phone number, Contact email
    ...     - Returning address:
    ...      + Country
    ...      + Address
    ...      + City
    ...      + State
    ...      + Zipcode
    ...      + Contact phone number
    ...      + Contact email
    ...     - Tracking information: If the Support user has created the shipping order, Label information shall be displayed
    ...     with the following information:
#   Break to new case
#    ...      + Tracking number - a hyperlink. When clicked on it shall navigate the user to the Order-Shipping on Shippo site
#    ...      + Shipped date
#    ...      + Estimated arrival
#    ...      + Label - a hyperlink. The user can download the label of the shipping
#    ...      + Carrier - total rates
#    ...      + Device (number of devices)
#    ...      + A list of devices
#    ...      + Timeline: date and status of shipping
#    ...      + After 120 days from the date of order creation, the timeline will no longer be visible

    [Tags]  BF-TECH-FLEET-VIEW-03       auto
    [Template]    Check RMA Request Details
    Approved

BF-TECH-FLEET-VIEW-04: View details of a Completed RMA
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the detail of a Completed RMA ticket in the RMA list
    ...
    ...     Precondition: The user is on the RMA tab of Fleet page
    ...
    ...     Test Steps:
    ...     2. Observe the header of the ticket
    ...     1. Click the Outbound tab of the Approved RMA screen
    ...     2. Click the Inbound tab of the Approved RMA screen
    ...
    ...     Expected Results:
    ...     1. At step 1, In the header, there is a RMA ID, the Facility name and the status of the ticket is Completed
    ...     2. At step 2, Outbound tab shall display the following information:
    ...     - RMA Device information:
    ...      + Device ID. If the device belongs to the shipment order, a serial label shall display.
    ...      + Device model: could be Biocore/Biotres
    ...      + Replacement Device ID
    ...      + Reason for RMA
    ...      + Patient impact
    ...      + Date of event
    ...      + Shipping status:
    ...       . Delivered: when the devices are marked received by Support Staff
    ...       . Pending: when the RMA ticket was approved and the devices are on the way to ship
    ...     - Other Information:
    ...      + Notification email
    ...      + Notes - The user is only allowed to view the most recent data that was entered when the request status is still pending
    ...     - Shipping information:
    ...      + Shipping address: Country, City, Address, State, Zipcode, Contact phone number, Contact email
    ...     - Returning address:
    ...      + Same as shipping address toggle
    ...      + Country
    ...      + Address
    ...      + City
    ...      + State
    ...      + Zipcode
    ...      + Contact phone number
    ...      + Contact email
    ...     - Tracking information
#   Break to new case
#    ...      + Tracking number - a hyperlink. When clicked on it shall navigate the user to the Order-Shipping on Shippo site
#    ...      + Shipped date
#    ...      + Estimated arrival
#    ...      + Label - a hyperlink. The user can download the label of the shipping
#    ...      + Carrier - total rates
#    ...      + Device (number of devices)
#    ...      + A list of devices
#    ...      + Timeline: date and status of shipping
#    ...      + After 120 days from the date of order creation, the timeline will no longer be visible
    ...     3. At step 3, Inbound tab shall display the following information:
    ...      - RMA Device information:
    ...      + Device ID. If the device belongs to the shipment order, a serial label shall display
    ...      + Device model: could be Biocore/Biotres
    ...      + Purpose
    ...      + RMA Resolution
    ...      + Returning status:
    ...       . Pending: when the devices are shipping
    ...       . Delivered: when the Support user marks completed
    ...     - Other Information:
    ...      + Notification email
    ...      + Notes - The user is only allowed to view the most recent data that was entered when the request status is still pending
    ...     - Shipping information:
    ...      + Shipping address: Country, City, Address, State, Zipcode, Contact phone number, Contact email
    ...     - Returning address:
    ...      + Country
    ...      + Address
    ...      + City
    ...      + State
    ...      + Zipcode
    ...      + Contact phone number
    ...      + Contact email
    ...     - Tracking information: If the Support user has created the shipping order, Label information shall be displayed
    ...     with the following information:
#   Break to new case
#    ...      + Tracking number - a hyperlink. When clicked on it shall navigate the user to the Order-Shipping on Shippo site
#    ...      + Shipped date
#    ...      + Estimated arrival
#    ...      + Label - a hyperlink. The user can download the label of the shipping
#    ...      + Carrier - total rates
#    ...      + Device (number of devices)
#    ...      + A list of devices
#    ...      + Timeline: date and status of shipping
#    ...      + After 120 days from the date of order creation, the timeline will no longer be visible

    [Tags]  BF-TECH-FLEET-VIEW-04        auto
    [Template]    Check RMA Request Details
    Completed

BF-TECH-FLEET-VIEW-05: View details of a Canceled RMA
    [Documentation]     Author: Trinh Nguyen
    ...
   ...     Description: The user can view the detail of a Canceled RMA ticket in the RMA list
    ...
    ...     Precondition: The user is on the RMA tab of Fleet page
    ...
    ...     Test Steps:
    ...     2. Observe the header of the ticket
    ...     1. Click the Outbound tab of the Approved RMA screen
    ...     2. Click the Inbound tab of the Approved RMA screen
    ...
    ...     Expected Results:
    ...     1. At step 1, In the header, there is a RMA ID, the Facility name and the status of the ticket is Canceled
    ...     2. At step 2, Outbound tab shall display the following information:
    ...     - RMA Device information:
    ...      + Device ID. If the device belongs to the shipment order, a serial label shall display.
    ...      + Device model: could be Biocore/Biotres
    ...      + Replacement Device ID
    ...      + Reason for RMA
    ...      + Patient impact
    ...      + Date of event
    ...      + Shipping status:
    ...       . Delivered: when the devices are marked received by Support Staff
    ...       . Pending: when the RMA ticket was approved and the devices are on the way to ship
    ...     - Other Information:
    ...      + Notification email
    ...      + Notes - The user is only allowed to view the most recent data that was entered when the request status is still pending
    ...     - Shipping information:
    ...      + Shipping address: Country, City, Address, State, Zipcode, Contact phone number, Contact email
    ...     - Returning address:
    ...      + Same as shipping address toggle
    ...      + Country
    ...      + Address
    ...      + City
    ...      + State
    ...      + Zipcode
    ...      + Contact phone number
    ...      + Contact email
    ...     - Tracking information
#   Break to new case
#    ...      + Tracking number - a hyperlink. When clicked on it shall navigate the user to the Order-Shipping on Shippo site
#    ...      + Shipped date
#    ...      + Estimated arrival
#    ...      + Label - a hyperlink. The user can download the label of the shipping
#    ...      + Carrier - total rates
#    ...      + Device (number of devices)
#    ...      + A list of devices
#    ...      + Timeline: date and status of shipping
#    ...      + After 120 days from the date of order creation, the timeline will no longer be visible
    ...     3. At step 3, Inbound tab shall display the following information:
    ...      - RMA Device information:
    ...      + Device ID. If the device belongs to the shipment order, a serial label shall display
    ...      + Device model: could be Biocore/Biotres
    ...      + Purpose
    ...      + RMA Resolution
    ...      + Returning status:
    ...       . Pending: when the devices are shipping
    ...       . Delivered: when the Support user marks completed
    ...     - Other Information:
    ...      + Notification email
    ...      + Notes - The user is only allowed to view the most recent data that was entered when the request status is still pending
    ...     - Shipping information:
    ...      + Shipping address: Country, City, Address, State, Zipcode, Contact phone number, Contact email
    ...     - Returning address:
    ...      + Country
    ...      + Address
    ...      + City
    ...      + State
    ...      + Zipcode
    ...      + Contact phone number
    ...      + Contact email
    ...     - Tracking information: If the Support user has created the shipping order, Label information shall be displayed
    ...     with the following information:
#   Break to new case
#    ...      + Tracking number - a hyperlink. When clicked on it shall navigate the user to the Order-Shipping on Shippo site
#    ...      + Shipped date
#    ...      + Estimated arrival
#    ...      + Label - a hyperlink. The user can download the label of the shipping
#    ...      + Carrier - total rates
#    ...      + Device (number of devices)
#    ...      + A list of devices
#    ...      + Timeline: date and status of shipping
#    ...      + After 120 days from the date of order creation, the timeline will no longer be visible

    [Tags]  BF-TECH-FLEET-VIEW-05   auto
    [Template]    Check RMA Request Details
    Canceled

BF-TECH-FLEET-RMA-EDIT-01: Edit device ID of a pending RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details
    ...
    ...     Test Steps:
    ...     1. Edit Device ID and save the changes
    ...
    ...     Expected Results:
    ...     1. The new changes are saved

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-01       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-02: Add replacement device ID of a pending RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details that has no replacement device ID
    ...
    ...     Test Steps:
    ...     1. Select a replacement device ID and save the changes
    ...
    ...     Expected Results:
    ...     1. The new changes are saved and the ticket is auto-changed to Approved status

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-03: Edit Reason for RMA of a pending RMA ticket (Bioflux)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details of Bioflux device
    ...
    ...     Test Steps:
    ...     1. Click "Reason for RMA" dropdown list
    ...     2. Edit Reason for RMA and save the changes
    ...
    ...     Expected Results:
    ...     1. The drop-down list is divided into two separate sections: Device issues and Other reasons
    ...     i. Device issues (select all that apply), including:
    ...         - 1.	Charging Issue
    ...         - 2.	Device Errors (describe)
    ...         - 3.	ECG Issue
    ...         - 4.	No Cell Connection
    ...         - 5.	Screen Issue
    ...         - 6.	Broken Charger
    ...         - 7.	Courtesy RMA
    ...         - 8.	Other (describe)
    ...     ii.	Other reasons (select one, cannot combine with device issues), including:
    ...         - 1.	Return to Stock
    ...         - 2.	Lost Device
    ...         - 3.	Closed Account
    ...     2. The new changes are saved

    ...     **Others**
    ...     - Updated date: 12/08/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-03       manual       R1      CP-2.18.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-04: Edit Reason for RMA of a pending RMA ticket (Biocore/Biotres)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details of Biocore/Biotres device
    ...
    ...     Test Steps:
    ...     1. Click "Reason for RMA" dropdown list
    ...     2. Edit Reason for RMA and save the changes
    ...
    ...     Expected Results:
    ...     1. The drop-down list is divided into two separate sections: Device issues and Other reasons
    ...     i. Device issues (select all that apply), including:
    ...         - 1.	Charging Issue
    ...         - 2.	Device Errors (describe)
    ...         - 3.	Device Dead on Arrival
    ...         - 4.	Connection Issue
    ...         - 5.	ECG Leads
    ...         - 6.	Damaged (describe)
    ...         - 7.	Courtesy RMA
    ...         - 8.	Other (describe)

    ...     ii.	Other reasons (select one, cannot combine with device issues), including:
    ...         - 1.	Return to Stock
    ...         - 2.	Lost Device
    ...         - 3.	Closed Account
    ...     2. The new changes are saved

    ...     **Others**
    ...     - Updated date: 12/08/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-04       manual       R1      CP-2.18.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-04-CP2.18.0: Edit Reason for RMA of a pending RMA ticket (Biocore/Biotres Pro)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details of Biocore/Biotres device
    ...
    ...     Test Steps:
    ...     1. Click "Reason for RMA" dropdown list
    ...     2. Edit Reason for RMA and save the changes
    ...
    ...     Expected Results:
    ...     1. The drop-down list is divided into two separate sections: Device issues and Other reasons
    ...     i. Device issues (select all that apply), including:
    ...         - 1.	Charging Issue
    ...         - 2.	Device Errors (describe)
    ...         - 3.	ECG Issue
    ...         - 4.	No Cell Connection
    ...         - 5.	Broken Charger
    ...         - 6.	Damaged (describe)
    ...         - 7.	Courtesy RMA
    ...         - 8.	Other (describe)

    ...     ii.	Other reasons (select one, cannot combine with device issues), including:
    ...         - 1.	Return to Stock
    ...         - 2.	Lost Device
    ...         - 3.	Closed Account
    ...     2. The new changes are saved

    ...     **Others**
    ...     - Updated date: 12/08/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-04-CP2.18.0       manual       R1      CP-2.18.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-05: Edit Paient impact of a pending RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details
    ...
    ...     Test Steps:
    ...     1. Edit Patient impact and save the changes
    ...
    ...     Expected Results:
    ...     1. The new changes are saved

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-06: Edit Date of Event of a pending RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details
    ...
    ...     Test Steps:
    ...     1. Edit Date of Event and save the changes
    ...
    ...     Expected Results:
    ...     1. The new changes are saved

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-06       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-07: Remove device from a pending RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details
    ...
    ...     Test Steps:
    ...     1. Click "Delete" row and save the changes
    ...
    ...     Expected Results:
    ...     1. The new changes are saved

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-07       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-08: Edit pending RMA ticket with reason "Return for Maintenance"
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details of a ticket with reason "Return for Maintenance"
    ...
    ...     Test Steps:
    ...     1. Edit Date of Event and save the changes
    ...
    ...     Expected Results:
    ...     1. The new changes are saved, all other fields are disabled

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-08       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-09: Edit pending RMA ticket with reason "Protect+ program"
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details of a ticket with reason "Protect+ program"
    ...
    ...     Test Steps:
    ...     1. Edit Date of Event and save the changes
    ...
    ...     Expected Results:
    ...     1. The new changes are saved, all other fields are disabled

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-09       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-EDIT-10: Cancel a pending RMA ticket
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - The user is on a pending RMA ticket details
    ...
    ...     Test Steps:
    ...     1. Click "Cancel Request" button
    ...
    ...     Expected Results:
    ...     1. The ticket's status shall be Canceled

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-EDIT-10       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-PAGINATION-01: Check pagination tool works properly in RMA Request tab
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The RMA’s table is divided into pages
    ...
    ...     Precondition: The user is on RMA Request tab of the Fleet page
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

    [Tags]     BF-TECH-FLEET-PAGINATION-01    auto      R1
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    Filter Fleet Rma Request        by_status=All statuses
    ${size_per_options}     Get Rma Size Per Page Options
    ${expected_options}     Create List    10 per page    30 per page    50 per page
    Run Keyword And Continue On Failure    Should Not Be Empty      ${size_per_options}     No option displayed
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${size_per_options}     ${expected_options}
    ${rma_requests}      Get Fleet Rma Request List Item
    Run Keyword And Continue On Failure    Should Not Be Empty    ${rma_requests}      No RMS Request found
    ${current_pagination}       Get Rma Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       10 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
    Run Keyword And Continue On Failure    Length Should Be   ${rma_requests}                   10
    Pagination Rma    next_or_previous=next         is_wait=${false}
    ${current_pagination}     Get Rma Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       2
    Pagination Rma    next_or_previous=previous     is_wait=${false}
    ${current_pagination}     Get Rma Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
    Custom Rma Size Per Page    by_size=30 per page
    ${current_pagination}     Get Rma Current Pagination
    ${rma_requests}      Get Fleet Rma Request List Item
    Run Keyword And Continue On Failure    Should Not Be Empty    ${rma_requests}      No RMS Request found
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       30 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1
    Custom Rma Size Per Page    by_size=50 per page
    ${current_pagination}     Get Rma Current Pagination
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Rows]       50 per page
    Run Keyword And Continue On Failure    Should Be Equal    ${current_pagination}[Page]       1

BF-TECH-FLEET-FILTER-FACILITY-01: View the name of the facility in case the user only associates with one facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can view the name of the facility in case the user only
    ...     associates with one facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...
    ...     Test Steps:
    ...     1. Click the RMA Request tab of the Fleet page
    ...     2. Observe the header of Fleet page
    ...
    ...     Expected Results:
    ...     1. The facility name is displayed on the header of the Fleet page
    ...     2. All the data associated with that facility shall be displayed

    [Tags]  BF-TECH-FLEET-FILTER-FACILITY-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-FILTER-FACILITY-02: Select a specific facility in case the user associates with multiples facility
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can select a specific facility
    ...
    ...     Precondition:
    ...     - The user has logged in to Clinic Portal
    ...     - The Admin portal has associated the account with multiples facilities
    ...     Test Steps:
    ...     1. Click the RMA Request tab of the FLEET page
    ...     2. Click on the drop-down list on the header of the Fleet page
    ...     3. Select the specific facility
    ...
    ...     Expected Results:
    ...     1. All facilities option is selected as default and reflected across the Fleet page
    ...     2. After the user has selected the desired facility, all the data associated with that
    ...     facility shall be reflected accordingly

    [Tags]  BF-TECH-FLEET-FILTER-FACILITY-02        auto
    Navigate To Fleet
    Navigate To Fleet Tab   RMA Request
    ${current_facility}     Get Fleet Current Filter Values
    Run Keyword And Continue On Failure      Should Be Equal      ${current_facility}[Facility]       All facilities
    ${requests}        Get Fleet Rma Request Items
    ${header}          Evaluate    [k for k, v in ${requests}[0].items()]
    Run Keyword And Continue On Failure    List Should Contain Value    ${header}       Facility
    Select Facility    ${FACILITIES}[0][name]
    ${requests}        Get Fleet Rma Request Items
    ${header}          Evaluate    [k for k, v in ${requests}[0].items()]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}       No requests found - with Facility `${FACILITIES}[0][name]`
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${header}       Facility
    Select Facility    ${FACILITIES}[1][name]
    ${requests}        Get Fleet Rma Request Items
    ${header}          Evaluate    [k for k, v in ${requests}[0].items()]
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}       No requests found - with Facility `${FACILITIES}[1][name]`
    Run Keyword And Continue On Failure    List Should Not Contain Value    ${header}       Facility
    [Teardown]    Select Facility    All facilities

BF-TECH-FLEET-RMA-FILTER-03: Filter RMA list by RMA status (All/Pending/Approved/Completed/Canceled)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-FILTER-03        auto       R1
    [Template]      Filter All Fleet
    Pending
    Canceled
    Completed
    Approved

BF-TECH-FLEET-SEARCH-01: Search RMA list by RMA ID
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can globally search for ticket on the RMA Request list via a search bar and the
    ...     search field on the header of the Fleet page
    ...
    ...     Precondition: The user is on the Fleet page
    ...
    ...     Test Steps:
    ...     1. Observe the search bar
    ...     2. Enter a value of RMA ID
    ...     3. Switch to tabs on the page and observe
    ...
    ...     Expected Results:
    ...     1. In step 1:
    ...     -   By default, the search field shall have a string saying "Search by RMA ID"
    ...     2. In step 2:
    ...     -   The system shall filter and display the search result accordingly with the search value
    ...     3. In step 3:
    ...     -   The search value and its result shall be applied until it is cleared out

    [Tags]      BF-TECH-FLEET-SEARCH-01       auto
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    ${current_values}        Get Fleet Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Search By]      by RMA ID
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[RMA State]      Pending
    ${requests}     Get Fleet Rma Request List Item
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}       No pending requests found
    ${text}         Set Variable    ${requests}[0][RMA ID]
    Filter Fleet Rma Request    text_search=${text}
    ${requests}     Get Fleet Rma Request List Item
    Run Keyword And Continue On Failure    Should Not Be Empty    ${requests}                   No pending requests found - with text search `${text}`
    Run Keyword And Continue On Failure    Length Should Be       ${requests}                   1
    Run Keyword And Continue On Failure    Should Be Equal        ${requests}[0][RMA ID]        ${text}
    # Switch tab
    Navigate To Fleet Tab    Maintenance
    # Switch to back
    Navigate To Fleet Tab    RMA Request
    ${current_values}        Get Fleet Current Filter Values
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Search By]      by RMA ID
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[RMA State]      Pending
    Run Keyword And Continue On Failure    Should Be Equal    ${current_values}[Text Search]    ${text}
    Clear Fleet Text Search
    ${current_values}        Get Fleet Current Filter Values
    Run Keyword And Continue On Failure    Should Be Empty    ${current_values}[Text Search]

BF-TECH-FLEET-RMA-SEARCH-02: Search RMA list by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    ...     **Others**
    ...     - Updated date: 12/06/2023 - Nhan Nguyen

    [Tags]  BF-TECH-FLEET-RMA-SEARCH-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-SORT-01: Sort the RMA ticket by RMA ID
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on the RMA Request tab of the Fleet page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the RMA ID
    ...     2. Click the [Sort] button next to the RMA ID again
    ...
    ...     Expected Results:
    ...     1. The RMA ticket list shall sort in descending order
    ...     2. The RMA ticket list list shall sort in ascending order

    [Tags]  BF-TECH-FLEET-SORT-01       auto
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    Filter Fleet Rma Request    by_status=All statuses
    Sort Fleet Rma Request Unactive      asc_or_desc=ascending
    ${requests}         Get All Fleet Rma
    ${actual_rma_ids}   Evaluate    [item['RMA ID'] for item in ${requests}]
    ${expected_asc}     Evaluate    sorted(${actual_rma_ids}, key=int)
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_rma_ids}       ${expected_asc}
    ${expected_desc}    Evaluate    sorted(${actual_rma_ids}, key=int, reverse=True)
    Sort Fleet Rma Request Unactive     asc_or_desc=descending
    ${requests}         Get All Fleet Rma
    ${actual_rma_ids}   Evaluate    [item['RMA ID'] for item in ${requests}]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_desc}       ${actual_rma_ids}

BF-TECH-FLEET-SORT-02: Sort the RMA ticket by Request Date
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on the RMA Request tab of the Fleet page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Request Date
    ...     2. Click the [Sort] button next to the Request Date again
    ...
    ...     Expected Results:
    ...     1. The RMA ticket list shall sort in descending order
    ...     2. The RMA ticket list list shall sort in ascending order

    [Tags]  BF-TECH-FLEET-SORT-02     auto
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    Filter Fleet Rma Request    by_status=All statuses
    Sort Fleet Rma Request Active           asc_or_desc=ascending
    ${requests}         Get All Fleet Rma
    ${request_date}     Evaluate       [date['Request Date'] for date in ${requests}]
    ${expected_asc}     Sort Asc And Desc Data    asc_or_desc=ascending     data=${request_date}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_asc}        ${request_date}
    Sort Fleet Rma Request Active           asc_or_desc=descending
    ${requests}         Get All Fleet Rma
    ${request_date}     Evaluate       [date['Request Date'] for date in ${requests}]
    ${expected_desc}    Sort Asc And Desc Data    asc_or_desc=descending     data=${request_date}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_desc}       ${request_date}
    # Just verified on current page

BF-TECH-FLEET-SORT-03: Sort the RMA ticket by Returned Date
    [Documentation]     Author: Trinh Nguyen
    ...
    ...     Description: The user can sort the list manually
    ...
    ...     Precondition: The user is on the RMA Request tab of the Fleet page
    ...
    ...     Test Steps:
    ...     1. Click the [Sort] button next to the Returned Date
    ...     2. Click the [Sort] button next to the Returned Date again
    ...
    ...     Expected Results:
    ...     1. The RMA ticket list shall sort in descending order
    ...     2. The RMA ticket list list shall sort in ascending order

    [Tags]  BF-TECH-FLEET-SORT-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    # Data
#    Navigate To Fleet
#    Navigate To Fleet Tab    RMA
#    Filter Fleet Rma Request    by_status=Completed
#    Sort Fleet Rma Request    field=Returned Date      asc_or_desc=asc
#    ${requests}         Get Fleet Rma Request Items
#    ${actual_rma_ids}   Evaluate    [item['Returned Date'].replace('/', '') for item in ${requests}]
#    ${expected_asc}     Evaluate    sorted(${actual_rma_ids}, key=int)
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_rma_ids}       ${expected_asc}
#    Sort Fleet Rma Request    field=Returned Date     asc_or_desc=desc
#    ${requests}         Get Fleet Rma Request Items
#    ${actual_rma_ids}   Evaluate    [item['Returned Date'].replace('/', '') for item in ${requests}]
#    ${expected_desc}    Evaluate    sorted(${actual_rma_ids}, key=int, reverse=True)
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_desc}       ${actual_rma_ids}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-01: Notification Sent to Clinic Notification Center After Service Staff Presses “Request Device Return”
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-01        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-02: Email Sent to All Notification Emails Listed in the RMA Ticket After Service Staff Presses “Request Device Return”
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-02        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-03: Icon Displayed Next to RMA Ticket ID in Clinic Portal When S&D Requests Clinic to Initiate a Shipping Label
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-03        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-04: Icon Disappears After a Shipping Label is Created for the RMA Ticket
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-04        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-05: Count and Display Pending Shipping Labels on RMA Request Tab
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-05        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-06: Dot on the Fleet Page Appears When There Are Pending RMA Labels
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-06        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-07: Dot on the Fleet Page Disappears When All Shipping Labels Are Created
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-07        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-08: Number on the RMA Request Tab Updates After Creating a Shipping Label
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-08        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-09: Display Instructional Message for Shipping Label Creation on Approved RMA Ticket
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-09        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-10: Instructional Message Disappears When RMA Ticket is Completed
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-10        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-11: Clicking the "Create Shipping Label" button navigates the user to the shipping label creation process
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-11        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-12:Package_Default Package Selection "Custom Dimensions"
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-12        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-13:Shipping rate_Auto get the cheapest one and show for the user when they check shipping rate
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-13        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-14:Sender_Pre-filled with facility information and can edit
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-14        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-15:Receiver_Pre-filled with BTCY information (Cannot edit)
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-15        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-16:Receiver_Pre-filled with BTCY information (Cannot edit)
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-16        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-17:Multiple Shipping Labels Creation for Approved RMA Ticket
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-17        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-18: No notification sent to the notification center of clinic when the clinic creates a shipment
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RMA-CREATE-SHIPPING-LABEL-18        manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-VIEW-01: View list of Maintenance devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-VIEW-01       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-VIEW-02: Device Listed in Maintenance Tab Based on Artifact Percentage Condition
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-VIEW-02       manual    CP-2.25.3       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-VIEW-03: Device Listed in Maintenance Tab Based on Battery Quality Condition
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-VIEW-03       manual    CP-2.25.3       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-VIEW-04: Device Removed from Maintenance Tab When RMA Is Requested
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-VIEW-04       manual    CP-2.25.3       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-VIEW-05: Device is automatically added back to the Maintenance tab if a previously requested RMA is canceled
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-VIEW-05       manual    CP-2.25.3       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-VIEW-06: Reset Maintenance Conditions When Device Is Transferred to Another Facility
    [Documentation]     Author: Tam Ho
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-VIEW-06       manual    CP-2.25.3       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-FILTER-01: Filter Maintenance list by facility in case the user only associates with multiple facilities
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-FILTER-01        manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-SEARCH-01: Search Maintenance devices by Device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-SEARCH-01       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-PAGINATION-01: Check pagination tool works properly in Maintenance tab
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition: The user is on Maintenance tab of the Fleet page
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

    [Tags]     BF-TECH-FLEET-MAINTENANCE-PAGINATION-01   manual      R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-REQUEST-01: Facility has not subscibed Protect+ program-Iinitiate an RMA request with reason "Return for Maintenance" for a device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-REQUEST-01       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-REQUEST-02: Facility has subscibed Protect+ program-Iinitiate an RMA request with reason "Protect+ Program" for a device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-REQUEST-02       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-REQUEST-03: Facility has not subscibed Protect+ program-Iinitiate an RMA request with reason "Return for Maintenance" for multiple devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-REQUEST-03       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-REQUEST-04: Facility has subscibed Protect+ program-Iinitiate an RMA request with reason "Protect+ Program" for multiple devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-REQUEST-04       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-REQUEST-05: Cannot iinitiate an RMA request with reason "Return for Maintenance" for multiple devices exceeded max RMA devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-MAINTENANCE-REQUEST-05       manual       R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-MAINTENANCE-REQUEST-06: Cannot initiate an RMA request with reason "Protect+ Program" for multiple devices exceeded max RMA devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...
    [Tags]      BF-TECH-FLEET-MAINTENANCE-REQUEST-06       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#    Navigate To Fleet
#    Navigate To Fleet Tab    RMA
#    Filter Fleet Rma Request    by_status=Completed
#    Sort Fleet Rma Request    field=Returned Date      asc_or_desc=asc
#    ${requests}         Get Fleet Rma Request Items
#    ${actual_rma_ids}   Evaluate    [item['Returned Date'].replace('/', '') for item in ${requests}]
#    ${expected_asc}     Evaluate    sorted(${actual_rma_ids}, key=int)
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_rma_ids}       ${expected_asc}
#    Sort Fleet Rma Request    field=Returned Date     asc_or_desc=desc
#    ${requests}         Get Fleet Rma Request Items
#    ${actual_rma_ids}   Evaluate    [item['Returned Date'].replace('/', '') for item in ${requests}]
#    ${expected_desc}    Evaluate    sorted(${actual_rma_ids}, key=int, reverse=True)
#    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_desc}       ${actual_rma_ids}

BF-TECH-FLEET-RETURN-01-CP2.16.8: Active Facility-View list of Waiting for Return
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...     Display the following fields:
    ...     - Device ID
    ...     - Tracking number
    ...     - Study ID
    ...     - Patient name
    ...     - Study stop date
    ...     - Facility
    ...

    [Tags]  BF-TECH-FLEET-RETURN-01-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RETURN-02-CP2.16.8: Mark as returned for a device
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-02-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RETURN-03-CP2.16.8: Mark as returned for multiple devices
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-03-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RETURN-04-CP2.16.8: Search for device by device ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-04-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RETURN-05-CP2.16.8: Search for device by Study ID
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-05-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RETURN-06-CP2.16.8: Sort the list by Study stop date
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-06-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
    
BF-TECH-FLEET-RETURN-07-CP2.16.8: Check pagination tool
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-07-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RETURN-08-CP2.16.8: Waiting for Return tab is hidden for Test Facility
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-08-CP2.16.8       manual       R1      CP-2.16.8
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BF-TECH-FLEET-RETURN-08-CP2.21.0: Return date time displayed same as Delivered time from Shippo info (if any)
    [Documentation]     Author: Nhan Nguyen
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...
    ...
    ...     Expected Results:
    ...

    [Tags]  BF-TECH-FLEET-RETURN-08-CP2.21.0       manual       R1      CP-2.21.0
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}       Start Browser
    Import Library        project_bioflux_clinic_portal/lib/web/Fleet.py        ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Common.py       ${BROWSER_NODE}  ${ENV}
    Import Library        project_bioflux_clinic_portal/lib/web/Devices.py      ${BROWSER_NODE}  ${ENV}
    ${TECH_USER}          Get Config Param       NEW_USER > clinic_technician
    ${FACILITIES}         Get Config Param       FACILITY
    ${DEVICE}             Get Config Param       STUDY_ID > device_id_rma
    Set Suite Variable    ${FACILITIES}
    Set Suite Variable    ${TECH_USER}
    Set Suite Variable    ${DEVICE}
    ${TOKEN}              Sign In Bioflux       username=${TECH_USER}[0][username]       password=${TECH_USER}[0][password]
    ${VERSION}            Get Release Version
    Set Suite Metadata    version     ${VERSION}
    Set Suite Metadata    browser     ${BROWSER.capitalize()}
    Set Suite Metadata    browser     ${TOKEN}

SUITE TEARDOWN
    Quit Browser

Filter All Fleet
    [Arguments]       ${status}=${EMPTY}     ${search_by}=${EMPTY}
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    Filter Fleet Rma Request    by_status=${status}
    ${reports}       Get Fleet Rma Request Items
    Run Keyword And Continue On Failure    Should Not Be Empty    ${reports}     No reports found
    Run Keyword If    '${status}' != '${EMPTY}' and '${status.lower()}' != 'all statuses'
    ...  Run Keyword And Continue On Failure    Should Be True    all('${status}' == r['Status'] for r in ${reports})       Invalid results are showing - with priority `${status}`

Check RMA Request Details  # Check rma details without pending
    [Arguments]    ${rma_status}
    Navigate To Fleet
    Filter Fleet Rma Request    by_status=${rma_status}
    ${rma_requests}         Get Fleet Rma Request List Item
    Run Keyword And Continue On Failure    Should Not Be Empty    ${rma_requests}       No pending rma requests found
    View Rma Request Details On    row=1
    ${header}       Get Page Header Rma Detail
    ${overview_info}        Get Rma Details Overview
    Run Keyword And Continue On Failure    Should Be Equal    ${header}       RMA
    Run Keyword And Continue On Failure    Should Be Equal    ${overview_info}[RMA ID]      ${rma_requests}[0][RMA ID]
    Run Keyword And Continue On Failure    Should Be Equal    ${overview_info}[Facility]    ${rma_requests}[0][Facility]
    # Outbound
    ${details}      Get Fleet Rma Request Details
    Run Keyword And Continue On Failure    Should Not Be Empty    ${details}       No Outbound rma detail info found
    Run Keyword And Continue On Failure    Should Be Equal        ${details}[Current request status]        ${rma_status}
    Run Keyword And Continue On Failure    Should Be Equal        ${details}[Current tab]                   Outbound        # default Outbound
    ${expected_device_info}         Create List    Device ID      Model     Replacement device ID       Reason for RMA      Patient impact      Date of event      Shipping status
    ${actual_device_info}           Evaluate       [k for k, v in ${details}[RMA device information][0].items()]
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${actual_device_info}     ${expected_device_info}
    ${expected_other_info}          Create List    Notification email      Notes
    ${actual_other_info}            Evaluate       [k.replace(':','') for k, v in ${details}[Other information].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_other_info}      ${actual_other_info}
    ${expected_shipping_addr}       Create List    Address      Zip code     Contact phone number     Contact email
    ${actual_shipping_addr}         Evaluate      [k.replace(':','') for k, v in ${details}[Shipping information][Shipping address].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_shipping_addr}       ${actual_shipping_addr}
    ${expected_returning_addr}      Create List    Address      Zip code     Contact phone number     Contact email
    ${actual_returning_addr}        Evaluate      [k.replace(':','') for k, v in ${details}[Shipping information][Returning address].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_shipping_addr}       ${actual_shipping_addr}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_shipping_addr}         ${actual_shipping_addr}
    Run Keyword And Continue On Failure    Should Not Be Empty      ${details}[Tracking information]
    # Inbound
    Navigate To Rma Request Details Tab    Inbound
    ${details}      Get Fleet Rma Request Details
    Run Keyword And Continue On Failure    Should Not Be Empty    ${details}       No Inbound rma detail info found
    Run Keyword And Continue On Failure    Should Be Equal        ${details}[Current request status]        ${rma_status}
    Run Keyword And Continue On Failure    Should Be Equal        ${details}[Current tab]                   Inbound
    ${expected_device_info}         Create List    Device ID     Model     Purpose     RMA resolution      Returning status
    ${actual_device_info}           Get Rma Details Device Info Header
    Run Keyword And Continue On Failure    List Should Contain Sub List     ${actual_device_info}     ${expected_device_info}
    ${expected_other_info}          Create List    Notification email      Notes
    ${actual_other_info}            Evaluate       [k.replace(':','') for k, v in ${details}[Other information].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_other_info}      ${actual_other_info}
    ${expected_shipping_addr}       Create List    Address      Zip code     Contact phone number     Contact email
    ${actual_shipping_addr}         Evaluate      [k.replace(':','') for k, v in ${details}[Shipping information][Shipping address].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_shipping_addr}       ${actual_shipping_addr}
    ${expected_returning_addr}      Create List    Address      Zip code     Contact phone number     Contact email
    ${actual_returning_addr}        Evaluate      [k.replace(':','') for k, v in ${details}[Shipping information][Returning address].items()]
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${expected_shipping_addr}       ${actual_shipping_addr}
    Run Keyword And Continue On Failure    Lists Should Be Equal    ${actual_shipping_addr}         ${actual_shipping_addr}
    Run Keyword And Continue On Failure    Should Not Be Empty      ${details}[Tracking information]

Clear RMA Request
    Navigate To Fleet
    Navigate To Fleet Tab    RMA Request
    Filter Fleet Rma Request    by_status=Pending       search_by=Device ID     text_search=9999999919
    Clear Rma Request On    row=1
    ${msg}      Get Message Canceled Request
    Run Keyword And Continue On Failure    Should Be Equal    ${msg}        Canceled
