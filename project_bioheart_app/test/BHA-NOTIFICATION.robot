*** Settings ***
Documentation   Bioheart app Notification test suite
Metadata    sid     BHA-NOTIFICATION
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-NOTIFICATION     mapp
Test Timeout    1h

*** Test Cases ***
BHA-NOTIFICATION-01: View notification center
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Notification icon (the bell icon)
    ...
    ...     Expected Output:
    ...    - There is not any unseen notification, there shall not be a red dot on the bell icon
    ...    - Ther is any unseen notification, there shall be a red dot on the bell icon
    ...    - Navigate to Notification screen
    ...    - There shall be 2 tabs:
    ...         + All notifications
    ...         + What’s new
    ...    - There shall be an arrow button, pressing on this will navigate back to the Summary screen
    [Tags]     BHA-NOTIFICATION-01     BIOC-SRS-09-FRS-01-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-02: View all notifications tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notification screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - There shall be displayed max 5 notifications on the Notification screen. User is able to scroll up to load more notifications
    ...         + The app shall optimize the notification frame’s length (BLUE/WHITE frame) corresponding to the notification lines
    ...    - Users can scroll down to view more notifications.
    ...    - Notifications are sorted by received time (latest  oldest).
    ...    - The unread notifications include the following information: title, notification content (max length 2 lines), received time, and BLUE dot.
    ...    - The read notifications include the following information: title, notification content (max length 2 lines), and received time.
    ...    - When the user taps on the notification of a successfully created snapshot but this snapshot has already been deleted, there shall be a dialog with the message as designed
    ...    - Received will be displayed
    ...         + 0s - 1m: Just now
    ...         + 1m - 1h: [number] minute [s] ago
    ...         + 1h - 24h: [number] hour [s] ag
    ...         + >24h - 30d: [number] day [s] ago
    [Tags]     BHA-NOTIFICATION-02     BIOC-SRS-09-FRS-01-002       BIOC-SRS-09-FRS-01-005      BIOC-SRS-09-FRS-01-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-03: View what's new tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notification screen
    ...
    ...     Test Steps:
    ...    - Press on what's new tab
    ...
    ...     Expected Output:
    ...    - Navigate to What's new screen
    ...    - This tab will be displayed by clicking on the what’s new icon.
    ...    - There shall be a list of What’s new notifications sorted by updated time from latest to oldest.
    ...    - Users can scroll down to view more notifications.
    ...    - Pressing on any notification will display a pop-out of the following one
    [Tags]     BHA-NOTIFICATION-03     BIOC-SRS-09-FRS-01-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-04: View detail of what's new
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in What's new screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - Clicking on a what’s new notification will display the detail of that what’s new.
    ...    - There shall be a modal
    ...         + Display image.
    ...         + Dots indicator.
    ...         + Close button to close
    ...    - The user can slide to view each image
    [Tags]     BHA-NOTIFICATION-04     BIOC-SRS-09-FRS-01-003-0001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-05: Delete notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notification screen
    ...
    ...     Test Steps:
    ...    - Swipe left on any notification
    ...    - Press on delete button
    ...
    ...     Expected Output:
    ...    - When user taps the Delete button, the selected notification will be deleted
    [Tags]     BHA-NOTIFICATION-05     BIOC-SRS-09-FRS-01-004      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-06: Delete all notification
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notification screen
    ...
    ...     Test Steps:
    ...    - Press on Clear all button
    ...
    ...     Expected Output:
    ...    - There is a popup with content
    ...         + Title: Delete notifications
    ...         + Message: Are you sure want to delete all notifications?
    ...         + Confirm button, click this will delete all notifications and close the modal.
    ...         + Cancel button to close the modal without any other action
    ...    - Notifications will be deleted automatically after 30 days
    [Tags]     BHA-NOTIFICATION-06     BIOC-SRS-09-FRS-01-004      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-07: View notification detail
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Notification screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - Firmware update
    ...         + Title: Firmware update
    ...         + Message: New version [Firmware version] is available.
    ...         + Receive time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Health report
    ...         + Title: Health report
    ...         + Message: Successfully create health reports from [Month Day, Year] to [Month Day, Year] (Ex: Dec 12, 2022 to Dec 15, 2022).
    ...         + Receive time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Rhythm snapshot
    ...         + Title: Rhythm snapshot
    ...         + Content: Successfully create the snapshot in [Month Day, HH:MM:SS AM/PM] (Ex: Nov 8, 12:00:00 AM)
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Low heart rate
    ...         + Title: Bioheart low heart rate alert
    ...         + Content: Your heart rate has fallen below [min heart rate setup] for 10 minutes starting at HH:MM PM (04:22 PM). Tap to view the heart rate in detail.
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - High heart rate
    ...         + Title: Bioheart high heart rate alert
    ...         + Content: Your heart rate has risen above [max heart rate setup] for 10 minutes starting at HH:MM PM (04:22 PM). Tap to view the heart rate in detail.
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Payment failed
    ...         + Title: Your subscription payment failed
    ...         + Content: We couldn’t take your payment, so we have paused your subscription for now.
    ...         + When the user clicks on the notification, the app shall navigate the user to the PLAN OVERVIEW screen.
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Activated
    ...         + Title: Biosphere+ activated
    ...         + Content: Congratulation [icon] You can access all historical heart rhythm now.
    ...         + When the user clicks on the notification, the app shall navigate the user to the PLAN OVERVIEW screen.
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Canceled subscription
    ...         + Title: Subscription canceled
    ...         + Content: We're sorry to see you go. You can subscribe to Biosphere+ again anytime when you want to access your historical heart rhythm.
    ...         + When the user clicks on the notification, the app shall navigate the user to the PLAN OVERVIEW screen
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Renewal
    ...         + Title: Renewal reminder
    ...         + Content: Your subscription expires in 3 days. To keep enjoying Biosphere+, we kindly ask you to renew your plan before [expired day].
    ...         + When the user clicks on the notification, the app shall navigate user to PLAN OVERVIEW screen
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - What's new (display in what's new tab)
    ...         + Title: What’s new
    ...         + Content: New features are available in 1.7.0 version. Tap to view details.
    ...         + When the user clicks on the notification, the “What’s new” screen shall be displayed
    ...         + Received time:
    ...             * 0s - 1m: Just now
    ...             * 1m - 1h: [number] minute [s] ago
    ...             * 1h - 24h: [number] hour [s] ag
    ...             * >24h - 30d: [number] day [s] ago
    ...    - Low battery level (only push notification)
    ...         + There shall be a push notification when the Bioheart device battery level is 10%.
    ...             * Title: Low battery detected
    ...             * Message: 10% battery remaining. Please charge now!!
    ...         + If the user unplugs and the battery level is lower than 10%, push a notification.
    ...    - Sleep schedule notification (not yet)
    ...         + If the user is not opening the app at 8:00 AM, there shall be a push notification sent to the user with the content
    ...             * Title: Good morning, [first name]!
    ...             * Message: How long did you sleep last night?
    ...         + When the user presses on the notification, the app shall display the Good morning bottom sheet.
    ...    - Bedtime notification (only push notification)
    ...         + At bedtime reminder set in the sleep schedule, there shall be a push notification sent to the user
    ...             * Title: Bedtime Reminder
    ...             * Message: Your bedtime is set for [hour] [AM/PM]. Go to bed on time for another energetic day!!
    ...         + f the user reschedules the sleep time after the push notification, it shall apply for the next day
    ...    - Force update app (Displayed when that version needs updating)
    ...         + If the version of the mobile app is not compatible with the version of the firmware, display modal:
    ...             * Message: Your device is not compatible with this version, please update!!
    ...             * Update now button to navigate to Bioheart app in app store/google play.
    ...             * Later button to close
    [Tags]     BHA-NOTIFICATION-07     BIOC-SRS-09-FRS-02       BIOC-SRS-09-FRS-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-08: Badge notification on iOS
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - On the app icon, there shall be badge notification counted following this rule:
    ...         + The value on the badge notification shall be the number of unread notifications in the notification center.
    ...         + If the user presses on any unread notification, that notification will be considered read and the number shall be re-counted
    ...    - The notification center icon shall display follow this rule:
    ...         + If there is any unseen notification, there shall be a red dot on the icon.
    ...         + If the user presses on the notification center icon, all the unseen notifications will be considered seen
    [Tags]     BHA-NOTIFICATION-08     BIOC-SRS-09-FRS-04-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-NOTIFICATION-09: Badge notification on Android
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - On the app icon, there shall be badge notification counted following this rule:
    ...         + The android device displays badge notification in dot form
    ...             * The dot will appear if there is any push notification of the Bioheart app.
    ...             * If the user reads or deletes all the push notifications, the dot will disappear
    ...         + The android device displays badge notification in number form
    ...             * The value on the badge notification shall be the number of push notifications of the Bioheart app. Except for Bioheart is running notification.
    ...             * If the user presses on push notification or deletes it (except for Bioheart is running notification, cannot be deleted), the number of badge notification will be re-counted.
    [Tags]     BHA-NOTIFICATION-09     BIOC-SRS-09-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}