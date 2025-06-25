*** Settings ***
Documentation  Bioheart portal Snapshot test suite
Metadata    sid   BHP-SNAPSHOT
Metadata  owner   Linh Tran
Library     corelib/WebHandler.py   ${BROWSER}  ${HEADLESS}
Library     project_bioheart_portal/lib/ConfigHandler.py   ${ENV}
Library     corelib/AssertionExtension.py

Suite Setup     Log    SUITE SETUP
Suite Teardown  Log    SUITE TEARDOWN
Force Tags  BHP-SNAPSHOT        web
Test Timeout  1h

*** Test Cases ***
BHP-SNAPSHOT-CREATESNAPSHOT-01: Create snapshot with default duration
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Create snapshot + button
    ...    - 3. Select date
    ...    - 4. Click on Create button
    ...    - 5. Enter notes into notes field or add tags
    ...    - 6. Click Save button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Create snapshot screen
    ...    - 3. Selected date is highlighted
    ...    - 4. There shall be Add Snapshot notes? modal
    ...    - 5. Enter notes successfully or add tags successfully and Save button is enabled
    ...    - 6. Snapshot is created and navigates to the Pending tab
    [Tags]  BHP-SNAPSHOT-CREATESNAPSHOT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-CREATESNAPSHOT-02: Create snapshot with optional duration
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Create snapshot + button
    ...    - 3. Select date
    ...    - 4. Select snapshot duration
    ...    - 5. Click on Create button
    ...    - 6. Enter notes into notes field or add tags
    ...    - 7. Click Save button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Create snapshot screen
    ...    - 3. Selected date is highlighted
    ...    - 4. Selected snapshot duration is displayed
    ...    - 5. There shall be Add Snapshot notes? modal
    ...    - 6. Enter notes successfully or add tags successfully and Save button is enabled
    ...    - 7. Snapshot is created and navigates to the Pending tab
    [Tags]  BHP-SNAPSHOT-CREATESNAPSHOT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-CREATESNAPSHOT-03: Create snapshot without notes
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Create snapshot + button
    ...    - 3. Select date
    ...    - 4. Select snapshot duration
    ...    - 5. Click on Create button
    ...    - 6. Click Skip button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Create snapshot screen
    ...    - 3. Selected date is highlighted
    ...    - 4. Selected snapshot duration is displayed
    ...    - 5. There shall be Add Snapshot notes? modal
    ...    - 6. Snapshot is created without notes and navigates to the Pending tab
    [Tags]  BHP-SNAPSHOT-CREATESNAPSHOT-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-CREATESNAPSHOT-04: Create snapshot without notes
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Create snapshot + button
    ...    - 3. Select date
    ...    - 4. Select snapshot duration
    ...    - 5. Click on Create button
    ...    - 6. Enter notes into notes field or add tags
    ...    - 7. Click Skip button
    ...    - 8. Click on No or Yes button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Create snapshot screen
    ...    - 3. Selected date is highlighted
    ...    - 4. Selected snapshot duration is displayed
    ...    - 5. There shall be Add Snapshot notes? modal
    ...    - 6. Enter notes successfully or add tags successfully and Save button is enabled
    ...    - 7. There shall be a pop-up modal
    ...    - 8. The modal is closed and keep on Notes screen or snapshot is created without notes and naviagte to the Pending tab
    [Tags]  BHP-SNAPSHOT-CREATESNAPSHOT-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-CREATESNAPSHOT-05: Check tags in the note
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Create snapshot + button
    ...    - 3. Select date
    ...    - 4. Select snapshot duration
    ...    - 5. Click on Create button
    ...    - 6. Click on tag tabs
    ...    - 7. Check detail in each tabs
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Create snapshot screen
    ...    - 3. Selected date is highlighted
    ...    - 4. Selected snapshot duration is displayed
    ...    - 5. There shall be Add Snapshot notes? modal
    ...    - 6. Selected tag tabs is highlighted
    ...    - 7. “Symptoms” tab - there is a list of symptoms
    ...            + Can’t sleep; Chest pain; Chest discomfort; Cough; Dizziness; Fatigue; Fever; Headache; Lightheadedness; Nausea; Numbness in arm(s) or leg(s); Palpitations; Poor appetite; Shortness of breath; Sore throat; Sweating
    ...         "Activities & Diet” tab - there is a list of activities and diet
    ...            + Cycling; Exercised; Running; Swimming; Walking; Woke up; Alcohol; Caffeine
    ...         “Mood” tab
    ...            + Anxiety; Relaxed; Stressed; Slept well; Slept poorly
    ...         Once the user selects a tag, it shall display in the selected status
    ...         User can remove a selected tag
    [Tags]  BHP-SNAPSHOT-CREATESNAPSHOT-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-CREATESNAPSHOT-06: Search tags in the notes
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Create snapshot + button
    ...    - 3. Select date
    ...    - 4. Select snapshot duration
    ...    - 5. Click on Create button
    ...    - 6.Enter the keyword
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Create snapshot screen
    ...    - 3. Selected date is highlighted
    ...    - 4. Selected snapshot duration is displayed
    ...    - 5. There shall be Add Snapshot notes? modal
    ...    - 6. Enter keyword successfully
    ...            + If the result match any tags in the list, the list is displayed
    ...            + If the result does not match any tags in the list, there shall be a message: “No tags match your search”
    [Tags]  BHP-SNAPSHOT-CREATESNAPSHOT-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-CREATESNAPSHOT-07: View Create snapshot screen for free account
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Create snapshot + button
    ...    - 3. Click on i icon
    ...    - 4. Click on Close or Learn more button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Create snapshot screen
    ...    - 3. There shall be a pop-up modal
    ...    - 4. The modal is closed or navigate to the https://biosphere.bioheart.com
    ...         The calendar shall only be able to show data in the last 30 days
    ...         There shall be a dot under days that have heart rhythm data
    ...            + If the user chooses the day without heart rhythm data, the screen will show “No data to display”
    [Tags]  BHP-SNAPSHOT-CREATESNAPSHOT-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-01: View detail snapshot
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Press on any snapshot in All/Recent tab
    ...    - 3. Check components in detail snapshot
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. The heart rate range of the snapshot (min-max)
    ...         The start time of the snapshot
    ...            + Type: [Month] [day], [hour]:[minute]:[second] [AM/PM]
    ...         The duration of the snapshot (From 1m to 5ms)
    ...         The ECG data of the snapshot is displayed in an ECG Viewer
    ...            + The user can slide on the ECG to view
    ...         Enhance visual optional (default is OFF)
    ...         The Star (default is OFF)
    ...         Delete button to delete snapshot
    ...         Export a PDF report button to export snapshot report
    ...         Add note button to add note
    ...            + After take note, this button will be change to view note. The user can press on to edit note
    ...            + If the snapshot is added note from create step, this button will change to view note
    ...         Scroll bar, this will display the timeline of the snapshot. The user can slide on this to navigate the ECG viewer to the time he wants
    ...         Zoom button to zoom snapshot (default 1x)
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-02: Confirm to delete snapshot
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Press on any snapshot in All/Recent tab
    ...    - 3. Press on delete icon button
    ...    - 4. Press on Delete button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. There shall be pop-up modal
    ...    - 4. The snapshot is deleted
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-03: Cancel to delete snapshot
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Press on any snapshot in All/Recent tab
    ...    - 3. Press on delete icon button
    ...    - 4. Press on Cancel button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. There shall be pop-up modal
    ...    - 4. The modal is closed and keep on detail snapshot screen
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-04: Export snapshot
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Press on any snapshot in All/Recent tab
    ...    - 3. Press on export icon button
    ...    - 4. Press on share icon button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. Navigate to the Snapshot report screen
    ...    - 4. Sharing options are displayed
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-05: Check timeline bar and view on ECG
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on any snapshot in All/Recent tab
    ...    - 3. Slide on the timeline
    ...    - 4. Check timeline bar
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. The ECG is moved
    ...    - 4. The timeline is changed according to the snapshot’s duration
    ...         + There shall be a green dot on the timeline
    ...         + If the snapshot was created by pressing the button on the Bioheart device, there shall be a Yellow dot and an icon showing the time the user pressed the button on the device
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-06: Zoom snapshot
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on any snapshot in All/Recent tab
    ...    - 3. Check Zoom levels
    ...    - 4. Click on Zoom button
    ...    - 5. Click on Zoom button again
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. There shall be 5 Zoom levels. Each level corresponds to the speed of the ECG recorded value
    ...             + 1x: 25 mm/s
    ...             + 2x: 50 mm/s
    ...             + 3x: 75 mm/s
    ...             + 4x: 100 mm/s
    ...             + 5x: 200 mm/s
    ...         The default speed should be 25 mm/s
    ...    - 4. The chart is zoomed and the chosen speed should be displayed at the top of the Zoom icon
    ...    - 5. The current chosen Zoom level should be highlighted in blue
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-07: Mark as starred for snapshot
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on any snapshot in All/Recent tab
    ...    - 3. Click on star icon
    ...    - 4. Click on star icon again
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. Mark as star for snapshot
    ...    - 4. Mark as unstar for snapshot
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-VIEWSNAPSHOT-08: Edit note
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on any snapshot in All/Recent tab
    ...    - 3. Click Add notes button or View notes button
    ...    - 4. Clear notes in created snapshot
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The detail of the chosen snapshot is displayed
    ...    - 3. Navigate to the Notes screen
    ...    - 4. The View notes button is changed to Add notes button
    [Tags]  BHP-SNAPSHOT-VIEWSNAPSHOT-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-01: View rhythm diary screen when there is no created snapshot
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Check components in Rhythm diary screen
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. There shall be a Create snapshot button, a guide card a search bar and lists of snapshot are empty and listed in 3 forms (All, Recent and Pending)
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-02: View rhythm diary screen when there are created snapshots
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Check components in Rhythm diary screen
    ...    - 3. Press on any snapshot
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. There shall be a Create snapshot button, a guide card a search bar and lists of snapshot are listed in 3 forms (All, Recent and Pending)
    ...    - 3. The detail of the chosen snapshot is displayed
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-03: View the guide to create the snapshot from Bioheart device
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Guide button
    ...    - 3. Click on back icon button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the record rhythm from Bioheart device screen
    ...    - 3. Navigated back to the previous screen (rhythm diary)
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-04: Dimiss the guide to create the snapshot from Bioheart device
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on X icon button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. The card is closed and never show up again
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-05: View list of all snapshots
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Check list of snapshot in All tab
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Snapshots shall be grouped by week (from Sunday to Saturday) according to start time
    ...             + These weekly groups shall be sorted by created time
    ...         Each item in the list displays the following information
    ...             + Start time
    ...             + Duration
    ...             + Crated time
    ...             + HR range of ECG data
    ...             + The thumbnail of the snapshot
    ...                 * The thumbnail shall capture the first 5 seconds of channel I of the snapshot
    ...             + The Notes of the snapshot (if any)
    ...             + Yellow star icon (in any)
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-05      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-06: View list of all snapshots for free account
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...     - There are 50 snapshots existing in the all list
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Check component for free account with 50 snapshots existing
    ...    - 3. Click on question mark button
    ...    - 4. Click on Close or Learn more button
    ...    - 5. Click on Okay button
    ...    - 6. If user upgrades premium account
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. There shall be message No more space for this snapshot. You reached the limit of 50 snapshots
    ...    - 3. There shall be a pop-up modal
    ...    - 4. The modal is closed or navigate to the https://biosphere.bioheart.com
    ...    - 5. There shall be a message letting the user know the space is being checked
    ...         + If there is no space in the snapshot list, the message shall be shown again
    ...         + If there is space in the snapshot list, the snapshot will be created and displayed in the All list
    ...    - 6. All snapshots with Retry status will be automatically reloaded when the user upgrades to Premium plan (including the Biocare plan)
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-06      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-07: View list of recent snapshots
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Recent tab
    ...    - 3. Check list of snapshot in Recent tab
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Recent tab
    ...    - 3. The list should include the 10 most recent generated snapshots
    ...         Each item in the list displays the following information
    ...            + Start time.
    ...            + Duration.
    ...            + Creation time.
    ...            + Heart rate range of ECG data.
    ...            + The thumbnail of the snapshot.
    ...            + The thumbnail shall capture the first 5 seconds of channel I of the snapshot.
    ...            + The Notes of the snapshot (if any).
    ...            + Yellow star icon (in any)
    ...         Snapshots in this list shall be sorted by created time
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-07      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-08: View list of recent snapshots for free account
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...     - There are 50 snapshots existing in the all list
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Recent tab
    ...    - 3. Check component for free account with 50 snapshots existing
    ...    - 4. Click on question mark button
    ...    - 5. Click on Close or Learn more button
    ...    - 6. Click on Okay button
    ...    - 7. If user upgrades premium account
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Recent tab
    ...    - 3. There shall be message No more space for this snapshot. You reached the limit of 50 snapshots
    ...    - 4. There shall be a pop-up modal
    ...    - 5. The modal is closed or navigate to the https://biosphere.bioheart.com
    ...    - 6. There shall be a message letting the user know the space is being checked
    ...         + If there is no space in the snapshot list, the message shall be shown again
    ...         + If there is space in the snapshot list, the snapshot will be created and displayed in the All list
    ...    - 7. All snapshots with Retry status will be automatically reloaded when the user upgrades to Premium plan (including the Biocare plan)
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-RHYTHMDIARYSCREEN-09: View list of pending snapshots
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on Pending tab
    ...    - 3. Check list of snapshot in Pending tab
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Navigate to the Pending tab
    ...    - 3. The list should include snapshots that are in pending status (ECG data are being retrieved) or snapshots which do not have ECG data
    ...         Each item in the list displays the following information
    ...            + Start time
    ...            + Duration
    ...            + Creation time
    ...            + Status: can be either “Getting heart rhythm” or “Not available
    ...         Snapshots in this list will be sorted by created time
    ...         If after 15 minutes the pending snapshot cannot be done, it shall be changed to a “Not available” snapshot
    ...            + There shall be a button on this snapshot for the user to delete it
    ...            + The Not available snapshot shall be deleted automatically after 5 minutes
    [Tags]  BHP-SNAPSHOT-RHYTHMDIARYSCREEN-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-SEARCHSNAPSHOT-01: Search snapshot with tags
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Enter the tags
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. Enter the tags successfully and list of snapshot include tag is displayed
    [Tags]  BHP-SNAPSHOT-SEARCHSNAPSHOT-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-SEARCHSNAPSHOT-02: Search snapshot with date
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on more button
    ...    - 3. Click on Snapshot date button
    ...    - 4. Selecte date
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. List of searching options is displayed
    ...    - 3. Snapshot date button is highlighted
    ...    - 4. List of snapshot included date is displayed
    [Tags]  BHP-SNAPSHOT-SEARCHSNAPSHOT-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-SEARCHSNAPSHOT-03: Search snapshot with starred
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on more button
    ...    - 3. Click on star button
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. List of searching options is displayed
    ...    - 4. List of snapshots included star is displayed
    [Tags]  BHP-SNAPSHOT-SEARCHSNAPSHOT-03      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-SEARCHSNAPSHOT-04: Search snapshot with duration
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on more button
    ...    - 3. Click on Snapshot duration button
    ...    - 4. Selecte duration
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. List of searching options is displayed
    ...    - 3. Snapshot duration button is highlighted
    ...    - 4. List of snapshot included duration is displayed
    [Tags]  BHP-SNAPSHOT-SEARCHSNAPSHOT-04      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHP-SNAPSHOT-SEARCHSNAPSHOT-05: Search snapshot with mutiple options
    [Documentation]     Author:Linh Tran
    ...
    ...     Pre-condition:
    ...     - Open to https://biosphere.delta.bioheart.bioflux.io/login/
    ...     - The user is signed in web
    ...
    ...     Test Steps:
    ...    - 1. Click on Rhythm diary tab
    ...    - 2. Click on more button
    ...    - 3. Select more than one searching options
    ...
    ...     Expected Output:
    ...    - 1. Rhythm diary is displayed
    ...    - 2. List of searching options is displayed
    ...    - 3. List of snapshot included options is displayed
    [Tags]  BHP-SNAPSHOT-SEARCHSNAPSHOT-05      manual
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
