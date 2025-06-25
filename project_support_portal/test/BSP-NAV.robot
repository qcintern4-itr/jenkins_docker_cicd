*** Settings ***
Documentation   Test Suite - Support Portal - Authentication
Metadata    sid     BSP-NAV
Metadata    owner   Nhan Nguyen
Library     corelib/AssertionExtension.py
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_support_portal/lib/ConfigHandler.py    ${ENV}
#Library     project_support_portal/lib/web/Common.py

Suite Setup     Suite Setup
Suite Teardown      Suite Teardown
Force Tags      BSP-NAV    web
Test Timeout    1h

*** Test Cases ***
BSP-NAV-MENU-11:The user is on the Support portal, observe the number of the New Patient Support ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new Patient Support ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the Support portal
    ...     2.Observe the number of the new Patient Support ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-NAV-MENU-11       BSP-SRS-007-FBS-01   R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-MENU-12:The user is on the Support portal, observe the number of the New Clinic Support ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new Clinic Support ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the Support portal
    ...     2.Observe the number of the new Patient Support ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-NAV-MENU-12             BSP-SRS-007-FBS-01   R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-MENU-13:The user is on the Support portal, observe the number of the New RMA Request ticket
    [Documentation]  Author: Linh Phan
    ...
    ...     Description:
    ...
    ...     Precondition:
    ...     - There shall be some new RMA Request ticket
    ...
    ...     Test Steps:
    ...     1.The user is on the Support portal
    ...     2.Observe the number of the new RMA Request ticket
    ...
    ...     Expected Results:
    ...     1.The number indicates how many tickets are new in this tab

    [Tags]    BSP-NAV-MENU-13      BSP-SRS-007-FBS-01   R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-QA-10: Quick access to the other Portals (Support Portal, Support staff)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (Support portal)
    ...
    ...     Precondition:
    ...     - The user is assigned to all portals on admin portal
    ...
    ...     Test Steps:
    ...     1. The Support Staff is on Support Portal
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

    [Tags]    BSP-NAV-QA-10  BSP-SRS-007-FBS-02    R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-QA-11: Quick access to the other Portals (Support portal, Support staff)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (S&D,OM)
    ...
    ...     Precondition:
    ...     - The user is assigned to some portals on admin portal
    ...
    ...     Test Steps:
    ...     - The Support staff is on Support Portal
    ...     - Clicks on the UserName
    ...     - Clicks on [Other Portals] button

    ...     Expected Results:
    ...     1.The list of portals shall include Portals that the user is allowed to access.

    [Tags]    BSP-NAV-QA-11  BSP-SRS-007-FBS-02    R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-QA-12: Quick access to the other Portals (Support portal)
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Quick access to the other Portals (Support portal) in the case the user is assigned to only S&D portal
    ...
    ...     Precondition:
    ...     - The user is assigned to a portal (Support Portal) on admin portal
    ...
    ...     Test Steps:
    ...     - The Support Staff is on Support portalPortal
    ...     - Clicks on the UserName
    ...

    ...     Expected Results:
    ...     1.There is no [Other Portals] button
    ...     2.The list shall include:
    ...     - ERP Home page

    [Tags]    BSP-NAV-QA-12  BSP-SRS-007-FBS-02    R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-01: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the notification icon
    ...
    ...     Precondition:
    ...     - The user is on Support portal
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

    [Tags]    BSP-NAV-NOTISP-01   BSP-SRS-007-FBS-03-1    R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-02: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the notification card
    ...
    ...     Precondition:
    ...     - The user is on Support portal
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

    [Tags]    BSP-NAV-NOTISP-02      BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-03: Notification on Support portal
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

    [Tags]    BSP-NAV-NOTISP-03     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-04: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check status "read", "unread" in the case there is a new notification card
    ...
    ...     Precondition:
    ...     - The user is on Support portal
    ...     - There is only a new notification card
    ...
    ...     Test Steps:
    ...     1. The user clicks on an “unread” notification card for the first time
    ...     2. In the case there is an unread notification, observe the notification icon

    ...     Expected Results:
    ...     1.The status of the notification should be changed from “unread” to “read”
    ...     2.On the notification icon, a red dot will disappear

    [Tags]    BSP-NAV-NOTISP-04     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-05: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check status "read", "unread" in the case there are some new notification cards
    ...
    ...     Precondition:
    ...     - The user is on Support portal
    ...     - There are some new notification cards
    ...
    ...     Test Steps:
    ...     1. The user clicks on an “unread” notification card for the first time
    ...     2. Observe the notification icon

    ...     Expected Results:
    ...     1.The status of the notification should be changed from “unread” to “read”
    ...     2.On the notification icon, a red dot will appear

    [Tags]    BSP-NAV-NOTISP-05      BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-06: Notification on Support portal
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

    [Tags]    BSP-NAV-NOTISP-06      BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-07: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the red dot in the case thers is only an unread notification
    ...
    ...     Precondition:
    ...     - The user is on Support portal
    ...     - There is only a new notification cards
    ...
    ...     Test Steps:
    ...     1. Observe the notification icon

    ...     Expected Results:
    ...     1.On the notification icon, a red dot will appear

    [Tags]    BSP-NAV-NOTISP-07      BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-08: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Check the "Mark as all read" button
    ...
    ...     Precondition:
    ...     - The user is on Support portal
    ...     - There is only a new notification cards
    ...
    ...     Test Steps:
    ...     1. The user clicks on the “Mark as all read” option

    ...     Expected Results:
    ...     1.The status of the unread notification should be changed to “read”
    ...     2.The red dot shall disappear

    [Tags]    BSP-NAV-NOTISP-08      BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-09: Notification on Support portal
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

    [Tags]    BSP-NAV-NOTISP-09     BSP-SRS-007-FBS-03-1    R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-10: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is a new Clinic support ticket is submitted from Clinic portal.
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The user submits a new Clinic Support ticket from clinic portal
    ...
    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - Clinic ticket ID
    ...     - Time of notification: time when the Clinic support ticket is submitted
    ...     - Message: “A new Clinic Support has been submitted.”
    ...     - Facility
    ...     - The performer’s name

    [Tags]    BSP-NAV-NOTISP-10      BSP-SRS-007-FBS-06-1     R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-11: Notification on Support Portal
    [Documentation]  Author: Linh Phan
    ...     Description: Go to the detail of the Clinic Support ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for the Clinic Support ticket
    ...
    ...     Test Steps:
    ...     1. On Support portal, the user clicks on the notification card
    ...
    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the ticket

    [Tags]    BSP-NAV-NOTISP-11      BSP-SRS-007-FBS-06-1     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-12: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is an RMA request
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The new RMA ticket without renewal devices is submitted from Clinic portal
    ...
    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - RMA ID
    ...     - Time of notification: time when the RMA ticket is submitted
    ...     - Message: “A new RMA request has been submitted.”
    ...     - Facility: [facility name]
    ...     - The performer’s name

    [Tags]     BSP-NAV-NOTISP-12     BSP-SRS-007-FBS-06-2     R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-13: Notification on Support Portal
    [Documentation]  Author: Linh Phan
    ...     Description: Go to the detail of the RMA ticket
    ...
    ...     Precondition:
    ...     1.There is a notification for the RMA ticket
    ...
    ...     Test Steps:
    ...     1. On Support portal, the user clicks on the notification card
    ...
    ...     Expected Results:
    ...     1.The user shall be navigated to the details of the ticket
    ...     2.If the RMA ticket is not in “New” state, there shall be a message:
    ...     - The ticket has been approved: “The Service team is processing this RMA request.”
    ...     - The ticket has been rejected: “This RMA request has been rejected.”
    ...     - The ticket has been completed: “This RMA request has been completed.”
    ...     - The ticket has been canceled: “This RMA request has been canceled.”

    [Tags]    BSP-NAV-NOTISP-13     BSP-SRS-007-FBS-06-2     R2    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BSP-NAV-NOTISP-14: Notification on Support portal
    [Documentation]  Author: Linh Phan
    ...
    ...     Description: Receive notification when there is an RMA request
    ...
    ...     Precondition:
    ...
    ...     Test Steps:
    ...     1.The new RMA ticket without renewal devices is submitted from Clinic portal
    ...
    ...     Expected Results:
    ...     1.There shall be a notification sent to user with the following information
    ...     - RMA ID
    ...     - Time of notification: time when the RMA ticket is submitted
    ...     - Message: “A new RMA request has been submitted.”
    ...     - Facility: [facility name]
    ...     - The performer’s name

    [Tags]     BSP-NAV-NOTISP-14     BSP-SRS-007-FBS-06-2     R1    manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library       project_support_portal/lib/web/Common.py     ${BROWSER_NODE}       ${ENV}
    ${VERSION}           Navigate To Support Portal Page
    Set Suite Metadata   version    ${VERSION}
    Set Suite Metadata   browser    ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
