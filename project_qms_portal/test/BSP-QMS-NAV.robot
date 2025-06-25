*** Settings ***
Documentation   Test Suite - QMS Portal - Authentication
Metadata    sid     BSP-QMS-NAV
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_qms_portal/lib/ConfigHandler.py    ${ENV}
#Library     project_qms_portal/lib/web/Common.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-QMS-NAV    web
Test Timeout    1h

*** Test Cases ***
BSP-QMS-NAV-MENU-03: View list of menu’s tabs (QMS portal, QMS)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of menu’s tabs (S&D, OS)
    ...
    ...     Precondition:
    ...   - The QMS is on the ERP Home page, and clicks on the QMS portal
    ...
    ...     Test Steps:
    ...     1.The QMS is on QMS portal
    ...     2. Observe the menu's tab
    ...
    ...     Expected Results:
    ...     1.The QMS can access to:
    ...     Operation Form tab
    ...     Complaint tab

    [Tags]    BSP-QMS-NAV-MENU-03   SP-SRS-007-FBS-01    R2     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-MENU-09:The user is on the QMS portal, observe the number of the New Complaint ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new Complaint ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the QMS portal
    ...     2.Observe the number of the new Complaint ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-QMS-NAV-MENU-09             BSP-SRS-007-FBS-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-MENU-10:The user is on the QMS portal, observe the number of the New Operation Form ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new Operation Form ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the QMS portal
    ...     2.Observe the number of the new Operation Form ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-QMS-NAV-MENU-10             BSP-SRS-007-FBS-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-QA-07: Quick access to the other Portals (QMS Portal)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (QMS portal,QMS role,all portals)
    ...
    ...     Precondition:
    ...     - The user is assigned to all portals on admin portal
    ...
    ...     Test Steps:
    ...     1. The QMS is on QMS Portal
    ...     2. Clicks on the UserName
    ...     3. Clicks on [Other Portals] button
    ...     4. Clicks on each portal in the list
    ...     Expected Results:
    ...     2. There shall be:
    ...     - [Other Portal] button
    ...     - [ERP Home Page] button
    ...     - [Sign Out] button
    ...     3.The list of portals shall include all Portals that the user is allowed to access.
    ...     4.The new tab shall be opened

    [Tags]    BSP-QMS-NAV-QA-07  BSP-SRS-007-FBS-02    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-QA-08: Quick access to the other Portals (QMS Portal)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (QMS portal,QMS role)
    ...
    ...     Precondition:
    ...     - The user is assigned to some portals on admin portal
    ...
    ...     Test Steps:
    ...     - The QMS is on QMS Portal
    ...     - Clicks on the UserName
    ...     - Clicks on [Other Portals] button

    ...     Expected Results:
    ...     1.The list of portals shall include Portals that the user is allowed to access.

    [Tags]    BSP-QMS-NAV-QA-08  BSP-SRS-007-FBS-02    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-QA-09: Quick access to the other Portals (QMS Portal)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (QMS portal,QMS role) in the case the user is assigned to only S&D portal
    ...
    ...     Precondition:
    ...     - The user is assigned to a portal (QMS portal) on admin portal
    ...
    ...     Test Steps:
    ...     - The QMS is on QMS Portal
    ...     - Clicks on the UserName
    ...

    ...     Expected Results:
    ...     1.There is no [Other Portals] button
    ...     2.The list shall include:
    ...     - ERP Home page

    [Tags]    BSP-QMS-NAV-QA-09  BSP-SRS-007-FBS-02    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-01: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the notification icon
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There are some Notification cards
    ...
    ...     Test Steps:
    ...     1. Observe the navigation bar
    ...     2. The user clicks on the notification icon
    ...     3. The user clicks on the notification icon again or clicks outside the notification center

    ...     Expected Results:
    ...     1.There should be a notification icon for the user to access the notification center
    ...     2.The notification center shall be displayed, the list should start with the latest notifications
    ...     3. The notification center shall be closed

    [Tags]    BSP-QMS-NAV-NOTIQMS-01     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-02: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the notification card
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There are some Notification cards
    ...
    ...     Test Steps:
    ...     1. Observe the notification center

    ...     Expected Results:
    ...     1.The notification center displayed as a card
    ...     2.Separated by days:
    ...     - Today
    ...     - Yesterday
    ...     - Mm/dd: Days before yesterday should be displayed using the Month Day format.

    [Tags]    BSP-QMS-NAV-NOTIQMS-02     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-03: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the new coming notification
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There are some new coming Notifications
    ...
    ...     Test Steps:
    ...     1. Observe the notification center

    ...     Expected Results:
    ...     1.The new coming notification has the “unread” status and is highlighted

    [Tags]    BSP-QMS-NAV-NOTIQMS-03     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-04: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check status "read", "unread" in the case there is a new notification card
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There is only a new notification card
    ...
    ...     Test Steps:
    ...     1. The user clicks on an “unread” notification card for the first time
    ...     2. In the case there is an unread notification, observe the notification icon

    ...     Expected Results:
    ...     1.The status of the notification should be changed from “unread” to “read”
    ...     2.On the notification icon, a red dot will disappear

    [Tags]    BSP-QMS-NAV-NOTIQMS-04    BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-05: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check status "read", "unread" in the case there are some new notification cards
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There are some new notification cards
    ...
    ...     Test Steps:
    ...     1. The user clicks on an “unread” notification card for the first time
    ...     2. Observe the notification icon

    ...     Expected Results:
    ...     1.The status of the notification should be changed from “unread” to “read”
    ...     2.On the notification icon, a red dot will appear

    [Tags]    BSP-QMS-NAV-NOTIQMS-05     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-06: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the red dot in the case there are multiple unread notifications
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There are some unread notification cards
    ...
    ...     Test Steps:
    ...     1. Observe the notification icon

    ...     Expected Results:
    ...     1.On the notification icon, a red dot will appear

    [Tags]    BSP-QMS-NAV-NOTIQMS-06     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-07: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the red dot in the case thers is only an unread notification
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There is only a new notification cards
    ...
    ...     Test Steps:
    ...     1. Observe the notification icon

    ...     Expected Results:
    ...     1.On the notification icon, a red dot will appear

    [Tags]    BSP-QMS-NAV-NOTIQMS-07     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-08: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the "Mark as all read" button
    ...
    ...     Precondition:
    ...     - The user is on QMS portal
    ...     - There is only a new notification cards
    ...
    ...     Test Steps:
    ...     1. The user clicks on the “Mark as all read” option

    ...     Expected Results:
    ...     1.The status of the unread notification should be changed to “read”
    ...     2.The red dot shall disappear

    [Tags]     BSP-QMS-NAV-NOTIQMS-08    BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-09: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the notification center when there is a new coming notification.
    ...
    ...     Precondition:
    ...     - The notification center is open,
    ...    -  There is a new coming notification.
    ...
    ...     Test Steps:
    ...     1.Observe the Notification center
    ...
    ...     Expected Results:
    ...     1.The latest notification on the list and the red dot will appear immediately

    [Tags]    BSP-QMS-NAV-NOTIQMS-09     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-10: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Complaint ticket
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The user creates an RMA ticket from Patient Support ticket
    ...     2.The web app shall create a complaint ticket for each device

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Complaint ID
    ...     - Time of notification: time when the complaint ticket is created
    ...     - Message: “A new Complaint ticket has been created.”
    ...     - The performer’s name

    [Tags]    BSP-QMS-NAV-NOTIQMS-10     BSP-SRS-007-FBS-05-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-11: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Complaint ticket
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The user creates an RMA ticket from Clinic Support ticket with “Device issue” category
    ...     2.The web app shall create a complaint ticket for each device

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Complaint ID
    ...     - Time of notification: time when the complaint ticket is created
    ...     - Message: “A new Complaint ticket has been created.”
    ...     - The performer’s name

    [Tags]    BSP-QMS-NAV-NOTIQMS-11     BSP-SRS-007-FBS-05-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-12: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Complaint ticket
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The user creates an RMA ticket from the New tab of the RMA request
    ...     2.The web app shall create a complaint ticket for each device

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Complaint ID
    ...     - Time of notification: time when the complaint ticket is created
    ...     - Message: “A new Complaint ticket has been created.”
    ...     - The performer’s name

    [Tags]    BSP-QMS-NAV-NOTIQMS-12     BSP-SRS-007-FBS-05-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-13: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Complaint ticket
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The user adds a device into the outbound tab of an in-process ticket
    ...     2.The web app shall create a complaint ticket for each device

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Complaint ID
    ...     - Time of notification: time when the complaint ticket is created
    ...     - Message: “A new Complaint ticket has been created.”
    ...     - The performer’s name

    [Tags]    BSP-QMS-NAV-NOTIQMS-13     BSP-SRS-007-FBS-05-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-14: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Complaint ticket
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The user approves a new RMA ticket
    ...     2.The web app shall create a complaint ticket for each device

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Complaint ID
    ...     - Time of notification: time when the complaint ticket is created
    ...     - Message: “A new Complaint ticket has been created.”
    ...     - The performer’s name

    [Tags]    BSP-QMS-NAV-NOTIQMS-14     BSP-SRS-007-FBS-05-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-15: Notification on QMS portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Complaint ticket
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The user creates an RMA request that has renewal device from the Clinic Portal
    ...     2.The web app shall create a complaint ticket for each device

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Complaint ID
    ...     - Time of notification: time when the complaint ticket is created
    ...     - Message: “A new Complaint ticket has been created.”
    ...     - The performer’s name

    [Tags]    BSP-QMS-NAV-NOTIQMS-15    BSP-SRS-007-FBS-05-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-16: Notification on QMS
    [Documentation]  Author: Linh Phan
    ...     Description: Go to the detail of the Complaint ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for a complaint ticket
    ...
    ...     Test Steps:
    ...     1. On QMS portal, the user clicks on the notification card
    ...
    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Complaint ticket

    [Tags]    BSP-QMS-NAV-NOTIQMS-16    BSP-SRS-007-FBS-05-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-17: Notification on QMS
        [Documentation]  Author: Linh Phan
    ...     Description: Receive notification when there is a new Operation form is approved
    ...
    ...     Precondition:
    ...     1.There is a operation form in the new tab on S&D portal
    ...
    ...     Test Steps:
    ...     1. The operation manager approves a new Operation form on S&D portal
    ...
    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Form ID
    ...     - Time of notification: time when the operation is approved by OM
    ...     - Message: “A new Operation Form has been approved.”
    ...     - The performer’s name

    [Tags]    BSP-QMS-NAV-NOTIQMS-17    BSP-SRS-007-FBS-05-2    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-NOTIQMS-18: Notification on QMS
    [Documentation]  Author: Linh Phan
    ...     Description: Go to the detail of the Operation form
    ...
    ...     Precondition:
    ...     1.There is a notification for the approved Operation form
    ...
    ...     Test Steps:
    ...     1. On QMS portal, the user clicks on the notification card
    ...
    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Operation form

    [Tags]    BSP-QMS-NAV-NOTIQMS-18    BSP-SRS-007-FBS-05-2    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-01: View the list of 'Export Audit Trail' on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can view the list of 'Export Audit Trail' option on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Profile and select "Export Audit Trail" option
    ...
    ...     Expected Results:
    ...     - 1. There are an “Export Audit Trail” modal with the following options:
    ...     -   Complaint ticket
    ...     -   Operation form
    ...     - 2. There shall be an ID input box for each selection with 2 buttons "Cancel" and "Export"
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-01     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-02: Cannot export an Audit trail for an invalid Complaint ticket on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS cannot export an Audit trail for an invalid Complaint ticket on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Complaint ticket" option
    ...     - 2. Enter an invalid ticket ID that not existing in the system
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid ticket ID" and the user cannot export file
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-02     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-03: Export an Audit trail for an accepted Complaint ticket on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can export an Audit trail for an accepted Complaint ticket on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Complaint ticket" option
    ...     - 2. Enter a valid ticket ID that has accepted status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]complaint_complaintID
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-03     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-04: View Audit data of an accepted Complaint ticket on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can view Audit data of an accepted Complaint ticket on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...     - The user has exported Audit trail for an accepted Complaint ticket
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Edited Complaint <ComplaintID> - Complaint Information
    ...     - + Accepted Complaint <ComplaintID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-04     BSP-SRS-007-RS-91-02    R2    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-05: Export an Audit trail for a rejected Complaint ticket on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can export an Audit trail for a rejected Complaint ticket on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Complaint ticket" option
    ...     - 2. Enter a valid ticket ID that has rejected status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]complaint_complaintID
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-05     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-06: View Audit data of a rejected Complaint ticket on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can view Audit data of a rejected Complaint ticket on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...     - The user has exported Audit trail for a rejected Complaint ticket
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Edited Complaint <ComplaintID> - Complaint Information
    ...     - + Rejected Complaint <ComplaintID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-06     BSP-SRS-007-RS-91-02    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-07: Cannot export an Audit trail for an invalid Operation form on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS cannot export an Audit trail for an invalid Operation form on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter an invalid Form ID that not existing in the system
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid form ID" and the user cannot export file
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-07     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-08: Export an Audit trail for an approved Operation form on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can export an Audit trail for an approved Operation form on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter a valid Form ID that has approved status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]opform_opformID
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-08     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-09: View Audit data of an approved Operation form on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can view Audit data of an approved Operation form on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to QMS portal
    ...     - The user has exported Audit trail for an approved Operation form
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created Operation Form <FormID>
    ...     - + Completed Operation Form <FormID> - Step <Step description>
    ...     - + Submitted Operation Form <FormID>
    ...     - + Approved Operation Form <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-09     BSP-SRS-007-RS-91-02    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-10: Export an Audit trail for a rejected Operation form on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can export an Audit trail for a rejected Operation form on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter a valid Form ID that has rejected status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]opform_opformID
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-10     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-11: View Audit data of a rejected Operation form on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can view Audit data of a rejected Operation form on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to SnD portal
    ...     - The user has exported Audit trail for a rejected Operation form
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created Operation Form <FormID>
    ...     - + Completed Operation Form <FormID> - Step <Step description>
    ...     - + Submitted Operation Form <FormID>
    ...     - + Approved Operation Form <FormID> (if any)
    ...     - + Rejected Operation Form <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-11     BSP-SRS-007-RS-91-02    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-12: Export an Audit trail for a draft Operation form on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can export an Audit trail for a draft Operation form on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "Operation form" option
    ...     - 2. Enter a valid Form ID that has draft status (has not been submitted yet)
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]opform_opformID
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-12     BSP-SRS-007-RS-91-01    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-QMS-NAV-AUDIT-QMS-13: View Audit data of a draft Operation form on QMS portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: QMS can view Audit data of a draft Operation form on QMS portal
    ...
    ...     Precondition:
    ...     - The QMS user has logged in to SnD portal
    ...     - The user has exported Audit trail for a draft Operation form
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created Operation Form <FormID>
    ...     - + Completed Operation Form <FormID> - Step <Step description>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-QMS-NAV-AUDIT-QMS-13     BSP-SRS-007-RS-91-02    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_qms_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Qms Portal
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
