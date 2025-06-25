*** Settings ***
Documentation   Bioheart app Activity test suite
Metadata    sid     BHA-ACTIVITY
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-ACTIVITY     mapp
Test Timeout    1h

*** Test Cases ***
BHA-ACTIVITY-01: View workout card
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - On workout card
    ...         + There is View all button to view workout list
    ...         + There is Add new workout + button to add new workout
    ...         + Displayed latest workout information
    [Tags]     BHA-ACTIVITY-01      BIOC-SRS-10-FRS-01      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-ACTIVITY-02: View add workout screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press Add new workout + button
    ...    - Press on Add manually button
    ...
    ...     Expected Output:
    ...    - Navigate to Add workout screen
    ...    - There are 3 options about workout
    ...         + Walking
    ...         + Running
    ...         + Other
    ...             * If the user selects the Other workout type, there shall be an Activity name field for the user to input the name of the activity. Maximum 25 characters
    ...    - There are start time and duration fields
    ...         + There shall be a Start time field, if the user taps on it, there shall be a time-picker appear and the user can select the time
    ...             * The default time shall be the current day and the hour is 9:00 AM for the first time the user input. For later inputting, the default time shall be the hour of the last time inputting.
    ...             * The user can not select the time in the future
    ...         + There shall be a Duration field, if the user taps on it, there shall be a time-picker and the user can select the time. This field will be disabled if the start time is not filled.
    ...             * Max 2 hours 59 min.
    ...             * Min 0 hour 1 minute.
    ...             * Default: 30 min
    ...    - The Add button is disabled
    ...    - To close add workout screen by pressing on close button
    [Tags]     BHA-ACTIVITY-02     BIOC-SRS-10-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-ACTIVITY-MANUAL-01: Add workout manual
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Add workout screen
    ...
    ...     Test Steps:
    ...    - Choose a workout type
    ...    - Select start time
    ...    - Select duration
    ...    - Press on Add button
    ...
    ...     Expected Output:
    ...    - When user selects start time, duration field is enabled
    ...    - When user selects duration, the Add button is enabled
    ...    - When user presses on Add button,
    ...         + There is the popup with content "Your workout has been added successfully. Do you want to view detail now?"
    ...             * Press on View button to navigate to detail screen of the workout
    ...             * Press on Close button to close the popup
    ...         + The data will display in workout card in Summary screen
    ...    - If user selects close button, the data will not save, the add workout screen is closed
    [Tags]     BHA-ACTIVITY-MANUAL-01     BIOC-SRS-10-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-ACTIVITY-MANUAL-02: Add workout manual when the new workout is overlap
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Add workout screen
    ...
    ...     Test Steps:
    ...    - Choose a workout type
    ...    - Select start time
    ...    - Select duration
    ...    - Press on Add button
    ...
    ...     Expected Output:
    ...    - When user selects start time, duration field is enabled
    ...    - When user selects duration, the Add button is enabled
    ...    - When user presses on Add button,
    ...         + There is the popup with content "An activity already exists at the selected time. Do you want to add this one anyway?"
    ...             * Press on Save button to save the workout and navigate to Summary screen
    ...             * Press on Cancel button to close the popup
    [Tags]     BHA-ACTIVITY-MANUAL-02     BIOC-SRS-10-FRS-02      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BHA-ACTIVITY-WORKOUT-05: View Record workout screen
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is in Summary screen
#    ...
#    ...     Test Steps:
#    ...    - Press Add new workout + button
#    ...    - Press on Record a new workout button
#    ...
#    ...     Expected Output:
#    ...    - Navigate to record workout screen
#    ...    - There are 3 options about workout
#    ...         + Walking
#    ...         + Running
#    ...         + Other
#    ...             * If the user selects the Other workout type, there shall be an Activity name field for the user to input the name of the activity. Maximum 25 characters
#    ...    - The Start recording is disabled
#    ...    - User can navigate back to previous screen by pressed on back button
#    [Tags]     BHA-ACTIVITY-WORKOUT-05     BIOC-SRS-10-FRS-03      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BHA-ACTIVITY-WORKOUT-06: Record a workout
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is in Record workout screen
#    ...
#    ...     Test Steps:
#    ...    - Choose a workout
#    ...    - Press on Start recording button
#    ...
#    ...     Expected Output:
#    ...    - When user selects a workout, the Strat recording button is enabled
#    ...    - Press on Start recording, navigate to the workout screen
#    ...         + There shall be a start button.
#    ...             * If the user taps on this button, the stopwatch timer shall start counting. After that, the Start button shall change to the Pause button.
#    ...             * If the user taps on the Pause button, the stopwatch timer shall pause, and the button change to Resume.
#    ...             * If the user taps on the Resume button, the stopwatch timer shall resume, and the button change to Pause.
#    ...             * If the time on the stopwatch timer = 2h59m it will automatically end.
#    ...         + Press on End workout button
#    ...             * If the recording is saved successfully, there shall be a pop-up
#    ...                 o Message: Your recording has been saved
#    ...                 o Okay button to navigate to the detail screen of the recorded workout
#    ...             * If there is any error happen and the recording can not be saved
#    ...                 o Message: Something went wrong. Your recording could not be saved. Please try again.
#    ...                 o The Close button to close the modal and stay at the recording workout screen
#    ...             * If the recording is ended due to reaching maximum time
#    ...                 o Title: Ended recording
#    ...                 o Message: Your record has been expired.
#    ...                 o Okay button to close the modal and navigate back to the Summary screen and scroll to the Workout section
#    ...    - If the duration of the workout is not a full minute (example 15:12) the duration of the workout shall round up to a full minute (example 16 min)
#    [Tags]     BHA-ACTIVITY-WORKOUT-06     BIOC-SRS-10-FRS-03      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BHA-ACTIVITY-WORKOUT-07: View the workout section
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is in Summary screen
#    ...
#    ...     Test Steps:
#    ...
#    ...     Expected Output:
#    ...    - There shall be a Workout section in the Summary screen. In this section, it will display a card of the most recently added/recorded workout (based on created time). On the card, there shall be these components
#    ...         + Name of the workout
#    ...         + Duration: Type [hour] h [minutes] min. If the duration is lower than 1h the app shall display type [minutes] min.
#    ...         + Avg heart rate during the workout, type: [avg HR] bpm. If there is no heart rate data during the workout, display: - bpm.
#    ...         + The created time of the workout
#    ...             * If the day is the current day, display: Today.
#    ...             * If the day is not the current day, display: [Mmm] [dd].
#    ...    - There shall be a View all button. If the user taps on this button, the app shall navigate to the All workouts screen.
#    ...    - There shall be a Add new workout + butto. If user presses on this button, the bottom sheet workout option displaying.
#    ...    - If there is no record the Workout section shall not display
#    [Tags]     BHA-ACTIVITY-WORKOUT-07     BIOC-SRS-10-FRS-04-001      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-ACTIVITY-LIST-01: View the list off all workouts
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...
    ...     Test Steps:
    ...    - Press on View all button in the Workout card
    ...
    ...     Expected Output:
    ...    - Navigate to All workout screen
    ...    - The list of workouts shall be grouped by week based on start time
    ...         + If the group is in the current week display the name: This week.
    ...         + If the group is in the last week display the name: Last week.
    ...         + In other cases, the name shall display [dd] [Mnn] – [dd] [Mmm], [yyyy]
    ...    - Each card in the list shall has these components
    ...         + Name of the workout
    ...         + Duration: Type [hour] h [minutes] min. If the duration is lower than 1h the app shall display type [minutes] min.
    ...         + Avg heart rate during the workout, type: [avg HR] bpm. If there is no heart rate data during the workout, display: - bpm.
    ...         + The created time of the workout
    ...             * If the day is the current day, display: Today.
    ...             * If the day is not the current day, display: [Mmm] [dd].
    ...    - If the user taps on a workout card, the app shall navigate to the detail screen of that workout card
    ...    - User can navigate back to previous screen by pressing back button
    [Tags]     BHA-ACTIVITY-LIST-01     BIOC-SRS-10-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-ACTIVITY-LIST-02: View detail of a workout
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in All workout screen
    ...
    ...     Test Steps:
    ...    - Press on any workout
    ...
    ...     Expected Output:
    ...    - There shall be a title display the name of the workout.
    ...    - There shall be a time bar below the title. It shall include 2 components
    ...         + Start day: [Mmm] [dd], [yyyy].
    ...         + Duration: [hour] h [minutes] min
    ...    - There is an HR chart that will display a dot chart of heart rate values of the duration hour
    ...         + The timeframe of the chart shall cover all the workout duration
    ...    - When the user selects a data point on the HR chart
    ...         + If there are no HR values displayed on the HR chart. There shall be a message: “No heart rhythm is recorded”.
    ...         + The Heart rate value and the time shall be displayed.
    ...         + If the ECG data of the selected data point were already backed up on the cloud, ECG data shall be displayed on the ECG chart
    ...             o There is a [Create snapshot] button for the user to create a snapshot, related to BIOH-SRS-04-FRS-03.
    ...             o After the user confirms creating the snapshot the user shall be navigated to the [Pending snapshot] screen
    ...         + If the ECG data of the selected data point is not backed up on the cloud, there shall be a message: “The heart rhythm of this time period is not available for viewing. Please go to the Backup screen to check and back up the data” with the [Go to backup] hyperlink. The user shall be navigated to the “Bioheart data backup” screen when pressing the hyperlink
    ...    - Zoom ECG
    ...         + User zooms in on the ECG viewer by pressing the Zoom icon.
    ...         + There shall be 5 Zoom levels. Each level corresponds to the speed of the ECG recorded value
    ...             o 1x: 25 mm/s
    ...             o 2x: 50 mm/s
    ...             o 3x: 75 mm/s
    ...             o 4x: 100 mm/s
    ...             o 5x: 200 mm/s
    ...         + The default speed should be 25 mm/s.
    ...         + The chosen speed should be displayed at the top of the Zoom icon
    ...             o If User presses on the Zoom icon again, the current chosen Zoom level should be highlighted in blue
    ...    - Enhance visual ON/OFF. The user can press this button to turn on/off the enhance visual.
    ...    - There shall be an X button to navigate to the previous screen
    [Tags]     BHA-ACTIVITY-LIST-02     BIOC-SRS-10-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}