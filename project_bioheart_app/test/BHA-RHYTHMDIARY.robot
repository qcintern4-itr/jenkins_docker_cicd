*** Settings ***
Documentation   Bioheart app Rhythm diary test suite
Metadata    sid     BHA-RHYTHMDIARY
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-RHYTHMDIARY     mapp
Test Timeout    1h

*** Test Cases ***
BHA-RHYTHMDIARY-01: View rhythm diary screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Rhythm Diary tab
    ...
    ...     Expected Output:
    ...    - Navigate to Rhythm Diary screen
    ...    - In the 1st time navigate to rhythm diary screen, display instruction for create snapshot
    ...    - In case, there are snapshots
    ...         + There is Create Snapshot + button
    ...         + There are 3 tabs to view snapshot: All, Recent, Pending
    ...    - In case, there is no snapshot, display no snapshots screen with Create Snapshot + button
    ...    - There is Guide button, display the instruction for creating a snapshot from the Bioheart device
    ...    - There is a search button to search snapshot
    [Tags]      BHA-RHYTHMDIARY-01      BIOH-SRS-04-FRS-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-02: View instruction for first time create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Rhythm Diary tab
    ...
    ...     Expected Output:
    ...    - There shall be a pop out instruction with 5 screen as following image.
    ...    - There shall be “Ok, next” button and “Back” button at the bottom of each screen, tapping these buttons shall navigate user to later or previous screen.
    ...    - There shall be a “Ok, got it” button at the last screen to replace “Ok, next” button, tapping this button shall close the instruction.
    ...    - There shall be a 🇽 button on the top of each screen to close the instruction
    [Tags]      BHA-RHYTHMDIARY-02      BIOH-SRS-04-FRS-01-001       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-03: View rhythm diary screen when there is no snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Rhythm Diary tab
    ...
    ...     Expected Output:
    ...    - There is Creata snapshot button, pressing this to create snapshot
    ...    - There shall be a card display
    ...         + Message as design
    ...         + Guide button to navigate to the record rhythm from Bioheart device screen.
    ...         + X button to close the card and this will never show up again.
    ...    - After navigating to the recorded rhythm from Bioheart device screen
    ...         + If the user presses the back button on this screen, they will be navigated back to the previous screen (rhythm diary).
    [Tags]      BHA-RHYTHMDIARY-03      BIOH-SRS-04-FRS-01-002       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-04: View rhythm diary screen when there are snapshots
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Rhythm Diary tab
    ...
    ...     Expected Output:
    ...    - There shall be “Create snapshot” button, when tap this button the user shall be navigated to “Create snapshot” screen
    ...    - There shall be a card display
    ...         + Message: “Record rhythm from Bioheart device”
    ...         + Guide button to navigate to the record rhythm from Bioheart device screen.
    ...         + X button to close the card and this will never show up again
    ...    - After navigating to the recorded rhythm from Bioheart device screen
    ...         + If the user presses the back button on this screen, they will be navigated back to the previous screen (rhythm diary).
    ...    - On the “Rhythm diary” screen, snapshots will be listed in 3 forms, each will be display in difference tabs: All snapshots, Recent snapshot and Pending snapshots
    ...    - The user can press on any card to view the detail of the chosen snapshot
    ...    - [Create snapshot] button, pressing this button will create a snapshot
    ...    - Search button, pressing this will navigate the user to the search snapshot screen
    [Tags]      BHA-RHYTHMDIARY-04      BIOH-SRS-04-FRS-01-003       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-05: View all snapshots tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm Diary screen
    ...
    ...     Test Steps:
    ...    - Press on All tab
    ...
    ...     Expected Output:
    ...    - Navigate to All snapshots list
    ...    - Snapshots shall be grouped by week (from Sunday to Saturday) according to start time
    ...         + These weekly groups shall be sorted by created time
    ...    - Each item in the list displays the following information:
    ...         + Start time.
    ...         + Duration.
    ...         + Creation time.
    ...         + Heart rate range of ECG data.
    ...         + The thumbnail of the snapshot
    ...             * The thumbnail shall capture the first 5 seconds of channel I of the snapshot
    ...         + The Notes of the snapshot (if any).
    ...    - If the user’s account is not a premium account and there are 50 snapshots existing in the all list, there shall be a message display on the snapshot: “No more space for this snapshot. You reached the limit of 50 snapshots”
    ...         + There shall be: question_mark: button, by tapping on this button there shall be a pop-out: “Could not create more snapshots. Please delete old snapshots or upgrade to Bioshere+”.
    ...             * There shall be a “Learn more” button, when clicked it shall navigate the user to https://biosphere.bioheart.com
    ...             * There shall be a “Close” button, by tapping it the pop-out shall be closed
    ...         + There shall be a message: “Deleted old snapshots, retry this snapshot?” and an “Okay” button, by tapping this button the app shall check for space in the all list, there shall be a message letting the user know the space is being checked
    ...             * If there is no space in the snapshot list, the message shall be shown again.
    ...             * If there is space in the snapshot list, the snapshot will be created and displayed in the all list
    ...         + All snapshots with Retry status will be automatically reloaded when the user upgrade to Premium plan (including Biocare plan).
    [Tags]      BHA-RHYTHMDIARY-05      BIOH-SRS-04-FRS-01-003       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-06: View recent snapshots tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm Diary screen
    ...
    ...     Test Steps:
    ...    - Press on Recent tab
    ...
    ...     Expected Output:
    ...    - Navigate to Recent snapshots list
    ...    - The list should include the 10 most recent generated snapshots.
    ...    - Each item in the list displays the following information:
    ...         + Start time.
    ...         + Duration.
    ...         + Creation time.
    ...         + Star button: pressing on this will star the snapshot, pressing again will unstart it.
    ...         + Heart rate range of ECG data.
    ...         + The thumbnail of the snapshot.
    ...             * The thumbnail shall capture the first 5 seconds of channel I of the snapshot
    ...         + The Notes of the snapshot (if any).
    ...    - Snapshots in this list shall be sorted by created time.
    ...    - If the user’s account is not a premium account and there are 50 snapshots existing in the snapshot list, there shall be a message display on the snapshot: “No more space for this snapshot. You reached the limit of 50 snapshots”
    ...         + There shall be: question_mark: button, by tapping on this button there shall be a pop out: “Could not create more snapshots. Please delete old snapshots or upgrade to Bioshere+” .
    ...             * There shall be a “Learn more” button, when clicked it shall navigate the user to website: https://biosphere.bioheart.com
    ...             * There shall be a “Close” button, by tapping it the pop out shall be closed
    ...         +There shall be a message: “Deleted old snapshots, retry this snapshot?” and a “Okay” button, by tapping this button the app shall check for space in snapshot list, there shall be a message letting user know the space is being checked.
    ...             * If there is no space in the snapshot list, the message shall be show again.
    ...             * If there is space in the snapshot list, the snapshot will be created and displayed in the recent list
    [Tags]      BHA-RHYTHMDIARY-06      BIOH-SRS-04-FRS-01-003       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-07: View pending snapshots tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm Diary screen
    ...
    ...     Test Steps:
    ...    - Press on Pending tab
    ...
    ...     Expected Output:
    ...    - Navigate to Pending snapshots list
    ...    - The list should include snapshots that are in pending status (ECG data are being retrieved) or snapshots which do not have ECG data. Each item in the list displays the following information
    ...         + Start time
    ...         + Duration
    ...         + Star button: pressing on this will star the snapshot, pressing again will unstart it.
    ...         + Creation time
    ...         + Status: can be either “Getting heart rhythm” or “Heart rhythm not available”.
    ...    - Snapshots in this list will be sorted by created time.
    ...    - If after 15 minutes the pending snapshot cannot be done, it shall be changed to a “Not available” snapshot
    ...         + There shall be a button on this snapshot for the user to delete it.
    ...         + The no available snapshot shall be deleted automatically after 5 minutes
    [Tags]      BHA-RHYTHMDIARY-07      BIOH-SRS-04-FRS-01-003       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-08: View the instruction for creating a snapshot from the Bioheart device
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm Diary screen
    ...
    ...     Test Steps:
    ...    - Press on Guide button
    ...
    ...     Expected Output:
    ...    - There shall be a card display
    ...         + Guide button to navigate to the record rhythm from Bioheart device screen.
    ...         + X button to close the card and this will never show up again
    ...    - After navigating to the recorded rhythm from Bioheart device screen
    ...         + If the user presses the back button on this screen, they will be navigated back to the previous screen (rhythm diary).
    ...    - Press on x button, the banner is disappered and not appeared again
    [Tags]      BHA-RHYTHMDIARY-08      BIOH-SRS-04-FRS-01-004       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-09: Check display notification bedge in rhythm diary
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - There should be a yellow dot to indicate the new snapshot has been created.
    ...    - The yellow dot disappears once the user taps on the Rhythm diary
    ...    - In case: user is on the Rhythm diary screen
    ...         + The yellow dot still appears on the Rhythm diary.
    ...         + The yellow dot only disappears when user taps on the Rhythm diary again
    [Tags]      BHA-RHYTHMDIARY-09      BIOH-SRS-04-FRS-01-005       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-10: Retry exceed snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - There are exceed snapshots
    ...
    ...     Test Steps:
    ...    - Press on Okay button
    ...
    ...     Expected Output:
    ...    - In case the snapshot is created successfully but not displayed due to a lack of storage (Free plan user). There should be a message to let user know the reason why it is not displaying snapshots
    ...    - User is able to retry these snapshots by tapping on the Okay button: [Both All and Recent tab]
    ...         + In case, Successfully creating a snapshot
    ...             * The snapshot shall be displayed in week which is the previous start time.
    ...             * The snapshot also appears in the Recent tab
    ...         + In case, Failed to create a snapshot
    ...             * There should be a message to let user know the reason why it is not displaying snapshots
    ...    - All snapshots with Retry status will be automatically reloaded when user upgrades to Premium plan
    [Tags]      BHA-RHYTHMDIARY-10      BIOH-SRS-04-FRS-01-006       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-11: View snapshot detail
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm Diary screen
    ...
    ...     Test Steps:
    ...    - Press on any snapshot
    ...
    ...     Expected Output:
    ...    - Navigate to snapshot detail screen
    ...    - The heart rate range of the snapshot (min-max).
    ...    - The start time of the snapshot
    ...         + Type: [Month] [day], [hour]:[minute]:[second] [AM/PM].
    ...         + Example: Aug 29, 10:47:00:AM
    ...    - The duration of the snapshot
    ...         + 1 minute to 5 minutes
    ...    - The ECG data of the snapshot is displayed in an ECG Viewer
    ...         + The user can slide on the ECG to view
    ...    - Enhance visual optional (default is OFF).
    ...    - The Star (default is OFF).
    ...    - Delete button to delete snapshot.
    ...    - Export a PDF report button to export snapshot report.
    ...    - Add note button to add note.
    ...         + After take note, this button will be change to view note. The user can press on to edit note
    ...         + If the snapshot is added note from create step, this button will change to view note
    ...    - Scroll bar, this will display the timeline of the snapshot. The user can slide on this to navigate the ECG viewer to the time he wants.
    ...    - Zoom button to zoom snapshot (default 1x).
    [Tags]      BHA-RHYTHMDIARY-11      BIOH-SRS-04-FRS-02-001       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-12: Export snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Snapshot detail screen
    ...
    ...     Test Steps:
    ...    - Press on Export button
    ...
    ...     Expected Output:
    ...    - The app shall start exporting the ECG data to PDF and there shall be a loading popup display with a message telling the user to wait for the exporting processing to be completed.
    ...         + If the exporting processing is successful, the user shall be navigated to the PDF review screen
    ...             * There shall be a [Share] button for the user to share the snapshot in the form of a PDF file.
    ...             * By clicking the button, the app shall display sharing options (depending on the OS of the phone). The user can select a sharing option to share the PDF file
    ...         + If the exporting processing is failed, the app shall display an error message
    ...    - Contents of the PDF file include
    ...         + Patient information
    ...             * Full name
    ...             * Age
    ...             * Gender
    ...         + Snapshot information
    ...             * Start time
    ...             * Duration
    ...             * Heart rate range
    ...             * Notes
    ...                  Tags of a snapshot
    ...             * ECG data of the snapshot (10-sec strips)
    ...         + Heart rate information
    ...             * Heart rate of the day
    ...                  Max, min and average HR (bpm) of the day the snapshot was triggered.
    ...                  A graph displays HR values of the day the snapshot was triggered. Each data point in the graph includes max, min, and avg HR of a 30 minutes timeframe
    ...             * Heart rate of the last 7 days
    ...         + A disclaimer section for the Bioheart device.
    ...                  Max, min and average HR (bpm) of the last 7 days since the day the snapshot was triggered. (The 7 days includes the day the snapshot was triggered).
    ...                  A graph displays HR values of the last 7 days since the day the snapshot was triggered. Each data point in the graph includes th max, min HR of a day.
    ...                  A week summary section which displays a list of HR ranges of each day of the last 7 days since the day the snapshot was triggered
    [Tags]      BHA-RHYTHMDIARY-12      BIOH-SRS-04-FRS-02-003       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-13: View timeline bar and view on ECG
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Snapshot detail screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - The timeline will change according to the snapshot’s duration
    ...         + There shall be a dot on the timeline display1-minutenute duration.
    ...         + If the snapshot was created by pressing the button on the Bioheart device, there shall be a Yellow dot and an icon showing the time the user pressed the button on the device
    ...    - When the user slides on the timeline the ECG will move also
    [Tags]      BHA-RHYTHMDIARY-13      BIOH-SRS-04-FRS-02-004       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-14: Zoom snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Snapshot detail screen
    ...
    ...     Test Steps:
    ...    - Press on zoom icon
    ...
    ...     Expected Output:
    ...    - There shall be 5 Zoom levels. Each level corresponds to the speed of the ECG recorded value:
    ...         + 1x: 25 mm/s
    ...         + 2x: 50 mm/s
    ...         + 3x: 75 mm/s
    ...         + 4x: 100 mm/s
    ...         + 5x: 200 mm/s
    ...    - The default speed should be 25 mm/s.
    ...    - The chosen speed should be displayed at the top of the Zoom icon
    ...         + If User presses on the Zoom icon again, the current chosen Zoom level should be highlighted in blue
    [Tags]      BHA-RHYTHMDIARY-14      BIOH-SRS-04-FRS-02-005       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-15: Rotate snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Snapshot detail screen
    ...
    ...     Test Steps:
    ...    - Rotates the screen of the phone
    ...
    ...     Expected Output:
    ...    - The view of the snapshot detail will rotate also.
    ...    - The ECG view will display
    ...    - View your snapshot's ECG strip with multiple zoom sizes.
    [Tags]      BHA-RHYTHMDIARY-15      BIOH-SRS-04-FRS-02-006       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-16: Delete snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Snapshot detail screen
    ...
    ...     Test Steps:
    ...    - Press on Delete button
    ...
    ...     Expected Output:
    ...    - Pressing on the Delete button will pop up a modal
    ...         + Message: Are you sure you want to delete this rhythm snapshot?
    ...         + Delete button to delete the snapshot and navigate to the previous screen.
    ...         + Cancel button to close the modal without any other action
    ...    - If the snapshot is deleted, it will be removed from the all and recent list. The notification of that snapshot will be deleted too
    [Tags]      BHA-RHYTHMDIARY-16      BIOH-SRS-04-FRS-02-002       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SNAPSHOT-01: View heart rhythm screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm Diary screen
    ...
    ...     Test Steps:
    ...    - Press on Create Snapshot + button
    ...
    ...     Expected Output:
    ...    - Naviagte to Heart rhythm screen
    ...    - On the timeline tab, there shall be 2 separate parts: date and hour. The user can tap on the hour part to choose a time
    ...         + There shall be 2 arrow buttons for the user to move to the next or the previous hour (the time cannot be in the future).
    ...    - By tapping on the hour part, there shall be a pop-out modal to select time
    ...         + The user can scroll on the modal to select the timeframe.
    ...         + Done button, pressing this button the modal shall be closed and all the changes shall be saved.
    ...         + Cancel button, pressing this button the modal shall be close and all the changes shall be canceled
    ...    - After pressing Done, the screen shall display the heart rate data within the chosen timeframe.
    ...    - The timeframe shall display the first hour on the latest date which has Heart Rate data.
    ...    - There is an HR chart that will display a dot chart of heart rate values of the selected hour
    ...         + If there are no HR values displayed on the HR chart. There shall be a message: “No heart rhythm is recorded”.
    ...    - When the user selects a data point on the HR chart
    ...         + The Heart rate value and the time shall be displayed.
    ...         + If the ECG data of the selected data point were already backed up on the cloud, ECG data shall be displayed on the ECG chart.
    ...         + If the ECG data of the selected data point is not backed up on the cloud, there shall be a message: “The heart rhythm of this time period is not available for viewing. Please go to the Backup screen to check and back up the data” with the [Go to backup] hyperlink. The user shall be navigated to the “Bioheart data backup” screen when pressing the hyperlink
    ...    - On the timeline tab, there shall be 2 separate parts: date and hour. The user can tap on the hour part to choose a time
    ...         + There shall be 2 arrow buttons for the user to move to the next or the previous hour
    ...    - By tapping on the hour part, there shall be a pop-out modal to select time
    ...         + The user can scroll on the modal to select the timeframe.
    ...         + Done button, pressing this button the modal shall be closed and all the changes shall be saved.
    ...         + Cancel button, pressing this button the modal shall be close and all the changes shall be canceled
    ...    - After pressing Done, the screen shall display the heart rate data within the chosen timeframe
    ...    - There is a [Calendar] button for the user can select a specific date that the user wants to view. The “Calendar” screen shall display the following information
    ...         + The date which has heart rhythm data shall be displayed differently than the date without heart rhythm data.
    ...         + The user cannot select the date without heart rhythm data.
    ...         + There shall be a chart that displays a heart rhythm in one day, the user shall be able to select the hour on it.
    ...         + The date on the calendar and the hour on the chart shall be the time on the “Heart rate data” screen.
    ...         + When the user selects the other date, the hour to be displayed on the chart shall be the first data point.
    ...         + The user cannot select a date that is either before the date the user registers for an account or is in the future.
    ...         + There shall be a [Cancel] and [Select] button
    ...             • [Select] button, the selected date and hour shall be shown in the “Heart Rhythm” screen, and the minute to be displayed on the ECG graph shall be the first data point.
    ...             • [Cancel] button, the user shall be navigated to the “Heart Rhythm” screen
    ...         + If the user is on a Free plan, they can only View Heart rate data within the last 30 days. If the time of the selected data point is older than 30 days, there shall be a message “You can only View Heart rate data of the last 30 days” displayed instead of the heart rhythm data. There shall be a link for the user to navigate to the [Plan Overview] screen where they can find information on the Biosphere+ plan
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]      BHA-RHYTHMDIARY-SNAPSHOT-01       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SNAPSHOT-02: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Heart Rhythm screen
    ...
    ...     Test Steps:
    ...    - Select date/time
    ...    - Press on Create Snapshot + button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Add notes and tags
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]      BHA-RHYTHMDIARY-SNAPSHOT-02      BIOH-SRS-04-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SNAPSHOT-03: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Heart Rhythm screen
    ...
    ...     Test Steps:
    ...    - Select date/time
    ...    - Press on Create Snapshot + button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Skip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]      BHA-RHYTHMDIARY-SNAPSHOT-03      BIOH-SRS-04-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SNAPSHOT-04: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Heart Rhythm screen
    ...
    ...     Test Steps:
    ...    - Select date/time
    ...    - Press on Create Snapshot + button
    ...    - Select duration
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-RHYTHMDIARY-SNAPSHOT-04      BIOH-SRS-04-FRS-03       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SEARCH-01: View search snapshot screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm Diary screen
    ...
    ...     Test Steps:
    ...    - Press on Search icon
    ...
    ...     Expected Output:
    ...    - Naviagte to Search snapshot screen
    ...    - User can search snapshot with tags, date, starred and duration
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]      BHA-RHYTHMDIARY-SEARCH-01       BIOH-SRS-04-FRS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SEARCH-02: Search snapshot with tags
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Search snapshot screen
    ...
    ...     Test Steps:
    ...    - Press on search snapshot with tags field
    ...    - Enter keyword
    ...
    ...     Expected Output:
    ...    - Display all snapshots include keyword
    [Tags]      BHA-RHYTHMDIARY-SEARCH-02       BIOH-SRS-04-FRS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SEARCH-03: Search snapshot with date
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Search snapshot screen
    ...
    ...     Test Steps:
    ...    - Press on date button
    ...    - Select date that user wants to search
    ...
    ...     Expected Output:
    ...    - Display all snapshots in date that user selected
    [Tags]      BHA-RHYTHMDIARY-SEARCH-03       BIOH-SRS-04-FRS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SEARCH-04: Search snapshot with star
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Search snapshot screen
    ...
    ...     Test Steps:
    ...    - Press on starred button
    ...
    ...     Expected Output:
    ...    - Display all snapshots have starred
    [Tags]      BHA-RHYTHMDIARY-SEARCH-04       BIOH-SRS-04-FRS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SEARCH-05: Search snapshot with duration
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Search snapshot screen
    ...
    ...     Test Steps:
    ...    - Press on duration button
    ...    - Select duration that user wants to search
    ...
    ...     Expected Output:
    ...    - Display all snapshots have duration that user selected
    [Tags]      BHA-RHYTHMDIARY-SEARCH-05       BIOH-SRS-04-FRS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-SEARCH-06: Search snapshot with combine conditions
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Search snapshot screen
    ...
    ...     Test Steps:
    ...    - Select conditions that user wants to search
    ...
    ...     Expected Output:
    ...    - Display all snapshots have conditions that user selected
    [Tags]      BHA-RHYTHMDIARY-SEARCH-06       BIOH-SRS-04-FRS-04       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-HELPCENTER-01: View Center button support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Center button item
    ...
    ...     Expected Output:
    ...    - Navigate to Center button guide
    ...    - User can navigate back to previous screen by pressed on back button
    ...    - User can move to next/previous step by swiping left/right on the screen
    [Tags]     BHA-RHYTHMDIARY-HELPCENTER-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-HELPCENTER-02: View View heart rhythm support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Historical data item
    ...
    ...     Expected Output:
    ...    - Navigate to View heart rhythm guide
    [Tags]     BHA-RHYTHMDIARY-HELPCENTER-02     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-HELPCENTER-03: View Status guideline support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on Status lights item
    ...
    ...     Expected Output:
    ...    - Navigate to Status guideline guide
    [Tags]     BHA-RHYTHMDIARY-HELPCENTER-03     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-RHYTHMDIARY-HELPCENTER-04: View FAQs support
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Rhythm diary screen
    ...
    ...     Test Steps:
    ...    - Press on Help center button
    ...    - Press on FAQs item
    ...
    ...     Expected Output:
    ...    - Navigate to FAQs guide
    [Tags]     BHA-RHYTHMDIARY-HELPCENTER-04     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
