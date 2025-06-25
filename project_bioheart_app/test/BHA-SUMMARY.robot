*** Settings ***
Documentation   Bioheart app Summary test suite
Metadata    sid     BHA-SUMMARY
Metadata    owner   Linh Tran
Library     corelib/AssertionExtension.py

Force Tags      BHA-SUMMARY     mapp
Test Timeout    1h

*** Test Cases ***
BHA-SUMMARY-01: View Summry screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...    - Open the app
    ...
    ...     Expected Output:
    ...    - In Summary, there are components:
    ...         + Record heart rhythm card
    ...         + Heart rate
    ...             * The most recent Heart rate value and time are synced from the Bioheart device.
    ...             * A chart that displays the Heart rate of the most recent day having HR data synced from the Bioheart device
    ...         + RHR
    ...             * There shall be a card that displays the most recent Resting Heart Rate data of the user synced from the Bioheart device
    ...         + HRv
    ...             * There shall be a card that displays the most recent Heart Rate Variability data of the user synced from the Bioheart device
    ...         + Active minutes card
    ...             * In the case that the total active minutes of the current day is 0, the value of the most recent day will be displayed.
    ...             * If there is no day having active minutes, the value of the current day will be displayed
    ...         + Create snapshot button
    ...         + Health reports
    ...             * There shall be a UI card when pressed on shall navigate the user to the health reports list
    ...         + Device info section is connected
    ...             * Battery percentage
    ...             * Body contact status
    ...             * Device UI
    ...         + Sync data card
    ...         + Workout card
    ...         + Sleep schedule card
    ...         + Transition banner
    ...     - In case, the Bluetooth is off
    ...         + There is no Record heart rhythm card
    ...         + There is Bluetooth off card
    ...         + Device section is disconnected
    ...         + Sync data card is disabled
    ...     - There is Bioheart firmware update card when the firmware is not latest, and it will not hidden when Bluetooth is off
    [Tags]     BHA-SUMMARY-01       BIOH-SRSR-03-FRS-01     BIOC-SRS-03-FRS-02-004      BIOC-SRS-03-FRS-03-001      BIOC-SRS-03-FRS-04-001      BIOC-SRS-03-FRS-05-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-01: View Live heart rhythm screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is signed in app
    ...
    ...     Test Steps:
    ...    - Press on Tap to view card
    ...
    ...     Expected Output:
    ...    - Navigate to the Live heart rhythm screen
    ...    - There is Start Recording button, press on it to create snapshot
    ...    - In case, device is charging. There is message "Bioheart is charging, unplug to record"
    ...    - In case, electrical is noised or body contact is bad. There is message "Electrical noise or bad contact" or "Bad contact, wear it properly". Press on Guide button to navigate to How to wear device
    ...    - In case, disconnect to device. There is a popup with message "Your Bioheart was disconnected". Press on Okay button to close popup
    ...    - User can navigate back previous screen by pressing on back button
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-01      BIOC-SRS-03-FRS-02-001          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-02: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-02      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-03: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart hhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Skip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-03      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-04: Create snapshot after 20-seconds timeout
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Wait for 20-seconds
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-04      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-05: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-05      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-06: Create snapshot when another recording is ongoing
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...     - There is an ongoing recoring
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message "Anothet recording is ongoing". Press on Okay button to close popup
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-06      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-07: Create snapshot when bad contact
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message “Could not start recording. Your Bioheart is in bad contact, please wear it properly". Press on Okay button to close popup
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-07      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-08: Create snapshot when charging
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message “Could not start recording. Your Bioheart is charging, please unplug before recording". Press on Okay button to close popup
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-08      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-09: Create snapshot when there shall other error
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message: “Could not start recording. Please try again". Press on Okay button to close popup
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-09      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-11: Create snapshot when battery level is less than 10%
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...     - Device's battery level is less than 10%
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...
    ...     Expected Output:
    ...    - There will be a pop-out modal with the message: “Could not start recording because your Bioheart battery level is less than 10%. Please charge your device.”. Press on Okay button to close popup
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-11      BIOC-SRS-03-FRS-02-002      BIOC-SRS-03-FRS-02-005         manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-12: View snapshot detail after created
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Wait for snapshot complete
    ...    - Press on View or Cancel button
    ...
    ...     Expected Output:
    ...    - Navigate to the snapshot detail screen or close the popup
    ...    - If user selects to View
    ...         + User shall be deleted this snapshot by press on delete button
    ...         + Share it with file pdf by press on share button
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-12      BIOC-SRS-03-FRS-02-002          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-13: View Live Heart Rhythm when device is charging
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...     - The device is charging
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Press on Okay button
    ...
    ...     Expected Output:
    ...    - On Live Heart Rhythm screen, displayed a message Bioheart is charging, unplug to record
    ...    - Can't create snaphot, display popup with message "Could not start recording. Your Bioheart is charging, please unplug before recording" and the popup is closed
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-13      BIOC-SRS-03-FRS-02-003          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-14: View Live Heart Rhythm when Body contact is bad or Electrical is noised
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...     - Body contact is bad or Electrical is noised
    ...
    ...     Test Steps:
    ...    - Press on Start recording button
    ...    - Press on Okay button
    ...
    ...     Expected Output:
    ...    - On Live heart rhythm screen, displayed a message Bad contact, wear it properly or Electrical noise or bad contact
    ...    - Can't create snaphot, display popup with message "Could not start recording. Your Bioheart is in bad contact, please wear it properly" and the popup is closed
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-14      BIOC-SRS-03-FRS-02-003          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-15: View Guide when Body contact is bad or Electrical is noised
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...     - Body contact is bad or Electrical is noised
    ...
    ...     Test Steps:
    ...    - Press on Guide button
    ...    - Press >< button
    ...    - Press on x button
    ...
    ...     Expected Output:
    ...    - Navigate to screen How to wear device
    ...    - Navigate to the next/previous screen
    ...    - Close the bottom sheet
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-15      BIOC-SRS-03-FRS-02-003          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-LIVESTREAMSCREEN-16: View Live Heart Rhythm when the device is disconnected with app
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Live heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Turn off the Bluetooth on the phone or move the device away from the app or turn off the device
    ...    - Press on Okay button
    ...    - Press on Retry button
    ...
    ...     Expected Output:
    ...    - Displayed popup with message "Your Bioheart was disconnected"
    ...    - Loading screen is displayed with message "Something went wrong when getting data from the Bioheart device. Please make sure the device is on and near to you"
    ...    - Loading screen is displayed, if conditions are good, user can view live heart heart rhythm otherwise, continue to display the message "Something went wrong when getting data from the Bioheart device. Please make sure the device is on and near to you"
    [Tags]     BHA-SUMMARY-LIVESTREAMSCREEN-16          manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-01: View Heart rate in Hour tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Heart rate card
    ...
    ...     Expected Output:
    ...    - Navigate to the Heart rate screen
    ...    - The user will be able to view their heart rate data per 5 different timeframes
    ...    - Within the selected timeframe tab, the user shall be able to view different charts by the hour, by day, by weeks, by months, and by year
    ...    - Hour - the heart rate data within an hour
    ...         + The chart will display a dot chart of heart rate values for a specific hour. By default, the tab will display the most recent hour of the current day
    ...             * Each data point in the graph is the average HR value of a minute.
    ...             * When the user navigates to the Day tab and selects another day, when going back to the Hour tab, the Hour tab will automatically switch to the hour from 12:00 to 13:00 of the selected day in the Day tab.
    ...             * The user can zoom out on this chart to navigate to the corresponding day in the Day tab
    ...         + There is a [View heart rhythm] button. By pressing the button, the user shall be navigated to the “Heart Rate Data” screen. The date and hour to be displayed on the screen shall be the date and hour of the HR graph
    ...             * If the user selected a data point on the HR graph, the minute to be displayed on the ECG graph shall be the selected data point.
    ...             * If the user does not select a data point on the HR graph
    ...                  If the HR graph has data points, the minute to be displayed on the ECG graph shall be the first data point of the hour.
    ...                  If there is no data on the HR graph, the [View heart rhythm] button shall be disabled
    ...    - There are High/Low heart rate notification tabs. Press on them to navigate to High/Low heart rate lists
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The min/max/avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]     BHA-SUMMARY-HEARTRATE-01     BIOC-SRS-03-FRS-03-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-02: View Heart rate in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Day tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Day screen
    ...    - Day - the heart rate data within the 24 hours
    ...    - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day. By default, the tab will display the current day
    ...         + Each data point in the graph includes max, min, and average HR values of a 30-minute timeframe.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 2 hours.
    ...         + The user can zoom in on this chart to navigate to a specific hour in the Hour tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...    - There is a [View heart rhythm] button. By pressing the button, the user shall be navigated to the “Heart Rate Data” screen. The date and hour to be displayed on the screen shall be as follows
    ...         + The date shall be the date of the HR graph.
    ...         + If the user selected a data point on the HR graph, the hour shall be the hour containing the selected data point. (Example: If the user selects a data point (9:00 - 9:30), the hour in the “Heart Rate Data” screen is 9:00 - 10:00. If the user selects a data point (9:30 - 10:00), the hour is still 9:00 - 10:00).
    ...         + The minute to be displayed on the ECG graph shall be the first data point since the time of the selected data point
    ...    - If the user does not select a data point on the HR graph
    ...         + If the HR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...              The minute to be displayed on the ECG graph shall be the first data point of the hour
    ...         + If the HR graph has no data, the [View heart rhythm] button be disabled
    ...    - There are High/Low heart rate notification tabs. Press on them to navigate to High/Low heart rate lists
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The min/max/avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There shall be a Sleep schedule button to turn on/off the sleep schedule mode on the chart
    ...    - When turning on the sleep schedule mode, there shall be a highlight. This highlight will represent the user’s sleep duration based on the sleep schedule that has been set before has been detected
    ...         + There shall be a start line and an end line representing the bedtime and the wake-up time.
    ...         + The bedtime and wake-up time shall be displayed below the highlight.
    ...         + When the user edits the sleep duration in the Good morning bottom sheet, the sleep duration of the following day shall be edited
    [Tags]     BHA-SUMMARY-HEARTRATE-02     BIOC-SRS-03-FRS-03-002      BIOC-SRS-11-FRS-02-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-03: View Heart rate in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Week tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Week screen
    ...    - Week - the heart rate data within the week, Mon-Sun
    ...    - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week
    ...         + Each data point in the graph includes max, min, and average HR values of a 6-hour timeframe.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...         + The user can zoom in on this chart to navigate to a specific day in the Day tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    ...    - There is a [View heart rhythm] button. By pressing the button, the user shall be navigated to the “Heart Rate Data” screen. The date and hour to be displayed on the screen shall be as follows
    ...         + If the user selected a data point on the HR graph, the date and the hour to be shown in the [Heart Rate Data] shall be the date and the hour containing the selected data point. (Example: If the user selects a data point (6:00 am - 12:00 pm), the first data is on 9:15 am, the time shall be displayed 9:00 am - 10:00 am).
    ...             * The minute to be displayed on the ECG graph shall be the first data point of the hour
    ...         + If the user does not select a data point on the HR graph
    ...             * If the HR graph has data points, the date and the hour shall be the date and the hour containing the first data point of the graph
    ...                  The minute to be displayed on the ECG graph shall be the first data point of the hour
    ...             * If the HR graph has no data, the [View heart rhythm] button shall be disabled
    ...    - There are High/Low heart rate notification tabs. Press on them to navigate to High/Low heart rate lists
    ...    - A “Week summary” list will be displayed below the minimal content and information on the Heart Rate summary
    ...         + The list will contain all the max and min heart rate values of the days within the specific viewing week on the chart.
    ...         + The user shall be able to scroll up and down to select and view the data point on the chart
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The min/max/avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    [Tags]     BHA-SUMMARY-HEARTRATE-03     BIOC-SRS-03-FRS-03-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-04: View Heart rate in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Month tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Month screen
    ...    - Month - the heart rate data within the month
    ...    - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month
    ...         + Each data point in the graph includes max, min, and average HR values of a day.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...         + The user can zoom in on this chart to navigate to a specific Week in the Week tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Year in Year tab
    ...    - There is a [View heart rhythm] button. By pressing the button, the user shall be navigated to the “Heart Rate Data” screen. The date and hour to be displayed on the screen shall be as follows
    ...         + If the user selected a data point on the HR graph, the date and the hour to be shown in the [Heart Rate Data] shall be the date and the hour containing the selected data point. (Example: If the user selects a data point (29th Nov), the first data is at 9:15 am, the time shall be displayed 9:00 am - 10:00 am
    ...             * The minute to be displayed on the ECG graph shall be the first data point of the hour
    ...         + If the user does not select a data point on the HR graph
    ...             * If the HR graph has data points, the date and the hour shall be the date and the hour containing the first data point of the graph
    ...                  The minute to be displayed on the ECG graph shall be the first data point of the hour
    ...             * If the HR graph has no data, the [View heart rhythm] buttons hall be disabled
    ...    - There are High/Low heart rate notification tabs. Press on them to navigate to High/Low heart rate lists
    ...    - A “Month summary” list will be displayed below the minimal content and information on the Heart Rate summary
    ...         + The list will contain all the max and min heart rate values of the days within the specific viewing month on the chart.
    ...         + The user shall be able to scroll up and down to select and view the data point on the chart
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The min/max/avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    [Tags]     BHA-SUMMARY-HEARTRATE-04     BIOC-SRS-03-FRS-03-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-05: View Heart rate in Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Year tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Year screen
    ...    - Year - the heart rate data within the year
    ...    - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year
    ...         + Each data point in the graph includes max, min, and average HR values of a month.
    ...         + The user can zoom in on this chart to navigate to a specific Month in the Month tab.
    ...    - There is a [View heart rhythm] button. By pressing the button, the user shall be navigated to the “Heart Rate Data” screen. The date and hour to be displayed on the screen shall be as follows
    ...         + If the user selected a data point on the HR graph, the date and the hour to be shown in the [Heart Rate Data] shall be the date and the hour containing the selected data point. (Example: If the user selects a data point (Nov), the first data is on [Nov 29 - 9:15 am], the time shall be displayed [Nov 29, 9:00 am - 10:00 am]).
    ...             * The minute to be displayed on the ECG graph shall be the first data point of the hour
    ...         + If the user does not select a data point on the HR graph
    ...             * If the HR graph has data points, the date and the hour shall be the date and the hour containing the first data point of the graph
    ...                  The minute to be displayed on the ECG graph shall be the first data point of the hour
    ...             * If the HR graph has data points, the date and the hour shall be the date and the hour containing the first data point of the graph
    ...    - There are High/Low heart rate notification tabs. Press on them to navigate to High/Low heart rate lists
    ...    - A “Year summary” list will be displayed below the minimal content and information on the Heart Rate summary
    ...         + The list will contain all the max and min heart rate values of the months within the specific viewing year on the chart.
    ...         + The user shall be able to scroll up and down to select and view the data point on the chart
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The min/max/avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg HR, max HR, and min HR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    [Tags]     BHA-SUMMARY-HEARTRATE-05     BIOC-SRS-03-FRS-03-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-06: View heart rhythm data
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on View heart rhythm button
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
    [Tags]     BHA-SUMMARY-HEARTRATE-06      BIOC-SRS-03-FRS-03-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-07: Zoom in/our heart rhythm chart
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on High Heart rate notification button
    ...
    ...     Expected Output:
    ...    - User zooms in on the ECG viewer by pressing the Zoom icon.
    ...    - There shall be 5 Zoom levels. Each level corresponds to the speed of the ECG recorded value:
    ...         + 1x: 25 mm/s
    ...         + 2x: 50 mm/s
    ...         + 3x: 75 mm/s
    ...         + 4x: 100 mm/s
    ...         + 5x: 200 mm/s
    ...    - The default speed should be 25 mm/s.
    ...    - The chosen speed should be displayed at the top of the Zoom icon
    ...         + If User presses on the Zoom icon again, the current chosen Zoom level should be highlighted in blue
    [Tags]     BHA-SUMMARY-HEARTRATE-07      BIOC-SRS-03-FRS-03-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-08: Change Enhance visual
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Enhance visual button
    ...
    ...     Expected Output:
    ...    - Default enhance visual button OFF. Press on it to change the value and ECG wave
    [Tags]     BHA-SUMMARY-HEARTRATE-08       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-09: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Create snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Add notes for snapshot
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SUMMARY-HEARTRATE-09       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-10: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Create snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Skip the step add notes
    ...
    ...     Expected Output:
    ...    - The snapshot is created without notes and display in All and Recent snapshot lists
    [Tags]     BHA-SUMMARY-HEARTRATE-10       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-11: Cancel to create snapshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Create snapshot button
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SUMMARY-HEARTRATE-11       manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-12: View High Heart rate notification list
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on High Heart rate notification button
    ...
    ...     Expected Output:
    ...    - Navigate to High heart rate list
    ...    - There should be a list of the high heart rate notification sorted from the latest to the oldest.
    ...    - The list should contain the following attributes
    ...         + Date (month, day, & year)
    ...             * Heart rate range (min-max)
    ...             * Starting time of the high heart rate
    ...    - Click on each card shall display the HR chart and the ECG strip
    ...         + HR graph shall include:
    ...             * A red line indicates the set alert in settings.
    ...             * Red dot indicates the avg HR value in 1 minute.
    ...             * The date recorded: [month] [day], [year].
    ...             * Click on 1 dot will show
    ...                  The time of that HR value [hour]:[minute] [AM/PM] on the top of the selected dot and below the GR graph.
    ...                  The HR value at that dot
    ...         + ECG strip will include:
    ...             * Enhance visual button: default OFF
    ...             * The user can scroll on the ECG strip
    ...             * If the user clicks on a red dot on the HR graph, the ECG will scroll to the first second of that dot, for example, 3:00
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]     BHA-SUMMARY-HEARTRATE-12      BIOC-SRS-03-FRS-03-004      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-13: View Low Heart rate notification list
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Low Heart rate notification button
    ...
    ...     Expected Output:
    ...    - Navigate to Low heart rate list
    ...    - There should be a list of the high heart rate notification sorted from the latest to the oldest.
    ...    - The list should contain the following attributes
    ...         + Date (month, day, & year)
    ...             * Heart rate range (min-max)
    ...             * Starting time of the high heart rate
    ...    - Click on each card shall display the HR chart and the ECG strip
    ...         + HR graph shall include:
    ...             * A red line indicates the set alert in settings.
    ...             * Red dot indicates the avg HR value in 1 minute.
    ...             * The date recorded: [month] [day], [year].
    ...             * Click on 1 dot will show
    ...                  The time of that HR value [hour]:[minute] [AM/PM] on the top of the selected dot and below the GR graph.
    ...                  The HR value at that dot
    ...         + ECG strip will include:
    ...             * Enhance visual button: default OFF
    ...             * The user can scroll on the ECG strip
    ...             * If the user clicks on a red dot on the HR graph, the ECG will scroll to the first second of that dot, for example, 3:00
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]     BHA-SUMMARY-HEARTRATE-13      BIOC-SRS-03-FRS-03-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HEARTRATE-14: View Week/ Month/ Year Summary list
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen with Week/ Month/ Year tab
    ...
    ...     Test Steps:
    ...    - Press on Week/ Month/ Year tab
    ...    - Press on Week/ Month/ Year card
    ...
    ...     Expected Output:
    ...    - A list off summary is displayed
    ...         + It is sorted from the latest to the oldest
    ...         + It is displayed min-max heart rate in day
    [Tags]     BHA-SUMMARY-HEARTRATE-14      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-RHR-01: View Resting heart rate in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Resting heart rate button
    ...
    ...     Expected Output:
    ...    - Navigate to the Day screen
    ...    - Day - the heart rate data within the 24 hours
    ...    - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day. By default, the tab will display the current day
    ...         + Each data point in the graph includes max, min, and average RHR values of a 30-minute timeframe.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 2 hours.
    ...         + The user can zoom in on this chart to navigate to a specific hour in the Hour tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]     BHA-SUMMARY-RHR-01     BIOC-SRS-03-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-RHR-02: View Resting heart rate in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Resting heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Week tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Week screen
    ...    - Week - the heart rate data within the week, Mon-Sun
    ...    - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week
    ...         + Each data point in the graph includes max, min, and average RHR values of a 6-hour timeframe.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...         + The user can zoom in on this chart to navigate to a specific day in the Day tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    [Tags]     BHA-SUMMARY-RHR-02     BIOC-SRS-03-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-RHR-03: View Resting heart rate in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Resting heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Month tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Month screen
    ...    - Month - the heart rate data within the month
    ...    - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month
    ...         + Each data point in the graph includes max, min, and average RHR values of a day.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...         + The user can zoom in on this chart to navigate to a specific Week in the Week tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Year in Year tab
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    [Tags]     BHA-SUMMARY-RHR-03     BIOC-SRS-03-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-RHR-04: View Resting heart rate in Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Resting heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Year tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Year screen
    ...    - Year - the heart rate data within the year
    ...    - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year
    ...         + Each data point in the graph includes max, min, and average RHR values of a month.
    ...         + The user can zoom in on this chart to navigate to a specific Month in the Month tab.
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    [Tags]     BHA-SUMMARY-RHR-04     BIOC-SRS-03-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-RHR-05: View Resting heart rate threshold
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Resting heart rate screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - There shall be a card display
    ...
    [Tags]     BHA-SUMMARY-RHR-05     BIOC-SRS-03-FRS-04-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-RHR-06: Follow Learn more link
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Resting heart rate screen
    ...
    ...     Test Steps:
    ...    - Press on Learn more button
    ...
    ...     Expected Output:
    ...    - Navigate to heart.org site with Target Heart Rates Chart section
    [Tags]     BHA-SUMMARY-RHR-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HRV-01: View Heart rate variability in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Heart rate variability button
    ...
    ...     Expected Output:
    ...    - Navigate to the Day screen
    ...    - Day - the heart rate data within the 24 hours
    ...    - When the “Day” tab is selected the chart will display a line chart connecting data points together within a day. By default, the tab will display the current day
    ...         + Each data point in the graph includes max, min, and average HRV values of a 30-minute timeframe.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 2 hours.
    ...         + The user can zoom in on this chart to navigate to a specific hour in the Hour tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding week in the Week tab
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]     BHA-SUMMARY-HRV-01     BIOC-SRS-03-FRS-05-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HRV-02: View heart rate variability in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate variability screen
    ...
    ...     Test Steps:
    ...    - Press on Week tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Week screen
    ...    - Week - the heart rate data within the week, Mon-Sun
    ...    - When the “Week” tab is selected, the chart will display a line chart connecting data points within a week. By default, the tab will display the current week
    ...         + Each data point in the graph includes max, min, and average HRV values of a 6-hour timeframe.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...         + The user can zoom in on this chart to navigate to a specific day in the Day tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Month in Month tab
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    [Tags]     BHA-SUMMARY-HRV-02     BIOC-SRS-03-FRS-05-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HRV-03: View Heart rate variability in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate variability screen
    ...
    ...     Test Steps:
    ...    - Press on Month tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Month screen
    ...    - Month - the heart rate data within the month
    ...    - When the “Month” tab is selected, the chart will display a line chart connecting data points within a month. By default, the tab will display the current month
    ...         + Each data point in the graph includes max, min, and average HRV values of a day.
    ...         + In the case there are some data points that have been lost, the app will connect the two points around the missing segment by a dashed line if the distance between the two points is not more than 1 day.
    ...         + The user can zoom in on this chart to navigate to a specific Week in the Week tab.
    ...         + The user can zoom out on this chart to navigate to the corresponding Year in Year tab
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    [Tags]     BHA-SUMMARY-HRV-03     BIOC-SRS-03-FRS-05-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HRV-04: View Heart rate variability in Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate variability screen
    ...
    ...     Test Steps:
    ...    - Press on Year tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Year screen
    ...    - Year - the heart rate data within the year
    ...    - When the “Year” tab is selected, the chart will display a line chart connecting data points within a year. By default, the tab will display the current year
    ...         + Each data point in the graph includes max, min, and average RHR values of a month.
    ...         + The user can zoom in on this chart to navigate to a specific Month in the Month tab.
    ...    - If the user does not select a data point on the RHR graph
    ...         + If the RHR graph has data points, the hour shall be the hour containing the first data point of the graph
    ...    - There shall be navigational arrows that the user can use to navigate between hours/days/weeks/months/years on the charts.
    ...         + The avg value shall be displayed according to the time frame of the chart
    ...    - The user shall be able to swipe left/right to scroll on the charts
    ...    - When the user taps on a data point in the chart, the chart shall display information about the data point
    ...         + The Hour chart shall display the HR value at the selected time.
    ...         + For Day, Week, Month, and Year, it shall display the avg rHR at the selected timeframe
    ...    - There shall be minimal content and information on the Heart rate below the charts
    ...    - There is threshold, it is displayed base on user's age and heart rate
    [Tags]     BHA-SUMMARY-HRV-04     BIOC-SRS-03-FRS-04-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HRV-05: View Heart rate variability threshold
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate variability screen
    ...
    ...     Test Steps:
    ...
    ...     Expected Output:
    ...    - There shall be a card display
    ...
    ...    - If there is no HRV recorded, the text box shall not be displayed
    [Tags]     BHA-SUMMARY-HRV-05     BIOC-SRS-03-FRS-05-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-HRV-06: Follow Learn more link
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rate variability screen
    ...
    ...     Test Steps:
    ...    - Press on Learn more button
    ...
    ...     Expected Output:
    ...    - Navigate to heart.org site with Gratitude is the Attitude for Good Health section
    [Tags]     BHA-SUMMARY-HRV-06     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-AM-01: View Active minutes in Day tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Active minutes button
    ...
    ...     Expected Output:
    ...    - Navigate to the Day screen
    ...    - The user can select a specific day to view active minutes informatio
    ...    - By default, the most recent day having active minutes information shall be selected
    ...    - There is no day having active minutes information, the current day shall be selected
    ...         + here shall be a graph that plots active minutes of the selected day. Each data point in the graph is the total active minutes of a 30-minute timeframe
    ...             * When the user taps on a data point in the graph, its timeframe and the corresponding total active minutes shall be displayed.
    ...         + The total active minutes of the selected day shall be displayed.
    ...         + There shall be an HR graph that plots HR values of the selected day. Each data point in the graph includes max, min and average HR values of a 30-minute timeframe
    ...             * When the user taps on a data point in the graph, its timeframe and the corresponding max, min, and average HR values shall be displayed
    ...         + The HR range during activity of the selected day shall be displayed
    ...    - The user shall be able to swipe left/right scroll on the charts.
    [Tags]     BHA-SUMMARY-AM-01     BIOC-SRS-03-FRS-06-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-AM-02: View Active minutes in Week tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Active minutes screen
    ...
    ...     Test Steps:
    ...    - Press on Week tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Week screen
    ...    - The user can select a specific week to view active minutes information
    ...    - By default, the most recent week having active minutes information shall be selected
    ...    - There is no week having active minutes information, the current week shall be selected
    ...    - There shall be a graph that plots active minutes of the selected week. Each data point in the graph is the total active minutes of a 6-hour timeframe
    ...         + When the user taps on a data point in the graph, its timeframe and the corresponding total active minutes shall be displayed
    ...    - The total active minutes of the selected week shall be displayed.
    ...    - There shall be an HR graph that plots HR values of the selected week. Each data point in the graph includes max, min and average HR values of a 6-hour timeframe
    ...         + When the user taps on a data point in the graph, its timeframe and the corresponding max, min, and average HR values shall be displayed
    ...    - The HR range during activity of the selected week shall be displayed
    ...    - The user shall be able to swipe left/right scroll on the charts.
    [Tags]     BHA-SUMMARY-AM-02     BIOC-SRS-03-FRS-06-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-AM-03: View Active minutes in Month tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Active minutes screen
    ...
    ...     Test Steps:
    ...    - Press on Month tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Month screen
    ...    - The user can select a specific month to view active minutes information.
    ...    - By default, the most recent month having active minutes information shall be selected
    ...    - There is no month having active minutes information, the current month shall be selected
    ...    - There shall be a graph that plots active minutes of the selected month. Each data point in the graph is the total active minutes of a day
    ...         + When the user taps on a data point in the graph, its timeframe and the corresponding total active minutes shall be displayed
    ...    - The total active minutes of the selected month shall be displayed.
    ...    - There shall be an HR graph that plots HR values of the selected month. Each data point in the graph includes max, min and average HR values of a day.
    ...         + When the user taps on a data point in the graph, its timeframe and the corresponding max, min, and average HR values shall be displayed
    ...    - The HR range during activity of the selected month shall be displayed
    ...    - The user shall be able to swipe left/right scroll on the charts.
    [Tags]     BHA-SUMMARY-AM-03     BIOC-SRS-03-FRS-06-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-AM-04: View Active minutes in Year tab
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Active minutes screen
    ...
    ...     Test Steps:
    ...    - Press on Year tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Year screen
    ...    - The user can select a specific year to view active minutes information.
    ...    - By default, the most recent year having active minutes information shall be selected
    ...    - If there is no year having active minutes information, the current year shall be selected
    ...    - There shall be a graph that plots active minutes of the selected year. Each data point in the graph is the total active minutes of a month
    ...         + When the user taps on a data point in the graph, its timeframe and the corresponding total active minutes shall be displayed
    ...    - The total active minutes of the selected year shall be displayed.
    ...    - There shall be an HR graph that plots HR values of the selected year. Each data point in the graph includes max, min and average HR values of a month
    ...         + When the user taps on a data point in the graph, its timeframe and the corresponding max, min, and average HR values shall be displayed
    ...    - The HR range during activity of the selected year shall be displayed
    ...    - The user shall be able to swipe left/right scroll on the charts.
    [Tags]     BHA-SUMMARY-AM-04     BIOC-SRS-03-FRS-06-002      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-01: View list of health report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Health reports tab
    ...
    ...     Expected Output:
    ...    - Navigate to the Health reports screen
    ...    - There shall be 2 tabs, depending on the tab the user chose, the health report shall be changed
    ...         + Manual report
    ...             * Display a list of health reports created by the user.
    ...             * The user shall be able to delete the generating health report if it is not complete after 30 minutes
    ...         + Auto repport
    ...             * Display list of health reports requested by cardiac.
    ...             * The generating health report shall not be displayed and deleted automatically if it cannot be completed after 30 minute
    ...    - Health report list shall be sorted by created time.
    ...    - There shall be a [Health reports] button for the user to go to the “Health reports” screen.
    ...    - Each item in the list displays the following information
    ...         + Date frame of health report
    ...         + Duration of health report
    ...         + Creation time
    ...         + Status - Generating report (if any)
    ...    - User can navigate back to previous screen by pressing on back button
    [Tags]     BHA-SUMMARY-REPORT-01     BIOC-SRS-03-FRS-07-001      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-02: Create health report with recommended time frame
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Health reports screen
    ...
    ...     Test Steps:
    ...    - Press on Create + button
    ...    - Press on Create button
    ...
    ...     Expected Output:
    ...    - Navigate to the Create a health reports screen
    ...    - The app shall start exporting the summary data to PDF
    ...         + If the app exports a new report, there shall be a “Generating report” message, and the user can leave the process and check back later.
    ...             * Once the report is created, the app shall notify the user. The user shall be navigated to details of the health report by tapping the notification.
    ...         + If the report was created, the app shall display the health report
    ...    - There should be a yellow dot to indicate the new health report has been generated. Follow the design.
    ...    - The yellow dot will disappear once the user clicks on the HEALTH REPORTS card.
    ...    - In case: the user is on the HEALTH REPORTS screen
    ...         + The yellow dot still appears on the HEALTH REPORTS card.
    ...         + The yellow dot only disappears when user clicks on the HEALTH REPORTS card again
    [Tags]     BHA-SUMMARY-REPORT-02     BIOC-SRS-03-FRS-07-002     BIOC-SRS-03-FRS-07-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-03: Create health report with custom date for free account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Health reports screen
    ...
    ...     Test Steps:
    ...    - Press on Create + button
    ...    - Select start date and stop date
    ...    - Press on Create button
    ...
    ...     Expected Output:
    ...    - Navigate to the Create a health reports screen
    ...    - The date which has heart rhythm data shall be displayed differently than the date without heart rhythm data (with a orange dot underneath to mark)
    ...    - The user can only select the start date within the last 30 days. Any dates before that shall be disabled.
    ...    - A small notification at the bottom of the page claims that “You can only create the report with data within the last 30 days”; along with a question mark :question_mark: navigation button that helps clarify more in detail for the user to understand.
    ...    - When the user clicks on the question mark :question_mark: navigation button, a small window shall pop up that claims: “Upgrade to Biosphere+ to create report from any day in your historical data”. From here there are 2 options
    ...         + If the user wants to leave the window, click “Close” to go back to the calendar.
    ...         + If the user wants to learn more about Biosphere+, click “Learn more”. Then the user will be navigated to the Plan Overview page of the Biosphere+ Premium Plan
    ...    - There should be a yellow dot to indicate the new health report has been generated. Follow the design.
    ...    - The yellow dot will disappear once the user clicks on the HEALTH REPORTS card.
    ...    - In case: the user is on the HEALTH REPORTS screen
    ...         + The yellow dot still appears on the HEALTH REPORTS card.
    ...         + The yellow dot only disappears when user clicks on the HEALTH REPORTS card again
    [Tags]     BHA-SUMMARY-REPORT-03     BIOC-SRS-03-FRS-07-002     BIOC-SRS-03-FRS-07-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-04: Create health report with custom date for premium account
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Health reports screen
    ...
    ...     Test Steps:
    ...    - Press on Create + button
    ...    - Select start date and stop date
    ...    - Press on Create button
    ...
    ...     Expected Output:
    ...    - Navigate to the Create a health reports screen
    ...    - The date which has heart rhythm data shall be displayed differently than the date without heart rhythm data (with a orange dot underneath to mark)
    ...    - The user can select any date as start date in the past, as long as after the date the user registered the account. Any dates before that shall be disabled
    ...         + The user cannot select a date that is either before the date the user registers for an account or is in the future.
    ...         + On the calendar of the stop date, the user cannot select a date that is more than 7 days from the start date.
    ...         + The stop date shall be disabled until the user selected the start date
    ...    - There should be a yellow dot to indicate the new health report has been generated. Follow the design.
    ...    - The yellow dot will disappear once the user clicks on the HEALTH REPORTS card.
    ...    - In case: the user is on the HEALTH REPORTS screen
    ...         + The yellow dot still appears on the HEALTH REPORTS card.
    ...         + The yellow dot only disappears when user clicks on the HEALTH REPORTS card again
    [Tags]     BHA-SUMMARY-REPORT-04     BIOC-SRS-03-FRS-07-002     BIOC-SRS-03-FRS-07-006      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-05: Share health report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Health reports screen
    ...
    ...     Test Steps:
    ...    - Select any report
    ...    - Press on ... button
    ...    - Press on Share report button
    ...
    ...     Expected Output:
    ...    - The app shall display sharing options (depending on the OS of the phone). The user can select a sharing option to share the PDF file.
    [Tags]     BHA-SUMMARY-REPORT-05     BIOC-SRS-03-FRS-07-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-06: Re-generate health report
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Health reports screen
    ...
    ...     Test Steps:
    ...    - Select any report
    ...    - Press on ... button
    ...    - Press on Re-generate report button
    ...
    ...     Expected Output:
    ...    - The report shall be regenerated if
    ...         + The user’s information is updated.
    ...         + The end date of the report is the current date.
    ...         + There are additional snapshots generated during the period of the report
    ...    - By clicking the button
    ...         + The app shall regenerate the report and navigate the user to the “Generating report…” screen.
    ...         + If the report is not regenerated, the app shall display the current report
    [Tags]     BHA-SUMMARY-REPORT-06     BIOC-SRS-03-FRS-07-003      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-07: Details of a Bioheart health report (manual report)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Health reports screen
    ...
    ...     Test Steps:
    ...    - Select any report
    ...
    ...     Expected Output:
    ...    - The Bioheart health report shall include the following sections
    ...         + Patient information
    ...             * Full name
    ...             * Age
    ...             * Gender
    ...         + Heart rate information
    ...             * A graph displays a line chart with average HR values of the time frame. Each data point in the graph displays the average value
    ...                  If the duration of the report is 1 day, the time frame shall be 4 hours.
    ...                  If the duration of the report is 2 days, the time frame shall be 8 hours.
    ...                  If the duration of the report is 3 days, the time frame shall be 12 hours.
    ...                  If the duration of the report is 4,5,6, or 7 days, the graph shall display the data on each day
    ...             * The summary section displays a list of average values of HR that depend on the duration of the report.
    ...         + Resting Heart rate information
    ...             * A graph displays a line chart with Resting HR values of the time frame. Two successive data points in a chart shall be connected, regardless of the distance between them
    ...                  If the duration of the report is 1 day, the time frame shall be 4 hours. Each data point in the graph shall display 30 minutes of the average value.
    ...                  If the duration of the report is 2 days, the graph shall display the data in 2 days with a time frame is 8 hours. Each data point in the graph shall display 1 hour of the average value.
    ...                  If the duration of the report is 3 days, the graph shall display the data in 3 days with a time frame is 12 hours. Each data point in the graph shall display 2 hours of the average value.
    ...                  If the duration of the report is 4,5,6, or 7 days, the graph shall display the data on each day. Each data point in the graph shall display 4 hours of the average value.
    ...             * The summary section displays a list of resting HR that depend on the duration of the report.
    ...             * The number points of Resting HR in a graph
    ...         + Heart rate variability information
    ...             * A graph displays a line chart with average HRV values of the time frame. Two successive data points in a chart shall be connected, regardless of the distance between them.
    ...                  If the duration of the report is 1 day, the time frame shall be 4 hours. Each data point in the graph shall display 30 minutes of the average value.
    ...                  If the duration of the report is 2 days, the graph shall display the data in 2 days with a time frame is 8 hours. Each data point in the graph shall display 1 hour of the average value.
    ...                  If the duration of the report is 3 days, the graph shall display the data in 3 days with a time frame is 12 hours. Each data point in the graph shall display 2 hours of the average value.
    ...                  If the duration of the report is 4,5,6, or 7 days, the graph shall display the data on each day. Each data point in the graph shall display 4 hours of the average value.
    ...             * The summary section displays a list of average HRV values that depend on the duration of the report
    ...         + Heart rate during activity
    ...             * A graph displays a line chart with average HR during activity values of the time frame. Two successive data points in a chart shall be connected, regardless of the distance between them.
    ...                  If the duration of the report is 1 day, the time frame shall be 4 hours. Each data point in the graph shall display 30 minutes of the average value.
    ...                  If the duration of the report is 2 days, the graph shall display the data in 2 days with a time frame is 8 hours. Each data point in the graph shall display 1 hour of the average value.
    ...                  If the duration of the report is 3 days, the graph shall display the data in 3 days with a time frame is 12 hours. Each data point in the graph shall display 2 hours of the average value.
    ...                  If the duration of the report is 4,5,6, or 7 days, the graph shall display the data on each day. Each data point in the graph shall display 4 hours of the average value.
    ...             * The summary section displays a list of average HR during activity values that depend on the duration of the report.
    ...             * The number points of HRV in a graph
    ...         + Active minutes
    ...             * A graph displays a column chart with activity values of the time frame. Each column in the graph displays a 1-hour value.
    ...                  If the duration of the report is 1 day, the time frame shall be 4 hours.
    ...                  If the duration of the report is 2 days, the time frame shall be 8 hours.
    ...                  If the duration of the report is 3 days, the time frame shall be 12 hours.
    ...                  If the duration of the report is 4,5,6, or 7 days, the graph shall display the data on each day.
    ...             * The summary section displays a list of activity minutes that depend on the duration of the report.
    ...             * The number of points of Activity HR in a graph
    ...             * The number of columns in a graph
    ...         + Rhythm Diary - the list of Snapshots was generated in the time frame
    ...             * Snapshot time (Date - Start time)
    ...             * Duration
    ...             * Heart rate range
    ...             * Notes
    ...                  Tags of a snapshot
    ...             * The number of rhythms in a report
    ...         + Noteworthy Snapshots
    ...             * The ECG strips of the Snapshots in the list are picked by the Bioheart system, following the rules defined in the attachment of this user story
    ...         + Disclaimer
    ...             * A disclaimer section for the Bioheart device
    ...    - The displayed timezone is set based on the user’s phone timezone
    ...    - There are two timezone types shown:
    ...         + The zone has the abbreviation for a given timestamp: EST, CST, MST, PST, AKST, etc…
    ...         + Others: GMT (+x), GMT (-x)
    [Tags]     BHA-SUMMARY-REPORT-07     BIOC-SRS-03-FRS-07-004      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-REPORT-08: Details of a Bioheart - Cardiac healt report (auto report)
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Health reports screen
    ...
    ...     Test Steps:
    ...    - Press on Auto report tab
    ...    - Select any report
    ...
    ...     Expected Output:
    ...    - The Rhythm Diary section of the Bioheart - Cardiac health report shall always include the 2 snapshots of the day, Max HR and Min HR, alongside the snapshots of the user.
    ...         + The Note of the Max and Min HR should include 2 snapshot tags, Max HR and Min HR, respectively
    ...    - The Noteworthy Snapshots section of the Bioheart - Cardiac health report shall always include 2 ECG strips of the Max HR and Min HR Snapshots in the list are picked by the Bioheart system following the similar rules defined in the attachment of the referred user story
    [Tags]     BHA-SUMMARY-REPORT-08     BIOC-SRS-03-FRS-07-005      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-SYNCDATA-01: Sync Bioheart data
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Sync your heart data tab
    ...
    ...     Expected Output:
    ...    - The app shall display the progress bar percentage while looking for recordings to back up…
    ...    - When the user opens the app and the device is connected, the ECG recordings shall be automatically backed up to the cloud.
    ...    - If there are recordings that will be deleted in the next 2 days, there shall be a message: “Please prioritize backing up your heart data now.”
    ...         + On the “Backup” screen,
    ...             * If there are snapshots on 30 days ago, there shall be a message: “Please stay on the process until [30 days ago] has been backed up.”
    ...             * If there are snapshots on 29 days ago, there shall be a message: “Please stay on the process until [29 days ago] has been backed up.”
    ...             * If there are snapshots on 29 and 30 days ago, there shall be a message: “Please stay on the process until [29 days ago] has been backed up.”
    ...    - There shall be a message: "Recordings stored on Bioheart’s storage will be deleted automatically after 30 days.".
    ...    - The user shall be able to a list of pending ECG recordings (grouped by day) stored on their Bioheart device that has not yet been backed up to the cloud.
    ...    - The user shall be able to view the backup progress of each recording.
    ...    - During the backup process, the app shall keep the phone awake until the backup is completed.
    ...    - During the backup process, the user still can trigger recordings by pressing the Event button on the device.
    ...    - During the backup process, when either Bluetooth or Internet connection is disconnected, the backup process shall be paused and the app shall display messages to tell the user to reconnect Bluetooth/Internet. After Bluetooth/Internet is reconnected, the backup process shall be resumed from the point it was stopped
    [Tags]     BHA-SUMMARY-SYNCDATA-01     BIOC-SRS-03-FRS-08      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-SNAPSHOT-01: View Heart rhythm screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Summary screen
    ...
    ...     Test Steps:
    ...    - Press on Create button
    ...
    ...     Expected Output:
    ...    - Navigate to Heart rhythm screen
    ...    - The timeframe shall display the first hour in the latest date which has Heart Rate data
    ...    - There is an hour selection for the user to select the hour from which HR values are displayed on the HR chart. The user can change the hour by clicking on the [Next] or [Previous] button
    ...         + [Next] button: the time shall be changed to the next hour. (the time cannot be in the future)
    ...         + [Previous] button: the time shall be changed to the previous hour
    ...    - There is an HR chart that will display a dot chart of heart rate values of the selected hour
    ...         + If there are no HR values displayed on the HR chart. There shall be a message: “No heart rhythm is recorded”.
    ...    - When the user selects a data point on the HR chart
    ...         + The Heart rate value and the time shall be displayed.
    ...         + If the ECG data of the selected data point were already backed up on the cloud, ECG data should be displayed on the ECG chart.
    ...         + If the ECG data of the selected data point is not backed up on the cloud, there shall be a message: “The heart rhythm of this time period is not available for viewing. Please go to the Backup screen to check and back up the data” with the [Go to Data sync] hyperlink. The user shall be navigated to the “Bioheart data sync” screen when pressing the hyperlink.
    ...         + If the user is on a Free plan, they can only view heart rhythm within the last 30 days. If the time of the selected data point is older than 30 days, there shall be a message “You can only view heart rhythm of the last 30 days” displayed instead of the heart rhythm data. There shall be a link for the user to navigate to the [Plan Overview] screen where they can find information on the Biosphere+ plan
    ...    - The user is able to create a snapshot by pressing on Create Snapshot button
    ...    - User can navigate back to previous screen
    [Tags]     BHA-SUMMARY-SNAPSHOT-01     BIOC-SRS-03-FRS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-SNAPSHOT-02: Create snapshot with notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Create Snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Add notes button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SUMMARY-SNAPSHOT-02     BIOC-SRS-03-FRS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-SNAPSHOT-03: Create snapshot without notes
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Create Snapshot button
    ...    - Select duration
    ...    - Press on Create button
    ...    - Press on Skip button
    ...    - Wait for snapshot complete
    ...
    ...     Expected Output:
    ...    - The snapshot is created with notes and display in All and Recent snapshot lists
    [Tags]     BHA-SUMMARY-SNAPSHOT-03     BIOC-SRS-03-FRS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-SNAPSHOT-04: Cancel to create snaphshot
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is on Heart rhythm screen
    ...
    ...     Test Steps:
    ...    - Press on Create Snapshot button
    ...    - Press on Cancel button
    ...
    ...     Expected Output:
    ...    - The snapshot is canceled
    [Tags]     BHA-SUMMARY-SNAPSHOT-04     BIOC-SRS-03-FRS-09      manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

BHA-SUMMARY-FWUPDATE-01: Update Bioheart firmware in the Summary screen
    [Documentation]     Author: Linh Tran
    ...
    ...     Pre-condition:
    ...     - The user is in Summary screen
    ...     - There is a new firmware version available
    ...
    ...     Test Steps:
    ...    - Press on Update now button
    ...
    ...     Expected Output:
    ...    - Navigate to New update available screen
    ...         + Press on Update now button to update firmware, after update firmware successfully, the Bioheart firmware update is disappeared
    ...         + Press on Later button to close screen
    [Tags]     BHA-SUMMARY-FWUPDATE-01     manual
    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}

#BHA-SUMMARY-TRANSITIONAPP-01: Banner in summary screen
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is installed app version 1.13.0
#    ...     - The user is in Summary screen
#    ...
#    ...     Test Steps:
#    ...
#    ...     Expected Output:
#    ...    - There shall be a banner on the top of the summary screen.
#    ...    - There shall be a button on the banner, when user tap on this buton it shall navigate user to the Remove device for transition.
#    [Tags]      BHA-SUMMARY-TRANSITIONAPP-01     BIOH-SRS-03-FRS-11-001      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BHA-SUMMARY-TRANSITIONAPP-02: Banner in summary screen
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is installed app version 1.13.0
#    ...     - The user is in Summary screen
#    ...
#    ...     Test Steps:
#    ...    - Press on Switch to the Biocare Health button
#    ...
#    ...     Expected Output:
#    ...    - Navigate from the Biocare Health app to remove the device, the Bioheart app shall display a button to disconnect the current device. This action shall not factory reset the device
#    ...    - After disconnecting the device, the app shall display the pop-up to move to the Biocare Health app.
#    ...         + If the Biocare Health app is installed the, it shall be opened.
#    ...         + If not, it shall take the user to the Biocare Health app on store.
#    [Tags]      BHA-SUMMARY-TRANSITIONAPP-02     BIOH-SRS-03-FRS-11-002      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BHA-SUMMARY-TRANSITIONAPP-03: Go to Biocare screen
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is installed app version 1.13.0
#    ...     - The user is signed in Biocare health app before
#    ...
#    ...     Test Steps:
#    ...
#    ...     Expected Output:
#    ...    - When the user opens the app there shall be only 1 screen with the button to navigate to the biocare health app
#    [Tags]      BHA-SUMMARY-TRANSITIONAPP-03     BIOH-SRS-03-FRS-11-003      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
#
#BHA-SUMMARY-TRANSITIONAPP-04: Service terminatopn
#    [Documentation]     Author: Linh Tran
#    ...
#    ...     Pre-condition:
#    ...     - The user is installed app version 1.13.0
#    ...     - The user is signed in Biocare health app before
#    ...
#    ...     Test Steps:
#    ...
#    ...     Expected Output:
#    ...    - Once the user has installed and logged in successfully to the Biocare Health app with the account that he uses in the Bioheart app, he will no longer have the access to the Bioheart app.
#    ...    - When open the Bioheart app, there always a pop up with the message: Bioheart app is no longer supported!. We have moved your information to Biocare Health app, please download it to continue using
#    [Tags]      BHA-SUMMARY-TRANSITIONAPP-04     BIOH-SRS-03-FRS-11-004      manual
#    Manual Should Be Passed     ${TEST_NAME}    ${TEST_DOCUMENTATION}
