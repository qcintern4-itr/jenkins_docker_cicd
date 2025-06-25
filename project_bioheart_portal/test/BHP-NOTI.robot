*** Settings ***
Documentation  Bioheart portal Notification test suite
Metadata    sid   BHP-NOTI
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BHP-NOTI        web
Test Timeout  1h

*** Test Cases ***
BHP-NOTI-NOTICENTER-01: View notification center
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check notification center
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - There shall be a Clear all button
    ...     - There shall be a X icon button
    ...     - There shall be 2 tabs: Notification and What's new
    ...     - There shall be a red dot on the be, when there is any unseen notification
    [Tags]  BHP-NOTI-NOTICENTER-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-02: Close notification center screen
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Click on the Bell again or X icon button
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. The notification center screen is closed
    [Tags]  BHP-NOTI-NOTICENTER-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-03: View notification center detail
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check notification center detail
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Users can scroll down to view more notifications.
    ...     - Notifications are sorted by received time (latest  oldest).
    ...     - The unread notifications include the following information: title, notification content (max length 2 lines), received time, and BLUE dot.
    ...     - The read notifications include the following information: title, notification content (max length 2 lines), and received time.
    ...     - Received time will be displayed:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    [Tags]  BHP-NOTI-NOTICENTER-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-04: Navigate to the What's new tab
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Click on What's new tab
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. Navigate to the What's new tab and users can scroll down to view more notifications.
    [Tags]  BHP-NOTI-NOTICENTER-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-05: View What's new tab detail
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Click on What's new tab
    ...    - 3. Click on What's new notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. Navigate to the What's new tab and users can scroll down to view more notifications.
    ...    - 3. There shall be a modal displayed
    ...     + Display auto slide image every 5 secondsWhat.
    ...     + Dots indicator.
    ...     + Close button to close.
    [Tags]  BHP-NOTI-NOTICENTER-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-06: Delete any notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Click on What's new tab
    ...    - 3. Click on delete hover
    ...    - 4. Click on Delete button
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. Navigate to the What's new tab and users can scroll down to view more notifications.
    ...    - 3. Delete notification modal is displayed
    ...    - 4. This notification is deleted
    [Tags]  BHP-NOTI-NOTICENTER-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-07: Delete all notifications
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Click on Clear all button
    ...    - 3. Click on Delete button
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. Delete notification modal is displayed
    ...    - 3. The notification list is deleted all
    [Tags]  BHP-NOTI-NOTICENTER-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-08: Auto delete notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - Notifications will be deleted automatically after 30 days
    [Tags]  BHP-NOTI-NOTICENTER-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-09: Cancel to delete any notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Move the mouse on any notification
    ...    - 3. Click on delete hover
    ...    - 4. Click on Cancel button
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. Displayed delete hover
    ...    - 3. Delete notification modal is displayed
    ...    - 4. This notification is not deleted
    [Tags]  BHP-NOTI-NOTICENTER-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTICENTER-10: Cancel to delete all notifications
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Click on Clear all button
    ...    - 3. Click on Cancel button
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. Delete notification modal is displayed
    ...    - 3. The notification list is not deleted
    [Tags]  BHP-NOTI-NOTICENTER-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-01: Firmware update notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check firmware update notification detail
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Firmware update
    ...     - Message: New version [Firmware version] is available.
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    [Tags]  BHP-NOTI-NOTIDETAIL-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-02: Health report notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check health report notification detail
    ...    - 3. Click on Health report notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Health report
    ...     - Message: Successfully create health reports from [Month Day, Year] to [Month Day, Year] (Ex: Dec 12, 2022 to Dec 15, 2022).
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to Health report detail
    [Tags]  BHP-NOTI-NOTIDETAIL-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-03: Access health report notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check access health report notification
    ...    - 3. Click on access report notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Bioheart report access request
    ...     - Message: A clinic wants to access your Bioheart reports during your Biocare cardiac care plan. Tap to review and authorize the access.
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the Settings screen
    [Tags]  BHP-NOTI-NOTIDETAIL-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-04: Rhythm snapshot notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check rhythm snapshot notification detail
    ...    - 3. Click on Rhythm snapshot notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Rhythm snapshot
    ...     - Content: Successfully create the snapshot in [Month Day, HH:MM:SS AM/PM] (Ex: Nov 8, 12:00:00 AM)
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the Rhythm snapshot detail
    [Tags]  BHP-NOTI-NOTIDETAIL-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-05: Low heart rate notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check low heart rate notification detail
    ...    - 3. Click on Low heart rate notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Bioheart low heart rate alert
    ...     - Content: Your heart rate has fallen below [min heart rate setup] for 10 minutes starting at HH:MM PM (04:22 PM). Tap to view the heart rate in detail.
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the Low heart rate detail
    [Tags]  BHP-NOTI-NOTIDETAIL-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-06: High heart rate notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check high heart rate notification detail
    ...    - 3. Click on High heart rate notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Bioheart high heart rate alert
    ...     - Content: Your heart rate has risen above [max heart rate setup] for 10 minutes starting at HH:MM PM (04:22 PM). Tap to view the heart rate in detail.
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the High heart rate detail
    [Tags]  BHP-NOTI-NOTIDETAIL-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-07: Payment failed notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check payment failed notification detail
    ...    - 3. Click on Payment failed notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Your subscription payment failed
    ...     - Content: We couldn’t take your payment, so we have paused your subscription for now.
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the Plan Overview screen
    [Tags]  BHP-NOTI-NOTIDETAIL-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-08: Biosphere+ activated notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check Biosphere+ activated notification detail
    ...    - 3. Click on Biosphere+ activated notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Biosphere+ activated
    ...     - Content: Congratulation [icon] You can access all historical heart rhythm now.
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the Plan Overview screen
    [Tags]  BHP-NOTI-NOTIDETAIL-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-09: Membership cancel notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check membership cancel notification detail
    ...    - 3. Click on Membership cancel notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Subscription canceled
    ...     - Content: We're sorry to see you go. You can subscribe Biosphere+ again anytime when you want to access your historical heart rhythm.
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the Plan Overview screen
    [Tags]  BHP-NOTI-NOTIDETAIL-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-10: Auto renewal notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Check auto renewal notification detail
    ...    - 3. Click on Renewal reminder notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2.
    ...     - Title: Renewal reminder
    ...     - Content: Your subscription expires in 3 days. To keep enjoying Biosphere+, we kindly ask you to renew your plan before [expired day].
    ...     - Receive time:
    ...       + 0s < receive time < 1min, display: “Just now”.
    ...       + 1min <= receive time < 1h, display: “[number] minute(s)”.
    ...       + 1h <= receive time < 24h, display: “[number] hour(s)”.
    ...       + 24h <= receive time < 30days, display: “[number] day(s) ago”.
    ...    - 3. Navigate to the Plan Overview screen
    [Tags]  BHP-NOTI-NOTIDETAIL-10      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-NOTI-NOTIDETAIL-11: What's new notification
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on the Bell icon on the right-sidebar
    ...    - 2. Click on What's new tab
    ...    - 3. Check What's new notification detail
    ...    - 4. Click on What's new notification
    ...
    ...     Expected Output:
    ...    - 1. The notification center screen is opened
    ...    - 2. Navigate to the What's new screen
    ...    - 3.
    ...     - Title: What’s new
    ...     - Content: New features are available in x.x.x version. Tap to view details.
    ...     - Receive time: MM-YYYY
    ...    - 3. The What's new screen is displayed
    [Tags]  BHP-NOTI-NOTIDETAIL-11      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${BROWSER_NODE}      Start Browser
    Import Library      project_bioheart_portal/lib/web/Common.py   ${BROWSER_NODE}  ${ENV}
    ${URL}  Get Config Param    WEB_BASE_URL
    Open Page  ${URL}
    ${VERSION}      Navigate To Bioheart Sign In Page
    Set Suite Metadata    version   ${VERSION}
    Set Suite Metadata    browser   ${BROWSER.capitalize()}

SUITE TEARDOWN
    Quit Browser
