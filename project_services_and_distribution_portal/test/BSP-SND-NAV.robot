*** Settings ***
Documentation   Test Suite - S&D Portal - Authentication
Metadata    sid     BSP-SND-NAV
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_services_and_distribution_portal/lib/ConfigHandler.py    ${ENV}
#Library     project_services_and_distribution_portal/lib/web/Common.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-SND-NAV    web
Test Timeout    1h

*** Test Cases ***
BSP-SND-NAV-MENU-01: View list of menu’s tabs (S&D, OM)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of menu’s tabs (S&D, OM)
    ...
    ...     Precondition:
    ...   - The Operation Manager is on the ERP Home page, and clicks on the S&D portal
    ...
    ...     Test Steps:
    ...     1.The Operation Manager is on S&D portal
    ...     2. Observe the menu's tab
    ...
    ...     Expected Results:
    ...     1.The OM can access to:
    ...     RMA Requests tab
    ...     Operation Form tab
    ...     RMA Traveler
    ...     Device Transfer

    [Tags]    BSP-SND-NAV-MENU-01    BSP-SRS-007-FBS-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-MENU-02: View list of menu’s tabs (S&D, OS)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: View list of menu’s tabs (S&D, OS)
    ...
    ...     Precondition:
    ...   - The Operation Staff is on the ERP Home page, and clicks on the S&D portal
    ...
    ...     Test Steps:
    ...     1.The Operation Staff is on S&D portal
    ...     2. Observe the menu's tab
    ...
    ...     Expected Results:
    ...     1.The OS can access to:
    ...     RMA Requests tab
    ...     Device Transfer

    [Tags]    BSP-SND-NAV-MENU-02             BSP-SRS-007-FBS-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-MENU-05:The user is on the S&D portal, observe the number of the new RMA Requests ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new RMA request ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the S&D portal
    ...     2.Observe the number of the new RMA Requests ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-SND-NAV-MENU-05             BSP-SRS-007-FBS-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-MENU-06:The user is on the S&D portal, observe the number of the Operation Form ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new Operation Form ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the S&D portal
    ...     2.Observe the number of the new Operation Form ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-SND-NAV-MENU-06             BSP-SRS-007-FBS-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-MENU-07:The user is on the S&D portal, observe the number of the New RMA Traveler ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new RMA Traveler ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the S&D portal
    ...     2.Observe the number of the new RMA Traveler ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-SND-NAV-MENU-07             BSP-SRS-007-FBS-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-MENU-08:The user is on the S&D portal, observe the number of the New Device Transfer ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new Device Transfer ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the S&D portal
    ...     2.Observe the number of the new Device Transfer ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-SND-NAV-MENU-08             BSP-SRS-007-FBS-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-QA-01: Quick access to the other Portals (S&D,OM)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (S&D,OM,all portals)
    ...
    ...     Precondition:
    ...     - The user is assigned to all portals on admin portal
    ...
    ...     Test Steps:
    ...     1. The OM is on S&D Portal
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

    [Tags]    BSP-SND-NAV-QA-01            BSP-SRS-007-FBS-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-QA-02: Quick access to the other Portals (S&D,OM)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (S&D,OM)
    ...
    ...     Precondition:
    ...     - The user is assigned to some portals on admin portal
    ...
    ...     Test Steps:
    ...     - The OM is on S&D Portal
    ...     - Clicks on the UserName
    ...     - Clicks on [Other Portals] button

    ...     Expected Results:
    ...     1.The list of portals shall include Portals that the user is allowed to access.

    [Tags]    BSP-SND-NAV-QA-02            BSP-SRS-007-FBS-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-QA-03: Quick access to the other Portals (S&D,OM)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (S&D,OM) in the case the user is assigned to only S&D portal
    ...
    ...     Precondition:
    ...     - The user is assigned to a portal (S&D) on admin portal
    ...
    ...     Test Steps:
    ...     - The OM is on S&D Portal
    ...     - Clicks on the UserName
    ...

    ...     Expected Results:
    ...     1.There is no [Other Portals] button
    ...     2.The list shall include:
    ...     - ERP Home page

    [Tags]    BSP-SND-NAV-QA-03            BSP-SRS-007-FBS-02   R2    manual
    Manual Should Be Passed   ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-QA-04: Quick access to the other Portals (S&D,OS)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (S&D,OS,all portals)
    ...
    ...     Precondition:
    ...     - The user is assigned to all portals on admin portal
    ...
    ...     Test Steps:
    ...     1. The OS is on S&D Portal
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

    [Tags]    BSP-SND-NAV-QA-04  BSP-SRS-007-FBS-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-QA-05: Quick access to the other Portals (S&D,OS)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (S&D,OS)
    ...
    ...     Precondition:
    ...     - The user is assigned to some portals on admin portal
    ...
    ...     Test Steps:
    ...     - The OS is on S&D Portal
    ...     - Clicks on the UserName
    ...     - Clicks on [Other Portals] button

    ...     Expected Results:
    ...     1.The list of portals shall include Portals that the user is allowed to access.

    [Tags]    BSP-SND-NAV-QA-05  BSP-SRS-007-FBS-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-QA-06: Quick access to the other Portals (S&D,Os)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (S&D,OS) in the case the user is assigned to only S&D portal
    ...
    ...     Precondition:
    ...     - The user is assigned to a portal (S&D) on admin portal
    ...
    ...     Test Steps:
    ...     - The OS is on S&D Portal
    ...     - Clicks on the UserName
    ...

    ...     Expected Results:
    ...     1.There is no [Other Portals] button
    ...     2.The list shall include:
    ...     - ERP Home page

    [Tags]    BSP-SND-NAV-QA-06  BSP-SRS-007-FBS-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-01: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the notification icon
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
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

    [Tags]    BSP-SND-NAV-NOTISND-01    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-02: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the notification card
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
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

    [Tags]    BSP-SND-NAV-NOTISND-02     BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-03: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the new coming notification
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
    ...     - There are some new coming Notifications
    ...
    ...     Test Steps:
    ...     1. Observe the notification center

    ...     Expected Results:
    ...     1.The new coming notification has the “unread” status and is highlighted

    [Tags]    BSP-SND-NAV-NOTISND-03    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-04: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check status "read", "unread" in the case there is a new notification card
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
    ...     - There is only a new notification card
    ...
    ...     Test Steps:
    ...     1. The user clicks on an “unread” notification card for the first time
    ...     2. In the case there is an unread notification, observe the notification icon

    ...     Expected Results:
    ...     1.The status of the notification should be changed from “unread” to “read”
    ...     2.On the notification icon, a red dot will disappear

    [Tags]    BSP-SND-NAV-NOTISND-04    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-05: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check status "read", "unread" in the case there are some new notification cards
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
    ...     - There are some new notification cards
    ...
    ...     Test Steps:
    ...     1. The user clicks on an “unread” notification card for the first time
    ...     2. Observe the notification icon

    ...     Expected Results:
    ...     1.The status of the notification should be changed from “unread” to “read”
    ...     2.On the notification icon, a red dot will appear

    [Tags]    BSP-SND-NAV-NOTISND-05    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-06: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the red dot in the case there are multiple unread notifications
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
    ...     - There are some unread notification cards
    ...
    ...     Test Steps:
    ...     1. Observe the notification icon

    ...     Expected Results:
    ...     1.On the notification icon, a red dot will appear

    [Tags]    BSP-SND-NAV-NOTISND-06    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-07: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the red dot in the case thers is only an unread notification
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
    ...     - There is only a new notification cards
    ...
    ...     Test Steps:
    ...     1. Observe the notification icon

    ...     Expected Results:
    ...     1.On the notification icon, a red dot will appear

    [Tags]    BSP-SND-NAV-NOTISND-07    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-08: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the "Mark as all read" button
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
    ...     - There is only a new notification cards
    ...
    ...     Test Steps:
    ...     1. The user clicks on the “Mark as all read” option

    ...     Expected Results:
    ...     1.The status of the unread notification should be changed to “read”
    ...     2.The red dot shall disappear

    [Tags]    BSP-SND-NAV-NOTISND-08    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-09: Notification on S&D portal
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

    ...     Expected Results:
    ...     1.The latest notification on the list and the red dot will appear immediately

    [Tags]    BSP-SND-NAV-NOTISND-09    BSP-SRS-007-FBS-03-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-10: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Sned Notification when the Support Staff approves RMA request from the Support Portal
    ...
    ...     Precondition:
    ...     - The user is on S&D portal
    ...
    ...     Test Steps:
    ...     1.The Support Staff approves RMA request from the Support Portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user on S&D portal with the following information:
    ...     - RMA ID
    ...     - Time of notification: time when the RMA ticket is approved
    ...     - Message: “An RMA request has been approved.”
    ...     - Facility: [facility name]
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-10    BSP-SRS-007-FBS-04-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-11: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Send Notification when there is an RMA request with replacement device sent from the Clinic Portal
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.The user sends a RMA request with replacement device from the Clinic Portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to OM/OS on S&D portal with the following information:
    ...     - RMA ID
    ...     - Time of notification: time when the RMA ticket is approved
    ...     - Message: “An RMA request has been approved.”
    ...     - Facility: [facility name]
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-11    BSP-SRS-007-FBS-04-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-12: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the RMA ticket
    ...
    ...     Precondition:
    ...     1.The Support Staff approves RMA request from the Support Portal
    ...      or The Clinic technician send an RMA request with replacement device from the Clinic Portal

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the RMA

    [Tags]    BSP-SND-NAV-NOTISND-12    BSP-SRS-007-FBS-04-1   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-13: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Send Notification when The user submits an Operation Form
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.The user submits an Operation Form

    ...     Expected Results:
    ...     1.There shall be a notification sent to Operation Manager with the following information
    ...     - Form ID
    ...     - Time of notification: time when the operation form is submitted
    ...     - Message: “A new Operation Form has been submitted.”
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-13    BSP-SRS-007-FBS-04-2    R2   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-14: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the Operation form
    ...
    ...     Precondition:
    ...     1.The user submits an Operation Form

    ...     Test Steps:
    ...     1. On S&D portal, the Operation Manager clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Operation Form

    [Tags]    BSP-SND-NAV-NOTISND-14    BSP-SRS-007-FBS-04-2    R2   manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-15: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Send Notification when the user submits an RMA Traveler Form
    ...
    ...     Precondition:
    ...
    ...
    ...     Test Steps:
    ...     1.The user submits an RMA Traveler Form

    ...     Expected Results:
    ...     1.There shall be a notification sent to Operation Manager with the following information
    ...     - Form ID
    ...     - Time of notification: time when the RMA Traveler form is submitted
    ...     - Message: “A new RMA Traveler Form has been submitted.”
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-15    BSP-SRS-007-FBS-04-3    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-15.2: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the traveler form
    ...
    ...     Precondition:
    ...     1.The user submits an RMA Traveler Form

    ...     Test Steps:
    ...     1. On S&D portal, the Operation manager clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the traveler Form

    [Tags]    BSP-SND-NAV-NOTISND-15.2   BSP-SRS-007-FBS-04-3    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-16: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Device Transfer with purpose:
    ...     “Return renewal devices”
    ...
    ...     Precondition:
    ...     - The facility has subcribed the "Renewal Stock"
    ...     - There is at least a renewal device belongs to this facility
    ...
    ...     Test Steps:
    ...     1.The user unsubscribes the "renewal stock" from Sales portal
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Transfer ID
    ...     - Time of notification: time when the Device transfer is created.
    ...     - Message: “A new Device Transfer request has been created.”
    ...     - Facility
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-16    BSP-SRS-007-FBS-04-4    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-17: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the Device Transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for  “Return renewal devices”

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Device Transfer ticket

    [Tags]    BSP-SND-NAV-NOTISND-17     BSP-SRS-007-FBS-04-4    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-18: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Device Transfer with purpose:
    ...     “Closed account”
    ...
    ...     Precondition:
    ...     - There is at least a device belongs to this facility
    ...
    ...     Test Steps:
    ...     1.The user closes a facility form Admin portal
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Transfer ID
    ...     - Time of notification: time when the Device transfer is created.
    ...     - Message: “A new Device Transfer request has been created.”
    ...     - Facility
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-18     BSP-SRS-007-FBS-04-4    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-19: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the Device Transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for  “Closed account” ticket

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Device Transfer ticket

    [Tags]    BSP-SND-NAV-NOTISND-19     BSP-SRS-007-FBS-04-4    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-20: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Sales Order.
    ...
    ...     Precondition:
    ...

    ...     Test Steps:
    ...     1.The user places a new Sales Order
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Sales order ID
    ...     - Time of notification: time when the transfer ticket is submitted
    ...     - Message: “A new Sales Order has been placed.”
    ...     - Facility name
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-20     BSP-SRS-007-FBS-04-5    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-21: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for a New sales oder

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Transfer ticket

    [Tags]    BSP-SND-NAV-NOTISND-21     BSP-SRS-007-FBS-04-5    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-22: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when a Sales Order is cancelled
    ...
    ...     Precondition:
    ...     - The user creates a sales order from sale portal

    ...     Test Steps:
    ...     1.The user cancels a Sales Order
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Sales Order ID
    ...     - Message: “This Sales Order has been cancelled”
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-22     BSP-SRS-007-FBS-04-6    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-23: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for a cancelled sales oder

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Transfer ticket

    [Tags]    BSP-SND-NAV-NOTISND-23     BSP-SRS-007-FBS-04-6    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-24: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when a Sales Order is updated
    ...
    ...     Precondition:
    ...     - The user creates a sales order from sale portal

    ...     Test Steps:
    ...     1.The user updates the Device Model of the Sales Order
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Sales Order ID
    ...     - Device model updated
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-24     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-25: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for a updated sales oder (Device Model)

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Transfer ticket
    ...     2. Check the updated information
    [Tags]    BSP-SND-NAV-NOTISND-25     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-26: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when a Sales Order is updated
    ...
    ...     Precondition:
    ...     - The user creates a sales order from sale portal

    ...     Test Steps:
    ...     1.The user updates the number of devices in the Sales Oder
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Sales Order ID
    ...     - Number of devices
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-26     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-27: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for a updated sales oder (number of devices)

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Transfer ticket
    ...     2. Check the updated information

    [Tags]    BSP-SND-NAV-NOTISND-27     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-28: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when a Sales Order is updated
    ...
    ...     Precondition:
    ...     - The user creates a sales order from sale portal

    ...     Test Steps:
    ...     1.The user updates Notes in the Sales Oder
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Sales Order ID
    ...     - Notes
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-28     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-29: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for a updated sales oder (Notes)

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Transfer ticket
    ...     2. Check the updated information

    [Tags]    BSP-SND-NAV-NOTISND-29     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-30: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when a Sales Order is updated
    ...
    ...     Precondition:
    ...     - The user creates a sales order from sale portal

    ...     Test Steps:
    ...     1.The user updates Device model, Number of devices in the Sales Oder
    ...     2.Observe the notification center on S&D portal

    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Sales Order ID
    ...     - Device model updated
    ...     - Number of devices
    ...     - The performer’s name

    [Tags]    BSP-SND-NAV-NOTISND-30     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-NOTISND-31: Notification on S&D portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Go to the detail of the transfer ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for a updated sales oder (Device model, Number of devices)

    ...     Test Steps:
    ...     1. On S&D portal, the OM/OS clicks on the notification card

    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the Transfer ticket
    ...     2. Check the updated information

    [Tags]    BSP-SND-NAV-NOTISND-31     BSP-SRS-007-FBS-04-7    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-01: View the list of 'Export Audit Trail' on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view the list of 'Export Audit Trail' option on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...
    ...     Test Steps:
    ...     - 1. Click on Profile and select "Export Audit Trail" option
    ...
    ...     Expected Results:
    ...     - 1. There are an “Export Audit Trail” modal with the following options:
    ...     -   RMA Requests
    ...     -   Operation Forms
    ...     -   RMA Traveler
    ...     - 2. There shall be an ID input box for each selection with 2 buttons "Cancel" and "Export"
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-01     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-02: Cannot export an Audit trail for an invalid RMA request ticket on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM cannot export an Audit trail for an invalid RMA request ticket on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA Request Ticket" option
    ...     - 2. Enter an invalid RMA ID that not existing in the system
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid ticket ID" and the user cannot export file
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-02     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-03: Export an Audit trail for a completed RMA request ticket on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a completed RMA request ticket on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA Request Ticket" option
    ...     - 2. Enter a valid RMA ID that has completed status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]rma_rmaID
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-03     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-04: View Audit data of a completed RMA request ticket on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a completed RMA request ticket on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - The user has exported Audit trail for a completed RMA ticket
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created RMA <TicketID>
    ...     - + Approved RMA <TicketID> (if any)
    ...     - + Edited RMA <TicketID> - Inbound - RMA Information (if any)
    ...     - + Edited RMA <TicketID> - Outbound - Device Information (if any)
    ...     - + Edited RMA <TicketID> - Inbound - Tracking Information (if any)
    ...     - + Edited RMA <TicketID> - Outbound - Tracking Information (if any)
    ...     - + Edited RMA <TicketID> - Other Information (if any)
    ...     - + Edited RMA <TicketID> - Shipping Information (if any)
    ...     - + Completed RMA <TicketID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-04     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-05: Export an Audit trail for a rejected RMA request ticket on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a rejected RMA request ticket on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA Request Ticket" option
    ...     - 2. Enter a valid RMA ID that has rejected status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]rma_rmaID
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-05     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-06: View Audit data of a rejected RMA request ticket on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a rejected RMA request ticket on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - The user has exported Audit trail for a rejected RMA ticket
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created RMA <TicketID>
    ...     - + Edited RMA <TicketID> - Other Information (if any)
    ...     - + Edited RMA <TicketID> - Shipping Information (if any)
    ...     - + Rejected RMA <TicketID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-06     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-07: Export an Audit trail for a cancelled RMA request ticket on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a cancelled RMA request ticket on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA Request Ticket" option
    ...     - 2. Enter a valid RMA ID that has cancelled status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]rma_rmaID
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-07     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-08: View Audit data of a cancelled RMA request ticket on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a cancelled RMA request ticket on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - The user has exported Audit trail for a cancelled RMA ticket
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created RMA <TicketID>
    ...     - + Approved RMA <TicketID> (if any)
    ...     - + Edited RMA <TicketID> - Inbound - RMA Information (if any)
    ...     - + Edited RMA <TicketID> - Outbound - Device Information (if any)
    ...     - + Edited RMA <TicketID> - Inbound - Tracking Information (if any)
    ...     - + Edited RMA <TicketID> - Outbound - Tracking Information (if any)
    ...     - + Edited RMA <TicketID> - Other Information (if any)
    ...     - + Edited RMA <TicketID> - Shipping Information (if any)
    ...     - + Cancelled RMA <TicketID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-08     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-09: Cannot export an Audit trail for an invalid Operation form on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM cannot export an Audit trail for an invalid Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
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
    [Tags]     BSP-SND-NAV-AUDIT-SND-09     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-10: Export an Audit trail for an approved Operation form on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for an approved Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
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
    [Tags]     BSP-SND-NAV-AUDIT-SND-10     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-11: View Audit data of an approved Operation form on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of an approved Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
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
    [Tags]     BSP-SND-NAV-AUDIT-SND-11     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-12: Export an Audit trail for a rejected Operation form on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a rejected Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
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
    [Tags]     BSP-SND-NAV-AUDIT-SND-12     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-13: View Audit data of a rejected Operation form on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a rejected Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
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
    [Tags]     BSP-SND-NAV-AUDIT-SND-13     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-14: Export an Audit trail for a draft Operation form on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a draft Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
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
    [Tags]     BSP-SND-NAV-AUDIT-SND-14     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-15: View Audit data of a draft Operation form on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a draft Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
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
    [Tags]     BSP-SND-NAV-AUDIT-SND-15     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-16: Cannot export an Audit trail for an invalid RMA Traveler on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM cannot export an Audit trail for an invalid RMA Traveler on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA Traveler" option
    ...     - 2. Enter an invalid Form ID that not existing in the system
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. There shall be an error message "Invalid form ID" and the user cannot export file
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-16     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-17: Export an Audit trail for an approved RMA traveler on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for an approved Operation form on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA traveler" option
    ...     - 2. Enter a valid Form ID that has approved status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]traveler_travelerID
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-17     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-18: View Audit data of an approved RMA traveler on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of an approved RMA traveler on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - The user has exported Audit trail for an approved RMA traveler
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created RMA Traveler <FormID>
    ...     - + Completed Traveler <FormID> - Step <Step Description>
    ...     - + Submitted Traveler Form <FormID>
    ...     - + Approved RMA Traveler <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-18     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-19: Export an Audit trail for a rejected RMA traveler on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can export an Audit trail for a rejected RMA traveler on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - Click on Profile and select "Export Audit Trail" option
    ...
    ...     Test Steps:
    ...     - 1. On "Export Audit Trail" modal, select "RMA traveler" option
    ...     - 2. Enter a valid Form ID that has rejected status
    ...     - 3. Click "Export" button
    ...
    ...     Expected Results:
    ...     - 1. An excel file shall be downloaded to your PC with filename format [Audit]traveler_travelerID
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-19     BSP-SRS-007-RS-91-01   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-SND-NAV-AUDIT-SND-20: View Audit data of a rejected RMA traveler on SnD portal
    [Documentation]  Author: Nhan Nguyen
    ...
    ...     Description: OM can view Audit data of a rejected RMA traveler on SnD portal
    ...
    ...     Precondition:
    ...     - The OM user has logged in to SnD portal
    ...     - The user has exported Audit trail for a rejected RMA traveler
    ...
    ...     Test Steps:
    ...     - 1. Open the exported Excel file and view the information
    ...
    ...     Expected Results:
    ...     - 1. There shall be a header that displays the Device IDs related to the ticket. If there are multiple device IDs, each of them shall be on a new line
    ...     - 2. The audit data shall have 4 main attributes:
    ...     - Date time: Displayed relative to PST/PDT
    ...     - Action: Displayed with the following actions:
    ...     - + Created RMA Traveler <FormID>
    ...     - + Completed Traveler <FormID> - Step <Step Description>
    ...     - + Submitted Traveler Form <FormID>
    ...     - + Approved RMA Traveler <FormID>
    ...     - + Rejected RMA Traveler <FormID>
    ...     - Operator: Displays the full name of the operator
    ...     - IP Address
    ...
    [Tags]     BSP-SND-NAV-AUDIT-SND-20     BSP-SRS-007-RS-91-02   R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_services_and_distribution_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Services And Distribution Portal
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
