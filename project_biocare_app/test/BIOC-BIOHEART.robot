*** Settings ***
Documentation   Biocare app Bioheart study test suite
Metadata    sid     BIOC-BIOHEART
Metadata    owner   Han Nguyen
Library     corelib/AssertionExtension.py
#Library     corelib/MobileAppHandler.py                ${DESIRED_CAPS}
#Library     project_biocare_app/lib/ConfigHandler.py   ${ENV}

#Suite Setup     SUITE SETUP
#Suite Teardown  SUITE TEARDOWN
Force Tags      BIOC-BIOHEART   mapp
Test Timeout    1h

*** Test Cases ***
BIOC-BIOHEART-SNAPSHOT-01: Create snapshot from Heart Rate chart
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card
    ...     2. Press on View heart rhythm button
    ...     3. Press on Create snapshot button
    ...     4. Select duration
    ...     5. Add notes and tags
    ...
    ...     Expected Output:
    ...     - The snapshot is created and naviagte to Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-01         BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-02: Create snapshot without notes from HR chart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card on Home screen
    ...     2. Press on View heart rhythm button
    ...     3. Press on Create snapshot button
    ...     4. Select duration
    ...     5. Skip to add note step
    ...
    ...     Expected Output:
    ...     - The snapshot is created and naviagte to Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-02         BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-03: Cancel to create snapshot from HR chart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card on Home screen
    ...     2. Press on View heart rhythm button
    ...     3. Press on Create snapshot button
    ...     4. Press on Cancel
    ...
    ...     Expected Output:
    ...     - The snapshot is canceled.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-03        BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-04: Create snapshot from Bioheart section
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Historical rhythm button
    ...     2. Press on Create snapshot button
    ...     3. Select duration
    ...     4. Add notes and tags
    ...
    ...     Expected Output:
    ...     - The snapshot is created and naviagte to Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-04      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-05: Create snapshot without notes from Bioheart section
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Historical rhythm button
    ...     2. Press on Create snapshot button
    ...     3. Select duration
    ...     4. Skip to add note step
    ...
    ...     Expected Output:
    ...     - The snapshot is created and naviagte to Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-05      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-06: Cancel to create snapshot from Bioheart section
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Historical rhythm button
    ...     2. Press on Create snapshot button
    ...     3. Press on Cancel
    ...
    ...     Expected Output:
    ...     - The snapshot is canceled.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-06    BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-07: Create snapshot in Snapshot diary screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tab
    ...     2. Press on Snapshot diary tab
    ...     3. Press on + button
    ...     4. Press on Create snapshot button
    ...     5. Select duration
    ...     6. Add notes and tags
    ...
    ...     Expected Output:
    ...     - The snapshot is created and naviagte to Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-07      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-08: Create snapshot without in Snapshot diary screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tab
    ...     2. Press on Snapshot diary tab
    ...     3. Press on plus button
    ...     4. Press on Create snapshot button
    ...     5. Select duration
    ...     6. Skip to add note step
    ...
    ...     Expected Output:
    ...     - The snapshot is created and naviagte to Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-08      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-09: Cancel to create snapshot in Snapshot diary screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tab
    ...     2. Press on Snapshot diary tab
    ...     3. Press on plus button
    ...     4. Press on Create snapshot button
    ...     5. Press on Cancel
    ...
    ...     Expected Output:
    ...     - The snapshot is canceled
    [Tags]     BIOC-BIOHEART-SNAPSHOT-09      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-10: Create snapshot in Home tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on View live rhythm button
    ...     2. Press on Start Recording button
    ...     3. Select duration
    ...     4. Add note and tags
    ...
    ...     Expected Output:
    ...     - The snapshot is created and Add notes popup is dismissed.
    ...     - The user will stay on Your heart rhythm screen.
    ...     - The created snaphot is displayed in Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-10       BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-11: Create snapshot without notes in Home tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on View live rhythm button
    ...     2. Press on Start Recording button
    ...     3. Select duration
    ...     4. Skip to add note step
    ...
    ...     Expected Output:
    ...     - The snapshot is created and Add notes popup is dismissed.
    ...     - The user will stay on Your heart rhythm screen.
    ...     - The created snaphot is displayed in Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-11      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-12: Create snapshot in Home tab after 20-seconds timeout
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on View live rhythm button
    ...     2. Press on Start Recording button
    ...     3. Wait for after 20-seconds
    ...
    ...     Expected Output:
    ...     - The snapshot is created and Select duration dialog is dismissed.
    ...     - Add notes popup is displayed, user can add note and tags for snapshot.
    ...     - The user will stay on Your heart rhythm screen.
    ...     - The created snaphot is displayed in Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-12      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-13: Cancel to create snapshot in Home tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on View live rhythm button
    ...     2. Press on Start Recording button
    ...     3. Press on Cancel button
    ...
    ...     Expected Output:
    ...     - The snapshot is canceled.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-13       BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-14: Create snapshot in Devices tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on View live rhythm button
    ...     3. Press on Start Recording button
    ...     4. Select duration
    ...     5. Add note and tags
    ...
    ...     Expected Output:
    ...     - The snapshot is created and Add notes popup is dismissed.
    ...     - The user will stay on Your heart rhythm screen.
    ...     - The created snaphot is displayed in Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-14       BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-15: Create snapshot without notes in Devices tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on View live rhythm button
    ...     3. Press on Start Recording button
    ...     4. Select duration
    ...     5. Skip to add note step
    ...
    ...     Expected Output:
    ...     - The snapshot is created and Add notes popup is dismissed.
    ...     - The user will stay on Your heart rhythm screen.
    ...     - The created snaphot is displayed in Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-15       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-16: Create snapshot in Devices tab after 20-seconds timeout
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on View live rhythm button
    ...     3. Press on Start Recording button
    ...     4. Wait for after 20-seconds
    ...
    ...     Expected Output:
    ...     - The snapshot is created and Select duration dialog is dismissed.
    ...     - Add notes popup is displayed, user can add note and tags for snapshot.
    ...     - The user will stay on Your heart rhythm screen.
    ...     - The created snaphot is displayed in Pending list.
    ...     - When completed, the system will push notification and snapshot auto move to Recent and All tabs.
    ...     - Snapshot notification is displayed in Notification center.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-16       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-17: Cancel to create snapshot in Devices tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on View live rhythm button
    ...     3. Press on Start Recording button
    ...     4. Press on Cancel button
    ...
    ...     Expected Output:
    ...     - The snapshot is canceled.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-17       BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-18: Check Your heart ryhthm screen when charging
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Your heart rhythm screen
    ...     2. Connect Bioheart device with charger
    ...
    ...     Expected Output:
    ...     - The Start Recording button is hidden and replace to "Bioheart is charging, unplug to start recording" snackbar.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-18      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-19: Check Your heart ryhthm screen when bad contact or electrical noise
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Your heart rhythm screen
    ...     2. Disconnect lead
    ...
    ...     Expected Output:
    ...     - The Start Recording button is hidden and replace to "Bad contact, waer it properly" or "Electrical noise or bad contact" snackbar.
    ...     - The Start Recording button will displayed again when dectecting good contact.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-19       BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOT-20: Check Your heart ryhthm screen when generating error
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Your heart rhythm screen
    ...     2. Turn off Bluetooth on the phone or turn off device
    ...
    ...     Expected Output:
    ...     - Display Error popup.
    ...     - Navigate to Home screen when pressing on Got it button.
    [Tags]     BIOC-BIOHEART-SNAPSHOT-20       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-GROUPSNAPSHOT-01: View Snapshot diary screen when there is no snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on Snapshot diary button
    ...
    ...     Expected Output:
    ...     - Navigate to Snapshot diary screen.
    ...     - The + button, pressing this to navigate to the View heart rhythm screen with the default selected point is the first data point of the latest day that having data.
    ...     - There shall be a “View guide” hyperlink to the guide of creating snapshots from snapshot diary screen.
    ...     - There is a back button to navigate to the previous screen.
    [Tags]     BIOC-BIOHEART-GROUPSNAPSHOT-01      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-GROUPSNAPSHOT-02: View Snapshot diary screen when there is snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on Snapshot diary button
    ...
    ...     Expected Output:
    ...     - Navigate to Snapshot diary screen.
    ...     - The + button, pressing this to navigate to the View heart rhythm screen with the default selected point is the first data point of the latest day that having data.
    ...     - There shall be 3 tabs: All, Recent, Pending,
    ...     - There is a back button to navigate to the previous screen.
    [Tags]     BIOC-BIOHEART-GROUPSNAPSHOT-02      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-GROUPSNAPSHOT-03: View snapshot list in the All tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on Snapshot diary button
    ...
    ...     Expected Output:
    ...     - All tab is default.
    ...     - Snapshots shall be grouped by week (from Sunday to Saturday) according to start time: If there are multiple snapshots with the same Start time these one will sort by created time.
    ...     - Each item in the list displays the following information:
    ...         + Start time. Format: [MMM] [dd], [hh]:[mm]:[ss] [AM/PM].
    ...         + Duration. Format: [number] min.
    ...         + Creation time. Format:
    ...             * In the current day: Today [hh]:[mm] [AM/PM].
    ...             * Not the current day: [Mmm][dd].
    ...         + Heart rate range of ECG data (min-max heart rate).
    ...         + The thumbnail of the snapshot.
    ...             * The thumbnail shall capture the first 5 seconds of channel I of the snapshot.
    ...         + The Notes of the snapshot (if any).
    ...         + Icon star (if any).
    ...     - The user can press on any card to view the detail of the chosen snapshot.
    [Tags]     BIOC-BIOHEART-GROUPSNAPSHOT-03       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-GROUPSNAPSHOT-04: View snapshot list in the Recent tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on Snapshot diary button
    ...     3. Press on Recent tab
    ...
    ...     Expected Output:
    ...     - Navigate to Recent tab.
    ...     - The list should include the 10 most recently generated snapshots.
    ...     - Each item in the list displays the following information:
    ...         + Start time. Format: [MMM] [dd], [hh]:[mm]:[ss] [AM/PM].
    ...         + Duration. Format: [number] min.
    ...         + Creation time. Format:
    ...             * In the current day: Today [hh]:[mm] [AM/PMM].
    ...             * Not the current day: [Mmm][dd].
    ...         + Heart rate range of ECG data (min-max heart rate).
    ...         + The thumbnail of the snapshot.
    ...             * The thumbnail shall capture the first 5 seconds of channel I of the snapshot.
    ...         + The Notes of the snapshot (if any).
    ...         + Icon star (if any).
    ...     - Snapshots in this list shall be sorted by created time.
    ...     - The user can press on any card to view the detail of the chosen snapshot.
    [Tags]     BIOC-BIOHEART-GROUPSNAPSHOT-04     BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-GROUPSNAPSHOT-05: View snapshot list in the Pending tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on Snapshot diary button
    ...     3. Press on Pending tab
    ...
    ...     Expected Output:
    ...     - Navigate to Pending tab.
    ...     - The list should include snapshots that are in pending status (ECG data are being retrieved) or snapshots which do not have ECG data. Each item in the list displays the following information:
    ...         + Start time. Format: [MMM] [dd], [hh]:[mm]:[ss] [AM/PM].
    ...         + Duration. Format: [number] min.
    ...         + Status: can be either “Getting heart rhythm” or “Not available”.
    ...     - Snapshots in this list will be sorted by created time.
    ...     - If after 15 minutes the pending snapshot cannot be done, it shall be changed to a “Not available” snapshot.
    ...         + There shall be a button on this snapshot for the user to delete it.
    ...         + The no available snapshot shall be deleted automatically after 5 minutes since it changes to the Not available status.
    [Tags]     BIOC-BIOHEART-GROUPSNAPSHOT-05       BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-GROUPSNAPSHOT-06: View exceed snapshots
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on Snapshot diary button
    ...
    ...     Expected Output:
    ...     - The exceed snapshots will display in All and Recent tabs if this is free account.
    ...     - There are 50 snapshots existing in the All list, there shall be a message displayed on the snapshot: “No more space for this snapshot. You reached the limit of 50 snapshots”.
    ...     - There shall be: question_mark: button, by tapping on this button there shall be a pop-out: “Could not create more snapshots. Please delete old snapshots or upgrade to Bioshere+”.
    ...         + There shall be a “Learn more” button, when clicked it shall navigate the user to https://biosphere.bioheart.com
    ...         + There shall be a “Close” button, by tapping it the pop-out shall be closed.
    ...     - There shall be a message: “Deleted old snapshots, retry this snapshot?” and an “Okay” button, by tapping this button the app shall check for space in the All list, there shall be a message letting the user know the space is being checked.
    ...         + If there is no space in the snapshot list, the message shall be shown again.
    ...         + If there is space in the snapshot list, the snapshot will be created and displayed in the All and Recent list.
    ...     - All snapshots with Retry status will be automatically reloaded when the user upgrades to the Premium plan (including the Care plan).
    [Tags]     BIOC-BIOHEART-GROUPSNAPSHOT-06       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-01: View detail snapshot in All or Recent tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tabs
    ...     2. Press on Snapshot diary button
    ...     3. Select any snapshot
    ...
    ...     Expected Output:
    ...     - Detail snapshot screen is displayed with component:
    ...         + The heart rate range of the snapshot (min-max).
    ...         + The start time of the snapshot.
    ...             * Type: [Month] [day], [hour]:[minute]:[second] [AM/PM].
    ...             * Example: Aug 29, 10:47:00: AM.
    ...         + The duration of the snapshot.
    ...             * 1 minute to 5 minutes
    ...         + The ECG data of the snapshot is displayed in an ECG Viewer.
    ...             * The user can slide on the ECG to view.
    ...         + Enhance visual optional (default is OFF).
    ...         + The Star (default is OFF). If the user taps on this button, the snapshot shall be labeled as star and can be found in the Star section.
    ...         + Delete button to delete the snapshot.
    ...         + Add note button to add a note.
    ...             * After taking note, this button will be changed to View note. The user can press on to edit note.
    ...             * If the snapshot is added note from create step, this button will change to View note.
    ...         + Scroll bar, this will display the timeline of the snapshot. The user can slide on this to navigate the ECG viewer to the time he wants.
    ...             * Snapshot is created from device will have a hand icon at 30s point.
    ...         + The timeline will change according to the snapshot’s duration.
    ...             * There shall be a dot on the timeline display 1-minute duration.
    ...             * If the snapshot was created by pressing the button on the Bioheart device, there shall be a Yellow dot and an icon showing the time the user pressed the button on the device.
    ...         + When the user slides on the timeline the ECG will move also.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-01      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-02: View detail snapshot after created snapshot successfully in-app or from device
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Your heart rhythm screen
    ...     2. Create a snapshot in-app or from device
    ...     3. Stay on this screen and wait for snapshot complete
    ...     4. Press on View snapshot button in the Rhythm snapshot has been created popup
    ...
    ...     Expected Output:
    ...     - Detail snapshot screen is displayed with component:
    ...         + The heart rate range of the snapshot (min-max).
    ...         + The start time of the snapshot.
    ...             * Type: [Month] [day], [hour]:[minute]:[second] [AM/PM].
    ...             * Example: Aug 29, 10:47:00: AM.
    ...         + The duration of the snapshot.
    ...             * 1 minute to 5 minutes
    ...         + The ECG data of the snapshot is displayed in an ECG Viewer.
    ...             * The user can slide on the ECG to view.
    ...         + Enhance visual optional (default is OFF).
    ...         + The Star (default is OFF). If the user taps on this button, the snapshot shall be labeled as star and can be found in the Star section.
    ...         + Delete button to delete the snapshot.
    ...         + Add note button to add a note.
    ...             * After taking note, this button will be changed to View note. The user can press on to edit note.
    ...             * If the snapshot is added note from create step, this button will change to View note.
    ...         + Scroll bar, this will display the timeline of the snapshot. The user can slide on this to navigate the ECG viewer to the time he wants.
    ...             * Snapshot is created from device will have a hand icon at 30s point.
    ...         + The timeline will change according to the snapshot’s duration.
    ...             * There shall be a dot on the timeline display 1-minute duration.
    ...             * If the snapshot was created by pressing the button on the Bioheart device, there shall be a Yellow dot and an icon showing the time the user pressed the button on the device.
    ...         + When the user slides on the timeline the ECG will move also.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-02      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-03: View detail snapshot from notification center
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Notification center button
    ...     2. Select Rhythm snapshot item
    ...
    ...     Expected Output:
    ...     - Detail snapshot screen is displayed with component:
    ...         + The heart rate range of the snapshot (min-max).
    ...         + The start time of the snapshot.
    ...             * Type: [Month] [day], [hour]:[minute]:[second] [AM/PM]
    ...             * Example: Aug 29, 10:47:00: AM
    ...         + The duration of the snapshot.
    ...             * 1 minute to 5 minutes
    ...         + The ECG data of the snapshot is displayed in an ECG Viewer.
    ...             * The user can slide on the ECG to view.
    ...         + Enhance visual optional (default is OFF).
    ...         + The Star (default is OFF). If the user taps on this button, the snapshot shall be labeled as star and can be found in the Star section.
    ...         + Delete button to delete the snapshot.
    ...         + Add note button to add a note.
    ...             * After taking note, this button will be changed to View note. The user can press on to edit note.
    ...             * If the snapshot is added note from create step, this button will change to View note.
    ...         + Scroll bar, this will display the timeline of the snapshot. The user can slide on this to navigate the ECG viewer to the time he wants.
    ...             * Snapshot is created from device will have a hand icon at 30s point.
    ...         + The timeline will change according to the snapshot’s duration.
    ...             * There shall be a dot on the timeline display 1-minute duration.
    ...             * If the snapshot was created by pressing the button on the Bioheart device, there shall be a Yellow dot and an icon showing the time the user pressed the button on the device.
    ...         + When the user slides on the timeline the ECG will move also.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-03       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-04: Enhance visual
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to snapshot detail screen
    ...     2. Press on Enhance visual button
    ...
    ...     Expected Output:
    ...     - Enhance visual default is off when user presses on it, it will change to on.
    ...     - User can change it to default, by pressing again.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-04     BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-05: Mark as favorite for snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to snapshot detail screen
    ...     2. Press on Star button
    ...
    ...     Expected Output:
    ...     - The snapshot default is not marked as favorite, when user presses on star button to mark as favorite.
    ...     - User can change it to default, by pressing again.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-05      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-06: Delete snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to snapshot detail screen
    ...     2. Press on delete button
    ...
    ...     Expected Output:
    ...     2. Pop up a modal is displayed:
    ...         + Message: Are you sure you want to delete this rhythm snapshot?
    ...         + Delete button to delete the snapshot and navigate to the previous screen.
    ...         + Cancel button to close the modal without any other action.
    ...       - The snapshot is deleted, it will be removed from all and recent list.
    ...      - The notification of that snapshot will be deleted too, when user selects this notification in Notification center, there shall be an error popup.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-06      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-07: Add notes when creating snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Create a snapshot
    ...     2. Add note and tags for this snapshot
    ...
    ...     Expected Output:
    ...     - After user added notes or tags for snapshot, the Save button is enabled.
    ...     - Press on Save button, the note is saved for this snapshot.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-07      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-08: Cancel to add notes for snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Create a snapshot
    ...     2. Add note and tags for this snapshot
    ...     3. Press on Cancel button
    ...
    ...     Expected Output:
    ...     - When user has added notes or has not added notes and selects cancel, the add note process shall be completed and there shall be a modal: select Keep doing button is to close the modal and keep taking notes or Quit button to close the modal and cancel.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-08     BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-09: Skip to add notes for snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Create a snapshot
    ...     2. Press on Skip button
    ...
    ...     Expected Output:
    ...     - Add note popup is dismissed and snapshot is created without notes.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-09      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-10: Edit or update notes for snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to snapshot detail screen
    ...     2. Press on Add notes or View notes button
    ...
    ...     Expected Output:
    ...     - The Add notes button will changed to View notes button when user updates notes for snapshot or adds notes when creating snapshot.
    ...     - After user edited or updated notes, press on Save button to save.
    ...     - Or pressed on Cancel button to select Keep doing button is to close the modal and keep taking notes or Quit button to close the modal and cancel.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-10       BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-11: Export snapshot Report
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to snapshot detail screen
    ...     2. Press on Export a PDF report button
    ...
    ...     Expected Output:
    ...     2a. If the exporting processing is successful, the user shall be navigated to the PDF review screen.
    ...         - There shall be a [Share] button for the user to share the snapshot in the form of a PDF file.
    ...         - By clicking the button, the app shall display sharing options (depending on the OS of the phone). The user can select a sharing option to share the PDF file.
    ...         - The generated PDF shall always show when the user press the [Export a PDF report].
    ...         - When user edit tags, then press the [Export a PDF report] a new report shall be created.
    ...     2b. If the exporting processing fails, the app shall display an error message.
    ...         - If after 60s the app cannot complete generating the report (due to failed to call API), the app shall display the error message.
    ...         - The screen shall display the Try again button to re-generate the report.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-11     BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-SNAPSHOTDETAIL-12: Contents of the PDF file
    [Documentation]     Author: Han Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to snapshot detail screen
    ...     2. Press on Export a PDF report button
    ...
    ...     Expected Output:
    ...     2. Contents of the PDF file include:
    ...        - Patient information
    ...          + Full name
    ...          + Age
    ...          + Gender
    ...        - Snapshot information
    ...          + Start time
    ...          + Duration
    ...          + Heart rate range
    ...          + Notes
    ...            * Tags of a snapshot: the frame shall have a fixed the width and when the tags exceed 2 row length it shall auto change to the format: [number of tags hidden] more
    ...            * The text frame shall have with fixed width and maximum of 4 lines, when the text exceeds 4 lines the text auto transfer to “...”
    ...          + ECG data of the snapshot (10-sec strips)
    ...        - Heart rate information
    ...          + Heart rate of the day
    ...            * Max, min and average HR (bpm) of the day the snapshot was triggered.
    ...            * A graph displays HR values of the day the snapshot was triggered. Each data point in the graph includes max, min, and avg HR of a 30 minutes timeframe.
    ...          + Heart rate of the last 7 days
    ...            * Max, min and average HR (bpm) of the last 7 days since the day the snapshot was triggered. (The 7 days includes the day the snapshot was triggered).
    ...            * A graph displays HR values of the last 7 days since the day the snapshot was triggered. Each data point in the graph includes the max, min HR of a day.
    ...            * A week summary section which displays a list of HR ranges of each day of the last 7 days since the day the snapshot was triggered.
    ...        - A disclaimer section for the Bioheart device.
    [Tags]     BIOC-BIOHEART-SNAPSHOTDETAIL-12       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRHYTHM-01: View heart rhythm in the Heart rate chart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Heart rate card in Home screen
    ...     2. Press on View heart rhythm button
    ...
    ...     Expected Output:
    ...     - Navigate to View heart rhythm screen, ít will include components:
    ...         + Time picker includes 2 sections:
    ...             * Date section, format: [Mmm] [dd].
    ...             * Hour section, format: [hh] [AM/PM] – [hh] [AM/PM]
    ...         + Heart rate point graph
    ...             * Time frame: 1 hour, format: hh:mm (12 hours from 1 to 12).
    ...             * Each data point will cover heart rate data in 1 minute.
    ...             * User can tap on any point to select it.
    ...             * The tooltip will display the time of the selected point.
    ...             * If there is no heart rate data the point will not display
    ...         + Time note: it represents the time of the selected data point.
    ...             * Format: [Mmm] [dd], [yyyy] – [hh]:[mm] [AM/PM].
    ...         + Average heart rate: this will display the average heart rate data of the selected data point.
    ...         + Create snapshot button, tapping this button will start the create snapshot flow with the selected data point (refer to BIOC-SRS-17-FRS-12-003).
    ...         + ECG graph:
    ...             * If the ECG data of the selected data point were already backed up on the cloud, ECG data shall be displayed on the ECG chart.
    ...             * If the ECG data of the selected data point is not backed up on the cloud (within 30 days), there shall be a message: “The heart rhythm of this time period is not available for viewing. Please go to the Backup screen to check and back up the data” with the [Go to data sync] button. The user shall be navigated to the “Bioheart data backup” screen when pressing the hyperlink.
    ...             * If the selected data point does not contain any ECG data, the app displays a message: “The heart rhythm is not available.”
    ...             * If the user is on the free plan and the selected date is over 30 days from the present the screen will display a message as the design: link. There is a Biosphere+ button link to the website: https://biosphere.bioheart.com/.
    [Tags]     BIOC-BIOHEART-VIEWHEARTRHYTHM-01      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRHYTHM-02: View heart rhythm in Historical rhythm tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Historical rhythm tab in Home screen
    ...
    ...     Expected Output:
    ...     - Navigate to View heart rhythm screen, ít will include components:
    ...         + Time picker includes 2 sections:
    ...             * Date section, format: [Mmm] [dd].
    ...             * Hour section, format: [hh] [AM/PM] – [hh] [AM/PM]
    ...         + Heart rate point graph
    ...             * Time frame: 1 hour, format: hh:mm (12 hours from 1 to 12).
    ...             * Each data point will cover heart rate data in 1 minute.
    ...             * User can tap on any point to select it.
    ...             * The tooltip will display the time of the selected point.
    ...             * If there is no heart rate data the point will not display
    ...         + Time note: it represents the time of the selected data point.
    ...             * Format: [Mmm] [dd], [yyyy] – [hh]:[mm] [AM/PM].
    ...         + Average heart rate: this will display the average heart rate data of the selected data point.
    ...         + Create snapshot button, tapping this button will start the create snapshot flow with the selected data point (refer to BIOC-SRS-17-FRS-12-003).
    ...         + ECG graph:
    ...             * If the ECG data of the selected data point were already backed up on the cloud, ECG data shall be displayed on the ECG chart.
    ...             * If the ECG data of the selected data point is not backed up on the cloud (within 30 days), there shall be a message: “The heart rhythm of this time period is not available for viewing. Please go to the Backup screen to check and back up the data” with the [Go to data sync] button. The user shall be navigated to the “Bioheart data backup” screen when pressing the hyperlink.
    ...             * If the selected data point does not contain any ECG data, the app displays a message: “The heart rhythm is not available.”
    ...             * If the user is on the free plan and the selected date is over 30 days from the present the screen will display a message as the design: link. There is a Biosphere+ button link to the website: https://biosphere.bioheart.com/.
    [Tags]     BIOC-BIOHEART-VIEWHEARTRHYTHM-02      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRHYTHM-03: View heart rhythm in Snapshot diary screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tab
    ...     2. Press on Snapshot diary tab
    ...     3. Press on + button
    ...
    ...     Expected Output:
    ...     - Navigate to View heart rhythm screen, ít will include components:
    ...         + Time picker includes 2 sections:
    ...             * Date section, format: [Mmm] [dd]
    ...             * Hour section, format: [hh] [AM/PM] – [hh] [AM/PM]
    ...         + Heart rate point graph
    ...             * Time frame: 1 hour, format: hh:mm (12 hours from 1 to 12).
    ...             * Each data point will cover heart rate data in 1 minute.
    ...             * User can tap on any point to select it.
    ...             * The tooltip will display the time of the selected point.
    ...             * If there is no heart rate data the point will not display
    ...         + Time note: it represents the time of the selected data point.
    ...             * Format: [Mmm] [dd], [yyyy] – [hh]:[mm] [AM/PM]
    ...         + Average heart rate: this will display the average heart rate data of the selected data point.
    ...         + Create snapshot button, tapping this button will start the create snapshot flow with the selected data point (refer to BIOC-SRS-17-FRS-12-003).
    ...         + ECG graph:
    ...             * If the ECG data of the selected data point were already backed up on the cloud, ECG data shall be displayed on the ECG chart.
    ...             * If the ECG data of the selected data point is not backed up on the cloud (within 30 days), there shall be a message: “The heart rhythm of this time period is not available for viewing. Please go to the Backup screen to check and back up the data” with the [Go to data sync] button. The user shall be navigated to the “Bioheart data backup” screen when pressing the hyperlink.
    ...             * If the selected data point does not contain any ECG data, the app displays a message: “The heart rhythm is not available.”
    ...             * If the user is on the free plan and the selected date is over 30 days from the present the screen will display a message as the design: link. There is a Biosphere+ button link to the website: https://biosphere.bioheart.com/.
    [Tags]     BIOC-BIOHEART-VIEWHEARTRHYTHM-03      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRATE-01: View heart rate is uploading on the app after turn off and turn on internet
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device 
    ...     2. Turn off the internet
    ...     3. Wait more 30 minutes, turn on the internet
    ...     4. Check data Heart rate on the chart
    ...
    ...     Expected Output:
    ...     - Navigate to View heart rate screen, ít will include components:
    ...         + Time picker includes 2 sections:
    ...             * Date section, format: [Mmm] [dd]
    ...             * Hour section, format: [hh] [AM/PM] – [hh] [AM/PM]
    ...         + Heart rate point graph
    ...             * Time frame: 1 hour, format: hh:mm (12 hours from 1 to 12).
    ...             * Each data point will cover heart rate data in 1 minute.
    ...             * User can tap on any point to select it.
    ...             * The tooltip will display the time of the selected point.
    ...             * If there is no heart rate data the point will not display
    ...         + Time note: it represents the time of the selected data point.
    ...             * Format: [Mmm] [dd], [yyyy] – [hh]:[mm] [AM/PM]
    ...         + Average heart rate: this will display the average heart rate data of the selected data point.
    ...         + Create snapshot button, tapping this button will start the create snapshot flow with the selected data point (refer to BIOC-SRS-17-FRS-12-003).
    ...         + ECG graph:
    ...             * If the ECG data of the selected data point were already backed up on the cloud, ECG data shall be displayed on the ECG chart.
    ...             * If the ECG data of the selected data point is not backed up on the cloud (within 30 days), there shall be a message: “The heart rhythm of this time period is not available for viewing. Please go to the Backup screen to check and back up the data” with the [Go to data sync] button. The user shall be navigated to the “Bioheart data backup” screen when pressing the hyperlink.
    ...
    [Tags]     BIOC-BIOHEART-VIEWHEARTRATE-01      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRATE-02: View heart rate data can't disappear on the app after click Remove button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device,
    ...     2. Wait more 30 minutes, click Heart rate card
    ...     3. Check data Heart rate on the chart
    ...     4. Click Device tab
    ...     5. Click Remove Device button
    ...     6. Click Remove button
    ...        
    ...     Expected Output:
    ...     - The Heart rate data can't disappear on the app after click Remove button
    [Tags]     BIOC-BIOHEART-VIEWHEARTRATE-02      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRATE-03: View the heart rate data can't disappear on the app after click Remove and Reset button
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device,
    ...     2. Wait more 30 minutes, click Heart rate card
    ...     3. Check data Heart rate on the chart
    ...     4. Click Device tab
    ...     5. Click Remove Device button
    ...     6. Click Remove and Reset button
    ...
    ...     Expected Output:
    ...     - The Heart rate data can't disappear on the app after click Remove and Reset button
    [Tags]     BIOC-BIOHEART-VIEWHEARTRATE-03      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRATE-04: View the heart rate data display correct on the app after disconnect the bioheart device, login same account with mobile 1 and reconnect with Bioheart
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device,
    ...     2. Wait more 30 minutes, click Heart rate card
    ...     3. Check data Heart rate on the chart
    ...     4. Click Device tab
    ...     5. Click Remove Device button
    ...     6. Click Remove button
    ...     7. On the other mobile, login the app with the same account
    ...     8. Reconnect with the bioheart device
    ...     9. Wait more 30 minutes, click Heart rate card
    ...     10. Check data Heart rate on the chart
    ...
    ...     Expected Output:
    ...     - The heart rate data display correct on the app after disconnect the bioheart device, login same account with mobile 1 and reconnect with Bioheart
    [Tags]     BIOC-BIOHEART-VIEWHEARTRATE-04      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRATE-05: View the heart rate data display correct on the app after Click Remove button, login othe account with mobile 1 and reconnect with Bioheart
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device,
    ...     2. Wait more 30 minutes, click Heart rate card
    ...     3. Check data Heart rate on the chart
    ...     4. Click Device tab
    ...     5. Click Remove Device button
    ...     6. Click Remove button
    ...     7. On the other mobile, login the app with the other account
    ...     8. Reconnect with the bioheart device
    ...
    ...     Expected Output:
    ...     - The alert modal displays with content:" The device is disconnect..."
    [Tags]     BIOC-BIOHEART-VIEWHEARTRATE-05      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRATE-06: View the heart rate data display correct on the app after Click Remove Reset button, login same account with mobile 1 and reconnect with Bioheart
    [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device,
    ...     2. Wait more 30 minutes, click Heart rate card
    ...     3. Check data Heart rate on the chart
    ...     4. Click Device tab
    ...     5. Click Remove Device button
    ...     6. Click Remove and Reset button
    ...     7. On the other mobile, login the app with the other account
    ...     8. Reconnect with the bioheart device
    ...     9. Wait more 30 minutes, click Heart rate card
    ...     10. Check data Heart rate on the chart
    ...
    ...     Expected Output:
    ...     - The heart rate data display correct on the app after Click Remove Reset button, login same account with mobile 1 and reconnect with Bioheart
    [Tags]     BIOC-BIOHEART-VIEWHEARTRATE-06      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-VIEWHEARTRHYTHM-04: Select time-frame
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to View heart rhythm screen
    ...
    ...     Expected Output:
    ...     - On the timeline tab, there shall be 2 separate parts: date and hour.
    ...         + By default (when user navigate by any other method but not from the HR chart) the screen will display the latest date having data.
    ...         + By default (when user navigate by any other method but not from the HR chart), the screen will display the first minute of the latest date that has heart data.
    ...     - There is a [Calendar] button, tapping on this button there shall be a calendar bottom sheet for the user can select a specific date that the user wants to view.
    ...         + The calendar will auto-select the currently selected date.
    ...         + The date which has heart rhythm data shall have a yellow dot below.
    ...         + The user cannot select a date that is either before the date the user registers for an account or in the future.
    ...         + There shall be [Cancel] and [Select] buttons
    ...             * By tapping the [Select] button, the bottom sheet shall close and apply the selected date.
    ...             * By tapping the [Cancel] button, the app shall close the bottom sheet calendar.
    ...             * When the user selects the other date, the hour to be displayed on the chart shall be the first data point.
    ...     - After tapping the Select button
    ...         + The hour section will display the first hour that has data on the selected date.
    ...         + The app shall auto-select the first data point of the selected hour.
    ...         + The ECG graph shall reload and display the selected data point.
    ...     - There shall be 2 arrow buttons for the user to move to the next or the previous hour (the time cannot be in the future).
    ...         + Every time the user taps the arrow button the screen will reload and the first data
    ...     - By tapping on the hour section, there shall be a pop-out modal to select time
    ...         + The user can scroll on the modal to select the timeframe.
    ...         + The Select button, pressing this button the bottom sheet shall be closed and apply the selected hour.
    ...         + The Cancel button, pressing this button the bottom sheet shall be closed.
    ...     - After pressing Select, the screen shall display the heart rate data within the chosen timeframe.
    ...         + By default, the app shall display the first hour on the latest date which has Heart Rate data and select the first data point.
    ...         + The first heart rate data point of the selected hour will be selected.
    [Tags]     BIOC-BIOHEART-VIEWHEARTRHYTHM-04      BIOC-1.19.0    manual  R1
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-USERGUIDE-01: View Bioheart user guide screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Press on Devices tab
    ...     2. Press on Bioheart user guide card
    ...
    ...     Expected Output:
    ...     2. Navigate to the Bioheart user guide screen.
    ...        - There shall be 4 cards:
    ...          + Quick quides
    ...          + User manual
    ...          + How to guides
    ...             * How to pair Bioheart
    ...             * How to charge Bioheart
    ...             * How to update firmware
    ...             * Status light guide
    ...             * How to record heart rhythm
    ...        - Press on Next/Back button to navigate to previous image.
    ...        - Press on the X button to close the guide.
    [Tags]     BIOC-BIOHEART-USERGUIDE-01       BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-USERGUIDE-02: View How to wear Bioheart guide
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Bioheart user guide screen
    ...     2. Press on How to guides card
    ...     3. Press on How to wear Bioheart tab
    ...
    ...     Expected Output:
    ...     - How to wear Bioheart guide is displayed
    ...         + On each guide, there shall be an X button to close the guide.
    ...         + There shall be the Next/Back to navigate to the next or previous image.
    [Tags]     BIOC-BIOHEART-USERGUIDE-02      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-USERGUIDE-03: View How to factory reset Bioheart guide
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Bioheart user guide screen
    ...     2. Press on How to guides card
    ...     3. Press on How to factory Bioheart reset tab
    ...
    ...     Expected Output:
    ...     - How to factory reset guide Bioheart is displayed
    ...         + On each guide, there shall be an X button to close the guide.
    ...         + There shall be the Next/Back to navigate to the next or previous image.
    [Tags]     BIOC-BIOHEART-USERGUIDE-03      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-USERGUIDE-04: View How to record heart rhythm guide
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Bioheart user guide screen
    ...     2. Press on How to guides card
    ...     3. Press on How to factory Bioheart reset tab
    ...
    ...     Expected Output:
    ...     - How to factory reset guide Bioheart is displayed
    ...         + On each guide, there shall be an X button to close the guide.
    ...         + There shall be the Next/Back to navigate to the next or previous image.
    [Tags]     BIOC-BIOHEART-USERGUIDE-04      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-USERGUIDE-05: View FAQs
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Go to Bioheart user guide screen
    ...     2. Press on FAQs card
    ...
    ...     Expected Output:
    ...     - FAQs screen is displayed
    ...     - There shall be 5 cards: General, Warranty, Return Policy, Cleaning and Handling and Factory reset
    ...     - By default, the 1st question in each card will be auto expanded the answer.
    ...     - User can expand or collapse the answer by pressing on + button
    [Tags]     BIOC-BIOHEART-USERGUIDE-05      BIOC-1.19.0    manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-BIOSPHERE-01: Active Biosphere plan overview card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - This account has not paired Bioheart device or linked program
    ...
    ...     Test Steps:
    ...     1. Pair Bioheart device or link program in the 1st time
    ...     2. Press on Profile tab
    ...
    ...     Expected Output:
    ...     - Biosphere plan overview card is displayed
    [Tags]     BIOC-BIOHEART-BIOSPHERE-01     BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-BIOSPHERE-02: Check Free plan overview
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - This account has paired Bioheart device or linked program 1 time
    ...
    ...     Test Steps:
    ...     1. Press on Profile tab
    ...     2. Press Biosphere plan overview card
    ...
    ...     Expected Output:
    ...     - Navigate to Plan overview screen
    ...     - Biosphere+ type is Free.
    ...     - For Android device, there shall be Learn more button , press on this to navigate to biosphere.bioheart.com site
    [Tags]     BIOC-BIOHEART-BIOSPHERE-02      BIOC-1.19.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-BIOSPHERE-03: Activate Premium plan overview
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - This account has paired Bioheart device or linked program 1 time
    ...
    ...     Test Steps:
    ...     1. Go to https://biosphere.bioheart.com/
    ...     2. Activate subscription for this account
    ...     3. On the app, go to Profile tab
    ...     4. Press Biosphere plan overview card
    ...
    ...     Expected Output:
    ...     - There shall be notification after activated subscription.
    ...     - Biosphere+ type is Monthly or Annual.
    ...     - The statement “Your plan will automatically renew on [Next Purchase Date]".
    [Tags]     BIOC-BIOHEART-BIOSPHERE-03       BIOC-1.19.0    manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-BIOSPHERE-04: Cancel Premium plan overview
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - This account has paired Bioheart device or linked program 1 time
    ...     - This account has subscription
    ...
    ...     Test Steps:
    ...     1. Go to https://biosphere.bioheart.com/
    ...     2. Activate subscription for this account
    ...     3. On the app, go to Profile tab
    ...     4. Press Biosphere plan overview card
    ...
    ...     Expected Output:
    ...     - There shall be notification after cancel subscription.
    ...     - Biosphere+ type is Monthly or Annual until after purchase date will change to Free.
    ...     - The statement “Your plan will expire on[Next Purchase Date]".
    ...     - If the user having care plan and subscription at the same time, the app shall display the care plan case.
    [Tags]     BIOC-BIOHEART-BIOSPHERE-04        BIOC-1.19.0    manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-BIOSPHERE-05: Activate Enroll plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - This account has paired Bioheart device or linked program 1 time
    ...     - This account has subscription or Free
    ...
    ...     Test Steps:
    ...     1. Go to https://cardiac.biotricity.com/
    ...     2. Create program and start it
    ...     3. Go to Care plan tab and add device Bioheart for this account (Care plan type: RPM and CCM&RPM)
    ...     4. On the app, go to Services tab
    ...     5. Input program code to link program
    ...     6. Go to Profile tab
    ...     7. Press Biosphere plan overview card
    ...
    ...     Expected Output:
    ...     - There shall be notification after add Bioheart device,
    ...     - Biocare type is Enrolled.
    ...     - The statement “Your plan will be changed to a Free plan when a clinic stops your health care program".
    [Tags]     BIOC-BIOHEART-BIOSPHERE-05       BIOC-1.19.0    manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-BIOSPHERE-06: Stop Enroll plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - This account has paired Bioheart device or linked program 1 time
    ...     - This account has Enroll plan
    ...
    ...     Test Steps:
    ...     1. Go to https://cardiac.biotricity.com/
    ...     2. Go to Care plan tab and remove device Bioheart for this account (Care plan type: RPM and CCM&RPM)
    ...     3. On the app, go to Services tab
    ...     4. Go to Profile tab
    ...     5. Press Biosphere plan overview card
    ...
    ...     Expected Output:
    ...     - There shall be notification after remove Bioheart device,
    ...     - Biocare type is Free, Monthly or Annual base on care plan type before started add Bioheart device.
    ...     - The statement bases on Biosphere type.
    [Tags]     BIOC-BIOHEART-BIOSPHERE-06      BIOC-1.19.0    manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-BIOSPHERE-07: Activate Lifetime plan
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...     - This account has paired Bioheart device or linked program 1 time
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...     - For Lifetime plan, this account will set by BE.
    ...     - Biosphere+ type is Lifetime.
    ...     - The statement “You are in a lifetime membership".
    [Tags]     BIOC-BIOHEART-BIOSPHERE-07      BIOC-1.19.0    manual  R3
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-HEARTRATEDATA-01: Verify the Heartrate data save after delete app, download the app with other mobile and Log in with the same account
   [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device,
    ...     2. Wait more 30 minutes, click Heart rate card
    ...     3. Check data Heart rate on the chart
    ...     4. Delete the app
    ...     5. Download the app with other mobile
    ...     6. Log in the app with the same account
    ...     7. Click Home tab
    ...     8. Click Heart Rate card
    ...     9. Check the Heart rate on the chart
    ...
    ...     Expected Output:
    ...     - the Heartrate data save after delete app, download the app with other mobile and Log in with the same account
    [Tags]     BIOC-BIOHEART-HEARTRATEDATA-01      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BIOC-BIOHEART-HEARTRATEDATA-02: Verify the Heartrate data save after delete app, download the app and Log in with the same account
   [Documentation]     Author: Tu Nguyen
    ...
    ...     Pre-condition:
    ...     - Bioheart device is paired with app
    ...
    ...     Test Steps:
    ...     1. Wearing the Bioheart device,
    ...     2. Wait more 30 minutes, click Heart rate card
    ...     3. Check data Heart rate on the chart
    ...     4. Delete the app
    ...     5. Download the app
    ...     6. Log in the app with the same account
    ...     7. Click Home tab
    ...     8. Click Heart Rate card
    ...     9. Check the Heart rate on the chart
    ...
    ...     Expected Output:
    ...     - the Heartrate data save after delete app, download the app  mobile and Log in with the same account
    [Tags]     BIOC-BIOHEART-HEARTRATEDATA-02      BIOC-2.1.0    manual  R2
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

*** Keywords ***
SUITE SETUP
    ${APP_NODE}     Get Device Node
    Import Library    project_biocare_app/lib/mapp/Common.py     ${APP_NODE}     ${ENV}
    Start Biocare App
    ${USER}     Get Config Param    USER
    Sign In Biocare App    email=${USER}[username]      password=${USER}[password]
    ${RELEASE_VERSION}     Get Release Version
    Set Suite Metadata     version     ${RELEASE_VERSION}

SUITE TEARDOWN
    Quit All
